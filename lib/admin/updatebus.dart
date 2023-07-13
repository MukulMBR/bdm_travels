import 'package:bdm_travels/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../my_textfield.dart';

class UpdateBus extends StatefulWidget {
  const UpdateBus({Key? key});

  @override
  State<UpdateBus> createState() => _UpdateBusState();
}

class _UpdateBusState extends State<UpdateBus> {
  TextEditingController busNameController = TextEditingController();
  TextEditingController busNumberController = TextEditingController();
  TextEditingController busCapacityController = TextEditingController();
  TextEditingController busDetailsController = TextEditingController();

  Future<void> updateBusDetails() async {
    String busName = busNameController.text;
    String busNumber = busNumberController.text;
    String busCapacity = busCapacityController.text;
    String busDetails = busDetailsController.text;

    var url = Uri.parse("http://192.168.107.177/bdm_travels/php/updatebus.php");
    var response = await http.post(url, body: {
      "busName": busName,
      "busNumber": busNumber,
      "busCapacity": busCapacity,
      "busDetails": busDetails,
    });

    var data = json.decode(response.body);
    if (data == "Success") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Bus details updated successfully.'),
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
            content: Text('Failed to update bus details.'),
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
          title: Text('Update Bus'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              customTextField(
                controller: busNameController,
                hintText: "Bus Name",
                prefixIcon: Icons.bus_alert,
                labelText: "Bus Name",
              ),
              SizedBox(height: 16.0),
              customTextField(
                controller: busNumberController,
                hintText: "Bus Number",
                prefixIcon: Icons.numbers,
                labelText: "Bus Number",
              ),
              SizedBox(height: 16.0),
              customTextField(
                controller: busCapacityController,
                hintText: "Bus Capacity",
                prefixIcon: Icons.reduce_capacity,
                labelText: "Bus Capacity",
              ),
              SizedBox(height: 16.0),
              customTextField(
                controller: busDetailsController,
                hintText: "Bus Details",
                prefixIcon: Icons.reduce_capacity,
                labelText: "Bus Details",
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: updateBusDetails,
                child: Text("Update Bus"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
