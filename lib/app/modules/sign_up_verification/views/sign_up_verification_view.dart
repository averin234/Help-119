import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/model/type_gender.dart';
import 'package:kreki119/app/core/utils/date_util.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:kreki119/app/data/model/response/app_user_entity.dart';
import 'package:kreki119/app/data/model/response/city_entity.dart';
import 'package:kreki119/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/values/text_styles.dart';
import '../../../core/widget/custom_text_field.dart';
import '../controllers/sign_up_verification_controller.dart';

class SignUpVerificationView extends BaseView<SignUpVerificationController> {
  static push({AppUserEntity? data}) {
    Get.toNamed(Routes.SIGN_UP_VERIFICATION, arguments: data);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.textColorWhite,
      leading: const SizedBox(
        width: 16,
      ),
      title: const Text(
        'Lengkapi Pendaftaran',
        style: titleStyle,
      ),
      titleSpacing: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        const Text('Lengkapi data untuk untuk mendapatkan fitur bantuan'),
        formData(),
        AppButton(
          onTap: () {
            controller.onPrepareSubmitData();
          },
          color: AppColors.primary400,
          child: Text(
            'Kirim',
            style: secondaryTextStyle(color: AppColors.textColorWhite),
          ),
        ).marginSymmetric(vertical: AppValues.margin)
      ],
    )
        .paddingSymmetric(horizontal: AppValues.padding)
        .paddingTop(AppValues.padding);
  }

  Widget formData() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            hintText: 'No. KTP',
            keyboardType: TextFieldType.NUMBER,
            maxLength: 16,
            controller: controller.citizenIdController,
            isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          CustomTextField(
            hintText: 'Nama Lengkap',
            keyboardType: TextFieldType.NAME,
            controller: controller.nameController,
            isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          CustomTextField(
            hintText: 'Jenis Kelamin',
            keyboardType: TextFieldType.NAME,
            controller: controller.genderController,
            readOnly: true,
            isValidationRequired: true,
            onTap: () {
              onClickGender();
            },
          ).marginOnly(top: AppValues.margin),
          CustomTextField(
            hintText: 'Nomor Handphone',
            keyboardType: TextFieldType.NUMBER,
            controller: controller.phoneNumberController,
            isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          AppValues.margin.toInt().height,
          const Text(
            'No Ponsel terdiri dari 9 - 13 angka/digit',
            style: TextStyle(),
          ).paddingBottom(AppValues.padding),
          CustomTextField(
            hintText: 'Provinsi',
            keyboardType: TextFieldType.NAME,
            controller: controller.provinceController,
            readOnly: true,
            isValidationRequired: true,
            onTap: () {
              onClickProvince();
            },
          ),
          AppValues.margin.toInt().height,
          CustomTextField(
            hintText: 'Kota/Kabupaten',
            keyboardType: TextFieldType.NAME,
            controller: controller.cityController,
            readOnly: true,
            isValidationRequired: true,
            onTap: () {
              onClickCity();
            },
          ),
          CustomTextField(
            hintText: 'Alamat Lengkap',
            keyboardType: TextFieldType.MULTILINE,
            controller: controller.addressController,
            isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          const Text(
            'Tolong periksa kembali data yang anda isikan sudah benar terutama pada (No. KTP dan No. Handphone), mohon tunggu beberapa saat/Loading hingga masuk ke Home Help 119)',
            style: TextStyle(fontSize: 12, color: Colors.redAccent),
          ).paddingTop(AppValues.largePadding).paddingBottom(AppValues.padding),
        ],
      ),
    );
  }

  onChooseBirthDate() async {
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

    if (selectedDate != null) {
      var formattedDate = DateFormat("dd MMMM yyyy").format(selectedDate);

      controller.phoneNumberController.text = formattedDate;
      controller.setDateOfBirth(selectedDate);
    }
  }

  onClickGender() {
    var genders = TypeGender.values.toList();
    genders.removeWhere((element) => element.valueOutput.isEmpty);

    openBottomSheet(Container(
        decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
        child: ListView.builder(
            itemCount: genders.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var item = genders[index];

              return ListTile(
                onTap: () {
                  finish(Get.context!);
                  controller.setGender(item);
                  controller.genderController.text = item.description;
                },
                title: Text(item.description),
              );
            }).paddingAll(AppValues.padding)));
  }

  onClickProvince() async {
    if (controller.provincesData.isEmpty) {
      await controller.loadProvinceData();
    }

    openBottomSheet(Container(
        decoration: boxDecorationRoundedWithShadow(AppValues.radius_12.toInt()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Pilih Provinsi',
              style: titleStyle,
            )
                .paddingTop(AppValues.largePadding)
                .paddingBottom(AppValues.padding)
                .paddingSymmetric(horizontal: AppValues.padding),
            Flexible(
                child: Obx(() => ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemCount: controller.provincesData.length,
                  itemBuilder: (context, index) {
                    var item = controller.provincesData[index];

                    return Obx(() => ListTile(
                      title: Text(item.name ?? 'province'),
                      selected:
                      item.id == controller.selectedProvince.id,
                      selectedColor: AppColors.primary500,
                      textColor:
                      item.id == controller.selectedProvince.id
                          ? AppColors.textColorWhite
                          : null,
                      onTap: () {
                        finish(Get.context!);
                        controller.setSelectedProvince(item);
                        //refresh-city
                        controller.setSelectedCity(CityEntity());
                        controller.cityController.text = '';

                        controller.loadCity(item.id.toString());
                        controller.provinceController.text =
                            item.name.toString();
                      },
                    ));
                  },
                )))
          ],
        )).paddingTop(AppValues.padding));
  }

  onClickCity() {
    if (controller.selectedProvince.id == null) {
      controller.showMessage("pilih provinsi terlebih dahulu");

      return;
    }

    openBottomSheet(Container(
        decoration:
        boxDecorationRoundedWithShadow(AppValues.largeRadius.toInt()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Pilih Kota/Kabupaten',
              style: titleStyle,
            )
                .paddingTop(AppValues.largePadding)
                .paddingBottom(AppValues.padding)
                .paddingSymmetric(horizontal: AppValues.padding),
            Flexible(
              child: Obx(() => ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: controller.cities.length,
                itemBuilder: (context, index) {
                  var item = controller.cities[index];

                  return Obx(() => ListTile(
                    title: Text(item.name ?? 'city'),
                    selected: item.id == controller.selectedCity.id,
                    selectedColor: AppColors.primary500,
                    textColor: item.id == controller.selectedCity.id
                        ? AppColors.textColorWhite
                        : null,
                    onTap: () {
                      finish(Get.context!);
                      controller.setSelectedCity(item);
                      controller.cityController.text =
                          item.name.toString();
                    },
                  ));
                },
              )),
            )
          ],
        )).paddingTop(AppValues.padding));
  }
}