public class Collider {
    public PVector position;

    public PVector topLeft, topRight, bottomLeft, bottomRight;
    public PVector topMid, bottomMid, leftMid, rightMid;

    public PVector[] points;
    
    public Collider (float x, float y, float w, float h) {
        this.position = new PVector(x, y);
        setPoints(x, y, w, h);
    }

    private void setPoints(float x, float y, float w, float h) {
        this.topLeft = new PVector(x, y);
        this.topRight = new PVector(x + w, y);
        this.bottomLeft = new PVector(x, y + h);
        this.bottomRight = new PVector(x + w, y + h);

        this.topMid = new PVector(x+w/2, y);
        this.bottomMid = new PVector(x+w/2, y+h);
        this.leftMid = new PVector(x, y+h/2);
        this.rightMid = new PVector(x+w, y+h/2);
        
        this.points = new PVector[8];
        this.points[0] = this.topLeft;
        this.points[1] = this.topRight;
        this.points[2] = this.bottomLeft;
        this.points[3] = this.bottomRight;
        this.points[4] = this.topMid;
        this.points[5] = this.bottomMid;
        this.points[6] = this.leftMid;
        this.points[7] = this.rightMid;
    }

    public boolean collideWith(Collider other) {
        for (PVector point: other.points) {
            if (collidePoint(point)) {
                return true;
            }
        }
        return false;
    }

    public boolean collidePoint(PVector point) {
        if (point.x > this.topLeft.x && point.x < this.topRight.x) {
            if (point.y > this.topLeft.y && point.y < this.bottomLeft.y) {
                return true;
            }
        }
        return false;
    }

    public void move(float xVel, float yVel) {
        this.position.add(new PVector(xVel, yVel));
        for (PVector point: this.points) {
            point.add(new PVector(xVel, yVel));
        }
    }

    public void moveTo(float x, float y) {
        this.position = new PVector(x, y);
        for (PVector point: this.points) {
            point = new PVector(x, y);
        }
    }

    public void update() {
        
    }

    public void drawHitBox() {
        
    }
}