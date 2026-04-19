# 🌍 Global warming Tracker

A database-driven web application built using **Flask (Python)** and **MySQL** to manage and analyze climate-related data such as temperature, sea level, and carbon emissions.

---

## 🚀 Features

### 🔐 Authentication
- User Login
- Admin Login
- Role-based access control

### 👤 User Dashboard
- Search climate data by country
- View:
  - 🌡️ Temperature
  - 🌊 Sea Level
  - 🌫️ Carbon Emission
- Results shown in table format

### 🛠️ Admin Panel
- Add Country
- Add Climate Data
- Update Data
- Remove Data
- Remove User

---

## 🗄️ Database Design

### Tables:
- `country(c_id, c_name, region, c_type)`
- `temperature(c_id, year, temp_rate)`
- `sea_level(c_id, year, level)`
- `carbon(c_id, year, c_rate)`
- `users(u_name, pass, role)`

### Relationships:
- One country → many temperature, sea level, carbon records

---

## ⚙️ Technologies Used

- Backend: Python (Flask)
- Frontend: HTML, CSS
- Database: MySQL

---

## 🧠 Advanced Database Features

### ✔ Stored Procedures
- `createAccount`
- `loginUser`, `loginAdmin`
- `add_country`
- `add_data`
- `update_data`
- `remove_data`
- `remove_user`

### ✔ Triggers (Data Validation)
- Temperature range: (-80 to 80)
- Carbon rate: (0 to 20)
- Sea level: (≥ 0)
- Prevent duplicate country entry

### ✔ View
- `full_data`  
  Combines country, year, temperature, sea level, and carbon data

---

## 📊 Example Use Case

- User searches for a country  
- System retrieves climate data using SQL View  
- Displays structured results in table format  

---

## 📁 Project Structure
project/
│── app.py
│── README.md
│── templates/
│ ├── login.html
│ ├── user_dashboard.html
│ ├── admin_panel.html


---

## 🌐 Deployment

The project can be deployed using:
- Render (recommended)
- Railway
- PythonAnywhere

---

## 🎯 Learning Outcomes

- Database design (ERD & Schema)
- SQL (Procedures, Triggers, Views)
- Backend development with Flask
- Full-stack integration

---

## 📌 Future Improvements

- Data visualization (charts/graphs)
- Password hashing for security
- API integration
- Advanced analytics (trend analysis)

---

## 👨‍💻 Author

Md. Maruf Hasan

---

## 💬 Note

This project demonstrates how database concepts can be integrated with a web application to build a complete data management system.



LIST OF THE COUNTRIES:

(102, 'United States', 'North America', 'Rich'),
(103, 'Canada', 'North America', 'Rich'),
(104, 'Germany', 'Europe', 'Rich'),
(105, 'France', 'Europe', 'Rich'),
(106, 'Japan', 'Asia', 'Rich'),
(107, 'Australia', 'Oceania', 'Rich'),
(108, 'Chile', 'South America', 'Rich'),
(109, 'Saudi Arabia', 'Asia', 'Rich'),
(110, 'Norway', 'Europe', 'Rich'),
(111, 'United Kingdom', 'Europe', 'Rich'),
(112, 'Italy', 'Europe', 'Rich'),
(113, 'South Korea', 'Asia', 'Rich'),
(114, 'Israel', 'Asia', 'Rich'),
(115, 'Singapore', 'Asia', 'Rich'),
(116, 'New Zealand', 'Oceania', 'Rich'),
(117, 'Spain', 'Europe', 'Rich'),
(118, 'Finland', 'Europe', 'Rich'),
(119, 'Uruguay', 'South America', 'Rich'),
(120, 'Costa Rica', 'North America', 'Rich'),
(121, 'Poland', 'Europe', 'Rich'),
(122, 'China', 'Asia', 'Middle'),
(123, 'India', 'Asia', 'Middle'),
(124, 'Brazil', 'South America', 'Middle'),
(125, 'Indonesia', 'Asia', 'Middle'),
(126, 'Mexico', 'North America', 'Middle'),
(127, 'Turkey', 'Asia', 'Middle'),
(128, 'South Africa', 'Africa', 'Middle'),
(129, 'Egypt', 'Africa', 'Middle'),
(130, 'Thailand', 'Asia', 'Middle'),
(131, 'Colombia', 'South America', 'Middle'),
(132, 'Vietnam', 'Asia', 'Middle'),
(133, 'Argentina', 'South America', 'Middle'),
(134, 'Algeria', 'Africa', 'Middle'),
(135, 'Peru', 'South America', 'Middle'),
(136, 'Iraq', 'Asia', 'Middle'),
(137, 'Philippines', 'Asia', 'Middle'),
(138, 'Morocco', 'Africa', 'Middle'),
(139, 'Bangladesh', 'Asia', 'Middle'),
(140, 'Kenya', 'Africa', 'Middle'),
(141, 'Angola', 'Africa', 'Middle'),
(142, 'Uzbekistan', 'Asia', 'Middle'),
(143, 'Guatemala', 'North America', 'Middle'),
(144, 'Ghana', 'Africa', 'Middle'),
(145, 'Nepal', 'Asia', 'Middle'),
(146, 'Jordan', 'Asia', 'Middle'),
(147, 'Cambodia', 'Asia', 'Middle'),
(148, 'Honduras', 'North America', 'Middle'),
(149, 'Papua New Guinea', 'Oceania', 'Middle'),
(150, 'Afghanistan', 'Asia', 'Poor'),
(151, 'Yemen', 'Asia', 'Poor'),
(152, 'Somalia', 'Africa', 'Poor'),
(153, 'Mozambique', 'Africa', 'Poor'),
(154, 'Madagascar', 'Africa', 'Poor'),
(155, 'Sierra Leone', 'Africa', 'Poor'),
(156, 'Chad', 'Africa', 'Poor'),
(157, 'South Sudan', 'Africa', 'Poor'),
(158, 'Malawi', 'Africa', 'Poor'),
(159, 'Niger', 'Africa', 'Poor'),
(160, 'uganda', 'Asia', 'Poor'),