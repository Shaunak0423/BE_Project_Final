import 'package:be_project/userInfo.dart';
import 'package:flutter/material.dart';

class report extends StatefulWidget {
  String name, phoneNo, address , Symptoms;
  report(
      {Key? key,
      required this.name,
      required this.address,
      required this.phoneNo,
      required this.Symptoms})
      : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController(text: widget.name);
    TextEditingController _phoneno = TextEditingController(text: widget.phoneNo);
    TextEditingController _address =
        TextEditingController(text: widget.phoneNo);
    TextEditingController _symptoms =
        TextEditingController(text: widget.Symptoms);
    return Scaffold(
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
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: _phoneno,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone No',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: _address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: _symptoms,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Symptoms',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => userInfo())
                );
              },
              child: Text("Submit Text Report"),
            ),
          ],
        ),
      ),
    );
  }
}
