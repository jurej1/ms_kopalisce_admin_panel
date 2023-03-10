import 'package:coupon_repository/coupon_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';
import 'package:ms_kopalisce_admin_panel/prices/blocs/blocs.dart';
import 'package:ms_kopalisce_admin_panel/utilities/sobota_svica_bloc_observer.dart';
import 'package:ms_kopalisce_admin_panel/vouchers/blocs/blocs.dart';
import 'package:price_repository/price_repository.dart';
import 'package:quiz_repository/quiz_repository.dart';

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

  Bloc.observer = SobotaSvicaBlocObserver();
  runApp(
    App(
      couponRepository: CouponRepository(),
      priceRepository: PriceRepository(),
      quizRepository: QuizRepository(),
      infoRepository: InfoRepository(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required CouponRepository couponRepository,
    required PriceRepository priceRepository,
    required QuizRepository quizRepository,
    required InfoRepository infoRepository,
  })  : _couponRepository = couponRepository,
        _priceRepository = priceRepository,
        _quizRepository = quizRepository,
        _infoRepository = infoRepository,
        super(key: key);

  final CouponRepository _couponRepository;
  final PriceRepository _priceRepository;
  final QuizRepository _quizRepository;
  final InfoRepository _infoRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _couponRepository),
        RepositoryProvider.value(value: _priceRepository),
        RepositoryProvider.value(value: _quizRepository),
        RepositoryProvider.value(value: _infoRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VouchersListBloc(couponRepository: _couponRepository)..add(VouchersListLoadRequested()),
          ),
          BlocProvider(
            create: (context) => BathroomServicesBloc(priceRepository: _priceRepository)..add(BathroomServicesLoadRequested()),
          ),
          BlocProvider(
            create: (context) => VouchersListWheelBloc(couponRepository: _couponRepository)..add(VouchersListWheelLoadRequested()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home(),
        ),
      ),
    );
  }
}
