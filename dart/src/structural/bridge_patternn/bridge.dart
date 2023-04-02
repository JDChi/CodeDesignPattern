import 'dart:html';

/// 桥接模式的定义是“将抽象和实现解耦，让它们可以独立变化”。
///
/// 这个例子主要是一个发送警告，不同级别的警告采取不同的措施
/// 这样可以警告的独立变化，发送消息的也可以独立变化，然后将两者组合在一起
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
