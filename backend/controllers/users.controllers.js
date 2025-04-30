const User = require("../models/users");

const getUsers = async (req, res) => {
    try {
        const users = await User.find({});
        res.status(200).json(users);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

const createUser = async (req, res) => {
    try {
        console.log("Request Body:", req.body); // Log the request body
        if (!req.body.AID) {
            return res.status(400).json({ message: "AID is required" });
        }

        const user = new User(req.body);
        await user.save();
        res.status(201).json(user);
    } catch (err) {
        console.error("Error creating user:", err); // Log the full error
        res.status(500).json({ message: err.message });
    }
};

const getUser = async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10); // Ensure ID is a Number
        if (isNaN(id)) {
            return res.status(400).json({ message: "Invalid AID format" });
        }

        const user = await User.findOne({ AID: id }); // Query using AID
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }

        res.status(200).json(user);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};


const updateUser = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const user = await User.findOneAndUpdate({ AID: id }, req.body, { new: true });
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }
        res.status(200).json(user);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

const deleteUser = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const user = await User.findOneAndDelete({ AID: id });

        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }

        res.status(200).json({ message: "User deleted successfully" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

module.exports = { getUsers, getUser, createUser, updateUser, deleteUser };
