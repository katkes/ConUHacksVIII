// server.js
const express = require('express');
const axios = require('axios');
const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Route to handle requests from Flutter app
app.post('/get-price', async (req, res) => {

    let dic = ['https://raw.githubusercontent.com/katkes/ConUHacksVIII/main/bill1.jpg',
        'https://raw.githubusercontent.com/katkes/ConUHacksVIII/main/bill2.jpg',
        'https://raw.githubusercontent.com/katkes/ConUHacksVIII/main/bill3.jpg'];

    try {
        const imageUrl = dic[req.body.message];
        const response = await axios.post('https://api.openai.com/v1/chat/completions', {
            model: "gpt-4-vision-preview",
            messages: [
                {
                    role: "user",
                    content: [
                        {type: "text", text: "Give me the price of the bill. Only give me the number on the bill"},
                        {type: "image_url", image_url: {"url": imageUrl}},
                    ],
                },
            ],
        }, {
            headers: {
                'Authorization': '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'
            }
        });

        console.log(response.data.choices[0]);
        res.json(response.data.choices[0]);
    } catch (error) {
        console.error(error);
        res.status(500).send('Error processing the request');
    }
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
