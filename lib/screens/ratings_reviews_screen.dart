import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class RatingsReviewsScreen extends StatelessWidget {
  const RatingsReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Rating&Reviews', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('4.3', style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(width: 16),
                Expanded(child: _RatingBars()),
              ],
            ),
            const SizedBox(height: 8),
            const Text('23 ratings', style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 11)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('8 reviews', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black)),
                Row(
                  children: [
                    Icon(Icons.check_box_outline_blank, size: 18, color: Colors.black),
                    SizedBox(width: 8),
                    Text('With photo', style: TextStyle(color: Colors.black, fontSize: 14)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            ...List.generate(3, (i) => _ReviewCard(index: i)),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: CustomButton(
          label: 'Write a review',
          onPressed: () {},
          color: Colors.black,
          height: 48,
          radius: 25,
        ),
      ),
    );
  }
}

class _RatingBars extends StatelessWidget {
  const _RatingBars();

  @override
  Widget build(BuildContext context) {
    const data = [12, 5, 4, 2, 0];
    final maxVal = data.reduce((a, b) => a > b ? a : b).toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (i) {
        final count = data[i].toDouble();
        final stars = 5 - i;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(stars, (j) => const Icon(Icons.star, size: 12, color: Color(0xFFFFBA49))),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: maxVal == 0 ? 0 : count / maxVal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 16,
                child: Text(
                  data[i].toString(),
                  style: const TextStyle(color: Color(0xFF9B9B9B), fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final int index;
  const _ReviewCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final names = ['Helene Moore', 'Kim Shine', 'Kate Lin'];
    final dates = ['June 5, 2019', 'June 8, 2019', 'June 3, 2019'];
    final reviews = [
      "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those who are busty as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
      "The dress fits perfect! It's super cute and perfect for summer. Very light and airy. I love it!",
      "This dress is great! It fits me perfectly and the quality is amazing. I am 5'3\" and 115 pounds. I ordered a small and it was perfect. I will definitely be ordering more dresses from this brand.",
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/screens/ratings_reviews/avatar_${index + 1}.jpg'),
                onBackgroundImageError: (_, __) {},
                backgroundColor: const Color(0xFFE9E9E9),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names[index], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Color(0xFFFFBA49), size: 14),
                        Icon(Icons.star, color: Color(0xFFFFBA49), size: 14),
                        Icon(Icons.star, color: Color(0xFFFFBA49), size: 14),
                        Icon(Icons.star, color: Color(0xFFFFBA49), size: 14),
                        Icon(Icons.star, color: Color(0xFFFFBA49), size: 14),
                      ],
                    ),
                  ],
                ),
              ),
              Text(dates[index], style: const TextStyle(color: Color(0xFF9B9B9B), fontSize: 11)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            reviews[index],
            style: const TextStyle(color: Colors.black, height: 1.5, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('Helpful', style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 11)),
              SizedBox(width: 12),
              Icon(Icons.thumb_up_outlined, size: 16, color: Color(0xFF9B9B9B)),
            ],
          ),
        ],
      ),
    );
  }
}
