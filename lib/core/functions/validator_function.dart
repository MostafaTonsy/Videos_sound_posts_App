validinput(String val, int min, int max) {
  if (val.length > max) {
    return 'Input Can\'t be Greater than $max Characters';
  }
  if (val.isEmpty) {
    return 'Field Can\'t be Empty';
  }
  if (val.length < min) {
    return 'Input Can\'t be Shorter than $min Characters';
  }
}
