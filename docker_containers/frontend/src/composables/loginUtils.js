import { useAuth0 } from "@auth0/auth0-vue";

function authUser() {
  if (process.env.VUE_APP_AUTH_EMAIL !== undefined) {
    return process.env.VUE_APP_AUTH_EMAIL;
  }
  if (useAuth0.isAuthenticated) {
    return useAuth0.user.email;
  }
  return "";
}

console.log(authUser);
export default authUser;
