import 'package:flutter/material.dart';

import '../components/card_scroll_widget.dart';
import '../data/data.dart';
import 'details_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;
  final TextEditingController _searchContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2d3447),
            Color(0xFF2d3447),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: ExactAssetImage(images[currentPage.toInt()]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 50.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white24,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/icons/menu.png",
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _searchContrller,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                             
                                if (_searchContrller.text == title[0]) {
                                  controller.jumpToPage(0);
                                } else if (_searchContrller.text == title[1]) {
                                  controller.jumpToPage(1);
                                } else if (_searchContrller.text == title[2]) {
                                  controller.jumpToPage(2);
                                } else if (_searchContrller.text == title[3]) {
                                  controller.jumpToPage(3);
                                } else if (_searchContrller.text == title[4]) {
                                  controller.jumpToPage(4);
                                } else if (_searchContrller.text == title[5]) {
                                  controller.jumpToPage(5);
                                } else if (_searchContrller.text == title[6]) {
                                  controller.jumpToPage(6);
                                }
                              },
                              icon: const Icon(Icons.search),
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintText: "Search Products",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white24,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white24,
                                width: 1.0,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        title: title[currentPage.toInt()],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Stack(
                    children: [
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: images.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
