#
# Cookbook Name:: undorecipe
# Recipe:: default
#

recipes = data_bag_item("test","recipes")

puts recipes['recipe']

test=recipes['recipe']  

include_recipe test
provider_dest=test.upcase + "_postremove"

UNDORECIPE_postremove "remove" do
    action :run
        provider provider_dest
end
#
