import 'package:http/http.dart' as http;
import 'package:test_provider/Models/information.dart';

abstract class _Informationservice {
  Future<List<Information>> getInformation();
}

class Informationservice implements _Informationservice {
  @override
  Future<List<Information>> getInformation() async {
    // TODO: implement getInformation

    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    try {
      var response = await http.get(url).timeout(const Duration(seconds: 10));
      if(response.statusCode == 200){
        return informationFromJson(response.body);
      }
      else{
        //ตอบรับมาเเล้วเเต่ไม่ได้!
        return null;
      }

    } catch (e) {
      print("ERROR");
      return null;
    }
    //print(response.body);
  }
}
