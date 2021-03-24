import 'package:flutter/material.dart';

import 'app.dart';
import 'flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production, 
    values: FlavorValues(baseUrl: 'https://prod.abc.com/api')
  );
  runApp(MyApp());
}