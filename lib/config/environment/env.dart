class Env {
  Env._();
  static final Env _instance = Env._();
  factory Env() => _instance;

  late String baseUrl;
  late String apiKey;

  void initEnv() {
    baseUrl = "https://api.openweathermap.org/data/2.5";
    apiKey = "1fda9a057f0e2e9f4faa7dad5213e153";
  }
}
