package singleton

import "sync"

// 懒汉式
// 在创建对象时，不直接创建对象，在加载配置文件时才创建对象
type lazySingleton struct {
	value int
}

var lazyInstance *lazySingleton

func GetLazyInstance() *lazySingleton {
	if lazyInstance == nil {
		lazyInstance = new(lazySingleton)
	}
	return lazyInstance
}

var lazyMutex sync.Mutex

// 使用加锁，保证协程并发安全
func getLazyInstance1() *lazySingleton {
	lazyMutex.Lock()
	defer lazyMutex.Lock()
	if lazyInstance == nil {
		lazyInstance = new(lazySingleton)
	}
	return lazyInstance
}
