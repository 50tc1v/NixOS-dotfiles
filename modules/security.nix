{ config, ... }: {
  
  networking.firewall.allowedTCPPorts = [ 777 ];

  services.openssh = {
    enable = true;
    # Require public key authentication for better security.
    settings = {
      passwordAuthentication = false;
      kbdInteractiveAuthentication = false;
      permitRootLogin = "no";
    };
    ports = [ 777 ];
  };

  users.users."victor".openssh.authorizedKeys.keys = [];

}
