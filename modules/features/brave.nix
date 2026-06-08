{ self, inputs, ... }: {

  flake.nixosModules.brave = {pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "khncfooichmfjbepaaaebmommgaepoid" # YT unhook
    ];

extraOpts = {
  AIModeSettings = 0;

  ShowFullURLs = true;
  WideAddressBar = true;
  BookmarksBarEnabled = true;

  DefaultGeolocationSetting = 2;
  DefaultNotificationsSetting = 2;
  DefaultSerialGuardSetting = 2;
  DefaultSensorsSetting = 2;
  DefaultLocalFontsSetting = 2;

  PasswordManagerEnabled = false;
  PasswordSharingEnabled = false;
  PasswordLeakDetectionEnabled = false;
  AutofillCreditCardEnabled = false;

  MetricsReportingEnabled = false;

  SafeBrowsingExtendedReportingEnabled = false;
  SafeBrowsingSurveysEnabled = false;
  SafeBrowsingDeepScanningEnabled = false;

  DnsOverHttpsMode = "automatic";
  BuiltInDnsClientEnabled = false;

  SyncDisabled = true;

  BraveTalkDisabled = true;
  BraveNewsDisabled = true;
  BraveRewardsDisabled = true;
  BraveVPNDisabled = true;
  BraveWalletDisabled = true;

  BraveAIChatEnabled = false;
  BravePlaylistEnabled = false;
  BraveWaybackMachineEnabled = false;

  BraveP3AEnabled = false;
  BraveStatsPingEnabled = false;
  BraveWebDiscoveryEnabled = true;

  BraveExperimentalAdblockEnabled = true;
  BraveSpeedreaderEnabled = false;
  BraveRewardsIconHidden = true;
  BraveSyncEnabled = false;

  HardwareAccelerationModeEnabled = true;
  MemorySaverEnabled = true;
  BackgroundModeEnabled = false;

  DefaultSearchProviderEnabled = true;
  DefaultSearchProviderName = "DuckDuckGo";
  DefaultSearchProviderSearchURL =
    "https://duckduckgo.com/?q={searchTerms}";

  ShieldsAdvancedView = true;

  SpellcheckEnabled = true;
  SpellcheckLanguage = [ "en-US" ];

  AlternateErrorPagesEnabled = false;
  BrowserGuestModeEnabled = false;
  BrowserSignin = 0;

  DefaultBrowserSettingEnabled = true;

  ParcelTrackingEnabled = false;
  ShoppingListEnabled = false;

  ExtensionManifestV2Availability = 2;
};
  };

  };
}

