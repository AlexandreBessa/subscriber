import 'package:flutter/material.dart';
import 'package:mobile/models/signature.dart';
import 'package:mobile/screens/signature/signature_form.dart';

class SignatureList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assinaturas'),
      ),
      body: Column(
        children: <Widget>[
          SignatureItem(Signature('Amazon Prime', 9.90)),
          SignatureItem(Signature('Spotify', 8.50)),
          SignatureItem(Signature('Office 365', 23.99)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignatureForm();
          }));
        },
      ),
    );
  }
}

class SignatureItem extends StatelessWidget {
  final Signature _signature;

  SignatureItem(this._signature);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_signature.title.toString()),
        subtitle: Text(_signature.value.toString()),
      ),
    );
  }
}
