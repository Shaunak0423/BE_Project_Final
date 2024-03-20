import 'package:be_project/report.dart';
import 'package:flutter/material.dart';

class userInfo extends StatefulWidget {
  const userInfo({Key? key}) : super(key: key);

  @override
  State<userInfo> createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _symptoms = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _phoneno,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Phone Number"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _address,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Address"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _symptoms,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Symptoms"),
                ),
              ),
              ElevatedButton(onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => report(
                      name: _name.text,
                      phoneNo: _phoneno.text,
                      address: _address.text,
                      Symptoms: _symptoms.text,
                    )),
                    );
              },
              child:  Text('Send')
              )
            ],
          ),
        ),
      ),
    );
  }
}
