import React from "react";
import "./landing.css";

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

  testStart = () => {
    var pl = require("tau-prolog")
    var session = pl.create(1000);
    const program = `
      kelas(k_014,mk_05,'A').
      kelas(k_015,mk_05,'B').
      kelas(k_016,mk_05,'C').
      kelas(k_017,mk_05,'D').
      kelas(k_018,mk_05,'E').
      kelas(k_019,mk_05,'F').
      kelas(k_020,mk_05,'G').
    `;
    const query = `
      kelas(X, mk_05,Y).
    `
    const show = ans => {
      var jangke = session.format_answer(ans);
      this.setState({
        result: jangke
      });
      // console.log(this.state.result);
      // console.log(this.state.num);
      this.setState({
        num: this.state.num + 1
      });
      this.state.list_result.push(this.state.result);
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
    console.log("LAST")
    console.log(this.state.list_result)
    return (
      <div class="main-container">
        <h2>
          hello world
        </h2>
        <form class="form-container">
          <div class="field-container">
            <label>Preferensi dosen</label>
            <input type="text" value={this.state.preferensi_dosen} />
          </div>
          <div class="field-container">
            <label>Preferensi teman</label>
            <input type="text" value={this.state.preferensi_teman} />
          </div>
          <div class="field-container">
            <label>Preferensi minat</label>
            <input type="text" value={this.state.preferensi_minat} />
          </div>
          <input type="submit" value="Submit" />
        </form>
        <button onClick={this.testStart}>
          Press me
        </button>
        <p>
          {this.state.list_result}
        </p>
      </div>
    );
  }
}