<template>
  <div class="template-container">
    <site-header :user_avatar="user_avatar" />
    <site-sidebar
      type="basic"
      v-if="user_role === 'admin' || user_role === 'regional_admin'"
      :toggle="toggleEnable"
    />
    <div
      v-if="user_role === 'admin' || user_role === 'regional_admin'"
      class="side-bar-toggle d-none d-md-inline"
      :class="toggleEnable == true ? 'side-bar-toggle-enable' : ''"
    >
      <button @click="toggleSidebar">
        <i class="fa-solid fa-angles-left"></i>
      </button>
    </div>
    <transition name="fade" mode="out-in">
      <router-view
        :toggle="toggleEnable"
        @userAvatarChange="onUserAvatarChange"
      />
    </transition>
    <site-footer />
  </div>
</template>
<script type="text/babel">
import SiteHeader from "./partials/TheSiteHeader.vue";
import SiteFooter from "./partials/TheSiteFooter.vue";
import SiteSidebar from "./partials/TheSiteSidebar.vue";
import Ls from "./../../services/ls.js";
export default {
  data() {
    return {
      user_role: "",
      user_avatar: "",
      toggleEnable: false,
    };
  },
  components: {
    SiteHeader,
    SiteSidebar,
    SiteFooter,
  },
  mounted() {
    this.$utils.setLayout("default");
  },
  created() {
    this.user_role = Ls.get("Role");
    this.toggleEnable = false;
  },
  methods: {
    onUserAvatarChange(path) {
      this.user_avatar = path;
    },
    toggleSidebar() {
      this.toggleEnable = !this.toggleEnable;
    },
  },
};
</script>

<style>
.toast-success {
  /* background-color: #51a351; */
  background-color: #51a351 !important;
}
.toast-error {
  background-color: #bd362f !important;
}
.side-bar-toggle {
  position: absolute;
  left: 205px;
  top: 50%;
  z-index: 1000;
  transition: ease 0.3s all;
}
.side-bar-toggle-enable {
  left: 0px !important;
  -webkit-transform: rotate(180deg);
  -moz-transform: rotate(180deg);
  -ms-transform: rotate(180deg);
  -o-transform: rotate(180deg);
  transform: rotate(180deg);
}
.side-bar-toggle button {
  background: transparent;
  border: transparent;
  font-size: 25px;
  color: #ffde00;
}
.side-bar-toggle button:hover {
  color: #d5bf2d;
}
</style>

