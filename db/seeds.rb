%w(Alice Bob Tom).each do |name|
  User.create! name: name
end
