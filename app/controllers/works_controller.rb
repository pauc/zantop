class WorksController < ApplicationController
  include Authorization
  include Sortable

  respond_to :html

  expose(:works) { Work.all }

  def admin

  end
end
