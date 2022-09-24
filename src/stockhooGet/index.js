const axios = require("axios");

exports.handler = async () => {
    const encodedParams = new URLSearchParams();
    encodedParams.append("symbol", "AAPL");
    const options = {
        method: 'POST',
        url: 'https://yahoo-finance97.p.rapidapi.com/stock-info',
        headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'X-RapidAPI-Key': 'c4e0132828msha78f439ba90da18p18d00djsn835ab1f27753',
            'X-RapidAPI-Host': 'yahoo-finance97.p.rapidapi.com'
        },
        data: encodedParams
    };
    
    let res = await axios(options)
    
    console.log("Moo: ", res.data)

    return res.data
}