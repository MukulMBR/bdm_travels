import 'package:bdm_travels/User/bookseat.dart';
import 'package:flutter/material.dart';

class BusDetailsPage extends StatelessWidget {
  final Map<String, dynamic> busDetails;

  const BusDetailsPage({Key? key, required this.busDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bus Name: ${busDetails['busName']}'),
            Text('Bus Number: ${busDetails['busNumber']}'),
            Text('Bus Capacity: ${busDetails['busCapacity']}'),
            Text('Bus Details: ${busDetails['busDetails']}'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookSeatPage(
                      busNumber: busDetails['busNumber'],
                      busCapacity: busDetails['busCapacity'],
                    ),
                  ),
                );
              },
              child: Text('Book Seat'),
            ),
          ],
        ),
      ),
    );
  }
}