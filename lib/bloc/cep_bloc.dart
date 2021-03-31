import 'package:cepapp/bloc/base_bloc.dart';
import 'package:cepapp/data/repositories/cep_repository.dart';
import 'package:cepapp/data/services/cep_service.dart';
import 'package:cepapp/models/cep.dart';

class CepBloc extends BaseBloc<Cep> {

  CepRepository cepRepository;

  CepBloc() {
    cepRepository = CepRepository(CepService());
  }

  getCEP(String cep) async {
    try {
      var result = await cepRepository.getCEP(cep);
      Cep response = Cep.fromJson(result);
      add(response);
      return response;
    }catch (e) {
      return null;
    }
  }

}