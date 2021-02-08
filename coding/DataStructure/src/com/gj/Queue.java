package com.gj;

public class Queue<E> {
    /**
     * 基于现有的数据结构(双向链表)实现Queue
     */
    private List<E> list = new LinkList<>();

    /***
     * Queue Size
     * @return
     */
    public int size() {
        return list.size();
    }

    /**
     * 是否为空
     * @return
     */
    public boolean isEmpty() {
        return list.isEmpty();
    }

    /**
     * 入队
     * @param element
     */
    public void enQueue(E element) {
        list.add(element);
    }

    /**
     * 出队
     * @return
     */
    public E deQueue() {
        return list.remove(0);
    }

    /**
     * 获取队列首元素
     * @return
     */
    public E front() {
        return list.get(0);
    }

}