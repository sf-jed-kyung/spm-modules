#!/bin/sh

set -e

echo "SPMUIKit.xcframework.zip"
swift package compute-checksum /Users/jedgyeong/temp/SPMTest/xcframeworks/SPMUIKit.xcframework.zip

echo "SPMTemplate.xcframework.zip"
swift package compute-checksum /Users/jedgyeong/temp/SPMTest/xcframeworks/SPMTemplate.xcframework.zip
