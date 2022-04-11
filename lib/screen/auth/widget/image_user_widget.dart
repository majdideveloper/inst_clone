import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageUserWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Uint8List? image;
  const ImageUserWidget({Key? key, this.onPressed, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      image != null
          ? CircleAvatar(
              radius: 64,
              backgroundImage: MemoryImage(image!),
            )
          : const CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                'https://icon-library.com/images/default-profile-icon/default-profile-icon-24.jpg',
              ),
            ),
      Positioned(
        bottom: -10,
        left: 80,
        child: CircleAvatar(
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.add_a_photo,
            ),
          ),
        ),
      ),
    ]);
  }
}
