import 'package:flutter/material.dart';
import 'package:mobile/models/signature.dart';
import 'package:mobile/widgets/form_text.dart';

const _appBarTitle = 'Criar Assinatura';

const _labelTitle = 'Título';
const _labelValue = 'Valor';
const _labelButton = 'Cadastrar';

class SignatureForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignatureFormState();
  }
}

class SignatureFormState extends State<SignatureForm> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          FormText(
            controller: _controllerTitle,
            label: _labelTitle,
          ),
          FormText(
            controller: _controllerValue,
            label: _labelValue,
          ),
          ElevatedButton(
            child: Text(_labelButton),
            onPressed: () => _formBuild(context),
          ),
        ]),
      ),
    );
  }

  void _formBuild(BuildContext context) {
    final String title = _controllerTitle.text;
    final double value = double.tryParse(_controllerValue.text);
    if (title != null && value != null) {
      final formBuilded = Signature(title, value);
      Navigator.pop(context, formBuilded);
    }
  }
}
