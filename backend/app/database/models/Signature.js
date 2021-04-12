import Sequelize, { Model } from 'sequelize';
import signatureEnums from '../../src/enums/signatureTypeEnum';

class Signature extends Model {
  static init(sequelize) {
    super.init(
      {
        title: Sequelize.STRING,
        description: Sequelize.STRING,
        value: Sequelize.FLOAT,
        type: {
          type: Sequelize.INTEGER,
          get() {
            const typeString = signatureEnums.getKey(this.getDataValue('type'));
            return typeString;
          },
        },
        expireDate: Sequelize.DATEONLY,
        automaticRenovation: {
          type: Sequelize.BOOLEAN,
          defaultValue: true,
        },
      },
      { sequelize },
    );

    return this;
  }
/*
  static associate(models) {

  }
   */
}

export default Signature;
