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
    # if Rails.env.production?
    #   puts "Not running in 'Production' task."
    # else
    #   (1..5).each do
    #     Exame.create
    #   end
    #   Exame.all.each do |ex|
    #     (1..10).each do |i|
    #       Subject.all.each do |sub|
    #         ClassRoom.all.each do |cl|
    #           ex.questions.create name: "Huyền có #{20 + i} bút chì màu, biết Huyền đã làm mất 4 chiếc bút chì màu. Hỏi Huyền còn bao nhiêu bút chì màu?", subject_id: sub.id, class_room_id: cl.id
    #         end
    #       end
    #     end
    #   end
    # end

    (1..5).each do
        Exame.create
      end
    # Cau 1:
    Exame.all.each do |ex|
      (1..10).each do |i|
      ex.questions.create name: "Huyền có #{ 20 + i} bút chì màu, biết Huyền đã làm mất 4 chiếc bút chì màu. Hỏi Huyền còn bao nhiêu bút chì màu?", answser: "#{20 + i -4} bút chì", subject_id: 1, class_room_id: 1
    end
    end

    Exame.all.each do |ex|
      i = 1
      ex.questions.each do |q|
        q.answers.create name: "#{20+i -4} bút chì"
        q.answers.create name: "#{13 - i -1} bút chì"
        q.answers.create name: "#{13 - i -2} bút chì"
        q.answers.create name: "#{13 - i -3} bút chì"
        i+=1
      end
    end


    puts "Create ok!!!!!!!!!!!!"
  end

  # task remake_exames: :environment do
  # end

  # task remake_anwser: :environmnet doe

  # end
end
