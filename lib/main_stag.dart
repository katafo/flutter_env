import 'package:flutter/material.dart';

import 'app.dart';
import 'flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.staging, 
    values: FlavorValues(baseUrl: 'https://stag.abc.com/api')
  );
  runApp(MyApp());
}