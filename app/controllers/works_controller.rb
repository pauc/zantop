class WorksController < ApplicationController
  include Authorization

  respond_to :html

  expose(:works) { Work.all }

  def admin

  end
end
