import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instg_app/providers/app_provider.dart';
import 'package:instg_app/utils/colors.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<AppProvider>().finalfile == null
        ? Center(
            child: IconButton(
                onPressed: () async =>
                    await context.read<AppProvider>().selectImage(
                          context,
                        ),
                icon: const Icon(Icons.upload_file)),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('post to '),
              centerTitle: false,
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('post',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                )
              ],
            ),
            body: GestureDetector(
              onTap: (() {
                FocusScope.of(context).requestFocus(FocusNode());
              }),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/2623968/pexels-photo-2623968.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const TextField(
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: 'Write a caption...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: AspectRatio(
                          aspectRatio: 487 / 451,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.pexels.com/photos/2623968/pexels-photo-2623968.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                                ),
                                fit: BoxFit.fill,
                                alignment: FractionalOffset.topCenter,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
