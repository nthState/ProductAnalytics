#!/bin/sh
echo "Starting Product Analytics Build"
SRC="${BUILD_DIR%Build/*}/SourcePackages/checkouts/ProductAnalytics"
cd $SRC
swift build
echo "Build Complete"
echo "Try to run: .build/x86_64-apple-macosx/${CONFIGURATION:lower}/ProductAnalytics"
.build/x86_64-apple-macosx/debug/ProductAnalytics