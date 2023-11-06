import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreki119/app/core/base/base_controller.dart';
import 'package:kreki119/app/core/model/type_volunteer.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

abstract class BaseMapController extends BaseController{



  TypeVolunteer getTypeVolunteer();

  final ScrollController scrollController = ScrollController();

  late GoogleMapController mapController;
  final markers = RxMap<String, Marker>().obs;

  final _cameraPosition = const LatLng(0, 0).obs;
  LatLng get cameraPosition => _cameraPosition.value;
  set cameraPosition(LatLng val) => _cameraPosition.value = val;

  final SnappingSheetController sheetController = SnappingSheetController();

  final _isSnap = false.obs;
  bool get isSnap => _isSnap.value;
  set isSnap(bool val) => _isSnap.value = val;

  ///load data after map successfully created
  loadOnMapCreated({double? latitude = 0.0, double? longitude = 0.0});

  Future<void> loadInitialPosition(Position position) async{
    var myPos = LatLng(position.latitude ,
        position.longitude
    );
    CameraPosition cameraPosition = CameraPosition(target: myPos, zoom: 14);

    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    final marker = Marker(
        markerId: const MarkerId('My Place'),
        position: myPos,
        infoWindow: const InfoWindow(title: 'My Place',),
        icon: await bitmapDescriptorFromSvgAsset('ic_marker_victim.svg')
    );

    markers.value["MyPlace"] = marker;
  }

  onClickRefreshData() async{
    var pos = await getLastPositionLocator();
    if(pos == null) return;

    var distance = Geolocator.distanceBetween(
        pos.latitude, pos.longitude,
        cameraPosition.latitude, cameraPosition.longitude
    );



    if(distance < 8 && distance > 2) {
      return;
    }

    loadOnMapCreated(latitude: cameraPosition.latitude,
        longitude: cameraPosition.longitude);
  }


}