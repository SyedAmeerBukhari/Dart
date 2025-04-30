
void main() {
  int rows = 5;
  for (int i = 0; i < rows; i++) {
    String spaces = ' ' * (rows - i - 1);
    print(spaces + getRow(i).join(' '));
  }
}

List<int> getRow(int rowIndex) {
  List<int> row = [1];
  
  for (int i = 0; i < rowIndex; i++) {
    int val = row[i] * (rowIndex - i) ~/ (i + 1);
    row.add(val);
  }
  
  return row;
}
