import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doctor_appointments/AppointmentListScreen.dart';
import 'package:doctor_appointments/AppointmentModel.dart';

void main() {
  testWidgets('AppointmentListScreen renders correctly', (WidgetTester tester) async {
    // Set up the initial test state with sample appointments
    // ignore: unused_local_variable
    final appointments = [
      Appointment(id: '1', specialty: 'Dentist', date: DateTime.now().add(Duration(days: 2)), comments: 'Routine checkup'),
      Appointment(id: '2', specialty: 'Cardiologist', date: DateTime.now().add(Duration(days: 5)), comments: 'Heart issue'),
    ];

    await tester.pumpWidget(MaterialApp(home: AppointmentListScreen()));

    // Verify the screen renders the list of appointments
    expect(find.text('Appointments'), findsOneWidget);
    expect(find.text('Dentist'), findsOneWidget);
    expect(find.text('Cardiologist'), findsOneWidget);
  });

  testWidgets('Tapping on an appointment navigates to details screen', (WidgetTester tester) async {
    // ignore: unused_local_variable
    final appointments = [
      Appointment(id: '1', specialty: 'Dentist', date: DateTime.now().add(Duration(days: 2)), comments: 'Routine checkup'),
    ];

    await tester.pumpWidget(MaterialApp(home: AppointmentListScreen()));

    // Simulate tapping the first appointment
    await tester.tap(find.text('Dentist'));
    await tester.pumpAndSettle();

    // Verify that the navigation to the detail screen occurred
    expect(find.text('Dentist Appointment'), findsOneWidget);
    expect(find.text('Routine checkup'), findsOneWidget);
  });
}
