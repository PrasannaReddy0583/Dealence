import 'package:flutter/material.dart';
import 'package:striv/utils/app_palette.dart';

class PitchDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> pitchData;

  const PitchDetailsScreen({super.key, required this.pitchData});

  @override
  State<PitchDetailsScreen> createState() => _PitchDetailsScreenState();
}

class _PitchDetailsScreenState extends State<PitchDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this); // 6 sections
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.pitchData;

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: AppPalette.iconColor),
                  Spacer(),
                  Text(
                    "Pitch Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 24),
                ],
              ),
            ),

            // Video placeholder
            Container(
              margin: EdgeInsets.all(16),
              height: 180,
              decoration: BoxDecoration(
                color: AppPalette.highlight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 64,
                  color: AppPalette.iconColor,
                ),
              ),
            ),

            // Company Info
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppPalette.textTerenary,
                child: Text(
                  data["name"][0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                data["name"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppPalette.textPrimary,
                ),
              ),
              subtitle: Text(
                data["tagline"],
                style: TextStyle(color: AppPalette.textSecondary),
              ),
            ),

            // Tabs
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppPalette.textPrimary,
              unselectedLabelColor: AppPalette.textSecondary,
              indicatorColor: AppPalette.unseen,
              tabs: const [
                Tab(text: "Overview"),
                Tab(text: "Team"),
                Tab(text: "Market"),
                Tab(text: "Model"),
                Tab(text: "Traction"),
                Tab(text: "Revenue"),
              ],
            ),

            Divider(height: 1),

            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildOverview(data["overview"]),
                  _buildTeam(data["team"]),
                  _buildSimpleText(data["market"]),
                  _buildSimpleText(data["model"]),
                  _buildSimpleText(data["traction"]),
                  _buildSimpleText(data["revenue"]),
                ],
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: AppPalette.unseen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Request More Info",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Bottom Nav
            Container(
              decoration: BoxDecoration(
                color: AppPalette.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomNavItem(Icons.dashboard, "Dashboard", false),
                    _buildBottomNavItem(Icons.work, "Pitches", true),
                    _buildBottomNavItem(Icons.message, "Messages", false),
                    _buildBottomNavItem(Icons.person, "Profile", false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab content builders
  Widget _buildOverview(Map<String, String> overview) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _section("Problem", overview["problem"] ?? ""),
          SizedBox(height: 12),
          _section("Solution", overview["solution"] ?? ""),
          SizedBox(height: 12),
          _section("Differentiator", overview["differentiator"] ?? ""),
        ],
      ),
    );
  }

  Widget _buildTeam(List<Map<String, String>> team) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: team.length,
      itemBuilder: (context, index) {
        final member = team[index];
        return ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(member["name"] ?? ""),
          subtitle: Text(member["role"] ?? ""),
        );
      },
    );
  }

  Widget _buildSimpleText(String text) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(text, style: TextStyle(color: AppPalette.textSecondary)),
    );
  }

  Widget _section(String title, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppPalette.textPrimary,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(body, style: TextStyle(color: AppPalette.textSecondary)),
      ],
    );
  }

  // Bottom nav
  Widget _buildBottomNavItem(IconData icon, String label, bool selected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: selected ? AppPalette.unseen : AppPalette.textSecondary,
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: selected ? AppPalette.unseen : AppPalette.textSecondary,
          ),
        ),
      ],
    );
  }
}
