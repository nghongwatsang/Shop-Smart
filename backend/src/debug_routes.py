from src import create_app

app = create_app()

@app.route('/routes')
def list_routes():
    """List all available routes"""
    routes = []
    for rule in app.url_map.iter_rules():
        methods = ','.join(sorted(rule.methods))
        routes.append({
            'endpoint': rule.endpoint,
            'methods': methods,
            'path': str(rule)
        })
    return {'routes': routes}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3003, debug=True)