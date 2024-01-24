// 封装本地存储的操作
const TOKEN_KEY = "hmosxy_token";
const USER_KEY = "hmosxy_user";

// 获取 token
export function getToken() {
  return localStorage.getItem(TOKEN_KEY);
}

// 本地存储 token
export function setToken(token) {
  localStorage.setItem(TOKEN_KEY, token);
}

// 删除 token
export function removeToken() {
  localStorage.removeItem(TOKEN_KEY);
}

// 判断有无 token
export function hasToken() {
  return !!getToken();
}

// 获取 user
export function getUser() {
  const user = localStorage.getItem(USER_KEY);
  return !!user ? JSON.parse(localStorage.getItem(USER_KEY)) : "";
}

// 本地存储 user
export function setUser(user) {
  localStorage.setItem(USER_KEY, JSON.stringify(user));
}

// 删除 user
export function removeUser() {
  localStorage.removeItem(USER_KEY);
}

// 判断有无 user
export function hasUser() {
  return !!getUser();
}
