
import 'dart:async';

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();
 
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      {'name': 'Item 1', 'price': 20, 'id': 1},
      {'name': 'Item 2', 'price': 100, 'id': 2},
      {'name': 'Item 3', 'price': 10, 'id': 3},
      {'name': 'Item 4', 'price': 90, 'id': 4},
    ],
    'cart items': []
  };

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

   
  void dispose() {
    cartStreamController.close();  
  }
}

final bloc = CartItemsBloc();
