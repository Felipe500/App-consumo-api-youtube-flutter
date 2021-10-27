import 'package:app_youtube/Api.dart';
import 'package:app_youtube/model/Video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'player_video.dart';




class Inicio extends StatefulWidget {
  String Pesquisa;

  Inicio( this.Pesquisa );

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos( String Pesquisa ){

    Api api = Api();
    return api.pesquisar(Pesquisa);

  }

  void _Rodar_video(){

  }

  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.Pesquisa),
      // ignore: missing_return
      builder: (contex, snapshot){
        switch( snapshot.connectionState ){
          case ConnectionState.none :
            break;
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active :

          case ConnectionState.done :
            if( snapshot.hasData ){

              return ListView.separated(
                  itemBuilder: (context, index){

                    List<Video> videos = snapshot.data;
                    Video video = videos[ index ];

                    return GestureDetector(
                      onTap: (


                          ){
                        /*
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder:
                                    (context) => Player_video(video.id, CHAVE_YOUTUBE,video.titulo)
                            ));*/
                        FlutterYoutube.playYoutubeVideoById(

                            apiKey: CHAVE_YOUTUBE,
                            videoId: video.id,
                            autoPlay: true,
                            appBarColor: Colors.green[200]

                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage( video.imagem )
                                )
                            ),
                          ),
                          ListTile(
                            title: Text( video.titulo ),
                            subtitle: Text( video.canal ),
                          )
                        ],
                      )
                    );

                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length
              );

            }else{
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}