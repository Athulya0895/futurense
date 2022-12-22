    // Future checkFirstSeen() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   bool _seen = (prefs.getBool('seen') ?? false);

    //   if (_seen) {
        
    //     Navigator.of(context).pushReplacement(
    //         new MaterialPageRoute(builder: (context) => new HomepageMentor()));
    //   } else {
    //     await prefs.setBool('seen', true);
    //     Navigator.of(context).pushReplacement(
    //         new MaterialPageRoute(builder: (context) => new IntroScreen()));
    //   }
    // }