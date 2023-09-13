this.on("submitOrder",async(req)=>{
    const{ book, amount }=req.data;
    let{ stock }=awaitdb.read(Books,book,(b)=>b.stock);
    if(stock >= amount){
      awaitdb.update(Books,book).with({stock: (stock-=amount)});
      awaitthis.emit("OrderedBook",{ book, amount,buyer: req.user.id});
      returnreq.reply({ stock });// <-- Normal reply
    }else{
      // Reply with error code 409 and a custom error message
      returnreq.error(409,`${amount} exceeds stock for book #${book}`);
    }
  });