# frozen_string_literal: true

# The signed in half of every action below is covered by the controller specs.
# What is left to check is the half nobody could check there: that an anonymous
# request to an admin path is turned away by the real router and middleware
# stack, and that signing in afterwards lands back on it.
#
# Every example here therefore expects a redirect. None may expect a rendered
# page: the layout asks for asset bundles that CI does not build.
RSpec.describe "Authorization", type: :request do
  let(:login) { login_path(locale: :ca) }

  describe "visual works" do
    let(:work) { create(:visual_work) }

    it "keeps the new form out of anonymous hands" do
      get new_visual_work_path(locale: :ca)

      expect(response).to redirect_to login
    end

    it "keeps the edit form out of anonymous hands" do
      get edit_visual_work_path(work, locale: :ca)

      expect(response).to redirect_to login
    end

    it "creates nothing for an anonymous visitor" do
      expect { post visual_works_path(locale: :ca), params: { visual_work_form: { title: "Nou" } } }
        .not_to change(VisualWork, :count)

      expect(response).to redirect_to login
    end

    it "updates nothing for an anonymous visitor" do
      expect {
        patch visual_work_path(work, locale: :ca),
              params: { visual_work_form: { title: "Segrestat" } }
      }.not_to change { work.reload.title }

      expect(response).to redirect_to login
    end

    it "destroys nothing for an anonymous visitor" do
      work

      expect { delete visual_work_path(work, locale: :ca) }.not_to change(VisualWork, :count)

      expect(response).to redirect_to login
    end
  end

  describe "action works" do
    let(:work) { create(:action_work) }

    it "keeps the new form out of anonymous hands" do
      get new_action_work_path(locale: :ca)

      expect(response).to redirect_to login
    end

    it "keeps the edit form out of anonymous hands" do
      get edit_action_work_path(work, locale: :ca)

      expect(response).to redirect_to login
    end

    it "creates nothing for an anonymous visitor" do
      expect { post action_works_path(locale: :ca), params: { action_work_form: { title: "Nou" } } }
        .not_to change(ActionWork, :count)

      expect(response).to redirect_to login
    end

    it "updates nothing for an anonymous visitor" do
      expect {
        patch action_work_path(work, locale: :ca),
              params: { action_work_form: { title: "Segrestat" } }
      }.not_to change { work.reload.title }

      expect(response).to redirect_to login
    end

    it "destroys nothing for an anonymous visitor" do
      work

      expect { delete action_work_path(work, locale: :ca) }.not_to change(ActionWork, :count)

      expect(response).to redirect_to login
    end
  end

  describe "works" do
    it "keeps the ordering screen out of anonymous hands" do
      get admin_works_path(locale: :ca)

      expect(response).to redirect_to login
    end

    it "reorders nothing for an anonymous visitor" do
      first  = create(:action_work, position: 1)
      second = create(:action_work, position: 2)

      expect { patch sort_works_path(locale: :ca), params: { work_ids: [first.id, second.id] } }
        .not_to change { Work.ordered.to_a }

      expect(response).to redirect_to login
    end
  end

  describe "tags" do
    let(:tag) { create(:tag, name: "escultura") }

    it "keeps the tag admin screen out of anonymous hands" do
      get admin_tags_path(locale: :ca)

      expect(response).to redirect_to login
    end

    it "renames nothing for an anonymous visitor" do
      expect { patch tag_path(tag, locale: :ca), params: { tag: { name: { ca: "segrestat" } } } }
        .not_to change { tag.reload.name }

      expect(response).to redirect_to login
    end

    it "destroys nothing for an anonymous visitor" do
      tag

      expect { delete tag_path(tag, locale: :ca) }.not_to change(Tag, :count)

      expect(response).to redirect_to login
    end
  end

  describe "pages" do
    let(:page) { create(:page) }

    it "keeps the page editor out of anonymous hands" do
      get edit_page_path(page, locale: :ca)

      expect(response).to redirect_to login
    end

    it "edits nothing for an anonymous visitor" do
      expect { patch page_path(page, locale: :ca), params: { page: { title: "Segrestat" } } }
        .not_to change { page.reload.title }

      expect(response).to redirect_to login
    end
  end

  describe "the user account" do
    it "keeps the account screen out of anonymous hands" do
      get edit_user_path(locale: :ca)

      expect(response).to redirect_to login
    end

    it "changes nobody's password for an anonymous visitor" do
      user = create(:user, password: "secret")

      patch user_path(locale: :ca),
            params: { user: { password: "segrestat", password_confirmation: "segrestat" } }

      expect(user.reload.authenticate("secret")).to be_truthy
      expect(response).to redirect_to login
    end
  end

  describe "signing in after being turned away" do
    it "lands on the page that turned the visitor away" do
      get admin_works_path(locale: :ca)

      sign_in

      expect(response).to redirect_to admin_works_path(locale: :ca)
    end

    it "keeps the locale the visitor was reading in" do
      get admin_tags_path(locale: :en)

      sign_in

      expect(response).to redirect_to admin_tags_path(locale: :en)
    end

    it "lands on the front page when nothing turned the visitor away" do
      sign_in

      expect(response).to redirect_to root_path(locale: :ca)
    end

    it "forgets the page once it has sent the visitor there" do
      user = create(:user)
      get admin_works_path(locale: :ca)
      sign_in(user)

      get logout_path(locale: :ca)
      sign_in(user)

      expect(response).to redirect_to root_path(locale: :ca)
    end
  end
end
