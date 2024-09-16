import 'package:flutter/material.dart';
import '/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 20),
              _textboxNama(),
              const SizedBox(height: 15),
              _textboxNIM(),
              const SizedBox(height: 15),
              _textboxTahun(),
              const SizedBox(height: 30),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Formulir Data Diri",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _textboxNama() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: TextFormField(
        controller: _namaController,
        decoration: InputDecoration(
          labelText: "Nama",
          prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Nama tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  Widget _textboxNIM() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: TextFormField(
        controller: _nimController,
        decoration: InputDecoration(
          labelText: "NIM",
          prefixIcon: const Icon(Icons.badge, color: Colors.deepPurple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'NIM tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  Widget _textboxTahun() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: TextFormField(
        controller: _tahunController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Tahun Lahir",
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.deepPurple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Tahun Lahir tidak boleh kosong';
          }
          if (int.tryParse(value) == null) {
            return 'Tahun Lahir harus berupa angka';
          }
          return null;
        },
      ),
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        "Simpan",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
