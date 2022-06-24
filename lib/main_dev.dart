import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'app/application.dart';

void main(){
  FlavorConfig(
      variables: {
        "baseUrl": "https://www.example-develop.com",
      }
  );
  runApp(const Application());
}