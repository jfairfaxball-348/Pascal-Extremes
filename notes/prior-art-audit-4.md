# Final theorem-level prior-art audit — Stage 4

Date of audit: **2026-09-29**.

This is the final theorem-level audit requested after the Stage-3 informal proofs. It is not a proof of historical uniqueness. A negative search below means only **no equivalent result was located in the documented search**.

Stage 4 does not alter the mathematical proof status in `notes/proof.md`; it audits whether the exact proved statements can responsibly be advanced to formalisation as candidate contributions.

## 1. Exact proved statements under audit

For integers \(m\ge2\) and \(N>m\) with \(m\mid N\), define
\[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
\]
For a prime \(p\),
\[
r_p(m)=\min\{r\ge1:m<p^r\}.
\]

### Target A

For every prime \(p\) and every \(m\ge2\) with \(p\nmid m\),
\[
\max_{\substack{N>m\\m\mid N}}v_p(G(N;m))=r_p(m).
\]

The Stage-3 proof splits this into:

1. the universal bound
   \[
   v_p(G(N;m))\le r_p(m)
   \quad\text{for every admissible }N;
   \]
2. an explicit existence construction for equality;
3. only after existence, the definition of the least extremal row \(T_p(m)\).

For \(r=r_p(m)\ge2\), writing
\[
m=a p^{r-1}+c,\qquad
1\le a\le p-1,\quad 1\le c<p^{r-1},
\]
Stage 3 chooses sufficiently large \(L\equiv r-1\pmod{\operatorname{ord}_m(p)}\), \(L\ge2r-2\), and uses
\[
N=a p^L+c.
\]
For \(r=1\), it uses \(N=mp\).

### Target B

For every prime \(p\) and every \(a\ge2\),
\[
T_p(p^a+1)=p^{3a}+1.
\]

With \(Q=p^a\) and \(m=Q+1\), this is equivalently the assertion that the **least multiplier**
\[
q_0=Q^2-Q+1=p^{2a}-p^a+1=\Phi_6(p^a)
\]
satisfies
\[
v_p(g(m,q_0))=a+1,
\]
while
\[
v_p(g(m,q))\le a
\qquad(2\le q<q_0).
\]
The corresponding row is
\[
m q_0=(p^a+1)(p^{2a}-p^a+1)=p^{3a}+1.
\]

The \(a=1\) regime is outside Target B.

## 2. Exact translation to Wu's notation

Chai Wah Wu defines, for \(n>1\),
\[
g(m,n)=\gcd\left\{\binom{mn}{mk}:1\le k<n\right\}.
\]
Therefore
\[
G(N;m)=g(m,N/m)
\]
for every admissible project row \(N\).

Target A is exactly
\[
\max_{n\ge2} v_p(g(m,n))=r_p(m)
\qquad(p\nmid m),
\]
or equivalently:
\[
v_p(g(m,n))\le r_p(m)\ \text{for all }n\ge2,
\]
with equality for at least one \(n\).

Target B is exactly:
\[
\min\{n\ge2:v_p(g(p^a+1,n))=a+1\}
=p^{2a}-p^a+1
\]
for \(a\ge2\).

This translation was used throughout the search. The selected GCD family itself is therefore prior art and is not a novelty claim.

## 3. Primary-source rechecks

### 3.1 Carl McTague — exact known overlap

**Source.** Carl McTague, *On the Greatest Common Divisor of Binomial Coefficients* \(\binom nq,\binom n{2q},\binom n{3q},\ldots\), arXiv:1510.06696. First submitted **22 October 2015**; version inspected **v5, 25 July 2018**. Journal version: *American Mathematical Monthly* **124**(4) (April 2017), 353–356, DOI 10.4169/amer.math.monthly.124.4.353.

Primary links:
- https://arxiv.org/abs/1510.06696
- https://arxiv.org/pdf/1510.06696
- https://doi.org/10.4169/amer.math.monthly.124.4.353

**Theorem Q, paper p. 1 (Monthly p. 353).** For integers \(n>q>0\) and prime \(p\equiv1\pmod q\),
\[
v_p\!\left(\gcd_{0<k<n/q}\binom n{qk}\right)
=
\begin{cases}
1,&\alpha_p(n)\le q,\\
0,&\text{otherwise}.
\end{cases}
\]
The following remark rewrites the row as \(qn\):
\[
v_p\!\left(\gcd_{0<k<n}\binom{qn}{qk}\right)=1
\iff \alpha_p(qn)=q.
\]

**Exact overlap with Target A.** Put the project's restriction parameter \(m=q\). If \(p\equiv1\pmod m\), then \(p>m\), so \(r_p(m)=1\). Theorem Q gives the universal \(0/1\) bound on every admissible row in this subcase. The row \(N=mp\) has \(\alpha_p(mp)=m\), so equality occurs. Hence the whole Target-A subcase
\[
p\equiv1\pmod m
\]
is already known.

**Known exceptional higher valuation, paper p. 2 (Monthly p. 354).** McTague explicitly records
\[
v_2\!\left(\gcd_{0<k<2}\binom6{3k}\right)=v_2(20)=2.
\]
Thus the project instance \((p,m,N)=(2,3,6)\) is prior art. Because \(6\) is the first admissible row above \(m=3\), the equality \(T_2(3)=6\) is also already implicit there.

**Method overlap, paper p. 2.** McTague states Kummer's carry theorem and uses
\[
v_p(\gcd S)=\min_{s\in S}v_p(s).
\]
These are classical/prior tools.

**Non-overlap located.** McTague does not state a uniform maximum \(r_p(m)\) for every \(p\nmid m\), nor a least extremal multiplier for \(m=p^a+1\), nor the Target-B multiplier \(\Phi_6(p^a)\).

### 3.2 Chai Wah Wu — exact family, different theorems

**Source.** Chai Wah Wu, *Computing the Greatest Common Divisor of Binomial Coefficients* \(\binom{mn}{mk}\), arXiv:2606.20940. Submitted **18 June 2026**; version inspected **v2, 4 August 2026**, 6 pp.

Primary links:
- https://arxiv.org/abs/2606.20940
- https://arxiv.org/pdf/2606.20940

**Definition, paper p. 1.** Wu defines
\[
g(m,n)=\gcd\left\{\binom{mn}{mk}:1\le k<n\right\},
\]
exactly the project's family after \(N=mn\).

**McTague restatement, paper p. 2.** Wu records, for prime \(p\equiv1\pmod m\),
\[
v_p(g(m,n))=
\begin{cases}
1,&\alpha_p(mn)=m,\\
0,&\text{otherwise}.
\end{cases}
\]

**Theorem 1, paper p. 2.** If \(m=p^t\) is a power of the same prime \(p\), then
\[
v_p(g(m,n))=1
\]
iff \(n\) is a power of \(p\), and it is \(0\) otherwise. Target A assumes \(p\nmid m\), so this theorem is disjoint from Target A's hypothesis.

**Theorem 2, paper p. 2.** Under the hypotheses that \(m=p^t\) is a prime power and every prime factor \(q\) of \(\binom{mn}{m}\) is either \(p\) or satisfies \(q\equiv1\pmod m\), Wu gives an explicit squarefree formula for \(g(m,n)\).

**Exact comparison.** Neither theorem states:
- the universal bound \(v_p(g(m,n))\le r_p(m)\) for arbitrary \(p\nmid m\);
- the maximum over all multipliers \(n\);
- the Stage-3 equality construction \(N=a p^L+c\);
- the least multiplier \(p^{2a}-p^a+1\) for \(m=p^a+1\);
- strict non-attainment at every smaller multiplier.

Therefore the family and substantial special cases are known, but no exact Target-A or Target-B theorem outside the already attributed McTague subcase was located in Wu v2.

### 3.3 Chung–Yang 2026 — renewed full-text attempt and unresolved theorem-level comparison

**Source.** Chan-Liang Chung and Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, *Mediterranean Journal of Mathematics* **23**, article 209 (2026), DOI 10.1007/s00009-026-03202-3.

Primary publisher record:
https://link.springer.com/article/10.1007/s00009-026-03202-3

Publisher metadata states:
- received **6 April 2026**;
- revised **21 August 2026**;
- accepted **8 September 2026**;
- published/version of record **27 September 2026**.

**What is verifiable from the publisher abstract.** For the full range \(1\le k\le n-1\), the paper studies binomial coefficients for which the upper and lower indices are non-coprime. It says that when \(n\) is even, the resulting GCD is \(2\), \(p\), \(2p\), or \(1\), depending on whether \(n\) is a power of \(2\) and whether \(n\) has the form \(p^t+1\). It also studies the central band \(b(n)<k<n-b(n)\), gives the same closed form in certain \(p^t+1\) / power-of-two cases, and determines an exact \(p\)-adic valuation under a stated condition. The abstract explicitly says the method uses Kummer and \(p\)-adic representations.

**Selection-rule comparison.** The project's selected set is
\[
\{k:0<k<N,\ m\mid k\},
\quad\text{with }m\mid N,
\]
whereas Chung–Yang's advertised full-range set is
\[
\{k:1\le k\le N-1,\ \gcd(N,k)>1\}.
\]
For \(m>1\), the project set is a subset of the full non-coprime set, but the sets are not equal in general. Consequently the full non-coprime-index GCD divides the project GCD; that fact alone neither determines the project's valuation nor identifies a least project row.

**Renewed access attempts on 2026-09-29.** The audit attempted all of the following:
- the Springer article page and its PDF route;
- the DOI plus `pdf`, exact title plus `pdf`, and exact title plus theorem-number searches;
- Springer SharedIt;
- exact-title searches with `preprint`, `accepted manuscript`, `author manuscript`, and `repository`;
- searches tied to the authors' Fuzhou University and Soochow University affiliations;
- ResearchGate and ORCID/title searches;
- searches for indexed theorem snippets using the DOI, `Theorem 1`, `Theorem 2`, `Theorem 3`, \(B_{>1}\), \(p^t+1\), and exact \(p\)-adic valuation terminology.

The publisher page remains a subscription preview and offers a paid PDF. Its SharedIt section says that no shareable link is currently available. The direct PDF route was not inspectable through the available web interface. No open author manuscript, preprint, repository copy, or theorem-level indexed rendering was located.

**Result.** The abstract does not state either Target A or Target B, and its headline selection rule is different. However, because the full theorem text could not be inspected, the audit cannot exclude an internal lemma, corollary, comparison theorem, or equivalent formulation bearing on the project's fixed-multiple family. The exact theorem/page-level comparison therefore remains **unresolved**.

This unresolved source is especially important because it was published only two days before this audit, has the adjacent \(p^t+1\) shape, and explicitly uses exact \(p\)-adic/Kummer analysis.

### 3.4 Chung–Yang–Zhou 2025 — adjacent exact-gcd-class restrictions

**Source.** Chan-Liang Chung, Tse-Chung Yang, Kanglun Zhou, *The Greatest Common Divisor of Sets of Binomial Coefficients with Restrictions*, *Contemporary Mathematics* **6**(1) (2025), 971–985, DOI 10.37256/cm.6120255017. Received **23 May 2024**, revised **12 August 2024**, accepted **15 August 2024**.

Primary record:
https://ojs.wiserpub.com/index.php/CM/article/view/5017

An open CC-BY full-text rendering was rechecked during this audit when the primary journal page itself returned a web-access error.

**Theorem 2, paper p. 972.** The paper explicitly restates McTague's multiples theorem.

**Definitions, pp. 972–973.** It defines
\[
A_d(n)=\left\{\binom nk:1\le k\le n-1,\ \gcd(n,k)=d\right\}
\]
and a central-band analogue \(B_d(n)\). This is an **exact gcd-class** restriction, not the project's divisibility class \(d\mid k\).

**Proposition 1, p. 974.** If \(n\) is even and \(n-1=p^t\) is an odd prime power,
\[
\gcd A_2(n)=\frac n2\,p.
\]
This is a genuine nearby \(p^t+1\) theorem, but it is for \(d=2\) exact-gcd indices and does not give Target B's fixed-multiple GCD or least multiplier.

### 3.5 Chiu–Yuan–Zhou 2023

**Source.** Sunben Chiu, Pingzhi Yuan, Tao Zhou, *On the Greatest Common Divisor of Binomial Coefficients*, *Bulletin of the Korean Mathematical Society* **60**(4) (2023), 863–872, DOI 10.4134/BKMS.b220166.

Primary journal/metadata record:
https://bkms.kms.or.kr/journal/view.html?doi=10.4134/BKMS.b220166

**Theorems 1.1 and 1.2, paper p. 865.** The paper gives \(0/1\) \(p\)-adic criteria for central-band GCDs selected by \(\gcd(n,k)=1\) and \(\gcd(n,k)>1\), under its stated hypotheses.

**Lemma 2.1, p. 865.** It quotes Kummer in carry/borrow form.

These are methodologically close but use different selected sets. No fixed-multiple maximum or least-row theorem equivalent to A or B was located.

### 3.6 Siao Hong 2016

**Source.** Siao Hong, *The greatest common divisor of certain binomial coefficients*, *Comptes Rendus Mathématique* **354**(8) (2016), 756–761, DOI 10.1016/j.crma.2016.06.001. Received **15 March 2016**, accepted **8 June 2016**, published **12 July 2016**.

Primary open record:
https://www.numdam.org/articles/10.1016/j.crma.2016.06.001/

Hong proves
\[
\gcd\left\{\binom{mn}{k}:1\le k\le mn,\ \gcd(k,m)=1\right\}
=
m\prod_{p\mid\gcd(m,n)}p^{v_p(n)}.
\]
This is an arithmetic restriction on lower indices, but it is coprimality rather than fixed divisibility \(m\mid k\). No exact overlap with A/B was located.

### 3.7 Guo–Qiu–Cao–Feng–Gao 2026

**Source.** Dakai Guo, Ruichen Qiu, Yichuan Cao, Ruyong Feng, Xiao-Shan Gao, *A Greatest Common Divisor Criterion of Certain Binomial Coefficients*, arXiv:2606.22997v1, submitted **22 June 2026**.

Primary:
https://arxiv.org/abs/2606.22997

**Theorem 1, paper pp. 1–2.** For
\[
D(k)=\gcd_{2\le q\le k+1}\binom{qk}{k},
\qquad n=k+1,
\]
the paper proves the OEIS criterion \(D(k)=1\) iff \(n/P>P\), where \(P\) is the largest exact prime-power component of \(n\).

Here the lower entry is fixed and the upper entry varies through multiples, so the quantifiers run in the opposite direction from the project. No Target-A/B equivalence was located.

### 3.8 Classical background

- Kummer (1852), *J. Reine Angew. Math.* 44, 93–146; the binomial carry theorem is cited by McTague to original p. 116.
- Ram (1909), *J. Indian Math. Club (Madras)* 1, 39–43; the full-row GCD theorem.
- Joris–Oestreicher–Steinig (1985), *J. Number Theory* 21(1), 101–119; GCDs of consecutive blocks in a Pascal row.
- Granville (1997), *Arithmetic Properties of Binomial Coefficients I*, CMS Conf. Proc. 20, 253–276; modern prime-power/Kummer background.

None is a novelty source for the fixed-multiple sharp maximum or the Target-B least row.

## 4. Target A — exact overlap classification

### Known

1. The family \(G(N;m)=g(m,N/m)\) is known.
2. Kummer carry/borrow analysis and \(v_p(\gcd)=\min v_p\) are known.
3. The full subcase \(p\equiv1\pmod m\), hence \(r_p(m)=1\), is a consequence of McTague Theorem Q.
4. The instance \(v_2(G(6;3))=2\) is explicitly in McTague.

### No equivalent result located

The documented Stage-4 search did not locate a source stating, for every \(p\nmid m\),
\[
v_p(g(m,n))\le r_p(m)\quad\text{for all }n\ge2
\]
together with an equality multiplier, or equivalently
\[
\max_{n\ge2}v_p(g(m,n))=r_p(m).
\]

No equivalent was located for the stronger \(r_p(m)>1\) regime, nor for the broader \(r_p(m)=1\) regime when \(p>m\) but \(p\not\equiv1\pmod m\).

The Stage-3 equality construction
\[
m=a p^{r-1}+c,\qquad
N=a p^L+c,\qquad
L\equiv r-1\pmod{\operatorname{ord}_m(p)}
\]
was also searched through its multiplicative-order, Kummer/carry, and fixed-multiple formulations; no matching theorem or construction was located.

This is a **negative search result only**, not a historical uniqueness claim.

## 5. Target B — exact overlap classification

### Known/nearby ingredients

1. The identity
   \[
   p^{3a}+1=(p^a+1)(p^{2a}-p^a+1)
   \]
   and
   \[
   p^{2a}-p^a+1=\Phi_6(p^a)
   \]
   are elementary cyclotomic identities.
2. The shape \(p^t+1\) appears in Chung–Yang–Zhou 2025 and in the Chung–Yang 2026 abstract, but under different index-selection rules.
3. Kummer residue/carry counting is classical.
4. The \(a=1\), \(p=2\) instance \(T_2(3)=6\) is known from McTague plus admissibility and is not part of Target B.

### No equivalent result located

No inspected source states, for every prime \(p\) and \(a\ge2\),
\[
T_p(p^a+1)=p^{3a}+1.
\]

Equivalently, no inspected source states that the least multiplier \(n\ge2\) satisfying
\[
v_p(g(p^a+1,n))=a+1
\]
is
\[
n=p^{2a}-p^a+1=\Phi_6(p^a).
\]

No inspected source states the two necessary halves in the project's exact family:
\[
v_p(g(p^a+1,p^{2a}-p^a+1))=a+1
\]
and
\[
v_p(g(p^a+1,n))\le a
\quad(2\le n<p^{2a}-p^a+1).
\]

The exact strings and algebraic variants \(p^a+1\), \(p^{3a}+1\), \(p^{2a}-p^a+1\), \(\Phi_6(p^a)\), “least/first extremal row”, “least multiplier”, and Kummer/carry versions were all searched with binomial-GCD terminology. No equivalent result was located.

Again, this is not a uniqueness proof.

## 6. Equivalent formulations and construction-level searches

The Stage-4 search deliberately avoided dependence on project notation.

Search families included:

- `g(m,n)`, `ord_p(g(m,n))`, `gcd binom(mn,mk)`;
- `maximum p-adic valuation`, `minimum p-adic valuation`, `higher p-adic valuation`;
- `m|k`, `mk`, “multiples of the lower index”, and “fixed-multiple lower indices”;
- Kummer carries, Kummer borrows, and residue criteria;
- `ceil(log_p m)`, integer-power thresholds \(m<p^r\), and `p∤m`;
- `least`, `first`, `minimal row`, `least multiplier`, `extremal row`;
- the Stage-3 construction terms `multiplicative order`, \(a p^L+c\), and \(L\equiv r-1\pmod{\operatorname{ord}_m(p)}\);
- \(p^a+1\), \(p^{3a}+1\), \(p^{2a}-p^a+1\), \(\Phi_6(p^a)\), and textual exponent variants.

The general web index was supplemented by arXiv records, DOI/publisher pages, exact-title searches, recent-paper searches, and reference/citation trails from Wu, McTague, Chung–Yang, and Chung–Yang–Zhou.

No equivalent general Target-A maximum, equality construction, or Target-B least multiplier was located in these searches.

## 7. Very recent literature / citation-trail check

The audit specifically re-ran searches around the two June 2026 arXiv papers and literature published through **29 September 2026**.

- Wu arXiv:2606.20940 remains at **v2, 4 August 2026**.
- Guo et al. arXiv:2606.22997 remains a different fixed-lower-index problem.
- The Chung–Yang article was published **27 September 2026**, making it the newest and highest-risk adjacent source found.
- Searches for papers citing Wu's exact title/arXiv identifier did not locate a later paper containing Target A or B.
- Springer’s Chung–Yang reference list includes McTague, Chiu–Yuan–Zhou, Chung–Yang–Zhou, Hong, Joris–Oestreicher–Steinig, Kummer, Ram, and Granville; it does not by itself expose theorem text beyond the abstract.

The absence of a citation or search hit is not evidence of uniqueness.

## 8. Consolidated classification

| Statement / ingredient | Stage-4 classification |
|---|---|
| Family \(G(N;m)\) / \(g(m,n)\) | **Known exact family** — Wu; McTague studied the multiple-index family earlier. |
| Kummer carry/borrow method and \(v_p(\gcd)=\min v_p\) | **Classical / known.** |
| Target A for \(p\equiv1\pmod m\) | **Known exact overlap** — McTague Theorem Q. |
| \((p,m,N)=(2,3,6)\), hence \(T_2(3)=6\) | **Known exact instance** — McTague p. 2 plus first admissible row. |
| Target A for arbitrary \(p\nmid m\), outside known overlap | **No equivalent result located in inspected sources/searches.** |
| Stage-3 equality construction \(N=a p^L+c\) | **No equivalent construction located.** |
| Target B for all \(p\), \(a\ge2\) | **No equivalent result located in inspected sources/searches.** |
| Least multiplier \(p^{2a}-p^a+1=\Phi_6(p^a)\) and strict lower-row non-attainment | **No equivalent result located in inspected sources/searches.** |
| Chung–Yang 2026 | **High-priority unresolved equivalence at theorem level** — abstract inspected; full theorem text not obtained. |

## 9. Residual novelty caveat

The mathematical statements remain **proved informally** as recorded in Stage 3.

The literature position is stronger than at Stage 2 in two ways: Wu and McTague have now been checked directly against the exact final statements, and the exact Target-B multiplier/strict-minimality formulation has been searched explicitly.

The complete theorem text of Chung–Yang 2026 could not be inspected. This is recorded as a **residual novelty caveat, not a blocker**. The paper is exceptionally recent, its advertised selection rule is different, and no equivalent Target-A or Target-B statement was located in the accessible abstract, metadata, indexed snippets, or other documented searches. Nevertheless, novelty relative to any non-public theorem, lemma, or corollary inside that paper **has not been verified**.

Any later Palomar registration, paper, or arXiv novelty discussion must therefore cite Chung–Yang as adjacent work and state transparently that the present audit could not verify non-overlap with its inaccessible full theorem text because of the paper's recency and lack of open source material. This caveat does not alter the Stage-3 proof status and does not prevent formalisation.

## 10. Stage-4 gate

**PROCEED — Target A and Target B are cleared to proceed to Stage 5 Lean formalisation.**

Basis: no equivalent theorem was located in the inspected literature for the surviving exact statements, while the unresolved Chung–Yang 2026 comparison is retained explicitly as a novelty caveat rather than treated as proof of uniqueness or as a formalisation blocker.
