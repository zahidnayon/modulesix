import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (int i = 1; i <= 6; i++)
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Clicked on photo $i!')),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(
                          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
                          height: 120.0,
                          width: 120.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8.0),
                        Text('Photo $i'),
                      ],
                    ),
                  ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (int i = 1; i <= 3; i++)
                  ListTile(
                    leading: Image.network(
                      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
                      height: 48.0,
                      width: 48.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text('Photo $i'),
                    subtitle: Text('Subtitle $i'),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.cloud_upload),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Photos Uploaded Successfully!')),
          );
        },
      ),
    );
  }
}
