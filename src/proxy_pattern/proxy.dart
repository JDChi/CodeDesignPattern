import '../bean/user_vo.dart';
import 'i_user_controller.dart';

/// 代理模式（Proxy Design Pattern）
///
/// 在不改变原始类（或叫被代理类）代码的情况下，通过引入代理类来给原始类附加功能。
///
/// 常用在业务系统中开发一些非功能性需求，比如：监控、统计、鉴权、限流、事务、幂等、日志。

class UserController implements IUserController {
  @override
  UserVo login(String phone, String pwd) {
    // 登录账户
    return null;
  }

  @override
  UserVo register(String phone, String pwd) {
    // 注册账户
    return null;
  }
}

class UserControllerProxy implements IUserController {
  UserController _userController;

  UserControllerProxy(UserController userController) {
    this._userController = userController;
  }

  @override
  UserVo login(String phone, String pwd) {
    UserVo userVo = _userController.login(phone, pwd);
    // 添加其它逻辑
    return userVo;
  }

  @override
  UserVo register(String phone, String pwd) {
    UserVo userVo = _userController.register(phone, pwd);
    // 添加其它逻辑
    return userVo;
  }
}

void main() {
  IUserController userController =
      new UserControllerProxy(new UserController());
}


