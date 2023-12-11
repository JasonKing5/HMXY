/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, {type ReactNode} from 'react';

import clsx from 'clsx';

import Link from '@docusaurus/Link';
import styles from './styles.module.css';

export interface Props {
  avatar: string;
  name: string;
  content: string;
  date: string;
}

export default function Tweet({
  avatar,
  name,
  content,
  date,
}: Props): JSX.Element {
  return (
    <div className={clsx('card', styles.tweet)}>
      <div className="card__header">
        <div className="avatar">
          <img
            alt={name}
            className="avatar__photo"
            // src={`https://unavatar.io/twitter/${handle}?fallback=https://github.com/${githubUsername}.png`}
            src={avatar}
            width="48"
            height="48"
            loading="lazy"
          />
          <div className={clsx('avatar__intro', styles.tweetMeta)}>
            <strong className="avatar__name">{name}</strong>
          </div>
        </div>
      </div>

      <div className={clsx('card__body', styles.tweet)}>{content}</div>

      <div className="card__footer">
        <span className={clsx(styles.tweetMeta, styles.tweetDate)}>
          {date}
        </span>
      </div>
    </div>
  );
}
