import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';

class WatchList extends StatefulWidget {
  const WatchList({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.watched,
    required this.review,
  });

  final String title;
  final String releaseDate;
  final double rating;
  final String watched;
  final String review;

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: returnMyDrawer(context),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  "Release Date: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(widget.releaseDate),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Rating: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${widget.rating}/5"),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Watched: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.watched),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.review),
              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 10,
                        right: 10
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      )
    );
  }
}