# LibPDFium
- removed v8 and xfa codes

## Prerequisites

- Win10 with ubuntu subsystem.
  -  NDK 21.0.6113669
- Or just android studio using cmake. 

## Building the code

- Run `./build.sh` . Make sure the path in the script is correct.
- Or compile and use everything with cmake in the android studio .

## Benchmarks
Materials : 
1. An Android-9 devide.
2. Sample PDF File ( Gpu Pro 1.pdf )

Source Code:  
- https://github.com/KnIfER/PDFium-Android-Demo/blob/main/PDocViewer/src/main/java/com/knizha/PDocViewer/PDocBenchMarkctivity.java

Results:

- [A 7](https://github.com/KnIfER/LibPDFium/tree/a7316989543f2f030be7ad57f751fbdb3cf3a77b)
  - 470ms ( built using makefiles, -O3 )
- [A 11](https://github.com/KnIfER/LibPDFium/tree/b29471bfd7a2b5b83bc7c1e4889c6fd60bcd4117)
  - 570 ms ( built using makefiles, -O3 )
  - 40000 ms ( built using cmake, default no optimizations )
  - 700 ms ( built using cmake, -Os )
  - 570 ms ( built using cmake, -O3 )

## Demo Application

see [PDFium Android Demo](https://github.com/KnIfER/PDFium-Android-Demo)

