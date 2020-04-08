import '../bean/user_vo.dart';

abstract class IUserController {
  UserVo login(String phone, String pwd);

  UserVo register(String phone, String pwd);
}