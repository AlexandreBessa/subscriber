import 'package:flutter/material.dart';

class SignatureForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Assinatura'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          // ElevatedButton(
          //   child: Text('Cadastrar'),
          //   onPressed: () {
          //     debugPrint('cliclou no botão');
          //   }
          // ),
        )
      ]),
    );
  }
}
