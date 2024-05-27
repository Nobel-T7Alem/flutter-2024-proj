import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Post> _posts = [
    Post(
      title: "Event in Central Park",
      content: "Details about the event...",
      date: "2024-04-18",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 51, 114, 53),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.person), text: 'Manage Users'),
            Tab(icon: Icon(Icons.business), text: 'Manage Agencies'),
            Tab(icon: Icon(Icons.post_add), text: 'Manage Posts'),
          ],
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          labelColor: Colors.white,
          indicatorWeight: 3,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildManageUsersTab(),
          _buildManageAgenciesTab(),
          _buildManagePostsTab(),
        ],
      ),
    );
  }

  Widget _buildManageUsersTab() {
    return Center(
      child: Text(
        'Manage Users',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Widget _buildManageAgenciesTab() {
    return Center(
      child: Text(
        'Manage Agencies',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Widget _buildManagePostsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Your Posts',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.green.shade900,
                child: ListTile(
                  title: Text(_posts[index].title,
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('Posted on ${_posts[index].date}',
                      style: TextStyle(color: Colors.white70)),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            _posts.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Post {
  String title;
  String content;
  String date;

  Post({required this.title, required this.content, required this.date});
}
