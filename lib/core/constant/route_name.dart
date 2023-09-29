class RouteName {
  const RouteName();

  /// variable name should follow rule smallBig ==> groupUser
  /// variable value should follow rule smallBig ==> groupUser

  //home
  static const home = '/';
  static const version = '/version';
  static const login = '/login';
  static const signUp = '/signUp';

  //special menu
  static const dashboard = '/dashboard';
  static const setupProduct = '/setupProduct';

  //master data

  static const floor = '/floor';
  static const table = '/table';
  static const mainMenu = '/mainMenu';
  static const menu = '/menu';
  static const topping = '/topping';
  static const category = '/category';
  static const product = '/product';

  //security user
  static const user = '/user';
  static const groupUser = '/groupUser';

  //purchase
  static const supplier = '/supplier';
  static const expense = '/expense';
  static const categoryExpense = '/categoryExpense';
  static const purchase = '/purchase';

  //warehouse transaction
  static const warehouse = '/wareHouse';

  //staff transaction
  static const staffPosition = '/staffPosition';
  static const staff = '/staff';

  //sale transaction
  static const memberType = '/memberType';
  static const customer = '/customer';
  static const paymentType = '/paymentType';
}
