class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

      t.timestamps
    end

    Page.create_translation_table! title: :string,
                                   body: :text
  end
end
