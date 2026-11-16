# Repair report: RationalAnalyticPrismatization design, round 14

Findings of `REV-DESIGN-RationalAnalyticPrismatization~13` (three findings: one P2, two P3). Every finding was checked against the cited sources, the supplier roadmaps (on main, or at the head of their open pull request) and the pinned libraries before it was edited. Files changed: `packages/RationalAnalyticPrismatization/design/README.md` and `packages/RationalAnalyticPrismatization/design/plan.json`. `sources.toml` was not changed, because no new source is cited (the added Laz65 locators (1.1.2.5), (1.3.8) and (1.3.9.3) are in the work and on the pages the manifest already records).

## F01 (P2) — applied differently

**Verified.** PadicFunctionalAnalysis §4.4 (main, its README lines 706–739) proves Amice's theorem for d = 1 with values in a Banach ℚ_p-space: the isometry `C₀(ℕ, E) ≃ LA_h(E)` and the Mahler-coefficient criterion. LocallyAnalyticDistributionsPartII §1.5 (open head, its README line 220, first bullet of §1.5) states the d-variable form for `ℤ_p^d → K` "as part of this target". The 10.4 form (values in a Banach space M, d variables, on a uniform group) is stated by neither: LADII §1.5 has scalar values and PFA §4.4 has d = 1. LocallyAnalyticDistributions §0.1 only imports §4.4 (its correspondence table, row "§0.1 Amice's theorem on Mahler coefficients"). The Banach-valued form is needed because C_{r,ϖ}(G, Λ°) has values in a Banach algebra Λ.

**Changed (old → new).**
- Scope and ownership: added the ownership sentence (Amice d = 1 is PFA §4.4; d variables with values in K is LADII §1.5; 10.4 keeps the Banach-valued form in d variables and derives it from §4.4 by induction on d).
- 10.4 statement: "with coordinates G ≅ ℤ_p^d" → "with the ordered coordinates G ≅ ℤ_p^d of NoncommutativeAndEquivariantIwasawa §0.6".
- 10.4 proof route: "Lazard's criterion is Laz65 III.1.3.9" → induction on d over PFA §4.4 applied with E a Banach stage in d − 1 variables, Mahler's theorem iterated (Mathlib `PadicInt.mahlerEquiv`), and the Legendre/digit-sum estimate (Laz65 (1.1.2.5), (1.3.9.3)).
- *Needs:* drop LocallyAnalyticDistributions §0.1; add NoncommutativeAndEquivariantIwasawa §0.6, PadicFunctionalAnalysis §4.4 and Mathlib `PadicInt.mahlerEquiv`.
- Supplier contracts: "From TauCetiRoadmap.LocallyAnalyticDistributions" → "From TauCetiRoadmap.PadicFunctionalAnalysis" (§4.4); added a Mathlib bullet for `PadicInt.mahlerEquiv` (Mathlib/NumberTheory/Padics/MahlerBasis.lean:353, hypotheses read at the pin: complete ultrametric normed ℤ_[p]-module with `IsBoundedSMul`); added LADII §1.5 under "Comparison partners used only in Checks".
- Check (lazard_tauCetiStages): "Amice's theorem, which…" → "Amice's theorem (PadicFunctionalAnalysis §4.4), which…"; the same locator was added in the "From Tau Ceti" paragraph.
- New Check (lazard_scalarCase): the case M = K is LADII §1.5 and the case d = 1 is the PFA §4.4 condition, tested on (1 + p)^{a+b}. The exponent |α| may be replaced by max α but not by α_1, which the function Σ p^k binom(b, p^k) shows.
- Layer 10 Dependencies and `plan.json` (statement, prerequisites, tests, `suppliers`) were changed to match.

**How this differs from the requested repair, and why.** The review asks to put LADII §1.5 in the *Needs:* line and to make it a consumed supplier. The proof route never uses it. The Banach form cannot be derived from the scalar form: reducing coordinate by coordinate through M ≅ c₀(I) loses the uniformity in r. LADII §1.5 is also the special case M = K of what 10.4 proves. A *Needs:* entry would misstate what the route uses, so LADII §1.5 is cited in Scope and ownership as the owner of the scalar form and compared in a Check. In `plan.json` its supplier row is marked "Checks only", like the other comparison partners. The review's route sentence ("its d-fold completed tensor power is an orthonormal basis") is replaced by the induction it abbreviates. That induction is stated in terms of what §4.4 actually provides: an isometry for complete ultrametric coefficient modules E.

## F02 (P3) — applied

**Verified.** TropicalAndBerkovichArithmetic §0.30 (open head, its README line 870): the inclusion of the strict closed subdisc is quasi-étale with relative boundary and "not Berkovich étale". ClassicalAdicEtaleCohomology §3.1 (open head, its README line 1333) defines étale and smooth as quasi-étale and quasi-smooth without relative boundary. This roadmap uses ABLB Definition 3.2.8 (ABLB line 1658) and ALRS Definition 2.6.12 (ALRS line 1344), under which a †-rational localization onto a closed subdisc is Berkovich-étale.

**Changed.** Conventions: new paragraph. It says that Berkovich-étale and Berkovich-smooth are the ABLB/ALRS notions (1.6, 4.2), restates them, and says they are not the étale and smooth morphisms without relative boundary of TropicalAndBerkovichArithmetic §0.30 and ClassicalAdicEtaleCohomology §3.1, using the closed-subdisc witness. It ends with the rigid étale and rigid smooth maps of 4.2, which exclude this map too. The review's last sentence, "The maps without boundary are the rigid étale and rigid smooth maps", is replaced by this narrower claim, which follows from ALRS Definition 2.6.10 and the existing 4.2 Check. Equating the two classes would need a comparison that no target states. Check 4 of 4.2 is extended as asked, in the README and in `plan.json`.

**Pattern.** The other uses are "Berkovich-étale" in the Summary and in 1.6, 4.2, 4.7, 10.6, 10.7, 10.9, 10.10, 10.11, 10.12, 11.1, 11.4, 11.5, 11.6, 11.9, 12.1 and 12.5, and "rigid and Berkovich étale" in the Layer 4 introduction and the 4.2 heading. All of them mean the ABLB/ALRS notion, which the convention now fixes. "Derived Berkovich space" (2.6) has its own name and does not clash.

## F03 (P3) — applied

**Verified.** `untilt_closed_divisor` occurs in no roadmap. FarguesFontaineDiamonds Layer F4 at its open head has the heading "The analytic untilt divisor on `Y`" (its README line 858): the closed Cartier divisor S^♯ → Y with ideal sheaf ξO_Y, and Y is the D^×_{FF,S} of 8.1. RelativeFarguesFontaine §3.2 "Untilts as integral closed Cartier divisors" exists at its open head (line 1360).

**Changed.** In the 8.1 proof route, "(FarguesFontaineDiamonds §F4, untilt_closed_divisor; RelativeFarguesFontaine §3.2)" → "(FarguesFontaineDiamonds §F4, “The analytic untilt divisor on Y”; RelativeFarguesFontaine §3.2)". The form "§F4" is kept because the rest of the README and the supplier contracts use it. **Pattern:** every identifier with an underscore in the README was listed by script. The others are `isRadiusLowerBound_comap_frobenius_iff`, `compactSpace_spaX` and `t0Space_spaX` (Tau Ceti, at the pin), `isDescendable_colimit_of_uniformIndex` (EnhancedDerivedSheaves) and mathematical subscripts (X_arith, G_mixed, …). No other unresolved name was found. `plan.json` had no copy of this name.

## Checks run

**Dependency gate** (after all edits):

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2269 edges, 0 problem(s)
```

No UPWARD or CYCLE line. PadicFunctionalAnalysis is on main. LocallyAnalyticDistributionsPartII is at merge-order line 202, before the placement after MotivesAndAlgebraicCyclesPartII (line 388).

**Citations** (`roadmaps resolve`, after the edits): Lean names found nowhere: none. Cross-roadmap: only "MotivesAndAlgebraicCyclesPartII Layer 0". That is a board package (`packages/MotivesAndAlgebraicCyclesPartII/README.md` line 100, "## Layer 0: The Banach arc-site", merge-order line 388), and the citation is unchanged. §4.4 of PadicFunctionalAnalysis is also present at the heads of the two open pull requests that revise that roadmap (lines 916 and 847 of their READMEs), so the citation does not break when they merge. LADII §1.5, FarguesFontaineDiamonds Layer F4 and RelativeFarguesFontaine §3.2 were read at their open heads.

**Overlaps:** `roadmaps overlaps RationalAnalyticPrismatization` reports that the roadmap is neither on main nor in an open roadmap pull request, as expected at the design stage; `scratch/overlaps.md` lists no shared, dropped or second-copy item.

**Plan and README agreement** (scripted): every plan statement, API bullet and test occurs verbatim in the README (0 missing). No API or test name is repeated (new test `lazard_scalarCase`). `plan.json` parses and has 35 supplier rows: LocallyAnalyticDistributions was removed, and PadicFunctionalAnalysis and LocallyAnalyticDistributionsPartII ("Checks only") were added.

**Lean:** the design stage has no `Suggested.lean`, so no `#check` pass or elaboration was run and no Lean name changed.

**Ownership against open pull requests:** checked by object through `roadmaps grep` and by reading PadicFunctionalAnalysis (main and two revision heads), LocallyAnalyticDistributions, LocallyAnalyticDistributionsPartII, TropicalAndBerkovichArithmetic, ClassicalAdicEtaleCohomology, FarguesFontaineDiamonds and RelativeFarguesFontaine. 10.4 owns only the Banach-valued d-variable criterion, which none of them states.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 10.4 criterion (statement unchanged except the §0.6 locator) | d = 0; G = ℤ_p, M = ℚ_p, f = (1 + p)^a, p odd; f = Σ p^k binom(a, p^k); p = 2, f = 3^a | d = 0: only α = 0, criterion holds and every function on the trivial group is analytic. c_n = p^n, p^{−n}r^n → 0 iff r < p. p^{−k}r^{p^k} → ∞: not analytic, as the Check says. For p = 2: c_n = 2^n gives r < 2, locally analytic. Stage 0 fails (2^{−s_2(n)} does not → 0), stage 1 holds (2^{−n+v_2(⌊n/2⌋!)} ≤ 2^{−n/2}). This agrees with 3^x = (−1)^x(−3)^x: (−1)^x is analytic only on cosets of 2ℤ_2, and exp(x log 3) = (−3)^x ≠ 3^x | holds | locator added |
| Route: d-variable stage = LA_h(stage in d − 1 variables) | C₀(ℕ × ℕ^{d−1}, M) against C₀(ℕ, C₀(ℕ^{d−1}, M)) | a family is null on ℕ^d iff its rows are null and the sup over row n tends to 0 as n → ∞ (finitely many entries ≥ ε in both directions) | holds | — |
| Route: f in stage h iff ‖c_α‖/∏\|⌊α_i/p^h⌋!\| → 0 | p odd, h = 0, f = (1 + p)^a | p^{−n+v_p(n!)} ≤ p^{−n(p−2)/(p−1)} → 0, in stage 0, as the existing Check computes from Taylor coefficients | holds | — |
| Route: Legendre bounds n/(p^h(p−1)) − (2 + log_p(n+1)) ≤ v_p(⌊n/p^h⌋!) ≤ n/(p^h(p−1)) | p = 2, h = 0, n = 3; p = 3, h = 1, n = 9; p = 5, h = 0, n = 25; n = 0 | 1 ∈ [−1, 3]; 1 ∈ [−2.6, 1.5]; 6 ∈ [2.2, 6.25]; 0 ∈ [−2, 0] | holds | — |
| Route: union over h ⇔ ∃ r > 1 | ⇒ with r < ρ_h = p^{1/(p^h(p−1))}; ⇐ with h such that ρ_h ≤ r | ‖c‖r^{\|α\|} ≤ C(r/ρ_h)^{\|α\|}∏(α_i+1)·‖c‖/\|m_h(α)\| → 0; ‖c‖/\|m_h(α)\| ≤ ‖c‖ρ_h^{\|α\|} ≤ ‖c‖r^{\|α\|} → 0 | holds | — |
| New Check lazard_scalarCase | d = 2, f = (1 + p)^{a+b}; max α against \|α\|; g = Σ p^k binom(b, p^k) | c_{(m,n)} = p^{m+n}, (r/p)^{m+n} → 0 for r < p in both LADII §1.5 and 10.4; r^{max} ≤ r^{\|α\|} ≤ (r^d)^{max}; α_1 = 0 gives p^{−k} → 0 (wrongly accepted), \|α\| = p^k gives p^{−k}r^{p^k} → ∞ (rejected) | holds; the α_1 variant is rejected as a wrong model | added |
| PFA §4.4 contract | h = 0, E = ℚ_p | e_{0,n} = falling factorial x(x−1)⋯(x−n+1), unipotent integral change of basis from x^n, isometric for the Gauss norm | holds | — |
| `PadicInt.mahlerEquiv` contract | E = ℚ_p with f = (1 + p)^x and f = x; d = 0 | Δ^n f(0) = p^n; (0, 1, 0, …); C(pt, M) = M = C₀(pt, M) | holds | added |
| Convention: Berkovich-étale | closed subdisc {\|T\| ≤ \|p\|} of ℚ_p⟨T⟩; open unit disc | Berkovich-étale here (1.6 Check 2), not rigid étale (image closed, not open), quasi-étale and not étale in TBA §0.30 and CAEC §3.1. The open disc is rigid smooth here and smooth without boundary there | consistent | added |
| 4.2 Check 4 | same closed subdisc | three verdicts as above | consistent | extended |
| 8.1 citation | FFD Layer F4 heading; RFF §3.2 heading | both headings exist at their heads (lines 858, 1360) | resolves | replaced |

## For the maintainer

- No name that another roadmap cites changed. This roadmap no longer cites LocallyAnalyticDistributions. It now cites PadicFunctionalAnalysis §4.4 as a consumed supplier (on main, and present at both open revision heads) and LocallyAnalyticDistributionsPartII §1.5 as a comparison partner (open, earlier in the merge order).
- LocallyAnalyticDistributionsPartII §1.5 says that the d-variable Amice theorem is "part of this target" with scalar values. If its authors ever widen it to Banach coefficients, 10.4 should cite it and drop its own criterion.
- The three questions in the review's "For the human reviewers" section (unpublished main sources, author-page licences, the two Gestalten gaps without an owner) were left untouched, as the brief requires.
- No suspicious instructions were found in the review text or in the sibling roadmaps read.
