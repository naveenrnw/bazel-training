#include <iostream>

void print_sum(int sum) {
  std::cout << "Sum is " << sum;
}

int main(int argc, char** argv) {
  int a,b;
  std::cin >> a >> b;
  print_sum(a+b);
  return 0;
}
