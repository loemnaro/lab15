void showInfo(String name, [int? age]) {
  print("Name: $name");
  print("Age: ${age ?? 'Unknown'}");
}

void main() {
  showInfo("Naro");
  showInfo("Naro", 23);
}
