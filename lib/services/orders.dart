import 'package:cargo/NetworkHandler.dart';

NetworkHandler networkHandler = NetworkHandler();

getAllOrders() async {
  var res = await await networkHandler.get("/api/all/orders");
  var orders = res['orders'];
  return orders;
}
