import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/mandy.jpg'),
              ),
              Text(
                'Amanda Shafack',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize: 20.5,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+237 68 73 48 09',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'lkmandy@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
