const PORT = 3000;

const express = require('express');

const app = express();

app.listen(PORT, () => console.log(`Server listening on port ${PORT}`))

app.get('/', (req, res) => {
    res.send('Hello Word!')
})