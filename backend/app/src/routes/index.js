import { Router } from 'express';

import signatureRoutes from './SignatureRoutes';

const router = Router();

router.use('/signatures', signatureRoutes);

export default router;
