import 'package:flutter/material.dart';

class SeleccionarPerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Perfil'),
      ),
      body: Container(
        child: _getPerfiles(),
      ),
    );
  }

  _getPerfiles() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 60,
        mainAxisSpacing: 10,
      ),
      itemCount: perfiles.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () {print('HOLAASSS');},
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.black38),
                    image: DecorationImage(
                      image: AssetImage('assets/app/ipca.png'),
                      fit: BoxFit.contain
                    )
                  ),/*
                  child: Image(
                    image: AssetImage('assets/app/ipca.png'),
                    fit: BoxFit.contain,
                  ),*/
                ),
                SizedBox(height: 5,),
                Text(perfiles[i]),
                Divider()
                
              ],
            ),
          ),
        );
      },
    );
  }

}

// Data  
List perfiles = [
  'JOHNNY',
  'GUSTAVO',
  'EDISSON',
  'ALEXANDER',
  'DENNIS',
  'EVELIN'
];