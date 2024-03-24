import 'package:animator/animator.dart';
import 'package:app_photo/routes/routes.dart';
import 'package:app_photo/shared/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Animator(
            tween: Tween<double>(begin: 1, end: 1.5),
            duration: const Duration(seconds: 10),
            cycles: 0,
            builder: (context, anim, child) {
              return Transform.scale(
                scale: anim.value,
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(MyAssets.welcome),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 45, left: 25),
              child: Text(
                'Photo',
                style: GoogleFonts.aclonica(color: Colors.white, fontSize: 33),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: size.height * .5,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore your \nCapture.',
                      style: GoogleFonts.aclonica(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Share your capture with \nPhoto Gallery.',
                        style: GoogleFonts.aclonica(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: InkWell(
                          onTap: (){
                             Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.homeScreen, (Route<dynamic> route) => false);
                          },
                          child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange.withOpacity(0.5),
                                width: 2.0,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                            ),
                            child: const Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
