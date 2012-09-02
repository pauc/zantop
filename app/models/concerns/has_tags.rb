module HasTags
  extend ActiveSupport::Concern

  included do
    attr_accessible :tag_tokens
    attr_reader :tag_tokens
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings
  end

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end
end
