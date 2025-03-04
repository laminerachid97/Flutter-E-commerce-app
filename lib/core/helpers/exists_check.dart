

bool checkIfIdExists(int idVariable, List<Map<String, dynamic>> list) {
  for (var map in list) {
    if (map.containsKey("id") && map["id"] == idVariable) {
      return true; // ID found
    }
  }
  return false; // ID not found
}