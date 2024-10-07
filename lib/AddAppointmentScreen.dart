import 'package:flutter/material.dart';  // Material widgets for UI
import 'AppointmentModel.dart';               // The Appointment model for creating a new appointment
import 'package:intl/intl.dart';

class AddAppointmentScreen extends StatefulWidget {
  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();    // Form validation key
  String _specialty = '';
  DateTime? _selectedDate;
  String _comments = '';

  final List<String> specialties = ['Dentist', 'Cardiologist', 'Dermatologist', 'Pediatrician'];

  // Function to pick a date using a DatePicker
  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Save the appointment and return to the list screen
  void _saveAppointment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newAppointment = Appointment(
        id: DateTime.now().toString(),     // Unique ID for the appointment
        specialty: _specialty,
        date: _selectedDate!,
        comments: _comments,
      );
      Navigator.pop(context, newAppointment);  // Return new appointment
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Dropdown for selecting medical specialty
              DropdownButtonFormField<String>(
                value: _specialty.isEmpty ? null : _specialty,
                items: specialties.map((specialty) {
                  return DropdownMenuItem<String>(
                    value: specialty,
                    child: Text(specialty),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _specialty = value!;
                  });
                },
                validator: (value) => value == null ? 'Please select a specialty' : null,
                decoration: InputDecoration(labelText: 'Specialty'),
              ),
              SizedBox(height: 20),
              
              // Date selector field
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Select Date'),
                onTap: _pickDate,
                validator: (value) => _selectedDate == null ? 'Please pick a date' : null,
                controller: TextEditingController(
                  text: _selectedDate == null ? '' : DateFormat.yMMMd().format(_selectedDate!),
                ),
              ),
              SizedBox(height: 20),

              // Comments input
              TextFormField(
                decoration: InputDecoration(labelText: 'Comments'),
                onSaved: (value) => _comments = value!,
                validator: (value) => value!.isEmpty ? 'Please enter comments' : null,
              ),
              SizedBox(height: 20),

              // Save button
              ElevatedButton(
                onPressed: _saveAppointment,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
