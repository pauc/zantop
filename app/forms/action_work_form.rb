# frozen_string_literal: true

class ActionWorkForm < WorkForm
  attribute :place, :string
  attribute :realization_date, :date

  def submit_button_text
    return "Crear treball d'acció" if work.new_record?

    "Actualitzar treball d'acció"
  end
end
