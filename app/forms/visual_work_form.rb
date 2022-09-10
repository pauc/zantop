# frozen_string_literal: true

class VisualWorkForm < WorkForm
  attribute :techniques, :string
  attribute :dimensions, :string
  attribute :year, :integer, default: -> { Time.current.year }

  def submit_button_text
    return "Crear treball visual" if work.new_record?

    "Actualitzar treball visual"
  end
end
