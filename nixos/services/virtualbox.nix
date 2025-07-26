{...}:{
  ###########################################################
  # NOT IN USE                                              #
  # I dont wanna build virtual box every rebuild. No thanks #
  ###########################################################
  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
      guest = {
        enable = true;
        dragAndDrop = true;
        clipboard = true;
      };
    };
  };
}
