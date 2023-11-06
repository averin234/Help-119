import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/model/type_data.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../home/model/aid_book.dart';
import '../../web_app/views/web_app_view.dart';
import '../controllers/aid_book_controller.dart';

class AidBookView extends BaseView<AidBookController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return Get.arguments == null ? null : AppBar(
      title: const Text(''),);
  }

  @override
  Widget body(BuildContext context) {
    return Obx(()=> controller.aidBooks.isEmpty ?
    Container() :
        Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(padding: EdgeInsets.only(right: 15, left: 15),
        child : Text('Buku Saku', style: descriptionTextStyle,),),
          Padding(padding: EdgeInsets.only(right: 15, left: 15),
            child:  Text('panduan untuk user yang ingin tahu tentang Gagal Jantung, Penurunan Kesadaran, Keracunan/Gigitan Ular, Tersedak, Kecelakaan lalu lintas',
            style: greyDarkContentTextStyle,),),
    Expanded(child: GridView.builder(
      itemCount: controller.aidBooks.length,
      padding: const EdgeInsets.symmetric(vertical: AppValues.padding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppValues.padding,
        mainAxisSpacing: AppValues.padding,
        // mainAxisExtent: AppValues.heightContainerImage
      ),
      itemBuilder: (BuildContext context, int index) {
        var item = controller.aidBooks[index];

        return itemAid(item);
      },
    ).paddingSymmetric(horizontal: AppValues.padding)) ],),);
  }


  Widget itemAid(AidBook item){
    final assetsAudio = AudioPlayer(playerId: 'player');
    final source = AssetSource(item.data??'');

    return Container(
      decoration: boxDecorationRoundedWithShadow(AppValues.radius_6.toInt()),
      child: Stack(
        alignment: const Alignment(0,-0.25),
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AssetImageView(fileName: item.icon ?? '',
                height: AppValues.iconExtraLargerSize, width: AppValues.iconHomeSize,).center(),
              AppValues.smallPadding.toInt().height,
              Container(
                  color: AppColors.neutral100,
                  child: Text(item.name?? '', textAlign: TextAlign.center,).paddingAll(AppValues.smallPadding)
              )
            ],
          ).onTap((){onTapItem(item, assetsAudio, source);}),

          item.type == TypeData.AUDIO.value ? Obx(()=>playModeIcon(controller.playMode, item, assetsAudio, source))
              : Container()

        ],
      ),
    );
  }

  Widget playModeIcon(PlayerState state, AidBook item, AudioPlayer assetsAudio, AssetSource source){

    var iconData = Icons.circle_outlined;

    switch(state){
      case PlayerState.stopped:
        iconData = Icons.play_circle_filled_rounded;
        break;
      case PlayerState.playing:
        iconData = Icons.pause_circle_filled_rounded;
        break;
      case PlayerState.paused:
        iconData = Icons.play_circle_filled_rounded;
        break;
      case PlayerState.completed:
        iconData = Icons.play_circle_filled_rounded;
        break;
    }

    return Icon(iconData, size: AppValues.iconHomeSize,)
        .onTap((){onTapItem(item, assetsAudio, source);});

  }

  onTapItem(AidBook item, AudioPlayer assetsAudio, AssetSource source)async{
    if(item.type == TypeData.AUDIO.value){
      logger.d('aap, state: ${assetsAudio.state.name}');
      switch(assetsAudio.state){
        case PlayerState.stopped:
          await assetsAudio.play(source ,mode: PlayerMode.mediaPlayer);
          break;
        case PlayerState.playing:
          assetsAudio.pause();
          break;
        case PlayerState.paused:
          await assetsAudio.play(source ,mode: PlayerMode.mediaPlayer);
          break;
        case PlayerState.completed:
          assetsAudio.stop();
          break;
      }

      assetsAudio.onPlayerStateChanged.listen((event) {
        controller.setPlayerState(event);
        logger.d('aap, state: ${event.name}');
      });

    } else{
      WebAppView.push(url: item.data ?? '', title: item.name, isLocalFile: true);
    }
  }

}
