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
      jumlah_sks: "",
      list_matakuliah_lulus: [],
      list_result: [],
      // Generate choices //
      // dosen
      list_dosen_choices:[],
      chosenDosen: [],
      // teman
      list_friend_choices: [],
      chosenFriends: [],
      // mata kuliah
      list_graduated_choice: [],
      chosenGraduated: []
    }
    this.style = {
      searchBox: {
        fontSize: "2px",
      }
    }
    this.handleDosenChoice = this.handleDosenChoice.bind(this);
    this.handleFriendChoice = this.handleFriendChoice.bind(this);
    this.handleGraduatedChoice = this.handleGraduatedChoice.bind(this);
    this.sksHandler = this.sksHandler.bind(this);
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

  sksHandler = (e) => {
    this.setState({jumlah_sks: e.target.value})
  }

  submitHandler = (e) => {
    e.preventDefault();
    console.log("SUBMIT")
  }

  handleDosenChoice = (option) => {
    this.setState({
      chosenDosen: option,
    })
  }

  handleFriendChoice = (option) => {
    this.setState({
      chosenFriends: option,
    })
  }

  handleGraduatedChoice = (option) => {
    this.setState({
      chosenGraduated: option,
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
          "nama_dosen": nama_dosen.substring(0, nama_dosen.length-1)
        }
        this.setState({list_dosen_choices: this.state.list_dosen_choices.concat(json_object)});
      }

      // Render mahasiswa (teman) choice
      if (functor === "mahasiswa" && query_result !== "false.") {
        var id_mhs = query_result.split(" = ")[1];
        id_mhs = id_mhs.split(", ")[0]
        var nama_mhs = query_result.split(" = ")[2];
        // console.log(id_mhs);
        // console.log(nama_mhs)
        var json_object = {
          "id_mhs": id_mhs,
          "nama_mhs": nama_mhs.substring(0, nama_mhs.length-1)
        }
        this.setState({list_friend_choices: this.state.list_friend_choices.concat(json_object)});
      }

      // Render graduated choice
      if (functor === "mata_kuliah" && query_result !== "false.") {
        var id_mk = query_result.split(" = ")[1];
        id_mk = id_mk.split(", ")[0]
        var nama_mk = query_result.split(" = ")[2];
        // console.log(id_mk);
        // console.log(nama_mk)
        var json_object = {
          "id_mk": id_mk,
          "nama_mk": nama_mk.substring(0, nama_mk.length-1)
        }
        this.setState({
          list_graduated_choice: this.state.list_graduated_choice.concat(json_object)}
        );
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

  fetchGraduatedChoices = () => {
    var pl = require("tau-prolog")
    var session = pl.create(1000);
    var program = program_pl + scheduler_pl;
    // console.log(program);
    const query = "mata_kuliah(ID, Nama, _)."
    this.generate_result(session, program, query);
  }

  componentDidMount = () => {
    this.fetchDosenChoices();
    this.fetchMahasiswaChoices();
    this.fetchGraduatedChoices();
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
    console.log(this.state.jumlah_sks)
    return (
      <div className="main-container">
        <h2>
          Cari jadwal Siak
        </h2>
        <form className="form-container" onSubmit={this.submitHandler}>
          {/* <div className="field-container">
            <label>Preferensi dosen</label>
            <div>
              <Multiselect
              showCheckbox={true}
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
              showCheckbox={true}
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
              showCheckbox={true}
              style={this.style}
              onSelect={this.handleDosenChoice}
              onRemove={this.handleDosenChoice}
              options={this.state.list_dosen_choices}
              placeholder="Pilih ingin mengambil minat apa"
              displayValue="nama_dosen"
              />
            </div>
          </div> */}
          <div className="field-container">
            <label>Mata kuliah yang sudah lulus:</label>
            <div>
              <Multiselect
              showCheckbox={true}
              style={this.style}
              onSelect={this.handleGraduatedChoice}
              onRemove={this.handleGraduatedChoice}
              options={this.state.list_graduated_choice}
              placeholder="Pilih mata kuliah"
              displayValue="nama_mk"
              />
            </div>
          </div>
          <div className="field-container">
            <label>SKS maksimal:</label>
            <input
            type="text"
            value={this.state.jumlah_sks}
            pattern="[0-9]*"
            onChange={this.sksHandler}/>
          </div>
          <button type="submit" >Submit</button>
        </form>
        
      </div>
    );
  }
}