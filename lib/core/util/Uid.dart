// ignore_for_file: file_names

import 'dart:math';

class UId {
  static const _string =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  ///Get random string from AaBb....Zz1234567890
  ///
  ///Ex: _getRandomString(2) ==> ag,gd,Dd,dE,z4...
  ///Ex: _getRandomString(1) ==> a,g,d,D,d,Z,E,z,4...
  static String _getRandomString(int length) {
    var random = Random();
    var str = String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _string.codeUnitAt(
          random.nextInt(_string.length),
        ),
      ),
    );
    return str;
  }

  static int _getRandomPosition(int lenght) {
    var random = Random();
    return random.nextInt(lenght);
  }

  ///Get unique id from current date convert to milisecond
  ///and split it at random position and add random string
  ///(AaBb...Zz1234567890) to middle
  ///Ex: 4824254606141 qauntityOfRandomString=2
  ///random postion at 4 => 4824 + aF + 254606141
  ///return 4824aF254606141
  static String getId({int qauntityOfRandomString = 3}) {
    var strMiliSecond = DateTime.now().millisecondsSinceEpoch.toString();
    var extraString = _getRandomString(qauntityOfRandomString);

    var position = _getRandomPosition(strMiliSecond.length);

    var id = strMiliSecond.substring(0, position) +
        extraString +
        strMiliSecond.substring(position);

    return id;
  }
}
