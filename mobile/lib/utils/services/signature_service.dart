import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile/models/signature.dart';
import 'package:mobile/utils/webclient.dart';

class SignatureService {
  Future<List<Signature>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Signature.fromJson(json)).toList();
  }

  Future<Signature> save(Signature signature) async {
    final String signatureJson = jsonEncode(signature.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: signatureJson);

    return Signature.fromJson(jsonDecode(response.body));
  }
}
