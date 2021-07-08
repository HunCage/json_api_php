<?php

require "./vendor/autoload.php";

// Router - útvonalválasztó
// method, path

$dispatcher = FastRoute\simpleDispatcher(function (FastRoute\RouteCollector $r) {
    $r->addRoute('GET', '/', 'home');
    $r->addRoute('GET', '/api/instruments', 'getAllInstrumentsHandler');
    $r->addRoute('GET', '/api/instruments/{id}', 'getSingleInstrument');
    $r->addRoute('POST', '/api/instruments', 'createInstrument');
    $r->addRoute('PATCH', '/api/instruments/{id}', 'patchInstrument');
    $r->addRoute('DELETE', '/api/instruments/{id}', 'deleteInstrument');
});

function patchInstrument($vars)
{
    header('Content-type: application/json');
    $instrument = getInstrumentById($vars['id']);
    if (!$instrument) {
        http_response_code(404);
        echo json_encode(getNotFoundByIdError($vars['id']));
        return;
    }

    $body = json_decode(file_get_contents('php://input'), true);
    $pdo = getConnection();
    $statement = $pdo->prepare(
        "UPDATE `instruments` SET 
        `name` = ?,
        `description` = ?,
        `brand` = ?,
        `price` = ?,
        `quantity` = ?
        WHERE `id` = ?
        "
    );

    $statement->execute([
        $body['name'] ?? $instrument['name'],
        $body['description'] ?? $instrument['description'],
        $body['brand'] ?? $instrument['brand'],
        (int)($body['price'] ?? $instrument['price']),
        (int)($body['quantity'] ?? $instrument['quantity']),
        $vars['id']
    ]);

    $instrument = getInstrumentById($vars['id']);
    echo json_encode($instrument);
}

function deleteInstrument($vars)
{
    header('Content-type: application/json');

    $pdo = getConnection();
    $statement = $pdo->prepare("DELETE FROM instruments WHERE id = ?");
    $statement->execute([$vars['id']]);

    if (!$statement->rowCount()) {
        http_response_code(404);
        echo json_encode(getNotFoundByIdError($vars['id']));
        return;
    }

    echo json_encode(["id" => $vars['id']]);
}

function createInstrument($vars)
{
    header('Content-type: application/json');

    $body = json_decode(file_get_contents('php://input'), true);

    $pdo = getConnection();
    $statement = $pdo->prepare(
        "INSERT INTO `instruments` 
        (`name`, `description`, `brand`, `price`, `quantity`) 
        VALUES 
        (?, ?, ?, ?, ?)"
    );
    $statement->execute([
        $body['name'] ?? '',
        $body['description'] ?? '',
        $body['brand'] ?? '',
        (int)$body['price'] ?? null,
        (int)$body['quantity'] ?? null,
    ]);

    $id = $pdo->lastInsertId();
    $instrument = getInstrumentById($id);
    echo json_encode($instrument);
}

function home()
{
    require './build/index.html';
}

function notFoundHandler()
{
    require './build/index.html';
}

function getAllInstrumentsHandler($vars)
{
    header('Content-type: application/json');
    $pdo = getConnection();
    $statement = $pdo->prepare("SELECT * FROM instruments");
    $statement->execute();
    $instruments = $statement->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($instruments);
}

function getSingleInstrument($vars)
{
    header('Content-type: application/json');

    $instrument = getInstrumentById($vars['id']);

    if (!$instrument) {
        http_response_code(404);
        echo json_encode(getNotFoundByIdError($vars['id']));
        return;
    }

    echo json_encode($instrument);
}

function getNotFoundByIdError($id)
{
    return [
        'error' => [
            'id' => $id,
            'message' => 'invalid instrument id'
        ]
    ];
}

function getInstrumentById($id)
{
    $pdo = getConnection();
    $statement = $pdo->prepare("SELECT * FROM instruments WHERE id = ?");
    $statement->execute([$id]);
    return $statement->fetch(PDO::FETCH_ASSOC);
}

function getConnection()
{
    return new PDO(
        'mysql:host=' . $_SERVER['DB_HOST'] . ';dbname=' . $_SERVER['DB_NAME'],
        $_SERVER['DB_USER'],
        $_SERVER['DB_PASSWORD']
    );
}


// Fetch method and URI from somewhere
$httpMethod = $_SERVER['REQUEST_METHOD'];
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$routeInfo = $dispatcher->dispatch($httpMethod, $uri);
switch ($routeInfo[0]) {
    case FastRoute\Dispatcher::NOT_FOUND:
        notFoundHandler();
        // ... 404 Not Found
        break;
    case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
        $allowedMethods = $routeInfo[1];
        notFoundHandler();
        // ... 405 Method Not Allowed
        break;
    case FastRoute\Dispatcher::FOUND:
        $handler = $routeInfo[1];
        $vars = $routeInfo[2];
        // ... call $handler with $vars
        $handler($vars);
        break;
}
