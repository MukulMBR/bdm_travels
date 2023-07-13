import 'package:bdm_travels/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteBusPage extends StatefulWidget {
  const DeleteBusPage({Key? key});

  @override
  State<DeleteBusPage> createState() => _DeleteBusPageState();
}

class _DeleteBusPageState extends State<DeleteBusPage> {
  late final TextEditingController busNumberController;

  @override
  void initState() {
    super.initState();
    busNumberController = TextEditingController();
  }

  @override
  void dispose() {
    busNumberController.dispose();
    super.dispose();
  }

  Future<void> deleteBus() async {
    String busNumber = busNumberController.text;

    var url = Uri.parse("http://192.168.107.177/bdm_travels/php/deletebus.php");
    var response = await http.post(url, body: {"busNumber": busNumber});
    var data = json.decode(response.body);
    if (data == "Success") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Bus deleted successfully.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to delete bus.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Delete Bus'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: busNumberController,
                decoration: InputDecoration(
                  labelText: 'Bus Number',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: deleteBus,
                child: Text("Delete Bus"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
