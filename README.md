# testing_app

Testing examples (unit, widget, and integration)

## Run Android instrumentation tests

```bash
$ cd android

$ ./gradlew app:connectedAndroidTest -Ptarget=`pwd`/../integration_test/counter_test.dart
```

## Run iOS 

## Run on iOS Simulator (flutter drive)

```bash
$ flutter emulators --launch ios
$ flutter drive \
 --device-id=iphone \
 --driver=test_driver/integration_test_driver.dart \
 --target=integration_test/counter_test.dart
```

## Run on Android Emulator (flutter drive)

```
$ flutter emulators --launch android

$ flutter drive \
 --device-id=emulator \
 --driver=test_driver/integration_test_driver.dart \
 --target=integration_test/counter_test.dart
```

## Run in Chrome

Install Chromedriver ([download
here](https://chromedriver.chromium.org/downloads) or `brew install
chromedriver`)

In one shell, run:

```bash
$ chromedriver --port 4444
```

Then, in another shell, run:

```bash
$ flutter drive \
  --driver=test_driver/integration_test_driver.dart \
  --target=integration_test/counter_test.dart \
  -d chrome    
```
