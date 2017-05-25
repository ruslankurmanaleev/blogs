require "rails_helper"

feature "When I visit my_posts path, I see" do
  include_context "current user signed in"

  scenario "call2action if user has no posts" do
    visit root_path

    expect(page).to have_content "Sorry, you have no posts yet"
    expect(page).to have_content "Create a new post"
  end

  describe "only my posts" do
    let!(:posts) { create_list(:post, 11, user: current_user) }

    scenario "sorted with no limits" do
      visit root_path

      expect(page).not_to have_content "Sorry, you have no posts yet"

      expect(page).to have_content posts.first.title
      expect(page).to have_content posts.last.title
    end
  end
end
