import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/model/page_state.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';
import '../../data/model/response/base_response.dart';
import '../../data/model/response/firebase_user_entity.dart';
import '../../routes/app_pages.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.errorMessage.isNotEmpty
              ? showErrorSnackBar(controller.errorMessage)
              : Container()),
          Obx(() => controller.message.isNotEmpty
              ? showSnackBar(controller.message)
              : Container()),
          Obx(() => controller.successMessage.isNotEmpty
              ? showSnackBar(controller.successMessage)
              : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: fabLocation(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      resizeToAvoidBottomInset: avoidToBottomInset(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message,
      style: const TextStyle(color: Colors.white),),
      backgroundColor: AppColors.primary400,);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar,);
    });

    return Container();
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: AppColors.error300,);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar,);
    });

    return Container();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1
    );
  }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? fabLocation(){
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }

  bool? avoidToBottomInset(){
    return null;
  }

  Widget showErrorSheet(String message, {BuildContext? context}){

    globalKey.currentState?.showBottomSheet((context) => Container(
      decoration: boxDecorationWithRoundedCorners(),
      child: Text(message, textAlign: TextAlign.center, style: descriptionTextStyle,),
    ));

    return Container();
  }

  openBottomSheet(Widget contentWidget, {BuildContext? context}){
    showModalBottomSheet(
        context: context ?? Get.context!,
        isDismissible: true,
        isScrollControlled: true,
        shape: dialogShape(),
        builder: (context)=>Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: contentWidget,
        )
    );
  }

  openBottomSheetConfirmation({String title = 'Confirmation', String description = 'Are you sure',
    required Function() onAccept, BuildContext? context, bool hasTextField = true}){
    openBottomSheet(
        Padding(
          padding: hasTextField ? MediaQuery.of(context ?? Get.context!).viewInsets : EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: descriptionTextStyle,),
              Text(description, style: cardSmallTagStyle,),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                    text: 'Tidak',
                    textColor: AppColors.neutral300,
                    onTap: (){
                      finish(context ?? Get.context!, false);
                    },
                  ).expand(),
                  AppValues.padding.toInt().width,
                  AppButton(
                    text: 'Ya',
                    color: AppColors.primary400,
                    textColor: AppColors.textColorWhite,
                    onTap: (){
                      finish(context?? Get.context!, false);

                      onAccept.call();
                    },
                  ).expand(),
                ],
              )
            ],
          ).paddingAll(AppValues.padding),
        )
    );
  }

  openBottomSheetChoice({required List<String> choices, required Function(int) onSelectedChoice}){
    openBottomSheet(
        Container(
            decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
            child: ListView.builder(
                itemCount: choices.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var item = choices[index];

                  return ListTile(
                    onTap: (){
                      onSelectedChoice(index);
                      Get.back();
                    },
                    title: Text(item),
                  );}
            )
                .paddingAll(AppValues.padding)
        )
    );
  }

  openUrl(String url)async{
    if(!await launchUrl(Uri.parse(url))){
      throw 'could not launch $url';
    }
  }

  openCall(String phone)async{
    Uri callUri = Uri(
      scheme: 'tel',
      path: phone
    );

    launchUrl(callUri);
  }

  CameraPosition get initialPosition => const CameraPosition(
    target: LatLng(-6.17546, 106.82719),
    zoom: 10,
  );


  choiceUserVerified(bool isVerified, {String? routeWhenAccept, BuildContext? context,
    dynamic data}){
    if(!isVerified){
      showBottomSheetOrDialog(context: context ?? Get.context!,
          child: openBottomSheetConfirmation(
              title: 'User belum terverifikasi',
              description: 'Lengkapi data untuk melanjutkan...',
              context: context,
              onAccept: (){
                Get.toNamed(Routes.SIGN_UP_VERIFICATION);
              })
      );
    } else{

      routeWhenAccept != null ?
          Get.toNamed(routeWhenAccept, arguments: data) :

      showBottomSheetOrDialog(context: context ?? Get.context!,
          child: openBottomSheetConfirmation(
              title: 'Anda akan meminta bantuan darurat',
              description: 'Dengan ini anda akan melanjutkan meminta pertolongan darurat',
              context: context,
              onAccept: (){
                Get.toNamed(Routes.EMERGENCY_CREATE);
              })
      );
    }
  }

  handleCheckTokenForVerifyUser(BaseResponse<FirebaseUserEntity> val) async{

    if(val.data==null){
      return;
    }
    var value = val.data!;
    choiceUserVerified(value.isVerified==true);
  }

  showBottomSheetInfo({required String title, String? textButton = 'Ok', required Function() onTapButton}){
    showBottomSheetOrDialog(context: Get.context!,
        bottomSheetDialog: BottomSheetDialog.BottomSheet,
        child: Container(
          padding: const EdgeInsets.all(AppValues.padding),
          decoration: boxDecorationWithRoundedCorners(borderRadius: const BorderRadius.vertical(top: Radius.circular(AppValues.radius_6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title),
              AppValues.smallPadding.toInt().height,
              AppButton(
                text: textButton ?? 'Ok',
                onTap: onTapButton,
              )

            ],
          ),
        )
    );
  }


}
