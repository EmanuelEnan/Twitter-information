import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:twitter_api_1/starting_page.dart';

import 'model/transaction.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox('transactions');
  // await Hive.openBox('transactions');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartingPage(),
    );
  }
}
