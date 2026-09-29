# Session 03 handoff — Stage 3 complete

Date: 2026-09-29

## Completed in this session

Stage 3 only. No Lean, Palomar registration, paper writing, or final novelty audit was started.

Both surviving candidate statements now have complete rigorous informal proofs in notes/proof.md.

## Exact proved statements

### Target A

For every prime p and every integer m>=2 with p∤m, define

\[
r_p(m)=\min\{r\ge1:m<p^r\}.
\]

Then

\[
\max_{\substack{N>m\\m\mid N}}v_p(G(N;m))
=
r_p(m).
\]

The p≡1 mod m subcase remains prior art from McTague and is not to be presented as a new subcase.

### Existence of the least extremal row

Target A includes a constructive equality row, so the set of extremal admissible rows is nonempty. Therefore the minimum T_p(m) exists by well-ordering before T_p(m) is used.

### Target B

For every prime p and every a>=2,

\[
T_p(p^a+1)=p^{3a}+1.
\]

Equivalently, with Q=p^a and m=Q+1,

\[
v_p(G(Q^3+1;m))=a+1,
\]

and for every integer q with

\[
2\le q<Q^2-Q+1,
\]

one has

\[
v_p(G(mq;m))\le a.
\]

## Proof architecture to preserve

### Kummer residue lemma

The proof uses the standard equivalent form

\[
v_p\binom Nk
=
\#\{i\ge1:k\bmod p^i>N\bmod p^i\}.
\]

This is classical Kummer carry/borrow theory.

### Target-A upper bound

Write N=mq and split the leading base-p digit of q:

\[
q=\lambda p^t+b.
\]

If b>0, choose k=mb. Writing mb=u+p^tX reduces all carries to those in X+\lambda m, whose sum is <p^{r+1}, so there are at most r carries.

If b=0, a shifted split of the single leading term similarly reduces to an addition with total <p^{r+1}.

### Target-A sharpness construction

For r>=2, put P=p^{r-1} and write

\[
m=aP+c,
\qquad
1\le a\le p-1,
\qquad
1\le c<P.
\]

Choose L sufficiently large with

\[
L\equiv r-1
\]

modulo the multiplicative order of p mod m, and L>=2r-2. Then

\[
N=a p^L+c
\]

is divisible by m.

If a selected split N=x+y had at most r-1 carries, there must first be a carry across p^L. Taking the final consecutive carry chain of length ell<=r-1 and cutting immediately before it gives

\[
x=A p^s+u,\qquad
A+B=a p^\ell,\qquad
u+v=c.
\]

Because p^s≡p^{r-1-\ell} mod m, divisibility of x forces

\[
A p^{r-1-\ell}+u\equiv0\pmod m.
\]

But this integer lies between 0 and

\[
a p^{r-1}+c=m,
\]

so it is 0 or m, forcing x=0 or y=0. Contradiction. Hence every split has at least r carries.

For r=1, the equality row N=mp works directly.

### Target-B attainment

For

\[
N_0=p^{3a}+1,
\]

all lower residues N_0 mod p^i equal 1 for 1<=i<=3a.

For k=(p^a+1)d, either p|d, in which case the borrow count is controlled by v_p(d), or p∤d, in which case it is controlled by v_p(k-1). The inverse identity

\[
(1+p^a)^{-1}\equiv1-p^a\pmod{p^{2a}}
\]

prevents v_p(k-1)>=2a for d<q_0. Thus every selected coefficient has at least a+1 carries.

The witness d=p^{2a-1} has exactly a+1 carries.

### Target-B strict lower rows

For q<q_0, split q at its leading base-p digit. The low remainder b is normally a witness with at most a carries.

The only time that leading split has a+1 carries is the explicit pattern

\[
\lambda=p-1,\qquad
Q-p+1\le
\left\lfloor\frac{(Q+1)b}{p^t}\right\rfloor
\le Q-1.
\]

Writing q=p^{t+1}-h forces

\[
a\le t\le2a-2,\qquad h<p^{a-1}.
\]

Then the fixed fallback

\[
d=p^{a-1}
\]

has no borrow below level 2a, and all possible borrows lie in a set of at most a levels. Hence every smaller admissible row has valuation <=a.

## Prior-art boundaries that remain mandatory

- Wu 2026 defines the exact same selected gcd family g(m,n)=G(mn;m).
- McTague's Theorem Q already proves Target A when p≡1 mod m.
- Kummer carry/borrow theory is classical.
- McTague explicitly gives v_2(G(6;3))=2, so T_2(3)=6 is known.
- The a=1 regime is not part of Target B.
- Chung–Yang 2026 remains the highest-priority unresolved adjacent source because Stage 2 could inspect only its abstract.

No novelty or uniqueness conclusion has yet been established.

## Files changed in Session 03

- notes/proof.md — complete Stage-3 informal proof, failed approaches, and endpoint checks.
- STATUS.md — Stage 3 marked complete and exact theorem status recorded.
- notes/session-03-handoff.md — this handoff.

## Stage 4 only: required next work

The next session must perform the final theorem-level uniqueness / novelty audit of the exact proved statements above.

It should:

1. Search Target A in its final exact form, including the constructive sharpness row formulation and all equivalent Wu/McTague notation.
2. Search Target B in its final exact least-row form, its equivalent multiplier form q_0=p^(2a)-p^a+1, and the row shape p^(3a)+1.
3. Recheck primary versions, dates, theorem numbers, and hypotheses for Wu and McTague.
4. Make a renewed attempt to obtain or inspect the full theorem text of Chung–Yang 2026, not merely the abstract, and compare its exact lower-index set and p-adic statements to Targets A/B.
5. Search citation trails and very recent 2026 literature for equivalent formulations involving Kummer minima, selected lower indices, prime-power divisibility, least rows, or p^a+1.
6. Record exact overlaps, near-overlaps, unresolved equivalences, and negative searches in a Stage-4 audit file.
7. Finish with one precise Stage-4 gate. Only if an exact theorem survives the final audit should Stage 5 Lean formalisation be opened.

Do not start Lean, Palomar, the paper, or arXiv work during Stage 4.

## Copy-paste prompt for Session 04

Continue the Pascal Extremes project from the repository handoff at jfairfaxball-348/Pascal-Extremes.

Read AGENTS.md, STATUS.md, notes/targets.md, notes/prior-art-audit-2.md, notes/proof.md, and notes/session-03-handoff.md first.

This session is Stage 4 only: conduct the final theorem-level uniqueness / novelty audit of the exact informally proved statements from Stage 3. Do not begin Lean, Palomar registration, paper writing, or arXiv work.

Audit Target A in its final form for every prime p and m>=2 with p∤m, including equivalent formulations in Wu's g(m,n) notation, the universal bound plus constructed equality row, and the known McTague p≡1 mod m subcase.

Audit Target B in its final form for every prime p and a>=2:
T_p(p^a+1)=p^(3a)+1,
including the equivalent multiplier q_0=p^(2a)-p^a+1 and strict non-attainment at every smaller admissible row.

Use primary sources and exact theorem/page/version/date references. Recheck Wu and McTague. Make a renewed, serious attempt to obtain and inspect the full Chung–Yang 2026 paper The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices, because Stage 2 had only the abstract. Search equivalent Kummer/carry formulations, higher p-adic minima, fixed-multiple lower indices, least/first extremal rows, p^a+1, p^(3a)+1, and Phi_6(p^a).

Record the full audit in notes/prior-art-audit-4.md, clearly separating known results, exact overlaps, near-overlaps, unresolved equivalences, and negative searches. Do not infer uniqueness from failure to find a match.

Update STATUS.md and create a Stage-4 handoff. Finish with exactly one Stage-4 gate stating whether an exact proved theorem is cleared to proceed to Lean formalisation.
