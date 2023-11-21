from routes import app 
 
if __name__ == "__main__": 
    app.run(port=5000, host='0.0.0.0') 
    app.run(debug=True, port=5000, host='0.0.0.0') 
