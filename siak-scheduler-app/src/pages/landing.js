import React, {useState} from "react";
import "./landing.css";
import { program_pl } from "./database";
import { scheduler_pl } from "./scheduler_pl";
import {Multiselect} from "multiselect-react-dropdown"


export default class Landing extends React.Component {
  constructor() {
    super();
    this.state = {
      num:0,
      raw_program_pl: ``,
      result: "",
      preferensi_dosen: "",
      preferensi_teman: "",
      preferensi_minat: "",
      matakuliah_lulus: "",
      list_matakuliah_lulus: [],
      list_result: [],
      // Generate choices
      list_dosen_choices:[],
      chosenDosen: [],
      list_friend_choices: [],
      chosenFriends: []
    }
    this.style = {
      searchBox: {
        fontSize: "2px"
      }
    }
    this.handleDosenChoice = this.handleDosenChoice.bind(this);
    this.handleFriendChoice = this.handleFriendChoice.bind(this);
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

  mataKuliahLulusHandler = (e) => {
    this.setState({matakuliah_lulus: e.target.value})
  }

  submitHandler = (e) => {
    e.preventDefault();
    console.log("SUBMIT")
  }

  handleDosenChoice(option) {
    this.setState({
      chosenDosen: option,
    })
  }

  handleFriendChoice(option) {
    this.setState({
      chosenFriends: option
    })
  }

  generate_result = (session, program, query) => {
    const show = (ans) => {
      var query_result = session.format_answer(ans);
      var functor = query.split("(")[0];
      // console.log(query_result);
      // Render dosen choice
      if (functor === "dosen" && query_result !== "false.") {
        var id_dosen = query_result.split(" = ")[1];
        id_dosen = id_dosen.split(", ")[0]
        var nama_dosen = query_result.split(" = ")[2];
        var json_object = {
          "id_dosen": id_dosen,
          "nama_dosen": nama_dosen
        }
        this.setState({list_dosen_choices: this.state.list_dosen_choices.concat(json_object)});
      }

      // Render mahasiswa (teman) choice
      if (functor === "mahasiswa" && query_result !== "false.") {
        console.log(query_result)
        var id_mhs = query_result.split(" = ")[1];
        id_mhs = id_mhs.split(", ")[0]
        var nama_mhs = query_result.split(" = ")[2];
        // console.log(id_mhs);
        // console.log(nama_mhs)
        var json_object = {
          "id_mhs": id_mhs,
          "nama_mhs": nama_mhs
        }
        console.log(json_object)
        this.setState({list_friend_choices: this.state.list_friend_choices.concat(json_object)});
      }
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

  fetchDosenChoices = () => {
    var pl = require("tau-prolog")
    var session = pl.create(1000);
    var program = program_pl + scheduler_pl;
    // console.log(program);
    const query = "dosen(ID, Nama)."
    this.generate_result(session, program, query);
  }

  fetchMahasiswaChoices = () => {
    var pl = require("tau-prolog")
    var session = pl.create(1000);
    var program = program_pl + scheduler_pl;
    // console.log(program);
    const query = "mahasiswa(ID, Nama)."
    this.generate_result(session, program, query);
  }

  componentDidMount = () => {
    this.fetchDosenChoices();
    this.fetchMahasiswaChoices();
  }
  testrender = () => {
    return (
      <div>
        <h2>YAY</h2>
      </div>
    )
  }
  render() {
    // console.log(this.state.list_friend_choices)
    // console.log(this.state.chosenDosen);
    return (
      <div className="main-container">
        <h2>
          Cari jadwal Siak
        </h2>
        <form className="form-container" onSubmit={this.submitHandler}>
          <div className="field-container">
            <label>Preferensi dosen</label>
            <div>
              <Multiselect
              style={this.style}
              onSelect={this.handleDosenChoice}
              onRemove={this.handleDosenChoice}
              options={this.state.list_dosen_choices}
              placeholder="Pilih dosen favorit"
              displayValue="nama_dosen"
              />
            </div>
          </div>
          <div className="field-container">
            <label>Preferensi teman</label>
            <div>
              <Multiselect
              style={this.style}
              onSelect={this.handleFriendChoice}
              onRemove={this.handleFriendChoice}
              options={this.state.list_friend_choices}
              placeholder="Pilih ingin sekelas dengan siapa"
              displayValue="nama_mhs"
              />
            </div>
          </div>
          <div className="field-container">
            <label>Preferensi minat</label>
            <div>
              <Multiselect
              style={this.style}
              onSelect={this.handleDosenChoice}
              onRemove={this.handleDosenChoice}
              options={this.state.list_dosen_choices}
              placeholder="Pilih ingin mengambil minat apa"
              displayValue="nama_dosen"
              />
            </div>
          </div>
          <div className="field-container">
            <label>Mata kuliah yang sudah lulus:</label>
            <div>
              <Multiselect
              style={this.style}
              onSelect={this.handleDosenChoice}
              onRemove={this.handleDosenChoice}
              options={this.state.list_dosen_choices}
              placeholder="Masukan mata kuliah yang sudah lulus"
              displayValue="nama_dosen"
              />
            </div>
          </div>
          <button type="submit" >Submit</button>
        </form>
        
      </div>
    );
  }
}