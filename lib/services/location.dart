import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;
  Future<void>getLocation()async{
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }
    if(position != null){
      latitude = position.latitude;
      longitude = position.longitude;
    }else{

    }
  }
}