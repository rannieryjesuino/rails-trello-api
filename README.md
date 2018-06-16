# ENDPOINTS E PARAMETROS

## Boards (Quadros)

- GET /v1/boards (index)
- GET /v1/boards/id (show)
- POST /v1/boards (create)
  - board[name]
- PATCH/PUT /v1/boards/id (update)
  - board[name]
- DELETE /v1/boards/id (destroy)

## Lists (Listas)

- GET /v1/lists (index)
- GET /v1/lists/id (show)
- POST /v1/lists (create)
  - list[name]
  - list[board_id]
- PATCH/PUT /v1/lists/id (update)
  - list[name]
  - list[board_id]
- DELETE /v1/lists/id (destroy)
  - list_id (*Opcional*; ID da List para qual devem ser transferidas as atividades;
    Deve ser uma List dentro da mesma Board.)

## Cards (Atividades)

- GET /v1/cards (index)
- GET /v1/cards/id (show)
- POST /v1/cards (create)
  - card[name]
  - card[desc]
  - card[list_id]  
- PATCH/PUT /v1/cards/id (update)
  - card[name]
  - card[desc]
  - card[list_id] (List de destino deve estar dentro da mesma board que a List de antes.)
- DELETE /v1/cards/id (destroy)
