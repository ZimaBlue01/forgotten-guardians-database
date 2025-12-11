<p align="center">
  <img src="docs/header_banner.png" width="900" alt="The Forgotten Guardians Database Project Banner">
</p>





# 🛡️ The Forgotten Guardians – MMORPG Database Project
*A complete SQL Database Design & Implementation Project by Muhammed Uwais Adam*  
*Eduvos – Database Management Project 1*  

---

## 📌 Overview  
This project represents the full **database design, implementation, and functionality** for an MMORPG (Massive Multiplayer Online Role-Playing Game) called **The Forgotten Guardians**.  

The system manages:

- Player accounts & subscription time  
- Characters, teams, and skill levels  
- Inventory items with stackable quantities  
- Error logging and error types  
- Stored procedures to automate gameplay-related operations  
- Views to analyse gameplay data  
- Triggers and indexes to enforce rules & improve performance  

This repository includes:

- 📄 Full project PDF documentation (`/docs/Start_Here.pdf`)  
- 📊 Entity Relationship Diagram (`/docs/ER_Diagram.png`)  
- 💬 Example stored procedure report (`/docs/report_example.png`)  
- 🧠 All SQL scripts (schema, inserts, views, procedures, triggers)

---

## 🏹 Game Story Summary  
> *Judgement Day destroyed the world. A small fraction of humanity survived, empowered by celestial beings known as The Forgotten Guardians to rebuild the planet and battle the demons expelled from Hell. These humans must now choose sides in the war between light and darkness.*  


The database must support this game universe by organizing:

- Accounts  
- Characters  
- Items  
- Skills  
- Teams  
- Subscriptions  
- Errors and logs  

---

## 🧩 Database Requirements (from the project brief)

The MMORPG database must support:

- Unique player accounts with subscription time  
- Automatic **blocking** of accounts when time expires  
- Multiple characters per account  
- Character teams and individual skill levels  
- Real-time inventory system with 8 slots and **stackable items**  
- Error logging with categorized error types  
- Stored procedures for registration, adding time, adding items, adding characters, and sending letters  
- Views to analyse top players, items, etc.  

Requirements summary from the PDF:  
✔ ERD  
✔ Create database + all tables in one script  
✔ Insert sample data  
✔ Create 4 views  
✔ Create 5 stored procedures  
✔ Create indexes  
✔ Create triggers  
✔ Provide example report output  


---


---

## 🧱 Key Entities in the ERD

✔ **ACCOUNT**  
Stores username, subscription status, creation date. Accounts can be blocked when time runs out.  

✔ **GAME CHARACTERS**  
Each account may have multiple characters; each belongs to a team and has skillsets.  

✔ **TEAM**  
Characters belong to teams, each with goals, morality, and description.  

✔ **SKILLSET LEVELS / CHARACTER SKILLSET**  
Tracks each character’s levels and abilities.  

✔ **INVENTORY & INVENTORY ITEMS**  
Each character has 8 inventory slots.  
Items **stack** when identical.  
Quantity must always be tracked.  

✔ **ITEMS & ITEM FUNCTIONS**  
Each item has a function (heal, buff, attack, etc.), stored separately to allow future changes without editing items.  

✔ **ACCOUNT STATUS & MONTHLY SUBSCRIPTION**  
Tracks subscription payments and determines whether accounts are active or blocked.  

✔ **ERROR LOG / ERROR TYPE LOG**  
Categorized error tracking for debugging and analytics.  

✔ **SESSION**  
Tracks logins, device, IP address, and logout time.  

---

## 🛠️ SQL Functionality Implemented

### 📌 **1. Database & Tables**
Full schema creation in a single script, including keys, constraints, relationships, and datatypes.

### 📌 **2. Sample Data**
Inserted sample players, characters, items, functions, skills, teams, subscriptions, etc.

---

## 📊 3. Views  

- **vwTopSkill** – Shows top-skilled characters  
- **vwTopStackedItems** – Shows characters stacking the most items  
- **vwPopItems** – Shows most popular (frequently held) items  
- **vwBlockedAccounts** – Shows accounts that are currently blocked  

---

## ⚙️ 4. Stored Procedures

### ✔ `spRegister`
Registers a new account with validation.

### ✔ `spAddTime`
Extends subscription time and unblocks accounts.

### ✔ `spAddItem`
Adds items to a character’s inventory; stacks when appropriate.

### ✔ `spAddCharacter`
Creates new characters for an account.

### ✔ `spSendLetter3`
Generates an in-game letter summarizing:
- remaining subscription time,  
- announcements,  
- upcoming maintenance.  
An example output is in `/docs/report_example.png`.

---

## 🔐 5. Triggers

### ✔ `inventory_limit_trigger`
Prevents adding more than 8 item slots.

### ✔ `block_insert_trigger`
Blocks new insertions for accounts that have expired subscriptions.

---

## 🚀 6. Indexes  

Indexes created to improve query speed for:

- Inventory searches  
- Character lookups  
- Account activity  

---

## 🧠 Learning Outcomes

This project demonstrates:

- Strong ERD and relational database design  
- Understanding of dependencies, keys, and normalization  
- Implementation of **real gameplay mechanics** using SQL  
- Professional use of **views**, **stored procedures**, **indexes**, and **triggers**  
- Practical scenario modeling based on an MMORPG storyline  


---



## ✍️ Author  
**Muhammed Uwais Adam**  
Database Design & Software Engineering  
Eduvos — Bedfordview Campus  

---





