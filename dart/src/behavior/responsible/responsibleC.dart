abstract class Handler {
  Handler successor = null;

  set Successor(Handler successor) {
    this.successor = successor;
  }

  void handle() {
    doHandle();
    if (successor != null) {
      successor.handle();
    }
  }

  doHandle();
}

class HandlerA extends Handler {
  @override
  doHandle() {
    print("A");
  }
}

class HandlerB extends Handler {
  @override
  doHandle() {
    print("B");
  }
}

class HandlerChain {
  Handler _head = null;
  Handler _tail = null;

  addHandler(Handler handler) {
    handler.Successor = null;
    if (_head == null) {
      _head = handler;
      _tail = handler;
      return;
    }

    _tail.Successor = handler;
    _tail = handler;
  }

  void handle() {
    if (_head != null) {
      _head.handle();
    }
  }
}

void main() {
  HandlerChain chain = new HandlerChain();
  chain.addHandler(HandlerA());
  chain.addHandler(HandlerB());
  chain.handle();
}
