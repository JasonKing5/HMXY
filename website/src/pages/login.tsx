import React, { useState } from 'react'
import { LockOutlined, UserOutlined } from '@ant-design/icons';
import { Button, Checkbox, Form, Input, Select, Row, Col, AutoComplete, Divider, notification, Space } from 'antd';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import useBaseUrl, {useBaseUrlUtils} from '@docusaurus/useBaseUrl';
import type { NotificationPlacement } from 'antd/es/notification/interface';
import { setUser, setToken, hasToken, hasUser} from '../server/auth'
import AGCServer from '../server'
import { AUTH_CODE } from "../config/constant";

const { Option } = Select;

import styles from './login.module.css';

const countryCode = "86"
// TODO: need remove hard code and changed to input value
const phoneNumber = "17621610355"

const AUTH_MODEL = {
  phoneNumber: 'phoneNumber',
  emailStr: 'emailStr',
}

export default function Login(): JSX.Element {
  // const [authModel, setAuthModel] = React.useState(AUTH_MODEL.phoneNumber)
  // const [isLogin, setIsLogin] = React.useState(true)
  // const [isPassword, setIsPassword] = React.useState(true)
  // const [allValues, setAllValues] = React.useState<any>({})
  // const [verifyCodeCountDown, setVerifyCodeCountDown] = React.useState(0)
  // const [verifyCoding, setVerifyCoding] = React.useState(false)
  // const [isSubmiting, setIsSubmiting] = React.useState(false)

  // const [api, contextHolder] = notification.useNotification();

  // const onLoginFinish = (values: any) => {
  //   console.log('Received values of form: ', values);
  //   AGCServer.Auth.phoneNumberLogin({...allValues}, (code, res) => {
  //     console.log("pages/login.tsx => phoneNumberLogin() code:", code, 'res:', res);
  //     setIsSubmiting(false)
  //     if (code === AUTH_CODE.Successed) {
  //       setUser(res.user.user)
  //       setToken(res.user.user.tokenService.accessToken)
  //       const openNotification = (placement: NotificationPlacement) => {
  //         api.success({
  //           message: `登录成功`,
  //           description:
  //             '恭喜您，登录成功',
  //           placement,
  //         });
  //       };
  //       openNotification('top');
  //       setTimeout(() => {
  //         window.location.href = '/'
  //       }, 500);
  //     } else {
  //       const openNotification = (placement: NotificationPlacement) => {
  //         api.error({
  //           message: `登录失败`,
  //           description:
  //             `很抱歉，登录失败，${res}！`,
  //           placement,
  //         });
  //       };
  //       openNotification('top')
  //     }
  //   })
  // };

  // const onRegisterFinish = (values: any) => {
  //   setIsSubmiting(true)
  //   // AGCServer.Auth.getCurrentUser()
  //   console.log('Received values of form: ', values);
  //   AGCServer.Auth.createPhoneUser({...allValues }, (code, res) => {
  //     console.log("pages/login.tsx => createPhoneUser() code:", code, 'res:', res);
  //     setIsSubmiting(false)
  //     if (code === AUTH_CODE.Successed) {
  //       setUser(res.user.user)
  //       setToken(res.user.user.tokenService.accessToken)
  //       const openNotification = (placement: NotificationPlacement) => {
  //         api.success({
  //           message: `注册成功`,
  //           description:
  //             '恭喜您，账号注册成功，即将自动登陆系统',
  //           placement,
  //         });
  //       };
  //       openNotification('top');
  //       setTimeout(() => {
  //         window.location.href = '/'
  //       }, 500);
  //     } else {
  //       const openNotification = (placement: NotificationPlacement) => {
  //         api.error({
  //           message: `注册失败`,
  //           description:
  //             `很抱歉，账号注册失败，${res}！`,
  //           placement,
  //         });
  //       };
  //       openNotification('top')
  //     }
  //   })

  // };
  
  // const {siteConfig} = useDocusaurusContext();

  // if (hasToken()) {
  //   window.location.href = '/'
  // }

  // React.useEffect(() => {
  //   const timer =
  //     verifyCodeCountDown > 0 && setInterval(() => setVerifyCodeCountDown(verifyCodeCountDown - 1), 1000);
    
  //   return () => {
  //     setVerifyCoding(false)
  //     clearInterval(timer);
  //   }
  // }, [verifyCodeCountDown]);

  // const prefixSelector = (
  //   <Form.Item name="countryCode" noStyle>
  //     <Select style={{ width: 70 }} defaultValue={"86"}>
  //       <Option value="86">+86</Option>
  //     </Select>
  //   </Form.Item>
  // );

  // const login = () => {
  //   return (
  //   <Form
  //     name="normal_login"
  //     className="login-form"
  //     initialValues={{ remember: true }}
  //     onFinish={onLoginFinish}
  //     style={{width: '100%', padding: '0 3rem', maxWidth: '500px'}}
  //     onValuesChange={(changedValues, allValues) => {
  //       console.log("allValues:", allValues)
  //       setAllValues(allValues)
  //     }}
  //   >
  //     <Form.Item
  //       name="phoneNumber"
  //       rules={authModel === AUTH_MODEL.phoneNumber ? [
  //         { required: true, message: '请填写手机号！' },
  //         {
  //           // type: /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/,
  //           // message: '手机号格式不正确！',
  //           type: 'string',
  //           message: '手机号格式不正确！'
  //         },
  //         {
  //           min: 11, 
  //           message: '手机号不能少于11个字符！'
  //         }]
  //       : [
  //         { required: true, message: `请填写邮件地址！` },
  //         {
  //           type: 'email',
  //           message: '邮箱格式不正确！',
  //         }]}
  //     >
       
  //       <Input 
  //         prefix={<UserOutlined className="site-form-item-icon" />} 
  //         placeholder={authModel === AUTH_MODEL.phoneNumber ? "手机号" : "邮件地址" }
  //         addonBefore={authModel === AUTH_MODEL.phoneNumber && !isPassword ? prefixSelector : null }
  //         style={{ width: '100%' }} 
  //         size='large' 
  //       />
  //     </Form.Item>
  //     {isPassword &&
  //       <Form.Item
  //         name="password"
  //         rules={[{ required: true, message: '请填写密码！' },{ type: 'string', min: 6, message: '密码不能少于6个字符！' }]}
  //       >
  //         <Input
  //           prefix={<LockOutlined className="site-form-item-icon" />}
  //           type="password"
  //           placeholder="密码"
  //           size='large'
  //         />
  //       </Form.Item>}

        
  //       {!isPassword &&
  //       <Form.Item>
  //       <Row gutter={8}>
  //         <Col span={17}>
  //           <Form.Item
  //             name="verifyCode"
  //             noStyle
  //             rules={[{ required: true, message: '请填写手机验证码！' },{ type: 'string', min: 6, message: '密码不能少于6个字符！' }]}
  //           >
  //             <Input
  //               prefix={<LockOutlined className="site-form-item-icon" />}
  //               type="verifyCode"
  //               placeholder="手机验证码"
  //               size='large'
  //             />
  //           </Form.Item>
  //         </Col>
  //         <Col span={4}>
  //           <Button 
  //             size='large'
  //             style={
  //               (verifyCodeCountDown > 0 || verifyCoding) ? {
  //                 color: 'rgb(169 169 169)',
  //                 pointerEvents: 'none'
                
  //             } : {}}
  //             onClick={() => {
  //               setVerifyCoding(true)
  //               AGCServer.Auth.createPhoneVerifyCode({...allValues}, (code, res) => {
  //                 if (code === AUTH_CODE.Successed) {
  //                   setVerifyCodeCountDown(60)
  //                 } else {
  //                   const openNotification = (placement: NotificationPlacement) => {
  //                     api.error({
  //                       message: `获取失败`,
  //                       description:
  //                         `获取验证码失败，${res}`,
  //                       placement,
  //                     });
  //                   };
  //                   openNotification('top')
  //                 }
  //               })
  //             }}
  //           >
  //             {`${verifyCodeCountDown || verifyCodeCountDown > 0 ? '重新获取（' + verifyCodeCountDown + '）' : '获取验证码'}`}
  //           </Button>
  //         </Col>
  //       </Row>
  //       </Form.Item>

  //       }

      
  //     {isPassword && authModel === AUTH_MODEL.phoneNumber && 
  //       <><p className={styles.aText} onClick={() => {setIsPassword(!isPassword)}}>
  //       手机验证码登录
  //     </p>
  //     |
  //     <p className={styles.aText} onClick={() => {setAuthModel(AUTH_MODEL.emailStr);}}>
  //     邮箱密码登录
  //     </p></>
  //       }
  //     {isPassword && authModel === AUTH_MODEL.emailStr && 
  //       <><p className={styles.aText} onClick={() => {setIsPassword(!isPassword); setAuthModel(AUTH_MODEL.phoneNumber)}}>
  //       手机验证码登录
  //     </p>
  //     |
  //     <p className={styles.aText} onClick={() => {setAuthModel(AUTH_MODEL.phoneNumber)}}>
  //     手机密码登录
  //     </p></>
  //       }
  //     {!isPassword && 
  //     <>
  //     <p className={styles.aText} onClick={() => {setIsPassword(!isPassword); setAuthModel(AUTH_MODEL.phoneNumber)}}>
  //     手机密码登录
  //   </p>
  //     |
  //     <p className={styles.aText} onClick={() => {setIsPassword(!isPassword); setAuthModel(AUTH_MODEL.emailStr)}}>
  //     邮箱密码登录
  //   </p>
  //   </>}
  //     <Form.Item>
  //       <Button type="primary" htmlType="submit" className="login-form-button" style={{width: '100%', margin: '1rem 0 0.5rem 0'}} 
  //               size='large'>
  //         登录
  //       </Button>
  //       <div className={styles.aTexts} >
  //         <p className={styles.aText} onClick={() => {
  //           setIsLogin(false)
  //         }} >注册</p> 
  //         <p className={styles.aText}>
  //           忘记密码
  //         </p>
  //       </div>
  //     </Form.Item>
  //   </Form>)
  // }

  // const register = () => {
  //   return (
  //   <Form
  //     name="normal_register"
  //     className="register-form"
  //     initialValues={{ remember: true }}
  //     onFinish={onRegisterFinish}
  //     style={{width: '100%', padding: '0 3rem', maxWidth: '500px'}}
  //     onValuesChange={(changedValues, allValues) => {
  //       console.log("allValues:", allValues)
  //       setAllValues(allValues)
  //     }}
  //     onFinishFailed={({ values, errorFields, outOfDate }) => {
  //       console.log('onFinishFailed():', values, errorFields, outOfDate )
  //     }}
  //   >
  //     <Form.Item
  //       name={authModel === AUTH_MODEL.phoneNumber ? "phoneNumber" : 'emailStr'}
  //       rules={[{ required: true, message: `请填写${authModel === AUTH_MODEL.phoneNumber ? "手机号" : "邮件地址"}！` }]}
  //     >
       
  //       <Input 
  //         prefix={<UserOutlined className="site-form-item-icon" />} 
  //         placeholder={authModel === AUTH_MODEL.phoneNumber ? "手机号" : "邮件地址" }
  //         addonBefore={authModel === AUTH_MODEL.phoneNumber ? prefixSelector : null}
  //         style={{ width: '100%' }} 
  //         size='large' 
  //       />
  //     </Form.Item>

  //       <Form.Item>
  //       <Row gutter={8}>
  //         <Col span={17}>
  //           <Form.Item
  //             name="verifyCode"
  //             noStyle
  //             rules={[{ required: true, message: '请填写验证码！' }]}
  //           >
  //             <Input
  //               prefix={<LockOutlined className="site-form-item-icon" />}
  //               type="verifyCode"
  //               placeholder="验证码"
  //               size='large'
  //             />
  //           </Form.Item>
  //         </Col>
  //         <Col span={4}>
  //           <Button 
  //             size='large'
  //             style={
  //               (verifyCodeCountDown > 0 || verifyCoding) ? {
  //                 color: 'rgb(169 169 169)',
  //                 pointerEvents: 'none'
                
  //             } : {}}
  //             onClick={() => {
  //               setVerifyCoding(true)
  //               AGCServer.Auth.createPhoneVerifyCode({...allValues}, (code, res) => {
  //                 if (code === AUTH_CODE.Successed) {
  //                   setVerifyCodeCountDown(60)
  //                 } else {

  //                 }
  //               })
  //             }}
  //           >
  //             {`${verifyCodeCountDown || verifyCodeCountDown > 0 ? '重新获取（' + verifyCodeCountDown + '）' : '获取验证码'}`}
  //           </Button>
  //         </Col>
  //       </Row>
  //       </Form.Item>

  //       <Form.Item
  //         name="password"
  //         rules={[
  //           {
  //             required: true,
  //             message: '请填写密码！',
  //           },
  //         ]}
  //         hasFeedback
  //       >
  //         <Input.Password  size='large' placeholder='密码'  />
  //       </Form.Item>

  //       <Form.Item
  //         name="confirm"
  //         dependencies={['password']}
  //         hasFeedback
  //         rules={[
  //           {
  //             required: true,
  //             message: '请填写确认密码！',
  //           },
  //           ({ getFieldValue }) => ({
  //             validator(_, value) {
  //               if (!value || getFieldValue('password') === value) {
  //                 return Promise.resolve();
  //               }
  //               return Promise.reject(new Error('密码不一致，请重新输入！'));
  //             },
  //           }),
  //         ]}
  //       >
  //         <Input.Password size='large' placeholder='确认密码' />
  //       </Form.Item>


  //       <p className={styles.aText} onClick={() => {setAuthModel(authModel === AUTH_MODEL.phoneNumber ? AUTH_MODEL.emailStr : AUTH_MODEL.phoneNumber)}}>
  //         {`${isPassword ? "手机号注册" : "邮箱地址注册"}`}
  //       </p>
  //     <Form.Item>
  //       <Button type="primary" htmlType="submit" className="login-form-button" style={{width: '100%', margin: '1rem 0 0.5rem 0'}} size='large' disabled={isSubmiting}>
  //         注册
  //       </Button>
  //       <div className={styles.aTexts} >
  //         <p>已有账号？
  //         <p className={styles.aText} onClick={() => {
  //           setIsLogin(true)
  //         }}>去登录</p> 
  //         </p>
  //       </div>
  //     </Form.Item>
  //   </Form>)
  // }

  return (
    <div>login</div>
    
    // <Layout
    //   title={`登录注册`}
    //   description="鸿蒙学苑"
    //   >
    //   <main className={styles.main}>
    //     {contextHolder}
    //     <div className={styles.left}>
    //       <img
    //         alt={'Docusaurus with Keytar'}
    //         className={styles.heroLogo}
    //         src={useBaseUrl('/img/login-bg-light.png')}
    //         width="700px"
    //       />
    //     </div>
    //     <div className={styles.right}>   
    //       <div className={styles.title}>鸿蒙学苑</div>
    //       <div className={styles.description}>欢迎来到鸿蒙学苑</div>
    //       {isLogin ? login() : register()}
    //     </div>
     
    //   </main>
    // </Layout>
    
  );
}