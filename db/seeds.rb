# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

server = ['백호', '주작', '현무', '청룡', '봉황', '해태', '세종', '신구', '단군', '비호', '태극', '화랑', '태왕']

server.each do |s|
  Server.create_or_find_by(server_name: s)
end