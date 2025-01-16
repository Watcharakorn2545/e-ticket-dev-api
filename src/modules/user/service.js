import User from "../../models/userModel.js";

export const getUsers = async (req, res) => {
    try {
        const user = await User.findAll();
        return user;
    } catch (error) {
        return error;
    }
}