class Profile {
  final String name;
  final String? avatarUrl;
  final int lifeIndex;
  final String? bio;

  Profile({
    required this.name,
    this.avatarUrl,
    required this.lifeIndex,
    this.bio,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? 'Unknown',
      avatarUrl: json['avatar'] as String?,
      lifeIndex: (json['lifeIndex'] is int)
          ? json['lifeIndex']
          : int.tryParse('${json['lifeIndex']}') ?? 0,
      bio: json['bio'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'avatar': avatarUrl,
    'lifeIndex': lifeIndex,
    'bio': bio,
  };
}