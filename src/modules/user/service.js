import User from "../../models/userModel.js";

export const getUsers = async (req, res) => {
    try {
        const user = await User.findAll();
        return user;
    } catch (error) {
        return error;
    }
}

export const getUser = async (req, res) => {
    try {
        const user = await User.findAll({
            where: {
                id: req.params.id
            }
        });
        return user;
    } catch (error) {
        return error;
    }
}