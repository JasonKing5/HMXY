const express = require("express");
const { exec } = require("child_process");

const app = express();
const PORT = 3001; // 你的服务端口

// 处理跨域请求
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE, OPTIONS");
  res.header(
    "Access-Control-Allow-Headers",
    "Content-Type, Authorization, Content-Length, X-Requested-With"
  );
  next();
});

// 处理部署请求
app.get("/config", (req, res) => {
  执行部署脚本;
  exec("sudo ./publish.sh", (error, stdout, stderr) => {
    if (error) {
      console.error(`执行脚本错误: ${error.message}`);
      res.status(500).send("部署失败");
      return;
    }
    if (stderr) {
      console.error(`脚本错误输出: ${stderr}`);
      res.status(500).send("部署失败");
      return;
    }
    console.log(`脚本输出: ${stdout}`);
    res.status(200).send("部署成功");
  });
});

app.listen(PORT, () => {
  console.log(`服务器运行在 http://localhost:${PORT}`);
});
