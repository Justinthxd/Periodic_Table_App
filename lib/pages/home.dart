import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea_6/pages/element_page.dart';

import '../main.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> readJson() async {
    final String response =
        await rootBundle.loadString('assets/periodic_table.json');
    final res = await json.decode(response);
    List data = res['elements'];
    return Future.delayed(Duration(milliseconds: 500), () {
      return data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: 55),
            Row(
              children: [
                SizedBox(width: 15),
                Text(
                  "Periodic Table",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Garamond',
                    color: Colors.blueGrey.shade100,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.info_outline_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Information",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Garamond',
                                  color: Colors.blueGrey.shade100,
                                ),
                              ),
                              SizedBox(height: 20),
                              Image.asset('assets/photo.png'),
                              SizedBox(height: 30),
                              Text(
                                "Contact: justinthxd@gmail.com",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Garamond',
                                  color: Colors.blueGrey.shade100,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Git: https://github.com/Justinthxd",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Garamond',
                                  color: Colors.blueGrey.shade100,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: readJson(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueGrey,
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      color: Colors.blueGrey,
                      onRefresh: () {
                        return Future.delayed(Duration(milliseconds: 500), () {
                          setState(() {});
                        });
                      },
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 20),
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => ElementPage(
                                    map: snapshot.data![i],
                                  ),
                                  transitionsBuilder: (c, anim, a2, child) =>
                                      FadeTransition(
                                          opacity: anim, child: child),
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(13),
                              padding: EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(25, 25, 25, 1),
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1,
                                    color: Color.fromRGBO(35, 35, 35, 1),
                                    offset: Offset(-4.0, -4.0),
                                  ),
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1,
                                    color: Color.fromRGBO(15, 15, 15, 1),
                                    offset: Offset(4.0, 4.0),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    snapshot.data![i]['symbol'],
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      snapshot.data![i]['name'],
                                      style: TextStyle(
                                        color: Colors.blueGrey.shade300,
                                        fontSize: 18,
                                        fontFamily: 'Garamond',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
