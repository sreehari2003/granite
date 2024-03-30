import React from "react";
import { ToastContainer } from "react-toastify";
import Dashboard from "components/Dashboard";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";

const App = () => (
  <Router>
    <ToastContainer />
    <Switch>
      <Route exact path="/" render={() => <div>Home</div>} />
      <Route exact path="/dashboard" component={Dashboard} />
    </Switch>
  </Router>
);

export default App;
