void main() {
  List<String> dataList = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  Map<String, int> frekuensi = {};

  for (String item in dataList) {
    if (frekuensi.containsKey(item)) {
      frekuensi[item] = frekuensi[item]! + 1;
    } else {
      frekuensi[item] = 1;
    }
  }

  frekuensi.forEach((key, value) {
    print('$key: $value');
  });
}
