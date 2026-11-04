# FIX-RT-RankOneConverse~2: red-team round 2 repaired

Files edited: `packages/RankOneConverse/README.md`, `packages/RankOneConverse/Suggested.lean` (one docstring; no signature changed), `packages/RankOneConverse/design/plan.json` (top-level `gaps` only: one `needs` sentence shortened, one gap added).

## RT-RankOneConverse~2a/F01 (P3) — applied

Verified: ModularForms (main) Layer 5 carries “Cross-level strong multiplicity one, for newforms” (README line 657: equal good coefficients at almost all primes give N=M, equal nebentypus, equality); Layer 4 the primitive associate (line 532 ff., 1426); Layer 9 “Inner twists” the twisting API with good-prime formula and passage to the primitive associate (line 996–1000). Pinned `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` (`StrongMultiplicityOne.lean` line 120) fixes level and nebentypus. Old → new: the ModularForms contract now names these three owners and the pinned fixed-space theorem; §4.1’s definition paragraph, its *Needs* and Layer 4 Dependencies cite them; the Lean docstring cites Layer 5.

## RT-RankOneConverse~2a/F02, RT-RankOneConverse~2b/F06 (P3) — applied

The single predicate Check is split into two (rejection of g′=g by −2≠2; δ=1 accepts g′=g, uniquely) and three are added: Δ with δ=5 (χ₅(2)=χ₅(3)=−1, demands a₂=24, a₃=−252 from τ(2)=−24, τ(3)=252; Δ⊗χ₅ of level 25 passes, Δ fails at q=2); the CM relation Check (self-twist by χ_(D_K) makes δ and δD_K name one twist, instance level 27, D_K=−3, δ=5 → 5 and −15); the normalization Check (2g′ has a₁=2, excluded by `Newform`’s a₁=1). README only; no Lean example added.

## RT-RankOneConverse~2b/F01 (P2) — applied

Verified: EllipticCurves (main) Layer 1 milestones (ii)–(iv) (README lines 637–645) and Layer 4 (lines 793–905) state no torsion result at the residue characteristic; the only mention is Provenance line 1852. Pinned `Torsion.lean` lines 72 and 114 need `IsUnit (n : O)` resp. `(n : A) ∉ u.asIdeal`, so cover only orders prime to p. No roadmap on main or at the open heads states torsion-freeness of E₁(ℚ_p) at p (grep over `kernel of reduction`/`E₁`/`torsion`; NeronModelsAndSemistableAbelianVarieties line 376 only names the pinned `kerReduction` API). Old → new: Tau Ceti contract names the two pinned prime-to-p lemmas and says the p-power case is not at the pin; EllipticCurves contract replaces “the formal-group kernel over ℚ_p is torsion-free” by the explicit statement and declares `gap:formal-group-p-torsion` (supplier EllipticCurves, Layer 1 and Layer 4, p≥3) with the identical `needs` sentence in `plan.json`; §5.1’s route, *Needs* and Layer 5 Dependencies cite the gap; a §5.1 Check records the sharpness at p=2 (bound v(p)/(p−1)=1, witness [2](−2)=0 in the multiplicative formal group over ℤ₂). Pattern search: `torsion-free` occurred only at lines 59 and 482; both repaired.

## RT-RankOneConverse~2b/F02 (P3) — applied

Verified at GL2AutomorphicRepresentationsAndTransfer head: R16.3.6 (“complex angular weight m gives i^|m|”, “D₂ has epsilon −1; angular weights ±1 both give i”) and R17.4.3 (“Real-to-complex transfer restricts the real Weil parameter … at every finite and infinite place”). Old → new: the archimedean clause is deleted from the `needs` of `gap:squarefree-base-change-signs` in README and `plan.json` (now ends “independently of the additive character.”); the GL2 contract derives the value i·i=−1 from R16.3.6 with R17.4.3. Conventions Checks (two inert: (−1)·(−1)²=−1) recompute unchanged.

## RT-RankOneConverse~2b/F03 (P3) — applied

Verified at ArithmeticStatisticsPartVI head, “Heegner logarithm and low rank”: “The same target supplies the low-analytic-rank implication over Q for any elliptic curve with modular comparison data: analytic rank zero or one implies the same algebraic rank and finite Sha” and “prove that specialized auxiliary-twist existence here as part of the deduction”; ArithmeticStatisticsPartVI precedes this roadmap in the merge order and does not consume it. Old → new: a paragraph after `gap:gl2-full-forward` names the d=1 instance and restricts the gap to d≥2 (A_f and A_f^D alike); §4.3’s route and *Needs* split d=1 (ArithmeticStatisticsPartVI) from d≥2 (gap); §4.4 *Needs*, §5.3’s route, *Needs* and Layer 4–5 Dependencies cite the ArithmeticStatisticsPartVI target instead of the full-forward contract for E/ℚ and E^D; §4.2 records that its elliptic (D,N)=1 inert instance is proved there and that §4.2 proves the GL₂-type and ramified Case I versions. Layer 6 (Theorem E, general d) keeps the full-forward contract.

## RT-RankOneConverse~2b/F04 (P3) — applied

Verified: AutomorphicGaloisRepresentations §6.4 (head, lines 2568–2570) gives the p∥N local matrix with unramified χ_u of Frobenius a_p and identifies the elliptic conductor and L-function with f’s, with no split/nonsplit clause; pinned Mathlib `LFunction.lean` lines 43–50 define `localPolynomial` as 1−X (split) and 1+X (nonsplit multiplicative); GL2 R16.3.2 gives L(s,π)=L(s+1/2,χ) for St⊗χ. Old → new: the GL2 contract sentence and §4.4 *Needs* attribute the dictionary to the three suppliers (a_q(E)=±1 from `localPolynomial`; a_q(f)=a_q(E) from §6.4; a_q(f)=μ(q) from R16.3.2, μ=1 St, μ=ξ St⊗ξ). Check at §4.4 (nonsplit ↔ a_q=−1 ↔ St⊗ξ) recomputes unchanged.

## RT-RankOneConverse~2b/F05 (P3) — applied differently

The defect is real: the pinned theorem and the fixed-space strong multiplicity one presuppose the nebentypus, which the predicate does not constrain. The suggested justification (Brauer–Nesbitt and Chebotarev on the attached Galois representation) is correct but imports Galois representations into a statement about newforms; the uniqueness with level and nebentypus recovered is exactly ModularForms Layer 5, “Cross-level strong multiplicity one, for newforms” (Miyake 4.6.19), already on main. Old → new: README §4.1 and the Lean docstring say that cross-level strong multiplicity one recovers level and nebentypus from the coefficients, so the nebentypus is not assumed in advance, and that the fixed-level pinned theorem does not apply before that. The Lean statement is unchanged.

## RT-RankOneConverse~2b/F07 (P3) — applied

Verified on main: PadicMeasuresIwasawaAlgebras §§1.1–1.4 are finite coefficients, convolution, finite quotients of ℤ_pˣ and unit-measure coordinates (lines 606–798); the completed group ring comparison is §1.7 (line 909) and Layer 1 as a whole; the only involution there is the sharp involution of a finite group ring (§6.1). SelmerIwasawaCohomology §3.0 (head, line 1330) “fixes the coordinates, the involution, the twists and the augmentation regular sequence”, and §2.1 here already cites §3.0 in its *Needs*. Old → new: scope line for PadicMeasuresIwasawaAlgebras reads “Layers 1–2, §§4.1–4.6, 5.1–5.2 and 6.5: measures, completed group rings, characteristic divisors, determinants and topological Nakayama; the involution ι:γ↦γ⁻¹ used in §2.1 is SelmerIwasawaCohomology §3.0”; §3.0 is added to the SelmerIwasawaCohomology scope line and contract.

## Checks

Elaboration (`lake env lean` on `Suggested.lean` from the content checkout, after `lake build` of `TauCeti.NumberTheory.ModularForms.LFunction.Sign` and `TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Character`, which the worker’s environment lacked): exit 0, only the two `declaration uses 'sorry'` warnings (lines 67, 82). The file opens with `module` and `public import Mathlib` (the form the roadmaps on main that import Mathlib under the module system use, e.g. `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean`), so the toolchain’s “imports `Mathlib` … consider adding `module`” warning no longer appears; the TauCeti imports stay plain `import` lines.

`#check @name` scratch file for all three declarations elaborated once: `IsPrimitiveQuadraticTwist : {N M : ℕ} → [NeZero N] → [NeZero M] → {k : ℤ} → Newform N k → Newform M k → (D : ℤ) → IsFundamentalDiscriminant D → Prop`; both headlines carry `{N} [NeZero N] {k} (f) (hχ : f.χ = 1) (hk : 0 < k) (ε : ℤ) (hε) (S₀) (hS₀) (hN)` explicitly, with `M`, `NeZero M`, `g` existential inside the set; no section variables exist, nothing dropped, and each type agrees with its README statement. Nothing changed in the signatures this round.

Depcheck (`gate --depcheck … --movable --content`):

    depcheck: 208 roadmaps, 1803 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The new supplier EllipticCurves is on main; ArithmeticStatisticsPartVI and ModularForms were already cited.

`roadmaps resolve`: one lead, “AutomorphicCongruences §2.22: no roadmap … on main or in an open pull request”. False positive: AutomorphicCongruences is a board package listed in the merge order before this roadmap (board packages index), and §2.22 “Wan's ordinary GU(3,1) Rankin–Selberg divisibility” exists at its head, as round 2 pass a also recorded. Gap `needs` sentences and suppliers were compared by script between README and `plan.json` for all eleven gaps: all identical.

No gate failures were listed for this round.

## Adversarial pass on the added or changed text

| Statement | Instances; values | Result; change |
|---|---|---|
| gap:formal-group-p-torsion (E₁(ℚ_p) torsion-free, p≥3) | order-p point in a formal group has v(t)≤v(p)/(p−1): p=5 → 1/4<1, p=3 → 1/2<1, p=2 → 1, realized by Ĝ_m/ℤ₂ at t=−2: [2](−2)=(1−2)²−1=0; order p^n, n≥2, bound 1/(p^n−p^(n−1))<1 for every p≥2 | p≥3 sharp; p=2 negative control added as a §5.1 Check |
| §5.1 deduction E(ℚ₅)[5∞]=E(ℚ₅)[5] | injective reduction, #Ẽ(𝔽₅)≤10<25 → order ≤5; with only prime-to-5 lemmas: no bound | gap cited; unchanged otherwise |
| archimedean base-change sign | k=2: angular weights ±1, i·i=−1; real D₂ epsilon i²=−1 agrees; k=12 would give i^11·i^11=−1 while the real epsilon is i^12=+1, so the derivation is used only for weight two | matches R16.3.6; clause removed from gap |
| multiplicative dictionary | split: 1−X, a_q=1=μ(q) with μ=1 (St); nonsplit: 1+X, a_q=−1=ξ(q) (St⊗ξ); additive: polynomial 1, a_q=0, outside the semistable hypothesis | three owners cited |
| cross-level uniqueness in `IsPrimitiveQuadraticTwist` | Δ, δ=5: level 25 twist with a₂=24, a₃=−252 unique; same coefficients with a different assumed nebentypus impossible since the theorem recovers it | owner cited |
| Check Δ⊗χ₅ | χ₅(2)=χ₅(3)=−1 (squares mod 5 are 1,4); (−1)(−24)=24, (−1)(252)=−252; 2,3∤1·25·5 | added |
| Check CM relation | χ_(−3)(q)=1 for q≡1 mod 3, a_q=0 for q≡2 mod 3; δ=5, (5,−3)=1, −15≡1 mod 4 squarefree hence fundamental; a_7(27a)=−1 both ways | added |
| Check 2g′ | a₁(2g′)=2≠1 | added |
| Check δ=1 | χ₁ trivial, predicate a_q(g′)=a_q(g) away from M₀M′, g′=g; uniqueness forces M′=M₀ | added |
| d=1 versus d≥2 forward inputs | E^D elliptic for d=1 (ArithmeticStatisticsPartVI); A_f^D of dimension d for d≥2 (gap); Theorem C: 1+0=1 unchanged | split recorded |
| involution owner | γ⁻¹−1=−γ⁻¹(γ−1): augmentation ideal ι-stable, as §2.1 states | §3.0 cited |

## For the maintainer

- New supplier gap `gap:formal-group-p-torsion` on EllipticCurves (Layer 1 and Layer 4), p≥3, torsion-freeness of E₁(ℚ_p). Its mathematics is Silverman IV.6.1/IV.6.4 and VII.3.1; the Stoll provenance named in EllipticCurves already contains it, but no target on main states it.
- The `needs` of `gap:squarefree-base-change-signs` lost its archimedean clause; no other roadmap cites that gap.
- No Lean name changed; `IsPrimitiveQuadraticTwist`, `infinite_twist_analyticRank_eq_zero`, `infinite_twist_analyticRank_eq_one` keep their signatures.
- Ownership against open pull requests was checked through `roadmaps grep`/`resolve` over the indexed heads and the board packages index; no sibling checkout among those named in the brief states the formal-group torsion theorem or the primitive-twist predicate.
