import 'package:api_app_demo/model/game_model.dart';
import 'package:api_app_demo/widget/glass_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class GameHome extends StatefulWidget {
  const GameHome({Key? key}) : super(key: key);

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  Future<List<GameModel>> gameDemo() async {
    http.Response response = await http.get(
      Uri.parse("https://www.freetogame.com/api/games"),
    );

    return gameModelFromJson(response.body);
  }

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Games",
          style: TextStyle(color: Colors.white, letterSpacing: 5),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: gameDemo(),
          builder:
              (BuildContext context, AsyncSnapshot<List<GameModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Popular",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        final game = snapshot.data![index];
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage("${game.thumbnail}"),
                                    fit: BoxFit.cover),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: GlassBox(
                                  text: "${game.title}",
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Others",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        final game = snapshot.data![index];
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              height: 150,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                image: DecorationImage(
                                    image: NetworkImage("${game.thumbnail}"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
