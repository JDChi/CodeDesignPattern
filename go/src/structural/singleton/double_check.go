package singleton

import "sync"

type doubleCheckSingleton struct {
}

var doubleCheckMutex sync.Mutex

var doubleCheckInstance *doubleCheckSingleton

func GetDoubleCheckInstance() *doubleCheckSingleton {
	if doubleCheckInstance == nil {
		doubleCheckMutex.Lock()
		defer doubleCheckMutex.Unlock()
		if doubleCheckInstance == nil {
			doubleCheckInstance = new(doubleCheckSingleton)
		}
	}
	return doubleCheckInstance
}
