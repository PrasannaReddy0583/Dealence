import 'dart:ffi';

enum FundingType { equity, loan }

class StartupEntites {
  final String startupid;
  final String startupname;
  final String startupavatar;
  final String
  ownerId; // It acts as foreign key, user who owns/pitched that project in the platform
  final String pitchVideo;

  // overview
  final String oneLiner;
  final String detailedProblem;
  final String evidanceOfProblem;
  final String solution;
  final String keyDifferentiator;

  // team

  final String founderName;
  final String founderEmail;
  final int founderPhone;
  final String linkedIn;
  final List<Map<String, String>> teamMembers;
  // Example: [{ "name": "Alice", "role": "CTO", "linkedin": "url", "phone" : "", "email": "", "onelinerdescription": }]
  final List<Map<String, String>> mantainersManager;

  // 📊 Business Details
  final String industry; // e.g. Fintech, EdTech
  final List<String> subDomains; // e.g. ["Payments", "SME Lending"]
  final String? targetedGeography; // e.g India
  final String businessModel; // B2B, B2C, B2B2C
  final String stage; // Idea, MVP, Seed, Prototype, Working, RevenueGenrating
  final String foundedDate; // yyyy-mm-dd
  final String? headquarters; // City, Country
  final List<String>? locations; // Operational regions/countries
  final List<Map<String, String>>
  competitors; // competitors and their description

  // Model
  final List<String> revenueStreams;
  final String currentPricingExample;
  final String distributionChannels;
  final String goToMarketingStrategy;
  final String scalablePotential;

  // Traction
  final String currentCustomer;
  final String revenue;
  final String growthRatePercentageMonthoverMonth;
  final int dailyActiveUsers;
  final Float lifetimeValue;
  final Float customerAcquisitionCost;
  final Float retention; // Percentage
  final List<Map<String, DateTime>>
  growthMileStones; // MileStone and it's expected/achieved date, basically timline
  final String proofTractionPdf;

  // Financial Overview
  final int currentValuation;
  final String balanceSheetUrl;
  final String plStatementsUrl;
  final String financialAuditsUrl;
  final List<Map<String, String>> previousInvestors;

  // Funding
  final String fundingRequestInwords;
  final int fundingAmount;
  final FundingType fundingType;
  final Float equityOffered;
  final Float royalty;
  final Float interest;
  final List<Map<String, Float>> useOfFunds;

  // Posts
  final String postId;
  final String postownerId;
  final String poststartupId;
  final String postcaption;
  final List<String> postImages;
  final DateTime postcreatedAt;

  // Reels
  final String reelId;
  final String reelownerId;
  final String reelstartupId;
  final String reelcaption;
  final String reelUrl;
  final DateTime reelcreatedAt;

  StartupEntites({
    required this.startupid,
    required this.startupname,
    required this.startupavatar,
    required this.ownerId,
    required this.pitchVideo,
    required this.oneLiner,
    required this.detailedProblem,
    required this.evidanceOfProblem,
    required this.solution,
    required this.keyDifferentiator,
    required this.founderName,
    required this.founderEmail,
    required this.founderPhone,
    required this.linkedIn,
    required this.teamMembers,
    required this.mantainersManager,
    required this.industry,
    required this.subDomains,
    this.targetedGeography,
    required this.businessModel,
    required this.foundedDate,
    this.headquarters,
    this.locations,
    required this.currentPricingExample,
    required this.distributionChannels,
    required this.goToMarketingStrategy,
    required this.revenueStreams,
    required this.scalablePotential,
    required this.stage,
    required this.competitors,
    required this.balanceSheetUrl,
    required this.currentCustomer,
    required this.currentValuation,
    required this.customerAcquisitionCost,
    required this.dailyActiveUsers,
    required this.financialAuditsUrl,
    required this.growthMileStones,
    required this.growthRatePercentageMonthoverMonth,
    required this.lifetimeValue,
    required this.plStatementsUrl,
    required this.previousInvestors,
    required this.proofTractionPdf,
    required this.retention,
    required this.revenue,
    required this.equityOffered,
    required this.fundingAmount,
    required this.fundingRequestInwords,
    required this.fundingType,
    required this.interest,
    required this.royalty,
    required this.useOfFunds,
    required this.postId,
    required this.postImages,
    required this.postcaption,
    required this.postcreatedAt,
    required this.postownerId,
    required this.poststartupId,
    required this.reelId,
    required this.reelUrl,
    required this.reelcaption,
    required this.reelcreatedAt,
    required this.reelownerId,
    required this.reelstartupId,
  });
}
