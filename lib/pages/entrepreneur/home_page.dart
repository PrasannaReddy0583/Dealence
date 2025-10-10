import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:striv/pages/notifications.dart';
import 'package:striv/pages/settings/settings_screen.dart';
import 'package:striv/utils/app_palette.dart';

class AppColors {
  static Color primary = Color(0xFFEFBA8F);
  static Color background = Color(0xFFF8F7F6);
  static Color card = Color(0xFFFFFFFF);
  static Color softElev = Color(0xFFF5E8DC);
  static Color titleText = Color(0xFF000000);
  static Color mutedText = Color(0xFF757575);
  static Color progressBg = Color(0xFFF5E8DC);
  static Color progressFill = primary;
  static Color buttonBg = Colors.black;
  static Color outline = Color(0xFFF5E8DC);
  static Color black = Color(0xFF000000);
}

// Dynamic scaling based on screen width
double scaleWidth(BuildContext context, double size) {
  return size * MediaQuery.of(context).size.width / 390;
}

// Dynamic scaling based on screen height
double scaleHeight(BuildContext context, double size) {
  return size * MediaQuery.of(context).size.height / 844;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.isInvestor});
  final bool isInvestor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 60,
              surfaceTintColor: AppPalette.transparent,
              floating: true,
              snap: true,
              backgroundColor: Color(0xFFFDF5EC),
              pinned: false,
              expandedHeight: scaleHeight(context, 80),
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 16),
                  vertical: scaleHeight(context, 12),
                ),
              ),
              title: HeaderSection(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 16),
                  vertical: scaleHeight(context, 18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PitchListSection(),
                    SizedBox(height: scaleHeight(context, 20)),
                    NewInvestorSection(),
                    SizedBox(height: scaleHeight(context, 22)),
                    LearningAndGrowth(),
                    SizedBox(height: scaleHeight(context, 22)),
                    UpcomingDemoCard(),
                    SizedBox(height: scaleHeight(context, 30)),
                    TrendingPitchesSection(),
                    SizedBox(height: scaleHeight(context, 22)),
                    TopStartupsSection(),
                    SizedBox(height: scaleHeight(context, 22)),
                    RecentActivitySection(),
                    SizedBox(height: scaleHeight(context, 22)),
                    RecommendedResourcesSection(),
                    SizedBox(height: scaleHeight(context, 30)),
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

// ------------------------- HEADER -------------------------
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                  CupertinoPageRoute(builder: (context) => NotificationScreen()),
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

// ------------------------- PITCH CARD -------------------------
class Pitch {
  final String title;
  final String subtitle;
  final double progress;
  final int investors;
  final int views;
  final int feedback;

  Pitch({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.investors,
    required this.views,
    required this.feedback,
  });
}

class PitchCard extends StatelessWidget {
  final Pitch pitch;
  const PitchCard({super.key, required this.pitch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
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
                      pitch.title,
                      style: TextStyle(
                        fontSize: scaleWidth(context, 16),
                        fontWeight: FontWeight.w700,
                        color: AppColors.titleText,
                      ),
                    ),
                    SizedBox(height: scaleHeight(context, 4)),
                    Text(
                      pitch.subtitle,
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
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(scaleWidth(context, 10)),
                  child: LinearProgressIndicator(
                    value: pitch.progress,
                    minHeight: scaleHeight(context, 10),
                    backgroundColor: AppColors.progressBg,
                    valueColor: AlwaysStoppedAnimation(AppColors.progressFill),
                  ),
                ),
              ),
              SizedBox(width: scaleWidth(context, 12)),
              Text(
                '${(pitch.progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: scaleWidth(context, 13),
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleText,
                ),
              ),
            ],
          ),
          SizedBox(height: scaleHeight(context, 14)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatColumn(number: pitch.investors.toString(), label: 'Investors'),
              StatColumn(number: pitch.views.toString(), label: 'Pitch Views'),
              StatColumn(number: pitch.feedback.toString(), label: 'Feedback'),
            ],
          ),
          SizedBox(height: scaleHeight(context, 16)),
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
                  color: AppPalette.black,
                  fontSize: scaleWidth(context, 15),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------- PITCH LIST -------------------------
class PitchListSection extends StatelessWidget {
  const PitchListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Pitch> pitches = [
      Pitch(title: "EcoBloom", subtitle: "Sustainable Goods", progress: 0.5, investors: 12, views: 250, feedback: 5),
      Pitch(title: "GreenTech", subtitle: "Clean Energy", progress: 0.7, investors: 18, views: 300, feedback: 7),
      Pitch(title: "Foodie", subtitle: "Food Startup", progress: 0.6, investors: 10, views: 150, feedback: 3),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Pitches',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        SizedBox(height: scaleHeight(context, 12)),
        SizedBox(
          height: scaleHeight(context, 280),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: pitches.length,
            itemBuilder: (context, index) => PitchCard(pitch: pitches[index]),
          ),
        ),
      ],
    );
  }
}

// ------------------------- INVESTOR SECTION -------------------------
class NewInvestorSection extends StatelessWidget {
  const NewInvestorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final investors = [
      {'name': 'Ethan Carter', 'role': 'Tech, Early Stage', 'avatar': 'https://i.pravatar.cc/150?img=12'},
      {'name': 'Sophia Bennett', 'role': 'Sustainability, Seed', 'avatar': 'https://i.pravatar.cc/150?img=8'},
      {'name': 'Maya Patel', 'role': 'Growth, Series A', 'avatar': 'https://i.pravatar.cc/150?img=34'},
      {'name': 'Liam Smith', 'role': 'Finance, Series B', 'avatar': 'https://i.pravatar.cc/150?img=55'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Investor Connections',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText),
        ),
        SizedBox(height: scaleHeight(context, 12)),
        SizedBox(
          height: scaleHeight(context, 180),
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
                width: MediaQuery.of(context).size.width * 0.42,
              );
            },
          ),
        ),
      ],
    );
  }
}

// ------------------------- INVESTOR CARD -------------------------
class InvestorCard extends StatelessWidget {
  final String name;
  final String role;
  final String avatarUrl;
  final double width;

  const InvestorCard({super.key, required this.name, required this.role, required this.avatarUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 12), vertical: scaleHeight(context, 14)),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(scaleWidth(context, 14)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: scaleWidth(context, 8), offset: Offset(0, scaleHeight(context, 4)))],
      ),
      child: Column(
        children: [
          CircleAvatar(radius: scaleWidth(context, 28), backgroundImage: NetworkImage(avatarUrl), backgroundColor: AppColors.softElev),
          SizedBox(height: scaleHeight(context, 8)),
          Text(name, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 13), color: AppColors.titleText)),
          SizedBox(height: scaleHeight(context, 2)),
          Text(role, textAlign: TextAlign.center, style: TextStyle(fontSize: scaleWidth(context, 11), color: AppColors.mutedText)),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: scaleHeight(context, 32),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.background,
                side: BorderSide(color: AppColors.outline),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(scaleWidth(context, 10))),
              ),
              child: Text('Connect', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 12))),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------- DEMO CARD -------------------------
class UpcomingDemoCard extends StatelessWidget {
  const UpcomingDemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(scaleWidth(context, 14)),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(scaleWidth(context, 12)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: scaleWidth(context, 10), offset: Offset(0, scaleHeight(context, 4)))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upcoming Demo Day', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 14), color: AppColors.titleText)),
                SizedBox(height: scaleHeight(context, 6)),
                Text('Showcase your startup to top investors.', style: TextStyle(fontSize: scaleWidth(context, 12), color: AppColors.mutedText)),
                SizedBox(height: scaleHeight(context, 8)),
                Text('View Details', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 13))),
              ],
            ),
          ),
          Container(
            width: scaleWidth(context, 64),
            height: scaleWidth(context, 64),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(scaleWidth(context, 8)),
              image: DecorationImage(image: NetworkImage('https://via.placeholder.com/80'), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------- LEARNING & GROWTH -------------------------
class LearningAndGrowth extends StatelessWidget {
  const LearningAndGrowth({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = [
      {'title': 'Pitch Guide', 'icon': Icons.book},
      {'title': 'Templates', 'icon': Icons.description_outlined},
      {'title': 'Legal', 'icon': Icons.gavel_outlined},
      {'title': 'Scaling', 'icon': Icons.trending_up_outlined},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Learning & Growth', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText)),
        SizedBox(height: scaleHeight(context, 12)),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tiles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: scaleHeight(context, 84),
            crossAxisSpacing: scaleWidth(context, 12),
            mainAxisSpacing: scaleHeight(context, 12),
          ),
          itemBuilder: (context, idx) {
            final t = tiles[idx];
            return FeatureTile(title: t['title'] as String, icon: t['icon'] as IconData);
          },
        ),
      ],
    );
  }
}

// ------------------------- FEATURE TILE -------------------------
class FeatureTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const FeatureTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(scaleWidth(context, 12)),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(scaleWidth(context, 12)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: scaleWidth(context, 8), offset: Offset(0, scaleHeight(context, 3)))],
      ),
      child: Row(
        children: [
          Container(
            width: scaleWidth(context, 40),
            height: scaleWidth(context, 40),
            decoration: BoxDecoration(color: AppColors.softElev, borderRadius: BorderRadius.circular(scaleWidth(context, 10))),
            child: Icon(icon, size: scaleWidth(context, 20), color: AppColors.primary),
          ),
          SizedBox(width: scaleWidth(context, 12)),
          Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: scaleWidth(context, 14), color: AppColors.titleText))),
        ],
      ),
    );
  }
}

// ------------------------- STAT COLUMN -------------------------
class StatColumn extends StatelessWidget {
  final String number;
  final String label;
  const StatColumn({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number, style: TextStyle(fontSize: scaleWidth(context, 16), fontWeight: FontWeight.w800, color: AppColors.titleText)),
        SizedBox(height: scaleHeight(context, 4)),
        Text(label, style: TextStyle(fontSize: scaleWidth(context, 11), color: AppColors.mutedText)),
      ],
    );
  }
}

// ------------------------- GREETING -------------------------
String getGreeting() {
  final now = DateTime.now();
  final hour = now.hour;
  if (hour < 12) return "Good Morning";
  if (hour < 16) return "Good Afternoon";
  if (hour < 20) return "Good Evening";
  return "Good Night";
}

// ------------------------- EXTRA SECTIONS -------------------------

class TrendingPitchesSection extends StatelessWidget {
  const TrendingPitchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final trending = [
      {'title': 'SolarX', 'subtitle': 'Green Energy', 'progress': 0.8},
      {'title': 'Foodify', 'subtitle': 'Food Delivery', 'progress': 0.6},
      {'title': 'HealthMate', 'subtitle': 'Health Tech', 'progress': 0.7},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trending Pitches', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText)),
        SizedBox(height: scaleHeight(context, 12)),
        SizedBox(
          height: scaleHeight(context, 150),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context, idx) {
              final t = trending[idx];
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: EdgeInsets.only(right: scaleWidth(context, 12)),
                padding: EdgeInsets.all(scaleWidth(context, 12)),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(scaleWidth(context, 12)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: scaleWidth(context, 6))]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('title', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 14))),
                    SizedBox(height: scaleHeight(context, 4)),
                    Text('subtitle', style: TextStyle(fontSize: scaleWidth(context, 12), color: AppColors.mutedText)),
                    SizedBox(height: scaleHeight(context, 8)),
                    LinearProgressIndicator(value: t['progress'] as double, backgroundColor: AppColors.progressBg, valueColor: AlwaysStoppedAnimation(AppColors.progressFill)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopStartupsSection extends StatelessWidget {
  const TopStartupsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final startups = [
      {'name': 'EcoTech', 'category': 'Green', 'avatar': 'https://via.placeholder.com/64'},
      {'name': 'FoodCo', 'category': 'Food', 'avatar': 'https://via.placeholder.com/64'},
      {'name': 'Healthify', 'category': 'Health', 'avatar': 'https://via.placeholder.com/64'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Startups', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText)),
        SizedBox(height: scaleHeight(context, 12)),
        SizedBox(
          height: scaleHeight(context, 140),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: startups.length,
            separatorBuilder: (_, __) => SizedBox(width: scaleWidth(context, 12)),
            itemBuilder: (context, idx) {
              final s = startups[idx];
              return Column(
                children: [
                  CircleAvatar(radius: scaleWidth(context, 40), backgroundImage: NetworkImage(s['avatar']!), backgroundColor: AppColors.softElev),
                  SizedBox(height: scaleHeight(context, 6)),
                  Text(s['name']!, style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 14))),
                  Text(s['category']!, style: TextStyle(fontSize: scaleWidth(context, 12), color: AppColors.mutedText)),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      'You invested in EcoBloom',
      'New feedback received for GreenTech',
      'Maya Patel connected with you',
      'Demo Day scheduled for Foodify',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Activity', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText)),
        SizedBox(height: scaleHeight(context, 12)),
        Column(
          children: activities.map((act) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: scaleHeight(context, 8)),
              padding: EdgeInsets.all(scaleWidth(context, 12)),
              decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(scaleWidth(context, 12)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: scaleWidth(context, 6))]),
              child: Text(act, style: TextStyle(fontSize: scaleWidth(context, 13))),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class RecommendedResourcesSection extends StatelessWidget {
  const RecommendedResourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final resources = [
      'How to pitch effectively',
      'Top 10 Startup Mistakes',
      'Investors Guide 2025',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended Resources', style: TextStyle(fontWeight: FontWeight.w700, fontSize: scaleWidth(context, 16), color: AppColors.titleText)),
        SizedBox(height: scaleHeight(context, 12)),
        Column(
          children: resources.map((res) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: scaleHeight(context, 8)),
              padding: EdgeInsets.all(scaleWidth(context, 12)),
              decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(scaleWidth(context, 12)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: scaleWidth(context, 6))]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(res, style: TextStyle(fontSize: scaleWidth(context, 13))),
                  Icon(CupertinoIcons.arrow_right, size: scaleWidth(context, 16)),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
