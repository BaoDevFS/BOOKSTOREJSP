package vn.edu.nlu.tools;

public class Pagination {
    private int totalItems;
    private int totalItemPerPage;
    private int pageRange;
    private int totalPage;
    private int currentPage;

    public Pagination() {
    }

    public Pagination(int totalItems, int totalItemPerPage, int pageRange, int currentPage) {
        this.totalItems = totalItems;
        this.totalItemPerPage = totalItemPerPage;
        pageRange = (pageRange % 2 == 0 ) ? pageRange++ : pageRange;
        this.pageRange = pageRange;
        this.totalPage = (pageRange/2 !=0)?(int) (Math.ceil(this.totalItems / this.totalItemPerPage))+1:(int) Math.ceil(this.totalItems / this.totalItemPerPage);
//      tra ve giá trị kép nhỏ nhất (gần nhất với vô cực âm) lớn hơn hoặc bằng đối số và bằng một số nguyên toán học
        this.currentPage = currentPage;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(int totalItems) {
        this.totalItems = totalItems;
    }

    public int getTotalItemPerPage() {
        return totalItemPerPage;
    }

    public void setTotalItemPerPage(int totalItemPerPage) {
        this.totalItemPerPage = totalItemPerPage;
    }

    public int getPageRange() {
        return pageRange;
    }

    public void setPageRange(int pageRange) {
        this.pageRange = pageRange;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String showPagination(String link) {
        String pagination = "";
        String pre = "";
        String next = "";
        String listPages = "";
        if (this.totalPage > 1 ) {
            if (this.currentPage > 1) {
                pre = "<li><a href=\"" + link + "page=" + (this.currentPage - 1) + "\"><<</a></li>";
            }
            next = "<li><a >>></a></li>";
            if (this.currentPage < this.totalPage) {
                next = "<li><a a href=\"" + link + "page=" + (this.currentPage + 1) + "\">>></a></li>";
            }
            int start;
            int end;
            if (this.pageRange < this.totalPage) {
                start = this.currentPage - (this.pageRange - 1) / 2;
                end = this.currentPage + (this.pageRange - 1) / 2;
                if( start < 1){
                    start=1;
                    end= this.pageRange;
                }else if(end > this.totalPage){
                    start = this.totalPage- this.pageRange +1;
                     end= this.totalPage;
                }
            } else {
                start = 1;
                end = this.totalPage;
            }
            for (int i = start; i <= end; i++) {
                if (this.currentPage == i) {
                    listPages += "<li><a class=\"active\">" + i + "</a></li>";
                } else {
                    listPages += "<li><a  href=\"" + link + "page=" + i + "\">" + i + "</a></li>";
                }
            }
            pagination = "<ul class=\"wn__pagination\">" + pre + listPages + next + "</ul>";
        }
        return pagination;
    }
}
