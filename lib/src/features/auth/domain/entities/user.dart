class SupaUser {
  final String email;
  final String name;
  final String? imagePath;

  const SupaUser({
    required this.email,
    required this.name,
    this.imagePath,
  });
}
