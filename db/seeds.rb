require 'random_data'

#Create Posts
50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all

#Create Comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

puts "#{Post.count} posts created"

Post.find_or_create_by!(
        title: "unique title",
        body:  "unique body"
    )
    
puts "#{Comment.count} comments created"

Comment.find_or_create_by!(
        post_id: 101,
        body: "unique comment"
    )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"