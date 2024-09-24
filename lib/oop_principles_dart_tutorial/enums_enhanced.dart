//https://www.darttutorial.org/dart-tutorial/dart-enum/
//Enhanced enums in Dart
enum OrderStatus {
  open(10),
  confirmed(20),
  completed(30),
  cancelled(40);

  final int progress;

  const OrderStatus(this.progress);

  bool operator <(OrderStatus status) => progress < status.progress;

  bool operator >(OrderStatus status) => progress > status.progress;
}

void main() {
  var status = OrderStatus.open;
  if (status < OrderStatus.completed) {
    var openProgress = status.progress;
    var completedProgress = OrderStatus.completed.progress;
    print('openProgress: $openProgress completedProgress $completedProgress');

    print('The order has not completed');
  }
}
