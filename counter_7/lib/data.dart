import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:intl/intl.dart';


class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: returnMyDrawer(context),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        itemCount: judulList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            borderOnForeground: true,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: (pilihanList[index] == 1)?
                  const Icon(Icons.savings):const Icon(Icons.paid),
                  title: Text(judulList[index]),
                  subtitle: Text(DateFormat.yMMMEd().format(tanggalList[index])),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(nominalList[index]),
                      const SizedBox(width: 8),
                      Text(pilihanList[index]==1? "Pemasukan":"Pengeluaran")
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),

      ),
    );
  }
}