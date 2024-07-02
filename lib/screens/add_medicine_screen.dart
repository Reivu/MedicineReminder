import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/medicine.dart';
import '../providers/medicine_provider.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _nameController = TextEditingController();
  DateTime? _selectedDate;
  final List<TimeOfDay> _selectedTimes = [];
  bool _repeatDaily = false;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      }
      setState(() {
        _selectedTimes.add(pickedTime);
      });
    });
  }

  void _removeTime(int index) {
    setState(() {
      _selectedTimes.removeAt(index);
    });
  }

  void _submitData() {
    if (_nameController.text.isEmpty || _selectedDate == null || _selectedTimes.isEmpty) {
      return;
    }
    final enteredName = _nameController.text;
    final enteredDate = _selectedDate!;
    final enteredTimes = _selectedTimes;

    Provider.of<MedicineProvider>(context, listen: false).addMedicine(
      Medicine(
        name: enteredName,
        startDate: enteredDate,
        timesPerDay: enteredTimes,
        repeatDaily: _repeatDaily,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Obat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Nama Obat'),
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Tanggal Mulai belum dipilih!'
                        : 'Tanggal Mulai: ${_selectedDate!.toLocal()}',
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: const Text('Pilih Tanggal'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedTimes.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(_selectedTimes[index].format(context)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeTime(index),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: _presentTimePicker,
                  child: const Text('Tambah Waktu'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Ulangi Setiap Hari'),
                Switch(
                  value: _repeatDaily,
                  onChanged: (value) {
                    setState(() {
                      _repeatDaily = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Tambahkan Obat'),
            ),
          ],
        ),
      ),
    );
  }
}
