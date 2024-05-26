import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const AgencyHomePage());
}

class AgencyHomePage extends StatelessWidget {
  const AgencyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
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
                Tab(
                  child: Text(
                    "Add Post",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              labelColor: Colors.green.shade800,
              unselectedLabelColor: Colors.grey.shade800,
              indicatorColor: Colors.green.shade800,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Text("Sebawi",
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
                    context.go('/agency_update');
                  },
                  icon: Icon(Icons.settings),
                  color: Colors.green.shade800,
                  iconSize: 27,
                ),
              )
            ],
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
              ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostItem(
                        post: posts[index],
                        isMyPost: false,
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
              ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Description'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Contact'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter youe contact';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                              buttonText: 'post',
                              buttonColor: Color.fromARGB(255, 255, 255, 255),
                              buttonTextColor:
                                  const Color.fromARGB(255, 33, 94, 35),
                              buttonAction: () {})
                        ],
                      ),
                    ),
                  );
                },
              )
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

  const PostItem({required this.post, required this.isMyPost, super.key});

  @override
  _PostItemState createState() => _PostItemState();
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
                    // if (widget.isMyPost) ...[
                    //   TextButton(
                    //     style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.all(Colors.green.shade800),
                    //       shape:
                    //           MaterialStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.circular(20), // Border radius
                    //         ),
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'Volunteer Now',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, color: Colors.white),
                    //     ),
                    //     onPressed: () {
                    //       _launchCaller(
                    //           widget.post.contactInfo
                    //       );
                    //     },
                    //   ),
                    //   const SizedBox(width: 8),
                    //   TextButton(
                    //     style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.all(Colors.green.shade800),
                    //       shape:
                    //           MaterialStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.circular(20), // Border radius
                    //         ),
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'Add To Calendar',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, color: Colors.white),
                    //     ),
                    //     onPressed: () {/* ... */},
                    //   ),
                    // ],
                    if (!widget.isMyPost) ...[
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.grey.shade900,
                        ),
                        onPressed: () {
                          openDialog();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.shade700,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Delete Post',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              content: const Text(
                                  'Are you sure you want to delete this post?'),
                              actions: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.redAccent.shade700),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Border radius
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green.shade800),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Border radius
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      posts.remove(widget.post);
                                    });
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                          );
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

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Edit Post',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          content: const Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Agency Name',
                  hintText: 'Enter the name of the agency',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contact Info',
                  hintText: 'Enter the contact information',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Service Type',
                  hintText: 'Enter the type of service',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.redAccent.shade700),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Border radius
                  ),
                ),
              ),
              child: const Text(
                'Discard',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade800),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Border radius
                  ),
                ),
              ),
              child: const Text(
                'Save Changes',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      );
}
