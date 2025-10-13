import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/banner.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Title text (centered horizontally, near the top or middle)
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.4, // adjust position as needed
                    left: 22,
                    right: 0,
                    child: Text(
                      "Fashion\nSale",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        shadows: const [
                          Shadow(
                            color: Colors.black54,
                            offset: Offset(2, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Button below the text
                  Positioned(
                    bottom: 24, // distance from bottom of image
                    left: 22,
                    right: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3, // 30% of screen width
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // red background
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            "Check",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0), // optional for consistent spacing
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 pushes columns to opposite sides
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // left-aligned
                    children: [
                      Text(
                        "New",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "You've never seen it before",
                        style: GoogleFonts.poppins(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
