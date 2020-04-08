/// 1. 装饰器类和原始类继承同样的父类，这样我们可以对原始类“嵌套”多个装饰器类。
/// 2. 装饰器类是对功能的增强

abstract class InputStream {
  //...
  int read(int data) {
    return 1;
  }
}

class FileInputStream extends InputStream {
  InputStream inputStream;

  FileInputStream(String source);

  BufferedInputStream(InputStream inputStream) {
    this.inputStream = inputStream;
  }

//...实现基于缓存的读数据接口...
}

class BufferedInputStream extends InputStream {
  InputStream inputStream;

  BufferedInputStream(InputStream inputStream) {
    this.inputStream = inputStream;
  }

//...实现基于缓存的读数据接口...
}

class DataInputStream extends InputStream {
  InputStream inputStream;

  DataInputStream(InputStream inputStream) {
    this.inputStream = inputStream;
  }

//...实现读取基本类型数据的接口
}

void main() {
  InputStream inputStream = new FileInputStream("/user/wangzheng/test.txt");
  InputStream bin = new BufferedInputStream(inputStream);
  DataInputStream din = new DataInputStream(bin);
}
