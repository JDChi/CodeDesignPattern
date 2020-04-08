import '../bean/user_vo.dart';
import 'proxy.dart';

///对于原始类没有定义接口的，一般使用继承方式
class UserControllerProxy extends UserController{

  UserVo login(String phone, String pwd) {
    UserVo userVo = super.login(phone, pwd);
    // 添加其它逻辑
    return userVo;
  }


  UserVo register(String phone, String pwd) {
    UserVo userVo = super.register(phone, pwd);
    // 添加其它逻辑
    return userVo;
  }
}

void main(){
  UserController userController = new UserControllerProxy();
}