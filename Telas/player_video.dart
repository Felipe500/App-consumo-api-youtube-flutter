import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Player_video extends StatefulWidget {

  String id_video;
  String chave_api;
  String nome_video = "";


  Player_video( this.id_video, this.chave_api, this.nome_video );

  @override
  _Player_videoState createState() => _Player_videoState();
}

class _Player_videoState extends State<Player_video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome_video),
      ),
      body: Center(
        child : FlutterYoutube.playYoutubeVideoById(

      apiKey: widget.chave_api,
        videoId: widget.id_video)

      )

    );
  }
}
