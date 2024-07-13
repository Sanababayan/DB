select rooms.room_type, count(reservation_id) from rooms
left join reservations on reservations.room_id  = rooms.room_id
group by room_type
order by count(reservation_id) desc