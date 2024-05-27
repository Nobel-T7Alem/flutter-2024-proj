import 'package:Sebawi/presentation/widgets/profile_update_form.dart';
import 'package:flutter/material.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProfileUpdateForm(),
      ),
    );
  }
}




