import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/widgets/drawer_widget.dart';
import 'package:ravintola_diagonal/widgets/custom_app_bar.dart';

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String category;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });
}

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);

  final List<MenuItem> menuItems = [
    // Pasta dishes
    MenuItem(
      name: 'Pasta Carbonara',
      description: 'Classic pasta with eggs, pecorino cheese, pancetta, and black pepper',
      price: 18.90,
      category: 'Pasta',
    ),
    MenuItem(
      name: 'Pasta al Pesto',
      description: 'Fresh basil pesto with pine nuts, garlic, and parmesan',
      price: 17.90,
      category: 'Pasta',
    ),
    // Steaks
    MenuItem(
      name: 'Grilled Ribeye',
      description: '250g premium ribeye with herb butter and seasonal vegetables',
      price: 32.90,
      category: 'Pihvi',
    ),
    MenuItem(
      name: 'Pepper Steak',
      description: '200g tenderloin with creamy pepper sauce and roasted potatoes',
      price: 34.90,
      category: 'Pihvi',
    ),
    // Appetizers
    MenuItem(
      name: 'Bruschetta',
      description: 'Toasted bread with tomatoes, garlic, and fresh basil',
      price: 8.90,
      category: 'Appetizers',
    ),
    MenuItem(
      name: 'Caprese Salad',
      description: 'Fresh mozzarella, tomatoes, and basil with balsamic glaze',
      price: 9.90,
      category: 'Appetizers',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      drawer: const DrawerWidget(),
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCategorySection('Pasta'),
          _buildCategorySection('Pihvi'),
          _buildCategorySection('Appetizers'),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String category) {
    final categoryItems = menuItems.where((item) => item.category == category).toList();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8AB644),
            ),
          ),
        ),
        ...categoryItems.map((item) => _buildMenuItem(item)),
        const Divider(thickness: 2),
      ],
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '€${item.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}