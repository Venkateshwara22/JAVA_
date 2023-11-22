import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

const Details = () => {
  const { id } = useParams();
  const [moviesdata, setMoviesData] = useState({});

  useEffect(() => {
    const fetchMovieDetails = async () => {
      try {
        const response = await fetch(`http://localhost:8000/movies/${id}`);
        if (response.ok) {
          const data = await response.json();
          setMoviesData(data);
        } else {
          throw Error("Failed to fetch movie details.");
        }
      } catch (error) {
        console.error(error);
      }
    };

    fetchMovieDetails();
  }, [id]);

  const containerStyle = {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    flexDirection: "column", // Center vertically
    height: "100vh",
  };

  const tableStyle = {
    fontSize: "20px",
    color: "orange",
    fontWeight: "bold",
    background: "rgba(255, 255, 255, 0.9)",
    padding: "20px",
    borderRadius: "10px",
    border: "2px solid #000",
  };

  const tdStyle = {
    padding: "10px",
    border: "1px solid #000", // Add borders around cells
  };

  const tdNameStyle = {
    width: "800px", // Set a specific width for the name column
    padding: "10px",
    border: "1px solid #000", // Add borders around cells
  };

  const backBtnStyle = {
    background: "red",
    color: "white",
    fontWeight: "bold",
    border: "none",
    padding: "10px 20px",
    borderRadius: "5px",
    marginTop: "20px",
    cursor: "pointer",
  };

  const goBack = () => {
    window.history.back(); // Go back to the previous page
  };

  return (
    <div style={containerStyle}>
      {moviesdata && (
        <div>
          <h1 style={{ fontWeight: "bold", color: "yellow" }}>Movie Details</h1>
          <table style={tableStyle}>
            <tbody>
              <tr>
                <td style={tdStyle}>Movie Name:</td>
                <td style={tdNameStyle}>
                  <strong>{moviesdata.name} ({moviesdata.id})</strong>
                </td>
              </tr>
              <tr>
                <td style={tdStyle}>Release Year:</td>
                <td style={tdStyle}>{moviesdata.year}</td>
              </tr>
              <tr>
                <td style={tdStyle}>Cast:</td>
                <td style={tdStyle}>{moviesdata.cast}</td>
              </tr>
              <tr>
                <td style={tdStyle}>Synopsis:</td>
                <td style={{ ...tdStyle, fontStyle: "italic" }}>
                  {moviesdata.synopsis}
                </td>
              </tr>
              <tr>
                <td style={tdStyle}>Rating:</td>
                <td style={tdStyle}>{moviesdata.rating}</td>
              </tr>
            </tbody>
          </table>
          <button style={backBtnStyle} onClick={goBack}>
            Back
          </button>
        </div>
      )}
    </div>
  );
};

export default Details;
