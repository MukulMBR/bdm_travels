import 'package:bdm_travels/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bus extends StatefulWidget {
  const Bus({Key? key});

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
  List<Map<String, dynamic>> busDetails = [];

  @override
  void initState() {
    super.initState();
    fetchBusDetails();
  }

  Future<void> fetchBusDetails() async {
    var url = Uri.parse("http://192.168.107.177/bdm_travels/php/bus.php");
    var response = await http.get(url);

    var data = json.decode(response.body);
    setState(() {
      busDetails = List<Map<String, dynamic>>.from(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
         // Navigate back to the homepage
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Page'),
        ),
        body: ListView.builder(
          itemCount: busDetails.length,
          itemBuilder: (context, index) {
            var bus = busDetails[index];
            return ListTile(
              title: Text(bus['busName']),
              subtitle: Text('Number: ${bus['busNumber']}, Capacity: ${bus['busCapacity']},Details: ${bus['busDetails']}'),
            );
          },
        ),
      ),
    );
  }
}
