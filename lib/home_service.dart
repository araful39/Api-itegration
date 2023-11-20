import 'package:http/http.dart' as http;
class HomeService{

  Future <http.Response> getData()async{
    
   http.Response response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   return response;

  }

}