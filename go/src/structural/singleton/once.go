package singleton

import (
	"sync"
)

type OnceSingleton struct {
}

var onceInstance *OnceSingleton
var once sync.Once

func GetOnceInstance() *OnceSingleton {
	once.Do(func() {
		onceInstance = new(OnceSingleton)
	})
	return onceInstance
}
