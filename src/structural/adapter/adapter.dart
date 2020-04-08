/// 将不兼容的接口转换为可兼容的接口，让原本由于接口不兼容而不能一起工作的类可以一起工作。
///
/// 适配器模式有两种实现方式：类适配器和对象适配器。

/* 使用判断标准
 1. Adaptee 接口的个数
 2. Adaptee 和 ITarget 的契合程度

 - 如果 Adaptee 接口并不多，那两种实现方式都可以。
 - 如果 Adaptee 接口很多，而且 Adaptee 和 ITarget 接口定义大部分都相同，
 那我们推荐使用类适配器，因为 Adaptor 复用父类 Adaptee 的接口，
 比起对象适配器的实现方式，Adaptor 的代码量要少一些。
 - 如果 Adaptee 接口很多，而且 Adaptee 和 ITarget 接口定义大部分都不相同，
 那我们推荐使用对象适配器，因为组合结构相对于继承更加灵活。
 */

/// 类适配器: 基于继承
abstract class ITarget {
  void f1();

  void f2();

  void fc();
}

class Adaptee {
  void fa() {}

  void fb() {}

  void fc() {}
}

class Adaptor extends Adaptee implements ITarget {
  @override
  void f1() {
    super.fa();
  }

  @override
  void f2() {
    // 重新实现f2()
  }

// 这里fc()不需要实现，直接继承自Adaptee，这是跟对象适配器最大的不同点
}

/// 对象适配器：基于组合
class NewAdaptor implements ITarget {
  Adaptee _adaptee;

  NewAdaptor(Adaptee adaptee) {
    _adaptee = adaptee;
  }

  @override
  void f1() {
    _adaptee.fa();
  }

  @override
  void f2() {
    // 重新实现f2
  }

  @override
  void fc() {
    _adaptee.fc();
  }
}


