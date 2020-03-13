import sirv from 'sirv'
import polka from 'polka'
import cors from 'cors'
import compression from 'compression'
import * as sapper from '@sapper/server'
import {
  config
} from 'dotenv'

config()

const {
  PORT,
  NODE_ENV
} = process.env
const dev = NODE_ENV === 'development'

polka()
  .use(
    cors(),
    compression({
      threshold: 0
    }),
    sirv('static', {
      dev
    }),
    sapper.middleware({
      session: () => ({
        IPFS_PROTOCOL: process.env.IPFS_PROTOCOL,
        IPFS_HOST: process.env.IPFS_HOST,
        IPFS_PORT: process.env.IPFS_PORT
      })
    })
  )
  .listen(PORT, err => {
    if (err) console.log('error', err)
  })