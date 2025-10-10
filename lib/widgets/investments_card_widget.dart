import 'package:flutter/material.dart';
import 'package:striv/entites/investments_entites.dart';
import 'package:striv/pages/entrepreneur/home_page.dart';
// import 'package:striv/utils/app_palette.dart';
// for scaleWidth/scaleHeight and StatColumn

class InvestmentsCardWidget extends StatelessWidget {
  final InvestmentsEntites investments;
  const InvestmentsCardWidget({super.key, required this.investments});

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.85;

    return Container(
      height: MediaQuery.of(context).size.height*0.95,
      width: cardWidth,
      margin: EdgeInsets.only(right: scaleWidth(context, 16)),
      padding: EdgeInsets.all(scaleWidth(context, 16)),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(scaleWidth(context, 16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: scaleWidth(context, 12),
            offset: Offset(0, scaleHeight(context, 6)),
          ),
        ],
      ),
      child: Column(
        children: [
          // Pitch Header
          Row(
            children: [
              Container(
                width: scaleWidth(context, 56),
                height: scaleWidth(context, 56),
                decoration: BoxDecoration(
                  color: AppColors.softElev,
                  borderRadius: BorderRadius.circular(scaleWidth(context, 10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://via.placeholder.com/64'),
                  ),
                ),
              ),
              SizedBox(width: scaleWidth(context, 12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      investments.title,
                      style: TextStyle(
                        fontSize: scaleWidth(context, 16),
                        fontWeight: FontWeight.w700,
                        color: AppColors.titleText,
                      ),
                    ),
                    SizedBox(height: scaleHeight(context, 4)),
                    Text(
                      investments.subtitle,
                      style: TextStyle(
                        fontSize: scaleWidth(context, 12),
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: scaleHeight(context, 14)),

          // Funding progress label
          Row(
            children: [
              Expanded(
                child: Text(
                  'Funding Progress',
                  style: TextStyle(
                    fontSize: scaleWidth(context, 13),
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleText,
                  ),
                ),
              ),
              Text(
                'Goal Reached',
                style: TextStyle(
                  fontSize: scaleWidth(context, 12),
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),

          SizedBox(height: scaleHeight(context, 8)),

          // Progress Bar
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(scaleWidth(context, 10)),
                  child: LinearProgressIndicator(
                    value: investments.progress,
                    minHeight: scaleHeight(context, 10),
                    backgroundColor: AppColors.progressBg,
                    valueColor: AlwaysStoppedAnimation(AppColors.progressFill),
                  ),
                ),
              ),
              SizedBox(width: scaleWidth(context, 12)),
              Text(
                '${(investments.progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: scaleWidth(context, 13),
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleText,
                ),
              ),
            ],
          ),

          SizedBox(height: scaleHeight(context, 14)),

          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatColumn(
                number: investments.investors.toString(),
                label: 'Investors',
              ),
              StatColumn(
                number: investments.views.toString(),
                label: 'Pitch Views',
              ),
              StatColumn(
                number: investments.feedback.toString(),
                label: 'Feedback',
              ),
            ],
          ),

          SizedBox(height: scaleHeight(context, 16)),

          // View Analytics Button
          SizedBox(
            width: double.infinity,
            height: scaleHeight(context, 44),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(scaleWidth(context, 12)),
                ),
                elevation: 0,
              ),
              child: Text(
                'View Pitch Analytics',
                style: TextStyle(
                  fontSize: scaleWidth(context, 15),
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatColumn extends StatelessWidget {
  final String number;
  final String label;

  const StatColumn({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: scaleWidth(context, 16),
            fontWeight: FontWeight.w800,
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: scaleHeight(context, 4)),
        Text(
          label,
          style: TextStyle(
            fontSize: scaleWidth(context, 11),
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}

