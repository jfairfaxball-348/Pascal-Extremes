# Detailed prior-art audit — Stage 2

Date of audit: **2026-09-29**.

This is the second, theorem-level audit. It is a literature check, not a proof of historical uniqueness. The correct negative conclusion is only that **no equivalent result was located in the documented search**. The search must be repeated against the exact statements after the proof stage.

## 1. Statements being audited

For integers `m >= 2` and `N > m` with `m | N`, the project defines

\[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
\]

For a prime `p`,

\[
r_p(m)=\min\{r\ge 1:m<p^r\}.
\]

The candidate statements are:

- **Target A:** for prime `p`, `m >= 2`, and `p ∤ m`,
  \[
  \max_{N>m,\ m\mid N} v_p(G(N;m))=r_p(m).
  \]
- **Target B:** for prime `p` and integer `a >= 2`, with `m=p^a+1`,
  \[
  T_p(m)=p^{3a}+1,
  \]
  where `T_p(m)` is the least admissible row attaining the Target-A maximum.

The exceptional `a=1` observations are explicitly not part of Target B.

## 2. Exact equivalence with the existing `g(m,n)` family

Chai Wah Wu, *Computing the Greatest Common Divisor of Binomial Coefficients* `C(mn,mk)`, arXiv:2606.20940, defines for `n>1`

\[
g(m,n)=\gcd\left\{\binom{mn}{mk}:1\le k<n\right\}.
\]

This is **exactly the same family** as the project's `G(N;m)` after the substitution

\[
N=mn,\qquad n=N/m.
\]

Indeed, the project lower indices are exactly `m,2m,...,(n-1)m`. Therefore the family itself, the use of Kummer carries, and the reduction

\[
v_p(G)=\min v_p\binom Nk
\]

are prior art and must not be presented as new. The possible contribution, if proved and final-audited, can only be a new theorem about sharp higher valuations and least extremal rows inside this already-studied family.

Primary source: https://arxiv.org/html/2606.20940v2 and https://arxiv.org/pdf/2606.20940 . Current version inspected: **v2, 4 August 2026**; original submission **18 June 2026**. Definition appears in §1, displayed definition of `g(m,n)`; Theorems 1 and 2 are on paper p. 2.

## 3. Source-by-source theorem audit

### 3.1 Carl McTague (2015/2017; arXiv v5 2018)

**Source.** Carl McTague, *On the Greatest Common Divisor of Binomial Coefficients* `C(n,q), C(n,2q), C(n,3q), ...`, arXiv:1510.06696; *American Mathematical Monthly* 124(4) (2017), 353–356, DOI 10.4169/amer.math.monthly.124.4.353. First arXiv submission: **22 October 2015**. Version inspected: **v5, 25 July 2018**. Primary text: https://arxiv.org/html/1510.06696v5 and https://arxiv.org/pdf/1510.06696 .

**Theorem Q, paper p. 1.** For integers `n>q>0` and a prime `p ≡ 1 (mod q)`, McTague proves

\[
 v_p\!\left(\gcd_{0<k<n/q}\binom n{qk}\right)
 =
 \begin{cases}
 1,&\alpha_p(n)\le q,\\
 0,&\text{otherwise},
 \end{cases}
\]

where `α_p(n)` is the base-`p` digit sum. The immediately following remark gives, for `n>1`,

\[
 v_p\!\left(\gcd_{0<k<n}\binom{qn}{qk}\right)=1
 \iff \alpha_p(qn)=q.
\]

**Overlap with Target A.** Put the project's restriction parameter `m=q` and row `N=n`. This is the exact project gcd. Under McTague's hypothesis `p ≡ 1 (mod m)`, necessarily `p>m`, hence `r_p(m)=1`. The theorem bounds every admissible valuation by 1. It also gives existence: for `N=mp`, one has `α_p(mp)=m` because `m<p`, hence the valuation is 1. Therefore **Target A's entire subcase `p ≡ 1 (mod m)` is already a consequence of McTague's Theorem Q**. It is not a new subcase.

**Higher-valuation obstruction explicitly noted by McTague, paper p. 2.** McTague states that the congruence hypothesis can be weakened but cannot simply be removed, giving

\[
 v_2\!\left(\gcd_{0<k<2}\binom 6{3k}\right)=v_2(20)=2.
\]

This is exactly the project instance `(p,m,N)=(2,3,6)`. Since `6` is the first admissible row above `m=3`, the exceptional pilot equality `T_2(3)=6` is already implicit in this published example. **That exceptional case is known, not a candidate original result.**

**Kummer, paper p. 2.** The paper states the carry formulation of Kummer and uses `v_p(gcd S)=min_{s∈S}v_p(s)`. These are classical/prior methods, not contribution claims.

### 3.2 Chai Wah Wu (2026)

**Source.** Chai Wah Wu, *Computing the Greatest Common Divisor of Binomial Coefficients* `C(mn,mk)`, arXiv:2606.20940. Submitted **18 June 2026**; inspected **v2, 4 August 2026**, 6 pp. Primary: https://arxiv.org/html/2606.20940v2 and https://arxiv.org/pdf/2606.20940 .

**Definition, §1 / paper p. 1.** Wu's `g(m,n)` is exactly the project's `G(mn;m)`, as noted above.

**McTague restatement, §1 / paper p. 1.** Wu records the exact-family result

\[
 v_q(g(m,n))=
 \begin{cases}
 1,&\alpha_q(mn)=m,\\
 0,&\text{otherwise},
 \end{cases}
 \qquad q\equiv1\pmod m,
\]

which is McTague's theorem in Wu's notation.

**Theorem 1, paper p. 2.** If `n>1` and Wu's restriction parameter `m=p^t` is a power of the same prime `p`, then

\[
 v_p(g(m,n))=1
\]

iff `n` is a power of `p`, and it is 0 otherwise.

**Overlap.** This is a theorem about the prime **dividing the restriction parameter**. Target A assumes `p ∤ m`, so Wu Theorem 1 is disjoint from Target A's hypotheses despite using the exact same gcd family.

**Theorem 2, paper p. 2.** Suppose `n>1`, `m=p^t` is a prime power, and every prime factor `q` of `C(mn,m)` is either `p` or satisfies `q ≡ 1 (mod m)`. Wu gives an explicit squarefree formula for `g(m,n)` in terms of those `q` with `α_q(mn)=m` (and includes `p` iff `n` is a power of `p`).

**Overlap.** This gives exact values only under a restrictive factorization/congruence hypothesis and with Wu's `m` a prime power. It does not state the Target-A maximum over rows, does not state a higher maximum `r_p(m)`, and does not state Target B's least row. For Target B, the valuation prime is the `p` in `m=p^a+1`, hence it does not divide `m`; it is not the prime singled out by Wu Theorem 1.

**Consequence for positioning.** Any claim that the family `G(N;m)` itself is new must be removed. The project must cite both McTague and Wu prominently if it progresses.

### 3.3 Chan-Liang Chung and Tse-Chung Yang (published 27 September 2026)

**Source.** Chan-Liang Chung and Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, *Mediterranean Journal of Mathematics* 23, article 209 (2026), DOI 10.1007/s00009-026-03202-3. Received **6 April 2026**, revised **21 August 2026**, accepted **8 September 2026**, version of record and publication **27 September 2026**. Primary publisher page: https://link.springer.com/article/10.1007/s00009-026-03202-3 .

**Accessible statement.** The full article was subscription-only during this audit. The publisher abstract states that for the full range `1<=k<=n-1` with upper and lower indices non-coprime, it gives a complete gcd characterization; for even `n`, values `2`, `p`, `2p`, or `1` occur depending in part on whether `n` is a power of 2 or has the form `p^t+1`. It also studies a central band and an exact `p`-adic valuation under a condition.

**Relation to this project.** The selected lower indices are different. Their full-range set is based on `gcd(N,k)>1`; the project uses a fixed divisibility condition `m|k` and also requires `m|N`. For `m>1`, every project lower index is non-coprime to `N`, so the project set is a subset of the full non-coprime-index set, but the two sets are not equal in general. Their gcd therefore divides the project gcd; this does not identify the project valuation or a least project row.

**Priority risk / unresolved equivalence.** The appearance of the shape `p^t+1`, Kummer methods, and exact p-adic valuations makes this a high-priority adjacent source. However, the accessible abstract does **not** state either Target A or Target B, and no open author/preprint copy was located in the searches below. Because the complete theorem text could not be inspected, equivalence beyond the abstract is **unresolved**. This paper must be rechecked in Stage 4, ideally from the full text or an author manuscript.

### 3.4 Sunben Chiu, Pingzhi Yuan, Tao Zhou (2023)

**Source.** Sunben Chiu, Pingzhi Yuan, Tao Zhou, *On the Greatest Common Divisor of Binomial Coefficients*, *Bulletin of the Korean Mathematical Society* 60(4) (2023), 863–872, DOI 10.4134/BKMS.b220166. Received **2 March 2022**, revised **22 December 2022**, accepted **21 April 2023**. Primary full-text rendering inspected: https://pdf.medrang.co.kr/BKMS/2023/060/BKMS-60-4-863-872.html .

The paper defines `b(n)` via a central band of Pascal's triangle and then gcds `G_n` and `H_n` selected by `gcd(n,k)=1` and `gcd(n,k)>1`, respectively.

**Theorem 1.1, paper p. 865.** For `n>=2`, `n!=6`, prime `p<n`, `p∤n`, and `n=a_m p^m+r` with `0<r<p^m`, under either `b(n)<=sqrt(n)` or `n` sufficiently large, it gives `v_p(G_n)=1` exactly when `a_m=1` and `r=b(n)`, and 0 otherwise.

**Theorem 1.2, paper p. 865.** For composite `n` and prime `p|n`, it gives an analogous 0/1 formula for `v_p(H_n)`.

**Lemma 2.1, paper p. 865.** Kummer's theorem is quoted from Kummer p. 116 in both carries and borrows form.

**Overlap.** The valuation technology and central-band extremal questions are closely related, but the lower-index restrictions are not `m|k`. No equivalence with Target A or B was found.

### 3.5 Chan-Liang Chung, Tse-Chung Yang, Kanglun Zhou (2025)

**Source.** Chan-Liang Chung, Tse-Chung Yang, Kanglun Zhou, *The Greatest Common Divisor of Sets of Binomial Coefficients with Restrictions*, *Contemporary Mathematics* 6(1) (2025), 971–985, DOI 10.37256/cm.6120255017. Received **23 May 2024**, revised **12 August 2024**, accepted **15 August 2024**; published in 2025. Primary journal record: https://ojs.wiserpub.com/index.php/CM/article/view/5017 . An open CC-BY full-text rendering was also inspected via the publicly indexed copy.

**Definitions, paper pp. 972–973.** They use

\[
A_d(n)=\left\{\binom nk:1\le k\le n-1,\ \gcd(n,k)=d\right\}
\]

and a central-band analogue `B_d(n)`. Thus `A_d(n)` is an **exact gcd-class** restriction, not the project's divisibility class `d|k`.

The paper itself restates McTague's multiples theorem (its Theorem 2) before introducing `A_d(n)`, explicitly recognizing lower-index multiple restrictions as prior work.

**Proposition 1, paper p. 974.** For even `n` with `n-1=p^t` an odd prime power, `gcd A_2(n)=(n/2)p`.

**Overlap.** The `p^t+1` form is adjacent to Target B, but the selected set is different. In the project, all multiples of `m` are included; in `A_m`, only lower indices having gcd exactly `m` with the row are included. Neither theorem states a least row where a fixed prime valuation of the project's gcd becomes maximal.

### 3.6 Siao Hong (2016)

**Source.** Siao Hong, *The greatest common divisor of certain binomial coefficients*, *Comptes Rendus Mathématique* 354(8) (2016), 756–761, DOI 10.1016/j.crma.2016.06.001. Received **15 March 2016**, accepted **8 June 2016**, published **12 July 2016**. Primary publisher page: https://comptes-rendus.academie-sciences.fr/mathematique/articles/10.1016/j.crma.2016.06.001/ .

**Main identity (abstract / paper).** For positive integers `m,n`, Hong evaluates the gcd of `C(mn,k)` over indices satisfying `gcd(k,m)=1`, obtaining

\[
\gcd\left\{\binom{mn}{k}:1\le k\le mn,\ \gcd(k,m)=1\right\}
=m\prod_{p\mid\gcd(m,n)}p^{v_p(n)}.
\]

**Overlap.** This selects indices coprime to a fixed parameter and is essentially complementary to a fixed-multiple condition. It is not equivalent to the project family, Target A, or Target B.

### 3.7 H. Joris, C. Oestreicher, J. Steinig (1985)

**Source.** H. Joris, C. Oestreicher, J. Steinig, *The greatest common divisor of certain sets of binomial coefficients*, *Journal of Number Theory* 21(1) (1985), 101–119, DOI 10.1016/0022-314X(85)90013-7.

**Result class.** The paper gives a formula for gcds of **consecutive blocks** `C(n,r),...,C(n,s)` in a fixed Pascal row. McTague explicitly identifies it on his paper p. 2 as a different generalization of Ram's theorem.

**Overlap.** Different index geometry; no arithmetic-progression/multiple-index equivalence to Targets A/B was located.

### 3.8 Jiaqi Xiao, Pingzhi Yuan, Xucan Lin (2022)

**Source.** Jiaqi Xiao, Pingzhi Yuan, Xucan Lin, *The Greatest Common Divisor of Certain Set of Binomial Coefficients*, *Mathematical Theory and Applications* 42(1) (2022), 85–91. Primary journal record: https://mta.csu.edu.cn/EN/Y2022/V42/I1/85 .

Later primary papers describe its result as resolving a central-band gcd related to `b(n)`, not a fixed multiple-index gcd. No theorem equivalent to Target A or B was located from the journal record or from the 2023/2025 papers' explicit restatements of its role.

### 3.9 Dakai Guo, Ruichen Qiu, Yichuan Cao, Ruyong Feng, Xiao-Shan Gao (2026)

**Source.** *A Greatest Common Divisor Criterion of Certain Binomial Coefficients*, arXiv:2606.22997v1, submitted **22 June 2026**, 13 pp. Primary: https://arxiv.org/abs/2606.22997 and https://arxiv.org/pdf/2606.22997 .

**Definition and Theorem 1, paper pp. 1–2.** For `k>=2`,

\[
D(k)=\gcd_{2\le q\le k+1}\binom{qk}{k},\qquad n=k+1,
\]

and, writing `ppart(n)` for the largest exact prime-power component of `n`, they prove

\[
D(k)=1 \iff \frac{n}{\operatorname{ppart}(n)}>\operatorname{ppart}(n).
\]

The paper explicitly says its problem is different from arithmetic restrictions on lower indices: here the **lower entry is fixed** at `k` while the upper entry varies through multiples `qk`.

**Overlap.** Different quantifier direction and different selected family. Not equivalent to the project targets.

### 3.10 Ram (1909), Kummer (1852), Granville (1997)

- **B. Ram**, *Common factors of n!/m!(n-m)!*, *J. Indian Math. Club (Madras)* 1 (1909), 39–43. Classical full-row result: the gcd of all interior coefficients of row `n` is `p` when `n` is a positive power of prime `p`, and 1 otherwise. This is background, corresponding to the unrestricted (`m=1`) case, not the project's `m>=2` targets.
- **E. E. Kummer**, *Über die Ergänzungssätze zu den allgemeinen Reciprocitätsgesetzen*, *J. Reine Angew. Math.* 44 (1852), 93–146, DOI 10.1515/crll.1852.44.93. Modern sources above cite the binomial-valuation carry theorem to original p. 116. Carry/borrow arguments are classical proof technology.
- **Andrew Granville**, *Arithmetic Properties of Binomial Coefficients I: Binomial coefficients modulo prime powers*, CMS Conf. Proc. 20 (1997), 253–276. Modern reference for Kummer/Lucas-style prime-power arithmetic; McTague cites §1 for Kummer. Not a Target-A/B source.

## 4. Equivalent formulations explicitly checked

The searches did not rely only on the project's notation. The following equivalences/variants were checked.

1. `G(N;m)` with `N=mn` was searched as `g(m,n)=gcd C(mn,mk)`, which led to Wu's exact-family paper.
2. `m|k` was searched as lower indices `mk`, `qk`, “multiples”, and “arithmetic progression”.
3. `v_p(G)` was searched as `ord_p(g(m,n))`, “minimum p-adic valuation”, and Kummer carry/borrow minima.
4. Target A was searched both as a maximum over admissible rows and as a universal upper bound `v_p(G)<=r_p(m)` plus existence of equality.
5. `r_p(m)` was searched via `ceil(log_p m)`, integer-power thresholds, and higher prime-power divisibility of the selected gcd.
6. Target B was searched using both `m=p^a+1` and the proposed row `p^(3a)+1`; also via the multiplier
   \[
   \frac{p^{3a}+1}{p^a+1}=p^{2a}-p^a+1=\Phi_6(p^a).
   \]
7. “least”, “first”, and “minimal row” terminology was searched in conjunction with binomial gcds and p-adic valuation.
8. Nearby selection rules were audited separately: consecutive blocks; indices coprime to a parameter; exact `gcd(n,k)=d`; non-coprime indices; central bands; fixed lower entry with varying upper multiple.

## 5. Search log

Search date for every query below: **2026-09-29**. Search engines/indexes included the general web index, arXiv, publisher/journal pages surfaced by DOI/title, and references/citation trails in the primary papers.

### Exact-family / exact-notation searches

- `"binom{mn}{mk}" gcd binomial coefficients theorem`
- `"gcd" "binomial coefficients" multiples "mk" "mn"`
- `"g(m,n)" binomial gcd p-adic valuation Wu`
- `"ord_p(g(m,n))" binomial`
- `"v_p" "gcd" "binom{mn}{mk}" 2026`
- `"p-adic valuation" "binom{mn}{mk}" gcd`
- `"minimum p-adic valuation" binomial coefficients arithmetic progression k multiple`

These located Wu 2026 and, through Wu/references, McTague 2015/2017.

### Target-A / higher-valuation searches

- `"ceil(log_p" binomial gcd`
- `"ceiling" "log_p" "gcd" binomial coefficients`
- `"maximum" "p-adic valuation" gcd binomial coefficients multiples`
- `"p-adic valuation" "GCD" "n choose qk" higher than 1`
- `"least" "binomial coefficients" gcd "p-adic"`

No equivalent general maximum `r_p(m)` statement was located. McTague gives the complete congruence subcase `p≡1 (mod m)` and an explicit higher-valuation counterexample to extending his 0/1 formula without hypotheses.

### Target-B / least-row searches

- `"p^a+1" "binomial" gcd Kummer`
- `"p^{3a}+1" binomial gcd`
- `"p^(3a)+1" binomial coefficients gcd`
- `"p^a+1" "greatest common divisor" binomial`
- `"least" extremal row binomial gcd multiples`
- searches for the multiplier `p^(2a)-p^a+1` and `Phi_6(p^a)` together with binomial gcd / p-adic valuation terminology.

No equivalent formula for `T_p(p^a+1)` or least row `p^(3a)+1` was located.

### Very recent adjacent-source searches

For Chung–Yang 2026:

- exact article title + `pdf`
- DOI `10.1007/s00009-026-03202-3` + `pdf`
- exact title + `Theorem 1`
- exact title + `p^t+1`
- `gcd B_{>1}(n)` + authors

The publisher abstract was accessible; no open full text or author preprint was located during this audit.

## 6. Overlap classification

| Item | Audit result |
|---|---|
| The selected gcd family `G(N;m)` itself | **Known family.** Exactly Wu's `g(m,N/m)`; McTague already studied a broad prime-valuation subfamily. |
| Kummer/carry-borrow method and `v_p(gcd)=min v_p` | **Classical / known.** |
| Target A when `p≡1 (mod m)` | **Known consequence of McTague Theorem Q.** Here `r_p(m)=1`. |
| Exceptional `(p,m,N)=(2,3,6)` / `T_2(3)=6` | **Known from McTague's explicit p. 2 example plus the fact that 6 is the first admissible row.** |
| Target A for arbitrary `p∤m`, including `p<m` and valuations >1 | **No equivalent result located in the documented search.** |
| Target B for `a>=2`: `T_p(p^a+1)=p^(3a)+1` | **No equivalent result located in the documented search.** |
| Chung–Yang 2026 non-coprime-index paper | **Adjacent and very recent; different selection rule. Full-text equivalence check unresolved because only abstract was accessible.** |

## 7. Stage-2 interpretation

The audit materially changes how the project must be framed:

- the **family is not new**;
- the McTague congruence case of Target A is **not new**;
- at least one exceptional pilot result is **already in the literature**;
- Wu 2026 is mandatory exact-family prior art;
- the very recent Chung–Yang 2026 paper is a mandatory Stage-4 recheck because its full theorem text was not accessible here.

At the same time, no source located in this audit states the proposed general higher maximum `r_p(m)` for every `p∤m`, and no source located states the proposed least-row formula `T_p(p^a+1)=p^(3a)+1` for `a>=2`. This is a promising but provisional novelty position, not a uniqueness claim.

## 8. Stage-2 gate

**PROCEED.**

Rationale: the exact family and a substantial subcase are prior art, but the preferred candidate theorem (Target B, `a>=2`) and the genuinely higher-valuation portion of Target A remain distinct from the located theorems. Stage 3 may attempt a rigorous informal proof, with the known McTague subcase and Wu family treated explicitly as prior art. Stage 4 must then audit the **exact proved statements**, including a renewed attempt to obtain/check the full Chung–Yang 2026 article.
