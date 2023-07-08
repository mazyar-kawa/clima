import 'package:dio/dio.dart';


class Networking{

  String? url;

  Networking( this.url);

  Future  getData() async{
    Response response = await Dio().get(url!);
    try {
      if(response.statusCode==200){
      return response.data;
    }else{
      print(response.statusMessage);
    }
    } catch (e) {
      print(e);
    }
  }
}