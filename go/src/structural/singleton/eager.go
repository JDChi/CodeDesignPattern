package singleton

// 饿汉式
// 在创建对象时，不判断创建对象是否为空，直接创建对象。
// 它是并发安全的，唯一的缺点是在导入包的同时会创建对象，并且持续存储于内存中。
type eagerSingleton struct {
}

var eagerInstance *eagerSingleton

func init() {
	if eagerInstance == nil {
		eagerInstance = new(eagerSingleton)
	}
}

func GetEagerInstance() *eagerSingleton {
	return eagerInstance
}
