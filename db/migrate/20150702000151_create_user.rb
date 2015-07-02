class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :bowtie_user_id
      t.string :bowtie_user_name
      t.string :bowtie_user_email
    end
  end
end
