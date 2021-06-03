import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLess extends StatefulWidget {
  const ImageLess({Key key}) : super(key: key);

  @override
  _ImageLessState createState() => _ImageLessState();
}

class _ImageLessState extends State<ImageLess> {
  final title = 'Fade in images';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body:ListView(
        children: [
          Stack(
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
              /*Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://image.awehome.com/data/uploads/housing/house/MTYyMjQ0OTMzNC00MjU=.jpg',
            ),
          )*/
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/3541365465.png',
                  image: 'https://image.awehome.com/data/uploads/housing/house/MTYyMjQ0OTMzNC00MjU=.jpg',
                ),
              )
            ],
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/350x150",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Center(
            child: Icon(Icons.android,size: 100,),
          ),
          Center(
            child: Icon(Icons.android,size: 100,),
          )
        ],
      ),


    );
  }
}
