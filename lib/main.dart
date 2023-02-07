import 'dart:io';

import 'package:agendamentohospitalar/models/login_api.dart';
import 'package:agendamentohospitalar/models/recipient_list.dart';
import 'package:agendamentohospitalar/models/scheduling_list.dart';
import 'package:agendamentohospitalar/pages/auth_page.dart';
import 'package:agendamentohospitalar/pages/list_query_page.dart';
import 'package:agendamentohospitalar/pages/queryPage.dart';
import 'package:agendamentohospitalar/pages/home_page.dart';
import 'package:agendamentohospitalar/utils/app_routes.dart';
import 'package:asyncstate/class/async_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'models/hospital_list.dart';
import 'models/profissionals_list.dart';
import 'models/specialty_list.dart';
import 'pages/query_detail_page.dart';
import 'pages/teste_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => HospitalList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProfissionalList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SpecialtyList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ScheduligList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => RecipientList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Login(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        navigatorObservers: [AsyncState.observer],
        supportedLocales: [const Locale('pt', 'BR')],
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(0, 77, 141, 1),
              secondary: const Color.fromRGBO(33, 150, 243, 1),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(fontFamily: 'Lato'),
                )),
        routes: {
          AppRoutes.authpage: (context) => const AuthPage(),
          AppRoutes.home: (context) => const HomePage(),
          AppRoutes.newquery: (context) => const QueryPage(),
          AppRoutes.querydetails: (context) => const QueryDetailPage(),
          AppRoutes.listqueries: (context) => const ListQuery(),
          AppRoutes.test: (context) => const TestePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
