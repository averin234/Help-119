import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreki119/app/core/base/base_view.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../core/widget/asset_image_view.dart';
import '../controllers/informasi_controller.dart';

class InformasiView extends BaseView<InformasiController> {
  final List<Map<String, String>> items = [
    {
      'imagePath': 'assets/images/Mitra-1.png',
      'text': 'KEMENTERIAN KESEHATAN',
    },
    {
      'imagePath': 'assets/images/Mitra-2.png',
      'text': 'IDSMED',
    },
    {
      'imagePath': 'assets/images/Mitra-3.png',
      'text': 'GPSP',
    },
    {
      'imagePath': 'assets/images/Mitra-4.png',
      'text': 'PEMERINTAH DAERAH KOTA CIREBON',
    },
    {
      'imagePath': 'assets/images/Mitra-5.png',
      'text': 'KOWANI',
    },
    {
      'imagePath': 'assets/images/Mitra-6.jpg',
      'text': 'PMI',
    },
    {
      'imagePath': 'assets/images/Mitra-7.png',
      'text': 'PEMERINTAH PROVINSI NUSA TENGGARA BARAT',
    },
    {
      'imagePath': 'assets/images/Mitra-8.png',
      'text': 'HELFA',
    },
    {
      'imagePath': 'assets/images/Mitra-9.png',
      'text': 'DINAS KESEHATAN PROVINSI DKI JAKARTA',
    },
    {
      'imagePath': 'assets/images/Mitra-10.png',
      'text': 'UNIVERSITAS JENDRAL ACHMAD YANI',
    },
    {
      'imagePath': 'assets/images/Mitra-11.png',
      'text': 'UNIVERSITAS MUHAMMADIYAH MAKASSAR',
    },
    {
      'imagePath': 'assets/images/Mitra-12.jpg',
      'text': 'GUNA WIDYA SEWAKA NAGARA',
    },
    {
      'imagePath': 'assets/images/Mitra-33.png',
      'text': 'HEALTHCARE MANAGEMENT SOLUTION',
    },
    {
      'imagePath': 'assets/images/Mitra-13.png',
      'text': 'PERHIMPUNAN DOKTER EMERGENSI INDONESIA',
    },
    {
      'imagePath': 'assets/images/Mitra-14.png',
      'text': 'RUANG INSAN BERBAGI',
    },
    {
      'imagePath': 'assets/images/Mitra-15.png',
      'text': 'RSIA IBNU SINA',
    },
    {
      'imagePath': 'assets/images/Mitra-16.png',
      'text': 'KOSEINDO',
    },
    {
      'imagePath': 'assets/images/Mitra-17.png',
      'text': 'RUMAH SAKIT HERMINA',
    },
    {
      'imagePath': 'assets/images/Mitra-18.png',
      'text': 'SUMMARECON SERPONG',
    },
    {
      'imagePath': 'assets/images/Mitra-19.jpg',
      'text': 'DOCTER SHARE',
    },
    {
      'imagePath': 'assets/images/Mitra-20.png',
      'text': 'KOTA ADMINISTRASI JAKARTA TIMUR',
    },
  ];

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text('Informasi Help 119'),
      // elevation: AppValues.smallElevation,
    );
  }

  @override
  Widget body(BuildContext context) {
    return  ListView(
      children: [
    Container(
    margin: EdgeInsets.only(right: 10, left: 50, bottom: 10),
    child: Text('Powered By'),
    ),
        Container(
          margin: EdgeInsets.only(right: 10, left: 20),
          child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AssetImageView(fileName: 'logo_kreki1.png',
              height: 40,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            const AssetImageView(fileName: 'logo_averin.png',
              height: 40,
              fit: BoxFit.contain,
            ),
          ],),),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
          child:
        Center(child: Column(children: [
      Text('TENTANG HELP-119', style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)
                )
            ),
          ),
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)
                )
            ),
          )
        ],),
      SizedBox(
        height: 10,
      ),
      Text('HELP-119 adalah sistem PSC 119 yang terintegrasi dengan informasi relawan, rumah sakit, fasilitas kesehatan & informasi tentang kegawatdaruratan.',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
      SizedBox(
        height: 10,
      ),
      Text('Sistem HELP-119 dibagi menjadi dua bagian :', style: TextStyle(),),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AssetImageView(fileName: 'android-phone.svg',
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 120,
            child:
            Text('Aplikasi Android yang bisa digunakan oleh masyarakat, relawan & petugas medis.',textAlign: TextAlign.justify, style: TextStyle(color: Colors.grey, fontSize: 12),),),
          SizedBox(
            width: 10,
          ),
          const AssetImageView(fileName: 'dashboard.svg',
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 140,
            child:
            Text('Dashboard untuk admin PSC 119 sebagai decision support system (DSS).',textAlign: TextAlign.justify, style: TextStyle(color: Colors.grey, fontSize: 12),),),
        ],),
      SizedBox(
        height: 20,
      ),
      Text('Saat ini sudah ada 2200 pengguna yang terdaftar di sistem HELP-119 dan diharapkan akan terus bertambah. Dengan adanya HELP-119 diharapkan masyarakat lebih sadar dalam menyikapi kondisi kegawatdaruratan yang hasil akhirnya dapat meningkatkan survival rate korban kegawatdaruratan.',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
      SizedBox(
        height: 20,
      ),
      Text('Mitra KREKI', style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)
                )
            ),
          ),
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)
                )
            ),
          )
        ],),
        ]
                ),),),
        searchBar()
      // Expanded(child: ,) ,

    ],);

  }

  Widget searchBar(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length, // Jumlah item dalam GridView
      itemBuilder: (BuildContext context, int index) {
        return  GridItem(
          imagePath: items[index]['imagePath']!,
          text: items[index]['text']!,
            );
      },
    );
  }


}


class GridItem extends StatelessWidget {
  final String imagePath;
  final String text;

  GridItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          imagePath,
          width: 48.0,
          height: 48.0,
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
