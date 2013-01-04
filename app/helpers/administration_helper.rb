# encoding: utf-8
module AdministrationHelper

  def method_missing(meth, *args)
    super unless meth.to_s =~ /.+content_controls$/
  end

  ## PAGES ##
  def dashboards_about_content_controls
    link_to t('edit'), edit_page_path(1)
  end

  def dashboards_contact_content_controls
    link_to t('edit'), edit_page_path(2)
  end

  def pages_edit_content_controls
    path = params[:id] == "1" ? about_path : contact_path
    link_to t('back'), path
  end

  ## ACTION WORKS ##
  def action_works_show_content_controls
    html = edit_link
    html << delete_link
  end

  def action_works_new_content_controls
    link_to t('back'), action_works_path
  end

  def action_works_edit_content_controls
    html = link_to(t('back'), action_work_path(params[:id]))
    html << delete_link
  end

  ## VISUAL WORKS ##
  def visual_works_show_content_controls
    html = edit_link
    html << delete_link
  end

  def visual_works_new_content_controls
    link_to t('back'), visual_works_path
  end

  def visual_works_edit_content_controls
    html = link_to( t('back'), visual_work_path(params[:id]) )
    html << delete_link
  end

  private

  def edit_link
    link_to t('edit'), url_for(controller: controller.controller_name, action: 'edit', id: params[:id])
  end

  def delete_link
    link_to t('delete'), url_for(controller: controller.controller_name, action: 'destroy', id: params[:id]), method: :delete, confirm: 'Segur que ho vols esborrar?', class: 'warning'
  end
end
