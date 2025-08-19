****Fishing Club Database Design Project**

**Project Title**

**Fishing Club Database Design Project**

**Brief Description**

This project creates a database for a fishing club to track members,
trips, catches, events, and locations. The design focuses on clarity,
data integrity, and easy reporting, so the club can manage information
in a single, consistent system.

**Purpose of the Database**

The goal is to store all the information in one clean place instead of
using messy spreadsheets. The database has seven main tables:
**Members**, **Fishing_Trips**, **Fish_Catches**, **Events**,
**Location** (Locations), **Attendance**, and **Fish type**.

-   **Members** stores people in the club.

-   **Location** keeps addresses for events and trips.

-   **Fishing_Trips** records each fishing trip.

-   **Events** stores club events like tournaments or meetings.

-   **Fish_Catches** links to trips and records what fish were caught
    (who caught the fish can be added later if needed).

I struggled with creating many-to-many and one-to-one sample data. I was
not always sure how to connect the tables correctly. I figured out the
one-to-one tables and added a new table for fish types. I think the
**Fish type** table could work as a one-to-one relationship with
**Fish_Catches**. The overall structure looks good now, but I feel I
still need more examples of many-to-many relationships. I also need to
better understand which tables should use many-to-many relationships and
how to connect them properly. Then I searched for many-to-many
relationships to improve my understanding. After that, I connected the
**Members** table to **Attendance**, then to **Events**. Because a
member can be involved in many events and an event can include many
members, **Members ↔ Events** is many-to-many. That is why I connected
them using **Attendance** as a bridge (junction) table. Now I have a
database with a clear many-to-many relationship.

**Technologies Used**

This project is designed with **MySQL** in mind as the target database
technology. Development and testing are done in **MySQL Workbench**.

**Instructions to Run SQL Scripts**

The database currently runs locally on my workstation using MySQL. Now
you have all my data tables information.

1.  Create the schema and tables (run the DDL script in MySQL Workbench
    or the MySQL CLI).

2.  Insert sample data (run the seed/INSERT script).

3.  Use SELECT queries to verify foreign keys and relationships.

4.  Build your EER diagram in MySQL Workbench and export it as PDF/PNG.

**Task Completion: Tables, Attributes, Primary Keys, Foreign Keys, and
Relationships**

**1) Tables and Attributes (with PK/FK labels)**

**Note:** Names match your current script. I've included brief notes and
keys for each.

**a) Members**

-   **PK:** MemberID (INT, NOT NULL)

-   FirstName (VARCHAR)

-   LastName (VARCHAR)

-   Phone (VARCHAR)

-   Email (VARCHAR)

-   JoinDate (DATE)

-   MemberType (TINYINT)

**b) Location**

-   **PK:** LocationID (INT, NOT NULL)

-   Name (VARCHAR)

-   Address (VARCHAR)

-   City (VARCHAR)

-   State (VARCHAR)

-   Zipcode (VARCHAR)

**c) Fishing_Trips**

-   **PK:** TripID (INT, NOT NULL, AUTO_INCREMENT)

-   TripDate (DATE, NOT NULL)

-   TripTime (TIME, NOT NULL)

-   Trip_Type (TINYINT)

-   **FK:** Location_LocationID → Location(LocationID)

**d) Events**

-   **PK:** EventID (INT, NOT NULL, AUTO_INCREMENT)

-   Name (VARCHAR)

-   EventsDate (DATE)

-   Purpose (VARCHAR)

-   **FK:** Location_LocationID → Location(LocationID)

**e) Fish_Catches**

-   **PK:** CatchID (INT, NOT NULL, AUTO_INCREMENT)

-   Weight (VARCHAR, NOT NULL) \<!\-- can be numeric later \--\>

-   Length (VARCHAR, NOT NULL) \<!\-- can be numeric later \--\>

-   Released (TINYINT)

-   **FK:** Fishing_Trips_TripID → Fishing_Trips(TripID)

**f) Attendance (junction table for Members ↔ Events)**

-   **PK:** AttendanceID (INT, NOT NULL, AUTO_INCREMENT)

-   Role (VARCHAR)

-   Type (VARCHAR)

-   **FK:** Members_MemberID → Members(MemberID)

-   **FK:** Events_EventID → Events(EventID)

Tip: For strict M:M integrity, you can also enforce uniqueness on
(Members_MemberID, Events_EventID) to avoid duplicate attendance rows
for the same member/event pair.

**g) Fish type (1:1 with Fish_Catches in your current design)**

-   **PK:** TypeID (INT, NOT NULL, AUTO_INCREMENT)

-   SpeciesName (VARCHAR, NOT NULL)

-   WaterType (VARCHAR)

-   Fish typecol (VARCHAR) \<!\-- optional/free-form \--\>

-   **FK:** Fish_Catches_CatchID → Fish_Catches(CatchID)

If later you decide that a catch can include multiple species, convert
this to M:M by introducing a junction table (see suggestion below).

**2) Relationships (with cardinality)**

-   **Location → Fishing_Trips:** **1:M**\
    One location can host many trips; each trip occurs at one location.

-   **Location → Events:** **1:M**\
    One location can host many events; each event occurs at one
    location.

-   **Fishing_Trips → Fish_Catches:** **1:M**\
    One trip can have many catches; each catch belongs to one trip.

-   **Members ↔ Events (via Attendance):** **M:M**\
    A member can attend many events, and an event can include many
    members.

    -   **Bridge/Junction:** Attendance(Members_MemberID,
        Events_EventID)

-   **Fish_Catches ↔ Fish type:** **1:1** (as currently modeled)\
    Each catch has exactly one fish type row; each fish type row links
    to exactly one catch.
<img width="916" height="875" alt="EER DIAGRAM" src="https://github.com/user-attachments/assets/2e1737e7-1e81-45fd-9ced-3cc9f168c794" />


**
