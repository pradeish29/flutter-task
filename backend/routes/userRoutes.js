const express = require('express');
const router = express.Router();
const User = require('../models/user');

// Get all users
router.get('/', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Get a specific user by id
router.get('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const user = await User.findById(id);

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json(user);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Create a new user
router.post('/', async (req, res) => {
  const { name, email, zone, role, department } = req.body;

  const newUser = new User({
    name,
    email,
    zone,
    role,
    department,
  });

  try {
    const savedUser = await newUser.save();
    res.status(201).json(savedUser);  // Send the created user back in response
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Edit an existing user
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { name, email, zone, role, department } = req.body;

  try {
    const updatedUser = await User.findByIdAndUpdate(id, {
      name,
      email,
      zone,
      role,
      department,
    }, { new: true });  // 'new' ensures the updated document is returned

    if (!updatedUser) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json(updatedUser);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Delete a user
router.delete('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const deletedUser = await User.findByIdAndDelete(id);

    if (!deletedUser) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json({ message: 'User deleted' });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
