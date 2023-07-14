import 'package:flutter/material.dart';

class CountryCode {
  final String code;
  final String name;

  CountryCode({required this.code, required this.name});
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CountryCode> countryCodes = [
      CountryCode(code: '+1', name: 'United States'),
      CountryCode(code: '+91', name: 'India'),
      CountryCode(code: '+44', name: 'United Kingdom'),
      CountryCode(code: '+86', name: 'China'),
    ];

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'images/logo.png',
                    height: 200,
                    width: 120,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                _buildCountryCodeInput(countryCodes),
                const SizedBox(height: 16.0),
                _buildMobileNumberInput(),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform login logic here
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountryCodeInput(List<CountryCode> countryCodes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonFormField<CountryCode>(
        isExpanded: true,
        value: countryCodes[0], // Default selected country code
        onChanged: (CountryCode? newValue) {
          // Handle country code selection
        },
        items: countryCodes.map<DropdownMenuItem<CountryCode>>((CountryCode countryCode) {
          return DropdownMenuItem<CountryCode>(
            value: countryCode,
            child: Text('${countryCode.name} ${countryCode.code}'),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMobileNumberInput() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        border: OutlineInputBorder(),
      ),
    );
  }
}
