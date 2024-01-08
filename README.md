<a id="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Recipe App ](#-recipe-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Install](#install)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)


<!-- PROJECT DESCRIPTION -->

# 📖 Budget App <a id="about-project"></a>

The **Budget App** is a mobile web application build on Ruby on Rails where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

The design was made based on the <a href="https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding">Snapscan</a> layout made by <a href="https://www.behance.net/gregoirevella">Gregoire Vella on Behance</a>.

# 🎥 Presentation video
* [Follow this link](https://drive.google.com/file/d/1sYThPupwEd6hsfnNaWhBPLvemaGte41G/view?usp=sharing)

## 🛠 Built With <a id="built-with"></a>

### Tech Stack

<details>
  <summary>Back-end</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org/">Ruby on Rails (v 7.0.8)</a></li>
    <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
  </ul>
</details>

<details>
  <summary>Front-end</summary>
  <ul>
    <li><a href="https://www.w3schools.com/html/">HTML5</a></li>
    <li><a href="https://www.w3schools.com/css/">CSS3</a></li>
    <li><a href="https://www.rubyguides.com/2018/11/ruby-erb-haml-slim/">ERB template</a></li>
    <li><a href="https://developer.mozilla.org/es/docs/Web/JavaScript">JavaScript</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features
* Use of Rails framework.
* MVC architecture.
* Save and retrieve information from a PostgreSQL database.
* Log in and registration with <a href="https://github.com/heartcombo/devise">Devise gem</a>.
* Integration and unit tests with <a href="https://github.com/teamcapybara/capybara">Capybara</a> and <a href="https://github.com/rspec/rspec-rails">RSpec</a>.
* Authorization with <a href="https://github.com/CanCanCommunity/cancancan">CanCanCan gem</a>.
* Find and solve N + 1 problems with <a href="https://github.com/flyerhzm/bullet">Bullet gem</a>.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

* <a href="https://budget-app-8wpl.onrender.com/">Live demo link</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a id="getting-started"></a>

### Prerequisites
In order to run this project you need to have:

- Installed Ruby (v 3.2.2).
- Installed PostgreSQL.
- If you're using Windows, have installed WSL.
- If you're using MacOS, an option is using UTM.

### Setup
To clone this repository to your desired folder, run the following command: <br>

```
git clone git@github.com:Luffytaro22/Budget-app.git
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Usage
To open a local server, type the following command:
```
rails server
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Install
To install all the ruby gems, use the following command:
```
bundle install
```
To install the npm dependencies, use the following command:
```
npm install
```
After installing the gems, run this command to create and migrate a database:
```
rails db:create db:migrate
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Run tests
To run the RSpec unit and integration tests, use the following command:
```
rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Deployment
You can deploy this project from the following link:
* <a href="https://budget-app-8wpl.onrender.com/">Live demo link</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- AUTHORS -->

## 👥 Authors <a id="authors"></a>

👤 **Manuel Sánchez**

- GitHub: [@Luffytaro22](https://github.com/Luffytaro22)
- LinkedIn: [Manuel Sánchez](https://www.linkedin.com/in/manuel-alejandro-sanchez-sierra/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a id="future-features"></a>
- [ ] Allow the user to delete and modify their categories and transactions.
- [ ] Implement an email confirmation.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a id="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a id="support"></a>
If you like this project please give it a star ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a id="acknowledgements"></a>

I would like to give credits to the following:
* **Microverse** for this readme template.
* **<a href="https://www.behance.net/gregoirevella">Gregoire Vella on Behance</a>** for his beautiful UI layout.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a id="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


