%w(Alice Bob Chris Deborah James Lilly Frank Olivia Tom).each do |name|
  User.create! name: name
end
