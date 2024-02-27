import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market/model/login_credential.dart';
import 'package:market/model/token.dart';
import 'package:retrofit/retrofit.dart';


part 'auth_service.g.dart';

@injectable
@RestApi()
abstract class AuthService{

  @factoryMethod
  factory AuthService(Dio dio,{@Named('baseUrl') String baseUrl})= _AuthService;


  @POST('auth/login')
  Future<Token> login(@Body() LoginCredential loginCredential);


}