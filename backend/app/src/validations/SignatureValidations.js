import * as Yup from 'yup';
import Signature from '../../database/models/Signature';

class SignatureValidation {
  async findOne(req) {
    const { id } = req.params;

    const signature = await Signature.findByPk(id);

    if (!signature) {
      return {
        error: true,
        message: 'Não existe assinatura com esse id',
      };
    }

    return signature;
  }

  async create(req) {
    const schema = Yup.object().shape({
      title: Yup.string().strict().required('Campo Obrigatório'),
      description: Yup.string().strict().required('Campo Obrigatório'),
      value: Yup.number().required('Campo Obrigatório'),
    });

    try {
      await schema.validate(req.body, { abortEarly: false });
    } catch (err) {
      const errors = [];
      err.inner.forEach((error) => {
        errors.push({ path: error.path, message: error.message });
      });
      return {
        error: true,
        message: errors,
      };
    }

    return {};
  }

  async update(req) {
    const { id } = req.params;

    const signature = await Signature.findByPk(id);

    if (!signature) {
      return {
        error: true,
        message: 'Não existe assinatura com esse id',
      };
    }

    const schema = Yup.object().shape({
      title: Yup.string().strict(),
      description: Yup.string().strict(),
      value: Yup.number(),
    });

    try {
      await schema.validate(req.body, { abortEarly: false });
    } catch (err) {
      const errors = [];
      err.inner.forEach((error) => {
        errors.push({ path: error.path, message: error.message });
      });
      return {
        error: true,
        message: errors,
      };
    }

    return signature;
  }

  async delete(req) {
    const { id } = req.params;

    const signature = await Signature.findByPk(id);

    if (!signature) {
      return {
        error: true,
        message: 'Não existe assinatura com esse id',
      };
    }

    return signature;
  }
}

export default new SignatureValidation();