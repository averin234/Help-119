import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/utils/widget_extension_util.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/custom_text_field.dart';
import '../../../core/widget/icon_text_widgets.dart';
import '../controllers/emergency_create_controller.dart';

class EmergencyCreateView extends BaseView<EmergencyCreateController> {
  final EmergencyCreateController controller = Get.put(EmergencyCreateController());
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(title: const Text('Permintaan Darurat'),
      actions: [
        TextButton(
            onPressed: ()async{
              if(controller.isSubmit){
                return;
              }
              controller.submitData();
            },
            child: const IconTextWidget(value: 'Kirim', icon: FontAwesome.send, size: 14,)
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child : Row(children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.warning_rounded, color: Colors.redAccent),
          SizedBox(
            width: 10,
          ),
          Text('Lakukan pengisian data korban beserta \nfoto/tempat kejadian',
            style: TextStyle(fontSize: 15,),),
        ],),),
        Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(hintText: 'Nama Korban', keyboardType: TextFieldType.NAME,
                controller: controller.nameController, isValidationRequired: true,
              ).marginOnly(top: AppValues.margin),
              CustomTextField(hintText: 'Deskripsi', keyboardType: TextFieldType.MULTILINE,
                controller: controller.descriptionController, isValidationRequired: true,
              ).marginOnly(top: AppValues.margin),
            ],
          ),
        ),

        //TODO
        //make type emergency when ready

        AppValues.padding.toInt().height,

        Obx(()=>addImageData(title: 'Foto (untuk memudahkan petugas/relawan deteksi dini)',
            path: controller.emergencyImage,
            onAddImage: (){
              controller.addPhoto();
            }),),

      ],
    ).paddingSymmetric(horizontal: AppValues.padding);
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


  // Widget photosWidget(){
  //   return
  //     Stack(
  //       children: [
  //         Obx((){
  //           var dataList = controller.photosFile.reversed.toList();
  //
  //           return GridView.builder(
  //             shrinkWrap: true,
  //             primary: false,
  //             itemCount: controller.photosFile.length,
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 3,
  //                 crossAxisSpacing: AppValues.smallPadding,
  //                 mainAxisSpacing: AppValues.smallPadding
  //               // childAspectRatio: 1/2
  //             ),
  //             itemBuilder: (BuildContext context, int index) {
  //               var item = dataList[index];
  //               logger.d("aap, photo: $item");
  //
  //               return itemPhotosWidget(item);
  //             },
  //           );
  //         }),
  //
  //         Obx((){
  //           var dataList = controller.uploadedPhotosFile.reversed.toList();
  //
  //           return GridView.builder(
  //             shrinkWrap: true,
  //             primary: false,
  //             itemCount: controller.uploadedPhotosFile.length,
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 3,
  //                 crossAxisSpacing: AppValues.smallPadding,
  //                 mainAxisSpacing: AppValues.smallPadding
  //             ),
  //             itemBuilder: (BuildContext context, int index) {
  //               var item = dataList[index];
  //               logger.d("aap, upload: $item");
  //
  //               return uploadItemPhotosWidget(item, index == dataList.length-1);
  //             },
  //           );
  //         }),
  //       ],
  //     );
  // }

  Widget itemPhotosWidget(String photo){
    return Container(
        padding: photo.isEmpty ? const EdgeInsets
            .all(AppValues.smallPadding) : EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.circular(AppValues.radius_12),
            image: photo.isEmpty ? null :
            DecorationImage(
                image: FileImage(File(photo)),
                fit: BoxFit.cover
            )
        ),
        child: photo.isEmpty
            ?
        const Icon(
          Icons.add_a_photo, color: AppColors.neutral100,size: AppValues.iconLargeSize,) :
        Container()
    ).onTap((){
      if(photo.isEmpty){
        controller.addPhoto();
      }
    });
  }

  Widget uploadItemPhotosWidget(String photo, bool canTap){
    return Container(
        padding: photo.isEmpty ? const EdgeInsets
            .all(AppValues.smallPadding) : EdgeInsets.zero,
        decoration: BoxDecoration(
            color: photo.isNotEmpty ? Colors.white10 : Colors.transparent,
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.circular(AppValues.radius_12),
        ),
        child: photo.isNotEmpty
            ?
        const Icon(
          Icons.check_circle_rounded, color: AppColors.success600, size: AppValues.iconLargeSize,) :
        Container()
    ).onTap((){
      if(canTap){
        controller.addPhoto();
      }
    });
  }


}
