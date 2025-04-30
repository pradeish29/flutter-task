const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/userRoutes');

const app = express();
const PORT = 5000;

// Replace <db_password> with your actual password
const MONGO_URI = 'mongodb+srv://pradeishmisara29:29082003@cluster0.5zqgd.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';

app.use(cors());
app.use(bodyParser.json());
app.use('/users', userRoutes);

// Connect to MongoDB and start server
mongoose.connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('✅ Connected to MongoDB');
    app.listen(PORT, () => console.log(`🚀 Server running on http://localhost:${PORT}/users`));
  })
  .catch(err => console.error('MongoDB connection error:', err));
