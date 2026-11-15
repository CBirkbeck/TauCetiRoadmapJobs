# FIX-DESIGN-BallQuotientsAndComplexHyperbolicLattices~6

Review settled: `REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~5` (five findings: two P1, three P3). I checked each finding against the supplier text, the cached sources and the roadmap's own formulas before editing. All five are correct and have been applied. Edited files: `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md` and `packages/BallQuotientsAndComplexHyperbolicLattices/design/plan.json`. `sources.toml` is unchanged: no new work is cited, and the existing `cited_for` lists still cover §§10.3–10.5 and 11.4.

## F01 (P1) — applied

**Verification.** ComplexKahlerGeometry K4 (main, `TauCetiRoadmap/ComplexKahlerGeometry/README.md`, the paragraph on Chern connections) fixes `A = h⁻¹∂h` and `Θ = dA + A∧A`. On a line bundle with holomorphic frame e this gives `iΘ = −i∂∂̄ log‖e‖²`. The same paragraph gives the O(1) curvature as `−2πiω_FS`, which agrees with this formula. On B the frame dw₁∧…∧dwₙ of K_B has squared norm det(h)⁻¹. So iΘ(K_B) = i∂∂̄ log det h = (n+1)ω = −Ric(ω), and Ric(ω) = iΘ(K_B⁻¹). The old §2.3 sentence called Ric the curvature of K_B, which contradicts §9.1's use of +(ℓ−1)(n+1)ω.

**Change.** §2.3: "The Ricci form is the curvature −i∂∂̄ log det(h) of the canonical bundle" → "Ric(ω) = −i∂∂̄ log det(h) = iΘ(K_B⁻¹); dw₁∧…∧dwₙ has squared norm det(h)⁻¹, so iΘ(K_B^m) = m(n+1)ω". New disc Check (+2ω against −2ω, ℓ = 2). Conventions record iΘ(K_B) = (n+1)ω. Plan 2.3: statement, proof sketch, test `canonical_vs_anticanonical`.

**Pattern.** Every other use was rechecked and agrees with the corrected convention, so none changed: §9.1 ("iΘ(K_X^{ℓ−1}) = (ℓ−1)(n+1)ω by §2.3"), §9.2's Check "iΘ(K^ℓ) + Ric = (ℓ−1)(n+1)ω", §8.4's |ν|² ≍ (−log|q|)^{n+1}, §7.2's Ricci form −(n+1)ω_Γ, and Layer 9's metric "induced by ω^n" on K_X.

## F02 (P1) — applied

**Verification.** In ComplexComparisonPartII §C−1.1, at the head of its open pull request, the definition of `ComplexAnalyticSpace` says that no Hausdorff axiom is imposed globally and supplies open gluing. The same section shows that separated X has Hausdorff X^an. The review's example works. Gluing two copies of ℙ¹ along X(2) = ℙ¹∖{0,1,∞} gives a compact space that is locally smooth, hence normal. It contains X(2) as an open dense subspace and has 6 boundary points, against 3 for ℙ¹. So the old §10.5 was false.

**Change.** §10.5: "compact normal" → "compact Hausdorff normal". The proof now shows that Hausdorffness makes compact cores closed and f injective, and normality gives one end per point. New Checks: doubled cusps, cocompact. The ℂ* and nodal Checks say "compact Hausdorff". Conventions: finite-set compactifications are "compact Hausdorff". Plan 10.5: statement, hypotheses, tests, proof sketch, §C−1.1 prerequisite.

New Checks: the doubled-cusp negative control and the cocompact degenerate case. The ℂ* Check now says "compact Hausdorff", and the nodal Check says "compact Hausdorff but not normal". The Conventions definition of a finite-set compactification is now "compact Hausdorff". In the plan, target 10.5 gets the new statement, hypotheses, tests (`doubled_cusps`, `cocompact`) and a proof sketch, and its prerequisites gain §C−1.1.

**Pattern.**
- §11.4 applies §10.5 to the Baily–Borel compactification. It now says that both compactifications are projective, so their analytifications are compact Hausdorff (§C−1.1); §C−1.1 is added to its Needs, to Layer 11's Dependencies and to plan 11.4.
- §9.4's independence-of-ℓ argument now says that both normalizations are projective, hence Hausdorff; §C−1.1 is added to its Needs, to Layer 9's Dependencies and to plan 9.4.
- The ComplexComparisonPartII supplier contract, in the README and in the plan's `what`, now records "no global Hausdorff axiom" and "Hausdorff analytification of a separated scheme".
- §§9.5 and 10.6 apply the argument only to projective varieties and needed no change.

## F03 (P3) — applied

**Verification.** For n = 1, ∫₀¹∫_Y^∞ dx dy/(2y²) = 1/(2Y) is finite, so the claim "horoball strip of infinite volume" was false. For n ≥ 2 it is true, because u ranges over all of ℂ^{n−1}.

**Change.** §5.1 Check: "a fundamental domain in B contains a horoball strip of infinite volume" → for n = 1, the strip {0≤x<1, y>0} has area (ε⁻¹−1)/2 → ∞ on ε<y<1 and 1/(2Y) on y>Y; for n ≥ 2, the slab {0≤Re v<1} is infinite inside a horoball. Plan test `cyclic_parabolic_not` carries the computation.

**Pattern.** §5.3's Check (horoball modulo a lattice of N: finite) and plan test `horoball_finite` are correct and unchanged.

## F04 (P3) — applied

**Verification.** Let A = diag(2,1) and g = [[a,b],[c,d]]. Then AgA⁻¹ = [[a,2b],[c/2,d]]. With ρ′(g) = AgA⁻¹, the integral group is A⁻¹SL₂(ℤ)A, and its intersection with SL₂(ℤ) is Γ₀(2). With ρ′(g) = A⁻¹gA, it is Γ⁰(2), as the Check claimed.

**Change.** §11.1 Check: "its conjugate by diag(2,1)" → "ρ′(g) = A⁻¹gA, A = diag(2,1)", with integral group A·SL₂(ℤ)·A⁻¹ and witnesses [[1,1],[0,1]] ↦ [[1,1/2],[0,1]] (not integral) and [[1,0],[1,1]] ↦ [[1,0],[2,1]] (integral). It also notes that g ↦ AgA⁻¹ gives Γ₀(2). Index 3 kept. Plan 11.1 test likewise.

**Pattern.** I checked every other "conjugat…" passage in the README. The only one with a direction, §1.5's "a_{1/2} conjugates T₁ to T_{1/4}", is correct for x ↦ a x a⁻¹ (a_s T_t a_s⁻¹ = T_{s²t}). The others are involutions or have no direction.

## F05 (P3) — applied

**Verification.** Deng2020 line 87 to line 90 (Theorem A) assumes a quasi-compact Kähler manifold with a C-PVHS whose period map on the universal cover has zero-dimensional fibres. Its conclusion is Borel hyperbolicity. MilneSVI line 1742 to line 1744 (Theorem 3.14) is for torsion-free arithmetic groups. Neither is the general-lattice statement of §10.3 without extra input.

**Change.** §10.3: "(MilneSVI … ; Deng2020 Theorem A, line 87 to line 90, general case)" → the argument is deduced here from §10.2 and proper-source algebraicity. MilneSVI gives the torsion-free arithmetic case. Deng2020 Theorem A is a different criterion under its C-PVHS hypothesis, which this roadmap does not construct or use. The plan's 10.3 locator says the same.

**Pattern.**
- §10.1's Deng citation is already labelled "arithmetic case".
- §10.2's Milne and Borel citations are already labelled.
- §10.4's "MilneSVI Corollary 3.16" now reads "in the arithmetic case", in the README and in plan 10.4. Milne line 1771 builds on Theorem 3.12, which is arithmetic.
- The Downstream consumers' Deng2020 Corollary C (line 136) is about torsion-free lattices and is accurate.

## Checks run

Dependency check (final run, after all edits):

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines.

- **Citation resolver** (`roadmaps resolve` on the edited README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **plan.json** parses as JSON. Its original formatting (two-space indent, no trailing newline) is preserved.
- **Lean / Suggested.lean**: this package is at the design stage and has no `Suggested.lean`. No Lean name was added or removed, no `#check` scratch file was possible, and no elaboration was run.
- **Gate failures**: none were listed in the brief.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §2.3 iΘ(K_B) = (n+1)ω, Ric = iΘ(K_B⁻¹) | n = 1, 2; convention witness O(1) on ℙ¹ | n=1: det h=(1−\|w\|²)⁻², ‖dw‖²=(1−\|w\|²)², iΘ(K)=+2ω, iΘ(K⁻¹)=−2ω=Ric. n=2: det h=(1−\|w\|²)⁻³, iΘ(K)=3ω. Frame (1,z) of O(−1): iΘ=−i∂∂̄log(1+\|z\|²)=−2πω_FS, so iΘ(O(1))=+2πω_FS, as ComplexKahlerGeometry K4 states | Applied (F01) |
| Gauss–Bonnet witness for the sign | n = 1, cocompact genus g | ω-area = ½·4π(g−1) = 2π(g−1); deg K = (1/2π)∫2ω = 2g−2 (§9.1 Check uses deg K^ℓ = ℓ(2g−2)); the old sign would give −(2g−2) | Consistent after repair |
| §9.1/§9.2 positivity | ℓ = 1, 2; n = 1, 2 | iΘ(K^{ℓ−1}): ℓ=1 gives 0 (no positivity, matching the "ℓ ≥ 2" Check); ℓ=2, n=1 gives 2ω. iΘ(K^ℓ)+Ric at ℓ=2, n=2: 6ω−3ω = 3ω = (ℓ−1)(n+1)ω | Unchanged, consistent |
| §8.4 \|ν\|² growth | n = 1, metric \|dq\|²/(2\|q\|²log²\|q\|) | ‖dq‖² ∝ \|q\|²log²\|q\|, ‖dq/q‖² ∝ log²\|q\| = (−log\|q\|)^{n+1}; integrand of fν^ℓ ∝ \|f\|²\|q\|⁻²(−log\|q\|)^{2ℓ−2} | Unchanged, consistent with K_B's dual metric |
| §10.5 with Hausdorff | Γ(2)/{±1} doubled; ℂ*; nodal cubic; cocompact Γ; X^M | Doubled: 6 boundary points vs 3, the Hausdorff hypothesis fails, excluded. ℂ*: 2 ends → ℙ¹, 2 points. Nodal: 1 point, punctured neighbourhood has 2 components, f undefined, excluded by normality. Cocompact: X compact ⇒ closed ⇒ Y = X, 0 points; a doubled point would give 1. X^M: boundary of dimension n−1 ≥ 1, not finite | Applied (F02); two new Checks |
| §10.5 injectivity step | Γ(2) doubled cusp at 0 | f⁻¹(V) = two copies of a disc sharing one punctured disc; no disjoint U, U′ exist, so the argument stops exactly at the Hausdorff step | Proof uses the hypothesis where needed |
| §11.4 application of §10.5 | PSL(2,ℤ) | Baily–Borel X(1) = ℙ¹ is projective, so Hausdorff (§C−1.1), with 1 boundary point = \|∂\| of S*_Γ | Pattern repair |
| §9.4 independence of ℓ | Γ(2)/{±1}, ℓ = 2, 3 | Both normalizations ℙ¹ (projective, Hausdorff), 3 points each | Pattern repair |
| §5.1 ⟨T₁⟩ Check | n = 1: ε = 1/10, 1/100, Y = 1, 2; n = 2 | (ε⁻¹−1)/2 = 4.5, 49.5; 1/(2Y) = 1/2, 1/4; n=2: ∫_{\|u\|<R}∫₀¹∫_Y^∞ρ⁻³ = πR²/(2Y²) → ∞ | Applied (F03) |
| §5.3 horoball modulo a lattice of N | n = 1, 2 | ∫_Y^∞ρ^{−(n+1)} = 1/(nY^n) < ∞ with compact u-quotient | Unchanged, correct |
| §11.1 model-independence Check | upper and lower unipotents; general g | A⁻¹[[1,1],[0,1]]A = [[1,1/2],[0,1]]; A⁻¹[[1,0],[1,1]]A = [[1,0],[2,1]]; AgA⁻¹ = [[a,2b],[c/2,d]]; [SL₂(ℤ):Γ⁰(2)] = 6/2 = 3 through SL₂(𝔽₂) ≅ S₃ | Applied (F04) |
| §10.3 locators | torsion-free subgroup of a Deligne–Mostow lattice; PSL(2,ℤ) | Milne needs arithmeticity, so it fails; Deng needs a C-PVHS not built here; the §10.2 + §C4.4 route applies. PSL(2,ℤ): exp: ℂ → ℂ is not algebraic, so torsion-freeness is needed | Applied (F05) |
| §10.4 locator | Milne line 1771 | Built on Theorem 3.12 (torsion-free arithmetic) | Labelled "arithmetic case" |

## Ownership

No new construction was introduced. The repairs strengthen hypotheses or correct statements inside this roadmap's own targets (§§2.3, 5.1, 10.3–10.5, 11.1, 11.4). The one added supplier input, the Hausdorff analytification of a separated scheme, is ComplexComparisonPartII §C−1.1, which I read at its open head. That section already supplies this roadmap, so no new supplier edge was added.

## For the maintainer

- No section, target or Lean name was renamed or removed. No roadmap on main or in an open pull request cites this roadmap (`roadmaps grep` finds no match), so nothing breaks elsewhere.
- §10.5 now has the hypothesis "Hausdorff". Every consumer inside this roadmap (§§9.4, 10.6, 11.4) applies it to projective varieties, whose analytifications are Hausdorff by ComplexComparisonPartII §C−1.1.
- Nothing in the review or in the sources read was an instruction or looked suspicious.
