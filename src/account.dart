class Account {
  String? name;
  String? email;
  bool optInForEmails = false;

  Account(this.name, this.email, this.optInForEmails);

  Account.empty() {
    name = null;
    email = null;
  }

  String toString() {
    return "$name, $email, $optInForEmails";
  }
}
