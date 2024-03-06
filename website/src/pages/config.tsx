import Layout from '@theme/Layout';
import React, { useState } from 'react';
import axios from 'axios';

import styles from './index.module.css';

export default function Home() {
  const handlePublish = async () => {
    try {
      const response = await axios.get('http://112.83.140.12:3001/config');
      console.log(response.data); // 输出部署结果
    } catch (error) {
      console.error('部署失败:', error);
    }
  };

  return (
    <Layout
      title={`Config`}
      description="Config">
      <main>
        <button onClick={handlePublish}>publish</button>
      </main>
    </Layout>
  );
}
