import Signature from '../../database/models/Signature';
import SignatureValidations from '../validations/SignatureValidations';

class SignatureController {
  async findOne(req, res) {
    const validation = await SignatureValidations.findOne(req);
    if (validation.error) {
      return res.status(400).json({
        message: validation.message,
      });
    }

    const signature = validation;

    return res.status(200).json(signature);
  }

  async findAll(req, res) {
    const signatures = await Signature.findAll();
    return res.status(200).json(signatures);
  }

  async create(req, res) {
    const validation = await SignatureValidations.create(req);
    if (validation.error) {
      return res.status(400).json({
        message: validation.message,
      });
    }

    const signature = await Signature.create(req.body);

    return res.status(201).json(signature);
  }

  async update(req, res) {
    const validation = await SignatureValidations.update(req);
    if (validation.error) {
      return res.status(400).json({
        message: validation.message,
      });
    }

    const signature = validation;

    signature.update({ ...req.body });

    return res.status(201).json(signature);
  }

  async remove(req, res) {
    const validation = await SignatureValidations.delete(req);
    if (validation.error) {
      return res.status(400).json({
        message: validation.message,
      });
    }

    const signature = validation;

    signature.destroy();

    return res.status(204).json();
  }
}

export default new SignatureController();
