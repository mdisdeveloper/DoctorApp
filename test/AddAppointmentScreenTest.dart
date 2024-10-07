import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doctor_appointments/AddAppointmentScreen.dart';

void main() {
  testWidgets('AddAppointmentScreen validates form and adds appointment', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AddAppointmentScreen()));

    // Check if initial widgets are present
    expect(find.text('Add Appointment'), findsOneWidget);
    expect(find.text('Specialty'), findsOneWidget);

    // Simulate form input
    await tester.enterText(find.byType(TextFormField).first, 'Routine Checkup');
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Verify that validation errors are displayed for required fields
    expect(find.text('Please select a specialty'), findsOneWidget);

    // Select specialty
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.pumpAndSettle(); // Wait for the dropdown to appear
    await tester.tap(find.text('Dentist').last);
    await tester.pump();

    // Now try saving the form again
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Ensure the form is successfully submitted
    expect(find.text('Please pick a date'), findsNothing); // No validation errors should remain
  });
}
