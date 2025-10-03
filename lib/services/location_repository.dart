import 'dart:convert'as convert;
import 'package:http/http.dart' as http;
import 'package:sisutaxi/model/placeModel.dart';
import 'package:sisutaxi/model/searchModel.dart';

import '../consts/app_const.dart';

class LocationRepository {

  Future<SearchModel> getAutoCompletedLocation(String input, double lat, double lng)async{
    String request = '${AppConst.baseURLAutoComplete}?input=$input&key=${AppConst.googleMapApiKey}&components=country:fi';

    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      return SearchModel.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<PlaceModel> getAutoCompletedPlaceID(String input)async{
    String request = '${AppConst.baseURLAutoCompletePlaceID}?place_id=$input&key=${AppConst.googleMapApiKey}';

    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      return PlaceModel.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Fail to load data');
    }
  }

}
