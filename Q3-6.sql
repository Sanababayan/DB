select guests.guest_id, guests.guest_name, guests.guest_contact , count(distinct reservations.reservation_id) from guests
inner join reservations on reservations.guest_id = guests.guest_id
group by(guests.guest_id)
order by count(reservations.reservation_id) desc limit 5;