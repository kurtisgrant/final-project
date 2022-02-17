DROP TABLE IF EXISTS market_transactions CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS simulations CASCADE;
DROP TABLE IF EXISTS teachers CASCADE;

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  password VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE simulations (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_date DATE,
  simulation_key VARCHAR(255),
  mock_market_data TEXT,
  current_month INT,
  simulation_state BOOLEAN,
  income BIGINT,
  expense BIGINT,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  access_code VARCHAR(255) NOT NULL,
  simulation_id INTEGER REFERENCES simulations(id) ON DELETE CASCADE
);

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY NOT NULL,
  account_type VARCHAR(255),
  balance BIGINT,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE
);

CREATE TABLE market_transactions (
  id SERIAL PRIMARY KEY NOT NULL,
  month INT,
  price BIGINT,
  quantity INTEGER,
  account_id INTEGER REFERENCES accounts(id) ON DELETE CASCADE
);