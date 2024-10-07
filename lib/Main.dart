import 'package:flutter/material.dart';
import 'AppointmentListScreen.dart';

void main() {
  runApp(DoctorAppointmentsApp());
}

class DoctorAppointmentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppointmentListScreen(),
    );
  }
}
