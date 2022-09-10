# frozen_string_literal: true

class VisualWork < Work
  def year
    realization_date&.year
  end
end
