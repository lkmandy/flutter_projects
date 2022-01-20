import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:using_sqlite_db/models/dog.dart';

void main() async {
  runApp(Sample());

  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();


  if (kDebugMode) {
    print(await dogs());
  }
}


class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
    child: const Text('Click Me'),
                onPressed:  () {},
          ),
        ),
      )
    ));
  }
}

