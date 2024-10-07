import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doctor_appointments/AppointmentDetailScreen.dart';
import 'package:doctor_appointments/AppointmentModel.dart';

void main() {
  testWidgets('AppointmentDetailScreen shows correct appointment details', (WidgetTester tester) async {
    // Create a test appointment
    final appointment = Appointment(
      id: '1',
      specialty: 'Dentist',
      date: DateTime.now().add(Duration(days: 2)),
      comments: 'Routine checkup',
    );

    // Render the detail screen
    await tester.pumpWidget(MaterialApp(home: AppointmentDetailScreen(appointment: appointment)));

    // Verify that the details are displayed correctly
    expect(find.text('Dentist Appointment'), findsOneWidget);
    expect(find.text('Specialty: Dentist'), findsOneWidget);
    expect(find.text('Routine checkup'), findsOneWidget);
  });
}
