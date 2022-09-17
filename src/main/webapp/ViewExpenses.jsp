<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous"
    />

    <script
      src="https://kit.fontawesome.com/4f128951c5.js"
      crossorigin="anonymous"
    ></script>
    <title>Document</title>
    <style>
      .heading {
        width: 60%;
      }
      .v-hide {
        visibility: hidden;
      }
      .bg-odd {
        background-color: #dee3f1;
      }
      .cat-1 {
        background-color: #ff63b1;
      }
      .cat-2 {
        background-color: #28d5b8;
      }
      .cat-3 {
        background-color: #c5ae69;
      }
      .title {
        background-color: #2b3153;
      }
    </style>
  </head>
  <body
    class="bg-light mt-3 d-flex justify-content-center mb-5"
    style="overflow-y: hidden"
  >
    <div class="col-5 px-3">
      <form action="">
        <div>
          <span class="fs-1 fw-semibold p-0">New Expense</span>
        </div>

        <div class="mb-2 row pt-3 ps-4">
          <label for="inputPassword" class="col-3 col-form-label fw-semibold"
            >Title
          </label>
          <div class="col-9">
            <input
              type="text"
              class="form-control bg-transparent"
              id="inputPassword"
            />
          </div>
        </div>

        <div class="mb-2 row pt-3 ps-4">
          <label for="inputPassword" class="col-3 col-form-label fw-semibold"
            >Description
          </label>
          <div class="col-9">
            <input
              type="text"
              class="form-control bg-transparent"
              id="inputPassword"
            />
          </div>
        </div>

        <div class="mb-2 row pt-3 ps-4">
          <label for="inputPassword" class="col-3 col-form-label fw-semibold"
            >Date
          </label>
          <div class="col-9">
            <input
              type="date"
              class="form-control bg-transparent"
              id="inputPassword"
            />
          </div>
        </div>

        <div class="mb-2 row pt-3 ps-4">
          <label for="inputPassword" class="col-3 col-form-label fw-semibold"
            >Expected
          </label>
          <div class="col-9">
            <input
              type="text"
              class="form-control bg-transparent"
              id="inputPassword"
            />
          </div>
        </div>

        <div class="mb-2 row pt-3 ps-4">
          <label for="inputPassword" class="col-3 col-form-label fw-semibold"
            >Actual
          </label>
          <div class="col-9">
            <input
              type="text"
              class="form-control bg-transparent"
              id="inputPassword"
            />
          </div>
        </div>

        <div class="mb-2 row pt-3 ps-4">
          <label for="inputPassword" class="col-3 col-form-label fw-semibold"
            >Difference
          </label>
          <div class="col-9">
            <input
              type="text"
              class="form-control bg-transparent"
              id="inputPassword"
            />
          </div>
        </div>

        <div class="mt-5 d-flex justify-content-end">
          <input type="reset" value="Clear"  class="btn btn-secondary me-3 px-4" />
          <input type="submit" value="Save" class="btn btn-primary px-4" />
        </div>
      </form>
    </div>
    <div class="col-7 border p-3 vh-100" style="overflow-y: scroll">
      <div class="d-flex ps-3 py-4 title text-light">
        <div class="col-6 fs-1 fw-bold">Monthly Expenses</div>

        <div class="col"></div>
        <div class="col-3 d-flex align-items-center me-3 pt-2">
          <div class="input-group d-flex justify-content-end">
            <button
              class="btn btn-outline-secondary dropdown-toggle text-light w-100 d-flex justify-content-between align-items-center"
              type="button"
              data-bs-toggle="dropdown"
            >
              Select Month
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item">Action</a></li>
              <li><a class="dropdown-item">Another action</a></li>
              <li><a class="dropdown-item">Something else here</a></li>
              <li><a class="dropdown-item">Separated link</a></li>
            </ul>
          </div>

          <!-- <span class="text-nowrap me-3">Month : </span>
            <select name="" id="" class="form-control bg-transparent text-light mt-1">
                <option value="January">January</option>
            </select> -->
        </div>
      </div>
      <div class="col-12 d-flex cat-1 text-end fs-6 fw-semibold">
        <div class="py-1 col-3 ps-3 text-start">Expense type</div>
        <div class="py-1 ps-3 text-start">Date</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
        <div class="py-1 pe-3 col-2">
            
        </div>
      </div>

      <div class="col-12 d-flex text-end">
        <div class="py-1 col ps-3 col-3 text-start">Expense type</div>
        <div class="py-1 ps-3 text-start">Date</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
        <div class="py-1 pe-3 col-2">
            <a href="#" class="me-3"><i class="fa-solid fa-pen-to-square"></i></a>
            <a href="#" ><i class="fa-sharp fa-solid fa-trash text-danger"></i></a>
        </div>
      </div>

      <div class="col-12 d-flex text-end bg-odd">
        <div class="py-1 col ps-3 col-3 text-start">Expense type</div>
        <div class="py-1 ps-3 text-start">Date</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
        <div class="py-1 pe-3 col-2">
            <a href="#" class="me-3"><i class="fa-solid fa-pen-to-square"></i></a>
            <a href="#" ><i class="fa-sharp fa-solid fa-trash text-danger"></i></a>
        </div>
      </div>


      <div class="col-12 d-flex text-end">
        <div class="py-1 col ps-3 col-3 text-start">Expense type</div>
        <div class="py-1 ps-3 text-start">Date</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
        <div class="py-1 pe-3 col-2">
            <a href="#" class="me-3"><i class="fa-solid fa-pen-to-square"></i></a>
            <a href="#" ><i class="fa-sharp fa-solid fa-trash text-danger"></i></a>
        </div>
      </div>

      <div class="col-12 d-flex text-end bg-odd">
        <div class="py-1 col ps-3 col-3 text-start">Expense type</div>
        <div class="py-1 ps-3 text-start">Date</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
        <div class="py-1 pe-3 col-2">
            <a href="#" class="me-3"><i class="fa-solid fa-pen-to-square"></i></a>
            <a href="#" ><i class="fa-sharp fa-solid fa-trash text-danger"></i></a>
        </div>
      </div>


      <div class="col-12 d-flex">
        <div class="py-1 col ps-3 col-6 v-hide">empty</div>
      </div>

      <div class="col-12 d-flex bg-odd">
        <div class="py-1 col ps-3 col-6 v-hide">empty</div>
      </div>

      <!-- second category -->
      <div class="col-12 d-flex cat-2 text-end fs-6 fw-semibold">
        <div class="py-1 col-6 ps-3 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>
      <div class="col-12 d-flex text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex bg-odd text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex bg-odd text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>
      <div class="col-12 d-flex">
        <div class="py-1 col ps-3 col-6 v-hide">empty</div>
      </div>

      <div class="col-12 d-flex bg-odd">
        <div class="py-1 col ps-3 col-6 v-hide">empty</div>
      </div>

      <!-- second category -->
      <div class="col-12 d-flex cat-3 text-end fs-6 fw-semibold">
        <div class="py-1 col-6 ps-3 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex bg-odd text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex bg-odd text-end">
        <div class="py-1 col ps-3 col-6 text-start">Expense type</div>
        <div class="py-1 pe-3 col-2">Expected</div>
        <div class="py-1 pe-3 col-2">Actual</div>
        <div class="py-1 pe-3 col-2">Difference</div>
      </div>

      <div class="col-12 d-flex">
        <div class="py-1 col ps-3 col-6 v-hide">empty</div>
      </div>

      <div class="col-12 d-flex text-end bg-odd">
        <div class="py-3 col ps-3 col-6 fw-bold text-start">Total</div>
        <div class="py-3 pe-3 col-2 fw-bold">5454.55</div>
        <div class="py-3 pe-3 col-2 fw-bold">56464.54</div>
        <div class="py-3 pe-3 col-2 fw-bold">5452.12</div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
