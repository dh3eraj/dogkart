import 'package:dio/dio.dart';
import 'package:dogkart/model/random_dog.dart';
import 'package:dogkart/res/string/api_strings.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// Random Dog ///
  @GET(ApiStrings.randomDog)
  Future<RandomDog> getRandomDog();
}
