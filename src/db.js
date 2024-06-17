require('dotenv').config();
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'literation_testing',
  password: process.env.DB_PASSWORD || 'user2443',
  port: process.env.DB_PORT || 5432,
});

module.exports = pool;
