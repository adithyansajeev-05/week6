void main() {
  Map<String, dynamic>? user1 = {
    'name': 'Abrahm',
    'phone': '9876543210'
  };

  Map<String, dynamic>? user2 = {
    'name': 'John'
  };
  
//   function that checks the number and handles
  Map<String, dynamic>? user3 = null;
  String getPhone(Map<String, dynamic>? user) {
  return user?['phone'] ?? 'No Number Provided';
}

  print(getPhone(user1)); 
  print(getPhone(user2));
  print(getPhone(user3)); 
}