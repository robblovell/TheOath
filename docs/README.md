# Protester's Oath

Proteter's Oath is built with Flutter which uses the Dart computer language. 
It currently deploys to Android and iOS on both large and small screens.
Future releases intend to include watch form factors.

## Pre development setup

You will need [Android Studio](https://developer.android.com/studio) or IntelliJ Ulitmate for development.

### Specific to iOS or Android

For Android, you will need [Java JDK 14](https://openjdk.java.net/) and Android (installed from android studio).

You can install emulators from the AVD manager in Android Studio.

For iOS, you will need XCode.

```shell script
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

You can also just get it from the app store. XCode comes with the simulator:

```shell script
open -a Simulator
```

### General Setup

[Dart installation](https://dart.dev/get-dart)

```shell script
brew tap dart-lang/dart
brew install dart
brew info dart
brew switch dart 2.9.3
dartanalyzer --options analysis_options.yaml .
```

[Flutter installation](https://flutter.dev/docs/get-started/install):

Download the latest version of [fluttter](https://flutter.dev/docs/get-started/install).
```shell script
cd ~/development
unzip ~/Downloads/flutter_macos_1.20.4-stable.zip
export PATH="$PATH:`pwd`/flutter/bin"
```
Put the export to the flutter executable in you .zshrc file.

Useful Flutter commands:
```shell script
flutter precache
flutter doctor
```

[firebase cli](https://firebase.google.com/docs/cli)

install firebase cli: 
```shell script
npm install -g firebase-tools
```
or
```shell script
curl -sL https://firebase.tools | bash
```

A project has been created in Firebase called "Protesters Oath". To have the application interact
with Firebase, two files are need to talk to firebase (these can be checked into source control)

```shell script
/android/app/google-services.json
/ios/Runner/GoogleService-info.plist
```

Instructions for obtaining these are part of the Firebase setup.

## Running

Generally, building occurs in one stream per device type (Android, iOS or Web). Generally, the commands
are all the same, but either you will be asked for the device type or you specify the device type on the
command line.

### Prep:
```shell script
sudo gem install cocoapods
```

### Using Flutter

With flutter commands, you will be asked for a device to run the application. This can be
an emulator or real device. There is no "build" command, only "run".  Fastlane (below) can
be used to build packages for publishing.

```shell script
flutter pub get
flutter run
```

You can also setup IDE based configruations from Android Studio or Ultimate IDE's. 

## Building, Distributing and Publishing

There is a path for publishing for each device type. Some shared tasks are required, but most of the paths
are device specific.

Common paths:
* Getting build information
* Bumping Versions
* Sending Notifications
* Testing

Separate Paths:
* Building
* Packaging
* Distribution
* Bundling
* Beta Publishing
* Live Publishing

### Using Fastlane

#### Install fastlane

Note that "lanes" are named keys in the "Fastlane" file in the fastlane directory
of each of the target platform directories (android, ios, web). 

Generally, if things go south, you can start from scratch by typing in the root of the project:

```shell script
flutter clean
```

Fastlane is installed twice in this project, once for Android and once for iOS.
TODO: install fastlane at root of project and make that work.
TODO: Releaseing is still a messy process with lots of manual steps. 
TODO: Secrets management & CI setup with GitHub Actions
TODO: 
**Android**
```shell script
cd android
brew install fastlane
fastlane init
bundle update
fastlane add_plugin firebase_app_distribution
```

**iOS**
```shell script
cd ios
brew install fastlane
fastlane init
```

Add to your .zshrc file:

```shell script
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

create a gemfile in each of the installations:
```coffeescript
source "https://rubygems.org"

gem "fastlane"
```

Setup for both
#### Getting Build Information:

Uses git to look at the branch, revNumber, commit sha and name of committer. 
TODO: Get the build number 
(I Haven't figured out why the pubspec.yaml file doesn't control build number.)

```shell script
fastlane info
```
#### Notifications:
Slack notifications require a secret to work. Get this from slack's
integration page. Look for Slack Web Hooks.
```shell script
export SLACK_HOOK={{env[SLACK_HOOK]}}
```
Notifications are used for all lanes.

#### Bumping Versions:
TODO::Bumping versions currently doesn't work
To bump version, edit the files:
* pubspec.yml and change the version: line. 1.0.3 is the semantic version and the +x is the build number.
* For Android: edit android/local.properties and modify flutter.versionCode to increase the build number. flutter.versionName is the semantic version.
* For iOS: edit the /ios/Flutter/Generated.xcconfig file and modify the FLUTTER_BUILD_NUMBER. The FLUTTER_BUILD_NAME is the semantic version

Make sure all version numbers all match. Generally, increment only the version code/build number for each build.
Increment semantic versions only on releases to stores starting with that release's ad-hoc distribution and testing cycle.

#### Testing:

TBD

#### Packaging:

**Android**:

All android builds are performed in the android directory. To build android APK for ad-hoc distribution, use:
```shell script
cd android
fastlane android build
```
This command builds an APK for android.
The output location is one directory up in the build directory of the project:

* /build/app/outputs/apk/[debug | release]/app-[debug | release].apk
* /ios/Runner.ipa

APK files genereated with this command will be debug builds, even if the files are named release.
Relases are signed with a release key that makes them releases.
TODO: figure out how to switch back to debug once the gradle files are modified for release (From debug mode)

**iOS**: 
```shell script
cd ios
fastlane ios build method:ad-hoc
```

This command builds an ipa file for iOS.

#### Distribution:

**Android**:
```shell script
fastlane run firebase_app_distribution_login
or
firebase login:ci
export FIREBASE_TOKEN=...
fastlane android tofirebase
```
**iOS**:
TODO: iOS app store authentication instructions
```shell script
fastlane ios totestflight
```
#### Bundling:

**Android**:
```shell script
fastlane android bundle
```
**iOS**:
```shell script
fastlane ios build method:app-store
```

#### Beta Publishing:
**Android**:
```shell script
fastlane android publish
```
**iOS**:
TODO: Setup instructions for app store publishing
```shell script
```

#### Live Publishing:
**Android**:
```shell script

```
**iOS**:
TODO: Setup instructions for app store publishing
```shell script
```

#### Summary of environment variables required for CI

files:
```shell script
~/.ssh/Google Play Android Developer.json
```
Secrets:
```shell script
export SLACK_HOOK=...
export FIREBASE_TOKEN=...
export FASTLANE_PASSWORD=... # Unsure if this is needed.
```
Non-Secrets:
```shell script
GOOGLE_APPLICATION_CREDENTIALS=
```

####  Changes from the inital flutter installation:

Make sure your gradle version is up to date in /android/gradle/wrapper/gradle-wrapper.properties:
```shell script
distributionUrl=https\://services.gradle.org/distributions/gradle-6.6.1-all.zip
```



## Unsorted notes

genreate ipa:
https://gist.github.com/monmonja/6e2910ca51d64b8be8bb8d28d0d34a55

flutter build appbundle --target-platform android-arm,android-arm64





