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

// Utility for scaling based on screen width
double scaleWidth(BuildContext context, double size) {
  double baseWidth = 390;
  double screenWidth = MediaQuery.of(context).size.width;
  return size * (screenWidth / baseWidth);
}

// Utility for scaling based on screen height
double scaleHeight(BuildContext context, double size) {
  double baseHeight = 844; // typical iPhone 14 height
  double screenHeight = MediaQuery.of(context).size.height;
  return size * (screenHeight / baseHeight);
}

class InvestorHomePage extends StatelessWidget {
  const InvestorHomePage({super.key, required this.isInvestor});

  final bool isInvestor;

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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                expandedHeight: scaleHeight(context, 70),
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(context, 16),
                    vertical: scaleHeight(context, 10),
                  ),
                  child: HeaderSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(context, 16),
                    vertical: scaleHeight(context, 16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InvestmentsListSection(),
                      SizedBox(height: scaleHeight(context, 20)),
                      NewInvestorSection(),
                      SizedBox(height: scaleHeight(context, 20)),
                      TrendingInvestmentsSection(),
                      SizedBox(height: scaleHeight(context, 20)),
                      RecentActivitySection(),
                      SizedBox(height: scaleHeight(context, 20)),
                      InvestorTipsSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
          radius: scaleWidth(context, 26),
          backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=47'),
        ),
        SizedBox(width: scaleWidth(context, 12)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, User!',
                style: TextStyle(
                  fontSize: scaleWidth(context, 18),
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleText,
                ),
              ),
              SizedBox(height: scaleHeight(context, 4)),
              Text(
                "${getGreeting()} 👋",
                style: TextStyle(
                  fontSize: scaleWidth(context, 18),
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
              icon: Icon(CupertinoIcons.bell, size: scaleWidth(context, 28)),
              color: AppPalette.black,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              icon: Icon(CupertinoIcons.settings, size: scaleWidth(context, 28)),
              color: AppPalette.black,
            ),
          ],
        ),
      ],
    );
  }
}

// -------------------- Investments List --------------------
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
      InvestmentsEntites(
        investorid: '3',
        title: "Solaris",
        subtitle: "Renewable Energy Startups",
        progress: 0.35,
        investors: 8,
        views: 150,
        feedback: 3,
      ),
    ];

    double cardHeight = scaleHeight(context, 260);
    double cardWidth = MediaQuery.of(context).size.width * 0.6;

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
                fontSize: scaleWidth(context, 16),
                color: AppColors.titleText,
              ),
            ),
            TextButton(
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
          ],
        ),
        SizedBox(height: scaleHeight(context, 12)),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: pitches.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: scaleWidth(context, 16)),
                width: cardWidth,
                child: InvestmentsCardWidget(investments: pitches[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

// -------------------- New Investors --------------------
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
      {
        'name': 'Liam Johnson',
        'role': 'FinTech, Seed',
        'avatar': 'https://i.pravatar.cc/150?img=22',
      },
    ];

    double cardWidth = MediaQuery.of(context).size.width * 0.42;
    double cardHeight = scaleHeight(context, 180);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Entrepreneur Smart Matching',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: scaleWidth(context, 16),
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: scaleHeight(context, 12)),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: investors.length,
            separatorBuilder: (_, __) => SizedBox(width: scaleWidth(context, 12)),
            itemBuilder: (context, idx) {
              final inv = investors[idx];
              return InvestorCard(
                name: inv['name']!,
                role: inv['role']!,
                avatarUrl: inv['avatar']!,
                width: cardWidth,
              );
            },
          ),
        ),
      ],
    );
  }
}

// -------------------- Trending Investments --------------------
class TrendingInvestmentsSection extends StatelessWidget {
  const TrendingInvestmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final trending = [
      "AI Startups",
      "HealthTech",
      "Green Energy",
      "FinTech Innovations",
      "Blockchain Startups"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Investments',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: scaleWidth(context, 16),
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: scaleHeight(context, 12)),
        Wrap(
          spacing: scaleWidth(context, 12),
          runSpacing: scaleHeight(context, 12),
          children: trending
              .map(
                (t) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(context, 16),
                    vertical: scaleHeight(context, 10),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.softElev,
                    borderRadius: BorderRadius.circular(scaleWidth(context, 14)),
                  ),
                  child: Text(
                    t,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.accentText,
                      fontSize: scaleWidth(context, 13),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// -------------------- Recent Activity --------------------
class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {"action": "Invested in GreenTech", "time": "2h ago"},
      {"action": "Connected with Sophia Bennett", "time": "5h ago"},
      {"action": "Viewed EcoBloom pitch", "time": "1d ago"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: scaleWidth(context, 16),
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: scaleHeight(context, 12)),
        Column(
          children: activities
              .map(
                (act) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.softElev,
                    child: Icon(CupertinoIcons.check_mark, size: scaleWidth(context, 20)),
                  ),
                  title: Text(
                    act['action']!,
                    style: TextStyle(
                      fontSize: scaleWidth(context, 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    act['time']!,
                    style: TextStyle(
                      fontSize: scaleWidth(context, 12),
                      color: AppColors.mutedText,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// -------------------- Investor Tips --------------------
class InvestorTipsSection extends StatelessWidget {
  const InvestorTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      "Diversify your investments across sectors.",
      "Keep an eye on emerging tech trends.",
      "Engage with early-stage entrepreneurs.",
      "Review financial reports carefully.",
      "Join investor networking events.",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Investor Tips',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: scaleWidth(context, 16),
            color: AppColors.titleText,
          ),
        ),
        SizedBox(height: scaleHeight(context, 12)),
        Column(
          children: tips
              .map(
                (tip) => Container(
                  margin: EdgeInsets.only(bottom: scaleHeight(context, 10)),
                  padding: EdgeInsets.all(scaleWidth(context, 12)),
                  decoration: BoxDecoration(
                    color: AppColors.softElev,
                    borderRadius: BorderRadius.circular(scaleWidth(context, 12)),
                  ),
                  child: Text(
                    "• $tip",
                    style: TextStyle(
                      fontSize: scaleWidth(context, 13),
                      color: AppColors.accentText,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// -------------------- Investor Card --------------------
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
        horizontal: scaleWidth(context, 12),
        vertical: scaleHeight(context, 14),
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(scaleWidth(context, 14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: scaleWidth(context, 8),
            offset: Offset(0, scaleHeight(context, 4)),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: scaleWidth(context, 28),
            backgroundImage: NetworkImage(avatarUrl),
            backgroundColor: AppColors.softElev,
          ),
          SizedBox(height: scaleHeight(context, 8)),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: scaleWidth(context, 13),
              color: AppColors.titleText,
            ),
          ),
          SizedBox(height: scaleHeight(context, 2)),
          Text(
            role,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: scaleWidth(context, 11),
              color: AppColors.mutedText,
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: scaleHeight(context, 32),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.background,
                side: BorderSide(color: AppColors.outline),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(scaleWidth(context, 10)),
                ),
                padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 6)),
              ),
              child: Text(
                'Connect',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: scaleWidth(context, 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- Greeting --------------------
String getGreeting() {
  final now = DateTime.now();
  final hour = now.hour;
  if (hour < 12) return "Good Morning";
  if (hour < 15) return "Good Afternoon";
  if (hour < 20) return "Good Evening";
  return "Good Night";
}
