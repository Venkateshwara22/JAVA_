import React, { useRef } from 'react';
import { Link } from 'react-router-dom';
import { Formik, Form, Field, ErrorMessage } from 'formik';
import * as Yup from 'yup';
// Yup is a JavaScript library for schema validation. 
// It is often used in conjunction with Formik to define 
// and enforce validation rules for form inputs. 
// Yup allows you to create schema validations in a declarative manner, 
// making it easy to define the structure and constraints of your data.
//  With Yup, you can validate user inputs, ensuring that they meet specified
//   criteria, and handle errors gracefully. It seamlessly integrates with 
//   Formik to provide a robust solution for form validation in React applications.
import axios from 'axios';

function CreatePost() {
  const initialValues = {
    title: '',
    postText: '',
    username: '',
  };

  const isFormSubmittedRef = useRef(false);

  //formik automatically passes data as an argument to this function
//Formik streamlines the development of forms by managing the form's 
//state and handling common form-related tasks, such as validation 
//and submission, with a clean and intuitive API.
  const validationSchema = Yup.object().shape({
    title: Yup.string().required(),
    postText: Yup.string().required(),
    username: Yup.string().min(4).max(15).required(),
  });

  const submitData = async (data) => {
    // Implement your logic to submit data using axios or any other method
    await axios.post("http://localhost:3001/posts", data);
  };

  const onSubmit = async (data, { setSubmitting }) => {
    if (!isFormSubmittedRef.current) {
      isFormSubmittedRef.current = true;

      try {
        await submitData(data);
        console.log('Done');
        alert('Your favorite movie added!');
      } catch (error) {
        console.error('Submission failed:', error);
      } finally {
        isFormSubmittedRef.current = false;
      }
    }

    setSubmitting(false);
  };

  return (
    <div className="createPostPage">
      <Formik initialValues={initialValues} onSubmit={onSubmit} validationSchema={validationSchema}>
        <Form className="formContainer">
          <label>Title: </label>
          <ErrorMessage name="title" component="span" />
          <Field autoComplete="off" id="inputCreatePost" name="title" placeholder="(Ex. Title...)" />
          <label>Description: </label>
          <ErrorMessage name="postText" component="span" />
          <Field autoComplete="off" id="inputCreatePost" name="postText" placeholder="(Ex. Post...)" />
          <label>Username: </label>
          <ErrorMessage name="username" component="span" />
          <Field autoComplete="off" id="inputCreatePost" name="username" placeholder="(Ex. John123...)" />

          <button type="submit" style={{ fontFamily: 'Arial, Helvetica, sans-serif', fontSize: '15px' }}>
            Create Post
          </button>

          <div>
            <Link
              to="/"
              style={{
                fontSize: '20px',
                fontFamily: 'Roboto, sans-serif',
                textDecoration: 'none',
                color: 'yellow',
              }}
            >
              Go Back👈🏻
            </Link>
          </div>
        </Form>
      </Formik>
    </div>
  );
}

export default CreatePost;
