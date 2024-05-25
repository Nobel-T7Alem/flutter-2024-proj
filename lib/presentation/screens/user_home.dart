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
            title: Text('Agency Posts',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.green.shade800)),
            bottom: TabBar(
              tabs: const [
                Tab(
                  child: Text(
                    "Posts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "My Calendar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              labelColor: Colors.green.shade800,
              unselectedLabelColor: Colors.grey.shade800,
              indicatorColor: Colors.green.shade800,
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostItem(
                        post: posts[index],
                        isMyPost: true,
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                    ],
                  );
                },
              ),
              // const Center(child: Text("My Calendar")),
              ListView.builder(
                itemCount: calendar.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(calendar[index]),
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
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

List calendar = [];
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
class PostItem extends StatefulWidget {
  final Post post;
  final bool isMyPost;
  PostItem({required this.post, required this.isMyPost, super.key});

  @override
  _PostItemState createState() => _PostItemState();
  TextEditingController _dateController = TextEditingController();
}

class _PostItemState extends State<PostItem> {
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
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              widget.post.agencyName,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.green.shade800),
            ),
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
                  Text(widget.post.contactInfo),
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
                  Text(widget.post.serviceType),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.isMyPost) ...[
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade800),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Border radius
                            ),
                          ),
                        ),
                        child: const Text(
                          'Volunteer Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        onPressed: () {
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade800),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Border radius
                            ),
                          ),
                        ),
                        child: const Text(
                          'Add To Calendar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        onPressed: () {
                          _selectDate();
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (picked != null) {
      setState(() {
        widget._dateController.text = picked.toString().split(" ")[0];
        calendar.add(picked.toString().split(" ")[0]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "Date selected for ${widget.post.agencyName}: ${widget._dateController.text}"),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
            duration: const Duration(seconds: 5),
          ),
        );
      });
    }
  }

}
