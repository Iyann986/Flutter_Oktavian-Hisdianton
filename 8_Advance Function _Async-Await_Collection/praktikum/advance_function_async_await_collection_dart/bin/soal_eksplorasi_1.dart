void main() {
  List<String> dataList = [
    'amuse',
    'tommy kaira',
    'spon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];

  Set<String> unikDataList = Set<String>.from(dataList);
  List<String> result = unikDataList.toList();
  print(result);
}
