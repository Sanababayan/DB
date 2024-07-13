select hosts.host_id, sum(rooms.room_price) from rooms
inner join hosts on hosts.host_id = rooms.owner
inner join reservations on reservations.room_id = rooms.room_id
where reservations.check_in_date >= now() - interval '1' month and reservations.check_in_date <= now()
group by hosts.host_id