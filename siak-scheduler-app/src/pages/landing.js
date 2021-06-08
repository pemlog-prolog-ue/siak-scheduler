import React, {useState} from "react";
import "./landing.css";
import axios from "axios";
import { program_pl } from "./database";
import { scheduler_pl } from "./scheduler_pl";
import {Multiselect} from "multiselect-react-dropdown";
import { getAllMatkul, postQuery } from "./siak_api";


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
      jumlah_sks: 0,
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
      list_matkul: [],
      chosenGraduated: [],
      query: {
        graduated: [],
        sks: 0,
      }
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
    console.log("SUBMIT");
    var result = [];
    var chosen = this.state.chosenGraduated;
    // Reset
    this.setState({
      query: {graduated: [],sks:0}
    });

    for (let i = 0; i < chosen.length; i++) {
      result.push(chosen[i].id);
    }
    this.setState({
      query: {
        graduated: result,
        sks: parseInt(this.state.jumlah_sks)
      }
    }, () => {
      this.fetchPostQuery(this.state.query);
    });
    e.preventDefault();
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

  fetchGraduatedChoices = () => {
    getAllMatkul((matkul) => {
      console.log("FETCH MATKUL");
      console.log(matkul);
      this.setState({
        list_matkul: matkul
      })
    });
  }

  fetchPostQuery = (json_data) => {
    const url = "http://localhost:8000/api/query";
    var query_data = json_data;
    console.log(query_data);
    axios.post(url, query_data)
    .then( response => {
      console.log(response)
    })
  }

  componentDidMount = () => {
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
    // this.fetchPostQuery();
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
              options={this.state.list_matkul}
              placeholder="Pilih mata kuliah"
              displayValue="nama_matkul"
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
        <div>
          [{this.state.query.graduated}]
          <br></br>
          {this.state.query.sks}
        </div>
      </div>
    );
  }
}