import 'dart:io';

void main() {
  int num = 0;
  for (int r = 1; r < 5; r++) {
    for (int c = 1; c <= r; c++) {
      num = num + 1;
      stdout.write("$num ");
    }
    print(" ");
  }
}
