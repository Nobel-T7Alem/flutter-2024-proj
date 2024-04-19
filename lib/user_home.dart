import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: const [
                Tab(
                  child: Text(
                    "All Posts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "My Posts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              labelColor: Colors.green.shade800,
              unselectedLabelColor: Colors.grey.shade800,
              indicatorColor: Colors.green.shade800,
            ),
            title: Text("Agency Posts",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.green.shade800)),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    PostItem(
                      post: posts[index],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                  ]);
                },
              ),
              ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    PostItem(
                      post: posts[index],
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade800),
      ),
    );
  }
}

// Model for a post
class Post {
  final String agencyName;
  final String contactInfo;
  final String serviceType;

  Post({
    required this.agencyName,
    required this.contactInfo,
    required this.serviceType,
  });
}

// Dummy data for posts
List<Post> posts = [
  Post(
    agencyName: "Mekedonia",
    contactInfo: "09113124",
    serviceType: "Money and Labor",
  ),
  Post(
    agencyName: "Gergesenon",
    contactInfo: "09113523",
    serviceType: "Sanitary Products",
  ),
  Post(
    agencyName: "Mekedonia",
    contactInfo: "09113124",
    serviceType: "Money and Labor",
  ),
  Post(
    agencyName: "Mekedonia",
    contactInfo: "09113124",
    serviceType: "Money and Labor",
  ),

  // Add more dummy posts here
];

// Widget for displaying a single post
class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({required this.post, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.shade200,
              Colors.grey.shade100
            ], // You can adjust these colors as needed
          ),
        ),
        // color: Colors.grey.shade100, // Background color of the card
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(post.agencyName,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.green.shade800)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.phone_android,
                      size: 14, color: Colors.green.shade800),
                  const Text(
                    " Contact: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(post.contactInfo),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.medical_services,
                      size: 14, color: Colors.green.shade800),
                  const Center(
                    child: Text(
                      " Service Type: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(post.serviceType),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  const SizedBox(width: 8),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green.shade800),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Border radius
                        ),
                      ),
                    ),
                    child: const Text(
                      'Volunteer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green.shade800),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Border radius
                        ),
                      ),
                    ),
                    child: const Text(
                      'Add To Calendar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {/* ... */},
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
