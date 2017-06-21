FactoryGirl.create(:user, email: "test@test.test", password: 'Testtest')
FactoryGirl.create(:user, email: "testtest@test.test", password: 'Testtest')
FactoryGirl.create_list(:post, 13, user: User.first)
FactoryGirl.create_list(:post, 3, user: User.last)
FactoryGirl.create(:comment, user: User.first, post: Post.last)
FactoryGirl.create_list(:comment, 5, user: User.last, post: Post.last)
