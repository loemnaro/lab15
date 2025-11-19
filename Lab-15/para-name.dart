void register({required String username, int age = 18}) {
  print("Username: $username");
  print("Age: $age");
}

void main() {
  register(username: "user01");
  register(username: "user02", age: 22);
}
