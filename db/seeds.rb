User.create!(login_name: "VladimirD", 
			 password: "P@ssw0rd",
			 password_confirmation: "P@ssw0rd", 
			 is_books_admin: true, 
			 is_group_admin: true,
             admin: true )

User.create!(login_name: "MaxB", 
			 password: "P@ssw0rd",
			 password_confirmation: "P@ssw0rd", 
			 is_books_admin: true, 
			 is_group_admin: true )


g1 = Group.create!(name: "Fantasy")
g2 = Group.create!(name: "Adventure")
g3 = Group.create!(name: "Romance")
g4 = Group.create!(name: "Horror")

a1 = Author.create!(full_name: "Stephen King")
a2 = Author.create!(full_name: "Terry Pratchett")
a3 = Author.create!(full_name: "Neil Gaiman")


b1 = Book.new(title: "The Dark Tower", group: g1)
b1.authors << a1
b1.authors << a2
b1.authors << a3
b1.save

b2 = Book.new(title: "Good Omens", group: g2)
b2.authors << a2
b2.authors << a3
b2.save
