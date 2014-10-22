class AllIzoneSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :dbn
      t.string :school
      t.string :initiative
      t.integer :cohort
      t.string :principal
      t.string :email
      t.string :phone
      t.string :address
      t.string :coach

    end

  end
end
