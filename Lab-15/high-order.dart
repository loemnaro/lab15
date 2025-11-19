void calculate(int a, int b, Function operation) {
  print(operation(a, b));
}

int add(int x, int y) => x + y;

Function multiplier(int factor) {
  return (int number) => number * factor;
}

void main() {
  calculate(5, 3, add);

  var doubleIt = multiplier(2);
  print(doubleIt(10)); 
}
