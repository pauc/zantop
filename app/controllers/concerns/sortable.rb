module Sortable
  extend ActiveSupport::Concern

  def sort
    objects = controller_name.classify.constantize.find(:all)
    reorder objects
    render nothing: true
  end


  def sort_nested
    object = controller_name.classify.constantize.find(params[:id])
    sortable = params[:sortable]
    sortables = object.send("#{sortable}")
    reorder sortables
    render nothing: true
  end

  private

  def reorder(sortables)
    sortables.each do |obj|
      obj.position = params["#{obj.class.table_name.classify.downcase}"].index(obj.id.to_s) + 1
      obj.save
    end
  end
end
