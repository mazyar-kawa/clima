import 'package:geolocator/geolocator.dart';

class Location{

  double? latitude;
  double? longitude;



  Future getLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();

    if(permission==LocationPermission.denied){
     await Geolocator.requestPermission();
    }else{
      try {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
      } catch (e) {
        print(e);
        
      }
    }

  }
}