import 'dart:convert';
import 'package:cookpro/getKeys.dart';
import 'package:cookpro/models/hits.dart';
import 'package:http/http.dart' as http;

class Recipie {
  List<Hits> hits = [];

  Future<void> getReceipe() async {
    String url =
        "https://api.edamam.com/search?q=banana&app_id=$applicationID&app_key=$applicationKey";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element) {
      Hits hits = Hits(
        recipeModel: element['recipe'],
      );
      // hits.recipeModel = add(Hits.fromMap(hits.recipeModel));
    });
  }
}