Future<List<int>> multiplyList(List<int> dataList, int multiplier) async {
  List<int> multiList = [];
  for (int value in dataList) {
    int result =
        await Future.delayed(Duration(seconds: 1), () => value * multiplier);
    multiList.add(result);
  }
  return multiList;
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int multiplier = 5;
  List<int> multiList = await multiplyList(data, multiplier);
  print(multiList); // Output: [5, 10, 15, 20, 25]
}
