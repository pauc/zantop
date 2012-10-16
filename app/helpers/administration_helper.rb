# encoding: utf-8
module AdministrationHelper

  def method_missing(meth, *args)
    super unless meth.to_s =~ /.+admin_links$/
  end

  def dashboards_front_admin_links
    html = link_to "Administrar treballs", admin_works_path
    html << link_to("Administrar tags", admin_tags_path)
    html << link_to("Crear treball d'acció", new_action_work_path)
    html << link_to("Crear treball visual", new_visual_work_path)
  end

  def action_works_show_admin_links
    html = edit_link
    html << delete_link
  end

  def action_works_edit_admin_links
    link_to t('back'), get_resource
  end

  def action_works_new_admin_links
    link_to t('back'), admin_works_path
  end

  def visual_works_show_admin_links
    html = edit_link
    html << delete_link
  end

  def visual_works_edit_admin_links
    link_to t('back'), get_resource
  end

  def visual_works_new_admin_links
    link_to t('back'), admin_works_path
  end

  def works_admin_admin_links
    html = link_to "Crear treball d'acció", new_action_work_path
    html << link_to("Crear treball visual", new_visual_work_path)
  end

  def action_works_index_admin_links
    link_to "Crear treball d'acció", new_action_work_path
  end

  private

  def edit_link
    link_to t('edit'), url_for(controller: controller.controller_name, action: 'edit', id: get_resource.slug)
  end

  def delete_link
    link_to t('delete'), url_for(get_resource), method: :delete, confirm: 'Segur que ho vols esborrar?', class: 'warning'
  end

  def get_resource
    controller.controller_name.classify.constantize.find(params[:id])
  end
end
