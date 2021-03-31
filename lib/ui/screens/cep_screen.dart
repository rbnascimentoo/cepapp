import 'package:cepapp/application/application_config.dart';
import 'package:cepapp/bloc/cep_bloc.dart';
import 'package:cepapp/ui/widgets/cep_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CepApp extends StatefulWidget {
  @override
  _CepAppState createState() => _CepAppState();
}

class _CepAppState extends State<CepApp> {
  CepBloc _cepBloc = CepBloc();

  @override
  Widget build(BuildContext context) {

    ApplicationConfig();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu CEP',
      theme: ThemeData(),
      home: LoaderOverlay(
        overlayWidget: Center(
          child: SpinKitSquareCircle(
            color: Colors.lightGreenAccent,
            size: 50,
          ),
        ),
        overlayOpacity: 0.8,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meu CEP'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: CepWidget(),
          ),
        ),
      ),
    );
  }
}
