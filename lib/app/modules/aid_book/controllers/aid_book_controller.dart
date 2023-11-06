import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_controller.dart';

import '../../../core/model/type_data.dart';
import '../../home/model/aid_book.dart';

class AidBookController extends BaseController {


  final _aidBooks = RxList<AidBook>.empty();
  List<AidBook> get aidBooks => _aidBooks.toList();

  final _playMode = PlayerState.stopped.obs;
  PlayerState get playMode => _playMode.value;
  setPlayerState(PlayerState state) => _playMode.value = state;

  @override
  void onInit() {
    super.onInit();

    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }


  loadData(){
    List<AidBook> books = [];
    AidBook aidBook = AidBook(
        name: 'Voice BHD',
        data: 'audios/emergency_docs.mp3',
        type: TypeData.AUDIO.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook);

    AidBook aidBook1 = AidBook(
        name: 'Gagal jantung',
        data: 'assets/raw/hearthattack.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook1);

    AidBook aidBook2 = AidBook(
        name: 'Penurunan Kesadaran',
        data: 'assets/raw/ams.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook2);

    AidBook aidBook3 = AidBook(
        name: 'Keracunan/Gigitan ular',
        data: 'assets/raw/toxinology.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook3);

    AidBook aidBook4 = AidBook(
        name: 'Tersedak',
        data: 'assets/raw/choking.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook4);

    AidBook aidBook5 = AidBook(
        name: 'Kecelakaan lalu lintas',
        data: 'assets/raw/accident.html',
        type: TypeData.WEB.value,
        icon: 'ic_book.svg'
    );
    books.add(aidBook5);

    _aidBooks(books);
  }

  @override
  void onClose() {

    _aidBooks.close();
    super.onClose();
  }

}
