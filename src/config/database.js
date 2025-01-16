import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';
dotenv.config();

export const sequelize = new Sequelize({
  dialect: 'mariadb',
  host: process.env.DB_HOST,
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,
  logging: false,
  timezone: '+07:00',
  pool: {
    max: 100,            
    min: 10,            
    acquire: 30000,      
    idle: 10000          
  }
});