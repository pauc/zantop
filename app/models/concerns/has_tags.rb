module HasTags
  extend ActiveSupport::Concern

  included do
    attr_accessible :tag_tokens
    attr_reader :tag_tokens
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings, include: :translations
  end

  def tag_tokens=(tokens)
    tag_ids = Tag.ids_from_tokens(tokens)
    deleted_tags = self.tag_ids - tag_ids
    destroy_taggings  deleted_tags, self.id, self.class.table_name.classify.constantize unless deleted_tags.empty?
    self.tag_ids = tag_ids
  end

  private

  def destroy_taggings(tag_ids, taggable_id, taggable_type)
    Tagging.where(tag_id: tag_ids, taggable_id: taggable_id, taggable_type: taggable_type).destroy_all
  end
end
