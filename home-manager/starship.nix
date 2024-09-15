{...}:{

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      right_format = ''
        $git_branch
        $cmd_duration
      '';

      format = ''
        $username$hostname$directory
        $character
      '';

      character = {
        success_symbol = "[🭧🭒](bold fg:blue)[ ➜ ](bold bg:blue fg:#000000)[](bold fg:blue)";
        error_symbol = "[🭧🭒](bold fg:red)[ ✗ ](bold bg:red fg:#000000)[](bold fg:red)";
      };

      package = {
        disabled = true;
      };

      git_branch = {
        format =  "[🭃](bold fg:yellow)[$symbol](bg:yellow bold fg:#000000)[$branch](bg:yellow bold fg:#000000)[🭞](bold fg:yellow bg: yellow) ";
        symbol = "";
        truncation_length = 10;
        truncation_symbol = "";
      };

      git_commit = {
        #format =  "[ ](bold bg:green)[$hash](bg:green bold fg:#000000)[  ](bold fg:green bg:yellow)";
        commit_hash_length = 5;
        tag_symbol = "";
      };

      git_state = {
        format = "[\($state( $progress_current of $progress_total)\)]($style) ";
        cherry_pick = "[🍒 PICKING](bold red)";
      };

      git_status = {
        conflicted = " ";
        staged = "[++\($count\)](blue)";
      };

      hostname = {
        ssh_only = false;
        format =  "[ ](bold bg:yellow fg:blue)[$hostname](bg:yellow bold fg:#000000)[ ](bold fg:yellow bg:green)";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = " ";
        style = "bold dimmed blue";
      };

      time = {
        disabled = true;
        format = "🕙[\[ $time \]]($style) ";
        time_format = "%T";
      };

      username ={
        style_user = "bold bg:blue fg:#000000";
        style_root = "red bold";
        format = "[🭃](bold fg:blue)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = " ";
        read_only = "  ";
        style = "bold bg:green  fg:#000000";
        truncation_length = 5;
        truncation_symbol = "./";
        format = "[$path]($style)[🭞](fg:green )";
      };

      directory.substitutions = {
        "Documents" = " ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };

      cmd_duration = {
        min_time = 0;
        format = ''[🬈🬖🬥🬅 ](bold bg:cyan fg:#000000)[time:$duration](bold bg:cyan fg:#000000)[ 🬖🬥🬔🬗](bold bg:cyan fg:#000000)'';
      };
      
    };
  };
}