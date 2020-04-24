abstract class IHandler {
  bool handle();
}

class HandlerA implements IHandler {
  @override
  bool handle() {
    bool handled = false;
    print("A");
    return handled;
  }
}

class HandlerB implements IHandler {
  @override
  bool handle() {
    bool handled = false;
    print("B");
    return handled;
  }
}

class HandlerChain {
  List<IHandler> _handlers = new List();

  addHandler(IHandler handler) {
    _handlers.add(handler);
  }

  handle() {
    for (IHandler handler in _handlers) {
      bool handled = handler.handle();
      if (handled) {
        break;
      }
    }
  }
}

void main() {
  HandlerChain chain = new HandlerChain();
  chain.addHandler(HandlerA());
  chain.addHandler(HandlerB());
  chain.handle();
}
