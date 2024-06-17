const {
  register,
  login,
  getProfile,
  updateProfile,
  getQuestions,
  getDiscussions,
  addDiscussion,
  getReplies,
  addReply,
  deleteDiscussion,
} = require('./handler');

const routes = [
  {
    method: 'POST',
    path: '/register',
    handler: register,
  },
  {
    method: 'POST',
    path: '/login',
    handler: login,
  },
  {
    method: 'GET',
    path: '/profile/{id}',
    handler: getProfile,
  },
  {
    method: 'PUT',
    path: '/profile/{id}',
    handler: updateProfile,
  },
  {
    method: 'GET',
    path: '/testliteration',
    handler: getQuestions,
  },
  {
    method: 'GET',
    path: '/forumdiskusi',
    handler: getDiscussions,
  },
  {
    method: 'POST',
    path: '/forumdiskusi',
    handler: addDiscussion,
  },
  {
    method: 'GET',
    path: '/replies',
    handler: getReplies,
  },
  {
    method: 'POST',
    path: '/replies',
    handler: addReply,
  },
  {
    method: 'DELETE',
    path: '/forumdiskusi/{id}',
    handler: deleteDiscussion,
  },
];

module.exports = routes;
