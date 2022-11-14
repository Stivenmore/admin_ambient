import 'package:admin_ambient/data/datasource/analytics_datasource.dart';
import 'package:admin_ambient/data/datasource/autenticate_datasource.dart';
import 'package:admin_ambient/data/datasource/search_datasource.dart';
import 'package:admin_ambient/data/datasource/user_datasource.dart';
import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/search/search_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/domain/logic/splash/splash_cubit.dart';
import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/services/prefs_services.dart';
import 'package:admin_ambient/screen/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB399x5ESLxioRuorUtXARQ1PrjShx6o-I",
          authDomain: "ambient-ec3df.firebaseapp.com",
          projectId: "ambient-ec3df",
          storageBucket: "ambient-ec3df.appspot.com",
          messagingSenderId: "613674444074",
          appId: "1:613674444074:web:39a7f07ec8b021ab99ea53",
          measurementId: "G-NT6VKH78KE"));
  await UserPreferences().initPrefs();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final autenticationDataSource = AutenticationDataSource();
    final analyticsDataSource = AnalyticsDataSource();
    final searchDatasource = SearchDatasource();
    final userDataSource = UserDataSource();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignInAndUpCubit(autenticationDataSource)),
        BlocProvider(create: (_) => SplashCubit(autenticationDataSource)),
        BlocProvider(create: (_) => AnalyticsCubit(analyticsDataSource)),
        BlocProvider(create: (_) => SearchCubit(searchDatasource)),
        BlocProvider(create: (_) => UserCubit(userDataSource)),
        BlocProvider(create: (_) => GeneralCubit(userDataSource)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dashboard',
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}


/*
const firebaseConfig = {
  apiKey: "AIzaSyB399x5ESLxioRuorUtXARQ1PrjShx6o-I",
  authDomain: "ambient-ec3df.firebaseapp.com",
  projectId: "ambient-ec3df",
  storageBucket: "ambient-ec3df.appspot.com",
  messagingSenderId: "613674444074",
  appId: "1:613674444074:web:39a7f07ec8b021ab99ea53",
  measurementId: "G-NT6VKH78KE"
};
*/