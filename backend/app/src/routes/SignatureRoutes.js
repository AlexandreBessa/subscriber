import { Router } from 'express';
import SignatureController from '../controllers/SignatureController';

const routes = new Router();

routes.post('/', SignatureController.create);

routes.delete('/:id', SignatureController.remove);

routes.put('/:id', SignatureController.update);

routes.get('/:id', SignatureController.findOne);
routes.get('/', SignatureController.findAll);

export default routes;
