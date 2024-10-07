import 'package:flutter/material.dart';
import 'AppointmentModel.dart';               
import 'package:intl/intl.dart'; 

class AppointmentDetailScreen extends StatelessWidget {
  final Appointment appointment;  // Receive the selected appointment as an argument

  AppointmentDetailScreen({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${appointment.specialty} Appointment'),  // Display specialty in title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Specialty: ${appointment.specialty}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date: ${DateFormat.yMMMd().format(appointment.date)}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Comments: ${appointment.comments}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
