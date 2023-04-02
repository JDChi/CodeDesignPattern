package factory

import "fmt"

type IClothes interface {
	setName(name string)
	setSize(size int)
	GetName() string
	GetSize() int
}

type clothes struct {
	name string
	size int
}

func (c *clothes) setName(name string) {
	c.name = name
}

func (c *clothes) setSize(size int) {
	c.size = size
}

func (c *clothes) GetName() string {
	return c.name
}

func (c *clothes) GetSize() int {
	return c.size
}

type Peak struct {
	clothes
}

func newPeak() IClothes {
	return &Peak{
		clothes: clothes{
			name: "PEAK",
			size: 1,
		},
	}
}

type ANTA struct {
	clothes
}

func newANTA() IClothes {
	return &ANTA{
		clothes: clothes{
			name: "ANTA",
			size: 4,
		},
	}
}

func MakeClothes(clothesType string) (IClothes, error) {
	if clothesType == "ANTA" {
		return newANTA(), nil
	}
	if clothesType == "PEAK" {
		return newPeak(), nil
	}

	return nil, fmt.Errorf("wrong clothes type passed")
}
