import 'package:coupon_repository/coupon_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyANqTAyb0zpMToT62Zp_GtnwFVmzLZT9Nc',
      appId: '1:718825716231:web:b2966e05473bc386bf48a2',
      messagingSenderId: '718825716231',
      projectId: 'mskopalisce',
    ),
  );

  runApp(
    App(
      couponRepository: CouponRepository(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required CouponRepository couponRepository,
  })  : _couponRepository = couponRepository,
        super(key: key);

  final CouponRepository _couponRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _couponRepository),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
