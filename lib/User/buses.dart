import 'package:bdm_travels/User/bus_details.dart';
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
  late final TextEditingController userInputController;

  @override
  void initState() {
    super.initState();
    userInputController = TextEditingController();
    fetchBusDetails('');
  }

  @override
  void dispose() {
    userInputController.dispose();
    super.dispose();
  }

  Future<void> fetchBusDetails(String userInput) async {
    var url = Uri.parse("http://192.168.107.177/bdm_travels/php/bus.php?userInput=$userInput");
    var response = await http.get(url);

    var data = json.decode(response.body);
    setState(() {
      busDetails = List<Map<String, dynamic>>.from(data);
    });
  }

  void navigateToBusDetailsPage(Map<String, dynamic> bus) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BusDetailsPage(busDetails: bus)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Buses'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: userInputController,
                decoration: InputDecoration(
                  labelText: 'Enter bus number or name',
                  suffixIcon: IconButton(
                    onPressed: () {
                      fetchBusDetails(userInputController.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: busDetails.length,
                itemBuilder: (context, index) {
                  var bus = busDetails[index];
                  return ListTile(
                    title: Text(bus['busName']),
                    subtitle: Text('Number: ${bus['busNumber']}, Capacity: ${bus['busCapacity']}, Details: ${bus['busDetails']}'),
                    onTap: () {
                      navigateToBusDetailsPage(bus);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}