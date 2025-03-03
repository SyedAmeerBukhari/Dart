import 'dart:io';
void main() {
 int rows = 5;

  for (int i = 1; i <= rows; i++) {
    int num = i * 10;
    for (int j = 1; j <= i; j++) {
      num -= 9;
      stdout.write('$num ');
       
    }
    print(''); 
  }
}
