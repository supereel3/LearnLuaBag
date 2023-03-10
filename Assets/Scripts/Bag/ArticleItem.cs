using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ArticleItem : MonoBehaviour
{
    #region 字段
    private Image articleSprite;
    private Text number;

    private Article article;

    private UIDrag uIDrag;

    private Canvas canvas;
    private int defaultSort;

    private Vector3 currentLocalPosition;
    private float moveOriginTimer;  //计时
    private float moveOriginTime = 0.2f;   //时间
    private bool isMovingOrigin = false;
    private Action onMoveEnd;

    #endregion 字段

    private void Awake()
    {
        articleSprite = transform.GetComponent<Image>();
        number = transform.Find("Text").GetComponent<Text>();
        uIDrag = transform.GetComponent<UIDrag>();
        uIDrag.onStartDrag += this.OnStartDrag;
        uIDrag.onDrag += this.OnDrag;
        uIDrag.onEndDrag += this.OnEndDrag;

        canvas = transform.GetComponent<Canvas>();
        defaultSort = canvas.sortingOrder;
        //Debug.Log("唤醒时articleSprite：" + articleSprite + " number：" + number);
    }

    private void Update()
    {
        //向原点移动
        MovingOrigin();
    }

    public void SetArticle(Article article)
    {
        this.article = article;

        // 显示数据
        articleSprite.sprite = Resources.Load<Sprite>(article.spritePath);
        number.text = article.count.ToString();
        //Debug.Log("设置时articleSprite.sprite：" + articleSprite.sprite + " number.text：" + number.text);
    }

    public void OnStartDrag()
    {
        canvas.sortingOrder = defaultSort + 1;
    }

    public void OnDrag()
    {
        
    }

    public void OnEndDrag()
    {
        //回到原点
        MoveToOrigin( () =>
        {
            //恢复层级
            canvas.sortingOrder = defaultSort;
        });
    }

    //正在向原点移动
    public void MovingOrigin()
    {
        if (isMovingOrigin)
        {
            moveOriginTimer += Time.deltaTime * (1 / moveOriginTime);   //Time.deltaTime是增量时间，(1/moveOriginTime)是1秒时间除以希望移动的时间，得到速度的倍率
            transform.localPosition = Vector3.Lerp(currentLocalPosition, Vector3.zero, moveOriginTimer);
            if (moveOriginTimer >= 1)
            {
                isMovingOrigin = false;
                if (onMoveEnd != null) { onMoveEnd(); }
            }
        }
    }

    public void MoveToOrigin(Action onMoveEnd)
    {
        isMovingOrigin = true;
        moveOriginTimer = 0;
        currentLocalPosition = transform.localPosition;
        this.onMoveEnd = onMoveEnd;
    }
}
