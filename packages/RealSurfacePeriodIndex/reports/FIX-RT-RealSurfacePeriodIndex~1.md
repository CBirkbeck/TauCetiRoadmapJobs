# FIX-RT-RealSurfacePeriodIndex~1: repair of red-team round 1 (passes a and b)

Files changed: `packages/RealSurfacePeriodIndex/README.md`, `packages/RealSurfacePeriodIndex/Suggested.lean` (one section comment), `packages/RealSurfacePeriodIndex/sources.toml` (locators). `design/plan.json` is unchanged: no new supplier gap is needed.

## RT-RealSurfacePeriodIndex~1a/F01 (P1) — applied

Verified: BEC05 line 76 and EKM lines 8820–8826 define u by torsion or locally hyperbolic forms; EKM Theorem 31.22 (line 6811) was unowned. Change: new §0.6a (zero total signature ⟺ 2-primary torsion; the three u-invariants agree; Witt kernel proved inline from QuadraticFormInvariants Layers 1, 2, 4; five Checks), cited in §§0.8, 0.14, Conventions, Scope, Layer 0 summary.

## RT-RealSurfacePeriodIndex~1a/F02 (P2) — applied differently

Change: new §0.5a (Artin–Lang over any real closed R, three-way equivalence, four Checks), cited in Conventions, §0.9 step 4 (rewritten), §§7.6, 7.11, 7.13; K3BlochGroups §5.8 supplier contract. Why different: RealAlgebraicGeometry Layer 6 proves quantifier elimination over ℝ only (its stated caveat), so cannot transfer from a real closure R′ ⊋ ℝ; model completeness does.

## RT-RealSurfacePeriodIndex~1a/F03 (P3) — applied

Change: §1.3 step 2 now derives (0, a₁, Sq¹a₁) from the untwisted (a₀, 0, Sq¹a₁) of AlgebraicTopologyPartII §7.4 plus ω ∪ (a₀, a₁) from §14.2 (sign system ℤ(1), e = ω); §14.2 added to Needs and Layer 1 Dependencies; Spec ℝ Check (1 + 1 = 0). Pattern: Scope line and §7.4 contract corrected; §5.4 already cited both.

## RT-RealSurfacePeriodIndex~1a/F04, RT-RealSurfacePeriodIndex~1b/F07 (P3) — applied

Change: E2 (§2.4), E7 (§8.4 step 2), E8 (§7.3), E14 (§9.14 step 1), E15 (§9.5 step 2), E20 (§5.2 step 3), E21 (§6.12), E23 (§5.8 step 2) now cited where each correction is used. E11 kept, cited in §3.6 step 1: B19 (2.1) is the pushforward in B19's proof of Proposition 3.3 (B19 line 651). The preamble now holds unchanged.

## RT-RealSurfacePeriodIndex~1a/F05 (P3) — applied

Change: ", later in the merge order," removed in the Scope paragraph ("… QuadraticFormInvariantsPartII consumes it for its Layer 5") and in Downstream consumers ("QuadraticFormInvariantsPartII consumes §0.7: …"). `grep 'merge order'` on the README is now empty.

## RT-RealSurfacePeriodIndex~1b/F01 (P2) — applied differently

Change: Layers 2, 3, 4, 5 and 8, whose headings repeated B19's section titles (B19 lines 230, 532, 904, 667, 1339; Layer 3 word for word), are renamed by their content. Numbering is unchanged, and the `Suggested.lean` Layer 2 comment is updated. Reorganisation disputed: the review concedes that the Needs lines force 3 → {4, 5} → 6 → 7 → 9 and 8 → 9, and an order the dependencies force is kept. §5.6 and §8.3 are not duplicates: §5.6 obtains the lift from τ = 0 (§5.5) for n = 2, §8.3 from p*α = 0 for even n, and both apply AlgebraicTopologyPartII §15.3. The requested second sources are already present: §2.9 cites CT05 Theorem 3.14 and §7.13 cites BW20II Proposition 8.3.

## RT-RealSurfacePeriodIndex~1b/F02 (P2) — applied

Change: §6.2's statement is rewritten in new words; B19 lines 1111–1121 had the same clause order and a seven-word shared run. Labels (i)–(iv) are kept; the API bullets now state each condition, and the S² Check computes (iv). Pattern: §5.1's restatement of Assumption 4.1 (B19 lines 676–685) is reworded likewise, with an equivalent statement.

## RT-RealSurfacePeriodIndex~1b/F03 (P3) — applied

Change: §0.15 locator "BEC05, §3, Theorem 3.1 and Remark 3.2" → "B19 §6.4, p. 95 (states the criterion, attributes it to Pfister); BEC05 §3, p. 3, for the torsion Albert form of step 1". Theorem 3.1 and Remark 3.2 are noted as different universality criteria (BEC05 lines 105–107, 135–139), not used.

## RT-RealSurfacePeriodIndex~1b/F04 (P3) — applied

Change: §0.14 step 2 now proves I³F torsion-free for every u(F(√−1)) ≤ 4 (√−1 ∈ F separately) via EKM Theorem 35.12 (p. 152) and Proposition 35.9 (p. 150); {0, 1, 2, 4, 6} is attributed to EL73, recalled in BEC05 §3. New Check: anisotropic torsion ⟨⟨1 + x², y⟩⟩ shows I²(ℝ(x, y)) is not torsion-free.

## RT-RealSurfacePeriodIndex~1b/F05 (P3) — applied differently

Change: §0.9 step 5 "no real points outside a finite set, so no half-branches" → "F is nonreal by §0.5a; X_F is empty; (a) gives β = 0". Why different: §0.5a (added for 1a/F02) gives nonreality of ℝ(C) for C(ℝ) = ∅ directly, so the offered compactness argument is unnecessary. Step 4's half-branch description is replaced as well.

## RT-RealSurfacePeriodIndex~1b/F06 (P3) — applied

Change: §0.2's pointer Check is replaced by a computed one. For F = ∪ ℚ(√p₁, …, √p_n): `X_{F_n}` has 2ⁿ points, restrictions are two-to-one, and X_F = {±1}^ℕ is a Cantor set. Z_n = {−1 > 0} is empty at every level; Z_n = {√p₁ < 0} has 2ⁿ⁻¹ points and a nonempty limit.

## Checks run

Elaboration, `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean` run from the content checkout (the three `TauCeti.*` object files were present): eight `declaration uses 'sorry'` warnings, at lines 82, 91, 103, 114, 125, 135, 145, 158 (the eight theorems), no error, no other message.

Signature check: a scratch copy of `Suggested.lean` followed by `#check @name` for all nine declarations was elaborated once. The types are identical to the transcript supplied with the job (only a section comment changed in this round). Each was compared with its README statement (§§0.6, 2.9, 2.10, 7.4, 7.6, 7.8, 7.10, 7.11, 7.13): no lost binder, and the generality agrees (finite generation present in §§2.9, 2.10, 7.4, 7.6, 7.10, absent in §§7.8, 7.11, 7.13).

Dependency check (command of the brief):

    depcheck: 262 roadmaps, 2537 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The new edge RealSurfacePeriodIndex → K3BlochGroups §5.8 points down the merge order (K3BlochGroups is line 139 of ORDER.txt, this roadmap line 229).

Citations: `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. The new library names were checked at the pins by hand: `AlgebraicGeometry.Scheme.Hom.smoothLocus` (Mathlib AlgebraicGeometry/Morphisms/Smooth.lean:300), `AlgebraicGeometry.Scheme.isBasis_affineOpens` (AlgebraicGeometry/AffineScheme.lean:303), `TauCeti.RegularFormClass.eq_iff_rank_eq_and_signature_eq` (Tau Ceti LinearAlgebra/QuadraticForm/Witt/Signature.lean:133, namespace `TauCeti`). The new cross-roadmap citations were read at their heads: K3BlochGroups §5.8, the paragraph that proves quantifier elimination for real closed ordered fields and that every ordered-field embedding between real closed fields is elementary with parameters; AlgebraicTopologyPartII §14.2 at its open head.

## Gate failure: TeX notation (tex=7)

There were seven brace subscripts and superscripts outside code spans in `packages/RealSurfacePeriodIndex/README.md`. On the §0.2 inverse-limit Check line, `p_{n+1}` and `√p_{n+1}` moved into code spans, and so did the bare `X_{F_n}`. In §0.5a step 5, the bare `z_{d−1}` series field moved into a code span. In §0.6a step 4, the two brace exponents became `2^(m′)` and `2^(M+1)`. In §0.6a step 5, `sign_{P_K}(q_K)` moved into a code span. The mathematics is unchanged. A scan of the README with code spans removed now finds no `_{`, `^{`, `$`, `\(`, `\[` or backslash command. `Suggested.lean` is unchanged, so it was not elaborated again. The dependency check was rerun after this edit and gives the same output, `depcheck: 262 roadmaps, 2537 edges, 0 problem(s)`.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.5a Artin–Lang (homomorphism form) | A = ℝ[t] with t infinitesimally positive, f = (t, 1 − t); R = ℚ, A = ℚ[t]/(t² − 2) | t ↦ 1/2 gives (1/2, 1/2) > 0; ℚ(√2) has 2 orderings, no ℚ-point | holds over real closed R; fails over ℚ | ℚ case added as negative control |
| §0.5a equivalences | Spec ℝ, Spec ℂ (dim 0); {x² + y² + z² = −1}; {x² + y² = 0} | real / smooth point / dense: yes, yes, yes; no, no, no; V(ℝ) = ∅, −1 = x² + y² + z²; one singular point, (y/x)² = −1, nonreal | equivalence holds; "real point" alone is false | "smooth" kept; control Check |
| §0.5a transfer step | R′ a real closure of ℝ(t) at an infinitesimal ordering | R′ ⊋ ℝ non-archimedean; QE over ℝ alone gives no statement in R′ | needs model completeness | supplier K3BlochGroups §5.8, not RealAlgebraicGeometry Layer 6 |
| §0.6a local–global | ⟨1, −(1 + t²)⟩ over ℝ(t); ⟨1, −t⟩; ℂ(x, y); 𝔽₃; ℝ; the zero form | 2·q = ⟨1 + t², 1 + t², −(1 + t²), −(1 + t²)⟩ hyperbolic, order 2; signature 2n at t < 0, infinite order; 2q = ⟨1, −1⟩q = 0; ⟨1⟩ of order 4 (⟨1, 1⟩ anisotropic, ⟨1, 1⟩ ≅ ⟨−1, −1⟩); W(ℝ) ≅ ℤ; class 0 | all agree with "zero signature ⟺ 2-power torsion" | — |
| §0.6a step 3 (Witt kernel) | φ anisotropic, φ(v + √a w) = 0 | φ(v) = −aφ(w), b(v, w) = 0; v = cw forces 2cφ(w) = 0, c = 0, v = 0, impossible; plane = φ(w)⟨1, −a⟩ | holds in char ≠ 2 | proved inline |
| §0.6a step 4 | ⟨1, a⟩ ⊗ ⟨1, −a⟩; ⟨1, a⟩ + ⟨1, −a⟩ | ⟨1, a, −a, −a²⟩ = 0; ⟨1, 1, a, −a⟩ = ⟨1, 1⟩ = 2 | holds | — |
| §0.6a step 5 | K with −1 a square; b² + c² non-square | ⟨1, 1⟩ ≅ ⟨1, −1⟩, 2q = 0; ⟨1, 1, 1⟩ isotropic ⇒ ⟨⟨−1, −1⟩⟩ hyperbolic ⇒ 4q = 0 | contradictions as stated | — |
| §0.9 (b) new step 4 | (−1, t) over ℝ(t), W = ℝ ∖ {0}; (−1, 1 + t²) | t < 0 at some ordering, real points t₀ < 0 give the Hamilton class; 1 + t² > 0 everywhere, class 0 | (b) excludes the nonzero class, accepts the zero one | Check added |
| §0.9 (c) | conic x² + y² = −1 | C(ℝ) = ∅ ⇒ ℝ(C) nonreal by §0.5a ⇒ Br = 0 | holds | inference repaired |
| §0.14 step 2 | F = ℝ(x, y); F = ℂ(x, y) (√−1 ∈ F); F = ℝ; F = ℝ((x))((y)) | u(ℂ(x, y)) = 4: 8-dim Pfister forms isotropic, I³ torsion-free; I³(ℂ(x, y)) = 0; W(ℝ) = ℤ torsion-free; u(ℂ((x))((y))) = 4, I³ torsion-free | holds for u(F(√−1)) ≤ 4, not only = 4 | √−1 ∈ F case added |
| §0.14 sharpness | π = ⟨⟨1 + x², y⟩⟩ over ℝ(x, y) | residue forms ⟨1, −(1 + x²)⟩, ⟨−1, 1 + x²⟩ anisotropic; 2π = 0 | I²F not torsion-free | Check added |
| §0.15 locator | B19 lines 1308–1310; BEC05 lines 105–107, 135–139 | criterion in B19 only | locator corrected | — |
| §1.3 step 2 | Spec ℝ, e = ω (a₀ = 1, a₁ = 0); ℙ¹_ℝ | untwisted: ω² ≠ 0; twisted: 1 + 1 = 0 = H²_G(pt, ℤ(1)); degree-one component 0 on the circle | twisted formula agrees, untwisted does not | Check added, §14.2 cited |
| §0.2 new Check | F = ∪ ℚ(√p₁, …, √p_n) | 2ⁿ orderings, fibres of size 2; Z = {−1 > 0}: ∅ at all levels; Z = {√p₁ < 0}: 2ⁿ⁻¹ points, limit nonempty | consistent with step 4 | Check replaced |
| §6.2 reworded (iv) | Ξ = S², one circle | splittings of two open discs: (D₁, D₂), (D₂, D₁) adherent to Σ₀; D_i ∪ circle a closed disc, connected; (∅, D₁ ∪ D₂) not adherent | holds | Check made explicit |
| §5.1 reworded (ii) | generated subgroup vs sums | over 𝔽₂ the subgroup generated by im p_* and the cl_R(Γ) is {p_*c + Σ cl_R(Γ_k)}; both kinds vanish on Ψ by (i) and Γ(ℝ) ∩ Ψ = ∅ | same statement | — |
| §7.6 converse (scheme form from birational form) | U = 𝔸²_ℝ ∖ {x = 0}, α = (−1, x) | Z(α) ⊇ H(−x); §0.5a gives a point with x < 0, α_x = Hamilton class ≠ 0 | consistent | argument written out |
| §7.13 instance | C the conic x² + y² = −1 | C(ℝ) = ∅ ⇒ ℝ(C) nonreal by §0.5a, hypothesis of the target met | holds | §0.5a cited |

## Ownership

Ownership was checked by object across main, the pins and the open heads (`roadmaps grep`): Pfister's local–global principle, torsion in the Witt ring against signatures, the Witt kernel of a quadratic extension, the Artin–Lang theorem, orderings against real points. None has another owner. QuadraticFormInvariants on main excludes "general torsion theorems for W(K)" (its README line 994) and the deep Pfister theory. QuadraticFormInvariantsPartII, later in the order, states neither. This roadmap therefore owns §§0.5a and 0.6a. K3BlochGroups §5.8 owns model completeness of real closed fields and is cited for it, not restated. No declaration of `Suggested.lean` was added or renamed.

## For the maintainer

- New supplier edge: K3BlochGroups §5.8, an open pull request that adds a new roadmap folder and comes earlier in the merge order. If that section is renumbered or dropped, §0.5a step 3 needs another owner of model completeness for real closed fields.
- Layer ids, section ids and declaration names are unchanged. QuadraticFormInvariantsPartII still cites this roadmap's Layer 0, as before.
- Five layer headings changed text (Layers 2, 3, 4, 5, 8). Anchor links to those headings, if any roadmap uses them, would change. No roadmap cites them by anchor (`roadmaps grep RealSurfacePeriodIndex`).
- `sources.toml`: EKM gains Lemma 31.19, Theorem 31.22, Corollary 34.12, Proposition 35.9, Theorem 35.12. BCR gains §1.3 and §4.1 and is now also cited for Layer 7. BEC05's locator no longer lists Theorem 3.1 as support. No new source key; `needs-references.toml` was not created.
- The reviews' "For the human reviewers" sections were not acted on. The question of whether the layer arrangement is the roadmap's own, which review a left to the humans, is answered in part by 1b/F01 above.
- No passage in either review asked for anything outside this job.
