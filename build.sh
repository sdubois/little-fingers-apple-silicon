#!/bin/bash
# Builds a universal (Apple silicon + Intel) Little Fingers.app and copies it next to this script.
set -e
cd "$(dirname "$0")"
xcodebuild -project "Little Fingers.xcodeproj" -target "Little Fingers" \
  -configuration Release SYMROOT="$(pwd)/build" \
  ARCHS="arm64 x86_64" ONLY_ACTIVE_ARCH=NO \
  CODE_SIGN_IDENTITY="-" CODE_SIGNING_REQUIRED=NO DEVELOPMENT_TEAM="" \
  build
rm -rf "Little Fingers.app"
cp -R "build/Release/Little Fingers.app" .
lipo -archs "Little Fingers.app/Contents/MacOS/Little Fingers"
echo "Built: $(pwd)/Little Fingers.app"
