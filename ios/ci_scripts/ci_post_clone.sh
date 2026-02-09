#!/bin/zsh
set -e   # Stop on any error

echo "=== Checking Flutter ==="

# 1️⃣ Try to use preinstalled Flutter first
if command -v flutter &> /dev/null; then
    echo "Flutter already installed at $(which flutter)"
else
    echo "Flutter not found. Installing Flutter..."
    # Clone Flutter stable version to $HOME/flutter
    git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
fi

# 2️⃣ Add Flutter to PATH
export PATH="$HOME/flutter/bin:$PATH"

echo "Flutter version:"
flutter --version

echo "=== Running flutter pub get ==="
flutter pub get

echo "=== Generating iOS files ==="
flutter build ios --release --no-codesign

echo "=== Installing CocoaPods ==="
cd ios

# Ensure CocoaPods is installed
if ! command -v pod &> /dev/null; then
    echo "CocoaPods not found. Installing..."
    brew install cocoapods
fi

pod install

echo "=== ci_post_clone.sh finished successfully ==="
