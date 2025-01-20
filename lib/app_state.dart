import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _recentSearches =
          prefs.getStringList('ff_recentSearches') ?? _recentSearches;
    });
    _safeInit(() {
      _singleUser = prefs.getString('ff_singleUser')?.ref ?? _singleUser;
    });
    _safeInit(() {
      _multipleUser = prefs
              .getStringList('ff_multipleUser')
              ?.map((path) => path.ref)
              .toList() ??
          _multipleUser;
    });
    _safeInit(() {
      _equalBreath = prefs.getInt('ff_equalBreath') ?? _equalBreath;
    });
    _safeInit(() {
      _boxBreath = prefs.getInt('ff_boxBreath') ?? _boxBreath;
    });
    _safeInit(() {
      _quizAnswers = prefs.getStringList('ff_quizAnswers')?.map((x) => int.parse(x)).toList() ?? _quizAnswers;
    });
    _safeInit(() {
      _kessler = prefs.getInt('ff_kessler') ?? _kessler;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<int> _quizAnswers = List.filled(10, 0);
  List<int> get quizAnswers => _quizAnswers;
  set quizAnswers(List<int> value) {
    _quizAnswers = value;
    prefs.setStringList('ff_quizAnswers', value.map((x) => x.toString()).toList());
  }

  void updateQuizAnswer(int questionIndex, int newAnswer) {
    // Calculate score difference
    int oldScore = _quizAnswers[questionIndex];
    int scoreDiff = newAnswer - oldScore;
    
    // Update answer
    _quizAnswers[questionIndex] = newAnswer;
    prefs.setStringList('ff_quizAnswers', _quizAnswers.map((x) => x.toString()).toList());
    
    // Update total score
    _kessler = _kessler + scoreDiff;
    prefs.setInt('ff_kessler', _kessler);
    notifyListeners();
  }

  void resetQuiz() {
    _quizAnswers = List.filled(10, 0);
    _kessler = 0;
    prefs.setStringList('ff_quizAnswers', _quizAnswers.map((x) => x.toString()).toList());
    prefs.setInt('ff_kessler', _kessler);
    notifyListeners();
  }

  int _kessler = 0;
  int get kessler => _kessler;
  set kessler(int value) {
    _kessler = value;
    prefs.setInt('ff_kessler', value);
    notifyListeners();
  }

  double _jurnalimagevalue = 0.0;
  double get jurnalimagevalue => _jurnalimagevalue;
  set jurnalimagevalue(double value) {
    _jurnalimagevalue = value;
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  bool _searchActive2 = false;
  bool get searchActive2 => _searchActive2;
  set searchActive2(bool value) {
    _searchActive2 = value;
  }

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> value) {
    _recentSearches = value;
    prefs.setStringList('ff_recentSearches', value);
  }

  void addToRecentSearches(String value) {
    recentSearches.add(value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeFromRecentSearches(String value) {
    recentSearches.remove(value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeAtIndexFromRecentSearches(int index) {
    recentSearches.removeAt(index);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void updateRecentSearchesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    recentSearches[index] = updateFn(_recentSearches[index]);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void insertAtIndexInRecentSearches(int index, String value) {
    recentSearches.insert(index, value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  DocumentReference? _singleUser =
      FirebaseFirestore.instance.doc('/users/7mY5Hd1gEBYG2DHBRgpoi6a4a8b2');
  DocumentReference? get singleUser => _singleUser;
  set singleUser(DocumentReference? value) {
    _singleUser = value;
    value != null
        ? prefs.setString('ff_singleUser', value.path)
        : prefs.remove('ff_singleUser');
  }

  List<DocumentReference> _multipleUser = [
    FirebaseFirestore.instance.doc('/users/1MJftsLBK4hfmEZ40DPCOKxILtQ2'),
    FirebaseFirestore.instance.doc('/users/4rf7XFRFusbq84DmqBEACiYslH22'),
    FirebaseFirestore.instance.doc('/users/7mY5Hd1gEBYG2DHBRgpoi6a4a8b2'),
    FirebaseFirestore.instance.doc('/users/HS0beOzJ0PdUiuY4wXbqTIofdU92'),
    FirebaseFirestore.instance.doc('/users/WvshHmexCXdskxrqvrAuLaoLczR2'),
    FirebaseFirestore.instance.doc('/users/eGKwSlke3WTCM4dAVartYw4NmC33'),
    FirebaseFirestore.instance.doc('/users/Icb3iZBXk0bODxg1U5BMGkOngv72')
  ];
  List<DocumentReference> get multipleUser => _multipleUser;
  set multipleUser(List<DocumentReference> value) {
    _multipleUser = value;
    prefs.setStringList('ff_multipleUser', value.map((x) => x.path).toList());
  }

  void addToMultipleUser(DocumentReference value) {
    multipleUser.add(value);
    prefs.setStringList(
        'ff_multipleUser', _multipleUser.map((x) => x.path).toList());
  }

  void removeFromMultipleUser(DocumentReference value) {
    multipleUser.remove(value);
    prefs.setStringList(
        'ff_multipleUser', _multipleUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromMultipleUser(int index) {
    multipleUser.removeAt(index);
    prefs.setStringList(
        'ff_multipleUser', _multipleUser.map((x) => x.path).toList());
  }

  void updateMultipleUserAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    multipleUser[index] = updateFn(_multipleUser[index]);
    prefs.setStringList(
        'ff_multipleUser', _multipleUser.map((x) => x.path).toList());
  }

  void insertAtIndexInMultipleUser(int index, DocumentReference value) {
    multipleUser.insert(index, value);
    prefs.setStringList(
        'ff_multipleUser', _multipleUser.map((x) => x.path).toList());
  }

  int _equalBreath = 1;
  int get equalBreath => _equalBreath;
  set equalBreath(int value) {
    _equalBreath = value;
    prefs.setInt('ff_equalBreath', value);
  }

  int _boxBreath = 1;
  int get boxBreath => _boxBreath;
  set boxBreath(int value) {
    _boxBreath = value;
    prefs.setInt('ff_boxBreath', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
