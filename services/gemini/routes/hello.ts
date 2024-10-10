/// <reference path="../global.d.ts" />
import { FastifyInstance, FastifyPluginOptions, FastifyReply, FastifyRequest } from 'fastify'

/** @param {import('fastify').FastifyInstance} fastify */
export default async function (fastify: FastifyInstance, opts: FastifyPluginOptions) {
  fastify.get('/hello', {
    schema: {
      querystring: {
        type: 'object',
        properties: {
          name: { type: 'string' }
        }
      },
      required: ['name']
    }
  }, async (request: FastifyRequest, reply: FastifyReply) => {
    return { result: request.query };
  })
}