
import 'package:flutter/material.dart';
import 'package:gallery/core/app.dart';
import 'package:gallery/logger/Log.dart';
import 'app_provider.dart';
import 'env.dart';

class AppComponent extends StatefulWidget {
  final App _application;

  AppComponent(this._application);

  @override
  State createState() => AppComponentState(_application);
}

class AppComponentState extends State<AppComponent> {
  final App _application;

  AppComponentState(this._application);

  @override
  void dispose() async {
    Log.i('dispose');
    super.dispose();
    await _application.onTerminate();
  }

  @override
  Widget build(BuildContext context) {
    return  _appProvider();
  }

  Widget _appProvider() {
    return AppProvider(
        child: _materialApp(),
        application: _application);
  }

  Widget _materialApp() {
    return MaterialApp(
      title: Env.value?.appName ?? '',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _application.router?.generator,
        // home: AnimatedSplashScreen(
        //   splashIconSize: MediaQuery.of(context).size.height * 0.50,
        //   splash: Image.asset(
        //     "assets/images/splash.png",
        //     height: MediaQuery.of(context).size.height * 0.50,
        //     width: MediaQuery.of(context).size.height * 0.50,
        //   ),
        //   backgroundColor: Colors.black38,
        //   splashTransition: SplashTransition.fadeTransition,
        //   duration: 3000,
        // )
    );
  }
}
