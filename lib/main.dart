import 'package:flutter/material.dart';

import 'cart.dart';
import 'orderdFood.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Fireb
  runApp(FoodOrderingApp());
}

class FoodOrderingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartScreen([]), // Pass your cart items here
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton('Pizza'),
                    CategoryButton('Burgers'),
                    CategoryButton('Pasta'),
                    CategoryButton('Sushi'),
                    CategoryButton('Drinks'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // Change this value as needed
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return FoodCard(
                  'assets/food.jpg',
                  'Food Name',
                  '\$10',
                  '4.5 ',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String category;

  CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(category),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String imageAsset;
  final String foodName;
  final String price;
  final String rating;

  FoodCard(this.imageAsset, this.foodName, this.price, this.rating);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FittedBox(
                child: Image.asset(
                  imageAsset,
                  // height: 150,
                  // width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                foodName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 16,
                      ),
                      Text(
                        price,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      Text(
                        rating,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderedFoodScreen([
                              OrderedFood(
                                  image: imageAsset,
                                  foodName: foodName,
                                  price: price,
                                  rating: rating)
                            ])),
                  );
                },
                child: Text('Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
