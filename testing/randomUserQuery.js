// function randomID() {
//   console.log('Generating random ID');
//   let min = 900009;
//   let max = 1000011;

//   return Math.floor(Math.random() * (max - min) + min);
// }
function randomID(context, events, done) {
  let min = 900009;
  let max = 1000011;
  context.vars['query'] = Math.floor(Math.random() * (max - min) + min); // set the "query" variable for the virtual user
  return done();
}

module.exports = {
  randomID : randomID
}