class SupaUser {
  final String id;
  final String email;
  final String name;
  final String? imagePath;

  const SupaUser({
    required this.id,
    required this.email,
    required this.name,
    this.imagePath,
  });
}
