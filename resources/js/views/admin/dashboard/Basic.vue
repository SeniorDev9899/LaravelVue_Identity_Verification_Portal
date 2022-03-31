<template>
  <div
    id="dashboardPage"
    :class="
      user_role == 'practitioner' || toggle == true
        ? 'role_practitioner'
        : 'main-content'
    "
  >
    <div class="row">
      <div class="col-md-12 col-lg-6 col-xl-3">
        <a class="dashbox" href="#">
          <!-- <i class="icon-fa icon-fa-envelope text-primary" /> -->
          <i class="fa fa-users text-primary" aria-hidden="true"></i>
          <span class="title"> {{ allUsers }} </span>
          <span class="desc"> All Users </span>
        </a>
      </div>
      <div class="col-md-12 col-lg-6 col-xl-3">
        <a class="dashbox" href="#">
          <div class="system_admin">
            <div>
              <img src="/assets/img/admin.png" alt="System Admin" />
            </div>
            <span class="title"> {{ system_admin }} </span>
          </div>
          <span class="desc"> System Admins </span>
        </a>
      </div>
      <div class="col-md-12 col-lg-6 col-xl-3">
        <a class="dashbox" href="#">
          <!-- <i class="icon-fa icon-fa-shopping-cart text-danger" /> -->
          <div class="system_admin">
            <div>
              <img src="/assets/img/sub_admin.png" alt="System Admin" />
            </div>
            <span class="title"> {{ regional_admin }} </span>
          </div>
          <span class="desc"> Regional Admins </span>
        </a>
      </div>
      <div class="col-md-12 col-lg-6 col-xl-3">
        <a class="dashbox" href="#">
          <i class="fa fa-user text-info" aria-hidden="true"></i>
          <span class="title"> {{ practitioners }} </span>
          <span class="desc"> Practitioners </span>
        </a>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-xl-6 mt-2">
        <div class="card">
          <div class="card-header">
            <h6>
              <i class="icon-fa icon-fa-line-chart text-warning" />Traffic Stats
            </h6>
          </div>
          <div class="card-body">
            <line-graph
              :labels="['Jan', 'Feb', 'Mar', 'June']"
              :values="[20, 30, 40, 60]"
            />
          </div>
        </div>
      </div>
      <div class="col-lg-12 col-xl-6 mt-2">
        <div class="card">
          <div class="card-header">
            <h6>
              <i class="icon-fa icon-fa-bar-chart text-success" />Sales Chart
            </h6>
          </div>
          <div class="card-body">
            <bar-graph
              :labels="['Jan', 'Feb', 'Mar', 'June']"
              :values="[20, 30, 40, 60]"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-xl-6 mt-2">
        <div class="card">
          <div class="card-header">
            <h6>
              <i class="icon-fa icon-fa-shopping-cart text-danger" />Recent
              Orders
            </h6>
          </div>
          <div class="card-body">
            <table class="table">
              <thead>
                <tr>
                  <th>Customer Name</th>
                  <th>Date</th>
                  <th>Amount</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Walter White</td>
                  <td>05/12/2016</td>
                  <td>555$</td>
                  <td><a href="#" class="btn btn-default btn-xs">View</a></td>
                </tr>
                <tr>
                  <td>Hank Hill</td>
                  <td>05/12/2016</td>
                  <td>222$</td>
                  <td><a href="#" class="btn btn-default btn-xs">View</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="col-lg-12 col-xl-6 mt-2">
        <div class="card">
          <div class="card-header">
            <h6><i class="icon-fa icon-fa-users text-info" />New Customers</h6>
          </div>
          <div class="card-body">
            <table class="table">
              <thead>
                <tr>
                  <th>Customer Name</th>
                  <th>Date</th>
                  <th>Amount</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Walter White</td>
                  <td>05/12/2016</td>
                  <td>555$</td>
                  <td><a href="#" class="btn btn-default btn-xs">View</a></td>
                </tr>
                <tr>
                  <td>Hank Hill</td>
                  <td>05/12/2016</td>
                  <td>222$</td>
                  <td><a href="#" class="btn btn-default btn-xs">View</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script type="text/babel">
import LineGraph from "../../../components/chartjs/LineChart.vue";
import BarGraph from "../../../components/chartjs/BarChart.vue";
import PieGraph from "../../../components/chartjs/PieChart.vue";
import Ls from "./../../../services/ls.js";
export default {
  props: ["toggle"],
  components: {
    LineGraph,
    BarGraph,
    PieGraph,
  },
  data() {
    return {
      header: "header",
      user_role: "",
      allUsers: 0,
      system_admin: 0,
      regional_admin: 0,
      practitioners: 0,
    };
  },
  async created() {
    this.user_role = Ls.get("Role");
    const response = await axios.get("/api/admin/users/get/allAdminUsers");
    let all_users = response.data;
    this.allUsers = all_users.length;
    console.log("Response System => ", this.allUsers);
    all_users.forEach((user, index) => {
      if (user.role == "admin") {
        this.system_admin += 1;
      } else if (user.role == "regional_admin") {
        this.regional_admin += 1;
      } else if (user.role == "practitioner") {
        this.practitioners += 1;
      }
    });
  },
};
</script>
<style scoped>
#dashboardPage {
  transition: ease 0.3s all;
}
.role_practitioner {
  padding: 90px 30px 10px 30px;
  min-height: calc(100% - 39px);
}
.system_admin {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 37px;
}
.system_admin img {
  max-width: 100%;
}
.system_admin div {
  width: 35px;
}
.dashbox i {
  font-size: 30px;
  left: 40px;
  position: absolute;
  top: 45px;
}
</style>
