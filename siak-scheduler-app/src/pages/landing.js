import React from "react";
import "./landing.css";
import {PROGRAM} from "./database"

export default class Landing extends React.Component {
  constructor() {
    super();
    this.state = {
      num:0,
      result: "",
      preferensi_dosen: "",
      preferensi_teman: "",
      preferensi_minat: "",
      list_result: [],
    }
  }

  dosenHandler = (e) => {
    this.setState({preferensi_dosen: e.target.value});
  }

  temanHandler = (e) => {
    this.setState({preferensi_teman: e.target.value});
  }

  minatHandler = (e) => {
    this.setState({preferensi_minat: e.target.value});
  }

  submitHandler = (e) => {
    e.preventDefault();
    var pl = require("tau-prolog")
    var session = pl.create(1000);
    const program = PROGRAM;
    const query = "dosen(" + this.state.preferensi_dosen + ",R).";

    const show = ans => {
      var jangke = session.format_answer(ans);
      var substr = jangke.substring(0,1);
      if (substr === "R") {
        this.setState({result: jangke});
      }
      console.log(jangke);
    }

    session.consult(program, {
      success: function() {
        session.query(query, {
          success: function(ans) {
            session.answers(show);
          }
        })
      }
    });
  }

  componentDidMount = () => {
    
  }
  
  render() {
    return (
      <div className="main-container">
        <h2>
          Siak Scheduler
        </h2>
        <form className="form-container" onSubmit={this.submitHandler}>
          <div className="field-container">
            <label>Preferensi dosen</label>
            <input type="text" value={this.state.preferensi_dosen}
            onChange={this.dosenHandler}/>
          </div>
          <div className="field-container">
            <label>Preferensi teman</label>
            <input type="text" value={this.state.preferensi_teman}
            onChange={this.temanHandler}/>
          </div>
          <div className="field-container">
            <label>Preferensi minat</label>
            <input type="text" value={this.state.preferensi_minat}
            onChange={this.minatHandler}/>
          </div>
          <button type="submit" >Submit</button>
        </form>
        <p>
          {this.state.result}
        </p>
      </div>
    );
  }
}