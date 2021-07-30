// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

	(LOOPSCREEN)
	@SCREEN
	D=A
	@R0
	M=D	// R0=ScreenMemory

/////////////////////////////////////////////////////////////////////////////////////////
	(LOOPKBD)
	@KBD
	D=M	// D=KeyBoardMemory

	@BLACK
	D; JNE	// If(D=!0) Goto BLACK

	@WHITE
	0;JMP	// Else go to WHITE

/////////////////////////////////////////////////////////////////////////////////////////
	(BLACK)
	@1
	M=-1	// R1=Black=(-1)
	
	@CHANGE
	0; JMP	// Jump to CHANGE

/////////////////////////////////////////////////////////////////////////////////////////
	(WHITE)
	@1
	M=0	// R1=White=0

	@CHANGE
	0; JMP	// Jump to CHANGE

/////////////////////////////////////////////////////////////////////////////////////////
	(CHANGE)
	@R1
	D=M	// D=Black=(-1) \ D=White=0

	@0
	A=M
	M=D	// Fill the screen
	
	@0
	D=M+1	// Inc the next pixel
	@KBD
	D=A-D	// A=KDB-Screen

	@0
	M=M+1	// Inc the next pixel
	A=M

	@CHANGE
	D; JGT	// If(A=0) Goto Exit {The whole screen is black}

/////////////////////////////////////////////////////////////////////////////////////////
	@LOOPSCREEN
	0; JMP