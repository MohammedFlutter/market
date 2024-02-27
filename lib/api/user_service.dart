import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market/model/user_info.dart';
import 'package:retrofit/retrofit.dart';
part 'user_service.g.dart';

@injectable
@RestApi()
abstract class UserService{
  @factoryMethod
  factory UserService(Dio dio,{@Named('baseUrl') String baseUrl})=_UserService;

  @GET('user/me')
  Future<UserInfo> getUserInfo();


}