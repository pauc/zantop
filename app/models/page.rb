# frozen_string_literal: true

class Page < ApplicationRecord
  include HasTranslations

  translates :title, plain: true
  translates :body
end
