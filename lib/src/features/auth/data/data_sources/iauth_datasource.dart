abstract interface class IAuthDataSource {
  Future<void> login({
    required String email,
    required String password,
  });

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });
}
