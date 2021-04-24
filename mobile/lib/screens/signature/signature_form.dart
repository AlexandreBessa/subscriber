import 'package:flutter/material.dart';
import 'package:mobile/models/signature.dart';
import 'package:mobile/screens/signature/dashboard.dart';
import 'package:mobile/utils/services/signature_service.dart';

const _appBarTitle = 'Criar Assinatura';

class SignatureForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignatureFormState();
  }
}

class SignatureFormState extends State<SignatureForm> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final SignatureService _webClient = SignatureService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _controllerTitle,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _controllerValue,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _controllerDescription,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  final String title = _controllerTitle.text;
                  final int value = int.parse(_controllerValue.text);
                  final String description = _controllerDescription.text;
                  final signatureCreated = Signature(
                    0,
                    title,
                    value,
                    description,
                    null,
                    null,
                  );
                  _webClient.save(signatureCreated).then((signature) {
                    if (signature != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    }
                  });
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
