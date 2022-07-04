import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key, this.image, this.tag, this.url})
      : super(key: key);
  final image;
  final tag;
  final url;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Share.share("${widget.url}");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.tag,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${widget.image}"), fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}
