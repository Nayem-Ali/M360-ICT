class CountryCode {
  final String code;       // ISO country code
  final String flag;       // Country flag emoji
  final String name;       // Country name
  final String phoneCode;  // International dialing code

  CountryCode({
    required this.code,
    required this.flag,
    required this.name,
    required this.phoneCode,
  });

  static final List<CountryCode> countries = [
    CountryCode(
      code: 'BD',
      flag: '🇧🇩',
      name: 'Bangladesh',
      phoneCode: '+880',
    ),
    CountryCode(
      code: 'US',
      flag: '🇺🇸',
      name: 'United States',
      phoneCode: '+1',
    ),
    CountryCode(
      code: 'GB',
      flag: '🇬🇧',
      name: 'United Kingdom',
      phoneCode: '+44',
    ),

  ];
}

