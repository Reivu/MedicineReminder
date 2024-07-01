import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import './providers/medicine_provider.dart';
import './screens/add_medicine_screen.dart';
import './screens/edit_medicine_screen.dart';

void main() {
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MedicineProvider(),
      child: MaterialApp(
        title: 'Alarm Obat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MedicineListScreen(),
      ),
    );
  }
}

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicineProvider = Provider.of<MedicineProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Obat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddMedicineScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: medicineProvider.medicines.length,
        itemBuilder: (ctx, index) {
          final medicine = medicineProvider.medicines[index];
          return ListTile(
            title: Text(medicine.name),
            subtitle: Text('Mulai: ${medicine.startDate.toLocal()}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditMedicineScreen(medicine),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await medicineProvider.deleteMedicine(medicine.id!);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
