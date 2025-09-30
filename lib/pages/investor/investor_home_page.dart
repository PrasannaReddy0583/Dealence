import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:striv/entites/investments_entites.dart';
import 'package:striv/pages/notifications.dart';
import 'package:striv/pages/settings/settings_screen.dart';
import 'package:striv/utils/app_palette.dart';
import 'package:striv/widgets/investments_card_widget.dart';

class AppColors {
  static Color primary = Color(0xFFEFBA8F);
  static Color primaryDark = Color(0xFFEFBA8F);

  static Color background = Color(0xFFF8F7F6);
  static Color card = Color(0xFFFFFFFF);
  static Color softElev = Color(0xFFF5E8DC);

  static Color titleText = Color(0xFF000000);
  static Color mutedText = Color(0xFF757575);
  static Color accentText = Color(0xFF57493F);

  static Color progressBg = Color(0xFFF5E8DC);
  static Color progressFill = primary;

  static Color buttonBg = primary;
  static Color outline = Color(0xFFF5E8DC);
}

double scale(BuildContext context, double size) {
  double baseWidth = 390;
  double screenWidth = MediaQuery.of(context).size.width;
  return size * (screenWidth / baseWidth);
}

class InvestorHomePage extends StatelessWidget {
  const InvestorHomePage({super.key, required isInvestor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFDF5EC), Color(0xFFF5E7DA)],
        ),
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: AppPalette.transparent,
              floating: true,
              snap: true,
              // automaticallyImplyLeading: true,
              backgroundColor: Color(0xFFFDF5EC),
              pinned: false,
              expandedHeight: scale(context, 65),
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 10,
                  bottom: 2,
                ),
              ),
              title: HeaderSection(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scale(context, 16),
                  vertical: scale(context, 18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: scale(context, 20),
                  children: [
                    // HeaderSection(),
                    // SizedBox(height: scale(context, 18)),
                    InvestmentsListSection(),
                    NewInvestorSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: scale(context, 26),
          backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=47'),
        ),
        SizedBox(width: scale(context, 12)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Alex!',
                style: TextStyle(
                  fontSize: scale(context, 18),
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleText,
                ),
              ),
              SizedBox(height: scale(context, 4)),
              Text(
                "${getGreeting()} 👋",
                style: TextStyle(
                  fontSize: scale(context, 18),
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleText,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
              icon: Icon(CupertinoIcons.bell, size: 30),
              color: AppPalette.black,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              icon: Icon(CupertinoIcons.settings, size: 30),
              color: AppPalette.black,
            ),
          ],
        ),
      ],
    );
  }
}

class InvestmentsListSection extends StatelessWidget {
  const InvestmentsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<InvestmentsEntites> pitches = [
      InvestmentsEntites(
        investorid: "1",
        title: "EcoBloom",
        subtitle: "Sustainable Consumer Goods",
        progress: 0.5,
        investors: 12,
        views: 250,
        feedback: 5,
      ),
      InvestmentsEntites(
        investorid: '1',
        title: "GreenTech",
        subtitle: "Clean Energy Solutions",
        progress: 0.7,
        investors: 18,
        views: 300,
        feedback: 7,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Investments',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: scale(context, 16),
                color: AppColors.titleText,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to full list screen
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: scale(context, 12)),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: pitches.length,
            itemBuilder: (context, index) {
              return InvestmentsCardWidget(investments: pitches[index]);
            },
          ),
        ),
        // SizedBox(height: 10),
      ],
    );
  }
}

/// Investors Section (fixed overflow issue)
class NewInvestorSection extends StatelessWidget {
  const NewInvestorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final investors = [
      {
        'name': 'Ethan Carter',
        'role': 'Tech, Early Stage',
        'avatar': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'name': 'Sophia Bennett',
        'role': 'Sustainability, Seed',
        'avatar': 'https://i.pravatar.cc/150?img=8',
      },
      {
        'name': 'Maya Patel',
        'role': 'Growth, Series A',
        'avatar': 'https://i.pravatar.cc/150?img=34',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Entrepreneur Smart Matching',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: scale(context, 16),
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: scale(context, 12)),
        SizedBox(
          height: scale(context, 180),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: investors.length,
            separatorBuilder: (_, __) => SizedBox(width: scale(context, 12)),
            itemBuilder: (context, idx) {
              final inv = investors[idx];
              return InvestorCard(
                name: inv['name']!,
                role: inv['role']!,
                avatarUrl: inv['avatar']!,
                width: MediaQuery.of(context).size.width * 0.42,
              );
            },
          ),
        ),
      ],
    );
  }
}

class InvestorCard extends StatelessWidget {
  final String name;
  final String role;
  final String avatarUrl;
  final double width;

  const InvestorCard({
    super.key,
    required this.name,
    required this.role,
    required this.avatarUrl,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: scale(context, 12),
        vertical: scale(context, 14),
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(scale(context, 14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: scale(context, 8),
            offset: Offset(0, scale(context, 4)),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: scale(context, 28),
            backgroundImage: NetworkImage(avatarUrl),
            backgroundColor: AppColors.softElev,
          ),
          SizedBox(height: scale(context, 8)),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: scale(context, 13),
              color: AppColors.titleText,
            ),
          ),
          SizedBox(height: scale(context, 2)),
          Text(
            role,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: scale(context, 11),
              color: AppColors.mutedText,
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: scale(context, 32),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.background,
                side: BorderSide(color: AppColors.outline),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(scale(context, 10)),
                ),
                padding: EdgeInsets.symmetric(vertical: scale(context, 6)),
              ),
              child: Text(
                'Connect',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: scale(context, 12),
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
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 11, color: AppColors.mutedText)),
      ],
    );
  }
}

String getGreeting() {
  final now = DateTime.now();
  final hour = now.hour;
  final minute = now.minute;

  if (hour < 12 || (hour == 11 && minute <= 59)) {
    return "Good Morning";
  } else if ((hour == 12 || hour < 15) || (hour == 15 && minute <= 30)) {
    return "Good Afternoon";
  } else if ((hour > 15 && hour < 20) ||
      (hour == 15 && minute > 30) ||
      (hour == 20 && minute <= 30)) {
    return "Good Evening";
  } else {
    return "Good Night";
  }
}
