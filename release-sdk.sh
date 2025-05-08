#!/bin/bash

set -e

# Конфигурация
SCHEME="JitsiMeetSDK"
WORKSPACE_PATH="ios/jitsi-meet.xcworkspace"
ARCHIVE_DIR="./archives"
OUTPUT_DIR="./build/ios/xcframework"

IOS_ARCHIVE_PATH="${ARCHIVE_DIR}/ios.xcarchive"
SIM_ARCHIVE_PATH="${ARCHIVE_DIR}/simulator.xcarchive"
XCFRAMEWORK_OUTPUT="${OUTPUT_DIR}/JitsiMeetSDK.xcframework"

echo "🧹 Cleaning previous builds..."
rm -rf "$ARCHIVE_DIR"
rm -rf "$OUTPUT_DIR"

echo "📦 Archiving for iOS (device)..."
xcodebuild archive \
  -workspace "$WORKSPACE_PATH" \
  -scheme "$SCHEME" \
  -sdk iphoneos \
  -configuration Release \
  -archivePath "$IOS_ARCHIVE_PATH" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "🧪 Archiving for iOS Simulator..."
xcodebuild archive \
  -workspace "$WORKSPACE_PATH" \
  -scheme "$SCHEME" \
  -sdk iphonesimulator \
  -destination "generic/platform=iOS Simulator" \
  -configuration Release \
  -archivePath "$SIM_ARCHIVE_PATH" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "🔍 Checking Swift modules..."

check_swift_modules() {
  local archive="$1"
  local framework_path="${archive}/Products/Library/Frameworks/JitsiMeetSDK.framework/Modules"

  if [ ! -d "$framework_path" ]; then
    echo "❌ Swift modules not found in: $framework_path"
    echo "💡 Make sure 'Build Library for Distribution' and 'Defines Module' are enabled in build settings."
    exit 1
  fi

  echo "✅ Swift modules found in: $framework_path"
}

check_swift_modules "$IOS_ARCHIVE_PATH"
check_swift_modules "$SIM_ARCHIVE_PATH"

echo "🛠 Creating .xcframework..."
xcodebuild -create-xcframework \
  -framework "$IOS_ARCHIVE_PATH/Products/Library/Frameworks/JitsiMeetSDK.framework" \
  -framework "$SIM_ARCHIVE_PATH/Products/Library/Frameworks/JitsiMeetSDK.framework" \
  -output "$XCFRAMEWORK_OUTPUT"

echo "✅ Success!"
echo "📦 XCFramework available at: $XCFRAMEWORK_OUTPUT"