import 'package:flutter/material.dart';
import 'package:mobile/models/signature.dart';
import 'package:mobile/screens/signature/signature_form.dart';

const _appBarTitle = 'Assinaturas';

class SignatureList extends StatefulWidget {
  final List<Signature> _signatures = [];

  @override
  State<StatefulWidget> createState() {
    return SignatureListState();
  }
}

class SignatureListState extends State<SignatureList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._signatures.length,
        itemBuilder: (context, index) {
          final signature = widget._signatures[index];
          return SignatureItem(signature);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignatureForm();
          })).then(
            (signatureReceived) => _reload(signatureReceived),
          );
        },
      ),
    );
  }

  void _reload(Signature signatureReceived) {
    if (signatureReceived != null) {
      setState(() {
        widget._signatures.add(signatureReceived);
      });
    }
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
