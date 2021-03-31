import 'package:cepapp/data/services/cep_service.dart';

class CepRepository {

  final CepService cepService;

  CepRepository(this.cepService);

  Future<dynamic> getCEP(String cep) async {
    return await cepService.getCEP(cep);
  }

}