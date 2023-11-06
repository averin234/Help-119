
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../flavors/build_config.dart';

class UtilCall{

  final Logger logger = BuildConfig.instance.config.logger;

  static Future<void> launchWhatsAppUrl(String phone) async {

    Uri url = Uri.parse('');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchCall(String phone) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: phone,
    );

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  // static Future<void> showCallkitIncoming(String uuid, String name) async {
  //   final params = CallKitParams(
  //     id: uuid,
  //     nameCaller: name,
  //     appName: 'Kreki119',
  //     avatar: 'https://i.pravatar.cc/100',
  //     handle: '0123456789',
  //     type: 0,
  //     duration: 30000,
  //     textAccept: 'Terima',
  //     textDecline: 'Tolak',
  //     textMissedCall: 'Panggilan darurat selesai',
  //     textCallback: 'Selesai',
  //     extra: <String, dynamic>{'userId': '1a2b3c4d'},
  //     headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
  //     android: const AndroidParams(
  //       isCustomNotification: true,
  //       isShowLogo: true,
  //       isShowCallback: true,
  //       isShowMissedCallNotification: true,
  //       ringtonePath: 'system_ringtone_default',
  //       backgroundColor: '#0955fa',
  //       backgroundUrl: 'assets/images/logo_kreki.png',
  //       actionColor: '#4CAF50',
  //     ),
  //     ios: IOSParams(
  //       iconName: 'CallKitLogo',
  //       handleType: '',
  //       supportsVideo: true,
  //       maximumCallGroups: 2,
  //       maximumCallsPerCallGroup: 1,
  //       audioSessionMode: 'default',
  //       audioSessionActive: true,
  //       audioSessionPreferredSampleRate: 44100.0,
  //       audioSessionPreferredIOBufferDuration: 0.005,
  //       supportsDTMF: true,
  //       supportsHolding: true,
  //       supportsGrouping: false,
  //       supportsUngrouping: false,
  //       ringtonePath: 'system_ringtone_default',
  //     ),
  //   );
  //   await FlutterCallkitIncoming.showCallkitIncoming(params);
  // }
  //
  // callkitListener(){
  //   FlutterCallkitIncoming.onEvent.listen((event) async{
  //     logger.d("aap, onCallKit: ${event.toString()}");
  //
  //     if(event!=null){
  //       switch (event.event) {
  //         case Event.ACTION_CALL_INCOMING:
  //         // TODO: received an incoming call
  //           break;
  //         case Event.ACTION_CALL_START:
  //         // TODO: started an outgoing call
  //         // TODO: show screen calling in Flutter
  //           break;
  //         case Event.ACTION_CALL_ACCEPT:
  //         // TODO: accepted an incoming call
  //         // TODO: show screen calling in Flutter
  //
  //           break;
  //         case Event.ACTION_CALL_DECLINE:
  //         // TODO: declined an incoming call
  //           break;
  //         case Event.ACTION_CALL_ENDED:
  //         // TODO: ended an incoming/outgoing call
  //           break;
  //         case Event.ACTION_CALL_TIMEOUT:
  //         // TODO: missed an incoming call
  //           break;
  //         case Event.ACTION_CALL_CALLBACK:
  //         // TODO: only Android - click action `Call back` from missed call notification
  //           break;
  //         case Event.ACTION_CALL_TOGGLE_HOLD:
  //         // TODO: only iOS
  //           break;
  //         case Event.ACTION_CALL_TOGGLE_MUTE:
  //         // TODO: only iOS
  //           break;
  //         case Event.ACTION_CALL_TOGGLE_DMTF:
  //         // TODO: only iOS
  //           break;
  //         case Event.ACTION_CALL_TOGGLE_GROUP:
  //         // TODO: only iOS
  //           break;
  //         case Event.ACTION_CALL_TOGGLE_AUDIO_SESSION:
  //         // TODO: only iOS
  //           break;
  //         case Event.ACTION_DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP:
  //         // TODO: only iOS
  //           break;
  //       }
  //     }
  //   });
  // }


}