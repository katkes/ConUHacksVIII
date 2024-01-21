// app.js

async function onSubmit(event){
    event.preventDefault();

    const fileInput = document.getElementById('fileUpload');
    const file = fileInput.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = async function(e) {
            // Extract Base64 data from the result
            const base64String = e.target.result.split(',')[1]; // Remove the data URL part

            // Payload for OpenAI API
            const payload = {
                model: "gpt-4-vision-preview",
                messages: [
                    {
                        role: "user",
                        content: [
                            {
                                type: "text",
                                text: "Of this bill, give me the name of the place of the bill's origin, comma, the price in a digit format. For exmaple, McDonald's,15"
                            },
                            {
                                type: "image_url",
                                image_url: {
                                    url: `data:image/jpeg;base64,${base64String}`
                                }
                            }
                        ]
                    }
                ],
                max_tokens: 300
            };

            try {
                // OpenAI API endpoint
                const response = await fetch('https://api.openai.com/v1/chat/completions', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer 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'
                    },
                    body: JSON.stringify(payload)
                });

                const data = await response.json();
                console.log(data);
                console.log(data.choices[0].message.content)
            } catch (error) {
                console.error('Error:', error);
            }
        };

        reader.readAsDataURL(file);
    } else {
        console.error('No file selected');
    }
}
