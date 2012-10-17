# encoding: utf-8
module AdministrationHelper

  def method_missing(meth, *args)
    super unless meth.to_s =~ /.+admin_links$/
  end

  ## DASHBOARDS ##
  def dashboards_front_admin_links
    html = link_to "Administrar treballs", admin_works_path
    html << link_to("Administrar tags", admin_tags_path)
    html << link_to("Crear treball d'acció", new_action_work_path)
    html << link_to("Crear treball visual", new_visual_work_path)
  end

  def dashboards_about_admin_links
    link_to t('edit'), edit_page_path(1)
  end

  def dashboards_contact_admin_links
    link_to t('edit'), edit_page_path(2)
  end

  ## PAGES ##
  def pages_edit_admin_links
    path = params[:id] == "1" ? about_path : contact_path
    link_to t('back'), path
  end

  ## WORKS ##
  def works_admin_admin_links
    html = link_to "Crear treball d'acció", new_action_work_path
    html << link_to("Crear treball visual", new_visual_work_path)
  end

  ## ACTION WORKS ##
  def action_works_index_admin_links
    link_to "Crear treball d'acció", new_action_work_path
  end

  def action_works_show_admin_links
    html = edit_link
    html << link_to('Administrar trballs', admin_works_path)
    html << delete_link
  end

  def action_works_new_admin_links
    link_to t('back'), admin_works_path
  end

  def action_works_edit_admin_links
    link_to t('back'), action_work_path(params[:id])
  end

  ## VISUAL WORKS ##
  def visual_works_index_admin_links
    link_to "Crear treball visual", new_visual_work_path
  end

  def visual_works_show_admin_links
    html = edit_link
    html << link_to('Administrar treballs', admin_works_path)
    html << delete_link
  end

  def visual_works_new_admin_links
    link_to t('back'), admin_works_path
  end

  def visual_works_edit_admin_links
    link_to t('back'), visual_work_path(params[:id])
  end

  ## TAGS ##
  def tags_show_admin_links
    dashboards_front_admin_links
  end

  def tags_admin_admin_links
    link_to "Administrar treballs", admin_works_path
  end

  private

  def edit_link
    link_to t('edit'), url_for(controller: controller.controller_name, action: 'edit', id: params[:id])
  end

  def delete_link
    link_to t('delete'), url_for(controller: controller.controller_name, action: 'destroy', id: params[:id]), method: :delete, confirm: 'Segur que ho vols esborrar?', class: 'warning'
  end
end
