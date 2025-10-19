class UserStatsModel {
  final String crownCount;
  final String diamondCount;
  final String contribution;
  final String distance;
  final String bio;

  const UserStatsModel({
    required this.crownCount,
    required this.diamondCount,
    required this.contribution,
    required this.distance,
    required this.bio,
  });

  factory UserStatsModel.defaultValues() {
    return const UserStatsModel(
      crownCount: "56",
      diamondCount: "56",
      contribution: "Contriburion: 1k",
      distance: "2.5 Km",
      bio: "I am an enthusiastic and curious individual with a passion for technology and creativity.",
    );
  }
}
