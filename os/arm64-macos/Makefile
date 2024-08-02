hello: hello.s
	@as -o hello.o hello.s && ld -macos_version_min 14.0.0 -o hello hello.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 

ascii: ascii.s 
	@as -o ascii.o ascii.s && ld -macos_version_min 14.0.0 -o ascii ascii.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 

run-hello: hello
	@./hello

run-ascii: clean ascii 
	@./ascii

clean:
	@rm ascii.o > /dev/null 2>&1 || true
	@rm ascii > /dev/null 2>&1 || true
