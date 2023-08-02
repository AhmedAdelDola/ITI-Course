abstract class Appstate {}
class initialState extends Appstate {}
class loadingState extends Appstate {}
class sucessState extends Appstate {}
class errorState extends Appstate {
   final String e ;
  errorState(this.e);
}
class loginloadingState extends Appstate {}
class loginsucessState extends Appstate {}
class loginerrorState extends Appstate {
  final String e ;
  loginerrorState(this.e);
}
class rejsterloadingState extends Appstate {}
class rejstersucessState extends Appstate {}
class rejstererrorState extends Appstate {
  final String e ;
  rejstererrorState(this.e);
}
class getloadingState extends Appstate {}
class  getsucessState extends Appstate {}
class  geterrorState extends Appstate {
  final String e ;
  geterrorState(this.e);
}