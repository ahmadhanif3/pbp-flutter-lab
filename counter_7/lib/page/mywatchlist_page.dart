import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';
import 'package:counter_7/utils/fetch_watchlist.dart';
import 'package:counter_7/page/info_mywatchlist.dart';
import 'package:counter_7/model/mywatchlist.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  late Future<List<MyWatchList>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: returnMyDrawer(context),
      body: FutureBuilder(
        future: futureData,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "There's currently no movies on your watchlist",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchList(
                          title: snapshot.data![index].fields.title,
                          releaseDate: snapshot.data![index].fields.releaseDate,
                          rating: snapshot.data![index].fields.rating,
                          watched: snapshot.data![index].fields.watched,
                          review: snapshot.data![index].fields.review,
                        )
                      )
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27, vertical: 9),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        width: 2.0,
                        color: (snapshot.data![index].fields.watched == 'Yes') ?
                          Colors.lightBlueAccent:Colors.black87
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.title}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.centerRight,
                            child: Checkbox(
                              value: (snapshot.data![index].fields.watched == 'Yes'),
                              activeColor: Colors.green,
                              onChanged: (bool? value) {
                                setState(() {
                                  snapshot.data![index].fields.watched =
                                  (value!) ? 'Yes' : "No";
                                });
                              }),
                          )
                        )
                      ],
                    ),
                  ),
                )
              );
            }
          }
        }
      ),
    );
  }
}