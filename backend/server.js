// server.js
const express = require('express');
const axios = require('axios');
const app = express();
const port = 3000;

app.use(express.json());

// Route to handle requests
app.post('/', async (req, res) => {
    const { nameOfFood, price } = req.body;

    try {
        // Send data to Flutter app or process as needed
        // Placeholder url
        const flutterResponse = await axios.post('http://flutter-app-url', { nameOfFood, price });

        res.json(flutterResponse.data);
    } catch (error) {
        console.error(error);
        res.status(500).send('Error processing the request');
    }
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
