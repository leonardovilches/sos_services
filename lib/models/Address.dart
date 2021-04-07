import 'package:sos_services/models/uf.dart';

import 'city.dart';

class Address {
  Address({this.uf, this.city, this.cep, this.district});

  UF uf;
  City city;

  String cep;
  String district;

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, cep: $cep, district: $district}';
  }
}
