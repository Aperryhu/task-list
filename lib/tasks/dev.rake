desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do


  user = User.new
  user.email = "bob@example.com"
  user.password = "password"
  user.save

  if user.errors.any?
    p user.errors.full_messages
  end

  p "#{User.count} users are in the database."

  # 3.times do
  #   another_user = "#{Faker::Name.unique.name}@example.com"
  #   another_user.password = "password"
  #   another_user.save
  # end

  20.times 
  task = Task.new
  task.body = Faker::TvShows::SouthPark.quote
  task.status = ["not_yet_started", "in_progress", "completed"].sample
  task.user_id = user.id
  task.save
  end
  p "#{Task.count} task in the database."
end
