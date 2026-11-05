# Review of AdelicAlgebraicGroups (pull request #792 at 93998b1)

**Verdict:** needs changes

The gate fails at this head (`depcheck=2`, `prnum=8`, `residue=9`, `outside-folder=9`; build passes). Three findings block: a supply cycle with FuchsianOrbifolds (P1), an upward edge to LFunctions that the merge order cannot absorb (P2), and three Tau Ceti declarations cited as pinned that do not exist at the pin (P2). The mathematics of the twenty sorried headline statements survived the adversarial pass; the sampled locators into the readable sources are right, with one consistently shifted block of Orr page numbers.

## R01 (P1) — Supply cycle with FuchsianOrbifolds

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` lines 124–129 ("The Fuchsian orbifolds roadmap supplies the coarse quotient Riemann surface … (layers 0–1) … (layer 4) … (layer 5)"), 176, 5105, 5114, 5172, 5252.

Claim: FuchsianOrbifolds layers 0, 1, 4 and 5 are suppliers of AA.5.2 (Riemann-surface structure, biholomorphisms, finite holomorphic maps between `GL₂` levels).

Witness: the dependency check prints `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`. FuchsianOrbifolds is not in the merge order, so it is placed after its suppliers; its open head (`TauCetiRoadmap/FuchsianOrbifolds/README.md` at the revision pull request, lines 133 and 965) names AdelicAlgebraicGroups as an owner it consumes and cites AA.3.4 `class-number-finite` (`Reduction.finite_classes`). Each roadmap supplies the other.

Repair: drop FuchsianOrbifolds from AA's suppliers. In AA.5.2 keep the topological statements (the homeomorphism of `exists_componentHomeomorph`, continuity and finite fibres of the level maps, the component counts) and move the holomorphic clauses (coarse quotient Riemann surface, biholomorphism under `z ↦ q·z`, finite holomorphic map, the "Riemann-surface structure and change of level" target) to Scope and ownership as left to the roadmap that owns the complex structure; the module docstring of `Suggested.lean` already records that comparison as not statable. Re-run the check: the `CYCLE` line must disappear.

## R02 (P2) — Upward supplier LFunctions, not movable

Location: `README.md` lines 110, 260 ("Finite-order Hecke analysis | LFunctions, Layer 5 for continuation and Layer 7 for nonvanishing"), 505, 2012, 2024, 2045, 2321, 5322.

Claim: the Artin leading coefficient of AA.2.4 consumes LFunctions' primitive finite-order Hecke continuation, `eulerCorrection` and `heckeLFunction_ne_zero_of_one_le_re`.

Witness: the dependency check with `--movable` prints `UPWARD: AdelicAlgebraicGroups (#34) -> LFunctions (#324)` and `not movable: … consumed by ArithmeticKTheory (#98) … a cycle through AdelicAlgebraicGroups`.

Repair: repoint to the earliest owners, which are already earlier than AA. The pinned Tau Ceti has, in `TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean` (lines 73–134), `TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` and `…_of_isTrivialOnGood_sq`: no zero on `Re s ≥ 1` for a unitary ideal weight with partial-sum cancellation (quadratic case separately); ArithmeticDirichletSeries (Completed) owns the continued L-function, and Chebotarev Layer 5 (Completed) supplies the cancellation of ray-class characters, their continuation through `Re s = 1`, `ne_zero_at_one`, and the ramified Euler correction (its 12.1). State whatever remains (the correction at a larger modulus, the one-dimensional Artin–Hecke comparison) as targets of AA.2.4, and record the move. Delete the LFunctions rows, links and the `oddPrimitiveModFour` name in the 2.4 Check. The dependency check must show no `UPWARD` line.

## R03 (P2) — Supplier drift: height declarations cited at the pin do not exist there

Location: `README.md` line 258 ("use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2`, with `[Finite ι]`, from TauCeti/NumberTheory/Height/Arakelov/Basic.lean"); consumed at lines 3363–3372 (AA.3.5, rational-point Arakelov comparison).

Claim: the relative projective height and its comparison are pinned Tau Ceti declarations.

Witness: the pinned Tau Ceti has no `TauCeti/NumberTheory/Height` directory, and `grep -rn arakelovMulHeight` over the pinned library returns nothing. `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` line 49 lists `arakelovMulHeight` under "This roadmap §2.5", that is as DAT's own target, and line 1300 defines `height2` as DAT API.

Repair: cite DiophantineApproximationAndTranscendence §2.5 (Relative Euclidean projective normalization) for `height2`, `arakelovMulHeight`, `arakelovMulHeight_eq_height2` and `height2_baseExtension` as roadmap targets, without the `TauCeti.` prefix and without a library file; or declare a gap on DAT with that slug in `plan.json` and the README.

## R04 (P3) — Citation key `[PR94]` trips the pull-request-number scanner

Location: `README.md` lines 3106, 3954, 3964, 3975, 3983, 4175, 4183, 5328.

Witness: gate `prnum (8)`, rule "no pull-request numbers in the README".

Repair: rename the key, for example `[Platonov–Rapinchuk]`, and keep the 1994 edition's entry under that key.

## R05 (P3) — Process residue: HTML anchors

Location: `README.md` lines 586, 607, 845, 919, 1393, 4002, 4482, 4811, 5020 (`<a id="…"></a>`).

Witness: gate `residue (9)`.

Repair: delete the anchors; the targets already carry italic slugs.

## R06 (P3) — Edits outside the roadmap folder

Location: `git diff --stat origin/main...HEAD` lists `TauCetiRoadmap/ReductiveGroupsPartII/*`, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/*`, `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/*` (nine files, 22029 lines).

Witness: gate `outside-folder (9)`; the pull request is stacked on the ReductiveGroupsPartII branch.

Repair: rebase onto main once the base pull requests merge (or submit after them); the gate fails until the diff is confined to `TauCetiRoadmap/AdelicAlgebraicGroups/`.

## R07 (P3) — Backticked names of this roadmap that `Suggested.lean` does not declare

Location: `README.md` 1015 (`infiniteDiagonal`), 1018 and 4045 (`finiteEmbed`), 2712–2717 (`RealSiegel.IsReduced e C b`), 4967 (`levelUnits F ⊤ = ⊤`, inside a Check), 5025–5054 (`principalLevel N`, `level0 N`, `level1 N`, `PrincipalLevelMembership N g`, `Level0Membership`, `Level1Membership`, `CongrMod N x y`).

Witness: `grep -c` of each name in `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` returns 0; `RealSiegel.IsReduced` is declared with signature `(C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ)` (line 371), with no basis argument.

Repair: write these in prose or mark them as README-only notions without backticks; describe `IsReduced` as the standard-basis predicate the Lean states, with the basis-dependent version as a README target; a Check never names a Lean counterpart.

## R08 (P3) — Orr locators: page numbers shifted, lettered subsections absent

Location: `README.md` lines 3521, 3566, 3601, 3688, 3692, 3717, 3729, 3742–3743 (e.g. "[Orr], §4.B, Lemmas 4.2–4.5, pp. 17–19", "§4.D, Lemmas 4.10–4.11, pp. 22–23", "§4.F, Proposition 4.14, p. 24").

Witness: in Orr line 666 Lemma 4.2 is on p. 15, line 707 Lemma 4.5 on p. 16, line 754 Proposition 4.7 on p. 18, lines 864 and 888 Lemmas 4.10–4.11 on pp. 20–21, lines 919 and 932 Lemmas 4.12–4.13 on pp. 21–22, line 947 Proposition 4.14 on p. 22; the printed page numbers equal the PDF page numbers (line 637 header "15"). The subsections of arXiv v2 are numbered (line 638: "4.1. Reduction to a split torus"), not lettered §4.A–4.F or §2.A–2.C.

Repair: cite the arXiv v2 pages above and its numbered subsections, or cite the journal version with its own pagination and lettering, and say which.

## R09 (P3) — Form of `Suggested.lean`

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` line 299 (`instance instBorelSpace … := ⟨rfl⟩`), line 12 (module title "headline targets").

Witness: `instBorelSpace` has no docstring; every other declaration has one. The module docstring form is "<title>: target signatures".

Repair: add the docstring; use the standard title.

## R10 (P3) — Local copies of supplier objects as global instances

Location: `Suggested.lean` lines 52–54 (`instance evaluationTopology … := ⨅ h : H, TopologicalSpace.induced …`), 81 (`adelicBorel`), 295–299 (`RestrictedHaar.instMeasurableSpace`, `instBorelSpace`).

Claim (README 1.1 and Scope): the evaluation topology is owned by ReductiveGroupsPartII RG2.0.1.

Witness: `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` lines 85–97 declares the same topology as `PointTopology.topology` with `scoped instance instTopologicalSpaceWithConv` on `WithConv (A →ₐ[k] R)`; AA's instance is global on the same carrier. The two agree as topologies (`induced` commutes with `⨅`).

Repair: acceptable as the statement-enabling definitions the acceptance test needs; say in the docstrings that they restate RG2.0.1 and AA.0.1 respectively, and make the three instances `scoped` so that no second global instance exists on a library type when both roadmaps land.

## R11 (P3) — Supplier citations by fork URL and commit hash

Location: `README.md` lines 257 (MassFormula, `github.com/0stellensatz/…/c4f7f7be…`), 260 (LFunctions, `github.com/roed-math/…/e632e3a…`), 294–295 (QuaternionicModularForms, `github.com/WilliamCoram/…/f0be7f1/…`).

Witness: the house rule is roadmap name and section, never a pull-request or commit locator; MassFormula is on main (`TauCetiRoadmap/MassFormula/README.md` line 280, "Layer 2: lattices, index, and the Haar scaling law").

Repair: cite "MassFormula, Layer 2", "QuaternionicModularForms, §0.1–0.3" (and, after R02, no LFunctions) without URLs.

## Verified sound

**Gate.** Re-ran the dependency check with `--movable`: output `not movable: AdelicAlgebraicGroups consumes LFunctions (#324) and is consumed by ArithmeticKTheory (#98)…`, `UPWARD: AdelicAlgebraicGroups (#34) -> LFunctions (#324) at README lines [110, 260, 505, 2315]`, `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`, `depcheck: 156 roadmaps, 1075 edges, 2 problem(s)`. Elaborated `Suggested.lean` with `lake env lean`: 20 `declaration uses sorry` warnings, nothing else; imports are `import Mathlib` plus eight `TauCeti.*` modules that exist at the pin; no `set_option`, `lemma`, `#eval`, sorried data or `example`. Compared the 66 elaborated signatures of `signatures.md` with the README: the seven flagged binders are not defects (`InfinitePoints`, `IsCentralCocharacter`, `IsNeatAut`, `GL2.diag`, `GL2.toReal` do not mention `NumberField F` or `CommRing H`; the `RestrictedHaar` instances keep `Group` and `TopologicalSpace` through `Subgroup (G i)`).

**One-tactic probe.** On a scratch copy every `sorry` was replaced by `first | (simp; done) | (rfl; done) | (infer_instance; done) | sorry`; all 20 sorry warnings remain and no declaration closed: no padding by this measure. Each sorried statement is a README headline (class numbers, finite volume, compactness, Borel–Harish-Chandra, weak and strong approximation, neat levels and coverings, restricted Haar products, quotient integration, `GL_n` reduction, Hasse–Schilling–Maass, idele classes modulo squares, Fourier limits, the `GL₁` torus and the `GL₂` decomposition). Headlines not statable at the pins (Tamagawa measure and number, scalar restriction transport, Siegel covering and Orr–Schnell containment, the torsor Hasse principle, `π₀(X_Q)`, the `GL₂` Riemann surface) are named in the module docstring with the missing carrier.

**Adversarial table** (instances tried, values on each side, result).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `exists_unique_haarProduct` | `ι = ∅`; `ι = Fin 1`, `G = ℝ`, `B = ℝ`, `μ` Lebesgue; `ι = ℕ`, `G i = ℤ/4`, `B i = {0,2}`, counting | `box C = univ`, `∏ᶠ = 1`, `ν = δ`; cofinite hypotheses vacuous, `ν(box C) = μ(C)` for all `C` so `ν` = Lebesgue; `μ i (B i) = 2 ≠ 1` so `hμ` fails | sound; uniqueness from a box of finite positive mass and `isMulLeftInvariant_eq_smul` |
| `exists_unique_convergentHaarProduct` | tail masses `a_i = 1`; one `C₄` factor, `B = {0,2}`, `S` = all; tail `a_v = 1 − q_v⁻²` | `∏' = 1`, agrees with `∏ʳ μ`; box mass `2`; `∑ q_v⁻² < ∞` so `Multipliable`, product in `(0,1)` | sound; `ENNReal.ofReal` of a positive real |
| `exists_unique_quotientMeasure` | `H = ⊥`; `H = ⊤`; `G = SL₂(ℝ)`, `H` = Borel | `ν = μG`; `ν = λ·δ` with `μG = λ μH`; `Δ_H(diag(a,a⁻¹)) = a² ≠ 1 = Δ_G`, `hmod` fails | sound; `q ↦ mk''(q.out * g)` equals the continuous right translation, hence measurable |
| `exists_restrictedProductEquiv` | `H = F` (trivial group); `H = F[T]` standard model | both sides singletons; `𝔸_f ≃ Πʳ [F_v, 𝒪_v]` coordinatewise | sound |
| `localPoints`, `globalPoints` as `Subgroup.closure` | `G_a`, model `X ↦ pT`, `v ∣ p`; `G_m` standard, `S = ∅` over `ℚ` | set is `p⁻¹𝒪_v`, already a subgroup (Δ, S, ε of `𝓗` land in `𝓗`), closure = itself; `Γ(M,∅) = {±1}` | sound; closure is harmless |
| `arithmetic_finite_volume_iff` | `H = F`; `G = G_m/ℚ`, `Γ = {±1}`; `SL₂/ℚ`, `Γ = SL₂(ℤ)` | `GroupLike F F` subsingleton, `μ(univ) = μ(pt) < ∞`; `vol({±1}\ℝ^×) = ∞`, `GroupLike ⊇ {T^k}`; finite volume, no characters | sound; matches Milne line 1483–1486 |
| `finite_classes` | trivial group; `G_a`, `U = ∏𝒪_v`; `G_m/ℚ`, `U = ℤ̂^×` | 1 class; 1 class (strong approximation); `h = 1 = #Cl(ℤ)` | sound; Borel line 608 |
| `exists_fundamentalDomain_normOne_lt_top` | `G_a`; `G_m`; upper Borel `B ⊂ GL₂` | `normOne = ⊤`, `F\𝔸` compact; `F^×\𝔸^1` compact; `B(𝔸)^1` quotient finite (unipotent fibre compact over `(F^×\𝔸^1)²`) | sound |
| `finite_volume_iff` | `G_m`; `SL₂`; `B` upper Borel with left Haar `δ(t)⁻¹ dn dt` | `∞` vs characters `≠ 0`; finite vs `0`; `∫_{(F^×\𝔸^×)²} |a/d|⁻¹ = ∞` vs `X* ≠ 0` | sound; `μ_left(D)` independent of `D` by left invariance |
| `exists_compact_normOne_iff` | `G_m`; `GL₂`; `SL₁(D)`, `D` division; anisotropic torus | compact, cocharacters `T^k` central; not compact, `diag(2,1)·[[1,1],[0,1]] = [[2,2],[0,1]] ≠ [[2,1],[0,1]]`; compact, only the trivial cocharacter; compact, commutative | sound; Borel line 716–719 |
| `HasStrongApproximation` | `G_a`, `Sf = ∅`; `G_m/ℚ`, `Sf = ∅` | dense (`𝔸 = ℚ + ℝ×ℤ̂`); `ℚ^× ∩ ℤ̂^× = {±1}`, not dense | sound; `(1 : FiniteAdelicPoints).ofConv h v = ε(h)` pins `y_v = 1` |
| `hasStrongApproximation_of_simplyConnected` | `SL₂/ℚ`, `Sf = ∅`; definite `SL₁(D)/ℚ`; `SL₂ × SL₁(D)` | `SL₂(ℝ)` noncompact, SA holds; `G(ℝ)` compact, hypothesis fails; quotient `SL₁(D)` compact, hypothesis fails | sound; matches Arthur line 539–542 |
| `hasWeakApproximation_of_simplyConnected` | `Sinf = Sf = ∅`; `μ₂` | target a point; `μ₂` is not an object of `SemisimpleCommHopfAlgCat` | sound |
| `exists_reduced_GLZ` / `IsReduced` | `n = 0`; `I_n`, `C = 2`; `diag(4,1)` vs `diag(1,4)`, `C = 2` | needs `1 < C`; `|δ_ij| < 2`, `1 < 2`, `1 < 2 det`; `4 < 2·1` fails vs `1 < 8` holds | sound; (1)–(3) are BKT line 810–816 verbatim in content |
| `IsNeatAut`, `exists_isNeatLevel_le` | `diag(2,1/2)`; `(0 −1;1 −1)`; `2·(0 −1;1 1)`; `n = 0` | `⟨2⟩` torsion-free; order 3; `det = 4`, eigenvalue ratio `ζ₃`; `O(GL₀) = F ↠ H` forces trivial group | sound; Milne line 1516–1524 |
| `isCoveringMap_levelMap` | `G_m/ℚ`, `K∞ = ℝ_{>0}`, `U(3) ⊃ U(9)`; `SL₂`, `K∞ = SO(2)`, `U(3) ⊃ U(9)`; `G_a`, `K∞ = 0`, `ℤ̂ ⊃ 2ℤ̂`; real quadratic `K∞ = exp Λ` | fibres `3 = [U:U']`, `#X_U = 2`, `#X_{U'} = 6`; degree `27 = 648/24`; `ℝ/2ℤ → ℝ/ℤ`, degree `2`; `η = (1+√2)⁴ ≡ 1 (4)`, `≢ 1 (8)`, `η² ≡ 1 (8)`, `H_G(K∞) = L(ℤ+(1+√2)ℤ) ≠ ℝ` so `hKH` fails | sound; the hypotheses exclude the README's non-covering |
| `nrd_image` | `(−1,−1)/ℚ`; split `(1,b)`; `D` ramified at one of two real places | sum of four squares, `c > 0` ⟺ RHS; RHS vacuous, `det` onto `F^×`; positivity at one place only | sound |
| `compactSpace_ideleClassGroup_quotient_squares` | positive scalar `2`; idele `−1` at `3` | square of the idele `√2` at infinity; `−1 ∉ ℚ₃^{×2}`, survives | sound; `C_F² = ℝ_{>0} × (C_F¹)²` closed |
| `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` | `C` finite; `∏_n {±1}` with coordinate characters; a repeated character | no injection `ℕ → Ĉ`, vacuous; `∫ψ dm_n = δ_{ψ = χ_n} → 0 = ∫ψ dμ`; coefficient of the repeated character stays `1`, hence `hχ` needed | sound; Khayutin line 1030–1034 |
| `nonempty_connectedComponent_homeomorph` | `F = ℚ`, `Q = ∅`; `ℚ(i)`, `Q = ∅`; `ℚ(√2)`, `Q = ∅`; `v ∣ p` with `N(v) ≡ 1 (p^n)` | point, `rank = 0`; class group of points; `ℝ/log ε ℤ`, `rank = 1`; impossible for `n ≥ 1`, so `(𝒪_v^×)^{p^n}` has index `p^n` | sound; CG line 3583–3588 |
| `levelQ F ∅ p n` | — | no `v ∈ Q` clause, independent of `p, n` | Check holds |
| `exists_componentHomeomorph` | `U = GL₂(ℤ̂)`; `U = K(3)` | one component `SL₂(ℤ)\ℍ`; two components, `Γ(3)\ℍ` each | sound; Milne line 2486–2494 |
| `levelSubgroup`, `LevelQuotient` | `GL₁/ℚ`, `U = ℤ̂^×`, `K∞ = ℝ^×` | `𝔸^× = ℚ^× ℝ^× ℤ̂^×`, quotient a point | sound |
| Modulus conventions (AA.2.2) | upper Borel of `GL₂/ℚ`, real `diag(2,1)` | pushforward of `da dx/a²` under `(a,x) ↦ (2a,x)` is `2·μ`, so `Δ = 2` | README Check holds |
| `a_G`, `H_G` (AA.2.1, 2.3) | `GL₂` Borel projection; quadratic `F`, scalar `t` | `(a,d) ↦ a+d`, lift `z ↦ (z/2,z/2)`; `‖t‖ = t²`, `H_G = 2 log t`, measure `2 dt/t` | Checks hold |
| Weil volume (AA.2.4) | `GL₂`, `q = 2`; `SL₂`, `q = 2`; split `SL₂/𝔽₂` order | `6/16 = 3/8`, corrected `2·3/8 = 3/4 = 1 − 1/4`; `6/8 = 3/4`; `2·1·(1+2) = 6` | Checks hold |
| Siegel-set Checks (AA.3.2, 3.4) | `k = [[0,−1],[1,0]]`, `u = n(1)`; modular domain | `Im(k·i) = 1`, `Im(k(1+i)) = 1/2`; `Im` on an orbit is maximal in `𝒟`, so `y > √3/2` misses the orbit of `ρ` | Checks hold |
| Orr–Schnell examples (AA.3.7) | tilted torus `x = 2`; `η diag(2,1,1/2) η⁻¹` | `[[2,−3/2],[0,1/2]]`, image `(1−y)+iy`; `[[35/16,0,9/16],[0,1,0],[−9/16,0,5/16]]`, `(η²)₁₃ = −3/2` | Checks hold |
| Hurwitz check (AA.5.3) | `U₁(9)` at `3` | index `81 − 9 = 72`, central index `2`, `3 = 36·(1/12)` | Check holds |
| CG correction (AA.5.1) | real quadratic `F`, narrow class number 3, `p = 2`, `Q = ∅` | `π₀(X_Q) = Cl⁺ ≅ ℤ/3`, maximal exponent-2 quotient trivial | README's correction of CG is right |

**Sources opened at the sampled locators** (source id and line): Conrad line 53 (Prop. 2.1, p. 2), 115 (Ex. 2.3, p. 3), 119 (Ex. 2.4), 232 (Thm 3.4, p. 5), 253 (Rem. 3.5, p. 6), 281 (Thm 3.6, p. 6), 452 (Ex. 4.2, p. 9); Borel line 184 (1.8, p. 9), 363 (2.5, p. 13), 366 (2.6), 372 (2.7, p. 13), 510 (4.1, p. 17), 522–545 (4.3–4.5, p. 17), 581 (4.6, p. 18), 608 (5.1, p. 19), 655 (5.5, p. 20), 679 (5.6, p. 21), 716 (5.8, p. 22), 853–862 (7.2–7.3, p. 25), printed page = PDF page + 3; Arthur line 539 (Thm 2.1, p. 12), 572 ((2.1), p. 13), 2031–2044 (Siegel sets, Thm 8.1, p. 37), 3985–3989 ((13.2)–(13.4), p. 70); Milne line 1483 (Thm 3.3, p. 33), 1500–1524 (Ex. 3.4, neatness, Prop. 3.5, p. 34), 1855 (congruence subgroups, p. 42), 1911 (Prop. 4.1, p. 43), 2462–2494 (Lemmas 5.11–5.13, pp. 56–57), 2516–2518 (coverings, p. 58), 2579 (Thm 5.17, p. 59), 2658 (Lemma 5.21, p. 61), 2725 (`π₀`, p. 63); BKT line 210 (Rem. 1.4, p. 5), 358–367 (Defs 2.3, 2.5, p. 8), 378–392 (Prop. 2.7(1)–(5), p. 9), 810–816 (Def. 4.11, pp. 17–18); BKTErratum line 50 (Rem. 1.1, p. 2), 72 (Thm 1.2), 133 (1.6.1, p. 4); Orr line 207 (Lemma 2.1, p. 6), 623 (Thm 4.1, p. 15) and the pages of R08; BGST line 622 (§28, Prop. 28.1, p. 14); Rapinchuk line 96 (Lemma 1.2, p. 3), 436 (Prop. 2.1, p. 9), 565–578 (Thm 2.3 and Remarks, p. 12), 742–760 (§2.6, Lemma 2.7, p. 16); LT line 421 (3.2.1, p. 11), 496–519 ((20), (21), p. 14), 578–621 (3.2.3, (28), p. 16); HW line 261 (weak approximation convention, p. 6), 872 (Thm 6.1, p. 21), 911 (Lemma 6.3, p. 22); Khayutin line 653–658 (§2.3, pp. 15–16), 912 (Def. 3.1, p. 22), 1001 (Prop. 3.6, p. 24), 1013–1045 (proof, p. 25); CG line 3570–3590 (§8.2, pp. 78–79); ConradRGS line 602 ((1.2.1), p. 16), 1487 (Prop. 1.4.7, p. 35), 3334 (Def. 3.1.1, p. 81), 3659 (Cor. 3.1.11, p. 88); Sutherland line 291–309 (adelic Haar measure, p. 6); Platonov (Russian original) line 253, 295, 306 (Props 3.2, 3.3, §3.4): numbering matches, translation pages not checked. All locators above agree with the README except the Orr pages of R08.

**Library declarations opened at the pins.** Mathlib: `MeasureTheory.distribHaarChar` (DistribChar.lean:44), `Subgroup.index_mul_measure` (Group/Measure.lean:285), `Measure.infinitePi_map_restrict` (ProductMeasure.lean:373), `RestrictedProduct.topologicalSpace_eq_iSup` (:293), `continuous_dom` (:303), `isOpenEmbedding_inclusion_principal` (:374), `isOpenEmbedding_structureMap` (:383), `locallyCompactSpace_of_group` (:621), `mapAlong_continuous` (:655), `RestrictedProduct.unitsEquiv` (Units.lean:84), `map_right_mul_eq_modularCharacterFun_smul` (ModularCharacter.lean:93), `integral_rieszMeasure` (:345), `volume_fundamentalDomain_stdBasis` (:521), `volume_fundamentalDomain_latticeBasis` (Discriminant/Basic.lean:89, as the README says), `dedekindZeta_residue` (:56), `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (:77), `Real.multipliable_one_add_of_summable` (:51), `rexp_tsum_eq_tprod` (:83), `IsNilpotent.eq_zero`, `Subgroup.index_prod` (:638), `index_pi` (:643), `isClosed_of_isDiscrete` (:372), `exists_smul_mem_fd` (:425), `isPretransitiveGL2R` (:371), `coe_smul_of_det_pos` (:191), `denom_ne_zero_of_im` (:58), `IsModuleTopology.continuous_of_linearMap` (:340), `Algebra.discr_of_matrix_vecMul` (:106), `AddSubgroup.index_eq_natAbs_det`, `Algebra.TensorProduct.cancelBaseChange` (:435), `IsGroupLikeElem.map` (:52), `GroupLike.toUnits` (:37, inverse the antipode), `ActionCategory.stabilizerIsoEnd` (:102), `isMulLeftInvariant_eq_smul` (:922), `integral_exp_mul_Ioi` (:102), `Set.integer` (SInteger.lean:65, integral outside `S`), `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`, `Units.unitLattice_rank` (:384), `Ideal.quotientInfRingEquivPiQuotient` (:248), `IsArithmetic` (:102), `Gamma0` (:79), `IdeleClassGroup` (AdeleRing.lean:117), `IsNonarchimedeanLocalField` (:45). Tau Ceti: `HopfAlgebra.points` (PointsFunctor.lean:58), `mapPoints` (:102), `pointsFunctor` (:150), `CommHopfAlgCat.pointsFunctor` (:211), `CommHopfAlgCat.baseChangePointsMulEquiv` (CommHopfAlgCat/BaseChange.lean:182), `quotientPointsSubgroup` (:181), `AffineGroup.Product.pointsMulEquiv` (Product.lean:121), `pointsMulEquiv_mapValue` (:206), `centerDefiningIdeal` (:301), `centerPointsSubgroup_eq_center` (:423), `geometricCharacterGroup` (:67), `instGeometricCharacterGroupGaloisAction` (:87), `isMulTorsionFree_geometricCharacterGroup` (Torsion.lean:74, as cited), `geometricallyReducedCommHopfAlgProperty` (:58), `geometricallyConnectedCommHopfAlgProperty` (:61), `reductiveCommHopfAlgProperty` (Reductive/Basic.lean:70: smooth, geometrically connected, no normal smooth unipotent geometric subgroup), `SemisimpleCommHopfAlgCat` (Semisimple/Basic.lean:124), `simplyConnectedSemisimpleCommHopfAlgProperty` (:67), `Bialgebra.CotangentSpace` (:57), `Derivation.adjointAction` (:132), `adjointPointRepresentation` (:219), `adjointWeightSpace` (:100), `determinantGroupLike` (:59), `determinantCoordinateMap` (:83), `pointsMulEquiv_determinantPoints` (:177), `Cocharacter.parabolic`/`levi`/`unipotent` (Dynamic/Parabolic.lean:293/344/376), `leviDecompositionMulEquiv` (:194), `splitTorusCommHopfAlgProperty` (:74), `HopfIdeal.IsCentral` (:85), `derivedDefiningIdeal` (:72), `identityComponentHopfIdeal` (:220), `ConstantForm.definingHopfIdeal` (:259), `mem_definingPointsSubgroup_iff` (:445), `fppfHomogeneousQuotient` (:216), `isNonarchimedeanLocalField_adicCompletion` (:212), `discreteTopology_principalSubgroup` (:64), `isClosed_principalSubgroup` (:67), `normalizedAbsValue` (:80), `finprod_normalizedAbsValue_eq_one` (:214), `weakApproximation_denseRange` (:204), `dedekindZeta_eulerProduct_hasProd` (:498), `quotientEquivClassGroup` (:332), `ideleNorm : IdeleGroup →* ℝ≥0ˣ` (Norm/Basic.lean:291), `coe_ideleNorm` (:298), `ideleNorm_unitEmbedding` (:323), `IdeleClassGroup.isCompact_normOne` (:126), `ideleClassNorm_surjective` (:76), `unitsCongruenceSubgroup_finiteIndex` (:82), `ratFundamentalDomain` (:52), `FiniteAdeleRing.denseRange_algebraMap` (:284), `normalizedValuation` (:114), `normalizedAbsoluteValue` (:447), `cholesky` (:90), `cholesky_mul_transpose` (:104), `HeckeCoset.degree_eq_relIndex` (:271), `DoubleCoset.quotientMapOfLELeft` (:29) with `_apply_mk`/`_refl`/`_trans`/`_surjective` at lines 38–67 as cited, `cosetToOrbitRelMapFiber_surjective` (Fiber.lean:57), `finite_fiber_orbitRel_map_of_isFiniteRelIndex` (:81), `IsQuotientCoveringMap.isCoveringMap_of_comp`, `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` (:100), `log_unitFiltration_injective` (:285), `awayDecomposition` (:73), `restrictedProductCongr` (:53), `InfiniteAdeleRing.homeomorphMixedSpace`, `QuaternionAlgebra.normForm` (:78), `SpecialLinearGroup.map_intCast_zmod_surjective` (:437), `IsSemialgebraic`, the Brauer/monomial induction theorems (Induction/Brauer/Induction.lean:82, Elementary.lean:441, Monomial.lean:81, ClassFunction.lean:325), `discr_eq_of_integralBasis` (:61). Not at the pin: the three height declarations of R03; no `TopologicalSpace` instance on `WithConv (H →ₐ[F] R)` (so R10 is a note, not a clash).

**Cross-roadmap citations resolved.** ReductiveGroupsPartII at the base branch: `RG2.0.3`, `RG2.0a`, `RG2.1`, `RG2.3.7`, `RG2.4.4`, the slugs `iwasawa-parabolic-integral`, `kneser-tits-local`, `parabolic-adjoint-determinant`, `smooth-group-analytic-charts`, `equal-characteristic-smooth-group-analytic-charts`, `general-linear-points-homeomorphism`, `reductive-model`, `hyperspecial-vertices`, `lang-theorem`, and the names `LocalIntegration.modularCharacter_eq_adjointModulus` (its `Suggested.lean`), `Decomposition.modularCharacter_eq_one`, `GeometricRoots.characterValue`, `centralizerIdeal_points_iff`, `ZExtension.derivedIdeal_gl_n`/`_sl_n` (its README), `PointTopology.generalLinearPointsHomeomorph`, `locallyCompactSpace_of_finiteType`, `Lang.lang_surjective`, `WeilRestriction.functor_isCorepresentable` (its `Suggested.lean`). SchemeAndStackFoundations on main: §§1.15 and 2.3 exist; `Torsor.baseChange`, `Torsor.trivial_iff_section` (also in its `Suggested.lean`), `Torsor.hom_isIso`, `torsorClasses.mk_eq_base_iff`, `torsorClasses.surjective_mk`, `NonabelianH1`, `GroupSpace.ofGroupScheme`, `fppfTopology.over` are its README targets. DiophantineApproximationAndTranscendence §2.5 exists on main. Chebotarev (Completed) Layer 5 and 12.1; MassFormula Layer 2 on main; IntegralLattices' `TamagawaMeasures` placeholder on main (line 99, 119). FuchsianOrbifolds on main does not cite AA; its open revision does (R01). The stacked roadmaps SmoothRepresentationsOfLocalGroups (SR.1.1 cited five times) and IntegralHeckeAndGaloisDeterminants (not cited) are earlier in the merge order. Ownership against the open pull requests QuaternionicModularForms (#934) and the LFunctions head beyond the depcheck was not checked: the brief gives no checkout for them.

## Not verifiable

- Platonov–Rapinchuk–Rapinchuk 2023 (PRR): Cambridge landing page only; Thm 1.34, Lemma 3.63, Thm 3.64, Thm 3.71, Thm 4.12, Thm 5.22, Thm 5.24, Lemma 3.66, Thm 3.12, Lemma 5.7, §2.1.14 and the page numbers are cited by locator alone (uncertified).
- Platonov–Rapinchuk 1994 (PR94): no legal full text (mathnet landing page); Thms 6.4, 6.6, 7.8, 7.12, Prop 6.17, Thm 2.2, §4.4 uncertified. Rapinchuk line 565 confirms that Thm 2.3 there restates the strong approximation theorem with PR94 as a reference, which supports the 7.12 attribution but not its page.
- Borel–Harish-Chandra 1962 (BHC): JSTOR only; §§1.1, 1.6–1.9, 3.8, 5.3–5.4, Lemma 5.4, Thm 1.9 uncertified.
- BHV, Appendix B.1 Lemmas B.1.1–B.1.3: the author-manuscript host timed out three times; the Cambridge page is paywalled.
- Voight, Lemma 11.2.1 and Prop. 11.3.4: the Dartmouth copy returns 404 and Springer is treated as paywalled by the service; uncertified.
- Orr–Schnell 2023 (Thm 1, Rem. 2, §§A–E, pp. 1231–1237): MSP is in no licence class.
- Platonov 1969: only the Russian original was readable (mathnet); the English-translation pages 1144–1145 are not checked.
- Khayutin, Annals pagination (pp. 169, 172–173) and Schneider's book: not read; the arXiv edition and the proposition numbering were checked.

## Source issues

- **Error** in CG at §8.2, printed page 79: the source says the component group of `X_Q` is the maximal exponent-`p^n` quotient of the ray class group of conductor `Q`; it should be the extension of the narrow class group by a quotient of `∏_{v∈Q} k_v^×/k_v^{×p^n}` (a real quadratic field of narrow class number 3 with `p = 2`, `Q = ∅` separates them); affects a stated result (the README already states the corrected form).
- **Error** in BKT at Definition 2.5 and Proposition 2.7, printed pages 8–9: the source says Siegel sets for varying maximal compacts are interchangeable up to finitely many rational translates; it should fix one maximal compact `K` (the erratum's §1.6.1 example with `K_x`, `x ≠ i`); affects the proof; corrected in print at BKT erratum, §1.1, p. 1.
- none further in the readable sources at the sampled locators.
