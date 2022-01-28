json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :name
  json.start reservation.start_date
  json.end reservation.end_date
end