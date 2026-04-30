/// Immutable data record for a single saved vehicle.
class VehicleEntry {
  const VehicleEntry({
    required this.name,
    required this.makingYear,
    required this.registrationNo,
    this.imagePath,
  });

  final String name;
  final String makingYear;
  final String registrationNo;
  final String? imagePath; // null → shows the SVG placeholder
}
