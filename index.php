<?php
require('includes/db.php');

if (isset($_POST['submit'])) {
  $first_name = $_POST['first_name'];
  $last_name = $_POST['last_name'];
  $address = $_POST['address'];
  $phone_no = $_POST['phone_no'];
  $order_date = $_POST['order_date'];
  $order_time = $_POST['order_time'];

$query = "INSERT INTO reservation (first_name, last_name, address, phone_no, order_date, order_time) VALUES ('$first_name', '$last_name', '$address', '$phone_no', '$order_date', '$order_time')";
$result = mysqli_query($connection, $query);

if($result) {
  echo "<script>alert('Reservation Successfully!');</script>";
} else {
  echo "<script>alert('Reservation failed please try again');</script>";
}

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Homepage | Taste Restaurant</title>
<meta name="description" content="">
<meta name="keywords" content="">

<link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600|Montserrat:200,300,400, 600, 700" rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">


<link rel="stylesheet" href="css/slick.css">

<link rel="stylesheet" href="css/helpers.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/restaurant.css">
</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">


<div class="probootstrap-loader"></div>
<!-- END loader -->

<nav class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light" id="pb-navbar">
  <div class="container">
	<a class="navbar-brand d-xl-none d-lg-none d-md-block d-sm-block" href="/">
	  <img src="images/restaurant/logo.png" alt="Instant Logo" class="light">
	  <img src="images/restaurant/logo-dark.png" alt="Instant Logo" class="dark">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-navbar" aria-controls="probootstrap-navbar" aria-expanded="false" aria-label="Toggle navigation">
	  <span><i class="ion-navicon"></i></span>
	</button>
	<div class="collapse navbar-collapse justify-content-md-center" id="probootstrap-navbar">
	  <ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link text-uppercase pb_letter-spacing-2" href="index.php">Home</a></li>
		<li class="nav-item"><a class="nav-link text-uppercase pb_letter-spacing-2" href="#section-about">About</a></li>
		<li class="nav-item"><a class="nav-link text-uppercase pb_letter-spacing-2" href="#section-menu">Menu</a></li>
		<li class="nav-item logo-center d-xl-block d-lg-block d-md-none d-sm-none d-none">
		  <a class="nav-link text-uppercase pb_letter-spacing-2" href="index.html">
			<img src="images/restaurant/logo.png" alt="Instant Logo" class="light">
			<img src="images/restaurant/logo-dark.png" alt="Instant Logo" class="dark">
		  </a>
		</li>
		<li class="nav-item"><a class="nav-link text-uppercase pb_letter-spacing-2" href="#section-gallery">Gallery</a></li>
		<li class="nav-item"><a class="nav-link text-uppercase pb_letter-spacing-2" href="#section-events">Events</a></li>
    <?php
    session_start();

    if(isset($_SESSION['login_user'])) {
      echo "<li class='nav-item'><a class='nav-link text-uppercase pb_letter-spacing-2' href='myorder.php'>{$_SESSION['login_user']}</a></li>";
      echo "<li class='nav-item'><a class='nav-link text-uppercase pb_letter-spacing-2' href='logout.php'>Log out</a></li>";
    } else {
      echo "<li class='nav-item'><a class='nav-link text-uppercase pb_letter-spacing-2' href='html/login.html'>Login</a></li>";
      echo "<li class='nav-item'><a class='nav-link text-uppercase pb_letter-spacing-2' href='html/register.html'>Register</a></li>";
    }
    ?>
	  </ul>
	</div>
  </div>
</nav>
<!-- END nav -->

<section class="pb_cover_v1 cover-bg-black cover-bg-opacity-4 text-center" style="background-image: url(images/restaurant/1900x1200/img_1.jpg)" id="section-home">
  <div class="container">
	<div class="row align-items-center justify-content-center">
	  <div class="col-md-9  order-md-1">
		<h2 class="heading mb-3">The Taste Restaurant</h2>
		<div class="sub-heading"><p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p></div>
		<p><a href="https://free-template.co/" target="_blank" class="btn btn-outline-white btn-lg ftco-animate" data-toggle="modal" data-target="#reservationModal">Reservation</a></p>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->

<section class="pb_section" id="section-about">
  <div class="container">
	<div class="row">
	  <div class="col-lg-8 mb-5">
		<div class="row">
		  <div class="col">
			<p><img src="images/restaurant/800x975/img_1.jpg" alt="Instant Image" class="img-fluid"></p>
		  </div>
		  <div class="col">
			<p><img src="images/restaurant/800x975/img_2.jpg" alt="Instant Image" class="img-fluid"></p>
		  </div>
		</div>
	  </div>
	  <div class="col-lg-4 pl-lg-5 pl-lg-0">
		<h2 class="mb-4 text-uppercase pb_letter-spacing-2">The Restaurant</h2>
		<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>

		<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
		<p><a href="#section-menu" class="smoothscroll text-danger text-uppercase">See our menu <i class="ion-arrow-down-c"></i></a></p>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->

<section class="pb_section" id="section-menu">
  <div class="container">
	<div class="row justify-content-center mb-5">
	  <div class="col-md-10 text-center">
		<h2 class="mb-4 text-uppercase pb_letter-spacing-2">Menu</h2>
	  </div>
	</div>
	<div class="row">
	  <div class="col">

		<ul class="nav justify-content-center pb_tab_v1">
		  <li class="nav-item">
			<a class="nav-link active p-3" data-toggle="list" href="#food" role="tab">Food</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link p-3" data-toggle="list" href="#drinks" role="tab">Drinks</a>
		  </li>
		  <li class="nav-item">
			<a class="nav-link p-3" data-toggle="list" href="#salads" role="tab">Salads</a>
		  </li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
		  <div class="tab-pane fade show active" id="food" role="tabpanel">
			<div class="row">
			  <div class="col-md">
				<ul class="list-unstyled pb_food-menu">
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Eggplant Parmiagana</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>13.95</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Fried Calamari</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>15.50</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Sausage and Pepper</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>17.35</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Potato and Egg</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>11.50</span></div>
					</div>
				  </li>
				</ul>
			  </div>
			  <div class="col-md">
				<ul class="list-unstyled pb_food-menu">
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Eggplant Parmiagana</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>20.75</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Fried Calamari</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>18.00</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Sausage and Pepper</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>10.25</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Potato and Egg</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>21.95</span></div>
					</div>
				  </li>
				</ul>
			  </div>
			</div>
		  </div><div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
		  <div class="tab-pane fade" id="drinks" role="tabpanel">
			<div class="row">
			  <div class="col-md">
				<ul class="list-unstyled pb_food-menu">
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Fountain Soda</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>10.95</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Fresh Juices</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>12.50</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Coffee/Tea</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>5.35</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Unsweetened Tea</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>12.50</span></div>
					</div>
				  </li>
				</ul>
			  </div>
			  <div class="col-md">
				<ul class="list-unstyled pb_food-menu">
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Fountain Soda</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>10.95</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Fresh Juices</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>12.50</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Coffee/Tea</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>5.35</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Unsweetened Tea</h3>
						<p class="mb-0">Far far away, behind the word mountains..</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>12.50</span></div>
					</div>
				  </li>
				</ul>
			  </div>
			</div>
		  </div>
		  <div class="tab-pane fade" id="salads" role="tabpanel">
			<div class="row">
			  <div class="col-md">
				<ul class="list-unstyled pb_food-menu">
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Caesars Salad</h3>
						<p class="mb-0">Romaine lettuce, croutons, and grated cheese</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>13.95</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Garden Salad</h3>
						<p class="mb-0">Mixed greens, tomato, cucumber &amp; black olives</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>15.50</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Baby Greens</h3>
						<p class="mb-0">Mixed greens, fresh mozzarella, tomato &ampl toasted peppers</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>17.35</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Cold Antipasto</h3>
						<p class="mb-0">Romaine lettuce, croutons, and grated cheese</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>11.50</span></div>
					</div>
				  </li>
				</ul>
			  </div>
			  <div class="col-md">
				<ul class="list-unstyled pb_food-menu">
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Caesars Salad</h3>
						<p class="mb-0">Romaine lettuce, croutons, and grated cheese</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>22.95</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Garden Salad</h3>
						<p class="mb-0">Mixed greens, tomato, cucumber &amp; black olives</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>11.50</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Baby Greens</h3>
						<p class="mb-0">Mixed greens, fresh mozzarella, tomato &ampl toasted peppers</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>14.35</span></div>
					</div>
				  </li>
				  <li>
					<div class="row">
					  <div class="col-lg-10">
						<h3 class="pb_font-18 font-weight-bold">Cold Antipasto</h3>
						<p class="mb-0">Romaine lettuce, croutons, and grated cheese</p>
					  </div>
					  <div class="col-lg-2"><span class="price"><sup>$</sup>15.50</span></div>
					</div>
				  </li>
				</ul>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->

<section class="pb_md_py_cover text-center cover-bg-black cover-bg-opacity-4" style="background-image: url(images/restaurant/1900x1200/img_1.jpg)" id="section-home">
  <div class="container">
	<div class="row align-items-center justify-content-center">
	  <div class="col-md-9  order-md-1">
		<h2 class="heading mb-3">Delicious &amp; Nutritious</h2>
		<p class="sub-heading">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->

<section class="pb_section" id="section-gallery">
  <div class="container">
	<div class="row justify-content-center mb-5">
	  <div class="col-md-10 text-center">
		<h2 class="mb-4 text-uppercase pb_letter-spacing-2">Gallery</h2>
	  </div>
	</div>
	<div class="row">
	  <div class="col">
		<div class="card-columns">
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/800x975/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/800x975/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/800x975/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/800x975/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/1900x1200/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/1900x1200/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/800x975/img_2.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/800x975/img_2.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/1900x1200/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/1900x1200/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/800x975/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/800x975/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/800x975/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/800x975/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>

		  <div class="card border-0 mb-4">
			<a href="images/restaurant/800x975/img_2.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/800x975/img_2.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		  <div class="card border-0 mb-4">
			<a href="images/restaurant/1900x1200/img_1.jpg" class="pb_hover-zoom image-popup">
			  <img class="img-fluid" src="images/restaurant/1900x1200/img_1.jpg" alt="Image caption here">
			  <i class="ion-ios-search-strong icon"></i>
			</a>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->
<section class="pb_section cover-bg-cyan cover-bg-opacity-3">
  <div class="container">
	 <div class="row justify-content-center mb-5">
	  <div class="col-md-10 text-center">
		<h2 class="mb-4 text-uppercase pb_letter-spacing-2">What People Says...</h2>
	  </div>
	</div>
	<div class="row">
	  <div class="col-md">
		<div class="media d-block text-center testimonial_v1 pb_quote_v1">
		  <div class="media-body">
			<div class="quote pb_text-black">&ldquo;</div>
			<blockquote class="mb-5 pb_font-20">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</blockquote>
			<img class="d-flex text-center mx-auto mb-3 rounded-circle" src="images/persons/person_1.jpg" alt="Generic placeholder image">
			<h3 class="heading">Garry Alexander</h3>
			<p class="subheading">@garry</p>
		  </div>
		</div>
	  </div>
	  <div class="col-md">
		<div class="media d-block text-center testimonial_v1 pb_quote_v1">
		  <div class="media-body">
			<div class="quote pb_text-black">&ldquo;</div>
			<blockquote class="mb-5 pb_font-20">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</blockquote>
			<img class="d-flex text-center mx-auto mb-3 rounded-circle" src="images/persons/person_5.jpg" alt="Generic placeholder image">
			<h3 class="heading">Deborah Smith</h3>
			<p class="subheading">@deborah</p>

		  </div>
		</div>
	  </div>
	  <div class="col-md">
		<div class="media d-block text-center testimonial_v1 pb_quote_v1">

		  <div class="media-body">
			<div class="quote pb_text-black">&ldquo;</div>
			<blockquote class="mb-5 pb_font-20">Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</blockquote>
			<img class="d-flex text-center mx-auto mb-3 rounded-circle" src="images/persons/person_2.jpg" alt="Generic placeholder image">
			<h3 class="heading">James Robertson</h3>
			<p class="subheading">@james</p>

		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->
<section class="pb_md_py_cover text-center cover-bg-black cover-bg-opacity-4" style="background-image: url(images/restaurant/1900x1200/img_1.jpg)" id="section-home">
  <div class="container">
	<div class="row align-items-center justify-content-center">
	  <div class="col-md-9  order-md-1">
		<h2 class="heading mb-3">Good Food, Good Taste</h2>
		<p class="sub-heading">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->
<section class="pb_section bg-light" id="section-events">
  <div class="container">
	<div class="row justify-content-center mb-5">
	  <div class="col-md-10 text-center">
		<h2 class="mb-4 text-uppercase pb_letter-spacing-2">Events</h2>
	  </div>
	</div>
	<div class="row">
	  <div class="card-deck">
		<div class="card border-0">
		  <img class="card-img-top" src="images/restaurant/1900x1200/img_1.jpg" alt="Image caption here">
		  <div class="card-body pb_p-40">
			<small class="text-uppercase pb_color-dark-opacity-3 font-weight-bold">December 2nd, 2017</small>
			<h4 class="card-title"><a href="#" class="text-danger">Thanksgiving and Reflections</a></h4>
			<p class="card-text">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. .</p>
		  </div>
		</div>
		<div class="card border-0">
		  <img class="card-img-top" src="images/restaurant/1900x1200/img_1.jpg" alt="Image caption here">
		  <div class="card-body pb_p-40">
			<small class="text-uppercase pb_color-dark-opacity-3 font-weight-bold">December 10th, 2017</small>
			<h4 class="card-title"><a href="#" class="text-danger">Maker of Monday</a></h4>
			<p class="card-text">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
		  </div>
		</div>
		<div class="card border-0">
		  <img class="card-img-top" src="images/restaurant/1900x1200/img_1.jpg" alt="Image caption here">
		  <div class="card-body pb_p-40">
			<small class="text-uppercase pb_color-dark-opacity-3 font-weight-bold">December 23rd, 2017</small>
			<h4 class="card-title"><a href="#" class="text-danger">Family and Kids Promo</a></h4>
			<p class="card-text">It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</section>
<!-- END section -->

<!-- Modal -->
<div class="modal fade" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-4 bg-image" style="background-image: url(images/bg_3.jpg);"></div>
          <div class="col-lg-8 p-5">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <small>CLOSE </small><span aria-hidden="true">&times;</span>
            </button>
            <h1 class="mb-4">Reserve A Table</h1>
            <form action="index.php" method="post">
              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="m_fname">First Name</label>
                  <input type="text" class="form-control" id="m_fname" name="first_name" required>
                </div>
                <div class="col-md-6 form-group">
                  <label for="m_lname">Last Name</label>
                  <input type="text" class="form-control" id="m_lname" name="last_name" required>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label for="m_email">Address</label>
                  <input type="text" class="form-control" id="m_email" name="address" required>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="m_phone">Phone</label>
                  <input type="text" class="form-control" id="m_phone" name="phone_no" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 form-group">
                  <label for="m_date">Date</label>
                  <input type="date" class="form-control" id="m_date" name="order_date" required>
                </div>
                <div class="col-md-6 form-group">
                  <label for="m_time">Time</label>
                  <input type="time" class="form-control" id="m_time" name="order_time" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 form-group">
                  <input type="submit" class="btn btn-primary btn-lg btn-block" name="submit" value="Reserve Now">
                </div>
              </div>

            </form>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- END Modal -->

<footer class="pb_footer bg-light" role="contentinfo">
  <div class="container">
	<div class="row">
	  <div class="col text-center">
		<p><a href="http://www.beian.miit.gov.cn/">蜀ICP备20007101号</p>
	  </div>
	</div>
  </div>
</footer>


<!-- loader -->
<div id="pb_loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#FDA04F"/></svg></div>


<script src="js/jquery.min.js"></script>

<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/jquery.mb.YTPlayer.min.js"></script>

<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>

<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>


<script src="js/main.js"></script>

</body>
</html>
