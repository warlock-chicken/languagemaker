import 'dart:core';
//import 'dart:io' as io;
import 'dart:io';
//import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<List<String>> getlangsdb() async {
  List<String> langnames=[];
  final databasesPath = await getDatabasesPath();
  final file =  Directory(databasesPath).listSync();
  for (final f in file){
    if (f.path.substring(f.path.length-3)=='.db'){
      String str=f.path.substring(0,f.path.length-3);
      final l=str.split('/');
      str=l[l.length-1];
      langnames.add(str);
    }
  }
  return langnames;
}

Future<void> populatewithtests() async {
  List<String> tests=['a','b','c','d','f','g','j','k','k','l','n','m','o','p','q','r'];
  for (final i in tests){
    final databasesPath = await getDatabasesPath();
    var a=File("$databasesPath/$i.db");
    a.writeAsString('db contents.');
  }
}

Future<List<String>> dobothtest() async {
  await populatewithtests();
  final langnames=getlangsdb();
  return langnames;
}