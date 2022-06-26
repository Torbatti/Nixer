{ config, pkgs, ... }:

{ 
  
  services.httpd.enable = true;
  services.httpd.adminAddr = "alice@example.org";
  services.httpd.virtualHosts.localhost.documentRoot = "/webroot";

  environment.systemPackages = with pkgs; [
    emacsPgtkGcc
  ];
}
