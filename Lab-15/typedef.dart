typedef MathOp = int Function(int, int);
int add(int a, int b) => a + b;
void compute(MathOp op) {
print(op(10, 20));
}
void main() {
compute(add);
}