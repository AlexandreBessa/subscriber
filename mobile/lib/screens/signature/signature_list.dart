import 'package:flutter/material.dart';
import 'package:mobile/models/signature.dart';
import 'package:mobile/screens/signature/signature_form.dart';
import 'package:mobile/utils/services/signature_service.dart';
import 'package:mobile/widgets/centered_message.dart';
import 'package:mobile/widgets/progress.dart';

const _appBarTitle = 'Assinaturas';

class SignatureList extends StatelessWidget {
  final SignatureService _webClient = SignatureService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: FutureBuilder<List<Signature>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Signature> signatures = snapshot.data;
                if (signatures.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Signature signature = signatures[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            signature.title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            signature.value.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: signatures.length,
                  );
                }
              }
              return CenteredMessage(
                'No transactions found',
                icon: Icons.warning,
              );
              break;
          }

          return CenteredMessage('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SignatureForm()),
          );
        },
      ),
    );
  }
}
