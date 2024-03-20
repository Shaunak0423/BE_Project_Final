import 'package:be_project/account.dart';
import 'package:be_project/map.dart';
import 'package:be_project/report.dart';
import 'package:flutter/material.dart';

class userInterFace extends StatefulWidget {
  const userInterFace({Key? key}) : super(key: key);

  @override
  State<userInterFace> createState() => _userInterFacestate();
}

class _userInterFacestate extends State<userInterFace> {
  int myIndex = 0;
  static List<Widget> get widgetList => newMethod;

  static List<Widget> get newMethod {
    return <Widget>[
  userInterFace(),
  report(name: '', address: '', phoneNo: '', Symptoms: '',),
  maps(),
  userAccount(),
];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/Images/Home.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Center(
          child: widgetList[myIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueAccent,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "home",
                  backgroundColor: Colors.amber),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined),
                  label: "map",
                  backgroundColor: Colors.indigo),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
                label: "report",
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "Account",
                backgroundColor: Colors.pinkAccent,
              ),
            ]),
      ),
    );
  }
}
