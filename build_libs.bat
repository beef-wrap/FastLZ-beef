mkdir libs
mkdir libs\debug
mkdir libs\release

clang -c -g -gcodeview -o fastlz.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall FastLZ\fastlz.c
move fastlz.lib libs\debug

clang -c -O3 -o fastlz.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall FastLZ\fastlz.c
move fastlz.lib libs\release