import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:kreki119/app/core/model/emergency_status.dart';
import 'package:kreki119/app/core/utils/call_util.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/text_styles.dart';
import 'package:kreki119/app/core/widget/asset_image_view.dart';
import 'package:kreki119/app/data/model/response/emergency_entity.dart';
import 'package:kreki119/app/data/model/response/emergency_mobile_entity.dart';
import 'package:kreki119/flavors/build_config.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../modules/emergency_pick/controllers/emergency_pick_controller.dart';
import '../utils/date_util.dart';
import '../values/app_values.dart';
import '../widget/elevated_container.dart';

class ItemEmergency extends StatelessWidget {
  const ItemEmergency(
      {Key? key, required this.item, this.onTap, this.isVolunteerView = false})
      : super(key: key);

  final EmergencyMobileEntity item;
  final bool isVolunteerView;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // final controller=Get.put(EmergencyPickController());
    // var date = DateTime.parse(item.updatedAt ?? '').toLocal();
    Logger logger = BuildConfig.instance.config.logger;
    var date = item.createdAt?.iSeconds ?? DateTime.now().second;
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
      date * 1000,
    );
    // var hasGoingStat = item.currentStatus == EmergencyStatus.ACCEPTED.description ||
    //     item.currentStatus == EmergencyStatus.ON_GOING.description;

    return ElevatedContainer(
      borderRadius: isVolunteerView ? 0 : AppValues.smallRadius,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          !isVolunteerView
              ? Container(
                  height: 1,
                )
              : const Text(
                  'Permintaan darurat berlangsung',
                  style: appBarActionTextStyle,
                ),
          12.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: AppValues.minLeadingWidth,
                child: Column(
                  children: [
                    Text('korban', textAlign: TextAlign.center),
                    SizedBox(
                      height: 10,
                    ),
                    const AssetImageView(
                      fileName: 'ic_marker_victim.svg',
                      width: AppValues.iconSize_28,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.namaKorban ?? item.fullName ?? 'Korban',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
              AppValues.padding.toInt().width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat("dd MMM yyyy").format(dateTime)),
                      Text(DateFormat("HH:mm:ss").format(dateTime)),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Pelapor : '),
                      SizedBox(width: 180,child:
                      Text( item.fullName??'',
                        style: TextStyle(
                           fontSize: 14),
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Status : '),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _getColorForStatus(item.currentStatus.toString(),),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          item.currentStatus.toString(),
                          style: TextStyle(
                            color: _getTextColorForStatus(item.currentStatus.toString(),),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  AppValues.smallPadding.toInt().height,
                  Text('deskripsi :'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(item.keterangan ??
                                'tidak ada keterangan deskripsi')
                            .expand(),
                        isVolunteerView
                            ? item.phoneNumber.isEmptyOrNull
                                ? Container(
                                    width: 1,
                                  )
                                : const CircleAvatar(
                                    backgroundColor: AppColors.colorPrimary,
                                    radius: AppValues.iconSmallSize,
                                    child: Icon(Icons.call_outlined),
                                  ).onTap(() {
                                    UtilCall.launchCall(item.phoneNumber ?? '');
                                  })
                            : Container(
                                width: 1,
                              ),
                      ],
                    ),
                  ),
                ],
              ).expand()
            ],
          ),
        ],
      ),
    ).onTap(onTap);
  }
  Color _getColorForStatus(String status) {
    switch (status) {
      case "waiting":
        return AppColors.info600;
      case "accepted":
        return AppColors.warning500;
      case "rejected":
        return Colors.red;
      case "on_going":
        return AppColors.warning500;
      case "finished":
        return AppColors.success500;
      case "need_follow_up":
        return AppColors.error500; // Merah muda
      default:
        return Colors.grey; // Warna default jika status tidak sesuai
    }
  }

// Fungsi untuk mengembalikan warna teks berdasarkan status
  Color _getTextColorForStatus(String status) {
    switch (status) {
      case "Rejected":
        return Colors.white; // Teks berwarna putih untuk status "Rejected"
      default:
        return Colors.white; // Warna teks default
    }
  }
}
