{ config, ... }:
{
  sops.secrets."uni/zih" = { };
  networking = {
    wireless.networks = {
      eduroam = {
        auth = ''
          eap=PEAP
          anonymous_identity="anonymous@tu-dresden.de"
          ca_cert="/etc/ssl/certs/ca-certificates.crt"
          domain_suffix_match="radius-eduroam.zih.tu-dresden.de"
          identity="rose159e@tu-dresden.de"
          password="@EDUROAM_AUTH@"
          phase2="auth=MSCHAPV2"
        '';
        authProtocols = [ "WPA-EAP" ];
      };
      agdsn = {
        auth = ''
          eap=TTLS
          anonymous_identity="anonymous@agdsn.de"
          ca_cert="/etc/ssl/certs/ca-certificates.crt"
          domain_suffix_match="radius.agdsn.de"
          identity="r5"
          password="@AGDSN_AUTH@"
          phase2="auth=PAP"
        '';
        authProtocols = [ "WPA-EAP" ];
      };
      FSR = {
        psk = "@FSR_PSK@";
        authProtocols = [ "WPA-PSK" ];
      };
      "RoboLab Playground" = {
        psk = "@ROBOLAB_PSK@";
        authProtocols = [ "WPA-PSK" ];
      };
    };
    openconnect.interfaces = {
      TUD-A-Tunnel = {
        # apparently device names have a character limit
        protocol = "anyconnect";
        gateway = "vpn2.zih.tu-dresden.de";
        user = "rose159e@tu-dresden.de";
        passwordFile = config.sops.secrets."uni/zih".path;
        autoStart = false;
        extraOptions = {
          authgroup = "A-Tunnel-TU-Networks";
          compression = "stateless";
        };
      };
      TUD-C-Tunnel = {
        protocol = "anyconnect";
        gateway = "vpn2.zih.tu-dresden.de";
        user = "rose159e@tu-dresden.de";
        passwordFile = config.sops.secrets."uni/zih".path;
        autoStart = false;
        extraOptions = {
          authgroup = "C-Tunnel-All-Networks";
          compression = "stateless";
        };
      };
    };
  };
}
