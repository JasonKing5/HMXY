import "@hw-agconnect/auth";
import "@hw-agconnect/instance";
import agconnect from "./AGCInstance";

export const createShowCase = (callback) => {
  agconnect
    .auth()
    .getCurrentUser()
    .then((user) => {
      //获取用户成功
      console.log("utils/AGCAuth.js => getCurrentUser() success:", user);
      callback(0, user);
    })
    .catch((error) => {
      //获取用户失败
      console.log("utils/AGCAuth.js => getCurrentUser() error:", error);
      callback(AUTH_CODE.Error, error);
    });
};

export default {
  createShowCase,
};
