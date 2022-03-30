<template>
  <div
    id="all-users"
    :class="
      user_role == 'practitioner' || toggle == true
        ? 'role_practitioner'
        : 'main-content'
    "
  >
    <div class="page-header">
      <h3 class="page-title">Users</h3>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Users</a></li>
        <li class="breadcrumb-item active">Users</li>
      </ol>
      <div class="page-actions">
        <b-button @click="show = true" variant="primary"
          ><i class="icon-fa icon-fa-plus" />New User</b-button
        >
        <b-modal
          v-model="show"
          no-close-on-backdrop
          centered
          size="lg"
          title="Add New Member"
        >
          <b-container fluid>
            <form class="member-form" @submit.prevent="addNewMember">
              <b-row class="mb-1">
                <div class="member-add-first-last-name">
                  <div
                    :class="[
                      'form-group name-form',
                      { 'is-invalid': $v.addMemberData.first_name.$error },
                    ]"
                  >
                    <label for="member-fist-name">First Name</label>
                    <input
                      :class="{
                        'is-invalid': $v.addMemberData.first_name.$error,
                        'form-group--loading':
                          $v.addMemberData.first_name.$pending,
                      }"
                      v-model.lazy="addMemberData.first_name"
                      class="form-control"
                      placeholder="Enter First Name"
                      type="text"
                      id="member-fist-name"
                      @change="$v.addMemberData.first_name.$touch()"
                    />
                    <span
                      v-if="!$v.addMemberData.first_name.required"
                      class="invalid-feedback"
                    >
                      First Name is required.
                    </span>
                    <span
                      v-if="!$v.addMemberData.first_name.minLength"
                      class="invalid-feedback"
                    >
                      First Name must have at least
                      {{ $v.addMemberData.first_name.$params.minLength.min }}
                      letters.
                    </span>
                  </div>
                  <div
                    :class="[
                      'form-group name-form',
                      { 'is-invalid': $v.addMemberData.last_name.$error },
                    ]"
                  >
                    <label for="member-last-name">Last Name</label>
                    <input
                      :class="{
                        'is-invalid': $v.addMemberData.last_name.$error,
                        'form-group--loading':
                          $v.addMemberData.last_name.$pending,
                      }"
                      v-model.lazy="addMemberData.last_name"
                      class="form-control"
                      placeholder="Enter Last Name"
                      type="text"
                      id="member-last-name"
                      @change="$v.addMemberData.last_name.$touch()"
                    />
                    <span
                      v-if="!$v.addMemberData.last_name.required"
                      class="invalid-feedback"
                    >
                      Last Name is required.
                    </span>
                    <span
                      v-if="!$v.addMemberData.last_name.minLength"
                      class="invalid-feedback"
                    >
                      Last Name must have at least
                      {{ $v.addMemberData.last_name.$params.minLength.min }}
                      letters.
                    </span>
                  </div>
                </div>
              </b-row>
              <b-row class="mb-1">
                <div
                  :class="[
                    'form-group',
                    { 'is-invalid': $v.addMemberData.email.$error },
                  ]"
                >
                  <label for="memeber-email">Email</label>
                  <input
                    :class="{
                      'is-invalid': $v.addMemberData.email.$error,
                      'form-group--loading': $v.addMemberData.email.$pending,
                    }"
                    v-model.trim.lazy="addMemberData.email"
                    class="form-control"
                    placeholder="Enter Email"
                    type="email"
                    id="memeber-email"
                    @change="$v.addMemberData.email.$touch()"
                  />
                  <span
                    v-if="!$v.addMemberData.email.required"
                    class="invalid-feedback"
                  >
                    Email is required.
                  </span>
                  <span
                    v-if="!$v.addMemberData.email.email"
                    class="invalid-feedback"
                  >
                    Please verify your email.
                  </span>
                  <span
                    v-if="!$v.addMemberData.email.isUnique"
                    class="invalid-feedback"
                  >
                    This email is already registered.
                  </span>
                </div>
              </b-row>
              <b-row class="mb-1">
                <div
                  :class="[
                    'form-group',
                    { 'is-invalid': $v.addMemberData.password.$error },
                  ]"
                >
                  <label for="member-password">Password</label>
                  <input
                    :class="{ 'is-invalid': $v.addMemberData.password.$error }"
                    v-model.trim="addMemberData.password"
                    class="form-control"
                    placeholder="Enter Password"
                    type="password"
                    id="member-password"
                    @change="$v.addMemberData.password.$touch()"
                  />
                  <span
                    v-if="!$v.addMemberData.password.required"
                    class="invalid-feedback"
                  >
                    Password is required.
                  </span>
                  <span
                    v-if="!$v.addMemberData.password.minLength"
                    class="invalid-feedback"
                  >
                    Password must have at least
                    {{ $v.addMemberData.password.$params.minLength.min }}
                    letters.
                  </span>
                </div>
              </b-row>
              <b-row class="mb-1">
                <div
                  :class="[
                    'form-group',
                    {
                      'is-invalid':
                        $v.addMemberData.password_confirmation.$error,
                    },
                  ]"
                >
                  <label for="member-confirm-password">Confirm Password</label>
                  <input
                    :class="{
                      'is-invalid':
                        $v.addMemberData.password_confirmation.$error,
                    }"
                    v-model.trim="addMemberData.password_confirmation"
                    class="form-control"
                    placeholder="Retype Password"
                    id="member-confirm-password"
                    type="password"
                    @change="$v.addMemberData.password_confirmation.$touch()"
                  />
                  <span
                    v-if="
                      !$v.addMemberData.password_confirmation.sameAsPassword
                    "
                    class="invalid-feedback"
                  >
                    Passwords must be identical.
                  </span>
                </div>
              </b-row>
              <b-row class="mb-1">
                <div class="form-group">
                  <label for="member-gender">Gender</label>
                  <div
                    class="form-group margin-top-0"
                    :class="{ 'is-invalid': $v.addMemberData.gender.$error }"
                  >
                    <div
                      class="form-check form-check-inline"
                      :class="{
                        'is-invalid': $v.addMemberData.gender.$error,
                      }"
                    >
                      <input
                        class="form-check-input"
                        type="radio"
                        name="gender"
                        v-model="addMemberData.gender"
                        id="member-gender1"
                        value="male"
                      />
                      <label class="form-check-label" for="member-gender1"
                        >Male</label
                      >
                    </div>
                    <div
                      class="form-check form-check-inline"
                      :class="{
                        'is-invalid': $v.addMemberData.gender.$error,
                      }"
                    >
                      <input
                        class="form-check-input"
                        type="radio"
                        name="gender"
                        v-model="addMemberData.gender"
                        id="member-gender2"
                        value="female"
                      />
                      <label class="form-check-label" for="member-gender2"
                        >Female</label
                      >
                    </div>
                    <div
                      v-if="$v.addMemberData.gender.$error"
                      class="invalid-feedback"
                    >
                      <span v-if="!$v.addMemberData.gender.required"
                        >User Gender is required</span
                      >
                    </div>
                  </div>
                </div>
              </b-row>
              <b-row class="mb-1">
                <div
                  :class="[
                    'form-group role-form',
                    { 'is-invalid': $v.addMemberData.role.$error },
                  ]"
                >
                  <label for="member-role">Member Role</label>
                  <select
                    :class="{
                      'is-invalid': $v.addMemberData.role.$error,
                      'form-group--loading': $v.addMemberData.role.$pending,
                    }"
                    v-model.lazy="addMemberData.role"
                    class="form-control"
                    type="select"
                    id="member-role"
                    @change="$v.addMemberData.role.$touch()"
                  >
                    <option selected value="practitioner">Practitioner</option>
                    <option value="regional_admin">Regional Admin</option>
                    <option value="admin">System Admin</option>
                  </select>
                  <span
                    v-if="!$v.addMemberData.role.required"
                    class="invalid-feedback"
                  >
                    User Role is required.
                  </span>
                </div>
              </b-row>
              <b-row class="mb-1">
                <div class="new-member-btns">
                  <button
                    type="submit"
                    class="member-submit-margin btn btn-theme btn-full"
                  >
                    Register
                  </button>
                </div>
              </b-row>
            </form>
          </b-container>
        </b-modal>
        <button class="btn btn-danger" @click="deleteAllUser">
          <i class="icon-fa icon-fa-trash" /> Delete
        </button>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-header">
            <h6>All Users</h6>
            <div class="card-actions" />
          </div>
          <div class="card-body">
            <table-component
              :data="getUsers"
              sort-by="row.id"
              sort-order="desc"
              table-class="table"
              ref="table"
            >
              <table-column label="Full Name">
                <template slot-scope="row">
                  <div class="user-profile-name">
                    <span>{{ row.first_name }}</span>
                    <span>{{ row.last_name }}</span>
                  </div>
                </template>
              </table-column>
              <table-column label="User Avatar">
                <template slot-scope="row">
                  <div class="user-profile-avatar">
                    <img :src="row.user_avatar" />
                  </div>
                </template>
              </table-column>
              <table-column show="gender" label="Gender" />
              <table-column show="email" label="Email" />
              <table-column show="role" label="Role" />
              <table-column show="id_number" label="ID Number" />
              <table-column show="serial_number" label="Serial Number" />
              <table-column show="validity_period" label="Validity Period" />
              <table-column show="company" label="Company" />
              <table-column show="region" label="Region" />
              <table-column
                show="verification_result"
                label="Verification Result"
              />
              <table-column show="health_status" label="Health Status" />
              <table-column :sortable="false" :filterable="false" label="">
                <template slot-scope="row">
                  <div class="table__actions">
                    <router-link :to="'/admin/users/profile/' + row.id">
                      <a class="btn btn-default btn-sm">
                        <i class="icon-fa icon-fa-edit" /> Edit
                      </a>
                    </router-link>
                    <a
                      class="btn btn-default btn-sm"
                      data-delete
                      data-confirmation="notie"
                      @click="deleteUser(row.id)"
                    >
                      <i class="icon-fa icon-fa-trash" /> Delete
                    </a>
                  </div>
                </template>
              </table-column>
            </table-component>
            <!-- <table-component
              :data="[
                { firstName: 'John', birthday: '04/10/1940', songs: 72 },
                { firstName: 'Paul', birthday: '18/06/1942', songs: 70 },
                { firstName: 'George', birthday: '25/02/1943', songs: 22 },
                { firstName: 'Ringo', birthday: '07/07/1940', songs: 2 },
              ]"
              sort-by="songs"
              sort-order="asc"
            >
              <table-column show="firstName" label="First name"></table-column>
              <table-column
                show="songs"
                label="Songs"
                data-type="numeric"
              ></table-column>
              <table-column
                show="birthday"
                label="Birthday"
                :filterable="false"
                data-type="date:DD/MM/YYYY"
              ></table-column>
            </table-component> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { TableComponent, TableColumn } from "vue-table-component";
import { required, minLength, email, sameAs } from "vuelidate/lib/validators";
import Ls from "./../../../services/ls.js";
import Auth from "./../../../services/auth.js";
export default {
  props: ["toggle"],
  components: {
    TableComponent,
    TableColumn,
  },
  data() {
    return {
      users: [],
      user_role: "",
      user_id: "",
      show: false,
      addMemberData: {
        first_name: "",
        last_name: "",
        password: "",
        password_confirmation: "",
        email: "",
        gender: "male",
        role: "practitioner",
      },
      roles: [
        { value: "practitioner", text: "Practitioner" },
        { value: "regional_admin", text: "Regional Admin" },
        { value: "admin", text: "System Admin" },
      ],
      save: false,
      keys: [
        "first_name",
        "last_name",
        "email",
        "role",
        "gender",
        "id_number",
        "serial_number",
        "company",
        "region",
        "health_status",
      ],
    };
  },
  async created() {
    this.user_id = Ls.get("user_id");
    this.user_role = Ls.get("Role");
  },
  validations: {
    addMemberData: {
      first_name: {
        required,
        minLength: minLength(3),
      },
      last_name: {
        required,
        minLength: minLength(3),
      },
      password: {
        required,
        minLength: minLength(6),
      },
      password_confirmation: {
        sameAsPassword: sameAs("password"),
      },
      email: {
        required,
        email,
        async isUnique(value) {
          // standalone validator ideally should not assume a field is required
          if (value === "") return true;

          // simulate async call, fail for all logins with even length
          let response = await window.axios.post("/api/email-exist", {
            email: value,
          });
          return response.data;
        },
      },
      gender: {
        required,
      },
      role: {
        required,
      },
    },
  },
  methods: {
    async getUsers({ page, filter, sort }) {
      try {
        const response = await axios.get(`/api/admin/users/get?page=${page}`);
        const avatarResponse = await axios.get("/api/admin/user/avatar/getAll");
        var pagination_data = [];
        let exist = this;
        response.data.data.forEach((user_item, i) => {
          if (
            user_item.id != this.user_id &&
            user_item.role != this.user_role
          ) {
            exist.save = false;
            avatarResponse.data.forEach((avatar_item, j) => {
              let data = user_item;
              if (user_item.id == avatar_item.user_id) {
                exist.save = true;
                data["user_avatar"] = avatar_item.path;
                pagination_data.unshift(data);
              }
            });
            if (exist.save == false) {
              let data = user_item;
              data["user_avatar"] = "/assets/img/default-user-avatar.jpg";
              pagination_data.unshift(data);
            }
          }
        });
        var return_data = [];
        if (filter) {
          pagination_data.forEach((item, index) => {
            exist.keys.forEach((key) => {
              if (item[key].includes(filter)) {
                return_data.push(item);
              }
            });
          });
          return_data = exist.removeDuplicates(return_data);
        } else {
          return_data = pagination_data;
        }
        return {
          data: return_data,
          pagination: {
            totalPages: response.data.last_page,
            currentPage: page,
            count: response.data.to,
          },
        };
      } catch (error) {
        if (error) {
          window.toastr["error"]("There was an error", "Error");
        }
      }
    },
    deleteUser(id) {
      let self = this;
      window.notie.confirm({
        text: "Are you sure to delete this user?",
        cancelCallback: function () {
          window.toastr["info"]("Cancel");
        },
        submitCallback: function () {
          self.deleteUserData(id);
        },
      });
    },
    async deleteUserData(id) {
      try {
        let response = await window.axios.delete("/api/admin/users/" + id);
        this.users = response.data;
        window.toastr["success"]("User Deleted", "Success");
      } catch (error) {
        if (error) {
          window.toastr["error"]("There was an error", "Error");
        }
      }
    },
    deleteAllUser() {
      let self = this;
      window.notie.confirm({
        text: "Are you sure to delete all members ?",
        cancelCallback: function () {
          window.toastr["info"]("Cancel");
        },
        submitCallback: function () {
          self.deleteAllUserData();
        },
      });
    },
    async deleteAllUserData() {
      try {
        let response = await window.axios.delete("api/admin/users/all");
        window.toastr["success"]("All Users Deleted", "Success");
      } catch (error) {
        if (error) {
          window.toastr["error"]("There was an error", "Error");
        }
      }
    },
    addNewMember() {
      this.$v.$touch();
      if (!this.$v.$error) {
        this.$forceUpdate();
        Auth.addNewMemberregister(this.addMemberData).then((res) => {
          if (res) {
            this.show = false;
            this.$refs.table.refresh();
          }
        });
      }
    },
    removeDuplicates(arr) {
      return arr.filter((item, index) => arr.indexOf(item) === index);
    },
  },
};
</script>
<style scoped>
#all-users {
  transition: ease 0.3s all;
}
.role_practitioner {
  padding: 90px 30px 10px 30px;
  min-height: calc(100% - 39px);
}
.user-profile-avatar {
  width: 40px;
  height: 40px;
  margin: 0px auto;
}
.user-profile-avatar img {
  width: 100%;
  border-radius: 10px;
  height: 100%;
}
.member-add-first-last-name {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
}
.member-add-first-last-name .form-group {
  width: 48%;
  margin-top: 20px;
}
.form-group {
  width: 100%;
  margin-top: 20px;
}
.name-form {
  margin: 0px;
}
.margin-top-0 {
  margin-top: 0px !important;
}
.role-form {
  margin-top: 20px;
}
.new-member-btns {
  display: flex;
  align-items: center;
  justify-content: space-around;
  width: 100%;
}
</style>

<style>
.modal-title {
  color: #5c5959;
}
.modal-header,
.modal-footer {
  background-color: #ffde00 !important;
}
.modal-footer {
  display: none !important;
}
.close {
  color: #5c5959 !important;
}
.member-form .row {
  width: 100%;
  margin: 0px !important;
}
.member-form .form-group {
  margin-bottom: 0px !important;
}
.btn-theme {
  color: #212529;
  background-color: #ffde00;
  border-color: #ffde00;
  -o-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15),
    0 1px 1px rgba(0, 0, 0, 0.075);
  -ms-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15),
    0 1px 1px rgba(0, 0, 0, 0.075);
  -webkit-box-shadow: inset 0 1px 0 rgb(255 255 255 / 15%),
    0 1px 1px rgb(0 0 0 / 8%);
  box-shadow: inset 0 1px 0 rgb(255 255 255 / 15%), 0 1px 1px rgb(0 0 0 / 8%);
}
.member-submit-margin {
  margin-top: 20px;
}
</style>