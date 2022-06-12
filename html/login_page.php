<div class="xx">
    <div>
        <h3>:)</h3>
    </div>
    <hr>
    <div>
        <form action="/login.php" method="post">
            <div class="inp_sec">
                <label for="account">帳號 </label>
                <input type="text" id="account" name="account">
            </div>
            <div class="inp_sec">
                <label for="password">密碼</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="inp_sec">
                <label for="identity">身分別</label>
                <select name="identity" id="indentity">
                    <option value="student">學生</option>
                    <option value="staff">職員</option>
                </select>
            </div>
            <div class="inp_sec">
                <input type="submit" class="a_btn" value="登入">
                <a class="a_btn" href="/logout.php">登出</a>
            </div>
        </form>
    </div>
</div>
