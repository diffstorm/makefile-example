# makefile-example

[![Build Status](https://github.com/diffstorm/makefile-example/actions/workflows/c-cpp.yml/badge.svg)](https://github.com/diffstorm/makefile-example/actions)
[![License](https://img.shields.io/github/license/diffstorm/makefile-example)](https://github.com/diffstorm/makefile-example/blob/main/LICENSE)
[![Language](https://img.shields.io/github/languages/top/diffstorm/makefile-example)](https://github.com/diffstorm/makefile-example)

Reusable example Makefile for C/C++ projects

This is an example project that demonstrates a simple C++ project structure with some modules written in C using a Makefile.

## Directory Structure

- `src`: Contains the `.cpp` and `.c` source files.
- `include`: Contains the `.hpp` and `.h` header files.
- `bin`: The output directory for the compiled binary.
- `build`: The directory for object files.

```
makefile-example/
+-- src/
¦   +-- main.cpp
¦   +-- utils/
¦   ¦   +-- utils.c
¦   +-- helper.cpp
+-- include/
¦   +-- utils/
¦   ¦   +-- utils.h
¦   +-- helper.hpp
+-- bin/
+-- build/
+-- Makefile
```

## Usage

1. Ensure you have `gcc` and `g++` installed.
2. Run `make` to build the project.
3. The executable will be created in the `bin/` directory.
4. Run `make run` to run the executable.
5. Run `make clean` to remove the built files.

```sh
$ git clone https://github.com/diffstorm/makefile-example.git
$ cd makefile-example

$ make -j4
mkdir -p build/utils/
mkdir -p build/
mkdir -p build/
gcc -Iinclude -O1 -Wall -c src/utils/utils.c -o build/utils/utils.o
g++ -Iinclude -O1 -Wall -c src/helper.cpp -o build/helper.o
g++ -Iinclude -O1 -Wall -c src/main.cpp -o build/main.o
g++ -Iinclude -O1 -Wall -o bin/project build/utils/utils.o build/helper.o build/main.o -lm

$ make run
Hello from C++ code!
This is a helper function from C++ code.
This is a utility function from C code.

$ make clean
rm -f -r build bin/project
```
