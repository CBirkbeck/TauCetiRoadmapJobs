# Repair report: BallQuotientsAndComplexHyperbolicLattices design, round 9

Findings resolved: the three findings of `REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~8` (all P3). Files edited: `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md` and `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json`. `sources.toml` needed no change: every key it records is still cited for the same targets (Mok2012 for 1.6, 2.2, 2.3, 7.2; BaldiUllmo2023 for 2.2 and the downstream consumers).

## F01 (P3) — applied

Checked against the sources. Mok2012 line 19 to line 26 is about compactifying finite-volume Riemann surfaces, not about PU(1,1) ≅ PSL(2,ℝ). BaldiUllmo2023 line 586 to line 597 is Definition 3.3.4 (Poincaré growth). Mok2012 line 515 to line 516 is Siu–Yau's quasi-projectivity result. Line 21 to line 23, line 582 to line 583, line 247 to line 254 and line 383 to line 389 say what the review says they say.

Changes:
- §1.6 "(Mok2012 line 19 to line 26 for the classical case)" → "proved here from §§1.2–1.4 and FuchsianOrbifolds Layer 0; Mok2012 line 21 to line 23 recalls only that the case n = 1 of the compactification problem … is classical". I added "of the compactification problem" because Mok's sentence is about that problem, not the group isomorphism.
- §2.2: the BaldiUllmo2023 586–597 locator → 582–583 ("ω on S_Γ as the form of the natural Hermitian metric, its Poincaré growth being §8.3's").
- §2.3: the Mok clause → "line 247 to line 254 and line 383 to line 389 call the metric of ω the canonical Kähler–Einstein metric, without stating the Einstein constant; the three statements are proved here".
- Plan targets 1.6, 2.2 and 2.3 now have the same locators.

Same pattern repaired elsewhere: §7.2 cited Mok2012 line 309 to line 311 for "Ricci form −(n+1)ω_Γ". Those lines only mention the canonical Kähler–Einstein metric on a torsion-free quotient. The text now says the Einstein constant comes from §2.3, in the README and in plan target 7.2. I also opened the other Mok2012 locators that the review's list did not cover: line 131 to line 137 (§1.3, the Siegel domain and inverse Cayley transform) and line 319 to line 321 (§2.4, automorphisms are isometries). Both support their claims. No statement changed.

## F02 (P3) — applied

Checked: `plan.json` `consumers` had four entries and the README's "Downstream consumers" had five. BaldiUllmo2023 line 361 to line 362 is Theorem 2.4.3 (an irreducible lattice is arithmetic iff it has infinite index in its commensurator), so the README bullet's locator is correct. Change: the missing fifth entry is now in `consumers` ("Roadmaps on rank-one locally symmetric spaces, hyperbolicity of moduli and Margulis's commensurability criterion": Layers 5–6 and Layer 11; BaldiUllmo2023 Theorem 2.4.3, line 361). Both lists now have five entries.

## F03 (P3) — applied

Checked on main (content 1a19c9f): `TauCetiRoadmap/GeometricTopology/README.md` §7.3 (line 6910) does say "Prove the Margulis lemma for `ℍⁿ` and the thick–thin decomposition". GeometricTopology did not appear anywhere in this README. Its §7.1 (isometries of ℍⁿ, PSL₂(ℂ) for ℍ³) states nothing about PU(1,n), so §4.1 needs no clause.

Change: added to the Scope's "Not in scope" bullet. The clause says the ℍⁿ Margulis lemma and the thick–thin decomposition are GeometricTopology §7.3, and that §4.4 differs by treating discrete subgroups of PU(1,n) on 𝔹ⁿ through a Zassenhaus neighbourhood in SU(1,n), consuming nothing from §7.3. For n ≥ 2 the ball is not a real hyperbolic space (its curvature is not constant, §2.3). For n = 1 the two statements agree once the constant is rescaled by √2. GeometricTopology is on main, so this adds no edge.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.6, statement unchanged, new locator | Mok2012 line 21 to line 23; [diag(1,−1)] | The source sentence: the case n = 1 of compactifying finite-Poincaré-volume Riemann surfaces is classical. C(w) = i(1+w)/(1−w), C(−w) = i(1−w)/(1+w) = −(1−w)/(i(1+w)) = −1/C(w). The matrix has order 4 in SL₂(ℝ) and order 2 in PSL₂(ℝ) | Check holds; locator now matches what the source says | locator only |
| §2.2, statement unchanged, new locator | Mok2012 line 249 to line 254 at n = 1; BaldiUllmo2023 line 582 | Mok's ω = i∂∂̄(−log(Im zₙ − ‖z′‖²)) = i∂∂̄(−log ρ). For n = 1: ∂_z∂_z̄(−log y) = 1/(4y²), so ω = i dz∧dz̄/(4y²) = dx∧dy/(2y²), metric (dx²+dy²)/(2y²), which is §2.2's half-Poincaré claim. BaldiUllmo2023 line 582 defines ω on S_Γ as the (1,1) form of the natural metric | Pass | locator only |
| §2.3, statement unchanged, new locator | n = 1, n = 2 | n = 1: Ric = −i∂∂̄ log(1−\|w\|²)⁻² = 2i∂∂̄ log(1−\|w\|²) = −2ω. n = 2: −3ω. Mok line 247, 249 and 383 only name "the canonical Kähler–Einstein metric", with no constant | Pass; "proved here" is accurate | locator only |
| §7.2, statement unchanged, same pattern | Mok2012 line 309 to line 311; n = 1 | The source assumes torsion-free Γ and finite volume for the canonical Kähler–Einstein metric, with no constant. The descended form has Ric(ω_Γ) = −(n+1)ω_Γ locally (π is a local isometry), giving −2ω_Γ at n = 1 | Pass | locator wording |
| Scope, GeometricTopology §7.3 clause, n = 1 | g_𝔹 against 4\|dw\|²/(1−\|w\|²)²; the point tanh t | g_𝔹 = 2\|dw\|²/(1−\|w\|²)², half the curvature −1 metric. d_𝔹(0, tanh t) = √2\|t\| (§2.4) and d_ℍ²(0, tanh t) = 2 artanh(tanh t) = 2\|t\|, ratio 1/√2. So displacement < ε in g_𝔹 iff < √2ε in ℍ² | "agree once the constant is rescaled by √2" holds | new clause |
| Scope clause, n = 2 | curvature, dimensions | Holomorphic sectional curvature −2 and totally real planes −1/2 (§2.3 Check), so curvature is not constant and B² is not isometric to a rescaled ℍ⁴. dim PU(1,2) = 8 against dim O(4,1) = 10 | "no real hyperbolic space" holds | new clause |
| Consumers, plan against README | count, locator | 5 README bullets = 5 plan entries. BaldiUllmo2023 line 361: "Theorem 2.4.3 … Γ is arithmetic if and only if it has an infinite index in Comm(Γ)" | Pass | plan entry added |

No Check or worked example depends on a locator, so no recomputation was needed beyond the rows above. The §1.6, §2.2 and §2.3 Checks were re-evaluated against the unchanged statements (rows 1–3).

## Checks

Dependency check (gate), run after the edits:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2251 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

`roadmaps resolve` on the edited README: no cross-roadmap citation found nowhere and no Lean name found nowhere. The new citation GeometricTopology §7.3 resolves on main. `plan.json` parses as JSON and its key order and formatting are preserved. Style scan of the new text: no LaTeX delimiter, no machine path, no process wording.

Lean: the package has no `Suggested.lean` at the design stage, so no `#check` comparison was run and no binder changed.

## Ownership and suppliers

No new construction was stated. The only new cross-roadmap name is GeometricTopology §7.3, which is on main and is cited as the owner of the ℍⁿ variant, not as a supplier. Ownership against the open pull requests was not re-checked this round, because no new object was introduced.

## Notes for the maintainer

- No id or name of this roadmap changed, so no other roadmap's citations are affected.
- I found no suspicious instructions in the review text.
