import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/model/type_gender.dart';
import '../../../core/utils/date_util.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/custom_text_field.dart';
import '../../../data/model/response/city_entity.dart';
import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends BaseView<ProfileEditController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(backgroundColor: AppColors.textColorWhite,
      title: const Text('Ubah Profile', style: titleStyle,),
      titleSpacing: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        formData(),

        AppButton(
          onTap: (){
            controller.onPrepareSubmitData();
          },
          color: AppColors.primary400,
          child: Text('Ubah', style: secondaryTextStyle(color: AppColors.textColorWhite),),
        ).marginSymmetric(vertical: AppValues.margin)
      ],
    ).paddingSymmetric(horizontal: AppValues.padding)
        .paddingTop(AppValues.padding);
  }

  Widget formData(){
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(hintText: 'No. KTP', keyboardType: TextFieldType.NUMBER,
            maxLength: AppValues.maxCitizenIdLength, controller: controller.citizenIdController,
            isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          CustomTextField(hintText: 'Nama Lengkap', keyboardType: TextFieldType.NAME,
            controller: controller.nameController, isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          CustomTextField(hintText: 'Jenis Kelamin', keyboardType: TextFieldType.NAME,
            controller: controller.genderController, readOnly: true, isValidationRequired: true,
            onTap: (){
              onClickGender();
            },
          ).marginOnly(top: AppValues.margin),
          CustomTextField(hintText: 'Nomor Handphone', keyboardType: TextFieldType.NUMBER,
            controller: controller.phoneNumberController, isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          AppValues.margin.toInt().height,
          CustomTextField(hintText: 'Provinsi', keyboardType: TextFieldType.NAME,
            controller: controller.provinceController, readOnly: true, isValidationRequired: true,
            onTap: (){
              onClickProvince();
            },
          ),
          AppValues.margin.toInt().height,
          CustomTextField(hintText: 'Kota/Kabupaten', keyboardType: TextFieldType.NAME,
            controller: controller.cityController, readOnly: true, isValidationRequired: true,
            onTap: (){
              onClickCity();
            },
          ),
          CustomTextField(hintText: 'Alamat Lengkap', keyboardType: TextFieldType.MULTILINE,
            controller: controller.addressController, isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
        ],
      ),
    );
  }

  @Deprecated("not used for this time")
  onChooseBirthDate()async {
    var currentDate = DateTime.now();
    ///making 17years+ is required
    var yearAllow = currentDate.year - 17;
    var parseDate = DateUtil.parseFromYearMonthDay(yearAllow, currentDate.month, currentDate.day);
    var lastDate = DateTime.parse(parseDate);

    var selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: lastDate,
      firstDate: DateTime.parse("1900-01-01"),
      lastDate: lastDate,
      initialDatePickerMode: DatePickerMode.year,
    );

    if(selectedDate!=null){

      var formattedDate = DateFormat("dd MMMM yyyy").format(selectedDate);

      controller.phoneNumberController.text = formattedDate;
      controller.setDateOfBirth(selectedDate);
    }

  }

  onClickGender(){
    var genders = TypeGender.values.toList();
    genders.removeWhere((element) => element.valueOutput.isEmpty);

    openBottomSheet(
        Container(
            decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
            child: ListView.builder(
                itemCount: genders.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var item = genders[index];

                  return ListTile(
                    onTap: (){
                      finish(Get.context!);
                      controller.gender = item;
                      controller.genderController.text = item.description;
                    },
                    title: Text(item.description),
                  );}
            )
                .paddingAll(AppValues.padding)
        )
    );
  }

  onClickProvince()async{
    if(controller.provincesData.isEmpty){
      await controller.loadProvincesData();
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
                      itemCount: controller.provincesData.length,
                      itemBuilder: (context, index) {
                        var item = controller.provincesData[index];

                        return Obx(()=>ListTile(
                          title: Text(item.name ?? 'province'),
                          selected: item.id == controller.selectedProvince.id,
                          selectedColor: AppColors.primary500,
                          textColor: item.id == controller.selectedProvince.id ?
                          AppColors.textColorWhite : null,
                          onTap: (){
                            finish(Get.context!);
                            controller.setSelectedProvince(item);
                            //refresh-city
                            controller.setSelectedCity(CityEntity());
                            controller.cityController.text = '';

                            controller.loadCitiesData(item.id.toString());
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
    if(controller.selectedProvince.id == null){
      controller.showMessage("pilih provinsi terlebih dahulu");

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
                        selected: item.id == controller.selectedCity.id,
                        selectedColor: AppColors.primary500,
                        textColor: item.id == controller.selectedCity.id ? AppColors.textColorWhite : null,
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

}
