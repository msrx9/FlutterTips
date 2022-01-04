import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:exif/exif.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  File? _file;
  String subTitle = 'default subTitle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Column(
        children: [
          Text(subTitle),
          if (_file != null)
            Image.file(
              _file!,
              fit: BoxFit.cover,
            ),
          OutlinedButton(
              onPressed: () async {
                final XFile? _image =
                    await _picker.pickImage(source: ImageSource.gallery);
                _file = File(_image!.path);
                setState(() {});
              },
              child: const Text('画像を選択')),
          OutlinedButton(
              onPressed: () async {
                final tags =
                    await readExifFromBytes(await _file?.readAsBytes());
                subTitle = tags.toString();
                setState(() {});
              },
              child: const Text('EXIF取得')),
        ],
      ),
    );
  }
}
