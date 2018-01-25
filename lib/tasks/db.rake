namespace :db do
  desc "Rake database Exam"
  task remake_data: :environment do
    if Rails.env.production?
      puts "Not running in 'Production' task"
    else
      %w(db:drop db:create db:migrate db:test:prepare).each do |task|
        Rake::Task[task].invoke
      end

      User.create name: "Tran Duc Thang", email: "user@gmail.com", password: "123123"
      User.create name: "Tran Duc Thang B", email: "user1@gmail.com", password: "123123"

      (1..5).each do |i|
        ClassRoom.create name: "Lop-#{i}"
      end

      subjects = ["Toan", "Tieng Viet", "Tieng Anh"]

      ClassRoom.all.each do |cl|
        subjects.each do |subject|
          cl.subjects.create name: subject
        end
      end
    end

    puts "Create ok!!!!!!!!!!!!"
  end
end
