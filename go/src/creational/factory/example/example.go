package main

import "fmt"

// 同一家工厂生产不同品牌的服装

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

type Anta struct {
	clothes
}

func newAnta() IClothes {
	return &Anta{
		clothes: clothes{
			name: "ANTA",
			size: 4,
		},
	}
}

func MakeClothes(clothesType string) (IClothes, error) {
	if clothesType == "ANTA" {
		return newAnta(), nil
	}
	if clothesType == "PEAK" {
		return newPeak(), nil
	}

	return nil, fmt.Errorf("wrong clothes type passed")
}

func main() {
	ANTA, _ := MakeClothes("ANTA")
	PEAK, _ := MakeClothes("PEAK")

	printDetail(ANTA)
	printDetail(PEAK)

}

func printDetail(c IClothes) {
	fmt.Printf("Clothes: %s", c.GetName())
	fmt.Println()
	fmt.Printf("Size: %d", c.GetSize())
	fmt.Println()

}
