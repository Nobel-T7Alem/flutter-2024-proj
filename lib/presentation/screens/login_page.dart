import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController();
  final List<Widget> imageSliders = [
    Image.asset("assets/images/11.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/15.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/13.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/7.jpg", fit: BoxFit.cover),
    Image.asset("assets/images/9.jpg", fit: BoxFit.cover),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoSlide();
    });
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= imageSliders.length) {
          nextPage = 0; // Loop back to the first item
        }
        _pageController
            .animateToPage(
              nextPage,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            )
            .then((_) => _autoSlide());
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: imageSliders,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/sebawi2.png', width: 80),
                const SizedBox(height: 400),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/admin_login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.green[800]!, width: 3),
                      ),
                      elevation: 5,
                      shadowColor: Colors.greenAccent,
                    ),
                    child: const Text('Login as Admin'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/user_login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.green[800]!, width: 3),
                      ),
                      elevation: 5,
                      shadowColor: Colors.green[800]!,
                    ),
                    child: const Text('Login as Volunteer/Agency'),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'New to the Sebawi Community? ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/signup');
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.green.shade800;
                              }
                              return Colors.lightGreen;
                            },
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(
                              fontSize: 15,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
