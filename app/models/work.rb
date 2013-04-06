class Work < ActiveRecord::Base
  include HasImages
  include SlugConcern
  include UserInputCleaner
  include HasTags
  include HasSections

  acts_as_list

  translates :title, :description, :techniques, :place
  clean_fields :description

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  attr_accessible :title,
                  :description,
                  :place,
                  :realization_date,
                  :techniques,
                  :dimensions,
                  :position,
                  :published

  validates :title, presence: true

  default_scope order: 'position DESC'
  scope :published, where(published: true)

  after_update :touch_tags

  def first_image
    self.images.where("image is not null").first.try(:image).try(:medium)
  end

  def related
    conditions_array_for_taggings = [self.tags.map { |t| "tag_id = ?" }
                                     .join(" OR ")]
    self.tags.each { |t| conditions_array_for_taggings << t.id }
    work_ids_from_taggings = Tagging.select("DISTINCT taggable_id").
      where(conditions_array_for_taggings).
      where("taggable_id != ?", self.id)
    self.class.where(id: work_ids_from_taggings).limit(5).
      includes(:translations)
  end

  private

  def touch_tags
    self.tags.each { |t| t.touch }
  end
end
