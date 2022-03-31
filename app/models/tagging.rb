# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :tag, counter_cache: true, touch: true
  belongs_to :work
end
