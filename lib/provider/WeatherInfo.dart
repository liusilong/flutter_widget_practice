class WeatherInfo {
  String _tempType = "celcius";
  int _temperatureVal = 25;

  int get temperatureVal => _temperatureVal;

  String get temperatureType => _tempType;

  set temperature(int newTemp) {
    _temperatureVal = newTemp;
  }

  set temperatureType(String newType) {
    _tempType = newType;
  }
}
