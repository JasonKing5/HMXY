const express = require("express");
const { exec } = require("child_process");
const app = express();
const port = 3001;

app.get("/config", (req, res) => {
  // 执行 publish.sh 文件
  exec("sh publish.sh", (error, stdout, stderr) => {
    if (error) {
      console.error(`执行出错: ${error.message}`);
      res.status(500).send("执行出错");
      return;
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
      res.status(500).send("执行出错");
      return;
    }
    console.log(`stdout: ${stdout}`);
    res.send("publish.sh 文件执行成功");
  });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
