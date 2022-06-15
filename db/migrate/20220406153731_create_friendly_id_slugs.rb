MIGRATION_CLASS =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  else
    ActiveRecord::Migration
  end

class CreateFriendlyIdSlugs < MIGRATION_CLASS
  def change
    change_table :friendly_id_slugs, bulk: true do |t|
      reversible do |direction|
        direction.up do
          t.change :slug, :string, limit: nil
          t.change :sluggable_type, :string, limit: 50
        end

        direction.down do
          t.change :slug, :string, limit: 255
          t.change :sluggable_type, :string, limit: 40
        end
      end

      t.string :scope
    end

    remove_index :friendly_id_slugs, [:slug, :sluggable_type], unique: true
    remove_index :friendly_id_slugs, :sluggable_id
    remove_index :friendly_id_slugs, :sluggable_type
    add_index :friendly_id_slugs, [:sluggable_type, :sluggable_id]
    add_index :friendly_id_slugs, [:slug, :sluggable_type], length: { slug: 140, sluggable_type: 50 }
    add_index :friendly_id_slugs,
              [:slug, :sluggable_type, :scope],
              length: { slug: 70, sluggable_type: 50, scope: 70 },
              unique: true
  end
end
