// Define a map for different environments
Map<String, String> url = {
  'emulator': 'http://10.0.2.2:8000/',
  'localhost': 'http://localhost:8000/',
  'android': '<RUN IP SEARCH FIRST>'
};

// Select the base URL from the map
String? baseURL = url['emulator']; // or 'localhost', or 'android'

// You can set baseURL based on the environment you're targeting
// Example: String baseURL = url['localhost'];
