/* eslint-disable no-unused-vars */
/* eslint-disable prefer-const */
/* eslint-disable no-undef */
/* eslint-disable max-len */
/* eslint-disable no-plusplus */
let bcrypt = require('bcrypt');
const pool = require('./db');

const register = async (request, h) => {
  const { username, email, password } = request.payload;
  const hashedPassword = await bcrypt.hash(password, 10);

  try {
    const client = await pool.connect();
    const result = await client.query(
      'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING id, username, email',
      [username, email, hashedPassword],
    );
    client.release();
    return h.response(result.rows[0]).code(201);
  } catch (error) {
    console.error('Error during register:', error);
    return h.response({ error: 'Registrasi Gagal' }).code(500);
  }
};

const login = async (request, h) => {
  const { email, password } = request.payload;
  try {
    const client = await pool.connect();
    const result = await client.query(
      'SELECT * FROM users WHERE email = $1',
      [email],
    );
    client.release();

    if (result.rows.length === 0) {
      return h.response({ error: 'User tidak ditemukan' }).code(404);
    }

    const user = result.rows[0];
    const isValid = await bcrypt.compare(password, user.password);

    if (!isValid) {
      return h.response({ error: 'Invalid password' }).code(401);
    }
    return h.response({ message: 'Login successful', user: { id: user.id, username: user.username, email: user.email } }).code(200);
  } catch (err) {
    console.error('Error during login:', err);
    return h.response({ error: 'Failed to login' }).code(500);
  }
};

const getProfile = async (request, h) => {
  const { id } = request.params;

  try {
    const client = await pool.connect();
    const result = await client.query(
      'SELECT id, username, email FROM users WHERE id = $1',
      [id],
    );
    client.release();

    if (result.rows.length === 0) {
      return h.response({ error: 'Profil pengguna tidak ditemukan' }).code(404);
    }

    return h.response(result.rows[0]).code(200);
  } catch (error) {
    console.error('Error during getProfile:', error);
    return h.response({ error: 'Gagal mengambil profil pengguna' }).code(500);
  }
};

const updateProfile = async (request, h) => {
  try {
    const { id } = request.params;
    const { username, email, password } = request.payload;

    let query = 'UPDATE users SET';
    const values = [];
    let counter = 1;

    if (username) {
      query += ` username = $${counter},`;
      values.push(username);
      counter++;
    }
    if (email) {
      query += ` email = $${counter},`;
      values.push(email);
      counter++;
    }
    if (password) {
      const hashedPassword = await bcrypt.hash(password, 10);
      query += ` password = $${counter},`;
      values.push(hashedPassword);
      counter++;
    }

    query = query.slice(0, -1);
    query += ` WHERE id = $${counter}`;
    values.push(id);

    console.log('Constructed query:', query);
    console.log('Query values:', values);

    const client = await pool.connect();
    await client.query(query, values);
    client.release();

    return h.response({ message: 'Profile updated successfully' }).code(200);
  } catch (error) {
    console.error('Error during updateProfile:', error);
    return h.response({ error: 'Failed to update profile', details: error.message }).code(500);
  }
};

const getQuestions = async (request, h) => {
  try {
    const client = await pool.connect();
    const questionsResult = await client.query('SELECT * FROM questions');
    const optionsResult = await client.query('SELECT * FROM options');
    client.release();

    const questions = questionsResult.rows.map((question) => ({
      ...question,
      options: optionsResult.rows.filter((option) => option.question_id === question.id).map((option) => option.option_text),
    }));

    return h.response(questions).code(200);
  } catch (error) {
    console.error('Error during getQuestions:', error);
    return h.response({ error: 'Failed to get questions' }).code(500);
  }
};

const getDiscussions = async (request, h) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT discussions.*, users.username FROM discussions JOIN users ON discussions.user_id = users.id');
    client.release();
    return h.response(result.rows).code(200);
  } catch (error) {
    console.error('Error during getDiscussions:', error);
    return h.response({ error: 'Failed to get discussions' }).code(500);
  }
};

const addDiscussion = async (request, h) => {
  const { userId, content } = request.payload;
  const createdAt = new Date().toISOString();

  try {
    const client = await pool.connect();
    const result = await client.query(
      'INSERT INTO discussions (user_id, content, created_at) VALUES ($1, $2, $3) RETURNING id, user_id, content, created_at',
      [userId, content, createdAt],
    );
    client.release();
    return h.response(result.rows[0]).code(201);
  } catch (error) {
    console.error('Error during addDiscussion:', error);
    return h.response({ error: 'Failed to add discussion' }).code(500);
  }
};

const getReplies = async (request, h) => {
  const { discussionId } = request.query;
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT replies.*, users.username FROM replies JOIN users ON replies.user_id = users.id WHERE discussion_id = $1', [discussionId]);
    client.release();
    return h.response(result.rows).code(200);
  } catch (error) {
    console.error('Error during getReplies:', error);
    return h.response({ error: 'Failed to get replies' }).code(500);
  }
};

const addReply = async (request, h) => {
  const { discussionId, userId, content } = request.payload;
  const createdAt = new Date().toISOString();

  try {
    const client = await pool.connect();
    const result = await client.query(
      'INSERT INTO replies (discussion_id, user_id, content, created_at) VALUES ($1, $2, $3, $4) RETURNING id, discussion_id, user_id, content, created_at',
      [discussionId, userId, content, createdAt],
    );
    client.release();
    return h.response(result.rows[0]).code(201);
  } catch (error) {
    console.error('Error during addReply:', error);
    return h.response({ error: 'Failed to add reply' }).code(500);
  }
};

const deleteDiscussion = async (request, h) => {
  const { id } = request.params;

  try {
    const client = await pool.connect();

    await client.query('BEGIN');
    await client.query('DELETE FROM replies WHERE discussion_id = $1', [id]);
    await client.query('DELETE FROM discussions WHERE id = $1', [id]);
    await client.query('COMMIT');

    client.release();
    return h.response({ message: 'Diskusi berhasil dihapus' }).code(200);
  } catch (error) {
    await client.query('ROLLBACK');
    client.release();

    console.error('Error during deleteDiscussion:', error);
    return h.response({ error: 'Failed to delete discussion' }).code(500);
  }
};

module.exports = {
  register, login, getProfile, updateProfile, getQuestions, getDiscussions, addDiscussion, getReplies, addReply, deleteDiscussion,
};
