import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_details_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("Categories",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                fontWeight: FontWeight.bold
              )),
          leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.search, color: Colors.black)
            )
          ],
          bottom: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: [
              Tab(child: Text("Women", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                fontSize: 16,
              ),)),
              Tab(child: Text("Men", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                fontSize: 16,
              ),)),
              Tab(child: Text("Kids", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                fontSize: 16,
              ),)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildWomenTab(),
            _buildMenTab(),
            _buildKidsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildWomenTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Color(0xffd5341f),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  "SUMMER SALES",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 28,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Up to 50% off",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildCategoryItem("New", "assets/images/banner.png"),
                _buildCategoryItem("Clothes", "assets/products/casual_shirt.webp"),
                _buildCategoryItem("Shoes", "assets/products/evening_dress.png"),
                _buildCategoryItem("Accesories", "assets/products/sports_dress.png"),
              ],
            ),
          ),
        ],
      ),
      );
  }

  Widget _buildMenTab() {
    return const Center(child: Text("Men's Categories Coming Soon"));
  }

  Widget _buildKidsTab() {
    return const Center(child: Text("Kids' Categories Coming Soon"));
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        final tabController = DefaultTabController.of(context);
        final gender = tabController.index == 0 
            ? "Women" 
            : tabController.index == 1 
                ? "Men" 
                : "Kids";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsScreen(
              gender: gender,
              category: title,
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 2,
              color: Colors.black.withValues(alpha: 0.1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Left side - Text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Right side - Image
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
