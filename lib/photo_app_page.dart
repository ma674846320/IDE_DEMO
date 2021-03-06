import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 拍照app开发
class PhotoApp extends StatefulWidget {
  const PhotoApp({Key key}) : super(key: key);

  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List _images = [];
  final picker = ImagePicker();

  Future getImage(bool isTackPhoto) async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(source: isTackPhoto?ImageSource.camera:ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app拍照开发123'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(context: context, builder: (context)=>Container(
      height: 160,
      child: Column(
        children: [
          _item('拍照',true),
          _item('从相册选择', false),
        ],
      ),
    ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto?Icons.camera_alt:Icons.photo_library),
        title:Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _genImages() {
    return _images.map((file) {
      return Stack(
        children: [
          ClipRRect(
            // 圆角
            borderRadius: BorderRadius.circular(5),
            child: Image.file(file,width: 120,height:90,fit:BoxFit.fill),
          ),
          Positioned(
              right: 5,
              top:5,
              child: GestureDetector(
                onTap:(){
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color:Colors.black54),
                    child: Icon(Icons.close, size: 18, color: Colors.white)
                  ),
                ),
              ))
        ],
      );
    }).toList();
  }
}
