{...}:{
    security = {
      sudo = {
        execWheelOnly = true;
        # Asks for password every time
        extraConfig = ''
          Defaults timestamp_timeout=0
        '';
      };
    };
}
