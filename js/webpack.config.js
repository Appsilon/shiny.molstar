const webpack = require('webpack');
const path = require('path');

const config = {
  mode: 'production',
  entry: './src/index.js',
  output: {
    path: path.join(__dirname, '..', 'inst', 'www'),
    filename: 'shiny.molstar.min.js'
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ['@babel/preset-env', '@babel/preset-react']
          }
        }
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader'
        ]
      }
    ]
  },
  externals: {
    'react': 'jsmodule["react"]',
    'react-dom': 'jsmodule["react-dom"]',
    '@/shiny.react': 'jsmodule["@/shiny.react"]'
  },
  performance: {
    maxAssetSize: 2597152, // 2.5 MiB
    maxEntrypointSize: 2597152, // 2 MiB
  },
};

module.exports = config;
