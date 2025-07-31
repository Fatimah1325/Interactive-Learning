CREATE DATABASE Education
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(200),
    description VARCHAR(100),
    duration INT,
    category_id INT,
    start_date DATE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE app_users (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    username VARCHAR(100),
    email VARCHAR(150),
    password VARCHAR(255)
);

CREATE TABLE certifications (
    id INT PRIMARY KEY,
    certification_name VARCHAR(200),
    course_id INT,
    user_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (user_id) REFERENCES app_users(id)
);

CREATE TABLE user_courses (
    id INT PRIMARY KEY,
    course_id INT,
    user_id INT,
    completion_date DATE,
    state VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (user_id) REFERENCES app_users(id)
);

CREATE TABLE videos (
    id INT PRIMARY KEY,
    course_id INT,
    video_title VARCHAR(200),
    duration INT,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE interactive_eliment (
    id INT PRIMARY KEY,
    video_id INT,
    type VARCHAR(100),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

CREATE TABLE user_activity (
    id INT PRIMARY KEY,
    user_id INT,
    video_id INT,
    started_at DATETIME,
    paused_at INT,
    time_spent INT,
    FOREIGN KEY (user_id) REFERENCES app_users(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

CREATE TABLE question (
    id INT PRIMARY KEY,
    video_id INT,
    question VARCHAR(100),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

CREATE TABLE answer (
    id INT PRIMARY KEY,
    user_id INT,
    question_id INT,
    answer VARCHAR(100),
    is_correct VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES app_users(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE correct_answer (
    id INT PRIMARY KEY,
    question_id INT,
    correct_answer VARCHAR(100),
    FOREIGN KEY (question_id) REFERENCES question(id)
);
