/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import {useState, useMemo, useEffect, useCallback} from 'react';
import type { NotificationPlacement } from 'antd/es/notification/interface';
import clsx from 'clsx';
import ExecutionEnvironment from '@docusaurus/ExecutionEnvironment';
import Translate, {translate} from '@docusaurus/Translate';
import {useHistory, useLocation} from '@docusaurus/router';
// import {usePluralForm} from '@docusaurus/theme-common';
import { debounce } from 'lodash';
import { 
  Button, 
  Modal, 
  notification, 
  Cascader,
  Checkbox,
  ColorPicker,
  DatePicker,
  Form,
  Input,
  InputNumber,
  Radio,
  Select,
  Slider,
  Switch,
  TreeSelect,
  Upload, 
} from 'antd';
import { PlusOutlined } from '@ant-design/icons';

import Link from '@docusaurus/Link';
import Layout from '@theme/Layout';
import FavoriteIcon from '@site/src/components/svgIcons/FavoriteIcon';
import {
  sortedUsers,
  Tags,
  TagList,
  type User,
  type TagType,
} from '@site/src/data/users';
import Heading from '@theme/Heading';
import ShowcaseTagSelect, {
  readSearchTags,
} from './_components/ShowcaseTagSelect';
import ShowcaseFilterToggle, {
  type Operator,
  readOperator,
} from './_components/ShowcaseFilterToggle';
import ShowcaseCard from './_components/ShowcaseCard';
import ShowcaseTooltip from './_components/ShowcaseTooltip';

import styles from './styles.module.css';
import { hasToken } from '@site/src/server/auth';
import AGCServer from '../../server'

const { TextArea } = Input;

const normFile = (e: any) => {
  if (Array.isArray(e)) {
    return e;
  }
  return e?.fileList;
};

const TITLE = '鸿蒙 HarmonyOS 4.0 开发案例 (待开发，欢迎一起参与，有意者群里联系）';
const DESCRIPTION = translate({
  message: '使用鸿蒙 HarmonyOS 4.0 开发的案例列表',
});
const SUBMIT_URL = 'https://hm.codefe.cn/showcase';

type UserState = {
  scrollTopPosition: number;
  focusedElementId: string | undefined;
};

function restoreUserState(userState: UserState | null) {
  const {scrollTopPosition, focusedElementId} = userState ?? {
    scrollTopPosition: 0,
    focusedElementId: undefined,
  };
  document.getElementById(focusedElementId)?.focus();
  window.scrollTo({top: scrollTopPosition});
}

export function prepareUserState(): UserState | undefined {
  if (ExecutionEnvironment.canUseDOM) {
    return {
      scrollTopPosition: window.scrollY,
      focusedElementId: document.activeElement?.id,
    };
  }

  return undefined;
}

const SearchNameQueryKey = 'name';

function readSearchName(search: string) {
  return new URLSearchParams(search).get(SearchNameQueryKey);
}

function filterUsers(
  users: User[],
  selectedTags: TagType[],
  operator: Operator,
  searchName: string | null,
) {
  if (searchName) {
    // eslint-disable-next-line no-param-reassign
    users = users.filter((user) =>
      user.title.toLowerCase().includes(searchName.toLowerCase()),
    );
  }
  if (selectedTags.length === 0) {
    return users;
  }
  return users.filter((user) => {
    if (user.tags.length === 0) {
      return false;
    }
    if (operator === 'AND') {
      return selectedTags.every((tag) => user.tags.includes(tag));
    }
    return selectedTags.some((tag) => user.tags.includes(tag));
  });
}

function useFilteredUsers() {
  const location = useLocation();
  const [operator, setOperator] = useState<Operator>('OR');
  // On SSR / first mount (hydration) no tag is selected
  const [selectedTags, setSelectedTags] = useState<TagType[]>([]);
  const [searchName, setSearchName] = useState<string | null>(null);
  // Sync tags from QS to state (delayed on purpose to avoid SSR/Client
  // hydration mismatch)
  useEffect(() => {
    setSelectedTags(readSearchTags(location.search));
    setOperator(readOperator(location.search));
    setSearchName(readSearchName(location.search));
    restoreUserState(location.state);
  }, [location]);

  return useMemo(
    () => filterUsers(sortedUsers, selectedTags, operator, searchName),
    [selectedTags, operator, searchName],
  );
}

function ShowcaseHeader({showModal}) {
  return (
    <section className="margin-top--lg margin-bottom--lg text--center">
      <Heading as="h1">{TITLE}</Heading>
      <p>{DESCRIPTION}</p>
      {/* <Link className="button button--primary" to={hasToken() ? SUBMIT_URL : '/login'}>
        🙏 请添加您的案例
      </Link> */}
      <Button type="primary" onClick={showModal}>
      🙏 请添加您的案例
      </Button>
    </section>
  );
}

// function useSiteCountPlural() {
//   // const {selectMessage} = usePluralForm();
//   return (sitesCount: number) =>
//     selectMessage(
//       sitesCount,
//       translate(
//         {
//           id: 'showcase.filters.resultCount',
//           description:
//             'Pluralized label for the number of sites found on the showcase. Use as much plural forms (separated by "|") as your language support (see https://www.unicode.org/cldr/cldr-aux/charts/34/supplemental/language_plural_rules.html)',
//           message: '共 1 个案例|共 {sitesCount} 个案例',
//         },
//         {sitesCount},
//       ),
//     );
// }

function ShowcaseFilters() {
  const filteredUsers = useFilteredUsers();
  // const siteCountPlural = useSiteCountPlural();
  return (
    <section className="container margin-top--l margin-bottom--lg">
      <div className={clsx('margin-bottom--sm', styles.filterCheckbox)}>
        <div>
          <Heading as="h2">
            <Translate id="showcase.filters.title">标签</Translate>
          </Heading>
          <span>{`共 ${filteredUsers.length} 个案例`}</span>
        </div>
        <ShowcaseFilterToggle />
      </div>
      <ul className={clsx('clean-list', styles.checkboxList)}>
        {TagList.map((tag, i) => {
          const {label, description, color} = Tags[tag];
          const id = `showcase_checkbox_id_${tag}`;

          return (
            <li key={i} className={styles.checkboxListItem}>
              <ShowcaseTooltip
                id={id}
                text={description}
                anchorEl="#__docusaurus">
                <ShowcaseTagSelect
                  tag={tag}
                  id={id}
                  label={label}
                  icon={
                    // tag === '官方' ? (
                    //   <FavoriteIcon svgClass={styles.svgIconFavoriteXs} />
                    // ) : (
                      <span
                        style={{
                          backgroundColor: color,
                          width: 10,
                          height: 10,
                          borderRadius: '50%',
                          marginLeft: 8,
                        }}
                      />
                    // )
                  }
                />
              </ShowcaseTooltip>
            </li>
          );
        })}
      </ul>
    </section>
  );
}

const favoriteUsers = sortedUsers.filter((user) =>
  user.tags.includes('官方'),
);
const otherUsers = sortedUsers.filter(
  (user) => !user.tags.includes('官方'),
);

// function SearchBar() {
//   const history = useHistory();
//   const location = useLocation();
//   const [value, setValue] = useState<string | null>(null);
//   useEffect(() => {
//     setValue(readSearchName(location.search));
//   }, [location]);
//   return (
//     <div className={styles.searchContainer}>
//       <input
//         id="searchbar"
//         placeholder={'根据案例名称搜索...'}
//         value={value ?? undefined}
//         onInput={(e) => {
//           setValue(e.currentTarget.value);
//           const newSearch = new URLSearchParams(location.search);
//           newSearch.delete(SearchNameQueryKey);
//           if (e.currentTarget.value) {
//             newSearch.set(SearchNameQueryKey, e.currentTarget.value);
//           }
//           history.push({
//             ...location,
//             search: newSearch.toString(),
//             state: prepareUserState(),
//           });
//           setTimeout(() => {
//             document.getElementById('searchbar')?.focus();
//           }, 0);
//         }}
//       />
//     </div>
//   );
// }

function SearchBar() {
  const history = useHistory();
  const location = useLocation();
  const [value, setValue] = useState<string | null>(null);
  useEffect(() => {
    setValue(readSearchName(location.search));
  }, [location]);

  useEffect(() => {
    const searchbar = document.getElementById('searchbar');
    if (searchbar) {
      searchbar.focus();
    }
  }, [value]);

  const updateSearch = useCallback(
    debounce((searchValue: string) => {
      const newSearch = new URLSearchParams(location.search);
      newSearch.delete(SearchNameQueryKey);
      if (searchValue) {
        newSearch.set(SearchNameQueryKey, searchValue);
      }
      history.push({
        ...location,
        search: newSearch.toString(),
        state: prepareUserState(),
      });
    }, 800), //搜索延时
    [location, history]
  );

  const handleInput = (e: React.FormEvent<HTMLInputElement>) => {
    if (window.innerWidth >= 768) { // PC 端
      setValue(e.currentTarget.value);
      updateSearch(e.currentTarget.value);
    } else { // 移动端
      setValue(e.currentTarget.value);
      const newSearch = new URLSearchParams(location.search);
      newSearch.delete(SearchNameQueryKey);
      if (e.currentTarget.value) {
        newSearch.set(SearchNameQueryKey, e.currentTarget.value);
      }
      history.push({
        ...location,
        search: newSearch.toString(),
        state: prepareUserState(),
      });
    }
  };

  return (
    <div className={styles.searchContainer}>
      <input
        id="searchbar"
        placeholder="根据案例名称搜索..."
        value={value ?? undefined}
        onInput={handleInput}
      />
    </div>
  );
}

function ShowcaseCards() {
  const filteredUsers = useFilteredUsers();

  if (filteredUsers.length === 0) {
    return (
      <section className="margin-top--lg margin-bottom--xl">
        <div className="container padding-vert--md text--center">
          <Heading as="h2">
            <Translate id="showcase.usersList.noResult">😒 找不到结果，请缩短搜索词</Translate>
          </Heading>
        </div>
      </section>
    );
  }

  return (
    <section className="margin-top--lg margin-bottom--xl">
      {filteredUsers.length === sortedUsers.length ? (
        <>
          {/* <div className={styles.showcaseFavorite}>
            <div className="container">
              <div
                className={clsx(
                  'margin-bottom--md',
                  styles.showcaseFavoriteHeader,
                )}>
                <Heading as="h2">
                  <Translate id="showcase.favoritesList.title">
                    Our favorites
                  </Translate>
                </Heading>
                <FavoriteIcon svgClass={styles.svgIconFavorite} />
              </div>
              <ul
                className={clsx(
                  'container',
                  'clean-list',
                  styles.showcaseList,
                )}>
                {favoriteUsers.map((user) => (
                  <ShowcaseCard key={user.title} user={user} />
                ))}
              </ul>
            </div>
          </div> */}
          <div className="container margin-top--lg">
            <Heading as="h2" className={styles.showcaseHeader}>
              <Translate id="showcase.usersList.allUsers">所有案例</Translate>
            </Heading>
            <ul className={clsx('clean-list', styles.showcaseList)}>
              {sortedUsers.map((user) => (
                <ShowcaseCard key={user.title} user={user} />
              ))}
            </ul>
          </div>
        </>
      ) : (
        <div className="container">
          <div
            className={clsx('margin-bottom--md', styles.showcaseFavoriteHeader)}
          />
          <ul className={clsx('clean-list', styles.showcaseList)}>
            {filteredUsers.map((user) => (
              <ShowcaseCard key={user.title} user={user} />
            ))}
          </ul>
        </div>
      )}
    </section>
  );
}

export default function Showcase(): JSX.Element {
  const [open, setOpen] = useState(false);
  const [confirmLoading, setConfirmLoading] = useState(false);
  const [allValues, setAllValues] = useState({})
  
  const [api, contextHolder] = notification.useNotification();

  const showModal = () => {
    if (!hasToken()) {

      const openNotification = (placement: NotificationPlacement) => {
          api.info({
            message: `未登录`,
            description:
              '当前尚未登陆，请先登陆系统',
            placement,
          });
        };
        openNotification('top');
        setTimeout(() => {
          // todo
          // window.location.href = '/login'
        }, 500);
      return;
    }
    setOpen(true);
  };

  const handleOk = () => {
    setConfirmLoading(true);
    // onFinish(allValues)
    console.log('handleOk() allvalues:', allValues)
    setTimeout(() => {
      setOpen(false);
      setConfirmLoading(false);
    }, 2000);
  };

  const handleCancel = () => {
    console.log('Clicked cancel button');
    setOpen(false);
  };

  const onFinish = (values: any) => {
    console.log('onFinish() values: ', values);
    setConfirmLoading(true);
    AGCServer.ShowCase.createShowCase( (code, res) => {
      console.log("pages/login.tsx => createCase() code:", code, 'res:', res);
      setOpen(false);
      setConfirmLoading(false);
      if (code === 0) {
        const openNotification = (placement: NotificationPlacement) => {
          api.success({
            message: `添加成功`,
            description:
              '恭喜您，添加案例成功',
            placement,
          });
        };
        openNotification('top');
      } else {
        const openNotification = (placement: NotificationPlacement) => {
          api.error({
            message: `添加失败`,
            description:
              `很抱歉，添加案例失败，${res}！`,
            placement,
          });
        };
        openNotification('top')
      }
    })
  };

  return (
    <Layout title={TITLE} description={DESCRIPTION}>
      <main className="margin-vert--lg">
        {contextHolder}
        <ShowcaseHeader showModal={showModal}/>
        <ShowcaseFilters />
        <div
          style={{display: 'flex', marginLeft: 'auto'}}
          className="container">
          <SearchBar />
        </div>
        <ShowcaseCards />
      </main>
      {/* <Button type="primary" onClick={showModal}>
        Open Modal with async logic
      </Button> */}
      <Modal
        title="添加案例"
        open={open}
        // onOk={handleOk}
        confirmLoading={confirmLoading}
        onCancel={handleCancel}
        okText={'提交'}
        cancelText={'取消'}
        destroyOnClose
        okButtonProps={{
          htmlType: 'submit',
          form: 'form',
        }}
      >
        <Form
          labelCol={{ span: 4 }}
          wrapperCol={{ span: 19 }}
          onFinish={onFinish}
          name='form'
          layout="horizontal"
          style={{ maxWidth: 600, marginTop: '2rem' }}
          onValuesChange={(changedValues, allValues) => {
            console.log("allValues:", allValues)
            setAllValues(allValues)
          }}
        >
          <Form.Item label="案例名称" name='name' rules={[{ required: true, message: '请填写案例名称！' }, { type: 'string', min: 2, message: '案例名称不能少于2个字符！' }]}>
            <Input placeholder='案例名称'/>
          </Form.Item>
          <Form.Item label="案例源码" name='source' rules={[
            // { required: true, message: '请填写案例源码地址！' }, 
            { type: 'url', message: '案例源码格式不正确！' }
            ]}>
            <Input placeholder='案例源码地址'/>
          </Form.Item>
          <Form.Item label="案例标签" name="tags">
            <Select defaultActiveFirstOption defaultValue={'demo'}>
              <Select.Option value="demo">Demo</Select.Option>
              <Select.Option value="demo1">Demo1</Select.Option>
            </Select>
          </Form.Item>
          <Form.Item label="案例描述" name='description' >
            <TextArea rows={4} placeholder='案例描述信息'/>
          </Form.Item>
          <Form.Item label="案例效果" valuePropName="fileList" getValueFromEvent={normFile} name="snapshot">
            <Upload action="/upload.do" listType="picture-card">
              <div>
                <PlusOutlined />
                <div style={{ marginTop: 8 }}>案例截图</div>
              </div>
            </Upload>
          </Form.Item>
        </Form>
      </Modal>
    </Layout>
  );
}
