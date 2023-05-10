using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BirdScript : MonoBehaviour
{
  public Rigidbody2D rb;
  public float jumpForce = 10;
  public LogicScript logic;
  public bool birdIsAlive = true;

  // Start is called before the first frame update
  void Start()
  {
    this.logic = this.getLogic();
  }

  // Update is called once per frame
  void Update()
  {
    if (Input.GetKeyDown(KeyCode.Space) && this.birdIsAlive)
    {
      Jump();
    }
  }

  private void Jump()
  {
    rb.velocity = Vector2.up * jumpForce;
  }

  private void OnCollisionEnter2D(Collision2D collision)
  {
    this.logic.finish();
    this.birdIsAlive = false;
  }

  /// Retrieves the Logic component from the Logic GameObject in runtime
  // it alows to access the public methods and properties of the Logic class
  private LogicScript getLogic()
  {
    return GameObject.FindGameObjectWithTag("Logic").GetComponent<LogicScript>();
  }
}
