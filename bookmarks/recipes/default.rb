#
# Cookbook Name:: bookmarks
# Recipe:: default
#

skel_sqlitefile = "/etc/skel/.mozilla/firefox/firefox-firma/places.sqlite"

def add_bookmarks_to(sqlitefile)
  BOOKMARKS_bookmarks sqlitefile do
    bookmark_title node.bookmark_title
    bookmark_url node.bookmark_node
      action :add
        provider "BOOKMARKS_bookmarks"
  end
end

node.home_users.each do |user|
  username = user[1]['username']
  sqlitefile = "/home/#{username}/.mozilla/firefox/firefox-firma/places.sqlite"
  add_bookmarks_to sqlitefile
end

add_bookmarks_to skel_sqlitefile

