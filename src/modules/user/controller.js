import {getUsers} from "./service.js";
// const { getUsers } = require("./service");

export const getUsersController = async (req, res) => {
    try {
        const user = await getUsers();
        if(typeof user === 'string'){
            return res.status(500).json({
                status: false,
                message: "failed",
            });
        }
        res.status(200).json({
            status: true,
            message: "Success",
            data: user
        });
    } catch (error) {
        res.status(500).json({
            status: false,
            message: error.message
        });
    }
}

// module.exports = {
//     getUsersController
// }