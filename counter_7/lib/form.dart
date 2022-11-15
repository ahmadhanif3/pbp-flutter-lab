import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

List<String> judulList = [];
List<String> nominalList = [];
List<int> pilihanList = [];
List<DateTime> tanggalList = [];

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  String _nominalBudget = "";
  int _pilihan = 0;
  DateTime _tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      drawer: returnMyDrawer(context), // Drawer
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Judul",
                      prefixIcon: Icon(Icons.description),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder()
                  ),
                  onSaved: (String? value) {
                    setState(() {
                      _judulBudget = value!;
                      judulList.add(_judulBudget);
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _judulBudget = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Judul budget tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Nominal",
                      prefixIcon: Icon(Icons.attach_money),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly],
                  onChanged: (String? value) {
                    setState(() {
                      _nominalBudget = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _nominalBudget = value!;
                      nominalList.add(_nominalBudget);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty || value.startsWith("0")) {
                      return "Nominal budget tidak boleh kosong atau diawali nol!";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    hintText: "Pilih jenis",
                    labelText: "Jenis",
                    prefixIcon: Icon(Icons.account_balance_wallet),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder()
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Pemasukan"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Pengeluaran"),
                      value: 2,
                    )
                  ],
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  onChanged: (value) {
                    setState(() {
                      _pilihan = value!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _pilihan = value!;
                      pilihanList.add(_pilihan);
                    });
                  },
                  validator: (value) {
                    if (value == null || value == 0) {
                    return "Pilih jenis budget";
                  }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMEd().format(_tanggal)
                    ),
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _tanggal,
                          firstDate: DateTime(2018),
                          lastDate: DateTime(2027),
                          helpText: "Tanggal",
                          confirmText: "Pilih",
                          cancelText: "Batal",
                          fieldLabelText: "Tanggal",
                        ).then(
                          (value) {
                            if (value != null) {
                              setState(() {
                                _tanggal = value;
                              });
                            }
                          }
                        );
                      },

                      child: const Text("Pilih tanggal")
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(50.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: const Size.fromHeight(42.0)
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                tanggalList.add(_tanggal);
                _formKey.currentState!.reset();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      elevation: 15,
                      child: Container(
                        child: ListView(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Text("Informasi Budget"),
                                  SizedBox(height: 10),
                                  Text("Budget: ${_judulBudget}"),
                                  Text("Nominal: ${_nominalBudget}"),
                                  Text("Jenis: ${_pilihan==1? "Pemasukan":"Pengeluaran"}"),
                                  Text("Tanggal: ${DateFormat.yMMMEd().format(_tanggal)}"),
                                  SizedBox(height: 10),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _tanggal = DateTime.now();
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Kembali"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            child: const Text(
              "Simpan",
              style: TextStyle(color: Colors.white),
            ),
          )
        )
    );
  }
}