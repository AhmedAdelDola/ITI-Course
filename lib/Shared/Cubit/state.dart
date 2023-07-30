abstract class Appstate {}
class initialState extends Appstate {}
class loadingState extends Appstate {}
class sucessState extends Appstate {}
class errorState extends Appstate {
   final String e ;
  errorState(this.e);
}