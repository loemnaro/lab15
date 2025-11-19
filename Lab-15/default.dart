void welcome(String name, {String role = "Student"}) {
print("Hello $name, Role: $role");
}
void main() {
welcome("Naro");
welcome("Naro", role: "seller");
}