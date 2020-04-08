import 'dart:html';

/// 桥接模式的定义是“将抽象和实现解耦，让它们可以独立变化”。
///
abstract class MsgSender {
  void send(String msg);
}

class TelephoneMsgSender implements MsgSender {
  List<String> _telephones;

  TelephoneMsgSender(List<String> telephones) {
    _telephones = telephones;
  }

  @override
  void send(String msg) {
    //
  }
}

class EmailMsgSender implements MsgSender {
  @override
  void send(String msg) {
    //
  }
}

class WeChatMsgSender implements MsgSender {
  @override
  void send(String msg) {
    //
  }
}

abstract class MyNotification {
  MsgSender msgSender;

  MyNotification(MsgSender msgSender) {
    this.msgSender = msgSender;
  }

  void notify(String msg);
}

class SevereNotification extends MyNotification {
  SevereNotification(MsgSender msgSender) : super(msgSender);

  @override
  void notify(String msg) {
    msgSender.send(msg);
  }
}

class UrgencyNotification extends MyNotification {
  UrgencyNotification(MsgSender msgSender) : super(msgSender);

  @override
  void notify(String msg) {
    msgSender.send(msg);
  }
}

class NormalNotification extends MyNotification {
  NormalNotification(MsgSender msgSender) : super(msgSender);

  @override
  void notify(String msg) {
    msgSender.send(msg);
  }
}
