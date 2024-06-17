const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'literation_testing',
  password: 'user2443',
  port: 5432,
});

module.exports = pool;
