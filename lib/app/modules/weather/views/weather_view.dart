import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/weather_controller.dart';

class WeatherView extends BaseView<WeatherController> {


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: searchBar(),
      // elevation: AppValues.smallElevation,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(()=>controller.cityLocation.isEmpty ?
        const Center(child: Text('Data lokasi belum ada'),) :
        ListView.separated(
          itemCount: controller.cityLocation.length,
          itemBuilder: (BuildContext context, int index) {
            var item = controller.cityLocation[index];

            return ListTile(title: Text(item),
              onTap: (){
                toast('Click item: $item');
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8,);
          },

        )
    );
  }

  Widget searchBar(){
    return TextField(
      controller: controller.searchController,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        hintText: 'Pencarian kota cuaca',
        suffixIcon: Icon(Icons.search, color: Colors.grey,),
        border: InputBorder.none
      ),
      onSubmitted: (value){
        showBottomSheetOrDialog(context: Get.context!,
            child: openBottomSheetConfirmation(
              title: 'Cari kota',
              description: 'Apakah kamu yakin akan mencari dan menambahkan kota $value ?',
              hasTextField: false,
                onAccept: (){
                  controller.onSearchCity(value);
                }),
          bottomSheetDialog: BottomSheetDialog.BottomSheet
        );
      },
    );
  }


}
