// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

	@2
	M=0

	@0
	D=M
	@x
	M=D	// x=R0

	@1
	D=M
	@y
	M=D	// y=R0

	(LOOP)
	@x
	D=M
	@END
	D; JLE	// if(x<=0) Goto END

	@y
	D=M
	@R2
	M=D+M	// R2=R2+y

	@1
	D=A
	@x
	M=M-D	// x=x-1

	@LOOP
	0; JMP	// Goto LOOP

	(END)
	@END
	0; JMP