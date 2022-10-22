const db = require('../../database/models/index');
const { name } = require('ejs');
const e = require('express');

const getUsers = async (_req, res) => {
    try {
        const allUsers = await db.User.findAll( {include: [
            {
                association: 'order_detail'
            },
            {
                association: 'reviews'
            },
            {
                association: 'users_type'
            },
            {
                association: 'orders'
            }
        ]})
        const users = allUsers.map(e =>{
            return {
                id: e.id,
                name: e.user_first_name + ' ' + e.user_last_name,
                email: e.user_mail,
                cel: e.user_cel,
                address: e.user_address,
                img: `http://localhost:3001/../../../img/users/${e.user_img}`,
                dni: e.dni,
                reviews: e.reviews,
                detail: `http://localhost:3001/api/users/${e.id}`
                }
        })
        const count = await db.User.count()
        
        res.status(200).json({count, users})
       
       
    } catch (error) {
        console.log(error);
    }
}

const userDetail = async (req, res) => {
    try {
        const id = req.params.id
        let userDetail = await db.User.findByPk(id, {
            include: [
                {
                    association: 'order_detail'
                },
                {
                    association: 'reviews'
                }
            ]
        })

        let user = userDetail = {
                id: id,
                name: userDetail.user_first_name + " " + userDetail.user_last_name,
                email: userDetail.user_mail,
                img: `http://localhost:3001/../../../img/users/${userDetail.user_img}`,
                address: userDetail.user_address,
                dni: userDetail.dni,
                cel: userDetail.user_cel 
                };

        if (userDetail) {
            res.status(200).json(user);
        } else {
            res.status(200).json(`No existe el usuario Nro: ${id}`)
        }
        
    } catch (error) {
        console.log(error);
    };
};

    const getOrders = async (_req,res) => {
        try {
          
            const apiOrders = await db.Order.findAll(
                {include: [
                    {association: 'users'},
                    {association: 'payment_method'},
                    {association: 'order_detail'}     
                    ],
                order: [
                    ['order_date', 'ASC']
                ]
            }
            )
            const orders = apiOrders.map(e => {
                return {
                    id: e.id,
                    user_id: e.user_id,
                    order_total_amt: e.order_total_amt,
                    order_date: e.order_date,
                    order_status: e.order_status,
                    payment_method: e.payment_method.pay_method_type,
                    users: e.users, 
                    order_detail: e.order_detail
                }
            });

            const count = await db.Order.count();
            const totalSales = await db.Order.sum('order_total_amt')

            res.status(200).json({count,totalSales, orders})

        }catch (error) {
        console.log(error);
    };
    };

    const salesByProduct = async (_req,res) => {
        try {

            const data = await db.Product.findAll({
                include: [
                    {
                        association: 'order_detail'
                    },
                  
                ]
            });
            const productOrders = data.map(e => {
                return {
                    id: e.id,
                    productName: e.name,
                    unidadesVendidasXProducto:  e.order_detail.map(el => el.quantity).length? e.order_detail.map(el => el.quantity).reduce((pv,cv)=> pv +cv): 0,
                  
            }
        }
            )


            res.status(200).json({productOrders})



        }catch (error) {
            console.log(error);
     
        };
    }





module.exports ={
   getUsers,
   userDetail,
   getOrders,
   salesByProduct
}