# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Teacher from Poland.')
second_user = User.create(name: 'Antonio', photo: 'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Teacher from Colombia.')
third_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Teacher from EE.UU.')

first_post = Post.create(author: first_user, title: 'My first Post', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'My first Post', text: 'This is my first post')
third_post = Post.create(author: third_user, title: 'My first Post', text: 'This is my first post')

Post.create(author: first_user, title: 'My second Post', text: 'This is my second post')
Post.create(author: first_user, title: 'My third Post', text: 'This is my third post')
Post.create(author: first_user, title: 'My fourth post', text: 'This is my fourth post')

Post.create(author: second_user, title: 'My second Post', text: 'This is my second post')
Post.create(author: second_user, title: 'My third Post', text: 'This is my third post')
Post.create(author: second_user, title: 'My fourth post', text: 'This is my fourth post')

Post.create(author: third_user, title: 'My second Post', text: 'This is my second post')
Post.create(author: third_user, title: 'My third Post', text: 'This is my third post')
Post.create(author: third_user, title: 'My fourth post', text: 'This is my fourth post')

Comment.create(post: first_post, author: second_user, text: 'Hi Lilly!')
Comment.create(post: first_post, author: third_user, text: 'Hello Lilly!')

Comment.create(post: second_post, author: first_user, text: 'Hi Antonio!')
Comment.create(post: second_post, author: third_user, text: 'Hello Antonio!')

Comment.create(post: third_post, author: second_user, text: 'Hi Tom!')
Comment.create(post: third_post, author: first_user, text: 'Hello Tom!')
