/// 适配模式的实际应用
/// 1. 封装有缺陷的接口设计
///
/// 假设我们依赖的外部系统在接口设计方面有缺陷（比如包含大量静态方法），
/// 引入之后会影响到我们自身代码的可测试性。为了隔离设计上的缺陷，
/// 我们希望对外部系统提供的接口进行二次封装，抽象出更好的接口设计，

/// 假设这个类来自外部sdk，无权修改这里的代码
class CD {
  static void uniqueCDFun1() {}

  void uniqueCDFun2() {}

  void uniqueCDFun3() {}
}

abstract class ITarget {
  void ownFun1();

  void ownFun2();

  void ownFun3();
}

class CDAdaptor extends CD implements ITarget {
  @override
  void ownFun1() {
    CD.uniqueCDFun1();
  }

  @override
  void ownFun2() {
    super.uniqueCDFun2();
  }

  @override
  void ownFun3() {
    super.uniqueCDFun3();
  }
}

/// 2. 统一多个类的接口设计

class ASensitiveWordsFilter {
  String filterSexyWords(String text) {}

  String filterPoliticalWords(String text) {}
}

class BSensitiveWordsFilter {
  String filter(String text) {}
}

class CSensitiveWordsFilter {
  String filter(String text, String mask) {}
}

// 未使用适配器模式之前的代码：代码的可测试性、扩展性不好
class RiskManagement {
  ASensitiveWordsFilter _aFilter = new ASensitiveWordsFilter();
  BSensitiveWordsFilter _bFilter = new BSensitiveWordsFilter();
  CSensitiveWordsFilter _cFilter = new CSensitiveWordsFilter();

  String filterSensitiveWords(String text) {
    String maskedText = _aFilter.filterSexyWords(text);
    maskedText = _aFilter.filterPoliticalWords(maskedText);
    maskedText = _bFilter.filter(maskedText);
    maskedText = _cFilter.filter(maskedText, "***");
    return maskedText;
  }
}

// 使用适配器模式进行改造
abstract class ISensitiveWordsFilter {
  String filter(String text);
}

class ASensitiveWordsFilterAdaptor implements ISensitiveWordsFilter {
  ASensitiveWordsFilter _aFilter;

  @override
  String filter(String text) {
    String maskedText = _aFilter.filterSexyWords(text);
    maskedText = _aFilter.filterPoliticalWords(text);
    return maskedText;
  }
}

class BSensitiveWordsFilterAdaptor implements ISensitiveWordsFilter {
  BSensitiveWordsFilter _bFilter;

  @override
  String filter(String text) {
    String maskedText = _bFilter.filter(text);
    return maskedText;
  }
}

class MyRiskManagement {
  List<ISensitiveWordsFilter> filters = new List();

  void addSensitiveWordsFilter(ISensitiveWordsFilter filter) {
    filters.add(filter);
  }

  String filterSensitiveWords(String text) {
    String maskedText = text;
    for (ISensitiveWordsFilter filter in filters) {
      maskedText = filter.filter(maskedText);
    }
    return maskedText;
  }
}

/// 3. 替换依赖的外部系统
abstract class IA {
  void fa();
}

class A implements IA {
  @override
  void fa() {
    // TODO: implement fa
  }
}

class Demo {
  IA _a;

  Demo(IA a) {
    _a = a;
  }
}

void main() {
  Demo d = new Demo(new A());
}

class B {
  void fb() {}
}

class BAdaptor implements IA {
  B _b;
  BAdaptor(B b){
    _b = b;
  }
  @override
  void fa() {
    _b.fb();
  }
}

// 借助BAdaptor，Demo的代码中，调用IA接口的地方都无需改动，
// 只需要将BAdaptor如下注入到Demo即可。
void main1(){
  Demo d = new Demo(new BAdaptor(new B()));
}
