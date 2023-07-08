import 'package:clima/services/location.dart';
import 'package:clima/services/network.dart';


String apiKye = "7c3129061e9119f949aa3f5b2927a801";

const openWeatherMap="https://api.openweathermap.org/data/2.5/weather";

class WeatherModel{



  Future getWeatheByNameCity(dynamic nameCity) async{
    Networking networking=Networking('${openWeatherMap}?q=${nameCity}&appid=${apiKye}&units=metric');
    var weatherData=  await networking.getData();
    return weatherData;
  }

  
  Future getLocationByLantAndLon() async{
    Location location=  Location();
    await location.getLocation();
    Networking networking=Networking('${openWeatherMap}?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKye}&units=metric');
    var weatherData=  await networking.getData();
    return weatherData;
  }
}