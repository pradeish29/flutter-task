# KEBS User Management App

A full-stack user management system built with **Flutter** (frontend) and **Node.js (Express)** + **MongoDB** (backend).  
Users can be created, edited, viewed, and deleted with role, zone, and department data.

---

## 🛠️ Tech Stack

- **Frontend**: Flutter
- **Backend**: Node.js + Express
- **Database**: MongoDB (Mongoose)

---

## 📁 Project Structure

```
project-root/
├── backend/
│   ├── models/
│   │   └── users.js
│   ├── routes/
│   │   └── userRoutes.js
│   ├── server.js
│   └── .env
├── frontend/
│   ├── lib/
│   │   ├── home.dart
│   │   ├── user_model.dart
│   │   ├── user_service.dart
│   │   ├── user_form.dart
│   │   └── user_detail.dart
│   └── pubspec.yaml
```

---
## Screenshots
![image](https://github.com/user-attachments/assets/c41fe877-1578-484a-9597-630faf1af04a)
![image](https://github.com/user-attachments/assets/c6671b1e-6bea-4e04-bd2b-b6cf87c7bc12)
![image](https://github.com/user-attachments/assets/c3ac3d52-0cfa-4efd-bf27-36925040f554)
![image](https://github.com/user-attachments/assets/081d34ee-a2a6-4665-a8a9-1c5b642527d2)

---
## ⚙️ Backend Setup (Node.js)

1. Navigate to the `backend/` directory:

   ```bash
   cd backend
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Create a `.env` file:

   ```env
   PORT=5000
   MONGO_URI=mongodb://localhost:27017/kebs_users
   ```

4. Run the server:

   ```bash
   node server.js
   ```

   > Server runs on `http://localhost:5000`

---

## 📲 Frontend Setup (Flutter)

1. Navigate to the `frontend/` directory:

   ```bash
   cd frontend
   ```

2. Get packages:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

   > Make sure your backend server is running before submitting forms.

---

## ✅ Features

- View all users
- View detailed user profile
- Create a user (with validation)
- Edit existing users (prefilled form)
- Delete user (with confirmation dialog)

---

## 🔐 Notes

- The `AID` field is unique and numeric.
- The backend uses Mongoose for validation.
- The frontend automatically converts `AID` from `String` to `Number` during submission.

---

## 🧪 Sample API Endpoints

| Method | Endpoint         | Description          |
|--------|------------------|----------------------|
| GET    | /users           | List all users       |
| GET    | /users/:aid      | Get user by AID      |
| POST   | /users           | Create user          |
| PUT    | /users/:aid      | Update user by AID   |
| DELETE | /users/:aid      | Delete user by AID   |

---

## 📸 UI Screens

- 📋 User List
- ➕ Add User
- 📝 Edit User (prefilled form)
- ❌ Delete User (confirmation dialog)
- 👁️ View User Details

---

## 🤝 Contributing

Pull requests and issues are welcome. Please open an issue first to discuss changes before submitting a PR.

---

## 📄 License

MIT License – © 2025 KEBS User Management App
