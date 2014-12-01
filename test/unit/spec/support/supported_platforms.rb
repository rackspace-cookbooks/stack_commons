def supported_platforms
  {
    # only testing on centos since we don't actually *test* anything different
    # across the different distros at the moment
    #
    # 'ubuntu' => ['12.04', '14.04'],
    'centos' => ['6.5']
  }
end
