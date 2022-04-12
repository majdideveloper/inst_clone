import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickeImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('no image selected');
}

showSnakBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

navigatorToAtherScreen(BuildContext context, Widget atherPage) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => atherPage,
  ));
}
