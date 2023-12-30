import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import axios from 'axios';

function Post() {
  let { id } = useParams();
  const [postObject, setPostObject] = useState({});

  useEffect(() => {
    axios.get(`http://localhost:3001/posts/byId/${id}`).then((response) => {
      setPostObject(response.data);
    });
  }, [id]);

  return (
    <div className="postPage">
      <div className="leftSide">
        <div className="post" id="individual">
          <div className="title">{postObject.title}</div>
          <div className="body">{postObject.postText}</div>
          <div className="footer">{postObject.username}</div>
        </div>
      </div>
      {/* Separate div for the right side (comment section and Go Back link) */}
      <div className="rightSide">
        <div
          style={{
            fontSize: '24px',
            color: 'orange',
            fontWeight: 'bold',
            marginTop: '20px',
          }}
        >
          ✍Comment Section
        </div>
        <div>
          <Link
            to="/"
            style={{
              fontSize: '20px',
              fontFamily: 'Roboto, sans-serif',
              textDecoration: 'none',
              color: 'yellow',
              display: 'block',
              marginTop: '20px',
            }}
          >
            Go Back👈🏻
          </Link>
        </div>
      </div>
    </div>
  );
}

export default Post;
