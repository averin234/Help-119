import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/widget/elevated_container.dart';
import 'package:kreki119/flavors/build_config.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/app_colors.dart';
import '../values/app_values.dart';
import '../widget/custom_text_field.dart';

class ViewAddContact extends StatelessWidget {
  ViewAddContact({Key? key, required this.onClickSubmit}) : super(key: key);

  final Function(String name, String email, String phone) onClickSubmit;


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(text: "62");
  final formKey = GlobalKey<FormState>();

  final logger = BuildConfig.instance.config.logger;

  @override
  Widget build(BuildContext context) {

    return ElevatedContainer(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              AppValues.padding.toInt().height,
              Text("Kontak Darurat", style: primaryTextStyle(weight: FontWeight.bold),),
              AppValues.padding.toInt().height,
              CustomTextField(hintText: 'Nama Lengkap', keyboardType: TextFieldType.NAME,
                controller: nameController, isValidationRequired: true,
              ).marginOnly(top: AppValues.margin),
              CustomTextField(hintText: 'Email', keyboardType: TextFieldType.EMAIL,
                controller: emailController, isValidationRequired: true,
              ).marginOnly(top: AppValues.margin),
              CustomTextField(hintText: 'No. Ponsel', keyboardType: TextFieldType.PHONE,
                controller: phoneController, isValidationRequired: true,
              ).marginOnly(top: AppValues.margin),

              AppButton(
                onTap: (){
                  onPrepareUpdateData();
                },
                color: AppColors.primary400,
                child: Text('Tambah', style: secondaryTextStyle(color: AppColors.textColorWhite),),
              ).marginSymmetric(vertical: AppValues.margin)
            ],
          ),
        ).paddingSymmetric(horizontal: AppValues.padding)
    );
  }

  onPrepareUpdateData(){
    if(formKey.currentState!.validate()){
      if(phoneController.text.length < AppValues.phoneNumberMinLength ||
      phoneController.text.length > AppValues.phoneNumberMaxLength
      ){
        toast("No ponsel harus antara 10 - 12 digit");

        return;
      }

      onClickSubmit(nameController.text, emailController.text, phoneController.text);

    }
  }
}
