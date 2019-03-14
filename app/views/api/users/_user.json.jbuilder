json.(user, :id, :name, :alias)

json.projects user.projects_users do |project|
  json.(project, :id, :typeofrate, :currency, :rate)
  json.name project.project.name
end

json.payments user.current_payments, partial: 'payment', as: :payment
json.payments_history user.old_payments, partial: 'payment', as: :payment
