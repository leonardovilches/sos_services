import 'package:dio/dio.dart';
import 'package:sos_services/models/address.dart';
import 'package:sos_services/models/city.dart';
import 'package:sos_services/repositories/ibge_repository.dart';

class CepRepository {
  Future<Address> getAddressFromApi(String cep) async {
    if (cep == null || cep.isEmpty) return Future.error('CEP inválido.');

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) return Future.error('CEP inválido.');

    final endpoint = 'http://viacep.com.br/ws/$clearCep/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey('erro') && response.data['erro'])
        return Future.error('CEP Inválido.');

      final ufList = await IBGERepository().getUFList();

      return Address(
        cep: response.data['cep'],
        district: response.data['bairro'],
        city: City(name: response.data['localidade']),
        uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']),
      );
    } catch (e) {
      Future.error('Falha ao buscar CEP');
    }
  }
}
