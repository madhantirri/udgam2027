#!/bin/bash
set -e

echo "=== Installing Flutter SDK ==="
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter
fi

export PATH="$PWD/flutter/bin:$PATH"

echo "=== Checking Flutter version ==="
flutter --version

echo "=== Building Flutter Web for Release ==="
flutter config --no-analytics
flutter pub get
flutter build web --release

echo "=== Flutter Web Build Complete ==="
