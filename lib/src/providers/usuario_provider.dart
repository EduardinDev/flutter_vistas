class UsuarioProvider {
  String login(String email, String password) {
    if (email == 'admin@gmail.com') {
      return 'admin';
    } else if (email == 'admincoop@gmail.com'){
      return 'adminCoop';
    }else{
      return 'login';
    }
  }
}
