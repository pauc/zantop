module Sortable
  extend ActiveSupport::Concern

  def sort
    objects = controller_name.classify.constantize.find(:all)
    reorder objects
    render nothing: true
  end

  private

  def reorder(sortables)
    sql = "BEGIN; "
    sortables.each do |obj|
      sql << sql_obj_reorder(obj)
    end
    sql << "COMMIT;"
    controller_name.classify.constantize.connection.update(sql)
  end

  def sql_obj_reorder(object)
    position = params["#{object.class.table_name.classify.downcase}"].index(object.id.to_s) + 1
    table = object.class.table_name
    "UPDATE #{table} SET position = #{position} WHERE #{table}.id = #{object.id}; "
  end
end
