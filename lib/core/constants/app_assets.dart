/// Centralised asset-path registry.
///
/// Rules:
///   • Never write a bare string like `'assets/images/foo.png'` in a widget.
///   • Reference [AppAssets] instead — one rename here fixes every reference.
abstract class AppAssets {
  AppAssets._();

  // ── Images ─────────────────────────────────────────────────────────────────
  static const String fullMap = 'assets/images/Full Map.png';
  static const String banner1 = 'assets/images/banner1.png';

  // ── SVG icons ──────────────────────────────────────────────────────────────
  static const String iconHome      = 'assets/svg/home.svg';
  static const String iconVehicle   = 'assets/svg/my_vehicle.svg';
  static const String iconBooking   = 'assets/svg/booking.svg';
  static const String iconProfile   = 'assets/svg/profile.svg';
  static const String iconWallet    = 'assets/svg/wallet.svg';
  static const String iconEmergency = 'assets/svg/emergency.svg';
  static const String iconSos       = 'assets/svg/sos.svg';
  static const String iconEvType2   = 'assets/svg/ev_type2.svg';
  static const String iconEvCcs2    = 'assets/svg/ev plug2.svg';
}
