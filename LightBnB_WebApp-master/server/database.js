const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg')
const client = new Pool()
client.connect().then((response => { console.log(response) }))
// const res = await pool.query(`SELECT title FROM properties LIMIT 10;`).then(response => { console.log(response) })



/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(option, email) {
  return client
    .query(`SELECT * FROM uesr.email WHERE user.email = $1`, email)
  .then((result) => {
    if (result) {
    console.log(result.rows[0]);
    return result.rows[0];
  } else {
    return null
  }
})
  .catch((err) => {
    console.log(err.message);
  })
  // return Promise.resolve(user);
}

exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(option, id) {
  return client
    .query(`SELECT * FROM uesr.id WHERE user.id = $1`, id)
    .then((result) => {
      console.log(result.rows);
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
  return Promise.resolve(users[id]);
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(option, user) {
  return client
    .query(`INSERT INTO users(name: string, password: string, email: string) VALUES $1`, user )
    .then((result) => {
      console.log(result.rows);
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
  return Promise.resolve(user);
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return getAllProperties(null, 2);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit = 10) => {
  const getAllProperties = function (options, limit = 10) {
    // 1
    const queryParams = [];
    // 2
    let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

    // 3
    if (options.city) {
      queryParams.push(`%${options.city}%`);
      queryString += `WHERE city LIKE $${queryParams.length} `;
    }

    // 4
    queryParams.push(limit);
    queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

    // 5
    console.log(queryString, queryParams);

    // 6
    return client.query(queryString, queryParams).then((res) => res.rows);
  };
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
