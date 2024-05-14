import 'package:flutter/material.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('SampleItem');
    // return ListView.builder(
    // // Providing a restorationId allows the ListView to restore the
    // // scroll position when a user leaves and returns to the app after it
    // // has been killed while running in the background.
    //   restorationId: 'booksList',
    //   itemCount: list.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //         title: const Text('SampleItem'),
    //         leading: const CircleAvatar(
    //           // Display the Flutter Logo image asset.
    //           foregroundImage: AssetImage('assets/images/flutter_logo.png'),
    //         ),
    //         onTap: () {
    //           // Navigate to the details page. If the user leaves and returns to
    //           // the app after it has been killed while running in the
    //           // background, the navigation stack is restored.
    //           Navigator.restorablePushNamed(
    //             context,
    //             SampleItemDetailsView.routeName,
    //           );
    //         });
    //   },
    // );
  }
}
