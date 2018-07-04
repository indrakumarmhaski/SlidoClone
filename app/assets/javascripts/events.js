function myFunction(id) {
        console.log("Hiii we got a new like");
        console.log(id);
        App.global_chat.send_like(id);
        return false;
}