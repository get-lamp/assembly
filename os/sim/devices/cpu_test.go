package devices

import "testing"

func TestCPU(t *testing.T) {
	cpu := NewCPU()

	if cpu.AX != 0 {
		t.Errorf("Expected AX to be 0, got %d", cpu.AX)
	}

}
