import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instg_app/screen/add_post/add_post_screen.dart';
import 'package:instg_app/utils/utils.dart';

class AppProvider with ChangeNotifier {
  Uint8List? finalfile;

  // late ValueNotifier<Uint8List?> _file;

  // void initState() {
  //   _file = ValueNotifier<Uint8List?>(null);
  // }

  // void dispose() {
  //   _file.dispose();
  // }
  // //getter

  // ValueNotifier<Uint8List?> get getFile {
  //   _file = ValueNotifier<Uint8List?>(null);
  //   return _file;
  // }

  // set settFile(Uint8List? file) {
  //   _file.value = file;
  // }

  selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (_) {
          // return ValueListenableBuilder(
          //     valueListenable: file,
          //     builder: (context, file, child) {
          return SimpleDialog(
            title: const Text('Create a Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take  Photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickeImage(ImageSource.camera);
                  finalfile = file;

                  notifyListeners();
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('choose from  Gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List? file = await pickeImage(ImageSource.gallery);

                  finalfile = file;
                  await navigatorToAtherScreen(context, AddPostScreen());
                  notifyListeners();
                },
              )
            ],
          );
        });
  }
}
