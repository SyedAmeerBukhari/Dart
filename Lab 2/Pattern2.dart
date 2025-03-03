import 'dart:io';

void main() {
  int n = 5; // Size of the spiral (5x5)
  int value = 1; // Starting value
  int rowStart = 0, rowEnd = n - 1;
  int colStart = 0, colEnd = n - 1;
  
  // Create a 2D list to store the spiral pattern
  List<List<int>> spiral = List.generate(n, (_) => List.filled(n, 0));

  while (rowStart <= rowEnd && colStart <= colEnd) {
    // Traverse from left to right along the top row
    for (int i = colStart; i <= colEnd; i++) {
      spiral[rowStart][i] = value++;
    }
    rowStart++;

    // Traverse from top to bottom along the right column
    for (int i = rowStart; i <= rowEnd; i++) {
      spiral[i][colEnd] = value++;
    }
    colEnd--;

    // Traverse from right to left along the bottom row
    if (rowStart <= rowEnd) {
      for (int i = colEnd; i >= colStart; i--) {
        spiral[rowEnd][i] = value++;
      }
      rowEnd--;
    }

    // Traverse from bottom to top along the left column
    if (colStart <= colEnd) {
      for (int i = rowEnd; i >= rowStart; i--) {
        spiral[i][colStart] = value++;
      }
      colStart++;
    }
  }

  // Print the spiral pattern
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write(spiral[i][j].toString().padLeft(2) + ' ');
    }
    print('');
  }
}