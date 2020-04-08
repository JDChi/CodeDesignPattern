abstract class IUserController {
  UserVo login(String phone, String pwd);

  UserVo register(String phone, String pwd);
}

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
    return userVo;
  }

  @override
  UserVo register(String phone, String pwd) {
    UserVo userVo = _userController.register(phone, pwd);
    return userVo;
  }
}

void main() {
  IUserController userController =
      new UserControllerProxy(new UserController());
}

class UserVo {}
