import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPasswordPage(),
    );
  }
}

class MyPasswordPage extends StatefulWidget {
  const MyPasswordPage({Key? key}) : super(key: key);

  @override
  State<MyPasswordPage> createState() => _MyPasswordPageState();
}

class _MyPasswordPageState extends State<MyPasswordPage> {
  @override
  Widget build(BuildContext context) {
    var numList = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock, // รูปไอคอน
                    size: 80.0, // ขนาดไอคอน
                    color: Colors.grey, // สีไอคอน
                  ),
                  const Text(
                    'กรุณาใส่รหัสผ่าน',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < numList.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_buildNumRow(numList[i])],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _emptyButton(),
                    _buildNumRow(['0']),
                    _iconBack(),
                  ],
                ),
                Expanded(

                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'ลืมรหัสผ่าน',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildNumRow(List<String> numList) {
    return Row(
      children: numList.map((item) {
        return _buildNumButton(item);
      }).toList(),
    );
  }

  Padding _buildNumButton(String num) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            num,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Padding _emptyButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 60.0,
        height: 60.0,
      ),
    );
  }

  Padding _iconBack() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Icon(
        Icons.backspace_outlined,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
