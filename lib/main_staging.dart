import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'app/application.dart';
import 'app/data/services/config/flavor_service_variables.dart';

void main(){
  FlavorConfig(
      variables: {
        FlavorServiceVariables.baseUrl: "https://www.example-staging.com",
      }
  );
  runApp(const Application());
}
