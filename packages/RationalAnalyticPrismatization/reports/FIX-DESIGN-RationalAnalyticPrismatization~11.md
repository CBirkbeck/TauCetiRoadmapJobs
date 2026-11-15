# Repair of RationalAnalyticPrismatization (design, round 11)

There was one review, `REV-DESIGN-RationalAnalyticPrismatization~10`. Its verdict was `needs_changes`, with seven findings: one P1, one P2 and five P3.

- Each finding was checked against the cached source texts (ALRS, ABLB) before any edit. All seven hold, and all seven are applied.
- Files changed:
  - `packages/RationalAnalyticPrismatization/design/README.md`
  - `packages/RationalAnalyticPrismatization/design/plan.json`
  - `packages/RationalAnalyticPrismatization/sources.toml` (one locator added to the ABLB entry)
- Every README change to a statement, API bullet or Check is mirrored verbatim in `plan.json`. The plan carries no proof routes.
- The review's "For the human reviewers" section (scope, licence, Gestalten ownership) lists no finding, and nothing was changed because of it.

## F01 (P1) — applied

**Verified.** ALRS Definition 2.3.3 (ALRS line 1032) defines X(ℚ_p)^la as X ×_{X^dR} X(ℚ_p)^dR. For a nilperfectoid A, ALRS Definition 2.3.1 (ALRS line 1021) gives X^dR(A) = X(Marc(A^u)).

For a light profinite set S = lim S_i, maps Marc(A^u) → S_i are clopen partitions of M(A), which are given by idempotents. So S^dR(A) = lim_i C(M(A), S_i) = C(M(A), S): continuous maps, not locally constant ones.

The witness checks out. For A = C(ℤ_p, C_p), we get ℚ_p^la(A) = C(ℤ_p, ℚ_p). This agrees with 7.5 (ALRS Example 3.6.6): Γ(FF_A, O) = C(ℤ_p, ℚ_p).

**Change (3.4, third API bullet).** "comes from a locally constant map" → "comes from a continuous map M(A) → X(ℚ_p); for a light profinite set S, S^dR(A) = S(Marc(A^u)) is the set of continuous maps M(A) → S, which need not be locally constant". New Check `laPoints_continuous`: for A = C(ℤ_p, C_p), ℚ_p^la(A) = C(ℤ_p, ℚ_p) contains the inclusion ℤ_p → ℚ_p.

**Same pattern elsewhere.**
- The other "locally constant" occurrences describe function algebras (Conventions, 2.5, 3.1, 7.x) or points over rings with M(A) a point (3.4 first Check, Layer 3 Examples). All are correct as written.

## F02 (P2) — applied

**Verified.** ALRS §5.2.2 assumes G compact throughout (ALRS line 5086), and Lemma 5.2.26 states it again (ALRS line 5664). M^la is defined in 10.3 for compact G only.

**Change (10.5).** The statement opens "Let G be a compact p-adic Lie group."; Remark 5.2.25 reads "for compact p-adic Lie groups G and H acting"; the second API bullet begins "For compact p-adic Lie groups G and H", the third "For compact G,". The plan hypothesis already said compact.

**Same pattern elsewhere.** No other occurrence:
- 10.7 and 10.8 already assume compact G, or uniform pro-p G.
- 10.6, 10.9 and 10.12 use O^la_X = h_*O and local compact opens, which make sense for every G.

## F03 (P3) — applied

**Verified.** ALRS line 2924 prints B(G_a^dR ⊗ D_{−λ}) in the lower left corner of the square. The proof (ALRS line 2931) and the extension by B(G_a^† ⊗ D_{−λ}) (ALRS line 2926) both need B(G_a^an ⊗ D_{−λ}) there.

**Change (7.6).** "the analogous square with B(G_a^dR ⊗ D_{−λ})" → "BC(O(λ)[1]) = B(G_a^an ⊗ D_{−λ}) ×_{B(G_a^{an,dR} ⊗ D_{−λ})} BC(O(λ)[1])^dR, so that B(G_a^† ⊗ D_{−λ}) → BC(O(λ)[1]) → BC(O(λ)[1])^dR is an extension", with a note on the printed corner. The third Check gains λ = −1 at C_p[ε]/ε²: π₁ = C_p·ε ⊗ D_1 ≠ 0.

**Same pattern elsewhere.** G_a^dR occurs nowhere else in the README.

## F04 (P3) — applied

**Verified.** The opening sentence of 10.9 cited ALRS Lemma 5.6.2 and Proposition 5.6.4 by number only. These were read at ALRS lines 6348–6367 and 6444–6451. Separately, "O_K" appeared without any field K.

**Change (10.9).** The by-number sentence → full statements of Lemma 5.6.2 (five hypotheses; cartesian square, transfer of classical decompletion, transfer of Perf-equivalence) and Proposition 5.6.4 (G, Λ, ϖ, E as in 10.8; A ϖ-complete, A/ϖ discrete, ϵ-TORS uniformly on G). Corollary 5.6.12 names K and B_{j,0}. *Needs* gains §10.6 and §2.2; plan hypotheses, locator and prerequisites follow.

**Where this differs from the suggested repair.**
- I added "ϵ ∈ E", because ϖ^ϵ must exist.
- I wrote "filtered system": the source says "cofiltered" (ALRS line 6825) but takes a colimit, both there and in its proof (ALRS line 6835).

**Same pattern elsewhere.** A scripted search for "Prove … of <source> <number>" with no statement found no other case.

## F05 (P3) — applied

**Verified.** τ(α) occurred only in 10.4. ALRS line 5333–5334 defines it as Σ_i w(g_i)α_i, with rational w_i.

**Change (10.4).** After "→ 0" insert ", where τ(α) = Σ_i w(g_i)·α_i for the p-valuation w and the ordered basis g_1, …, g_d defining the coordinates (10.3), the values w(g_i) being made rational by modifying w (…)", mirrored in the plan hypothesis. New Check `binomial_tauWeights`: for G = 1 + p²ℤ_p, τ(n) is 2n or n depending on w.


## F06 (P3) — applied

**Verified.** The rings A⟨f/g⟩_{≤1} are defined in 1.6, and 1.6 lists 1.5 in its *Needs*. ABLB Definition 3.1.15 (ABLB lines 1341–1344) also defines κ(x) directly as the completed residue field of A^u.

**Change.** 1.5: κ(x) is now the completed residue field of A^u at x; its API bullet says x is the pullback of the absolute value of κ(x). 1.6 gains the stalk A_x (the filtered colimit of A⟨f/g⟩_{≤1} over rational subspaces containing x, with M(A_x) = {x} and (A_x)^u = κ(x)), API `stalk_uniform` and Check `stalk_rigidPoint`; *Needs* gains §1.4.

**Same pattern elsewhere.** A scripted scan for references to later sections inside each statement found only source section numbers. There are no other internal forward references.

## F07 (P3) — applied

**Change (10.3, last sentence of the statement).** "For a rigid analytic group G with G = G(ℚ_p), …" → "For a rigid analytic group 𝒢 over ℚ_p whose group of ℚ_p-points G = 𝒢(ℚ_p) is a p-adic Lie group of dimension dim 𝒢, G^la agrees with 𝒢(ℚ_p)^la of 3.4, coset by coset of a compact open subgroup when G is not compact."

**Same pattern elsewhere.** "G(ℚ_p)" occurs nowhere else.

## Checks run

**Dependency check (gate),** after all edits:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2256 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

**`roadmaps resolve`.**
- One cross-roadmap citation is found nowhere: "MotivesAndAlgebraicCyclesPartII Layer 0". That roadmap is a board package (merge order line 388), and its `README.md` has "## Layer 0: The Banach arc-site" with §§0.2–0.6. This is not a defect.
- No Lean names are found nowhere. The `Huber.GelfandSpectrum` lead of the worker's citation file no longer appears.

**Scripted agreement.**
- All 534 plan statements, API bullets and tests occur verbatim in the README: 530 before, plus `stalk_uniform`, `stalk_rigidPoint`, `laPoints_continuous` and `binomial_tauWeights`.
- All 21 gap `needs` sentences occur in the README.
- `plan.json` round-trips with its original formatting.
- `sources.toml` parses.

**Policy grep** (README and plan): no LaTeX delimiter, `$`, machine path or pull-request number. The README has no backticked name of its own.

**Suggested.lean.** The design stage has no `Suggested.lean`, so there was no `#check` pass and no elaboration. No Lean file was written.

**Sources.**
- No source was fetched, and no `needs-references.toml` was written.
- Every new locator was checked against the page markers:
  - ABLB lines 1324 and 1335 are on p. 26 (marker at 1318).
  - ALRS line 5333 is on p. 101 (p. 102 starts at 5341).
  - ALRS line 2931 is on p. 56.
  - ALRS line 6348 is on p. 119.
  - ALRS line 6444 is on p. 120.
  - ALRS line 6824 is on p. 125 (markers at 6764 and 6830).
- `sources.toml` adds "3.1.14" to the ABLB locator list. No new work is cited.

**Ownership.** No new construction was introduced:
- The stalk and residue field belong to the Gelfand-ring layer that this roadmap owns. The completed residue field of a Banach ring stays TropicalAndBerkovichArithmetic §0.15, which is cited.
- The new 10.9 statements are ALRS results inside Layer 10, which this roadmap owns.
- Ownership against open pull requests was not re-checked beyond this.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.4 bullet: S^dR(A) = continuous maps | S = ∅; A = 0; A = ℚ_p[ε]/ε²; A = C(ℤ_p, C_p), S = ℤ_p | ∅ for A ≠ 0. A = 0: M(A) = ∅, one map, and the sheaf on ∅ is a point. M(A) a point: S on both sides. C(ℤ_p, ℤ_p) ∋ id ∉ C^lc | holds | bullet fixed |
| 3.4 new Check | A = C(ℤ_p, C_p), M(A) = ℤ_p, κ(x) = C_p | A ×_{A^u} C(ℤ_p, ℚ_p) = C(ℤ_p, ℚ_p); 7.5: Γ(FF_{ℤ_p × C♭}, O) = C(ℤ_p, ℚ_p) | agree | Check added |
| 1.5 κ(x) | ℚ_p⟨T⟩ at the Gauss point; ℚ_p × ℚ_p; ℚ_p[ε]/ε² | completion of ℚ_p(T) for the Gauss norm; ℚ_p at each point; ℚ_p. The wrong model "uncompleted residue field" gives Frac(ℚ_p⟨T⟩), which is not complete | holds | definition moved |
| 1.6 stalk | A = ℚ_p; ℚ_p[ε]/ε²; ℚ_p × ℚ_p at the first point; ℚ_p⟨T⟩ at T = 0 | ℚ_p; the whole-space localization gives A, so (A_x)^u = ℚ_p; Z = {\|e₂\| ≤ \|e₁\|} gives A_x = ℚ_p; germs ℚ_p{T}, T ∈ Nil†, (A_x)^u = ℚ_p = κ(x) | holds | stalk moved to 1.6 |
| 1.6 Check, cofinality | rational Z ∋ 0 in the disc | h = f/g with \|h(0)\| ≤ 1; for \|h(0)\| = 1, \|h(y)\| = 1 when \|h(y) − h(0)\| < 1, so Z is a neighbourhood of 0 and contains {\|T\| ≤ \|p^n\|} | holds | Check added |
| 7.6, λ < 0 | λ = −1, A = C_p; λ = −1, A = C_p[ε]/ε² | C_p: both sides BC(C_p). C_p[ε]/ε²: from π₁X = 0, π₁Y = A ⊗ D_1, π₁Z = C_p ⊗ D_1, get π₁ = C_p ε ⊗ D_1 and π₀ = C_p/ℚ_p. De Rham value at C_p: π₁ = H⁰(O(−1)) = 0. The printed corner would give π₁ = 0 | corrected square holds | statement and Check fixed |
| 7.6 extension, λ < 0 | fibre of B(G_a^an ⊗ D) → B(G_a^{an,dR} ⊗ D) | B(fib) = B(G_a^† ⊗ D), since G_a^† → G_a^an → G_a^{an,dR} is exact | holds | — |
| 10.4 τ | d = 0; G = ℤ_p, w(1) = 1; G = 1 + p²ℤ_p, w = v_p(g − 1) and w − 1 | τ = 0, so C_r = Λ°; τ(n) = n = \|α\|; τ(n) = 2n versus n. p-valuation axioms: 2 > 1/(p − 1), w(g^p) = w(g) + 1 for p odd; w − 1 ≥ 1 > 1/(p − 1) for p ≥ 3 | holds | definition and Check added |
| 10.5 compact G | G = ℤ; G = ℤ_p; G finite; G × 1 | ℤ: excluded, since M^la is undefined. ℤ_p: the three Checks are unchanged. Finite: R^la = R. (−)^{(G×1)-la} = (−)^{G-la} | holds | "compact" added |
| 10.9 Lemma 5.6.2 | G = G_0 = 1 | the square Y → Y′ over X → X′ is cartesian by definition of Y; X^la = X = X′, so Y^la = Y = Y′; Perf statement is the identity | holds | stated |
| 10.9 Proposition 5.6.4 | G trivial; trivial action | P^la = P; ϵ-TORS holds for every ϵ ∈ E (10.8 Check) | holds | stated |
| 10.9 Corollary 5.6.12 | K = ℚ_p, B_{j,0} = ℤ_p constant | B = ℚ_p, X_B = X: reduces to Theorem 5.6.10 | holds | K named |
| 10.3 rigid group | closed disc under addition, G = ℤ_p; G_m, G = ℚ_p^× | ⋂_r G_r = disc ×_{disc^dR} ℤ_p^sm; ⊔_n p^n·ℤ_p^{×,la} coset by coset | holds | notation fixed |

## For the maintainer

- No target id, section number, gap slug or Lean name of this roadmap was renamed or removed.
- New plan names: API `TauCeti.Gelfand.stalk_uniform` (1.6); tests `stalk_rigidPoint` (1.6), `laPoints_continuous` (3.4) and `binomial_tauWeights` (10.4).
- The stalk A_x moved from 1.5 to 1.6. No other roadmap cites either section: AnalyticStacks cites only this roadmap's gap slugs.
- ALRS has a misprint at Proposition 3.7.4(2) (ALRS line 2924). It is now recorded in the 7.6 statement. ALRS Corollary 5.6.12 says "cofiltered" for a system it takes the colimit of; the README writes "filtered".
- The Gestalten contracts still have no owner. That is a board decision, recorded in earlier rounds.
- No suspicious instructions were found in the review text.
