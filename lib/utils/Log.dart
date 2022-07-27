class Log{
  static final String TAG = "Kiti";

  static void d(var string){
    print("${TAG} Debug: ${string}");
  }

  static void e(var string){
    print("${TAG} Error: ${string}");
  }
}