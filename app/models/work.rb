# frozen_string_literal: true

class Work < ApplicationRecord
  include HasSlugs
  include HasTranslations

  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  translates :title, :techniques, :place, plain: true
  translates :description

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # `inverse_of` is explicit because a scoped association opts out of Rails'
  # automatic detection, and `WorkForm` builds these in memory before saving:
  # without it a built record's `work` would be a second, re-fetched object.
  has_many :sections, -> { order(:position, :id) }, inverse_of: :work, dependent: :destroy
  has_many :images, -> { order(:position, :id) }, inverse_of: :work, dependent: :destroy

  validates :title, presence: true

  before_create :assign_position

  scope :published, -> { where(published: true) }

  # Highest position first, so the most recently added work leads every list.
  # `id` breaks ties: two works created in the same request can race for the
  # same position, and an unstable order would shuffle them between pages.
  scope :ordered, -> { order(position: :desc, id: :desc) }

  # Deals the submitted works' own positions back out in the order the ids
  # arrive, rather than renumbering from one. Only the works named in `ids`
  # move, so a stale or partial list can never claim a position belonging to a
  # work it leaves out, and the gaps left by deleted works survive untouched.
  #
  # `update_all` deliberately leaves `updated_at` alone: the front page caches
  # each work on it, and reordering changes no work's content.
  def self.reposition(ids)
    transaction do
      works = where(id: ids).index_by(&:id)
      # Highest first, to match `ordered`, since the list is rendered top-down.
      positions = works.values.map(&:position).sort.reverse

      ids.filter_map { |id| works[id.to_i] }.each_with_index do |work, index|
        # rubocop:disable Rails/SkipsModelValidations -- skipping is the point
        where(id: work.id).update_all(position: positions[index])
        # rubocop:enable Rails/SkipsModelValidations
      end
    end
  end

  def first_image
    images
      .with_attached_image
      .find { |image| image.image.attached? }
      &.image
      &.variant(:medium)
  end

  def related
    work_ids_from_taggings = Tagging.select("DISTINCT work_id")
                                    .where(tag_id: tag_ids)
                                    .where.not(work_id: id)
    self
      .class
      .published
      .ordered
      .where(id: work_ids_from_taggings)
      .limit(5)
      .includes(:plain_text_translations)
  end

  private

  # Positions run in one sequence across both subclasses, as they did under
  # `acts_as_list`: the front page interleaves visual and action works, so a
  # per-type sequence would give two works the same rank. Hence `Work`, not
  # `self.class`, which an STI subclass would narrow with a `type` condition.
  def assign_position
    self.position ||= (Work.maximum(:position) || 0) + 1
  end
end
