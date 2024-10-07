import 'package:flutter_test/flutter_test.dart';
import 'package:doctor_appointments/AppointmentModel.dart';

void main() {
  test('Appointment model is created correctly', () {
    final appointment = Appointment(
      id: '1',
      specialty: 'Dentist',
      date: DateTime(2023, 10, 25),
      comments: 'Routine checkup',
    );

    expect(appointment.id, '1');
    expect(appointment.specialty, 'Dentist');
    expect(appointment.date, DateTime(2023, 10, 25));
    expect(appointment.comments, 'Routine checkup');
  });
}
