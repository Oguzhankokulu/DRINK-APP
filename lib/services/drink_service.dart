import '../models/drink.dart';

List<Drink> allDrinks = [
  Drink(name: "Iced Americano", attributes: ["cold","not-sweet","coffee","no-milk"], image: "assets/images/iced_americano.png"),
  Drink(name: "Iced Filter Coffee", attributes: ["cold","not-sweet","coffee","no-milk"], image: "assets/images/iced_americano.png"),
  Drink(name: "Iced Latte", attributes: ["cold","not-sweet","coffee","milk"], image: "assets/images/iced_latte.png"),
  Drink(name: "Espresso Frappe", attributes: ["cold","not-sweet","coffee","milk"], image: "assets/images/espresso_frappe.png"),
  Drink(name: "Mocha Frappe", attributes: ["cold","sweet","creamy","coffee","non-caramel"], image: "assets/images/mocha_frappe.png"),
  Drink(name: "Caramel Frappe", attributes: ["cold","sweet","creamy","coffee","non-chocolate"], image: "assets/images/caramel_frappe.png"),
  Drink(name: "Iced Chocolate Cookie Latte", attributes: ["cold","sweet","creamy","coffee","non-caramel"], image: "assets/images/iced_chocolate_cookie_latte.png"),
  Drink(name: "Iced Salted Caramel Latte", attributes: ["cold","sweet","creamy","coffee","non-chocolate"], image: "assets/images/iced_salted_caramel_latte.png"),
  Drink(name: "Iced Chai Tea Latte", attributes: ["cold","sweet","creamy","coffee"], image: "assets/images/iced_chai_tea_latte.png"),
  Drink(name: "Milkshake", attributes: ["cold","sweet","creamy","not-coffee"], image: "assets/images/milkshake.png"),
  Drink(name: "Smoothie", attributes: ["cold","sweet","fruity","juice"], image: "assets/images/smoothie.png"),
  Drink(name: "Fruit Juice", attributes: ["cold","sweet","fruity","juice"], image: "assets/images/fruit_juice.png"),
  Drink(name: "Lemonade", attributes: ["cold","sweet","fruity","juice"], image: "assets/images/lemonade.png"),
  Drink(name: "Ice Bubble Tea", attributes: ["cold","sweet","fruity","juice"], image: "assets/images/ice_bubble_tea.png"),
  Drink(name: "Ice Tea", attributes: ["cold","sweet","fruity","juice"], image: "assets/images/ice_tea.png"),
  Drink(name: "Refreshing Drinks (Cool lime etc.)", attributes: ["cold","sweet","fruity","juice"], image: "assets/images/refreshing_drinks.png"),
  Drink(name: "Mineral Water", attributes: ["cold","not-sweet","not-coffee"], image: "assets/images/mineral_water.png"),
  Drink(name: "Cola", attributes: ["cold","sweet","fruity","soda"], image: "assets/images/cola.png"),
  Drink(name: "Fruit Soda", attributes: ["cold","sweet","fruity","soda"], image: "assets/images/fruit_soda.png"),
  Drink(name: "Espresso", attributes: ["hot","coffee","not-sweet","no-milk","strong"], image: "assets/images/espresso.png"),
  Drink(name: "Espresso Macchiato", attributes: ["hot","coffee","not-sweet","no-milk","strong"], image: "assets/images/espresso_macchiato.png"),
  Drink(name: "Cortado", attributes: ["hot","coffee","not-sweet","milk","strong"], image: "assets/images/cortado.png"),
  Drink(name: "Americano", attributes: ["hot","coffee","not-sweet","no-milk","soft"], image: "assets/images/americano.png"),
  Drink(name: "Cappuccino", attributes: ["hot","coffee","not-sweet","milk","strong"], image: "assets/images/cappuccino.png"),
  Drink(name: "Miel", attributes: ["hot","coffee","sweet","milk"], image: "assets/images/miel.png"),
  Drink(name: "Latte", attributes: ["hot","coffee","not-sweet","milk","soft"], image: "assets/images/latte.png"),
  Drink(name: "Filter Coffee with milk", attributes: ["hot","coffee","not-sweet","milk","strong"], image: "assets/images/filter_coffee_with_milk.png"),
  Drink(name: "Hot Chocolate", attributes: ["hot","not-coffee","sweet","milk"], image: "assets/images/hot_chocolate.png"),
  Drink(name: "Flat White", attributes: ["hot","coffee","not-sweet","milk","soft"], image: "assets/images/flat_white.png"),
  Drink(name: "Chai Tea Latte", attributes: ["hot","coffee","sweet","non-caramel","non-chocolate"], image: "assets/images/chai_tea_latte.png"),
  Drink(name: "Mocha", attributes: ["hot","coffee","sweet","non-caramel"], image: "assets/images/mocha.png"),
  Drink(name: "Latte Macchiato", attributes: ["hot","coffee","not-sweet","milk","soft"], image: "assets/images/latte_macchiato.png"),
  Drink(name: "Chocolate Cookie Latte", attributes: ["hot","coffee","sweet","non-caramel"], image: "assets/images/chocolate_cookie_latte.png"),
  Drink(name: "Caramel Macchiato", attributes: ["hot","coffee","sweet","non-chocolate"], image: "assets/images/caramel_macchiato.png"),
  Drink(name: "Salted Caramel Latte", attributes: ["hot","coffee","sweet","non-chocolate"], image: "assets/images/salted_caramel_latte.png"),
  Drink(name: "Pumpkin Latte", attributes: ["hot","coffee","sweet","non-chocolate","non-caramel"], image: "assets/images/pumpkin_latte.png"),
  Drink(name: "White Mocha", attributes: ["hot","coffee","sweet","non-caramel"], image: "assets/images/white_mocha.png"),
  Drink(name: "Turkish Coffee", attributes: ["hot","coffee","not-sweet","no-milk","strong"], image: "assets/images/turkish_coffee.png"),
  Drink(name: "Sahlep", attributes: ["hot","not-coffee","sweet","milk"], image: "assets/images/sahlep.png"),
  Drink(name: "Fruit Tea", attributes: ["hot","not-coffee","sweet","no-milk"], image: "assets/images/fruit_tea.png"),
  Drink(name: "Winter Tea", attributes: ["hot","not-coffee","not-sweet","aromatic"], image: "assets/images/winter_tea.png"),
  Drink(name: "Lemon Ginger Tea", attributes: ["hot","not-coffee","not-sweet","aromatic"], image: "assets/images/lemon_ginger_tea.png"),
  Drink(name: "Rose Hip Tea", attributes: ["hot","not-coffee","not-sweet","aromatic"], image: "assets/images/rose_hip_tea.png"),
  Drink(name: "Black Tea", attributes: ["hot","not-coffee","not-sweet","not-aromatic"], image: "assets/images/black_tea.png"),
  Drink(name: "Green Tea", attributes: ["hot","not-coffee","not-sweet","not-aromatic"], image: "assets/images/green_tea.png"),
];


List<Drink> filterDrinksByAttributes(List<String> requiredAttributes) {
  return allDrinks.where((drink) {
    // Check if the drink contains all required attributes
    return requiredAttributes.every((attr) => drink.attributes.contains(attr));
  }).toList();
}
