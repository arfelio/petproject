Project.transaction do
  (1..100).each do |i|
    Project.create(:title => 'Project #{i}',:description =>'loprem ipsum #{i}',
    :project_type => 'home')
  end
end