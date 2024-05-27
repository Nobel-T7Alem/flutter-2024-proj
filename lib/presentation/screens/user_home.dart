import 'package:Sebawi/data/services/api_path.dart';
import 'package:flutter/material.dart';
import '../../data/models/posts.dart';
import 'package:go_router/go_router.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  void initState() {
    fetchPosts();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Text('Sebawi',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.green.shade800)),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: IconButton(
                  onPressed: () {
                    context.go('/user_update');
                  },
                  icon: const Icon(Icons.settings),
                  color: Colors.green.shade800,
                  iconSize: 27,
                ),
              )
            ],
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
              FutureBuilder(
                future: fetchPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error loading posts"));
                  } else {
                    return ListView.builder(
                      itemCount: posts?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            PostItem(
                              post: posts![index],
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
                    );
                  }
                },
              ),
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

  fetchPosts() async {
    posts = await RemoteService().getPosts();
  }
}

List<Post>? posts;
List<String> calendar = [];

class PostItem extends StatefulWidget {
  final Post post;
  final bool isMyPost;
  PostItem({required this.post, required this.isMyPost, super.key});

  @override
  PostItemState createState() => PostItemState();
  final TextEditingController _dateController = TextEditingController();
}

class PostItemState extends State<PostItem> {
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
              widget.post.name,
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
                  Text(widget.post.contact),
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
                  Text(widget.post.description),
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
                          // Implement your logic here
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
                "Date selected for ${widget.post.name}: ${widget._dateController.text}"),
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
