#!/bin/bash
set -e
cd "$(dirname "$0")"
APP="Taller de Traducción.app"
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
swiftc main.swift -o "$APP/Contents/MacOS/launch" -framework Cocoa -framework WebKit
iconutil -c icns AppIcon.iconset
cp AppIcon.icns "$APP/Contents/Resources/"
cp taller-de-traduccion.html "$APP/Contents/Resources/"
cat > "$APP/Contents/Info.plist" << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleExecutable</key><string>launch</string>
<key>CFBundleIconFile</key><string>AppIcon</string>
<key>CFBundleIdentifier</key><string>com.cameronhubbard.taller-de-traduccion</string>
<key>CFBundleName</key><string>Taller de Traducción</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleVersion</key><string>1.0</string>
<key>LSMinimumSystemVersion</key><string>10.15</string>
<key>NSHighResolutionCapable</key><true/>
</dict></plist>
PLIST
xattr -cr "$APP"
rm -f main.swift AppIcon.icns
rm -rf AppIcon.iconset
echo "Built: $APP"
