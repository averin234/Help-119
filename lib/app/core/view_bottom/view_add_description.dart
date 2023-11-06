import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/widget/elevated_container.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../modules/emergency_create/controllers/emergency_create_controller.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';
import '../widget/custom_text_field.dart';

class ViewAddDescription extends StatelessWidget {
  ViewAddDescription({Key? key, required this.onClickSubmit, this.title})
      : super(key: key);
  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String? title;
  final Function(String description) onClickSubmit;

  @override
  Widget build(BuildContext context) {
    final EmergencyCreateController controller = Get.put(EmergencyCreateController());
    return ElevatedContainer(
        child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppValues.padding.toInt().height,
          Text(
            title ?? "Tindak lanjut permintaan",
            style: primaryTextStyle(weight: FontWeight.bold),
          ),
          AppValues.padding.toInt().height,
          // Text('Opsi'),
          //
          // Obx(() => DropdownButton<String>(
          //   value: controller.selectedOption.value,
          //   onChanged: (String? newValue) {
          //     textController.text = newValue??'';
          //   },
          //   items: controller.dropdownOptions.map((String option) {
          //     return DropdownMenuItem<String>(
          //       value: option,
          //       child: Text(option),
          //     );
          //   }).toList(),
          // )),

          CustomTextField(
            hintText: 'Deskripsi Kejadian',
            keyboardType: TextFieldType.MULTILINE,
            controller: textController,
            isValidationRequired: true,
          ).marginOnly(top: AppValues.margin),
          AppButton(
            onTap: () {
              onPrepareUpdateData();
            },
            color: AppColors.primary400,
            child: Text(
              'Ubah Status Tindak Lanjut',
              style: secondaryTextStyle(color: AppColors.textColorWhite),
            ),
          ).marginSymmetric(vertical: AppValues.margin)
        ],
      ),
    ).paddingSymmetric(horizontal: AppValues.padding));
  }
  onPrepareUpdateData() {
    if (formKey.currentState!.validate()) {
      onClickSubmit(textController.text);
    }
  }
}
