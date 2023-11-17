/* This page works for local development because the .env file is in gitignore. The EC2 is updated form github so the the first value will be undefined so Auth0 will run.  */
import { useAuth0 } from "@auth0/auth0-vue";

function authUser() {
  // console.log("authUser: VUE_APP_AUTH_EMAIL", process.env.VUE_APP_AUTH_EMAIL);
  console.log("useAuth0", useAuth0);
  // if (process.env.VUE_APP_AUTH_EMAIL !== undefined) {
  //   return process.env.VUE_APP_AUTH_EMAIL;
  // }
  if (useAuth0.isAuthenticated) {
    return useAuth0.user.email;
  }
  console.log("authUser returning empty string");
  return "";
}

export default authUser;
