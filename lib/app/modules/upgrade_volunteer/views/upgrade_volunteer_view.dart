import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/model/type_image.dart';
import 'package:kreki119/app/core/model/type_job.dart';
import 'package:kreki119/app/core/utils/widget_extension_util.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/utils/date_util.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/custom_text_field.dart';
import '../../../data/model/response/location_entity.dart';
import '../controllers/upgrade_volunteer_controller.dart';

class UpgradeVolunteerView extends BaseView<UpgradeVolunteerController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(backgroundColor: AppColors.textColorWhite,
      title: const Text('Menjadi Relawan', style: titleStyle,),
      titleSpacing: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        AppValues.padding.toInt().height,
        Text('Dengan menjadi relawan anda turut serta membantu orang disekitar, silahkan lengkapi data berikut untuk melanjutkan'),
        AppValues.padding.toInt().height,

        formData(),

        uploadFormWidget(),

        AppButton(
          onTap: (){
            controller.onPrepareSubmitData();
          },
          color: AppColors.primary400,
          child: Text('Kirim', style: secondaryTextStyle(color: AppColors.textColorWhite),),
        ).marginSymmetric(vertical: AppValues.margin)

      ],
    ).paddingSymmetric(horizontal: AppValues.padding);
  }

  Widget formData(){
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          AppValues.smallPadding.toInt().height,

          CustomTextField(hintText: 'Tanggal Lahir', keyboardType: TextFieldType.NAME,
            controller: controller.dateOfBirthController, readOnly: true, isValidationRequired: true,
            onTap: (){
              onChooseBirthDate();
            },
          ),


          AppValues.smallPadding.toInt().height,
          CustomTextField(hintText: 'Alamat Domisili', keyboardType: TextFieldType.MULTILINE,
            controller: controller.addressDomicileController, isValidationRequired: true,
          ),

          AppValues.smallPadding.toInt().height,
          CustomTextField(hintText: 'Alamat Kantor', keyboardType: TextFieldType.MULTILINE,
            controller: controller.addressOfficeController, isValidationRequired: true,
          ),

          AppValues.smallPadding.toInt().height,
          CustomTextField(hintText: 'No Ktp', keyboardType: TextFieldType.NUMBER,
            controller: controller.citizenController, readOnly: true, isValidationRequired: true,
          ),

          AppValues.margin.toInt().height,

        ],
      ),
    );
  }

  Widget uploadFormWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(()=>addImageData(title: 'Foto Ktp',
            path: controller.citizenImage,
            onAddImage: (){
              openBottomSheetChoice(
                  choices: ['Buka Kamera', 'Pilih dari galeri'],
                  onSelectedChoice: (selected){
                    switch(selected){
                      case 0:
                        controller.addImage(TypeImage.CITIZEN, takeBy: ImageSource.camera);
                        break;
                      case 1:
                        controller.addImage(TypeImage.CITIZEN, takeBy: ImageSource.gallery);
                        break;
                      default:
                        controller.showErrorMessage('tidak ada pilihan');
                    }
                  });
            }),),
        AppValues.padding.toInt().height,
        Obx(()=>addImageData(title: 'Foto Sertifikasi',
            path: controller.certificateImage,
            onAddImage: (){
              openBottomSheetChoice(
                choices: ['Buka Kamera', 'Pilih dari galeri'],
                onSelectedChoice: (selected){
                  switch(selected){
                    case 0:
                      controller.addImage(TypeImage.CERTIFICATE, takeBy: ImageSource.camera);
                      break;
                    case 1:
                      controller.addImage(TypeImage.CERTIFICATE, takeBy: ImageSource.gallery);
                      break;
                    default:
                      controller.showErrorMessage('tidak ada pilihan');
                  }
                });
            }),),
        AppValues.padding.toInt().height,
      ],
    );
  }

  Widget addImageData({required String title, required Function() onAddImage, required String path}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title),
        AppValues.smallPadding.toInt().height,
        Container(
          // height: AppValues.heightContainerImage,
            padding: path.isEmpty ? const EdgeInsets
                .all(AppValues.smallPadding) : EdgeInsets.zero,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: defaultBoxShadow(),
                borderRadius: BorderRadius.circular(AppValues.radius_12),
                image: path.isEmpty ? null :
                DecorationImage(
                    image: FileImage(File(path)),
                    fit: BoxFit.cover
                )
            ),
            child: path.isEmpty
                ?
            const Icon(
              Icons.camera_alt_rounded, size: AppValues.iconLargeSize,) :
                Container()
        ).onTap(onAddImage).aspectRatio(ratio: AppValues.ratioCertificate),

      ],
    );
  }

  onChooseBirthDate()async {
    var currentDate = DateTime.now();
    ///making 17years+ is required
    var lastDate = currentDate.subtractYear(17);

    var selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: lastDate,
      firstDate: DateTime.parse("1900-01-01"),
      lastDate: lastDate,
      initialDatePickerMode: DatePickerMode.year,
    );

    if(selectedDate!=null){

      var formattedDate = DateFormat("dd MMMM yyyy").format(selectedDate);

      controller.dateOfBirthController.text = formattedDate;
      controller.setDateOfBirth(selectedDate);
    }
  }

  onClickWork(){
    var jobType = TypeJob.values.toList();
    jobType.removeWhere((element) => element.value.isEmpty);

    openBottomSheet(
        Container(
            decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
            child: ListView.builder(
                itemCount: jobType.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var item = jobType[index];

                  return ListTile(
                    onTap: (){
                      finish(Get.context!);
                      controller.setJob(item);
                      controller.jobController.text = item.name;
                    },
                    title: Text(item.name),
                  );}
            )
                .paddingAll(AppValues.padding)
        )
    );
  }

  onClickProvince()async{
    if(controller.provinces.isEmpty){
      await controller.loadProvinceData();
    }

    openBottomSheet(
        Container(
            decoration: boxDecorationRoundedWithShadow(AppValues.radius_12.toInt()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [

                const Text('Pilih Provinsi', style: titleStyle,)
                    .paddingTop(AppValues.largePadding).paddingBottom(AppValues.padding)
                    .paddingSymmetric(horizontal: AppValues.padding),

                Flexible(
                    child: Obx(()=>ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: controller.provinces.length,
                      itemBuilder: (context, index) {
                        var item = controller.provinces[index];

                        return Obx(()=>ListTile(
                          title: Text(item.name ?? 'province'),
                          selected: item.nid == controller.selectedProvince.nid,
                          selectedColor: AppColors.primary500,
                          textColor: item.nid == controller.selectedProvince.nid ?
                          AppColors.textColorWhite : null,
                          onTap: (){
                            finish(Get.context!);
                            controller.setSelectedProvince(item);
                            //refresh-city
                            controller.setSelectedCity(LocationEntity());
                            controller.cityController.text = '';

                            controller.loadCity(item.nid.toString());
                            controller.provinceController.text = item.name.toString();
                          },
                        ));
                      },
                    ))
                )
              ],
            )
        ).paddingTop(AppValues.padding)
    );
  }

  onClickCity(){
    if(controller.selectedProvince.parentNid == null){
      controller.showErrorMessage("pilih provinsi terlebih dahulu");

      return;
    }

    openBottomSheet(
        Container(
            decoration: boxDecorationRoundedWithShadow(AppValues.largeRadius.toInt()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Pilih Kota/Kabupaten', style: titleStyle,)
                    .paddingTop(AppValues.largePadding).paddingBottom(AppValues.padding)
                    .paddingSymmetric(horizontal: AppValues.padding),

                Flexible(
                  child: Obx(()=>ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: controller.cities.length,
                    itemBuilder: (context, index) {
                      var item = controller.cities[index];

                      return Obx(()=>ListTile(
                        title: Text(item.name ?? 'city'),
                        selected: item.nid == controller.selectedCity.nid,
                        selectedColor: AppColors.primary500,
                        textColor: item.nid == controller.selectedCity.nid ? AppColors.textColorWhite : null,
                        onTap: (){
                          finish(Get.context!);
                          controller.setSelectedCity(item);
                          controller.cityController.text = item.name.toString();
                        },
                      ));
                    },
                  )),
                )
              ],
            )
        ).paddingTop(AppValues.padding)
    );
  }

  onChooseCertificateExpired()async {
    var currentDate = DateTime.now();

    var selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: currentDate.addYear(10),
      initialDatePickerMode: DatePickerMode.year,
    );

    if(selectedDate!=null){

      var formattedDate = DateFormat("dd MMMM yyyy").format(selectedDate);

      controller.certificateExpired.text = formattedDate;
      controller.setCertificateExp(selectedDate);
    }

  }

}
