# 🎬 Movie Recommendation & Rating Analysis System

## 📌 Description
Streaming platforms rely heavily on user data to recommend content. This project is a SQL-based database system designed to manage and analyze movie ratings, user behavior, and viewing patterns. It simulates basic recommendation logic used in real-world streaming platforms.

---

## 🎯 Objectives
- Store user details, movie information, and ratings
- Analyze user behavior and viewing patterns
- Generate movie recommendations based on similar users
- Identify trends and popular content

---

## 🗂️ Database Tables

### 👤 Users
- user_id (Primary Key)
- name
- age

### 🎬 Movies
- movie_id (Primary Key)
- title
- genre

### ⭐ Ratings
- user_id (Foreign Key)
- movie_id (Foreign Key)
- rating

### 📊 Watch_History
- user_id (Foreign Key)
- movie_id (Foreign Key)
- watch_date

---

## 🚀 Key Features

- ⭐ Find top-rated movies using average ratings
- 🎭 Identify most popular genres based on watch history
- 🤝 Recommend movies based on similar user preferences (collaborative filtering)
- 📈 Analyze user behavior patterns
- 🔥 Detect trending movies based on recent activity

---

## 🛠 Technologies Used
- MySQL
- SQL (Joins, Aggregations, Subqueries)

---

## ⚙️ How to Run

1. Open MySQL Workbench (or any SQL environment)
2. Create a database (e.g., `movie_project`)
3. Run the `recommend.sql` file
4. Execute SQL queries to analyze data and generate insights

---

## 🎯 Expected Outcome
A recommendation-ready database system that mimics the core logic of streaming platforms by analyzing user ratings and viewing behavior.

---
