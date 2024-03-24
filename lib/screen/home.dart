import 'package:app_photo/shared/buttom_bar.dart';
import 'package:app_photo/shared/my_assets.dart';
import 'package:app_photo/shared/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    MyAssets.gl1,
    MyAssets.gl2,
    MyAssets.gl3,
    MyAssets.gl4,
    MyAssets.gl5,
    MyAssets.gl6,
    MyAssets.gl7,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 9, 20),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Let\'s share ',
                            style: GoogleFonts.aclonica(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          TextSpan(
                            text: '\nyour moment',
                            style: GoogleFonts.aclonica(
                              fontStyle: FontStyle.italic,
                              color: Colors.orange.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: CarrucelWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Today\'s capture',
                  style: GoogleFonts.aclonica(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 17,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              MasonryGridView.count(
                itemCount: images.length,
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  return itemGallery(index);
                },
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const  ButtonBarWidget(),
    );
  }

  Stack itemGallery(int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(images[index]),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
