#
# Cookbook Name:: undorecipe
# Recipe:: default
#

recipes = data_bag_item("test","recipes")

include_recipe recipes[:recipe]

recipes[:recipe].remove()
