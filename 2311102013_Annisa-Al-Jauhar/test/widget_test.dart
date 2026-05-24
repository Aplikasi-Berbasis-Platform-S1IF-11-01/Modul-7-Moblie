import 'package:flutter_test/flutter_test.dart';
import 'package:data_mahasiswa/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const DataMahasiswaApp());
    expect(find.text('Data Mahasiswa'), findsOneWidget);
  });
}
