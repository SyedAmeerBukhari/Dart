import "dart:io";

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);
  bool? result = isPrime(num);
  if (result) {
    print("$num is a prime number.");
  } else {
    print("$num is not a prime number.");
  }

}

