select rooms.room_id, rooms.room_number from rooms where rooms.room_id  not in (select rooms.room_id  from rooms
inner join reservations on reservations.reservation_id = rooms.room_id
where reservations.reservation_date between '2024-03-15' and '2024-03-18')