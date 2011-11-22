#
# Cookbook Name:: autostart
# Recipe:: default
#

desktop_path = "/usr/share/applications/"
autostart_path = "/etc/xdg/autostart/"

node.autostart.each do |desktopfile|
  if FileTest.extist? desktop_path+desktopfile
    File.cp desktop_path+desktopfile autostart_path
  end
end
