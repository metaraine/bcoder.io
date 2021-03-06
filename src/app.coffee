# includes
express =     require('express')
rjs =         require('rjs').installPrototypes()
config =      require('./config.js').config

# create app and set middleware
app = express()
app.set 'view engine', 'jade'
app.set 'views', __dirname + '/views'
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.cookieParser()
app.use express.session(secret: config.sessionSecret)
app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/bower_components')

# controller
app.get '/', (req, res) ->
  res.render 'index'

app.get '/teach', (req, res) ->
  res.render 'teach'

app.get '/learn', (req, res) ->
  res.render 'learn'

# start
app.listen process.env.PORT, ->
  console.log 'Listening on port ' + process.env.PORT

# export globals
exports.app = app