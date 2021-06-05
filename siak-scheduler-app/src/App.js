import logo from './logo.svg';
import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import './App.css';
import Landing from "./pages/landing";

function App() {
  return (
    <Router className="App">
      <Switch>
        <Route exact path="/" component={Landing}>
        </Route>
      </Switch>
    </Router>
  )
}

export default App;
