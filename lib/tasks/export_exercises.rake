require 'csv'

namespace :purgatory do
  desc 'export exercises to ../rails_purgatory/exercise_data'
  task export_exercises: :environment do
    rows = Dir[Rails.root.join("app/purgatory_challenges/staged_challenges/*.rb")].map do |exercise|

      name = exercise.split("/").last.gsub(".rb","")
      solution_frame_path = "app/purgatory_challenges/" + name + ".rb"

      solution_frame = File.read(exercise)
      level = solution_frame.scan(/(LEVEL = \d)/).flatten.first[-1]

      spec_path = Dir[Rails.root.join("app/purgatory_challenges/_spec/staged_specs/*.rb")].select { |spec| spec.include?(name)}.first

      spec = File.read(spec_path)

      spec_path = "app/purgatory_challenges/_spec/" + name + "_spec.rb"

      [name, spec, spec_path, solution_frame, solution_frame_path, level]
    end

    exercise_file = "../rails_purgatory/data/exercises.csv"

    CSV.open(exercise_file, "w")  do |csv|
      csv << ["name", "spec", "spec_path", "solution_frame", "solution_frame_path", "level"]
      rows.each do |row|
        csv << row
        puts "Exported exercise #{row.first.capitalize}."
      end
    end
  end
end
