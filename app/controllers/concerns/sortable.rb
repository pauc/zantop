module Sortable
  extend ActiveSupport::Concern

  module SimpleSort
  
    def sort
      objects = controller_name.classify.constantize.find(:all)
      objects.each do |obj|
        obj.position = params["#{obj.class.to_s.downcase}"].index(obj.id.to_s) + 1
        obj.save
      end
      render nothing: true
    end
  end

  module SortNested

    def sort_nested
      object = controller_name.classify.constantize.find(params[:id])
      sortable = params[:sortable]
      sortables = object.send("#{sortable}")
      sortables.each do |obj|
        obj.position = params["#{obj.class.to_s.downcase}"].index(obj.id.to_s) + 1
        obj.save
      end
      render nothing: true
    end
  end
end