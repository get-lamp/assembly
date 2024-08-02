; as -o hello.o hello.s && ld -macos_version_min 14.0.0 -o hello hello.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 

.global _main
.align 2

_main:
    mov X0, #1
    adr X1, helloworld
    mov X2, #13
    mov X16, #4
    svc 0x80

    mov X0, #0
    mov X16, #1
    svc 0x80

helloworld: .ascii "Hello World!\n"