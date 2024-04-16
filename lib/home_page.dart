import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20),
          bodyText2: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final List<Widget> imageSliders = [
    Image.asset("assets/images/11.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    Image.asset("assets/images/15.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    Image.asset("assets/images/13.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    Image.asset("assets/images/7.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    Image.asset("assets/images/9.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              height: MediaQuery.of(context).size.height,
            ),
            items: imageSliders,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/sebawi2.png', width: 80),  
                SizedBox(height: 400),  
                SizedBox(
                  width: 300,  
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.green[800]!, width: 3),
                      ),
                      elevation: 5,
                      shadowColor: Colors.greenAccent,
                    ),
                    child: Text('Login as Admin'),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,  
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.green[800]!, width: 3),
                      ),
                      elevation: 5,
                      shadowColor: Colors.green[800]!,
                    ),
                    child: Text('Login as Volunteer/Agency'),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,  
                  children: [
                    Text('New to the Sebawi Community? ', style: TextStyle(fontSize: 17, color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.green.shade800;
                            return Colors.lightGreen;
                          },
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: 20),
                        ),
                      ),
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



