void modify(List<int> list) {
list[0] = 99; // modifies original
list = [7,8,9]; // reassigns local reference
}
void main() {
var nums = [1,2,3];
modify(nums);
print(nums); // [99,2,3]
}