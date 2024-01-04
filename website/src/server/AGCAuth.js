import "@hw-agconnect/auth";
import "@hw-agconnect/instance";
import { removeToken, removeUser } from "./auth";
import { AUTH_CODE } from "../config/constant";
import agconnect from "./AGCInstance";

export const createPhoneVerifyCode = (props, callback) => {
  const {
    countryCode = "86",
    phoneNumber = "",
    lang = "zh_CN",
    sendInterval = 60,
  } = props;

  // const data = [];
  // return new Promise((resolve) => {
  //   setTimeout(() => {
  //     for (let i = 0; i < 10; i++) {
  //       data.push({
  //         id: i.toString(),
  //       });
  //     }
  //     resolve(data);
  //   }, 1000);
  // })
  //   .then((ret) => {
  //     //验证码申请成功
  //     console.log("utils/AGCAuth.js => createPhoneVerifyCode() success:", ret);
  //     callback(AUTH_CODE.Successed, ret);
  //   })
  //   .catch((error) => {
  //     //验证码申请失败
  //     console.log("utils/AGCAuth.js => createPhoneVerifyCode() error:", error);
  //     callback(AUTH_CODE.Error, error);
  //   });

  agconnect
    .auth()
    .requestPhoneVerifyCode(
      countryCode,
      phoneNumber,
      agconnect.auth.Action.ACTION_REGISTER_LOGIN,
      lang, //发送验证码的语言
      sendInterval
    )
    .then((ret) => {
      //验证码申请成功
      console.log("utils/AGCAuth.js => createPhoneVerifyCode() success:", ret);
      callback(AUTH_CODE.Successed, ret);
    })
    .catch((error) => {
      //验证码申请失败
      console.log("utils/AGCAuth.js => createPhoneVerifyCode() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const createEmailVerifyCode = (props, callback) => {
  const { emailStr, lang = "zh_CN", sendInterval = 120 } = props;

  agconnect
    .auth()
    .requestEmailVerifyCode(
      emailStr,
      agconnect.auth.Action.ACTION_REGISTER_LOGIN,
      lang, //发送验证码的语言
      sendInterval
    ) //发送间隔时间
    .then((ret) => {
      //验证码申请成功
      console.log("utils/AGCAuth.js => createEmailVerifyCode() success:", ret);
      callback(AUTH_CODE.Successed, ret);
    })
    .catch((error) => {
      //验证码申请失败
      console.log("utils/AGCAuth.js => createEmailVerifyCode() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const createPhoneUser = (props, callback) => {
  const {
    countryCode = "86",
    phoneNumber = "",
    password = "123456",
    verifyCode = "",
  } = props;
  let phoneUser = new agconnect.auth.PhoneUser(
    countryCode,
    phoneNumber,
    password,
    verifyCode
  );
  console.log(
    "utils/AGCAuth.js => createPhoneUser() props:",
    countryCode,
    phoneNumber,
    password,
    verifyCode
  );
  agconnect
    .auth()
    .createPhoneUser(phoneUser)
    .then((user) => {
      //创建用户成功
      console.log("utils/AGCAuth.js => createPhoneUser() success:", user);
      callback(AUTH_CODE.Successed, user);
    })
    .catch((error) => {
      //创建用户失败
      // utils/AGCAuth.js => createPhoneUser() error: Error: Password strength is too low, please re-enter
      console.log("utils/AGCAuth.js => createPhoneUser() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const createEmailUser = (props, callback) => {
  const { emailStr, password = "123456", verifyCode = "" } = props;

  let emailUser = new agconnect.auth.EmailUser(emailStr, password, verifyCode);

  console.log(
    "utils/AGCAuth.js => createEmailUser() props:",
    emailStr,
    password,
    verifyCode
  );

  agconnect
    .auth()
    .createEmailUser(emailUser)
    .then((user) => {
      //创建帐号成功后，默认已登录
      console.log("utils/AGCAuth.js => createEmailUser() success:", user);
      callback(AUTH_CODE.Successed, user);
    })
    .catch((error) => {
      //创建用户失败
      console.log("utils/AGCAuth.js => createEmailUser() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const getCurrentUser = (callback) => {
  agconnect
    .auth()
    .getCurrentUser()
    .then((user) => {
      //获取用户成功
      console.log("utils/AGCAuth.js => getCurrentUser() success:", user);
      if (!!user) {
        callback(AUTH_CODE.Successed, user);
      } else {
        callback(AUTH_CODE.Unauthorized, user);
      }
    })
    .catch((error) => {
      //获取用户失败
      console.log("utils/AGCAuth.js => getCurrentUser() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const isLogin = async () => {
  try {
    const user = await agconnect.auth().getCurrentUser();
    //获取用户成功
    console.log("utils/AGCAuth.js => getCurrentUser() success:", user);
    if (!!user) {
      return { code: AUTH_CODE.Successed, user };
    } else {
      return { code: AUTH_CODE.Unauthorized, user };
    }
  } catch (error) {
    //获取用户失败
    console.log("utils/AGCAuth.js => getCurrentUser() error:", error);
    return { code: AUTH_CODE.Error, user };
  }
};

export const phoneNumberLogin = (props, callback) => {
  const { countryCode = "86", phoneNumber, password } = props;
  const credential = agconnect.auth.PhoneAuthProvider.credentialWithPassword(
    countryCode,
    phoneNumber,
    password
  );
  agconnect
    .auth()
    .signIn(credential)
    .then((user) => {
      //登录成功
      console.log("utils/AGCAuth.js => phoneNumberLogin() success:", user);
      callback(AUTH_CODE.Successed, user);
    })
    .catch((error) => {
      //登录失败
      console.log("utils/AGCAuth.js => phoneNumberLogin() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const emailLogin = (props, callback) => {
  const { emailStr, password } = props;
  const credential = agconnect.auth.EmailAuthProvider.credentialWithPassword(
    emailStr,
    password
  );
  agconnect
    .auth()
    .signIn(credential)
    .then((user) => {
      //登录成功
      console.log("utils/AGCAuth.js => emailLogin() success:", user);
      callback(AUTH_CODE.Successed, user);
    })
    .catch((error) => {
      //登录失败
      console.log("utils/AGCAuth.js => emailLogin() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export const phoneNumberWithVerifyCodeLogin = (props, callback) => {
  const { countryCode = "86", phoneNumber, password, verifyCode } = props;
  const credential = agconnect.auth.PhoneAuthProvider.credentialWithVerifyCode(
    countryCode,
    phoneNumber,
    password,
    verifyCode
  );
  agconnect
    .auth()
    .signIn(credential)
    .then((user) => {
      //登录成功
      console.log(
        "utils/AGCAuth.js => phoneNumberWithVerifyCodeLogin() success:",
        user
      );
      callback(AUTH_CODE.Successed, user);
    })
    .catch((error) => {
      //登录失败
      console.log(
        "utils/AGCAuth.js => phoneNumberWithVerifyCodeLogin() error:",
        error
      );
      callback(AUTH_CODE.Error, error);
    });
};

export const emailWithVerifyCodeLogin = (props, callback) => {
  const { emailStr, password, verifyCode } = props;
  const credential = agconnect.auth.EmailAuthProvider.credentialWithVerifyCode(
    emailStr,
    password,
    verifyCode
  );
  agconnect
    .auth()
    .signIn(credential)
    .then((user) => {
      //登录成功
      console.log(
        "utils/AGCAuth.js => emailWithVerifyCodeLogin() success:",
        user
      );
      callback(AUTH_CODE.Successed, user);
    })
    .catch((error) => {
      //登录失败
      console.log(
        "utils/AGCAuth.js => emailWithVerifyCodeLogin() error:",
        error
      );
      callback(AUTH_CODE.Error, error);
    });
};

export const logOut = () => {
  agconnect
    .auth()
    .signOut()
    .then(() => {
      //登出成功
      console.log("utils/AGCAuth.js => logOut() success:");
      removeToken();
      removeUser();
    })
    .catch((error) => {
      //登出失败
      console.log("utils/AGCAuth.js => logOut() error:", error);
    });
};

export default {
  createPhoneVerifyCode,
  createEmailVerifyCode,
  createPhoneUser,
  createEmailUser,
  getCurrentUser,
  phoneNumberLogin,
  emailLogin,
  phoneNumberWithVerifyCodeLogin,
  emailWithVerifyCodeLogin,
  logOut,
};
