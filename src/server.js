/* eslint-disable import/no-extraneous-dependencies */
const Hapi = require('@hapi/hapi');
const HapiCors = require('hapi-cors');
const Inert = require('@hapi/inert');
const routes = require('./routes');

const init = async () => {
  const server = Hapi.server({
    port: process.env.PORT || 8083,
    host: '0.0.0.0',
  });

  await server.register([
    Inert,
    {
      plugin: HapiCors,
      options: {
        origins: ['*'],
        methods: ['GET', 'POST', 'PUT', 'DELETE'],
      },
    },
  ]);

  server.route(routes);

  await server.start();

  console.log(`Server running on ${server.info.uri}`);
};

init();
