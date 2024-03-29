async function onSubmit(event) {
    event.preventDefault();

    const fileInput = document.getElementById('fileUpload');
    const file = fileInput.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = async function (e) {
            const base64String = e.target.result.split(',')[1];

            const payload = {
                model: "gpt-4-vision-preview",
                messages: [
                    {
                        role: "user",
                        content: [
                            {
                                type: "text",
                                text: "Of this bill, give me the name of the place of the bill's origin, comma, the price in a digit format. For example, McDonald's,15"
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
                const response = await fetch('https://api.openai.com/v1/chat/completions', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer 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'
                        
                        
                    },
                    body: JSON.stringify(payload)
                });

                const data = await response.json();
                const content = data.choices[0].message.content;
                const [nameOfFood, price] = content.split(',').map(item => item.trim());

                // Post to your Node.js server
                const localResponse = await fetch('http://localhost:3000/', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ nameOfFood, price })
                });

                const localData = await localResponse.json();
                console.log(localData);
            } catch (error) {
                console.error('Error:', error);
            }
        };

        reader.readAsDataURL(file);
    } else {
        console.error('No file selected');
    }
}
