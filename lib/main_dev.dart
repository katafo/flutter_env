import 'package:flutter/material.dart';

import 'app.dart';
import 'flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev, 
    values: FlavorValues(baseUrl: 'https://dev.abc.com/api')
  );
  runApp(MyApp());
}