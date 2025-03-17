//https://dart.dev/language/functions#anonymous-functions
const list = ['apples', 'bananas', 'oranges'];

void main(){
  var uppercaseList = list.map((item) {
    return item.toUpperCase();
  }).toList();
// Convert to list after mapping

  for (var item in uppercaseList) {
    print('$item: ${item.length}');
  }
}

