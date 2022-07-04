import 'package:api_app_demo/api_service/api_service.dart';
import 'package:api_app_demo/screens/news_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/news_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiServices.getNewsData(),
        builder: (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (BuildContext context, int index) {
                final newsInfo = snapshot.data!.articles![index];
                var format = DateFormat('dd-MM-yyyy');
                final newsDate = format.parse("${newsInfo.publishedAt}");
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            image: newsInfo.urlToImage,
                            tag: newsInfo.urlToImage,
                            url: newsInfo.url,
                          ),
                        ));
                  },
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "${newsInfo.urlToImage}",
                          child: Image.network(
                            "${newsInfo.urlToImage}",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${newsInfo.title}",
                                textScaleFactor: 1,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(newsInfo.author == null
                                  ? "No Author"
                                  : "${newsInfo.author}"),
                              SizedBox(
                                height: 15,
                              ),
                              Text(newsInfo.publishedAt == null
                                  ? "No TimeGiven"
                                  : newsInfo.publishedAt
                                      .toString()
                                      .split(" ")[0]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
