const OpenAI = require("openai");
const openai = new OpenAI({apiKey: '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'});


// async function imageGet(){
//     const response = await openai.chat.completions.create({
//         model: "gpt-4-vision-preview",
//         messages: [
//             {
//                 role: "user",
//                 content: [
//                     { type: "text", text: "give the item and price of the bill" },
//                     {
//                         type: "image_url",
//                         image_url: {
//                             "url": "https://raw.githubusercontent.com/katkes/ConUHacksVIII/main/bill1.jpg",
//                         },
//                     },
//                 ],
//             },
//         ],
//     });
//
//
// }

async function main() {
    const response = await openai.chat.completions.create({
        model: "gpt-4-vision-preview",
        messages: [
            {
                role: "user",
                content: [
                    { type: "text", text: "Give me the price of the bill. Only give me the number on the bill" },
                    {
                        type: "image_url",
                        image_url: {
                            "url": "https://raw.githubusercontent.com/katkes/ConUHacksVIII/main/bill1.jpg",
                        },
                    },
                ],
            },
        ],
    });
    console.log(response.choices[0]);
    console.log(response.length);

}
main();






// async function main() {
//     const completion = await openai.chat.completions.create({
//         messages: [{"role": "system", "content": "You are a helpful assistant."},
//             {"role": "user", "content": "Who won the world series in 2020?"},
//             {"role": "assistant", "content": "The Los Angeles Dodgers won the World Series in 2020."},
//             {"role": "user", "content": "Where was it played?"}],
//         model: "gpt-3.5-turbo",
//     });
//
//     console.log(completion.choices[0]);
// }
// main();