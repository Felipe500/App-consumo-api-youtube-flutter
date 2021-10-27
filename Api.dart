import 'package:app_youtube/model/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



const CHAVE_YOUTUBE = "";
const felipe_brx = "UC2TY96e7rufmyOoOtKUH1Ew";
const ignorance_zero = "UCmjj41YfcaCpZIkU-oqVIIw";

const url_base = "https://www.googleapis.com/youtube/v3/";


//cadastre-se no google cloud platform - crie uma chave de api
const CHAVE_YOUTUBE_API = "";

//canal do youtube ignorância zero - python 

const ID_CANAL1 = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE"
            "&channelId=$ignorance_zero"
            "&q=$pesquisa"
    );

    if( response.statusCode == 200 ){


      Map<String, dynamic> dadosJson = json.decode( response.body );

      List<Video> videos = dadosJson["items"].map<Video>(
              (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

      //print("Resultado: " + videos.toString() );

        /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString() );
      }*/
      //print("resultado: " + dadosJson["items"].toString() );

    }else{

    }

  }

}
