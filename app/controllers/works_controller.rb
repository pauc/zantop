# frozen_string_literal = true

class WorksController < ApplicationController
  include Authorization
  # include Sortable

  def admin
    @works = Work.includes(:translations)
  end
end
