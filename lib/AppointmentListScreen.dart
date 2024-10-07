import 'package:flutter/material.dart';  
import 'AddAppointmentScreen.dart';    
import 'AppointmentDetailScreen.dart'; 
import 'AppointmentModel.dart';              
import 'package:intl/intl.dart';          


class AppointmentListScreen extends StatefulWidget {
  @override
  _AppointmentListScreenState createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends State<AppointmentListScreen> {
  List<Appointment> appointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointments(); // Simulate API call to load appointments
  }

  void loadAppointments() {
    
    appointments = [
      Appointment(id: '1', specialty: 'Dentist', date: DateTime.now().add(Duration(days: 2)), comments: 'Routine checkup'),
      Appointment(id: '2', specialty: 'Cardiologist', date: DateTime.now().add(Duration(days: 5)), comments: 'Heart issue'),
    ];
    setState(() {});
  }

  void addAppointment(Appointment appointment) {
    setState(() {
      appointments.add(appointment);
      appointments.sort((a, b) => a.date.compareTo(b.date)); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return ListTile(
            title: Text('${appointment.specialty}'),
            subtitle: Text(DateFormat.yMMMd().format(appointment.date)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDetailScreen(appointment: appointment),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newAppointment = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAppointmentScreen(),
            ),
          );
          if (newAppointment != null) {
            addAppointment(newAppointment);
          }
        },
      ),
    );
  }
}
