import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:sos_services/screens/base/base_screen.dart';
import 'package:sos_services/stores/page_store.dart';
import 'package:sos_services/stores/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('aOvfAv7ymNduniHTnn1Id7vw4lfdIC4oXDUFCwVf',
      'https://parseapi.back4app.com/',
      clientKey: 'ux1TZWB0r4HuFHQiMtpvHiZtzu6lcZllxGnojiLI',
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS SERVICES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.orange,
            selectionColor: Colors.purple,
            selectionHandleColor: Colors.blue,
          )),
      home: BaseScreen(),
    );
  }
}
