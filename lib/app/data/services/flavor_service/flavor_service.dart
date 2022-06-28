import 'package:flutter_flavor/flutter_flavor.dart';

class FlavorService{
  static getVariable(String key){
    return FlavorConfig.instance.variables[key];
  }
}