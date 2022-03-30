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
        <a href="#" class="btn btn-primary">
          <i class="icon-fa icon-fa-plus" /> New User
        </a>
        <button class="btn btn-danger">
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
              sort-by="row.name"
              sort-order="desc"
              table-class="table"
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
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script type="text/babel">
import { TableComponent, TableColumn } from "vue-table-component";
import Ls from "./../../../services/ls.js";
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
    };
  },
  async created() {
    this.user_id = Ls.get("user_id");
    this.user_role = Ls.get("Role");
  },
  methods: {
    async getUsers({ page, filter, sort }) {
      try {
        const response = await axios.get(`/api/admin/users/get?page=${page}`);
        const avatarResponse = await axios.get("/api/admin/user/avatar/getAll");
        var pagination_data = [];
        response.data.data.forEach((user_item, i) => {
          if (
            user_item.id != this.user_id &&
            user_item.role != this.user_role
          ) {
            avatarResponse.data.forEach((avatar_item, j) => {
              if (user_item.id == avatar_item.user_id) {
                let data = user_item;
                data["user_avatar"] = avatar_item.path;
                pagination_data.unshift(data);
              }
            });
          }
        });
        console.log("Response => ", pagination_data);
        return {
          data: pagination_data,
          pagination: {
            totalPages: response.data.last_page,
            currentPage: page,
            count: response.data.count,
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
        text: "Are you sure?",
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
  max-width: 100%;
  border-radius: 10px;
}
</style>
