import Layout from '@theme/Layout';
import React, { useState } from 'react';

import styles from './index.module.css';

export default function Home() {
  const handlePublish = () => {
    fetch('http://localhost:3001/config')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.text();
      })
      .then(data => {
        console.log(data); // 输出 API 返回的数据
      })
      .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
      });
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
