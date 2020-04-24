abstract class Handler {
  Handler _successor = null;

  set successor(Handler successor) {
    this._successor = successor;
  }

  handle();
}

class HandlerA extends Handler {
  @override
  handle() {
    bool handled = false;
    if (!handled && _successor != null) {
      print("A");
      _successor.handle();
    }
  }
}

class HandlerB extends Handler {
  @override
  handle() {
    bool handled = false;
    if (!handled && _successor != null) {
      print("B");
      _successor.handle();
    }
  }
}

class HandlerChain {
  Handler _head = null;
  Handler _tail = null;

  addHandler(Handler handler) {
    handler.successor = null;
    if (_head == null) {
      _head = handler;
      _tail = handler;
      return;
    }

    _tail.successor = handler;
    _tail = handler;
  }

  handle() {
    if (_head != null) {
      _head.handle();
    }
  }
}

void main() {
  HandlerChain chain = new HandlerChain();
  chain.addHandler(new HandlerA());
  chain.addHandler(new HandlerB());
  chain.handle();
}
