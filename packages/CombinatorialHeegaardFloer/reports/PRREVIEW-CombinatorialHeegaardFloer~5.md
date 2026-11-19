# Review of CombinatorialHeegaardFloer (pull request #2545 at 0750758)

**Verdict:** accepted

**Summary.** Accepted. This head repairs the one finding of the previous review: §3.9 now states the link genus bound that the book proves, in place of the Thurston-norm bound. It also repairs the earlier small corrections and the format note. Four small corrections and one format note remain, and none blocks. The most substantive is that §2.3's alternative grid-homology route to Torres's symmetry is circular as cited. One question about arrangement is carried over for the human reviewers.

## C01 — The alternative grid-homology route to Torres's symmetry in §2.3 is circular as cited, and one of its inputs belongs to no section

An implementer who takes the route that the *Needs:* line offers ("Torres (1953), or §3.9 on the grid-homology route", line 364) would end up assuming what they are trying to prove. §3.9's Euler characteristic uses the symmetrized `Δ_L`, and Definition 11.5.4 obtains that normalization from Torres's theorem (OSSBOOK line 8402). The book's proof of Theorem 11.6.1 (line 8636) uses Proposition 11.5.8, whose proof ends by invoking Theorem 11.5.3 itself (line 8566). The route's other input, the symmetry of multi-graded `GĤ` for links (Corollary 11.4.3, line 8312), is not a target anywhere: §3.8 states the knot symmetries only.

The route does work if it starts before Torres is used. The Fox-calculus computation in the proof of Proposition 11.5.8, stopped before its last step (lines 8562–8565 with (11.14)), gives `det M(G) ≐ ∏ⱼ (1 − tⱼ)^nⱼ · Δ_L(t₁⁻¹, …, t_ℓ⁻¹)`. Then `χ(GĤ(L)) ≐ Δ_L(t⁻¹) ∏ᵢ (1 − tᵢ)`. The `t ↦ t⁻¹` symmetry of `χ(GĤ(L))` from Corollary 11.4.3 then gives `Δ_L(t⁻¹) ≐ Δ_L(t)`, since `∏ᵢ (1 − tᵢ) ≠ 0`. Either name these two inputs on line 364 and add the link symmetry of Corollary 11.4.3 as a target (in §3.8, say), or drop the alternative and keep Torres (1953).

## C02 — The genus bounds of §3.8 and §3.9 cite §2.2 for an adapted grid, which §2.2 does not construct

The new *Needs:* entries "§2.2 (to pass to a grid realizing the genus)" (line 686) and "§2.2 (to pass to a grid adapted to `F`)" (line 717) point to Cromwell's theorem. Cromwell is needed to compare `GĤ` of two grids. It does not produce a grid whose associated surface has Euler characteristic at least `χ(F)`. The proofs of Propositions 7.2.2 and 11.7.1 take that grid from Proposition 3.4.11 (OSSBOOK line 2536; for links, line 8718). They also use the Euler characteristic of the associated surface (Proposition 3.4.9, line 2492) and its expression as the largest Alexander grading of a state (Proposition 7.2.1, line 5370). None of these three is stated in any section. Would you state them as one lemma in §3.8, for knots and links, and cite it in both *Needs:* lines?

## C03 — In §5.4, "each counted domain contributing its class" does not say which class

A domain between two different generators has no class in `H₂` on its own (line 1238). In OSS09 §9 (lines 3289–3313), one fixes a base generator `x` in each equivalence class and a connecting domain `D_y ∈ π₂(x, y)` with all basepoint multiplicities zero. A domain `D` from `y` to `z` then contributes the class of the periodic domain `D_y + D − D_z`. Independence of these choices is part of Theorem 9.4's proof. Write the construction in that form, with the same locator.

## C04 — The description's reason for dropping the Thurston-norm target says that no roadmap supplies the norm

GeometricTopology §5.4.1 on main supplies the integral surface minimum on `H₂(N, ∂N; ℤ)` and leaves the real seminorm to GeometricTopology, Part II (its README lines 6098–6102). The description says instead that "no roadmap supplies the Thurston norm of a link complement". The sentence would be accurate as: "and GeometricTopology §5.4.1 supplies only the integral surface minimum, leaving the Thurston seminorm to its Part II".

## N01 — §5.4 now needs §5.5 (line 1244), so Layer 5 is no longer in build order. This could follow the pattern of `HF̂_st`: the twisted complex and its invariance under nice moves stay in §5.4, and `HF̂T(Y)` on convenient diagrams moves to §5.5.

## Previous findings

- R01 — repaired: "Prove the genus bound for links: if `F ⊂ S³` is a compact oriented surface, not necessarily connected, with no sphere components … `h₁ + ⋯ + h_ℓ ≤ (ℓ − χ(F))/2`" (§3.9, lines 709–715); Theorem 11.9.9 is named as unproved in the book (line 405).
- C01 — repaired: §1.4 "Definitions 13.1.1, 13.1.3–13.1.6 and 13.1.9"; §3.8 "Propositions 7.1.2 and 7.1.1 … Proposition 5.3.2 … Corollary 7.4.5"; §3.9 "Theorems 9.1.1 and 9.1.2 … Theorem 10.3.1"; §3.11 "Proposition 12.4.1"; §5.4 "arXiv:0912.0830, Proposition 9.1 … Definition 9.2 … Theorem 9.4".
- C02 — repaired: "Those minors generate the zeroth Fitting ideal of the module (Tau Ceti `Matrix.minorsIdeal_range_eq_span_det_submatrix`), which does not depend on the presentation … (Torres, *On the Alexander polynomial*, 1953)" (lines 344–348). The added grid route is C01 above.
- N01 — repaired: "This layer has no absolute gradings and no `U`-flavors" (line 1144).

<details><summary>What was checked</summary>

Automatic checks: the text scanners (wording, process words, machine paths), the check that every supplier comes earlier in the merge order, and the build of `Suggested.lean` all pass on this head, and running them again for this review gives the same result. The dependency check read 200 roadmaps and 2195 supplier edges and reported no problem. Nothing outside the folder changes. Elaboration of a copy of `Suggested.lean` gives only the six `sorry` warnings. The changed docstring of `nonempty_latticeChainHomology_blowUpEdge` matches Némethi's text.

Not verifiable: Torres (1953) is behind a paywall and was not opened; its bibliographic data agree with the book's reference [218]. arXiv:1301.0480 and the earlier out-of-sample locators in Ozsváth–Szabó–Thurston, Gallais and Juhász–Thurston–Zemke were not opened.

</details>

## Verified sound

Adversarial table for the statements the diff changes or a remark touches. OSSBOOK, OSS09 and Nem07 are the cache keys of the book, of arXiv:0912.0830 and of arXiv:0709.0841.

| # | Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.4 filtered notions, locators | `C = 𝔽a ⊕ 𝔽b`, `∂b = a`, `F₀ = 𝔽a` | Defs 13.1.1–13.1.9 (OSSBOOK 10296–10433), remark 10395; `H(C) = 0` vs `H(gr C) = 𝔽²` | holds | none |
| 2 | §2.3 `Δ_L` via `Fitt₀` | Hopf; two-component unlink; trefoil; `Fitt₁` variant | `H₁ = 0`, size-0 minors `= Λ`, `Δ = 1`; `Λ` with no relation, `Fitt₀ = 0`; `Λ/(t²−t+1)`; `Fitt₁` gives `1 ≠ t−1+t⁻¹` | holds | none |
| 3 | §2.3 Torres symmetry and grid route | Whitehead link; OSSBOOK 8566, 8636 | `(t₁⁻¹−1)(t₂⁻¹−1) = t₁⁻¹t₂⁻¹(t₁−1)(t₂−1)`; 11.6.1 uses 11.5.3 via 11.5.8; unsymmetrized `det M(G)` route closes | holds; route circular as cited | C01 |
| 4 | Layer 3 opening, Theorem 11.9.9 | OSSBOOK 9065–9071 | norm plus hypercube equals twice grid polytope; "state without proof" | holds | none |
| 5 | §3.8 mirror, Alexander and reversal symmetries | left vs right trefoil | 7.1.2 then 7.1.1: `GĤ_M(m(K),A) ≅ GĤ_{2A−M}(K,A) ≅ GĤ_{−M}(K,−A)`; `(2,1) ↦ (−2,−1)`; Prop 5.3.2, Cor 7.4.5 | holds | none |
| 6 | §3.8 knot genus bound, *Needs:* | Prop 7.2.2 proof (OSSBOOK 5409–5412) | uses Props 3.4.9, 3.4.11, 7.2.1; §2.2 gives only Cromwell | holds; input unowned | C02 |
| 7 | §3.9 skein, thinness locators | right trefoil | Thms 9.1.1 (6341), 9.1.2 (6355), 10.3.1 (7711); rank `3 = |Δ(−1)|` | holds | none |
| 8 | §3.9 link genus bound | Hopf; 2-unlink; sphere added; `ℓ = 1`; connected `F` | `max Σh = 1` vs annulus `(2−0)/2 = 1`; `0` vs discs `0`; sphere: `1 ≤ 0` fails; `g`; `g+ℓ−1` | holds; Prop 11.7.1 (8673) | C02 |
| 9 | §3.11 Legendrian invariants, locators | Def 12.3.1; Thms 12.3.2–12.3.4, 12.5.13; Prop 12.4.1 | NE/SW corners; `M(x⁺) = tb − r + 1`; `φ₋(λ⁺) = λ⁺(K⁻)`; `tb = 1`, `r = 0` | holds | none |
| 10 | §4.1 route; `nonempty_latticeChainHomology_blowUpEdge` docstring | Nem07 435–437; `simp` probe | pullback adds `(x_i0 + x_j0)E_new`, details left to reader; `simp` leaves goal | holds | none |
| 11 | §5.4 twisted complex, `HF̂T(Y)` | twice-pointed `S³` (OSS09 Ex. 9.3) | `R = 𝔽[t^±]`, `∂x = (1+t)y`, `H = 𝔽` vs untwisted rank 2; Prop 9.1, Def 9.2, Thm 9.4 | holds | C03, N01 |
| 12 | §5.4 comparison owner | HeegaardFloer §8.1 R1.twisted | main lines 4667–4670, #2477 line 4733; OSS09 Thm 10.4 (3470) | holds | none |

The rows for the statements the diff leaves untouched stand as in the previous review, of `cc2fe8d`.

- Source locators checked against the texts: OSSBOOK 34, OSS09 6, Nem07 1.
- Tau Ceti at the pin: `TauCeti.fittingIdeal` (RingTheory/FittingIdeal/Basic.lean 334), `TauCeti.fittingIdeal_eq_minorsIdeal_ker` (Basic.lean 340), `Matrix.minorsIdeal_range_eq_span_det_submatrix` (RingTheory/FittingIdeal/Matrix.lean 53); the PD-code Alexander module (KnotTheory/PDCode/Alexander/Basic.lean) is one-variable, so no multivariable polynomial exists at the pin.
- Cross-roadmap citations resolved: HeegaardFloer §8.1 on main and at #2477; GeometricTopology §4.3 (main line 2347, `g(L)` at 2377) and §5.4.1 (6085–6102).
- Gate rerun: all checks pass. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on a copy with `#check @` for all seven declarations and a `simp` probe on `nonempty_latticeChainHomology_blowUpEdge`. The original part gives six `sorry` warnings only, the elaborated types are unchanged and match the README, and the probe fails. The Fitting-ideal names, which the README cites but the file does not import, exist at the pin.
- Pull request text: it matches the head (43 Checks, the replaced §3.9 target, §5.4, the Fitting-ideal route, Torres), apart from C04.
- Overlap check: read HeegaardFloer (main and #2477, §8.1), GeometricTopology (main, §§4.3 and 5.4.1), and searched every open head and main for the multivariable Alexander polynomial and the twisted refinement. RibbonKnots, KhovanovHomology and the open GeometricTopology heads stand as read in the previous review. Owners: the combinatorial twisted complex and its invariance belong to this roadmap, and HeegaardFloer §8.1 consumes Lane H and owns the comparison with `HF̂`; the genus of links belongs to GeometricTopology §4.3; Fitting ideals belong to Tau Ceti; the multivariable Alexander polynomial belongs to this roadmap only.

Source independence: 9 changed passages compared with 3 sources (OSSBOOK, OSS09, Nem07), changed passages only. None shares wording beyond statement-forced phrases ("not necessarily connected", "group ring", "to the reader"). The largest share is OSSBOOK, about 60 of about 130 locators (rough count). No layer was added, removed or reordered, so the contents were not compared again.

Research link: Layer 3 proves combinatorially the invariance and `τ` bounds of Manolescu–Ozsváth–Szabó–Thurston (2007) and Sarkar (2011), which yield Kronheimer–Mrowka's (1993) Milnor-conjecture theorem. Layer 4 is Némethi's lattice cohomology (2008), which Zemke (2021) identifies with `HF⁻`. Layer 5 is Ozsváth–Stipsicz–Szabó's stable and twisted `HF̂` (2009). This rests on the README and the sources read.

## Not verifiable

- Torres, *On the Alexander polynomial*, Ann. of Math. 57 (1953): behind a paywall and not opened; its bibliographic data agree with OSSBOOK line 17543.
- arXiv:1301.0480, and locators outside the sample in Ozsváth–Szabó–Thurston (arXiv:math/0611841), Gallais (arXiv:0706.0089) and Juhász–Thurston–Zemke (arXiv:1210.4996): not opened.

## Source issues

- **Gap** in OSSBOOK at Theorem 11.5.3, printed page 200: the source says Torres's symmetry follows from Corollary 11.4.3 and Theorem 11.6.1, but its proof of 11.6.1 uses 11.5.3 through Proposition 11.5.8; it should derive it from the unsymmetrized `det M(G)` identity and Corollary 11.4.3; affects the proof.
- **Gap** in Nem07 at Proposition 3.4.2, printed page 9: the source treats the blow-up at a smooth point and leaves the blow-up at an intersection point to the reader; it should give the retraction for the total transform adding `(x_i0 + x_j0)E_new`; affects the proof.

## For the human reviewers

- Arrangement: Layer 3's thirteen sections take the scope of OSSBOOK Chapters 3–15 in nearly the book's order. The exceptions are §3.9 (Chapters 9–11) before §3.10 (Chapter 8), and §3.12 (Chapter 15) before §3.13 (Chapters 13–14). I judged this below a finding: the map is not one to one, and §§3.1–3.7 are forced by their *Needs:* lines.
