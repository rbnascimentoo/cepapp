import 'package:cepapp/utils/constants/constants.dart';
import 'package:cepapp/utils/enums/type_rest.dart';
import 'package:cepapp/utils/service_http_utils.dart';

class CepService {

  Future<dynamic> getCEP(String cep) async {
    return await ServiceHttpUtil.callService(
        true,
        Constants.VIACEP_HOST,
        TypeRest.GET,
        Constants.CEP_JSON_FORMAT.replaceFirst('cep', cep)
    );

  }

}