List parseGoDuration(String val) {
  dynamic hr = '0', min = '0';
  var j = 0;

  for (var i = 0; i < val.length; i++) {
    if (val[i] == 'h') {
      hr = val.substring(0, i);
      j = i;
    }

    if (val[i] == 'm') min = val.substring(j + 1, i);
  }

  return [hr, min];
}

String toGoDuration(String hr, String min) => '${hr}h${min}m';
