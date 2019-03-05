<html>
<head>
    <title></title>
    <link rel="shortcut icon" type="image/x-icon" href="https://dg8me5cc8ch23.cloudfront.net/img/favicon.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <script>
        function toggle(id) {
            var colors = 'ABCDE';
            var currentColor = $('img#' + id).attr('src').charAt(0);
            var currentIndex = colors.indexOf(currentColor);
            var nextColorIndex = (currentIndex == colors.length - 1) ? 0 : currentIndex + 1;
            var nextColor = colors.charAt(nextColorIndex);

            $('img#' + id).attr('src', nextColor + ".png");
        }

        function validate() {
            var validationString = '';
            for (var i = 0; i < 5; i++) {
                validationString += getColorCode(i + 1);
            }

            var validationRequest = {colors: validationString};

            $.ajax({
                        type: 'POST',
                        url: "http://localhost:8319/validate",
                        data: JSON.stringify(validationRequest),
                        dataType: 'json',
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        }
                    }
            ).done(function (data) {
                $('#validation-result').html(data.result);
            });
        }

        function getColorCode(id) {
            return $('img#' + id).attr('src').charAt(0);
        }
    </script>
    <style>
        .image {
            border-radius: 50%;
            cursor: pointer;
        }

        .row {
            margin: 120px;
        }

        .col {
            text-align: center;
        }

        #validate {
            font-size: 24px;
            background-color: #213f75;
            cursor: pointer;
            padding: 10px 80px;
            color: white;
        }

        #validation-result {
            font-size: 24px;
        }

        body {
            background-color: #8fabde;
        }
    </style>
</head>
<body>


<div class="row">
    <div class="col">
        <img class="image" id="1" src="A.png" onclick="toggle(1)"/>
    </div>
    <div class="col">
        <img class="image" id="2" src="B.png" onclick="toggle(2)"/>
    </div>
    <div class="col">
        <img class="image" id="3" src="C.png" onclick="toggle(3)"/>
    </div>
    <div class="col">
        <img class="image" id="4" src="D.png" onclick="toggle(4)"/>
    </div>
    <div class="col">
        <img class="image" id="5" src="E.png" onclick="toggle(5)"/>
    </div>
</div>
<div class="row">
    <div class="col">
        <span id="validate" onclick="validate()">Check</span>
    </div>
</div>
<div class="row">
    <div class="col">
        <span id="validation-result"></span>
    </div>
</div>
</body>
</html>