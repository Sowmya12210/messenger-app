const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());
app.use(express.json());


const db = mysql.createConnection({
  host: 'db',       
  user: 'root',
  password: 'rootpassword',
  database: 'myapp',
  port: 3306
});

db.connect((err) => {
  if (err) {
    console.error('DB connection failed:', err);
  } else {
    console.log('Connected to DB');
  }
});

// Routes
app.get('/messages', (req, res) => {
  db.query('SELECT * FROM messages', (err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});

app.post('/messages', (req, res) => {
  const { text } = req.body;
  db.query('INSERT INTO messages (text) VALUES (?)', [text], (err, result) => {
    if (err) return res.status(500).send(err);
    res.json({ id: result.insertId, text });
  });
});

app.listen(5000, () => {
  console.log('Backend running on port 5000');
});
