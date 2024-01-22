class Countries {
  final String name;
  final String domain;

  const Countries({required this.name, required this.domain});
}

Countries usa = const Countries(name: 'USA', domain: 'us');

Countries germany = const Countries(name: 'Germany', domain: 'de');

Countries italia = const Countries(name: 'Italy', domain: 'it');

Countries russia = const Countries(name: 'Russia', domain: 'ru');

Countries turkey = const Countries(name: 'Turkey', domain: 'tr');

Set<Countries> countriesSet = {
  usa,
  germany,
  italia,
  russia,
  turkey,
};
