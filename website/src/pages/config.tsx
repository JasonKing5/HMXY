import Layout from '@theme/Layout';
import React, { useState } from 'react'

import styles from './index.module.css';

export default function Home() {


  return (
    <Layout
      title={`Config`}
      description="Config">
      <main>
        <button>publish</button>
      </main>
    </Layout>
  );
}
