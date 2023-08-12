import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                'images/wallhaven-2yo8l6.png',
              ),
              // child: Text('SP',
              //   style: TextStyle(
              //     fontSize: 36.0,
              //     fontFamily: 'NotoSerifVithkuqi'
              //   ),
              // ),
            ),
            SizedBox(height: 10.0,),
            Text('Saul Pinales',
              style: TextStyle(
                fontSize: 30.0,
                  fontFamily: 'NotoSerifVithkuqi',
              ),
            ),
            Text('Soy un programador',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Montserrat'
              ),
            ),
            Divider(
              height: 30,
              indent: 40,
              endIndent: 40,
              thickness: 1.0,
              color: Colors.green,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              color: Colors.green,
              margin: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 0,
              ),
              shadowColor: Colors.black26,
              child: ListTile(
                title: Text(
                  '+1 809 720 9017',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat'
                  ),
                ),
                leading: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              color: Colors.green,
              margin: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 0,
              ),
              shadowColor: Colors.black26,
              child: ListTile(
                title: Text(
                  'saulpinales02@outlook.com',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat'
                  ),
                ),
                leading: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
