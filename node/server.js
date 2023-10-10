var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require('ip');

http.createServer(function (req, res) {

  if (req.url === "/") {
    fs.readFile("./public/index.html", "UTF-8", function (err, body) {
      res.writeHead(200, { "Content-Type": "text/html" });
      res.end(body);
    });
}
else if (req.url.match("/sysinfo")) {
    const myHostName = os.hostname();
    const myIP = ip.address();

    // Calculate server uptime
    const uptimeInSeconds = os.uptime();
    const uptimeDays = Math.floor(uptimeInSeconds / (60 * 60 * 24));
    const uptimeHours = Math.floor((uptimeInSeconds % (60 * 60 * 24)) / (60 * 60));
    const uptimeMinutes = Math.floor((uptimeInSeconds % (60 * 60)) / 60);
    const uptimeSeconds = Math.floor(uptimeInSeconds % 60);

    // Get total memory and free memory in MB
    const totalMemoryMB = Math.round(os.totalmem() / (1024 * 1024));
    const freeMemoryMB = Math.round(os.freemem() / (1024 * 1024));

    // Get the number of CPUs
    const numCPUs = os.cpus().length;

    const html = `
      <!DOCTYPE html>
      <html>
        <head>
          <title>Node JS Response</title>
        </head>
        <body>
          <p>Hostname: ${myHostName}</p>
          <p>IP: ${myIP}</p>
          <p>Server Uptime: ${uptimeDays} Days, ${uptimeHours} Hours, ${uptimeMinutes} Minutes, ${uptimeSeconds} Seconds</p>
          <p>Total Memory: ${totalMemoryMB} MB</p>
          <p>Free Memory: ${freeMemoryMB} MB</p>
          <p>Number of CPUs: ${numCPUs}</p>
        </body>
      </html>`;

    res.writeHead(200, { "Content-Type": "text/html" });
    res.end(html);
  } else {
    res.writeHead(404, { "Content-Type": "text/plain" });
    res.end(`404 File Not Found at ${req.url}`);
  }
}).listen(3000);

console.log("Server listening on port 3000");
