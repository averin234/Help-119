import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/app_colors.dart';
import '../values/app_values.dart';
import '../widget/custom_text_field.dart';
import '../widget/elevated_container.dart';

class ViewUpdatePassword extends StatelessWidget {
  ViewUpdatePassword({Key? key, required this.onClickSubmit}) : super(key: key);

  final Function(String password) onClickSubmit;

  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();



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
              Text("Ubah Kata Sandi", style: primaryTextStyle(weight: FontWeight.bold),),
              AppValues.padding.toInt().height,
              CustomTextField(hintText: 'Kata Sandi', keyboardType: TextFieldType.NAME,
                controller: passwordController, isValidationRequired: true,
              ).marginOnly(top: AppValues.margin),

              AppButton(
                onTap: (){
                  onPrepareUpdateData();
                },
                color: AppColors.primary400,
                child: Text('Perbaharui', style: secondaryTextStyle(color: AppColors.textColorWhite),),
              ).marginSymmetric(vertical: AppValues.margin)
            ],
          ),
        ).paddingSymmetric(horizontal: AppValues.padding)
    );
  }


  onPrepareUpdateData(){
    if(formKey.currentState!.validate()){
      if(passwordController.text.length < 6){
        toast("Password minimal 6 digit");

        return;
      }

      onClickSubmit(passwordController.text);

    }
  }
}
