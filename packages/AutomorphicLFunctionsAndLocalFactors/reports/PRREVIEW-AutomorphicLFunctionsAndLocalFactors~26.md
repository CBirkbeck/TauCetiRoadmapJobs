# Review of AutomorphicLFunctionsAndLocalFactors (pull request #3027 at 71bbefa)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 126 changed lines since `aecb53a`. The five sections added to Layer AL.3 (AL.3.2.4, AL.3.3.2a, AL.3.3.8a, AL.3.7.1a, AL.3.9.7), the edited Conventions, scope and supplier text, their citations of SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups, and every source that can be read legally were checked again, with the statements recomputed; the folder's text is the one the previous review read, which raised no finding, and none is raised now: accepted, with three small corrections (the same three, not yet applied) and no format notes. Left for a human: the source the new text cites most (Jacquet–Piatetski-Shapiro–Shalika 1983) and three others are paywalled and could not be compared.

## C01 — The exponent bound AL.3.3.8a is limited to characteristic zero, although its one characteristic-zero input is a theorem over every nonarchimedean local field

Every other local statement of the roadmap is made for local fields of either characteristic (Conventions, line 37), and a consumer in positive characteristic (LocalFactorsOfTwistsAndTypes 6.3 at this head) has to keep a route of its own for the same bound.

The section says itself (line 1459) that the restriction "is that of the supplier target *modular-generic-segments*, which is stated for finite extensions of `ℚ_p`; it is not a restriction of the sources". The only step that uses that supplier is: an irreducible generic representation is an irreducible product `L(Δ₁)×⋯×L(Δ_r)` of pairwise unlinked segments, with the multiset determined. SR.5.2a *zelevinsky-classification*, which this pull request adds over any nonarchimedean F, already gives the irreducibility of such products (clause (ii)) and the uniqueness (clause (i)); what is missing is only that the generic irreducible representations are exactly these, Zelevinsky 1980, Theorem 9.7 (b). The remaining steps (AL.3.2.2, AL.3.2.3, AL.3.3.1, the Hermitian form, the pole of `L(s,π₀×π₀∨)`) do not depend on the characteristic.

The smallest repair would cite Theorem 9.7 (b), as a further clause of SR.5.2a or as a step of this target, in place of *modular-generic-segments*, and then drop "of characteristic zero" (line 1457), the characteristic paragraph (line 1459) and the exception in the Conventions (line 37).

## C02 — The rank-(n−1) route of AL.3.9.7 uses a completeness lemma that no target or supplier states

An implementer of the rank-(n−1) form must prove it, and neither the *Needs:* line nor any section of this roadmap or of SmoothRepresentationsOfLocalGroups states it. The route (line 1787) concludes from the vanishing of all twisted integrals with the sentence "a smooth function with that support and equivariance whose integrals against all those Whittaker functions vanish is zero": the function is ψ-equivariant under `N_(n−1)` on `GL_(n−1)(F)`, compactly supported modulo `N_(n−1)` on each set where `|det|` is constant, and orthogonal to the Whittaker functions of every irreducible generic representation of `GL_(n−1)(F)`.

One sentence would settle it: say that this lemma is part of the target, with the hypotheses above and its locator in the cited proof.

## C03 — The description says every added section keeps its source's generality, which AL.3.3.8a does not

The description says the general roadmaps receive sections, "each a theorem published before 20 November 2026 and stated in the generality of its source", and its parenthetical names exceptions only in AnalyticNumberTheoryPartI and ArithmeticDirichletSeriesPartII. AL.3.3.8a is stated in characteristic zero and says that this is not a restriction of the sources (line 1459). If C01 is applied the sentence becomes true; otherwise add to the parenthetical: "and in AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a in characteristic zero, the generality of its supplier for the classification of generic representations".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Seeded sample: Check for the theta-Mellin formula (AL.3.5.1, untouched) | point mass, n=2, `|det g|=3`, θ₀=5, `|a|=2`, η=1, s=1 | `3¹·5·2^(2·1)=60`; without n: `3·5·2=30`; CogdellColumbia line 264–267 (§1.1.3, p.4) has `|a|^(ns)`, Re(s)>1, η unitary | holds |
| AL.3.2.4 Steinberg Check | St of GL₂, ψ unramified | `∫W(diag(a,1))|a|^(s−1/2)d×a=Σq^(−m(s+1/2))=L(s,St)` confirms `W=|a|1_O`; `Σq^(−2m)q^m=q/(q−1)` | holds |
| AL.3.2.4 tempered negative control | Satake parameters 1, 1 | `W(diag(ϖ^m,1))=(m+1)q^(−m/2)`; `Σ(m+1)²q^(−m)q^m=∞` | holds |
| AL.3.2.4 two forms of the integral | n=2, Iwasawa `G=ZNA₁K` | `δ_B⁻¹(diag(t,1))=|t|^(−1)`: weight `|det p|^(−1)`, exponent `s−1` at s=0 | holds |
| AL.3.2.4 holomorphy on `Re(s)>0` | n=m=1 unitary χ, χ′; CPS Thm 2.3 | pole of `(1−χχ′(ϖ)q^(−s))^(−1)` on `Re(s)=0`; Corollary, CogdellPiatetskiShapiroDerivatives line 1735 (p.32) | holds |
| AL.3.3.2a equal-rank symmetry | n=m=2, ε=diag(−1,1), ε′=diag(1,−1), centre −I | `e₂ε=e₂`, `e₂ε′=−e₂`; signs `ω_πω_τ(−1)·ω_τ(−1)=ω_π(−1)`; `γ(τ×π)=γ(π×τ)` | holds |
| AL.3.3.2a Check 2 | St × `|·|^(1/2)` | `L(s,St×χ)=L(s+1,1)`; product of characters `L(s+1,1)L(s,1)`: differ by `L(s,1)` | holds; L not multiplicative |
| AL.3.3.2a Check 1 | n=2, m=1 | sign exponent `n−1`: `ω_χ(−1)` enters both sides once; product of two Tate γ | holds |
| AL.3.3.8a pairing of exponents | `δν^t`, δ unitary | conjugate `δ̄ν^t`, contragredient `δ∨ν^(−t)`, `δ̄≅δ∨`: multiset stable under `t↦−t` | holds |
| AL.3.3.8a bound | complementary series `ν^tχ×ν^(−t)χ` | factor `L(s−2t,χ×χ⁻¹)`, pole at `s=2t`; no pole on `Re(s)≥1` forces `2t<1`; t=1/2 reducible | holds |
| AL.3.3.8a Checks | unramified; St; trivial of GL₂; n=1 | `|α|=q^(−t)`; St: r=1, t=0; trivial: exponents ±1/2, not generic; n=1: t=0 | hold |
| AL.3.3.8a characteristic | `F=𝔽_p((t))` | SR.5.2a (i), (ii) over any F at this head; genericity clause (Zelevinsky 9.7 (b)) absent | true there too → C01 |
| AL.3.7.1a | n=1; centre; unramified place | `cχ(g⁻¹)=cχ⁻¹(g)`; central character `ω⁻¹`; Satake `α↦α⁻¹`; CogdellFields line 1810–1811, 1944–1946 | holds |
| AL.3.9.7 Check 2 | n=2, unramified `{a,b}`, `X=χ(ϖ)q^(−s)` | `γ∝(1−aX)(1−bX)/((1−(qaX)⁻¹)(1−(qbX)⁻¹))`; cancellation only if `b=q^(±1)a` (reducible) | holds |
| AL.3.9.7 supercuspidal form | Henniart 2002 §1.9 Corollaire | generic π, π′, supercuspidal ρ of ranks 1…n−1, no central-character hypothesis; PDF page 6 = p.592 | holds |
| AL.3.9.7 `⌊n/2⌋` form | Jacquet–Liu Conj. 1.1 (p.1), Thm 1.3 (p.3); Chai Thm 1.1 (p.2) | equal central characters, generic twists of ranks `≤[n/2]`; n=2: `⌊n/2⌋=n−1`, consistent with Check 1 | holds |
| Conventions exception (line 37) | against AL.3.3.8a line 1457 | both say characteristic zero, for the same supplier reason | consistent |

- Source locators checked against the text: 14 (Cogdell–Piatetski-Shapiro §1.4 p.10, §2.6.2 p.30, Theorem 2.3 p.31, Corollary p.32; Henniart 2002 §§1.1–1.2, §1.9, §2.6; Jacquet–Liu Conjecture 1.1 and Theorem 1.3; Chai Theorem 1.1; Tadić Theorem D; Cogdell Fields remark after Proposition 5.1 and Proposition 5.3 (iii); Cogdell Columbia §1.1.3).
- Cross-roadmap citations resolved at this head: 13 (SR.0.4 *smooth-dual*, SR.2.2 *parabolic-induction*, SR.3.1 *finite-length* and *cuspidal-support*, SR.3.3 *square-integrable-tempered* and *casselman-criterion*, SR.3a.1 *jacquet-subrepresentation*, SR.4, SR.5.1 *mirabolic-derivatives*, SR.5.2 *modular-generic-segments* and *segment-representations*, SR.5.2a clause (v), AdelicAlgebraicGroups §2.2 *quotient-measure*). SR.5.2a is added by this pull request; *modular-generic-segments* is stated for finite extensions of `ℚ_p`, as the README says.
- Untouched sections the change depends on, read against it: AL.3.2.2 (convergence on `Re(s)≥1` for unitary generic pairs), AL.3.2.3, AL.3.3.1 (product of L-factors for irreducible inductions from essentially square-integrable blocks), AL.3.3.2 (sign `ω_{π_m}(−1)^(n−1)`).
- Consumers of the new ids at this head: LocalFactorsOfTwistsAndTypes 6.1–6.4 and BaseChangeAndGaloisRepresentationsForUnitaryGroups 14.0a; no other roadmap, open or on main, states these five results.
- Record: the merge-base README has 6 layers; none removed or retitled, 0 headings removed, 5 added; `main` has not changed this folder or SmoothRepresentationsOfLocalGroups since the merge base, and the folder is unchanged since the previously reviewed head.
- Dependency check: `depcheck: 132 roadmaps, 1478 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, 14 `sorry` warnings and nothing else.
- Automatic checks: all passed. No file changed outside the folders the pull request owns. Earlier findings: the previous review had none; its three small corrections are not applied and are repeated above.

Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, GL2AutomorphicRepresentationsAndTransfer, AutomorphicSpectralTheory, LocalFactorsOfTwistsAndTypes, GlobalShtukasAndFunctionFieldLanglands, MetaplecticAutomorphicForms, CongruenceSpectralGap, TwistedAutomorphicDescents; shared: γ-multiplicativity (owner AL.3.3.2a; LocalFactorsOfTwistsAndTypes 6.2 cites it), the local converse theorem (owner AL.3.9.7; LocalFactorsOfTwistsAndTypes 6.4 is a corollary), the exponent bound (owner AL.3.3.8a in characteristic zero; LocalFactorsOfTwistsAndTypes 6.3 keeps positive characteristic, C01), the pairing at s = 0 (owner AL.3.2.4; LocalFactorsOfTwistsAndTypes 6.1 extends it), the transpose-inverse contragredient (owner AL.3.7.1a; BaseChangeAndGaloisRepresentationsForUnitaryGroups 14.0a is a corollary).

Source independence: changed passages only. 9 passages compared with 6 sources (Cogdell–Piatetski-Shapiro, Henniart 2002, Jacquet–Liu, Chai, Tadić, Cogdell's Fields lectures), none shared beyond what the mathematics forces; largest share Jacquet–Piatetski-Shapiro–Shalika 1983, 10 of 30 locators in the added sections, not readable (paywalled); no layer added, removed or reordered, so the arrangement was not compared.

Research link: the added AL.3 sections are the local Rankin–Selberg theorems of Jacquet–Piatetski-Shapiro–Shalika (1983), the generic unitary dual of Bernstein (1984) and Tadić (1986), and the local converse theorems of Henniart (1993) and Jacquet–Liu (2018), which Henniart (2002) uses to characterise the local Langlands correspondence for GL(n). Rests on the README's sources and Henniart 2002 §1.9, Jacquet–Liu p.3, read.

## Not verifiable

- Jacquet–Piatetski-Shapiro–Shalika, *Rankin–Selberg convolutions* (Amer. J. Math. 1983): publisher copy only (paywalled); its locators in AL.3.2.4, AL.3.3.2a and AL.3.3.8a were not read.
- Henniart, *Caractérisation … par les facteurs ε de paires* (Invent. Math. 1993): paywalled; Théorème 1.1, its Remarque, §3 and Lemme 3.5 were not read. Jacquet–Liu (p.2) and Chai (p.1) describe its theorem with twists of every rank `1≤r≤n−1`, the README with rank `n−1` alone; the statement is true in either reading, since the sketched route uses rank `n−1` only.
- Bernstein, *P-invariant distributions on GL(N)* (LNM 1041, 1984): paywalled; §8.9 was not read.
- Jacquet–Shalika, *On Euler products … I* (Amer. J. Math. 1981): paywalled; Proposition (1.5) and Corollary (2.5) were not read.

## Source issues

- **Misprint** in CogdellFields at Lecture 7, References [1], printed p.59: the source says Jacquet–Shalika I runs over pages 499–588 of Amer. J. Math. 103; it should be 499–558; affects nothing.

## For the human reviewers

- Not tested: the source with the largest share of the added sections' locators, Jacquet–Piatetski-Shapiro–Shalika 1983 (10 of 30), is paywalled. Wording and arrangement were not compared against it, nor against Henniart 1993, Bernstein 1984 or Jacquet–Shalika 1981.
