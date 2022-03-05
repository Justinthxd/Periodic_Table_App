import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../atom/atom.dart';

class ElementPage extends StatefulWidget {
  ElementPage({Key? key, required this.map}) : super(key: key);

  Map map;

  @override
  State<ElementPage> createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: Container(
        height: size.height,
        width: size.width,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 110,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.map['name'],
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Garamond',
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.grey,
                          height: 170,
                          width: 170,
                          child: atom(
                            number: widget.map['number'],
                          ),
                        ),
                        Text(
                          widget.map['summary'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.blueGrey.shade100,
                            fontSize: 21,
                            fontFamily: 'Garamond',
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Features",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Garamond',
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Divider(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20.0,
                                color: Color.fromRGBO(30, 30, 30, 1),
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Atomic number:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  Text(
                                    widget.map['number'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Atomic Mass:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  Text(
                                    widget.map['atomic_mass'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Electron configuration:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  (widget.map['electron_configuration_semantic']
                                              .toString()
                                              .length <
                                          20)
                                      ? Text(
                                          widget.map[
                                                  'electron_configuration_semantic']
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontSize: 20,
                                            fontFamily: 'Garamond',
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  (widget.map['electron_configuration_semantic']
                                              .toString()
                                              .length >
                                          20)
                                      ? Text(
                                          widget.map[
                                                  'electron_configuration_semantic']
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontSize: 20,
                                            fontFamily: 'Garamond',
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Category:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  (widget.map['category'].toString().length <
                                          20)
                                      ? Text(
                                          widget.map['category'].toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontSize: 20,
                                            fontFamily: 'Garamond',
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  (widget.map['category'].toString().length >
                                          20)
                                      ? Text(
                                          widget.map['category'].toString(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontSize: 20,
                                            fontFamily: 'Garamond',
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Appearance: ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  (widget.map['appearance'].toString().length <
                                          30)
                                      ? Text(
                                          widget.map['appearance'].toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontSize: 20,
                                            fontFamily: 'Garamond',
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              (widget.map['appearance'].toString().length > 30)
                                  ? Text(
                                      widget.map['appearance'].toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.blueGrey.shade100,
                                        fontSize: 20,
                                        fontFamily: 'Garamond',
                                      ),
                                    )
                                  : SizedBox(),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Density:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  Text(
                                    widget.map['density'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Period:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  Text(
                                    widget.map['period'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shells:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  Text(
                                    widget.map['shells'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Electron Affinity:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                  Text(
                                    widget.map['electron_affinity'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade100,
                                      fontSize: 20,
                                      fontFamily: 'Garamond',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(),
                        SizedBox(height: 10),
                        InkWell(
                          child: Text(
                            'Open in Browser',
                            style: TextStyle(
                              color: Color.fromARGB(255, 146, 197, 223),
                              fontSize: 20,
                              fontFamily: 'Garamond',
                            ),
                          ),
                          onTap: () async {
                            await launch(
                              widget.map['source'],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
