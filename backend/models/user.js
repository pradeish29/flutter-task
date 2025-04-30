const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  AID: { type: Number, required: true },
  name: { type: String, required: true },
  email: { type: String, required: true },
  zone: { type: String, required: true },
  role: { type: String, required: true },
  department: { type: String, required: true },
}, { timestamps: true });

module.exports = mongoose.model('User', userSchema);
