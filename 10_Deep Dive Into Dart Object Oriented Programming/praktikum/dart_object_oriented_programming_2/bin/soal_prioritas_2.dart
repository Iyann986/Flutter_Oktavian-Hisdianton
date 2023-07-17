class KPK {
  int x;
  int y;

  KPK(this.x, this.y);
}

class FPB {
  int x;
  int y;

  FPB(this.x, this.y);
}

class Matematika implements KPK, FPB {
  @override
  int x;
  @override
  int y;

  Matematika(this.x, this.y);

  int hasil() {
    return x * y;
  }
}

void main() {
  Matematika operation = Matematika(6, 8);
  print(operation.hasil()); // Output: 48
}
