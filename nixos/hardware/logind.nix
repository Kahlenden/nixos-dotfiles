{...}:{
  # Don’t suspend when close lid and plugged in or docked
  services.logind.extraConfig = ''
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
    HandleLidSwitchDocked=ignore
  '';
}
