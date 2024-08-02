package devices

type Register uint8
type Address uint16
type Data uint8

type CPU struct {
	AX Register
	BX Register
	CX Register
	CP Address
	SP Address
}

func NewCPU() *CPU {
	return &CPU{}
}

func (cpu *CPU) Reset() {
	cpu.AX = 0
	cpu.BX = 0
	cpu.CX = 0
	cpu.CP = 0
	cpu.SP = 0
}

func (cpu *CPU) Run() {

}
