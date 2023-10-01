---
marp: true
theme: uncover
paginate: true
header: Refactoring hundred of environments with TF - Carlos Angulo
footer: Serverless Barcelona Meetup
---

<!--
_class: invert
-->

# **Refactoring 💯 of environments with TF**

1. **About me**
2. **Goal**
3. **Problem**
4. **What do we need?**
5. **Our solution**

![bg opacity:25%](https://secure.meetupstatic.com/photos/event/c/1/9/4/600_478429556.jpeg)

---


# **About me**

- I am Carlos Angulo
- I work at [Ohpen](https://www.ohpen.com) as a Platform Engineer
- I have more than 7 years of experience
- You can find me on [LinkedIn](www.linkedin.com/in/angulomascarell) or [GitHub](https://github.com/cangulo)

![bg right:30% w:60% vertical](assets/imgs/profile_medium.png)
![bg right:30% w:60% vertical](assets/imgs/linkedin-qr-code.jpeg)

---

# **Goal**

We want to refactor and simplify a terraform solution. _How would you tackle this ? 🤔_

**demo time🧑‍💻**

![bg right:40% w:120% ](assets/imgs/initial-lambdas-code.png)

---

# **Problem**

* We edit the code and we perform a terraform plan to ensure our changes do what we expect. 📜
* If we have 3 environments, we check 3 terraform plans. But, what if we have hundreds of environments? 💯

![bg right:30% w:80% vertical](assets/imgs/slide-4-problem.png)

---

# **What do we need?**

* We need to aggregate all the environments changes so it is easy for us to know how our changes affect them.

![bg right:30% w:80% vertical](assets/imgs/tf-plan-summary-1.png)
![bg right:30% w:80% ](assets/imgs/tf-plan-summary-2.png)
![bg right:30% w:80% ](assets/imgs/tf-plan-summary-3.png)
![bg right:30% w:80% ](assets/imgs/tf-plan-summary-4.png)

---

# **Our solution**

- We end up creating a open source GH action for it:
  - [terraform-plan-summarize-gh-action](https://github.com/ohpensource/terraform-plan-summarize-gh-action)


![bg right:40% w:90% vertical](assets/imgs/tf-plan-summary-aggregated.png)


---

# **Questions?**

