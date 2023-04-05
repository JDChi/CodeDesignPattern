package factory

import "fmt"

// Factory 声明返回产品对象的工厂方法的接口，该方法返回的对象类型必须与产品接口类型相匹配
type Factory interface {
	FactoryMethod(owner string) Product
}

// ConcreteFactory 实现工厂接口的类，会重写基础工厂方法，使其返回不同类型的产品
type ConcreteFactory struct {
}

func (cf *ConcreteFactory) FactoryMethod(owner string) Product {
	p := &ConcreteProduct{}
	return p
}

// Product 声明产品方法的接口。对于所有由具体工厂类及其子类构建的对象，该接口是通用的
type Product interface {
	Use()
}

// ConcreteProduct 实现产品接口的类
type ConcreteProduct struct {
}

func (p *ConcreteProduct) Use() {
	fmt.Println("This is a concrete product")
}

func innerMain() {
	factory := ConcreteFactory{}
	product := factory.FactoryMethod("shirdon")
	product.Use()
}
