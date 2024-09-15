{lib, config, ...}:{

  programs.htop = {
    enable = true;
    settings = {
      color_scheme = 6;
      cpu_count_from_one = 0;
      delay = 5;
      show_program_path=0;
      hide_kernel_threads=1;
      highlight_deleted_exe=1;
      highlight_megabytes=1;
      highlight_threads=1;
      find_comm_in_cmdline=1;
      strip_exe_from_cmdline=1;
      header_margin=1;
      screen_tabs=1;
      show_cpu_usage=1;
      show_cpu_frequency=1;
      show_cpu_temperature=1;
      tree_view=1;
      sort_direction=-1;
      tree_sort_direction=-1;
      tree_view_always_by_pid=0;
      
      fields = with config.lib.htop.fields; [
        PID
        USER
        PRIORITY
        NICE
        M_SHARE
        STATE
        M_SWAP
        PERCENT_MEM
        M_RESIDENT
        PERCENT_CPU
        TIME
        COMM
      ];
      highlight_base_name = 1;
    } // (with config.lib.htop; leftMeters [
      (bar "AllCPUs4")
      (bar "CPU")
      (bar "Memory")
      (bar "Swap")
      (bar "HugePages")
    ]) // (with config.lib.htop; rightMeters [
      (text "Tasks")
      (text "LoadAverage")
      (text "Uptime")
      (text "Battery")
      (text "DiskIO")
      (text "NetworkIO")
      (text "MemorySwap")
    ]);
  };

}