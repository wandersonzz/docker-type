import express from "express";

const app = express()


app.get('/', (req, res) => {
    return res.json({
        status: "ok"
    })
})


app.listen(8800, () => console.log("listening on port 4000")
)