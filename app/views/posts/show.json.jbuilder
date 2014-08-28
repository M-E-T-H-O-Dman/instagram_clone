json.address @post.address
json.created_at time_ago_in_words(@post.created_at) + 'ago'
json.image_url @post.picture.url(:medium)