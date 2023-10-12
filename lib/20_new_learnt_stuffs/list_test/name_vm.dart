import 'dart:collection';

import 'package:flutter/foundation.dart';

class NameVm extends ChangeNotifier {
  final _nameList = <String>[];
  final _namesGrouped = <String, Iterable<String>>{};

  UnmodifiableMapView<String, Iterable<String>> get nameList =>
      UnmodifiableMapView(_namesGrouped);

  loadData() {
    _addToNameList(sampleNames);
    if (hasListeners) notifyListeners();
  }

  void _addToNameList(Iterable<String> list) {
    _nameList.addAll(list);

    _namesGrouped.clear();
    final uniqueNameStrings = _nameList.map((name) => name[0]);

    for (var firstLetter in uniqueNameStrings) {
      _namesGrouped[firstLetter] = _nameList.where(
        (name) => name[0] == firstLetter,
      );
    }
  }
}

List<String> sampleNames = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Frank',
  'Grace',
  'Hannah',
  'Isaac',
  'Jack',
  'Katie',
  'Liam',
  'Mia',
  'Nathan',
  'Olivia',
  'Paul',
  'Quinn',
  'Rachel',
  'Steve',
  'Tina',
  'Ulysses',
  'Vera',
  'Will',
  'Xena',
  'Yara',
  'Zane',
  'Anna',
  'Brian',
  'Catherine',
  'Derek',
  'Elaine',
  'Freddie',
  'Gina',
  'Howard',
  'Ivy',
  'Justin',
  'Karen',
  'Larry',
  'Monica',
  'Nick',
  'Oscar',
  'Patty',
  'Quincy',
  'Rebecca',
  'Sam',
  'Tiffany',
  'Ursula',
  'Victor',
  'Wendy',
  'Xander',
  'Yvonne',
  'Zach',
  'Amber',
  'Brad',
  'Chloe',
  'Dominic',
  'Ellen',
  'Felix',
  'Gloria',
  'Ian',
  'Jasmine',
  'Kyle',
  'Laura',
  'Mike',
  'Nancy',
  'Otto',
  'Pamela',
  'Quinton',
  'Rita',
  'Shawn',
  'Tracy',
  'Upton',
  'Valerie',
  'Walter',
  'Xiomara',
  'Yasmine',
  'Zeus',
  'Amy',
  'Blake',
  'Cindy',
  'Dexter',
  'Emma',
  'Flynn',
  'Gwen',
  'Hugo',
  'Irene',
  'Jake',
  'Kelly',
  'Leo',
  'Mandy',
  'Ned',
  'Opal',
  'Priscilla',
  'Quest',
  'Randy',
  'Stella',
  'Tom',
  'Uma',
  'Vincent',
  'Whitney',
  'Xerxes',
  'Yolanda',
  'Zelda'
];
