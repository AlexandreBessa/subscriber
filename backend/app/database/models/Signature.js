import Sequelize, { Model } from 'sequelize';

class Signature extends Model {
  static init(sequelize) {
    super.init(
      {
        title: Sequelize.STRING,
        description: Sequelize.STRING,
        value: Sequelize.FLOAT
      },
      { sequelize },
    );

    return this;
  }
}

export default Signature;
