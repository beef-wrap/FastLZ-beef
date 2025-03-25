cmake -S . -B FastLZ/build -DCMAKE_BUILD_TYPE=Debug
cmake --build FastLZ/build --config Debug

cmake -S . -B FastLZ/build -DCMAKE_BUILD_TYPE=Release
cmake --build FastLZ/build --config Release