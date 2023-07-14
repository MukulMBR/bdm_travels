import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookSeatPage extends StatefulWidget {
  final String busNumber;
  final int busCapacity;

  const BookSeatPage({
    Key? key,
    required this.busNumber,
    required this.busCapacity,
  }) : super(key: key);

  @override
  _BookSeatPageState createState() => _BookSeatPageState();
}

class _BookSeatPageState extends State<BookSeatPage> {
  List<bool> seatStatus = [];

  @override
  void initState() {
    super.initState();
    initializeSeatStatus();
  }

  void initializeSeatStatus() {
    setState(() {
      seatStatus = List.generate(widget.busCapacity, (index) => true);
    });
  }

  void bookSeat(int seatIndex) {
    setState(() {
      seatStatus[seatIndex] = false;
    });
  }

  void cancelBooking(int seatIndex) {
    setState(() {
      seatStatus[seatIndex] = true;
    });
  }

  Future<void> confirmBooking() async {
    List<int> bookedSeats = [];
    for (int i = 0; i < seatStatus.length; i++) {
      if (!seatStatus[i]) {
        bookedSeats.add(i + 1);
      }
    }

    // Send the booked seats data to your API for further processing
    var url = Uri.parse("http://192.168.107.177/bdm_travels/php/bookseat.php");
    var response = await http.post(url, body: {
      "busNumber": widget.busNumber,
      "bookedSeats": jsonEncode(bookedSeats),
    });

    var data = json.decode(response.body);
    if (data == "Success") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Seats booked successfully.'),
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
            content: Text('Failed to book seats.'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Seat'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bus Number: ${widget.busNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: seatStatus.length,
              itemBuilder: (context, index) {
                bool isSeatAvailable = seatStatus[index];
                return GestureDetector(
                  onTap: () {
                    if (isSeatAvailable) {
                      bookSeat(index);
                    } else {
                      cancelBooking(index);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSeatAvailable ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: confirmBooking,
              child: Text('Confirm Booking'),
            ),
          ),
        ],
      ),
    );
  }
}
