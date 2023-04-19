from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, Python!'

@app.route('/api')
def api():
    data = {
        'message': 'This is an example API response.',
        'success': True
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)
