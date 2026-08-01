# frozen_string_literal: true

class VisualWorkForm < WorkForm
  attribute :techniques, :string
  attribute :dimensions, :string
  attribute :year, :integer, default: -> { Time.current.year }

  def self.work_class
    VisualWork
  end

  # The form asks for a year, but the column behind it is `realization_date` and
  # `VisualWork#year` is a reader with no writer. Translating here keeps
  # `WorkForm#submit` free to assign the whole hash to the work.
  def serializable_hash(...)
    super.except("year").merge("realization_date" => realization_date)
  end

  def submit_button_text
    return "Crear treball visual" if work.new_record?

    "Actualitzar treball visual"
  end

  private

  # A stored date can carry a month and a day the form never shows, so it is kept
  # whole for as long as the year itself does not change.
  def realization_date
    return work.realization_date if year.blank? || work.realization_date&.year == year

    Date.new(year)
  end
end
