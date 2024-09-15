{...}:{

xdg.configFile = {
    "neofetch/config.conf".text = ''
        print_info() {
          prin "┌──────────────────────\n User Information \n──────────────────────┐"
          info "\n \n $(color 7)├$(color 6) Users  " users 
          prin "├────────────────────\n Terminal Information \n────────────────────┤"    
          info "\n \n $(color 7)├$(color 6) Shell  " shell
          info "\n \n $(color 7)├$(color 6) Terminal  " term
          info "\n \n $(color 7)├$(color 6) Terminal-Font  " term_font
          prin "├────────────────────\n Hardware Information \n────────────────────┤"
          info "\n \n $(color 7)├$(color 6) Model 󰌢 " model
          info "\n \n $(color 7)├$(color 6) CPU 󰍛 " cpu
          info "\n \n $(color 7)├$(color 6) GPU 󰘚 " gpu
          prin "├────────────────────\n Software Information \n────────────────────┤"
          info "\n \n $(color 7)├ $(color 6)Distro  " distro
          info "\n \n $(color 7)├ $(color 6)Kernel  " kernel
          info "\n \n $(color 7)├ $(color 6)Windows-Manager  " wm
          info "\n \n $(color 7)├ $(color 6)Packages 󰊠 " packages 
        #  info "\n \n $(color 7)├ $(color 6)Playing 󰝚 " song
          info "\n \n $(color 7)├ $(color 6)Local IP  " local_ip
        #  info " ​ ​   " public_ip
        #    info " ​ ​   " locale  # This only works on glibc systems.
            prin "└──────────────────────────────────────────────────────────────┘"
        #    info cols
        prin "\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n $(color 0) \n \n $(color 1) \n \n $(color 2) \n \n $(color 3)  \n \n $(color 4)  \n \n $(color 5)  \n \n $(color 6)  \n \n $(color 7) "
        prin "\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n $(color 8) \n \n $(color 9) \n \n $(color 10) \n \n $(color 11) \n \n $(color 12) \n \n $(color 13) \n \n $(color 14) \n \n $(color 15) "
        }
    '';
  };
  
}