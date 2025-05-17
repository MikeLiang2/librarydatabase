# Boston Public Library Database System

This project implements a relational database system for the Boston Public Library (BPL), supporting its services, collections, events, and users. The system is built with MySQL and adheres to the principles of 3rd Normal Form (3NF) for data integrity and efficiency.

## Project Files

- `boston public library.sql`  
  Schema definition including all tables, relationships, primary and foreign keys.

- `boston public library testing data.sql`  
  Sample data for testing the database functionality.

- `boston public library query test.sql`  
  Example queries to demonstrate and validate key features of the system.

- Project reports
  Contains ER diagram, relational model, normalization details, functional requirements, and test plan.

## Features

- Customer registration, library card issuance, and reservation tracking  
- Item borrowing and return with status updates and constraints (max 5 items)  
- Employee management and customer appointments  
- Support for collections with multiple contributors and publishers  
- Event and course scheduling by library and department  
- Time schedule tracking across different services

## Supported Queries

- Find available items and their details across libraries  
- Track customer reservations and history  
- View employee schedules and appointments  
- List upcoming events or active courses with schedules  
- Identify most reserved collections and contributor/publisher-specific collections  
- Enforce borrowing limits and item availability constraints

## Technologies

- MySQL relational database  
- Optimized with auto-increment primary keys to support efficient indexing

## Notes

All SQL files are ready to be executed in MySQL-compatible environments. Full documentation is available in the accompanying report.
