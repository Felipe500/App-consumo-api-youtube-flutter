import 'package:app_youtube/Delegate_Pesquisa.dart';
import 'package:app_youtube/Telas/Biblioteca.dart';
import 'package:app_youtube/Telas/EmAlta.dart';
import 'package:app_youtube/Telas/Inicio.dart';
import 'package:app_youtube/Telas/Inscricoes.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("acao: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: Delagate_Pesquisa());
              print("resultado: digitado " + res );

              setState(() {
                _resultado = res;
              });
              //showSearch(context: context, delegate: Delagate_Pesquisa());
            },
          ),
          /*IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("acao: conta");
            },
          )*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
                title: Text("In??cio"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.red,
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
                title: Text("Inscri????es"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.green,
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            ),
          ]
      ),
    );
  }
}