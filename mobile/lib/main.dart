import 'package:flutter/material.dart';

void main() {
  runApp(SubscriberApp());
}

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
      ),
    );
  }
}

class SubscriberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SignatureForm(),
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

class Signature {
  final String title;
  final double value;
  // final String description;
  // final String type;
  // final String expireDate;
  // final bool automaticRenovation;
  //
  //   Signature(this.title,  this.value,  this.description,this.type,
  //  this.expireDate, this.automaticRenovation);

  Signature(this.title, this.value);
}

class SignatureForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Assinatura'),
      ),
    );
  }
}
