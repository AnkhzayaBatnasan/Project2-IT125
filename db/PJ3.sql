use mydb;

create view view_attendance as
select
  attendance.attendanceid,
  members.firstname,
  members.lastname,
  events.name      as eventname,
  events.eventsdate,
  attendance.role,
  attendance.type  as attendancestatus
from attendance
join members on members.memberid = attendance.members_memberid
join events  on events.eventid   = attendance.events_eventid;

create view view_fish_catches as
select
  fish_catches.catchid,
  `fish type`.speciesname,
  `fish type`.watertype,
  fish_catches.weight,
  fish_catches.length,
  fish_catches.released,
  fishing_trips.tripdate,
  location.city,
  location.state
from fish_catches
join `fish type` on `fish type`.fish_catches_catchid = fish_catches.catchid
join fishing_trips on fishing_trips.tripid = fish_catches.fishing_trips_tripid
join location on location.locationid = fishing_trips.location_locationid;

create index ix_members_lastname on members (lastname);

create index ix_fish_catches_released on fish_catches (released);

select events.EventID,
  events.Name as EventName,
  SUM(attendance.Type = 'Attended')   as AttendedCount,
  SUM(attendance.Type = 'Registered') as RegisteredCount,
  COUNT(*) as TotalResponses
  FROM events
LEFT JOIN attendance ON attendance.Events_EventID = events.EventID
GROUP BY events.EventID, events.Name
ORDER BY events.EventsDate;

select
  members.memberid,
  members.firstname,
  members.lastname,
  count(attendance.attendanceid) as attended_events
from members
join attendance on attendance.members_memberid = members.memberid
where attendance.type = 'Attended'
group by members.memberid, members.firstname, members.lastname
order by attended_events desc;

select *
from view_fish_catches
where released = 1
order by tripdate;

alter table fish_catches
  add column memberid int null,
  add constraint fk_fish_catches_member
  foreign key (memberid) references members(memberid);
  
update fish_catches set memberid = 5 where catchid = 1;
update fish_catches set memberid = 10 where catchid = 2;


select
  members.firstname,
  members.lastname,
  `fish type`.speciesname,
  fish_catches.weight,
  fish_catches.length
from fish_catches
join `fish type` on `fish type`.fish_catches_catchid = fish_catches.catchid
join members on members.memberid = fish_catches.memberid
order by fish_catches.weight desc
limit 1;






