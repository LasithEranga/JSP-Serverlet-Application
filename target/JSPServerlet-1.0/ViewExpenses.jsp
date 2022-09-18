<%@page import="java.util.List"%>
<%@page import="Model.Expense"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="icon" type="image/x-icon" href="./logo.svg">
        <title>Expense Tracker</title>
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
    <body class="bg-light mt-3 d-flex justify-content-center mb-5" style="overflow-y: hidden">
        <%
            //all expenses 
            ArrayList<Expense> expenses = (ArrayList<Expense>) request.getAttribute("expenses");
            //one expense for editing
            List<Expense> expense = new ArrayList();
            expense = (ArrayList<Expense>) request.getAttribute("expense");
            boolean edit = false;
            String category = "";
            if(expense != null){
                edit = true;
                category = expense.get(0).getCategory();
            }
            double totalExpected = 0;
            double totalActual = 0;
            double totalDifference = 0;

        %>


        <div class="col-4 px-3">
            <form action="/JSPServerlet/<%= edit ? "edit" : "new" %>" method="POST" id="form">
                <input type="text" name="id" hidden value="<%= edit ? expense.get(0).getId():"" %>"/>
                <div>
                    <span class="fs-1 fw-semibold p-0">New Expense</span>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="title" class="col-3 col-form-label fw-semibold"> Title </label>
                    <div class="col-9">
                        <input type="text" class="form-control bg-transparent" id="title" name="title" value="<%= edit ? expense.get(0).getTitle():"" %>" />
                    </div>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="description" class="col-3 col-form-label fw-semibold">Description
                    </label>
                    <div class="col-9">
                        <input type="text" class="form-control bg-transparent" id="description" name="description" value="<%= edit ? expense.get(0).getDescription():""%>"/>
                    </div>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="date" class="col-3 col-form-label fw-semibold">Date</label>
                    <div class="col-9">
                        <input type="date" class="form-control bg-transparent" id="date" name="date" value="<%= edit ? expense.get(0).getDate():""%>"/>
                    </div>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="date" class="col-3 col-form-label fw-semibold">Category</label>
                    <div class="col-9">
                        <select class="form-control bg-transparent" name="category">
                            <option value="House" <%= category.equals("House") ? "selected" : "" %> >House</option>
                            <option value="Work" <%= category.equals("Work") ? "selected" : "" %> > Work</option>
                            <option value="Personal" <%= category.equals("Personal") ? "selected" : "" %>>Personal</option>
                        </select>
                    </div>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="expected" class="col-3 col-form-label fw-semibold">Expected </label>
                    <div class="col-9">
                        <input type="text" class="form-control bg-transparent" id="expected" onchange="onChangeAmount()" name="expected_amount" value="<%= edit ? expense.get(0).getExpectedAmount():""%>"/>
                    </div>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="actual" class="col-3 col-form-label fw-semibold">Actual</label>
                    <div class="col-9">
                        <input type="text" class="form-control bg-transparent" id="actual" onchange="onChangeAmount()"  name="actual_amount" value="<%= edit ? expense.get(0).getActualAmount():""%>"/>
                    </div>
                </div>

                <div class="mb-2 row pt-3 ps-4">
                    <label for="difference" class="col-3 col-form-label fw-semibold" >Difference
                    </label>
                    <div class="col-9">
                        <input type="text" class="form-control bg-transparent" id="difference" readonly="true" name="difference" value="<%= edit ? expense.get(0).getDifference():"" %>" />
                    </div>
                </div>

                <div class="mt-5 d-flex justify-content-end">
                    <input type="reset" value="Clear"  class="btn btn-secondary me-3 px-4" />
                    <input type="submit" value="<%= edit ? "Update" : "Save" %>" id="btnSubmit" class="btn btn-primary px-4" />
                </div>
            </form>
        </div>



        <div class="col-8 border p-3 vh-100" style="overflow-y: scroll">
            <div class="d-flex ps-3 py-4 title text-light">
                <div class="col-6 fs-1 fw-bold">Monthly Expenses</div>

                <div class="col"></div>
                <div class="col-3 d-flex align-items-center me-3 pt-2">
                    <div class="input-group d-flex justify-content-end">
                        <button
                            class="btn btn-outline-secondary dropdown-toggle text-light w-100 d-flex justify-content-between align-items-center"
                            type="button"
                            data-bs-toggle="dropdown">
                            Select Month
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=01">January</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=02">February</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=03">March</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=04">April</a></li>                            <li><a class="dropdown-item" href="/JSPServerlet/?month=04">April</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=05">May</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=06">June</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=07">July</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=08">August</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=09">September</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=10">October</a></li>                            <li><a class="dropdown-item" href="/JSPServerlet/?month=04">October</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=11">November</a></li>
                            <li><a class="dropdown-item" href="/JSPServerlet/?month=12">December</a></li>


                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-12 d-flex cat-1 text-end fs-6 fw-semibold">
                <div class="py-1  col-3 ps-1 text-start">House Expenses</div>
                <div class="py-1  col-1 text-start">Date</div>
                <div class="py-1  col-2">Expected</div>
                <div class="py-1  col-2">Actual</div>
                <div class="py-1  col-2">Difference</div>
                <div class="py-1  col-2 pe-3"> Actions </div>
            </div>


            <!-- rendering array for cat one-->
            <%  if (expenses.size() > 0) {
                    int rowStyler = 0;
                    for (int i = 0; i < expenses.size(); i++) {
                        if (expenses.get(i).getCategory().equals("House")) {
                            rowStyler++;
                            totalActual += expenses.get(i).getActualAmount();
                            totalDifference += expenses.get(i).getDifference();
                            totalExpected += expenses.get(i).getExpectedAmount();

            %>
            <div class="col-12 d-flex text-end <%= rowStyler % 2 == 0 ? "" : "bg-odd"%>">
                <div class="py-1 ps-1 col-3 text-start"><%= expenses.get(i).getTitle()%></div>
                <div class="py-1  col-1 text-start"><%= expenses.get(i).getDate()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getExpectedAmount()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getActualAmount()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getDifference()%></div>
                <div class="py-1 pe-3 col-2 d-flex justify-content-end">
                    <form action="/JSPServerlet/edit" method="GET"><input name="expense_id" value="<%= expenses.get(i).getId()%>" hidden=""/><button type="submit" class="bg-transparent border-0 me-3"><i class="fa-solid fa-pen-to-square text-primary"></i></button></form>
                    <form action="/JSPServerlet/delete" method="POST"><input name="expense_id" value="<%= expenses.get(i).getId()%>" hidden=""/><button type="submit" class="bg-transparent border-0 "><i class="fa-sharp fa-solid fa-trash text-danger"></i></button></form>
                </div>
            </div>
            <%
                    }

                }
            %>
            <div class="col-12 d-flex <%= rowStyler % 2 == 0 ? "bg-odd" : ""%>">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>

            <div class="col-12 d-flex <%= rowStyler % 2 == 0 ? "" : "bg-odd"%>"">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>
            <%
            } else {
            %>
            <div class="col-12 d-flex">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>

            <div class="col-12 d-flex bg-odd">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>
            <%
                }


            %>

            <!-- end of rendering array for cat one-->



            <div class="col-12 d-flex cat-2 text-end fs-6 fw-semibold">
                <div class="py-1  col-3 ps-1 text-start">Personal Expenses</div>
                <div class="py-1  col-1 text-start">Date</div>
                <div class="py-1  col-2">Expected</div>
                <div class="py-1  col-2">Actual</div>
                <div class="py-1  col-2">Difference</div>
                <div class="py-1  col-2 pe-3"> Actions </div>
            </div>

            <!-- rendering array for cat two-->
            <%  if (expenses.size() > 0) {
                    int rowStyler = 0;
                    for (int i = 0; i < expenses.size(); i++) {
                        if (expenses.get(i).getCategory().equals("Personal")) {
                            rowStyler++;
                            totalActual += expenses.get(i).getActualAmount();
                            totalDifference += expenses.get(i).getDifference();
                            totalExpected += expenses.get(i).getExpectedAmount();


            %>
            <div class="col-12 d-flex text-end <%= rowStyler % 2 == 0 ? "" : "bg-odd"%>">
                <div class="py-1 ps-1 col-3 text-start"><%= expenses.get(i).getTitle()%></div>
                <div class="py-1  col-1 text-start"><%= expenses.get(i).getDate()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getExpectedAmount()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getActualAmount()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getDifference()%></div>
                <div class="py-1 pe-3 col-2 d-flex justify-content-end">
                    <form action="/JSPServerlet/edit" method="GET"><input name="expense_id" value="<%= expenses.get(i).getId()%>" hidden=""/><button type="submit" class="bg-transparent border-0 me-3"><i class="fa-solid fa-pen-to-square  text-primary"></i></button></form>
                    <form action="/JSPServerlet/delete" method="POST"><input name="expense_id" value="<%= expenses.get(i).getId()%>" hidden=""/><button type="submit" class="bg-transparent border-0 "><i class="fa-sharp fa-solid fa-trash text-danger"></i></button></form>

                </div>
            </div>
            <%
                    }

                }
            %>
            <div class="col-12 d-flex <%= rowStyler % 2 == 0 ? "bg-odd" : ""%>">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>

            <div class="col-12 d-flex <%= rowStyler % 2 == 0 ? "" : "bg-odd"%>"">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>
            <%
            } else {
            %>
            <div class="col-12 d-flex">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>

            <div class="col-12 d-flex bg-odd">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>
            <%
                }

            %>

            <!-- end of rendering array for cat two-->


            <div class="col-12 d-flex cat-2 text-end fs-6 fw-semibold">
                <div class="py-1  col-3 ps-1 text-start">Work Expenses</div>
                <div class="py-1  col-1 text-start">Date</div>
                <div class="py-1  col-2">Expected</div>
                <div class="py-1  col-2">Actual</div>
                <div class="py-1  col-2">Difference</div>
                <div class="py-1  col-2 pe-3"> Actions </div>
            </div>

            <!-- rendering array for cat three-->
            <%  if (expenses.size() > 0) {
                    int rowStyler = 0;
                    for (int i = 0; i < expenses.size(); i++) {

                        if (expenses.get(i).getCategory().equals("Work")) {
                            rowStyler++;
                            totalActual += expenses.get(i).getActualAmount();
                            totalDifference += expenses.get(i).getDifference();
                            totalExpected += expenses.get(i).getExpectedAmount();

            %>
            <div class="col-12 d-flex text-end <%= rowStyler % 2 == 0 ? "bg-odd" : ""%>">
                <div class="py-1 ps-1 col-3 text-start"><%= expenses.get(i).getTitle()%></div>
                <div class="py-1  col-1 text-start"><%= expenses.get(i).getDate()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getExpectedAmount()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getActualAmount()%></div>
                <div class="py-1  col-2"><%= expenses.get(i).getDifference()%></div>
                <div class="py-1 pe-3 col-2 d-flex justify-content-end">
                    <form action="/JSPServerlet/edit" method="GET"><input name="expense_id" value="<%= expenses.get(i).getId()%>" hidden=""/><button type="submit" class="bg-transparent border-0 me-3"><i class="fa-solid fa-pen-to-square text-primary"></i></button></form>
                    <form action="/JSPServerlet/delete" method="POST"><input name="expense_id" value="<%= expenses.get(i).getId()%>" hidden=""/><button type="submit" class="bg-transparent border-0 "><i class="fa-sharp fa-solid fa-trash text-danger"></i></button></form>

                </div>
            </div>
            <%
                    }

                }
            %>
            <div class="col-12 d-flex <%= rowStyler % 2 == 0 ? "" : "bg-odd"%>">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>

            <div class="col-12 d-flex <%= rowStyler % 2 == 0 ? "bg-odd" : ""%>"">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>
            <%
            } else {
            %>
            <div class="col-12 d-flex">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>

            <div class="col-12 d-flex bg-odd">
                <div class="py-1 col ps-3 col-6 v-hide">empty</div>
            </div>
            <%
                }


            %>

            <!-- end of rendering array for cat three-->



            <div class="border pb-3">

                <div class="col-12 d-flex text-end  py-1 ps-2 fw-bold">
                    <div class="py-1 ps-1 col-9 text-start">Total Expected Expense Amount</div>                
                    <div class="py-1 ps-1 col-3 text-end pe-1">Rs: <%= String.format("%.2f", totalExpected)%></div>

                </div>
                <div class="col-12 d-flex text-end  py-1 ps-2 fw-bold">
                    <div class="py-1 ps-1 col-9 text-start pe-1">Total Actual Expense Amount</div>
                    <div class="py-1 ps-1 col-3 text-end pe-1 " style=" border-bottom: 1px solid black;">Rs: <%= String.format("%.2f", totalActual)%></div>
                </div>
                <div class="col-12 d-flex text-end py-1 ps-2 fw-bold">
                    <div class="py-1 ps-1 col-9 text-start pe-1">Total Difference Amount</div>
                    <div class="py-1 ps-1 col-3 text-end pe-1" style=" border-style:double; border-top: 1px;border-left: 1px;border-right: 1px; ">Rs: <%= String.format("%.2f", totalDifference)%></div>
                </div>
            </div>
        </div>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"
    ></script>
    
    <script>
        const onChangeAmount = () => {
            let expectedAmount = document.getElementById("expected").value
            let actualAmount = document.getElementById("actual").value
            
            if(isFinite(expectedAmount) && isFinite(actualAmount)){
                document.getElementById("difference").value = expectedAmount - actualAmount;
            }

        }
    </script>
</body>
</html>
