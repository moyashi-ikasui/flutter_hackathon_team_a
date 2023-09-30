cd $(dirname $0)/../ios
rm -rf Pods
rm -rf Podfile.lock
flutter clean
flutter pub get
arch -x86_64 pod install
