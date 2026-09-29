# Session 04 handoff — Stage 4 audit run, clearance withheld

Date: 2026-09-29

## Scope completed

This session stayed within Stage 4. No Lean, Palomar registration, paper writing, or arXiv work was started.

The exact Stage-3 statements were audited in Wu's \(g(m,n)\) notation and in the project's row notation. Primary-source rechecks were completed for Wu and McTague, adjacent sources were rechecked, exact construction/minimality searches were rerun, and a renewed attempt was made to obtain the full Chung–Yang 2026 article.

The detailed record is in `notes/prior-art-audit-4.md`.

## Confirmed prior-art boundaries

- Wu 2026 defines exactly the same selected GCD family \(g(m,n)=G(mn;m)\).
- McTague Theorem Q already gives the full Target-A subcase \(p\equiv1\pmod m\).
- McTague explicitly records \(v_2(G(6;3))=2\), so \(T_2(3)=6\) is known.
- Kummer carry/borrow theory and the minimum-valuation rule for a GCD are prior art.
- Chung–Yang–Zhou 2025 and Chiu–Yuan–Zhou 2023 are close but use exact-gcd/non-coprime/central-band selection rules rather than the project's fixed-multiple set.

## Exact negative-search result

No equivalent result was located for either of the following exact informally proved statements:

\[
\max_{\substack{N>m\\m\mid N}}v_p(G(N;m))=r_p(m)
\quad(p\nmid m),
\]
outside the already attributed McTague subcase, or
\[
T_p(p^a+1)=p^{3a}+1
\quad(a\ge2).
\]

The same negative result held after translating Target B to the least-multiplier statement
\[
\min\{n\ge2:v_p(g(p^a+1,n))=a+1\}
=
p^{2a}-p^a+1
=
\Phi_6(p^a),
\]
including strict non-attainment at all smaller multipliers.

This is not a uniqueness claim.

## Unresolved blocker

Chan-Liang Chung and Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, *Mediterranean Journal of Mathematics* 23, article 209 (2026), was published on 27 September 2026.

The Springer abstract and metadata were inspected. The advertised selected set is different from the project's fixed-multiple set, and the abstract does not state Target A or B. However, the full theorem text remains inaccessible through the available sources.

This session attempted:
- the publisher PDF and DOI PDF routes;
- SharedIt;
- exact-title + PDF and theorem-number searches;
- preprint / accepted-manuscript / author-manuscript / repository searches;
- Fuzhou University and Soochow University affiliation searches;
- ResearchGate and ORCID searches;
- formula searches around \(p^t+1\), exact \(p\)-adic valuations, and \(B_{>1}\).

No inspectable full text or theorem-level mirror was located.

## Next action

Continue **Stage 4 only**. Obtain an inspectable lawful copy of the Chung–Yang 2026 article, then compare every theorem, lemma, and corollary with:

1. \(g(m,n)=G(mn;m)\);
2. the universal Target-A upper bound and equality construction;
3. the least-multiplier form of Target B;
4. \(p^{2a}-p^a+1=\Phi_6(p^a)\);
5. strict non-attainment at all smaller multipliers.

Do not start Lean until the single authoritative Stage-4 gate in `notes/prior-art-audit-4.md` is revised to clear an exact theorem.

## Copy-paste prompt for the continuation session

Continue the Pascal Extremes project from the repository handoff at jfairfaxball-348/Pascal-Extremes.

Read AGENTS.md, STATUS.md, notes/targets.md, notes/prior-art-audit-2.md, notes/proof.md, notes/prior-art-audit-4.md, and notes/session-04-handoff.md first.

This is a Stage-4 continuation only. Do not begin Lean, Palomar registration, paper writing, or arXiv work.

The only remaining Stage-4 blocker is the full theorem-level inspection of Chan-Liang Chung and Tse-Chung Yang, The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices, Mediterranean Journal of Mathematics 23, article 209 (2026), DOI 10.1007/s00009-026-03202-3. Obtain an inspectable lawful full text or author manuscript if possible, then compare every theorem/lemma/corollary with the project's fixed-multiple family g(m,n)=G(mn;m), Target A, and Target B, including the least multiplier p^(2a)-p^a+1=Phi_6(p^a) and strict lower-multiplier non-attainment.

Append exact theorem/page references and the comparison result to notes/prior-art-audit-4.md, update STATUS.md and the handoff, and revise the single Stage-4 gate only if the unresolved equivalence is genuinely closed. Do not infer uniqueness from a negative search.
