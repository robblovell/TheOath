echo "Android Version: "
aapt dump badging ../build/app/outputs/apk/release/app-release.apk | grep package
echo "iOS Version: "
tar -zxvOf ../build/ios/outputs/ipa/Runner.ipa Payload/Runner.app/Info.plist | plutil  -convert xml1 -r -o - -- - | grep -A 1 CFBundleShortVersionString
tar -zxvOf ../build/ios/outputs/ipa/Runner.ipa Payload/Runner.app/Info.plist | plutil  -convert xml1 -r -o - -- - | grep -A 1 CFBundleVersion
