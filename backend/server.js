// server.js
const express = require('express');
const admin = require('firebase-admin');
const app = express();
const port = 3000;

app.use(express.json());

// Initialize Firebase Admin SDK
const serviceAccount = require('/Users/christopher/Documents/projects/ConUHacksVIII/backend/conuhacks8-firebase-adminsdk-stbif-a711138be6.json');
const cors = require("cors");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

app.use(cors()); // Enable CORS for all routes
app.use(express.json());

app.post('/', async (req, res) => {
    const { nameOfFood, price } = req.body;

    try {
        // Add data to a Firestore collection named 'expenses'
        const docRef = db.collection('expenses').doc();
        await docRef.set({ nameOfFood, price });

        res.json({ message: 'Data successfully added to Firestore' });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error processing the request');
    }
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});