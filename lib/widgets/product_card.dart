import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final discount = product.oldPrice != null
        ? (((product.oldPrice! - product.currentPrice) / product.oldPrice!) * 100).round()
        : 0;

    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔴 Image + Discount badge + Favorite icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  product.imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (discount > 0)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "-$discount%",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          // ⭐ Rating + buyer count
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Row(
              children: [
                RatingBarIndicator(
                  rating: product.rating,
                  itemBuilder: (context, index) =>
                  const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 16,
                  direction: Axis.horizontal,
                ),
                const SizedBox(width: 4),
                Text(
                  "(${product.boughtCount})",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          // 🏷 Category
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Text(
              product.category,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ),

          // 👗 Title
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 2),
            child: Text(
              product.title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // 💰 Prices
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 4, bottom: 8),
            child: Row(
              children: [
                if (product.oldPrice != null)
                  Text(
                    "${product.oldPrice!.toStringAsFixed(0)}\$ ",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                Text(
                  "${product.currentPrice.toStringAsFixed(0)}\$",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
