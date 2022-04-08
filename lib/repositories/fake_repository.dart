class FakeRepository {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    // throw Exception('Something went wrong!');
    return 'Done';
  }
}
