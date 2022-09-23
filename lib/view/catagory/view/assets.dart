import 'dart:io';

import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../list/list.dart';

enum AppTheme { candy, cocktail }

class Assets extends StatefulWidget {
  final AppTheme theme;
  const Assets({Key? key, required this.theme}) : super(key: key);

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  AppTheme? _theme;
  String? _dir;
  List<String>? _images;

  var api =
      'https://firebasestorage.googleapis.com/v0/b/playground-a753d.appspot.com/o';

  @override
  void initState() {
    super.initState();
    _theme = widget.theme;
    _images = data[_theme];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          child: const Icon(Icons.style),
          onPressed: () async {
            if (_theme == AppTheme.candy) {
              await _downloadAssets('cocktail');
            }
            setState(() {
              _theme =
                  _theme == AppTheme.candy ? AppTheme.cocktail : AppTheme.candy;
              _images = data[_theme];
            });
          },
        ),
      ),
      body: ListView.builder(
          itemCount: _images?.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return _getImage(
              _images![index],
              _dir ?? _images![index],
            );
          }),
    );
  }

  Widget _getImage(String name, String dir) {
    if (_theme != AppTheme.candy) {
      var file = _getLocalImageFile(name, dir);
      return Image.file(file);
    }
    return Image.asset('images/$name');
  }

  File _getLocalImageFile(String name, String dir) => File('$dir/$name');

  Future<void> _downloadAssets(String name) async {
    _dir ??= (await getApplicationDocumentsDirectory()).path;

    if (!await _hasToDownloadAssets(name, _dir ?? name)) {
      return;
    }
    var zippedFile = await _downloadFile(
        '$api/$name.zip?alt=media&token=7442d067-a656-492f-9791-63e8fc082379',
        '$name.zip',
        _dir ?? '$name.zip');

    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);

    for (var file in archive) {
      var filename = '$_dir/${file.name}';
      if (file.isFile) {
        var outFile = File(filename);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }

  Future<bool> _hasToDownloadAssets(String name, String dir) async {
    var file = File('$dir/$name.zip');
    return !(await file.exists());
  }

  Future<File> _downloadFile(String url, String filename, String dir) async {
    var req = await http.Client().get(Uri.parse(url));
    var file = File('$dir/$filename');
    return file.writeAsBytes(req.bodyBytes);
  }
}
