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

      ["Toan", "Tieng Viet", "Tieng Anh"].each do |subject|
        Subject.create name: subject
      end

      ClassRoom.all.each do |cl|
        Subject.all.each do |sub|
          ClassRoomSubject.create class_room_id: cl.id, subject_id: sub.id
        end
      end
    end
    # Tao bai thi va cau hoi
    if Rails.env.production?
      puts "Not running in 'Production' task."
    else
      (1..5).each do
        Exame.create
      end
      Exame.all.each do |ex|
        (1..10).each do |i|
          Subject.all.each do |sub|
            ClassRoom.all.each do |cl|
              ex.questions.create name: "Huyền có #{20 + i} bút chì màu, biết Huyền đã làm mất 4 chiếc bút chì màu. Hỏi Huyền còn bao nhiêu bút chì màu?", subject_id: sub.id, class_room_id: cl.id
            end
          end
        end
      end
    end
    # Tao cau hoi

    puts "Create ok!!!!!!!!!!!!"
  end
end
