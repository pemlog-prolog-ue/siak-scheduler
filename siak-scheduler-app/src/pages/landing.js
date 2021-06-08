import React, {useState} from "react";
import "./landing.css";
import axios from "axios";
import {Multiselect} from "multiselect-react-dropdown";
import { getAllMatkul } from "./siak_api";


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
      },
      list_jadwal: [],
      page: 1
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

  nextHandler = (e, length) => {
    this.setState({
      page: this.state.page+1
    });
    e.preventDefault();
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
      this.setState({
        list_jadwal: response.data
      }, () => {
        console.log(this.state.list_jadwal);
      })
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
    let index = 0;
    const data_render = this.state.list_jadwal.map((item) => {
      var key_id = index;
      var list = item.info_satu_solusi;
      // Fetch current nama_kelas
      var temp_nama_kelas = [];
      var fetch_nama_kelas = () => {
        for (let i = 0; i < list.length; i++) {
          temp_nama_kelas.push(list[i].nama_kelas);
        }
      }
      fetch_nama_kelas();
      index++;
      return (
        <div style={{
          display: "flex",
          flexDirection: "column",
          alignItems:"center",
          borderWidth:3,
          borderStyle: "solid",
          borderColor: "#8aebf2",
          backgroundColor: "#C1DFE1",
          padding: "3%",
          borderRadius: 15,
          marginBottom: 20,
          maxWidth:700,
        }} key={key_id}>
          {/* SKS */}
          <h2>Jadwal ke-{index} (Total SKS: {item.sks})</h2>
          {/* Matkul */}
          <div style={{
            display:"flex",
            flexDirection:"row",
            justifyContent:"center",
            flexWrap:"wrap"
          }}>
            {temp_nama_kelas.map((value_matkul, idx) => {
              return (
                <div style={{
                  backgroundColor:"white",
                  borderRadius: 20,
                  margin:10,
                  padding: 10,
                  maxWidth: 200
                }}>
                  <h4>{value_matkul} ({item.info_satu_solusi[idx].sks} sks)</h4>
                  Dosen:
                  <ul>
                    {item.info_satu_solusi[idx].nama_dosen.map((value_dosen,index) => {
                      return (
                        <>
                          <li>
                          {value_dosen}
                          </li>
                        </>
                      )
                    })}
                  </ul>
                  Jadwal:
                  <ul>
                    {item.info_satu_solusi[idx].jadwal.map((value_jadwal, index) => {
                      return (
                        <>
                          <li>
                            <p>
                            {value_jadwal[0]} {value_jadwal[1]} {value_jadwal[2]} 
                            </p>
                          </li>
                        </>
                      )
                    })}
                  </ul>
                </div>
              )
            })}
          </div>
        </div>
      );
    })
    
    const pagination_button = () => {
      if (data_render.length !=0) {
        return (
          <div style={{
            display:"flex", flexDirection:"row", justifyContent: "center",
            margin:10
          }}>
            <button onClick={(e) => {
              if(this.state.page < 2) {
                this.setState({page: 1})
              } else {
                this.setState({page: this.state.page-1})
              }
            }}>
              Prev
            </button>
            <p style={{marginLeft: 10, marginRight: 10}}>
              {this.state.page} / {data_render.length}
            </p>
            <button onClick={(e) => {
              if(this.state.page > data_render.length-1) {
                this.setState({page: data_render.length})
              } else {
                this.setState({page: this.state.page+1})
              }
            }}>Next</button>
          </div>
        )
      }
    }

    return (
      <div className="main-container">
        <div style={{marginTop:100}}>
          <h2>
            Cari jadwal Siak
          </h2>
          <form className="form-container" onSubmit={this.submitHandler}>
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
                closeOnSelect={false}
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

          {pagination_button()}
            {data_render[this.state.page-1]}
          {pagination_button()}
        </div>
      </div>
    );
  }
}