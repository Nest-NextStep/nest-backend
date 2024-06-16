const Hapi = require("@hapi/hapi");
const routes = require("../src/routes");
const database = require("../src/utils/database");

const init = async () => {
  const server = Hapi.server({
    port: process.env.PORT,
    host: process.env.HOST,
    routes: {
      cors: {
        origin: ["*"],
      },
    },
  });
  await database.connect();
  server.route(routes);
  await server.start();
  console.log(`Server started at: ${server.info.uri}`);
};

// const init = async () => {
//   const server = Hapi.server({
//     port: 3000,
//     host: "localhost",
//     routes: {
//       cors: {
//         origin: ["*"],
//       },
//     },
//   });
//   await database.connect();
//   server.route(routes);
//   await server.start();
//   console.log(`Server started at: ${server.info.uri}`);
// };

init();
