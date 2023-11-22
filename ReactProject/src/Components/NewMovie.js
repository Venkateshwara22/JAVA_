import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const NewMovie = () => {
  const [id] = useState("");
  const [name, namechange] = useState("");
  const [year, yearchange] = useState("");
  const [cast, castchange] = useState("");
  const [synopsis, synopsischange] = useState("");
  const [rating, ratingchange] = useState("");
  const [active, activechange] = useState(true);
  const [validation, valchange] = useState(true);
  const [formSubmitted, setFormSubmitted] = useState(false); // Track form submission

  const navigate = useNavigate();

  const handlesubmit = (e) => {
    e.preventDefault();
    if (!formIsValid()) {
      alert("Please fill in all fields before submitting.");
      return;
    }

    if (formSubmitted) {
      return;
    }

    const moviesdata = { name, year, cast, synopsis, rating, active };

    setFormSubmitted(true);

    fetch("http://localhost:8000/movies", {
      method: "POST",
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
          Add Movie Details
        </h1>
        <div className="form-group">
          <label>Name</label>
          <input
            value={name}
            onMouseDown={(e) => valchange(true)}
            onChange={(e) => namechange(e.target.value)}
            className="form-control"
          ></input>
          {name.length === 0 && validation && (
            <span className="text-danger">Enter Movie Name</span>
          )}
        </div>
        <div className="form-group">
          <label>Year</label>
          <input
            value={year}
            onChange={(e) => yearchange(e.target.value)}
            className="form-control"
          ></input>
        </div>
        <div className="form-group">
          <label>Cast</label>
          <input
            value={cast}
            onChange={(e) => castchange(e.target.value)}
            className="form-control"
          ></input>
        </div>
        <div className="form-group">
          <label>Synopsis</label>
          <input
            value={synopsis}
            onChange={(e) => synopsischange(e.target.value)}
            className="form-control"
          ></input>
        </div>
        <div className="form-group">
          <label>Rating</label>
          <input
            value={rating}
            onChange={(e) => ratingchange(e.target.value)}
            className="form-control"
          ></input>
        </div>
        <div className="form-check">
          <input
            checked={active}
            onChange={(e) => activechange(e.target.checked)}
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

export default NewMovie;
