import 'dart:io';
import 'account.dart';

void main() {
  // Check for `Account` file
  File? accountFile = File("Assets/account.csv");

  if (!accountFile.existsSync()) {
    noAccountFile(accountFile);
  } else {
    trySignIn();
  }
}

void trySignIn() {



}

Account getInfo() {

  print("Enter the username you signed up with: ");
  String? username = stdin.readLineSync();

  if (username == null || username == "") {

    print("That's not valid input!");
    clear();
    return getInfo();

  } 

  return new Account.empty();

}

void noAccountFile(File? file) {
  print('No account file detected\nLet\'s make you an account!');

  Account? acc = newAccount();

  print('Hello, ${acc.name}!\nActually, this is all this app has to offer, but I will save your info for easy sign-in!');

  print('Saving info!');

  // Null check
  if (file == null) {
    file = File("Assets/accounts.csv");
  }

  // Create File
  file.createSync();

  IOSink writer = file.openWrite();

  writer.write("name, email, opt-in-for-emails\n");
  writer.write(acc.toString());

  writer.close();

  writer.done.then((value) =>  { 
    print("Saved your info successfully!"),
    exit(0)
  });

}

Account newAccount() {
  print('What do you want your username to be?');
  String? user = stdin.readLineSync();

  if (user == null) {
    print('Please enter a username!');
    // Clear the terminal
    clear();
    return newAccount();
  }

  print('What is your email?');
  String? email = stdin.readLineSync();

  if (email == null) {
    print('Please enter an email!');
    // Clear the terminal
    clear();
    return newAccount();
  }

  print('Do you want to opt in for emails? (y/n)');
  String? optIn = stdin.readLineSync();

  if (optIn == null) {
    print('Please enter an option!');
    // Clear the terminal
    clear();
    return newAccount();
  }

  bool optInForEmails = optIn.toLowerCase() == 'y' ? true : false;

  Account acc = Account(user, email, optInForEmails);
  return acc;
}

void clear() {
  print('\x1B[2J\x1B0f');
}
