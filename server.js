'use strict';

const express = require('express');

// Constants
const PORT = 9090;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('<!DOCTYPE html>
<html>
<body bgcolor="#E6E6FA">
<h1>Hello world!</h1>
</body>
</html>'
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
