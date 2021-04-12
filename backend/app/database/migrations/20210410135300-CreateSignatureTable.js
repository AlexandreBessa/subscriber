module.exports = {
  up: (queryInterface, Sequelize) => queryInterface.createTable('signatures', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    title: {
      type: Sequelize.STRING,
    },
    description: {
      type: Sequelize.STRING,
    },
    value: {
      type: Sequelize.FLOAT,
    },
    type: {
      type: Sequelize.INTEGER,
    },
    expire_date: {
      type: Sequelize.DATEONLY,
    },
    automatic_renovation: {
      type: Sequelize.BOOLEAN,
    },
    created_at: {
      type: Sequelize.DATE,
      allowNull: false,
    },
    updated_at: {
      type: Sequelize.DATE,
      allowNull: false,
    },
  }),

  down: (queryInterface) => queryInterface.dropTable('signatures'),
};
