void change(int x) {
x = 100;
}
void main() {
int a = 10;
change(a);
print(a); // 10 (NOT changed)
}