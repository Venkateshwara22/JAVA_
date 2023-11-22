import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import NewMovie from "./NewMovie";
import "./MoviesList.css"; // Import the CSS file

const MoviesList = () => {
  const [moviesdata, moviesdatachanged] = useState(null);
  const navigate = useNavigate();

  const LoadDetails = (id) => {
    navigate("/Components/NewMovie/Details/" + id);
  };

  const EditDetails = (id) => {
    navigate("/Components/NewMovie/EditList/" + id);
  };

  const DeleteMovieDetails = (id) => {
    if (window.confirm("Do you want to remove the movie from the list?")) {
      fetch(`http://localhost:8000/movies/${id}`, {
        method: "DELETE",
      })
        .then((res) => {
          alert("Removed Successfully");
  
          // After successful deletion, refresh the movie list to get updated data.
          // This can be done by calling the API to fetch the latest movie data.
          // Assuming that the server has updated the movie IDs correctly.
          fetch("http://localhost:8000/movies")
            .then((res) => res.json())
            .then((resp) => {
              moviesdatachanged(resp);
            })
            .catch((err) => {
              console.log(err.message);
            });
  
          navigate("/");
        })
        .catch((err) => {
          console.log(err.message);
        });
    }
  };
  

  useEffect(() => {
    fetch("http://localhost:8000/movies")
      .then((res) => {
        return res.json();
      })
      .then((resp) => {
        moviesdatachanged(resp);
      })
      .catch((err) => {
        console.log(err.message);
      });
  }, []);

  return (
    <div className="container">
      <div className="card">
        <div className="card-title">
          <div></div>
          <h1 style={{ fontWeight: 'bold', color: 'darkviolet' }}>Movies : Description and Ratings</h1>
        </div>
        <div className="card-body">
          <div className="divbtn">
            <Link to="/Components/NewMovie" className="btn btn-success">
              Add New (+)
            </Link>
          </div>
          <div></div>
          <table className="table table-bordered" style={{ background: "transparent" }}>
            <thead className="bg-dark text-white">
              <tr>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Id</td>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Name</td>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Year</td>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Cast</td>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Synopsis</td>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Rating</td>
                <td style={{ fontSize: "18px", fontWeight: "bold" }}>Action</td>
              </tr>
            </thead>
            <tbody>
              {moviesdata &&
                moviesdata.map((item) => (
                  <tr key={item.id}>
                    <td>{item.id}</td>
                    <td style={{ fontWeight: "bold" }}>{item.name}</td>
                    <td>{item.year}</td>
                    <td>{item.cast}</td>
                    <td>{item.synopsis}</td>
                    <td style={{ fontWeight: "bold" }}>{item.rating}</td>
                    <td>
                      <a onClick={() => { EditDetails(item.id) }} className="btn btn-success">Edit</a>{" "}
                      <a onClick={() => { DeleteMovieDetails(item.id) }} className="btn btn-danger">Remove (-)</a>
                      <a onClick={() => { LoadDetails(item.id) }} className="btn btn-primary">Details</a>
                    </td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default MoviesList;
