abstract class IHandler {
  doHandle();
}

class HandlerA implements IHandler {
  @override
  doHandle() {
    print("A");
  }
}

class HandlerB implements IHandler {
  @override
  doHandle() {
    print("B");
  }
}

class HandlerChain {
  List<IHandler> _handlers = new List();

  addHandler(IHandler handler) {
    _handlers.add(handler);
  }

  handle() {
    for (IHandler handler in _handlers) {
      handler.doHandle();
    }
  }
}

void main() {
  HandlerChain chain = new HandlerChain();
  chain.addHandler(HandlerA());
  chain.addHandler(HandlerB());
  chain.handle();
}
