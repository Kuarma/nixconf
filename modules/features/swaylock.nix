{ self, inputs, ... }: {

  flake.nixosModules.swaylock = {pkgs, lib, ...}: {

	 services.greetd = {
	   enable = true;
	   settings = {
	     default_session = {
	command = 
	''
	  ${pkgs.dbus}/bin/dbus-run-session \
	  ${pkgs.cage}/bin/cage -s -- \
	  ${pkgs.regreet}/bin/regreet 
	'';
	     };
	   };
	 };

   programs.regreet = {
     enable = true;
   }; 

  systemd = {
    settings = {
      Manager = {
        DefaultTimeoutStopSec = "10s";
      };
    };
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
  };
}
