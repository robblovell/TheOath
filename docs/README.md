brew tap dart-lang/dart
brew install dart
brew info dart
brew switch dart 2.9.3
dartanalyzer --options analysis_options.yaml .

Publishing:

make sure your gradle version is up to date in /android/gradle/wrapper/gradle-wrapper.properties:
```
distributionUrl=https\://services.gradle.org/distributions/gradle-6.6.1-all.zip
```

Note that "lanes" are named keys in the "Fastlane" file in the fastlane directory
of each of the target platform directories (android, ios, web). 

Android:

bundle update
bundle exec fastlane add_plugin firebase_app_distribution


export GRADLE_APK_OUTPUT_PATH=/Users/robblovell/Code/original/theprotestersoath/build/app/outputs/flutter-apk/

        firebase_app_distribution(
            apk_path: "../build/app/outputs/apk/release/app-release.apk",
            app: "1:111371745959:android:5665648e6e1b1bd98bb982",
            testers: "robblovell@gmail.com",  # "/path/to/testers.txt"
            release_notes: "First release"  # "/path/to/release-notes.txt"
        )


install firebase cli: 

curl -sL https://firebase.tools | bash 


genreate ipa:
https://gist.github.com/monmonja/6e2910ca51d64b8be8bb8d28d0d34a55

flutter build appbundle --target-platform android-arm,android-arm64


#### To Login to do the authentication: 

firebase login:ci
This takes you to a login flow which generates a token.
setenv $FIREBASE_TOKEN=...

#### To release android:

bundle exec fastlane run firebase_app_distribution_login
export FIREBASE_TOKEN=...
bundle exec fastlane distribute


#### To release ios: 


