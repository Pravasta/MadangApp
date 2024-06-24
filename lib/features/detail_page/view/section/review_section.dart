import 'package:flutter/material.dart';
import 'package:madang/features/detail_page/view/widgets/review_card.dart';
import '../../../../constant/app_text.dart';
import '../../models/detail_resto_model.dart';
import '../widgets/dialog_widget.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({super.key, this.data});

  final Restaurant? data;

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final TextEditingController _reviewC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Review Customers',
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buttonAddReview(),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: widget.data!.customerReviews!.map((e) {
              return ReviewCard(data: e);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buttonAddReview() {
    return IconButton(
      onPressed: () {
        dialogWidget(
          context,
          controller: _reviewC,
          id: widget.data!.id,
        );
      },
      icon: const Icon(Icons.reviews_outlined),
    );
  }
}
