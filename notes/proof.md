# Stage 3 informal proof

Date: 2026-09-29.

Status: **Target A is proved informally in full generality under its stated hypotheses, and Target B is proved informally for every prime p and every a >= 2.** This is an informal mathematical proof only. No novelty claim follows from it, and no Lean formalisation has begun.

Wu's exact family g(m,n), McTague's Theorem Q, Kummer's theorem, and McTague's explicit (p,m,N)=(2,3,6) example are prior art as recorded in notes/prior-art-audit-2.md. The argument below uses Kummer's classical carry theorem and does not claim the selected gcd family itself as new.

## 1. Setup and the borrow criterion

For m >= 2 and N>m with m|N, write

\[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
\]

For a prime p,

\[
v_p(G(N;m))
 =\min_{\substack{0<k<N\\m\mid k}}v_p\binom Nk.
\]

This is the elementary fact that the p-adic valuation of a gcd is the minimum of the valuations.

We repeatedly use the following form of Kummer.

**Lemma 1 (residue/borrow form of Kummer).** For 0<=k<=N,

\[
v_p\binom Nk
=
\#\left\{i\ge1:(k\bmod p^i)>(N\bmod p^i)\right\}.
\]

**Proof.** Subtract k from N in base p. A borrow leaves the first i digits exactly when the lower-i-digit integer represented by k exceeds the lower-i-digit integer represented by N, i.e. when k mod p^i>N mod p^i. Kummer identifies the number of these borrows with the number of carries in k+(N-k), hence with the binomial valuation. ∎

Equivalently, when N=x+y and k=x, the valuation is the number of base-p carries in the addition x+y.

## 2. Target A: universal upper bound

Let p be prime, m>=2, p∤m, and

\[
r=r_p(m)=\min\{r\ge1:m<p^r\}.
\]

We first prove that every admissible row satisfies

\[
v_p(G(N;m))\le r.
\]

Write N=mq with q>=2. Let

\[
q=\lambda p^t+b,\qquad
1\le\lambda\le p-1,\qquad 0\le b<p^t,
\]

where \(\lambda p^t\) is the leading base-p digit term of q.

### Case 2.1: b>0

Choose the admissible lower index k=mb. Write

\[
mb=u+p^tX,\qquad 0\le u<p^t,\qquad
X=\left\lfloor\frac{mb}{p^t}\right\rfloor.
\]

Because b<p^t,

\[
0\le X<m<p^r.
\]

The complementary summand is

\[
N-k=m\lambda p^t.
\]

Below digit t the second summand is zero, so no carry can occur there and no carry enters digit t. From digit t upward the carry pattern is exactly the carry pattern in

\[
X+\lambda m.
\]

Moreover

\[
X+\lambda m
<
m+(p-1)m
=pm
<p^{r+1}.
\]

Therefore no carry can leave digit r, so at most r carries occur. Hence

\[
v_p\binom{mq}{mb}\le r.
\]

### Case 2.2: b=0 and lambda>=2

Now q=\lambda p^t. Choose k=mp^t. After removing the common p^t shift, the carry count is that of

\[
m+(\lambda-1)m=\lambda m.
\]

Since \(\lambda m<pm<p^{r+1}\), at most r carries occur.

### Case 2.3: b=0 and lambda=1

Then q=p^t, and q>=2 forces t>=1. Choose k=mp^{t-1}. After shifting by p^{t-1}, the addition is

\[
m+(p-1)m=pm<p^{r+1},
\]

so again there are at most r carries.

Thus every admissible N satisfies

\[
v_p(G(N;m))\le r.
\]

## 3. Target A: attainment

We now prove that equality occurs for at least one admissible row.

### Case 3.1: r=1

Here m<p. Take N=mp. Every admissible lower index is k=md with 1<=d<=p-1. Both md and m(p-d) have nonzero least base-p digits, while their sum mp is divisible by p. Their least digits therefore sum to p, so there is a carry in the units column. Kummer gives

\[
v_p\binom{mp}{md}\ge1
\]

for every d. The universal upper bound gives the reverse inequality for the gcd, hence

\[
v_p(G(mp;m))=1.
\]

### Case 3.2: r>=2

Put

\[
P=p^{r-1}.
\]

Since r is minimal and p∤m,

\[
P<m<pP.
\]

Write uniquely

\[
m=aP+c,
\qquad 1\le a\le p-1,
\qquad 1\le c<P.
\]

Let h be the multiplicative order of p modulo m. Choose an exponent L such that

\[
L\equiv r-1\pmod h,
\qquad
L\ge2r-2,
\qquad
L>r-1.
\]

Then

\[
p^L\equiv p^{r-1}=P\pmod m.
\]

Define

\[
N=a p^L+c.
\]

It is admissible because

\[
N\equiv aP+c=m\equiv0\pmod m,
\]

and N>m.

We claim that every decomposition

\[
N=x+y,
\qquad x>0,\ y>0,\qquad m\mid x,\ m\mid y,
\]

has at least r base-p carries.

Assume for contradiction that there are at most r-1 carries.

First, there must be a carry across the p^L boundary. If not, write

\[
x=A p^L+u,\qquad y=B p^L+v,\qquad 0\le u,v<p^L.
\]

No carry across that boundary gives

\[
u+v=c,\qquad A+B=a.
\]

Since p^L≡P mod m and m|x,

\[
AP+u\equiv0\pmod m.
\]

But

\[
0\le AP+u\le aP+c=m.
\]

Hence AP+u is either 0 or m. The first possibility forces A=u=0 and therefore x=0. The second forces A=a and u=c, hence B=v=0 and y=0. Both contradict positivity. Thus a carry does cross the p^L boundary.

Consider the final consecutive chain of carries ending at that boundary. Let its length be ell. Since the total number of carries is at most r-1,

\[
1\le\ell\le r-1.
\]

Set

\[
s=L-\ell.
\]

By maximality of the final chain there is no carry across the p^s boundary. Also

\[
s\ge L-r+1\ge r-1,
\]

so c<p^{r-1}<=p^s. Write

\[
x=A p^s+u,\qquad y=B p^s+v,\qquad 0\le u,v<p^s.
\]

No carry across p^s gives

\[
u+v=c,\qquad A+B=a p^\ell.
\]

Because s+ell=L and p^L≡p^{r-1} mod m,

\[
p^s\equiv p^{r-1-\ell}\pmod m.
\]

Let D=p^{r-1-\ell}. From m|x,

\[
AD+u\equiv0\pmod m.
\]

But

\[
0\le AD+u
\le
a p^\ell p^{r-1-\ell}+c
=
aP+c
=
m.
\]

Again AD+u is 0 or m. The first gives x=0. The second forces A=a p^\ell and u=c, hence B=v=0 and y=0. Contradiction.

Therefore every admissible binomial coefficient in row N has p-adic valuation at least r. Together with the universal upper bound,

\[
v_p(G(N;m))=r.
\]

This proves Target A:

\[
\boxed{
\max_{\substack{N>m\\m\mid N}}v_p(G(N;m))=r_p(m)
}
\]

for every prime p, every m>=2, and p∤m.

McTague's Theorem Q already contains the subcase p≡1 mod m, where r_p(m)=1; that subcase remains prior art.

## 4. Existence of the least extremal row

Target A includes an explicit existence proof for at least one admissible row attaining r_p(m). Hence

\[
\mathcal E_{p,m}
=
\{N>m:m\mid N,\ v_p(G(N;m))=r_p(m)\}
\]

is nonempty. By well-ordering it has a least element. Only now do we define

\[
T_p(m)=\min\mathcal E_{p,m}.
\]

## 5. Target B: notation

Fix a prime p and a>=2. Put

\[
Q=p^a,\qquad
m=Q+1.
\]

Then

\[
p^a<m<p^{a+1},
\]

so Target A gives

\[
r_p(m)=a+1.
\]

Define

\[
q_0=Q^2-Q+1,
\qquad
N_0=mq_0=Q^3+1=p^{3a}+1.
\]

We prove that N_0 attains a+1 and that every admissible row mq with 2<=q<q_0 has valuation at most a.

## 6. Target B: attainment at p^(3a)+1

For 1<=d<q_0 put k=md. Since

\[
N_0=p^{3a}+1,
\]

we have

\[
N_0\bmod p^i=1
\]

for every 1<=i<=3a. For i>=3a+1, p^i>N_0, so no borrow can occur.

We show that every k has at least a+1 borrow levels among 1,...,3a.

### Case 6.1: p|k

Since p∤m, let

\[
t=v_p(k)=v_p(d)\ge1.
\]

For i<=t, k mod p^i=0. For i>t, k mod p^i is a nonzero multiple of p^t, hence is at least p>1. Therefore the borrow count among 1,...,3a is exactly

\[
3a-t.
\]

Because d<q_0<Q^2=p^{2a},

\[
t\le2a-1,
\]

so

\[
3a-t\ge a+1.
\]

### Case 6.2: p∤k

Let

\[
s=v_p(k-1).
\]

For i<=s, k mod p^i=1. For i>s, the residue is nonzero and cannot equal 1, hence is >1. Thus the borrow count is 3a-s.

We claim s<=2a-1. Otherwise k=md≡1 mod Q^2. But

\[
(1+Q)(1-Q)=1-Q^2\equiv1\pmod{Q^2},
\]

so

\[
m^{-1}\equiv1-Q\equiv Q^2-Q+1=q_0\pmod{Q^2}.
\]

Hence d≡q_0 mod Q^2, impossible because 1<=d<q_0<Q^2. Thus s<=2a-1 and again

\[
3a-s\ge a+1.
\]

So every selected coefficient in row N_0 has valuation at least a+1.

To show equality, take

\[
d_0=p^{2a-1}.
\]

For a>=2,

\[
d_0<q_0.
\]

Then

\[
k_0=md_0=p^{3a-1}+p^{2a-1}.
\]

Against N_0 mod p^i=1, the borrow levels are precisely

\[
i=2a,2a+1,\ldots,3a,
\]

which are a+1 levels. Therefore

\[
v_p\binom{N_0}{k_0}=a+1.
\]

Hence

\[
\boxed{v_p(G(p^{3a}+1;p^a+1))=a+1.}
\]

This proves existence for the special m=p^a+1 independently before the least-row conclusion below is invoked.

## 7. Target B: strict non-attainment below the target

Let

\[
2\le q<q_0
\]

and N=mq. We construct an admissible d with

\[
1\le d<q,
\qquad
v_p\binom{mq}{md}\le a.
\]

Write the leading base-p decomposition

\[
q=\lambda p^t+b,
\qquad
1\le\lambda\le p-1,
\qquad
0\le b<p^t.
\]

### Case 7.1: b=0

If lambda>=2, choose d=p^t. After removing the common p^t shift, the carries are those in

\[
m+(\lambda-1)m=\lambda m.
\]

Since a>=2,

\[
\lambda m
\le(p-1)(Q+1)
<pQ=p^{a+1}.
\]

Thus no carry leaves digit a, so there are at most a carries.

If lambda=1, then q=p^t with t>=1. Choose d=p^{t-1}. After shifting, the addition is

\[
m+(p-1)m.
\]

Because m=Q+1 has base-p digits 1 exactly in positions 0 and a, this addition has exactly two carries: one from position 0 and one from position a. Since a>=2,

\[
2\le a.
\]

Thus again the valuation is at most a.

### Case 7.2: b>0 — the leading-split witness

First try d=b. Put

\[
X=\left\lfloor\frac{mb}{p^t}\right\rfloor.
\]

Because b<p^t,

\[
0\le X<m=Q+1,
\]

so 0<=X<=Q. Exactly as in the Target-A upper-bound proof, the carry count for

\[
mb+m\lambda p^t
\]

equals the carry count for

\[
X+\lambda m.
\]

This has at most a+1 carries.

If it has at most a carries, we are done. Suppose it has a+1 carries. Then every possible carry position 0,1,...,a occurs. Since

\[
\lambda m=\lambda Q+\lambda,
\]

this forces

\[
\lambda=p-1
\]

and

\[
Q-p+1\le X\le Q-1.
\]

Indeed, to carry through positions 0,...,a-1, the digits of X in positions 1,...,a-1 must all be p-1 and the units digit must be at least 1; to carry out of position a, the incoming carry plus the top digit lambda must reach p, forcing lambda=p-1.

Write

\[
h=p^t-b.
\]

Then

\[
q=p^{t+1}-h
\]

and

\[
X
=
Q+1-\left\lceil\frac{mh}{p^t}\right\rceil.
\]

The exceptional range for X is therefore equivalent to

\[
2\le
\left\lceil\frac{mh}{p^t}\right\rceil
\le p,
\]

hence, since m is coprime to p,

\[
p^t<mh<p^{t+1}.
\]

The upper inequality implies t>=a: if t<=a-1 then p^{t+1}<=Q<m<=mh, contradiction.

Since q<q_0<Q^2, we have t<=2a-1. The value t=2a-1 is impossible here: q<q_0 would give h>=Q, hence mh>Q^2=p^{t+1}, contradicting mh<p^{t+1}. Therefore

\[
a\le t\le2a-2.
\]

Let

\[
P=p^{a-1}.
\]

From mh<p^{t+1},

\[
h<\frac{p^{t+1}}m
<
p^{t-a+1}
\le P.
\]

We now use the fallback witness

\[
d=P.
\]

It is admissible because q>p^t>=Q>P.

Set

\[
K=mP=P+p^{2a-1}.
\]

Also write

\[
N=mq
=
p^{t+a+1}+R,
\qquad
R=p^{t+1}-mh>0.
\]

Put L=t+a+1.

We claim that there is no borrow at any level i<2a.

For i<=a-1, K mod p^i=0.

For a<=i<=2a-1,

\[
K\bmod p^i=P.
\]

It remains to prove N mod p^i>P.

If i<=t+1, then

\[
R\bmod p^i=(-mh)\bmod p^i.
\]

Because h<P, the two summands h and Qh in

\[
mh=h+Qh
\]

occupy disjoint base-p digit blocks. Hence

\[
mh\bmod p^i
=
h+Q(h\bmod p^{i-a})
\]

and

\[
mh\bmod p^i
\le
(P-1)+Q(p^{i-a}-1)
=
p^i-(Q-P+1)
\le
p^i-P-1.
\]

Therefore

\[
R\bmod p^i\ge P+1.
\]

If i>t+1, then R<p^{t+1}<p^i, so N mod p^i=R. Since

\[
a\le t\le2a-2,
\]

write s=t+1-a with 1<=s<=a-1. Modulo m=Q+1,

\[
p^{t+1}=Qp^s\equiv-p^s,
\]

so the least positive residue of p^{t+1} modulo m is

\[
m-p^s=Q+1-p^s\ge Q+1-P\ge P+1.
\]

Because R is a positive integer congruent to p^{t+1} modulo m,

\[
R\ge P+1.
\]

Thus no borrow occurs below level 2a.

For i>=L+1, p^i>N, so no borrow occurs there either. Consequently all borrows are confined to

\[
2a\le i\le L.
\]

There are at most

\[
L-2a+1
=
t-a+2
\le a
\]

such levels. Hence the fallback witness satisfies

\[
v_p\binom{mq}{mP}\le a.
\]

This completes all cases and proves that every admissible row below N_0 has valuation at most a.

Therefore

\[
\boxed{
T_p(p^a+1)=p^{3a}+1
}
\]

for every prime p and every a>=2.

## 8. Endpoint and exception checks

1. **The lower indices are always admissible.** Every witness is of the form k=md with 1<=d<q, so m|k and 0<k<N are explicit.
2. **Target A, r=1, is separate.** The sharpness construction using m=a p^{r-1}+c requires r>=2 because c must be nonzero below p^{r-1}. The row N=mp handles r=1 directly.
3. **The condition p∤m is used essentially in Target A attainment.** It guarantees a nonzero remainder c and the existence of the multiplicative order of p modulo m.
4. **Target B uses a>=2 essentially.** In the pure-power multiplier case the fallback valuation is exactly 2, which is <=a only for a>=2. Several later inequalities also use Q=p^a with a>=2.
5. **The a=1 regime is not part of Target B.** In particular, McTague already gives the exact instance v_2(G(6;3))=2, and because 6 is the first admissible row this yields the known T_2(3)=6 case. No new claim about that case is made here.
6. **No experiment is part of the proof.** The Stage-2 computations were used only to debug candidate witnesses and edge cases.

## 9. Failed approaches worth preserving

These shortcuts were tested and rejected before the final arguments above.

- **Always taking k=m does not prove the Target-A upper bound.** For p=2 and m=5, r_p(m)=3, but
  \[
  v_2\binom{20}{5}=4.
  \]
  The successful upper bound instead splits the multiplier q at its leading base-p digit.
- **The row N=mp^r need not attain the Target-A maximum.** For p=2,m=5,r=3, the row N=40 has
  \[
  v_2\binom{40}{20}=2,
  \]
  so v_2(G(40;5))<=2<3.
- **A universal p^L+1 sharpness row is unavailable.** For example powers of 2 modulo 7 are 1,2,4, so no power is -1 modulo 7. The successful Target-A construction uses the leading base-p digit decomposition
  \[
  m=a p^{r-1}+c
  \]
  and the repeated row shape
  \[
  N=a p^L+c.
  \]
- **For Target B, the leading-digit split alone is not always strict enough below the target.** At p=2,a=3,m=9,q=29, the leading split d=13 gives four carries, equal to a+1. The fallback d=p^{a-1}=4 gives three carries. This is exactly the exceptional leading-digit pattern handled in Case 7.2.

## 10. Stage-3 conclusion

The exact informally proved statements ready for Stage 4 are:

**Target A.** For every prime p and m>=2 with p∤m,

\[
\max_{\substack{N>m\\m\mid N}}v_p(G(N;m))
=
r_p(m).
\]

**Target B.** For every prime p and a>=2,

\[
T_p(p^a+1)=p^{3a}+1.
\]

These are proof-status statements only. Historical uniqueness and novelty remain unresolved until the final theorem-level Stage-4 audit, including the unresolved full-text comparison with Chung–Yang (2026).
