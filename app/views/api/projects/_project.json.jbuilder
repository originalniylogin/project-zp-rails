json.(project, :id, :name)
json.users project.users.map(&:name)
