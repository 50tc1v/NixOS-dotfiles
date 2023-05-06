{ config, ... }: {
  
  networking.firewall.allowedTCPPorts = [ 20 ];

  services.openssh = {
    enable = true;
    # Require public key authentication for better security.
    settings = {
      passwordAuthentication = false;
      kbdInteractiveAuthentication = false;
      permitRootLogin = "no";
    };
    ports = [ 20 ];
  };

  users.users."victor".openssh.authorizedKeys.keys = [];

}
