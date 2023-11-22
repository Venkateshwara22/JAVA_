import React, { useState, useEffect } from "react";
import { useParams, Link, useNavigate } from "react-router-dom";

const EditList = () => {
  const { id } = useParams();
  const [movie, setMovie] = useState({
    name: "",
    year: "",
    cast: "",
    synopsis: "",
    rating: "",
    active: true,
  });
  const [validation, valchange] = useState(true);
  const [formSubmitted, setFormSubmitted] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchMovieDetails = async () => {
      try {
        const response = await fetch(`http://localhost:8000/movies/${id}`);
        if (response.ok) {
          const data = await response.json();
          setMovie(data); // Set the movie data from the server
        } else {
          throw Error("Failed to fetch movie details.");
        }
      } catch (error) {
        console.error(error);
      }
    };

    fetchMovieDetails();
  }, [id]);

  const handlesubmit = (e) => {
    e.preventDefault();
    if (!formIsValid()) {
      alert("Please fill in all fields before submitting.");
      return;
    }

    if (formSubmitted) {
      return;
    }

    const { name, year, cast, synopsis, rating, active } = movie; // Get updated movie data

    const moviesdata = { name, year, cast, synopsis, rating, active };

    setFormSubmitted(true);

    fetch(`http://localhost:8000/movies/${id}`, {
      method: "PUT", // Use PUT method to update the movie
      headers: { "content-type": "application/json" },
      body: JSON.stringify(moviesdata),
    })
      .then((res) => {
        alert("Saved Successfully");
        navigate("/");
      })
      .catch((err) => {
        console.log(err.message);
      });
  };

  const formIsValid = () => {
    const { name, year, cast, synopsis, rating } = movie;
    return name && year && cast && synopsis && rating;
  };

  const containerStyle = {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    height: "100vh",
  };

  const formStyle = {
    background: "rgba(255, 255, 255, 0.7)", // Decreased transparency
    padding: "20px",
    borderRadius: "10px",
    border: "2px solid #000",
    maxWidth: "500px",
  };

  return (
    <div style={containerStyle}>
      <form style={formStyle} onSubmit={handlesubmit}>
        <h1 style={{ fontWeight: "bold", color: "purple", textAlign: "center" }}>
          Edit Movie Details
        </h1>
        <div className="form-group">
          <label>Name</label>
          <input
            value={movie.name}
            onMouseDown={(e) => valchange(true)}
            onChange={(e) => setMovie({ ...movie, name: e.target.value })}
            className="form-control"
          ></input>
          {movie.name.length === 0 && validation && (
            <span className="text-danger">Enter Movie Name</span>
          )}
        </div>
        <div className="form-group">
          <label>Year</label>
          <input
            value={movie.year}
            onChange={(e) => setMovie({ ...movie, year: e.target.value })}
            className="form-control"
          ></input>
        </div>
        <div className="form-group">
          <label>Cast</label>
          <input
            value={movie.cast}
            onChange={(e) => setMovie({ ...movie, cast: e.target.value })}
            className="form-control"
          ></input>
        </div>
        <div className="form-group">
          <label>Synopsis</label>
          <input
            value={movie.synopsis}
            onChange={(e) => setMovie({ ...movie, synopsis: e.target.value })}
            className="form-control"
          ></input>
        </div>
        <div className="form-group">
          <label>Rating</label>
          <input
            value={movie.rating}
            onChange={(e) => setMovie({ ...movie, rating: e.target.value })}
            className="form-control"
          ></input>
        </div>
        <div className="form-check">
          <input
            checked={movie.active}
            onChange={(e) => setMovie({ ...movie, active: e.target.checked })}
            type="checkbox"
            className="form-check-input"
          ></input>
          <label className="form-check-label">Is Active</label>
        </div>
        <div className="form-group" style={{ textAlign: "center" }}>
          <button type="submit" className="btn btn-success" disabled={formSubmitted}>
            Save
          </button>
        </div>
        <div className="form-group" style={{ textAlign: "center" }}>
          <Link to="/" className="btn btn-danger">
            Back
          </Link>
        </div>
      </form>
    </div>
  );
};

export default EditList;
