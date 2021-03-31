import 'package:cepapp/bloc/cep_bloc.dart';
import 'package:cepapp/models/cep.dart';
import 'package:cepapp/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CepWidget extends StatelessWidget {
  CepBloc _cepBloc = CepBloc();

  CepWidget();

  @override
  Widget build(BuildContext context) {
    MaskedTextController _cepMaskController =
        MaskedTextController(mask: Constants.maskCEP);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          textAlign: TextAlign.center,
          maxLength: 9,
          keyboardType: TextInputType.number,
          controller: _cepMaskController,
          decoration: InputDecoration(
            hintText: 'Insira o CEP aqui.',
            counterText: '',
            suffixIcon: IconButton(
                icon: Icon(Icons.search_sharp),
                // iconSize: ,
                tooltip: 'Pesquisar',
                onPressed: () {
                  context.showLoaderOverlay(
                    widget: Text(
                      "Loading...",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  );
                  var r = _cepBloc.getCEP(_cepMaskController.text.toString());
                }),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        StreamBuilder<Cep>(
          stream: _cepBloc.output,
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              return Text('Não foi possível carregar o cep.');
            }

            if (snapshot.hasData) {
              context.hideLoaderOverlay();
              return Container(
                child: Column(
                  children: [
                    Text('Cep: ' + (snapshot?.data?.cep != null ? snapshot?.data?.cep : '')),
                    Text('logradouro: ' + (snapshot?.data?.logradouro != null ? snapshot?.data?.bairro : '')),
                    Text('complemento: ' + (snapshot?.data?.complemento != null ? snapshot?.data?.complemento : '')),
                    Text('bairro: ' + (snapshot?.data?.bairro != null ? snapshot?.data?.bairro : '')),
                    Text('localidade: ' + (snapshot?.data?.localidade != null ? snapshot?.data?.localidade : '')),
                    Text('uf: ' + (snapshot?.data?.uf != null ? snapshot?.data?.uf : '')),
                    Text('ddd: ' + (snapshot?.data?.ddd != null ? snapshot?.data?.ddd : '')),
                  ],
                ),
              );
            }

            return Text('');
          },
        )
      ],
    );
  }
}
