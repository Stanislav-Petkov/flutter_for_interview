class Solution{
   static bool binarySearchRecursive(List<int> array, int x, int left, int right){
    print('called $left $right');
     if(left > right){
      return false;
    }
    int mid = (left + right) ~/ 2;
    if(array[mid] == x){
      return true;
    }else if(x < array[mid]){
      return binarySearchRecursive(array, x, left, mid - 1);
    }else{
      return binarySearchRecursive(array, x, mid + 1, right);
    }
  }
}
void main(){
  // binary search algorithm
var list = [1,2,3,4,5,6,7,8,9,10];
  var t  = Solution.binarySearchRecursive(list, 1, 0, list.length-1);
  print(t);
}

