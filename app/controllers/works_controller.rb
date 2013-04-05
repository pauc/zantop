class WorksController < ApplicationController
  include Authorization
  include Sortable

  respond_to :html

  expose(:works) { Work.includes :translations }

  def admin

  end
end
