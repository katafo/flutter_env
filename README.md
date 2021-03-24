# flutter_env

Create flavor in Flutter.

## Android

1. Open android/app/build.gradle, input code below buildTypes:

```
flavorDimensions "flavors"
productFlavors {
dev {
    dimension "flavors"
    applicationIdSuffix ".dev"
    versionNameSuffix "-dev"
}
stag {
    dimension "flavors"
    applicationIdSuffix ".stag"
    versionNameSuffix "-stag"
}
prod {
    dimension "flavors"
}
```

## iOS

1. Create Dev.xcconfig, Prod.xcconfig, Staging.xcconfig. All these files will inherit from Generated.xcconfig

```
#include "Generated.xcconfig"
FLUTTER_TARGET=lib/main_dev.dart
```

Each file will point to each target. 
Ex: 
    dev -> main_dev.dart
    prod -> main_prod.dart
    ...

2. Create configurations for each env:

Debug: -dev, -stag, -prod
Profile: -dev, -stag, -prod
Release: -dev, -stag, -prod

![alt text](https://github.com/katafo/flutter_env/blob/master/screenshot/1-create-configs.png)

3. Create new scheme for each env: dev, stag, prod.

![alt text](https://github.com/katafo/flutter_env/blob/master/screenshot/2-create-scheme.png)

Note:

Name of schemes and configuration must be same. 
Flutter will auto select: Debug-dev, Debug-stag... from configuration when you run command:
flutter run --flavor dev -t lib/main_dev.dart

4. Edit scheme, change build configuration -> -dev, -stag, -prod.

![alt text](https://github.com/katafo/flutter_env/blob/master/screenshot/3-edit-scheme.png)

5. Open buid settings, Search "Product Bundle Identifier", edit bundle id for each env:

![alt text](https://github.com/katafo/flutter_env/blob/master/screenshot/4-edit-bundle-id.png)

# Flavor

1. Create flavor_config.dart file:

```
import 'package:flutter/material.dart';

enum Flavor { 
  dev, 
  staging,
  production 
}

class FlavorValues {
  FlavorValues({@required this.baseUrl});
  final String baseUrl;
}

class FlavorConfig {
  
  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig instance;

  factory FlavorConfig({ 
    @required Flavor flavor,
    @required FlavorValues values
  }) {
    instance ??= FlavorConfig._internal(flavor, values);
    return instance;
  }

  FlavorConfig._internal(this.flavor, this.values);

}
```

2. Create 3 file: main_dev.dart, main_stag.dart, main_prod.dart.

```
void main() {
  FlavorConfig(
    flavor: Flavor.dev, 
    values: FlavorValues(baseUrl: 'https://dev.abc.com/api')
  );
  runApp(App());
}
```

3. Run project with following command:

flutter run --flavor dev -t lib/main_dev.dart
