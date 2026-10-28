# Review of AdelicAlgebraicGroups (pull request #792 at 748f282)

**Verdict:** needs changes

This head differs from the previously reviewed head (93998b1) by eleven README lines: the `GL₂` Hecke summary in the Layer 4 Examples (lines 4919–4923) and a Casselman bibliography entry (lines 5411–5413). None of the eleven findings of the previous review is repaired. The gate still fails (`prnum=8`, `residue=9`, `depcheck=5`, `outside-folder=9`; the targeted build passes with `sorry` as the only warning). The dependency check now reports three further upward edges that the previous round did not see (ClassFieldTheory, GlobalQuadraticForms, IntegralLattices), because the merge order moved; they are reported below with the caveat that the three roadmaps are on main.

**Status of the previous findings, one by one.**

- R01 (cycle with FuchsianOrbifolds): not repaired. README lines 124–128 still read "The Fuchsian orbifolds roadmap supplies the coarse quotient Riemann surface … (layers 0–1) … (layer 4) … (layer 5)"; line 512 lists "FuchsianOrbifolds, layers 0, 1, 4 and 5"; the gate prints `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`.
- R02 (upward LFunctions): not repaired. Lines 110, 260, 505, 2315 unchanged; `UPWARD: AdelicAlgebraicGroups (#34) -> LFunctions (#308)`.
- R03 (height declarations not at the pin): not repaired. Line 258 still says "use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2` … from TauCeti/NumberTheory/Height/Arakelov/Basic.lean".
- R04 (`[PR94]` trips the pull-request scanner): not repaired (gate `prnum (8)`, lines 3106–5330).
- R05 (HTML anchors): not repaired (gate `residue (9)`).
- R06 (edits outside the folder): not repaired (gate `outside-folder (9)`, nine files of ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants).
- R07 (backticked names not declared): not repaired. Lines 1015, 1018, 1022–1023, 2712–2717, 4045, 4969, 5027–5056 still name `infiniteDiagonal`, `finiteEmbed`, `IsReduced e C b`, `levelUnits F ⊤ = ⊤`, `principalLevel N`, `level0 N`, `level1 N`, `PrincipalLevelMembership N g`, `Level0Membership`, `Level1Membership`, `CongrMod N x y`; `grep -c` of each in `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` is 0.
- R08 (Orr pages and lettered subsections): not repaired. Lines 3521, 3566, 3601, 3688, 3692, 3704, 3717, 3729, 3742–3743 still cite "§4.B, Lemmas 4.2–4.5, pp. 17–19", "§4.D, Lemmas 4.10–4.11, pp. 22–23", "§4.F, Proposition 4.14, p. 24"; in the arXiv v2 text Lemma 4.2 is Orr line 666 on page 15 (page marker line 636), Theorem 4.1 is line 623 on page 15, and the subsections are numbered ("4.1. Reduction to a split torus", line 638).
- R09 (`Suggested.lean` form): not repaired. Line 299 `instance instBorelSpace … := ⟨rfl⟩` has no docstring; line 12 reads "headline targets".
- R10 (global instances restating supplier objects): not repaired. Lines 52–54, 81, 297, 299 are still unscoped `instance`s.
- R11 (fork URLs and commit hashes as supplier locators): not repaired. Lines 257, 260, 294–295 unchanged.

Findings R01–R12 below restate the unrepaired items with their witnesses so that this comment stands on its own; R03 and R13 are new.

## R01 (P1) — Supply cycle with FuchsianOrbifolds

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` lines 124–128 ("The Fuchsian orbifolds roadmap supplies the coarse quotient Riemann surface … and degree theory for finite holomorphic maps (layer 5)"), 176, 512, and the AA.5.2 targets that consume them.

Claim: FuchsianOrbifolds layers 0, 1, 4 and 5 supply AA.5.2.

Witness: the dependency check prints `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`. FuchsianOrbifolds is not in the merge order, so it is placed after its suppliers; the FuchsianOrbifolds README on main does not cite this roadmap, but its open revision (`TauCetiRoadmap/FuchsianOrbifolds/README.md` at the revision head, lines 133 and 965) names AdelicAlgebraicGroups as a supplier and cites AA.3.4 `class-number-finite` (`Reduction.finite_classes`). Each supplies the other.

Repair: drop FuchsianOrbifolds from this roadmap's suppliers (lines 124–128, 176, 512 and the `*Needs:*` lines of AA.5.2). Keep in AA.5.2 the topological statements (the homeomorphism of `exists_componentHomeomorph`, continuity and finite fibres of the level maps, component counts) and move the holomorphic clauses (coarse quotient Riemann surface, biholomorphism under `z ↦ q·z`, finite holomorphic maps, the "Riemann-surface structure and change of level" target) to Scope and ownership as left to the roadmap that owns the complex structure. The module docstring already records that comparison as not statable. Re-run the check: the `CYCLE` line must disappear.

## R02 (P2) — Upward supplier LFunctions, not movable

Location: `README.md` lines 110 ("LFunctions supplies finite-order Hecke analysis through ThetaSeries"), 260 (the "Finite-order Hecke analysis" contract row naming `PrimitiveRayClassCharacter`, `heckeLFunctionC_eq_primitive`, `eulerCorrection`, `heckeLFunction_ne_zero_of_one_le_re`), 505, 2024–2026, 2051, 2315.

Claim: AA.2.4 consumes LFunctions Layer 5 (continuation) and Layer 7 (nonvanishing).

Witness: `UPWARD: AdelicAlgebraicGroups (#34) -> LFunctions (#308) at README lines [110, 260, 505, 2315]`; with `--movable` the check reports that this roadmap is consumed by AbelianSchemesAndArithmeticModuliPartII (#112), so it cannot move below its suppliers.

Repair: repoint to owners earlier than this roadmap. The pinned Tau Ceti has `TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` and `…_of_isTrivialOnGood_sq` in `TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean` (nonvanishing on `Re s ≥ 1` for a unitary ideal weight with partial-sum cancellation); ArithmeticDirichletSeries (Completed) owns the continued `L`-function and Chebotarev (Completed) Layer 5 supplies the cancellation of ray-class characters, continuation through `Re s = 1`, nonvanishing at one and the ramified Euler correction. State what remains (the correction at a larger modulus, the one-dimensional Artin–Hecke comparison) as AA.2.4 targets and record the move; delete the LFunctions rows and links and the `oddPrimitiveModFour` name in the 2.4 Check (line 2051).

## R03 (P2) — Upward suppliers ClassFieldTheory, GlobalQuadraticForms and IntegralLattices

Location: `README.md` lines 109–110 ("ClassFieldTheory, layers 11–12, supplies quadratic idele characters, reciprocity and the global norm-index theorem"), 107–108 ("GlobalQuadraticForms, layer 5, supplies local and global quadratic isotropy"), 122–123 ("IntegralLattices, 2F–2G, supplies Minkowski reduction"), 171, 505–512, 2315, 3959–3960, 4823, 4927–4931.

Claim: these three roadmaps are suppliers of AA.3.2, AA.4.1, AA.4.6 and AA.2.4.

Witness: the dependency check prints `UPWARD: AdelicAlgebraicGroups (#34) -> ClassFieldTheory (#254) at README lines [109, 2315, 3959, 4927]`, `UPWARD: … -> GlobalQuadraticForms (#347) at README lines [3959, 4823, 4927]`, `UPWARD: … -> IntegralLattices (#249) at README lines [122]`, and `not movable: AdelicAlgebraicGroups consumes GlobalQuadraticForms (#347) and is consumed by AbelianSchemesAndArithmeticModuliPartII (#112)`. The cited sections exist on main: ClassFieldTheory README lines 1683 and 1724 (Layers 11 and 12), GlobalQuadraticForms README lines 78–127 (its 5.1–5.4), IntegralLattices README lines 801–827 (2F, 2G).

Assessment: the previous round's check (two problems) did not report these edges; the merge order has since placed the three roadmaps after this one. All three are on main, which the brief lists as consumable, so I believe these three lines are merge-order artefacts rather than README defects; the gate nevertheless fails on them and the roadmap is not movable. The board must settle the order (these are suppliers already merged), or the author must repoint.

Repair available to the author: IntegralLattices 2F–2G is consumed only at lines 122 and 171 for Minkowski reduction, and AA.3.2 already states the reduction it uses (`exists_reduced_GLZ`, the reduced-form bounds); drop the IntegralLattices citation. ClassFieldTheory reciprocity and GlobalQuadraticForms isotropy cannot be restated here without re-planning those roadmaps, so those two edges are for the board.

## R04 (P2) — Supplier drift: height declarations cited at the pin do not exist there

Location: `README.md` line 258 ("use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2`, with `[Finite ι]`, from TauCeti/NumberTheory/Height/Arakelov/Basic.lean"); consumed at lines 3363–3372 (AA.3.5).

Claim: the relative projective height and its comparison are pinned Tau Ceti declarations.

Witness: the pinned Tau Ceti has no `TauCeti/NumberTheory/Height` directory; `grep -rn arakelovMulHeight` over `.lake/packages/TauCeti/TauCeti` returns nothing; the citation leads of `citations.md` list the three names as found nowhere. `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` on main lists `arakelovMulHeight` and `height2` as its own §2.5 targets.

Repair: cite DiophantineApproximationAndTranscendence §2.5 for `height2`, `arakelovMulHeight`, `arakelovMulHeight_eq_height2` and `height2_baseExtension` as roadmap targets, without the `TauCeti.` prefix and without a library file; or declare a gap on that roadmap with the same slug in `plan.json` and the README.

## R05 (P3) — Citation key `[PR94]` trips the pull-request-number scanner

Location: `README.md` lines 3106, 3954, 3964, 3975, 3983, 4175, 4183, 5330. Witness: gate `prnum (8)`. Repair: rename the key (for example `[Platonov–Rapinchuk]`) and keep the 1994 entry under it.

## R06 (P3) — Process residue: HTML anchors

Location: `README.md` lines 586, 607, 845, 919, 1393, 4002, 4482, 4811, 5022 (`<a id="…"></a>`). Witness: gate `residue (9)`. Repair: delete the anchors; the targets already carry italic slugs.

## R07 (P3) — Edits outside the roadmap folder

Location: `git diff --stat origin/main...HEAD` lists nine files under `TauCetiRoadmap/ReductiveGroupsPartII/`, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/` and `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/` (22,029 lines). Witness: gate `outside-folder (9)`. Repair: rebase onto main once the base pull requests merge; the gate fails until the diff is confined to `TauCetiRoadmap/AdelicAlgebraicGroups/`.

## R08 (P3) — Backticked names of this roadmap that `Suggested.lean` does not declare

Location: `README.md` 1015 (`infiniteDiagonal`), 1018, 1022–1023 and 4045 (`finiteEmbed`), 2712–2717 (`RealSiegel.IsReduced e C b`), 4969 (`levelUnits F ⊤ = ⊤`, inside a Check), 5027–5056 (`principalLevel N`, `level0 N`, `level1 N`, `PrincipalLevelMembership N g`, `Level0Membership`, `Level1Membership`, `CongrMod N x y`).

Witness: none of these names occurs in `Suggested.lean`; `RealSiegel.IsReduced` is declared there (line 370) as `(C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ)`, with no basis argument.

Repair: write these in prose or as README-only notions without backticks; describe `IsReduced` as the standard-basis predicate the Lean states, with the basis-dependent version as a README target; a Check never names a Lean counterpart.

## R09 (P3) — Orr locators: page numbers shifted, lettered subsections absent

Location: `README.md` lines 3521, 3566, 3601, 3688, 3692, 3704, 3717, 3729, 3742–3743.

Witness: Orr line 623 (Theorem 4.1, page 15), 666 (Lemma 4.2, page 15), 686 (page 16); the page markers (line 636 = page 15, 674 = page 16, 713 = page 17, 752 = page 18, 791 = page 19, 848 = page 20, 886 = page 21, 923 = page 22) put Lemmas 4.2–4.5 on pages 15–16, not 17–19; the subsections are numbered ("4.1. Reduction to a split torus", line 638), not lettered.

Repair: cite the arXiv v2 pages and numbered subsections, or the journal version with its own pagination and lettering, and say which.

## R10 (P3) — Form of `Suggested.lean`

Location: `Suggested.lean` line 299 (`instance instBorelSpace … := ⟨rfl⟩`, no docstring), line 12 (module title "headline targets"). Repair: add the docstring; use the title form "<title>: target signatures".

## R11 (P3) — Local copies of supplier objects as global instances

Location: `Suggested.lean` lines 52–54 (`instance evaluationTopology …`), 81 (`adelicBorel`), 297–299 (`RestrictedHaar.instMeasurableSpace`, `instBorelSpace`).

Witness: the README (1.1 and Scope) assigns the evaluation topology to ReductiveGroupsPartII RG2.0.1, whose `Suggested.lean` declares the same topology as a scoped instance on `WithConv (A →ₐ[k] R)`; this file's instance is global on the same carrier (the two agree as topologies).

Repair: keep them as the statement-enabling definitions, say in the docstrings that they restate RG2.0.1 and AA.0.1, and make the instances `scoped`.

## R12 (P3) — Supplier citations by fork URL and commit hash

Location: `README.md` lines 257 (MassFormula via a fork URL and hash), 260 (LFunctions via a fork URL and hash), 294–295 (QuaternionicModularForms via a fork URL and hash). Repair: cite "MassFormula, Layer 2", "QuaternionicModularForms, §§0.1–0.3" by name and section, without URLs (and no LFunctions after R02).

## R13 (P3) — Locators and style from this round's sample

Location and witnesses:

- `README.md` line 2563 ("for compatible Haar measures ([Arthur], §4, p. 24)") cites page 24 for the general Iwasawa integration formula `∫_G f = ∫_K∫_M∫_N f(nmk) δ_P(m)⁻¹ dn dm dk`. Arthur page 24 (lines 1284–1301) has only `G(𝔸) = N_P(𝔸)M_P(𝔸)¹A_P(ℝ)⁰K` and the definition of `H_P`; the `GL₂` left Haar measure is page 21 (line 1107) and the left/right relation on `P(𝔸)` is page 25 (line 1350, with a sign slip, see Source issues). Cite page 21 as the special case the general formula is derived from, and say so, as the Conventions promise ("Derivations from a source's special case are identified as such").
- `README.md` lines 139–142 cite "[Sutherland], §23.3, p. 6" for "the summable-series-and-logarithm reading" of convergent products; Sutherland page 6 (lines 285–309) contains only the box definition of the adelic product measure, no convergence-factor or logarithm argument. Cite the Mathlib lemmas alone, or a text that contains the argument.
- Three targets carry two `**Checks.**` lists each (the convergent product in 0.3, lines 797–820; the split component in 2.1, lines 1612–1623; the Tamagawa number in 2.4, lines 2156–2173, whose second list is a loose paragraph). Merge each pair into one list under its target.

Repair: as stated per item.

## Verified sound

**Gate and build.** Re-ran the gate on this head: `set_option=0 … prnum=8 … residue=9 … depcheck=5 … outside-folder=9 … FAIL`; the gate did not reach the build line, so I elaborated `Suggested.lean` with `lake env lean` from the package: 20 `declaration uses sorry` warnings and nothing else (7.6 s). Dependency check with `--movable`: `not movable: AdelicAlgebraicGroups consumes GlobalQuadraticForms (#347) and is consumed by AbelianSchemesAndArithmeticModuliPartII (#112)`, the four `UPWARD` lines quoted in R02–R03, `CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds`, `depcheck: 163 roadmaps, 1163 edges, 5 problem(s)`. Imports: `import Mathlib` plus eight `TauCeti.*` modules whose object files exist at the pin; no `set_option`, `lemma`, `#eval`, sorried data or `example`.

**Signatures.** Elaborated a scratch copy with `#check @` for all 66 declarations and compared the printed types with the README: the sorried headlines carry every hypothesis their README statement names (`Algebra.FiniteType F H`, the reductive or geometrically connected property, `IsCompact`/`IsOpen` on levels, the faithful-representation and neatness hypotheses, `IsClosed` and the two height conditions on `K∞`, `Fact p.Prime`, `1 ≤ n`, `N(v) ≡ 1 mod p^n`). The seven binders that drop a section variable (`InfinitePoints`, `IsCentralCocharacter`, `IsNeatAut`, `GL2.diag`, `GL2.toReal` lose `NumberField F` or `CommRing H`; the two `RestrictedHaar` instances keep `Group` and `TopologicalSpace` through `Subgroup (G i)`) are definitions whose types do not need them. Nothing changed as a result.

**One-tactic probe.** On a scratch copy every `sorry` was replaced by `first | (simp; done) | (rfl; done) | (infer_instance; done) | (exact?; done) | sorry`. Nineteen `sorry` warnings remain, and the twentieth declaration (`hasStrongApproximation_of_simplyConnected`, line 277) hit the heartbeat limit inside the probe rather than closing. No declaration closes in one tactic; no padding by this measure. Each sorried statement is a README headline: restricted and convergent Haar products, quotient integration, the integral-model restricted product, arithmetic covolume, class numbers, finite volume, compactness, weak and strong approximation, `GL_n` reduction, neat levels and coverings, Hasse–Schilling–Maass, idele classes modulo squares, Fourier limits, the `GL₁` torus and the `GL₂` decomposition. Headlines not statable at the pins (Tamagawa measure and number, scalar-restriction transport, Siegel covering and Orr–Schnell containment, the torsor Hasse principle, `π₀(X_Q)`, the `GL₂` Riemann surface) are named in the module docstring with the missing carrier.

**Adversarial table** (instances tried, values on each side, result). Rows marked (Lean) are headline statements of `Suggested.lean`; the others are sampled README targets.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.3 convergent product, box mass (Lean `exists_unique_convergentHaarProduct`) | `C_i = B_i` off `T ⊇ S` | normalized box mass `∏_{i∈S} μ_i(C_i) · ∏_{T∖S} a_i⁻¹μ_i(C_i)`, times `C_S = ∏_{T∖S} a_i · ∏_{i∉T} a_i`, equals `∏_{i∈T} μ_i(C_i) · ∏_{i∉T} a_i`; `SL₂` tail `a_v = 1 − q_v⁻²`, `∑ q_v⁻² < ∞` | sound; matches the Lean's `(∏ i ∈ T, μ i (C i)) * ofReal (∏' i ∉ T, a_i)` |
| 0.3 functoriality `Φ_*(∏ʳμ) = ∏ʳ(φ_i)_*μ_i` | `ℝ`, `x ↦ 2x`, `[0,2]` | `(2·)_*λ([0,2]) = λ([0,1]) = 1`; `(2·)_*λ = λ/2` | Check holds |
| 0.3 factorizable integral `∏ᶠ ∫ f_i` | one `C₂`, constant `2`; two copies, `2` and `3` | `2·2 = 4`; `(2·2)(3·2) = 24`; probability normalization would give `2`, `6` | Checks hold |
| 0.3 unimodularity of restricted products | `x` with `x_i ∈ B_i` cofinitely, `B_i` compact | `Δ_{G_i}` is trivial on a compact subgroup, so `∏ᶠ Δ_{G_i}(x_i)` is finite | sound |
| 1.3 discreteness in `G(𝔸_f)` iff `G(F) ∩ U` finite | `ℚ^×`, `U = ℤ̂^×`; `SL₂(ℚ)`, `U = SL₂(ℤ̂)` | `ℚ^× ∩ ℤ̂^× = {±1}` finite, discrete; `SL₂(ℤ)` infinite, not discrete; both directions: finite ∩ U ⇒ `1` isolated; discrete ⇒ `G(F) ∩ U` closed in compact `U`, hence finite | sound |
| 1.3 squares in `𝔸_ℚ^×` | `(𝔸^×)²` | each local square set `(ℚ_p^×)²`, `ℝ_{>0}` closed, index `∏_p [ℚ_p^× : (ℚ_p^×)²] = ∞`; every basic neighbourhood contains `∏_{p∉S} ℤ_p^×` with nonsquare units, so not open | Checks hold |
| 1.4 restriction of scalars | `E = ℚ(i)`, `G_m` | `Res G_m(ℚ) = ℚ(i)^× ≠ ℚ^×`; `E ⊗ F_v ≅ ∏_{w|v} E_w` gives `Res(F_v) = ∏ G_E(E_w)` | sound |
| 1.4 `GL_n` comparison Check | `n = 1`, inverse transpose | inversion; differs from the identity exactly at `x` with `x² ≠ 1` | Check holds |
| 2.1 `a(φ)` for the squaring map | `T ↦ T²` on `F[T,T⁻¹]` | `(a(φ)a)(T) = a(T²) = 2a(T)` | Check holds |
| 2.1 `H_G` on a quadratic field | scalar `t > 0` | `‖t‖ = t²` (two real places, or squared complex modulus), `H_G(t) = 2 log t`, `λ = 2 dt/t` | Check holds |
| 2.1 split component is not pinned by its clauses | `G_m × T¹`, `T¹` norm-one torus of a real quadratic field | graph of `φ : ℝ_{>0} → T¹(ℝ)⁰` is central, archimedean, meets `G(𝔸)¹` trivially, maps isomorphically onto `a_G`, yet `≠ ℝ_{>0} × 1`; the defining clause ("one positive scalar value of every character at all archimedean places") excludes it | sound |
| 2.1 `A_G` rank | `Res_{F/ℚ} S` for `S = G_m^k` | `Gal(ℚ̄/ℚ)`-invariants of `Ind X*(S)` = `X*_F(S)`, rank `k` | sound |
| 2.3 norm-one quotient action | `u_∞ = −1`, `u_p = 1` | norm `1`; a rational element with all finite components `1` is `1`, whose real component is `1`; so `[1]·u ≠ [1]` | Check holds |
| 2.4 right pullback of a gauge form | upper Borel of `GL₂`, `diag(a,d)`; `diag(2,1)` | `(R_g^*ω)_e(v) = ω_e(Ad(g⁻¹)v)`, factor `det Ad(g)⁻¹ = (a/d)⁻¹`; `diag(2,1)`: adjoint `2`, pullback `1/2` | Checks hold |
| 2.4 translation of `\|ω\|` | `(R_g)_*\|ω\|(E) = \|ω\|(Eg⁻¹) = ∫_E \|R_{g⁻¹}^*ω\|` | factor `\|det Ad(g⁻¹)⁻¹\| = \|det Ad(g)\|` | README formula `map (·*g) \|ω\| = \|det Ad(g)\| • \|ω\|` correct, and equals Mathlib's `Δ(g)` convention (ax+b group below) |
| 2.4 Weil volume and corrected volume | `GL₂`, `q = 2`; `SL₂`, `q = 2` | `6/16 = 3/8`; `(1−1/2)⁻¹·3/8 = 3/4 = 1 − 1/4 = ∏_{i=2}^{2}(1−q⁻ⁱ)`; `SL₂`: `6/8 = 3/4` | Checks hold |
| 2.4 finite reductive orders | split rank one, `q = 2`; nonsplit rank one; split `SL₂/𝔽₂` | `\|2 − 1\| = 1`; `\|−2 − 1\| = 3` (DM prints `−3`, see Source issues); `2·1·(1+2) = 6` | Checks hold |
| 2.4 `1 + O(q⁻²)` cancellation | `F* = qθ` | `#T/q^r = \|det(θ − q⁻¹)\| = 1 − q⁻¹ tr θ + O(q⁻²)`; Bruhat sum `q^N(1 + c q⁻¹ + …)` with `c` = number of `θ`-fixed simple roots = `tr(θ \| ℚΔ)`; difference `−tr(θ \| X*(H)⊗ℚ)`, cancelled by `L_v(X*,1)⁻¹ = 1 − q⁻¹ tr θ + …` | derivation sound |
| 2.4 convergence factors | `ℚ(i)/ℚ`, `χ₄`, modulus `4 → 12`; residue cardinality `2`, rank `1`, `2` | correction `1 − χ₄(3)3⁻ˢ = 1 + 3⁻ˢ`; `(1 − 1/2)⁻¹ = 2`, `= 4`; `ζ`, `ζ⁻¹` give distinct factors at `q = 2`, `s = 1` | Checks hold |
| 2.5 scalar Jacobians, global product | `ℚ(i)/ℚ`, `β = (1,i)`; `ℚ(√2)/ℚ`, `β = (1,√2)` | finite `j = 1`; archimedean `j = 2⁻¹·1 = 1/2` versus `\|d_E\|^{−1/2} = 4^{−1/2}`; `j = 1/(2√2)` versus `8^{−1/2}` | formula `∏_v j_{β,v} = \|d_F\|^{[E:F]/2}\|d_E\|^{−1/2}` holds on both |
| 2.5 restricted gauge form | `E = F`, `G_a`, `ω = dx`, `β = (b)` | `ω_β(b∂_x) = 1`, so `ω_β = b⁻¹dx`; `j = \|b\|_v⁻¹`; `\|ω_β\|_v = j·\|ω\|_v` | Check holds |
| 2.5 trivial group, `ω_E = 1 + i` | `ℚ(i)/ℚ`, `d = 0` | `N(1+i) = 2`; `\|1+i\|_ℂ = 2`, `\|1+i\|_{(1+i)} = 1/2`; real `2`, 2-adic `1/2` | Check holds |
| 2.5 inductivity at a ramified place | `ℚ(i)/ℚ` at `2`, `Ind 1` | inertia swaps the basis, invariants the diagonal line, Frobenius trivial, factor `(1−2⁻ˢ)⁻¹`; `ζ_{ℚ(i)}` has one prime of norm `2` | Check holds |
| 3.1 parabolic Haar Jacobian and Mathlib's `Δ` | ax+b group `(a,x)`, `δ(a) = a` | `μ_ℓ = da dx/a²`, `μ_r = da dx/a`, `μ_ℓ = δ⁻¹μ_r`; `map(·*g₀)μ_ℓ = a₀ μ_ℓ`, so `Δ_Mathlib = δ`; `GL₂` Borel: `dℓ = \|a\|⁻¹ du d*a d*b`, `d_r = \|b\|⁻¹ du d*a d*b`, ratio `\|b/a\| = δ⁻¹` | README's "`Δ_P(nm) = δ_P(m)`, left Haar `δ⁻¹ dn dm`, right Haar `dn dm`" correct |
| 3.1 Iwasawa integration formula | `G = NAK` versus Helgason's `KAN` with `e^{2ρ log a}` | inverting `kan` gives `nak` with `e^{−2ρ log a}`; in the `m n k` ordering the factor is `1` | README's `δ_P(m)⁻¹ dn dm dk` in the `n m k` ordering correct |
| 3.1 `a_P` splitting Check | `GL₂` Borel | projection `(a,d) ↦ a + d`, lift `z ↦ (z/2, z/2)` | Check holds |
| 3.2 fixed-compact dependence | `k = [[0,−1],[1,0]]`, `u = n(1)` | `Im(k·i) = 1`, `Im(k(1+i)) = 1/2` | Check holds |
| 3.2 `IsReduced` (Lean) | `n = 0`; `I_n`, `C = 2`; `diag(4,1)` versus `diag(1,4)` | rank zero needs `1 < C`; `\|δ_ij\| < 2`, `1 < 2`, `1 < 2`; `4 < 2·1` fails, `1 < 8` holds | sound; (1)–(3) are BKT line 810–816 |
| 4.1 weak approximation (Lean `HasWeakApproximation`) | `μ₂/ℚ`, `S = {∞, 2}`; `S = ∅` | image `{(1,1),(−1,−1)}` not dense in `{±1}²`; empty product is a point | Checks hold; `μ₂` is not an object of `SemisimpleCommHopfAlgCat`, so the theorem does not apply to it |
| 4.1 torsors | `G_m` on `A¹`; `ℚ[x]/(x²−2)` | two geometric orbits, not a torsor; no rational point, nontrivial, trivial over `ℝ` | Checks hold |
| 4.3 neat elements (Lean `IsNeatAut`) | `diag(2,1/2)`; `(0 −1; 1 −1)`; `2·(0 −1; 1 1)`; `√2 ∈ G_m(ℚ(√2))` | `⟨2⟩` torsion-free; order `3`; `det = 4`, eigenvalues `2e^{±iπ/3}`, ratio `ζ₃`; `√2·(−√2)/2 = −1` after restriction of scalars | Checks hold |
| 4.3 `p`-adic roots of unity | `p = 2`, `−1`; cube root at `3`; cube root at `2` | `\|−2\|₂ = 1/2 = 2^{−1/(2−1)}`; `3^{−1/2}`; `1` | Checks hold |
| 4.3 strict ball | `p = 3`, `4`; `p = 2`, `5`; `p = 2`, `−1` | `1/3 < 3^{−1/2}`; `1/4 < 1/2`; `1/2` on the boundary, order two | Checks hold |
| 4.3 one-prime criterion | `K(2)`; `K(3)` | `−1 = 1 + 2(−1)`, torsion; `e = 1` at `p = 3`: `3⁻¹ < 3^{−1/2}` | Checks hold |
| 4.3 `K(3)` rational points | `x = 1` | `det ∈ {±1}`, `det ≡ 1 (3)` forces `det = 1`, giving `Γ(3)` | Check holds |
| 4.3 stable lattice | `[[0,p],[p⁻¹,0]]` | `(x,y) ↦ (py, x/p)` preserves `pℤ_p × ℤ_p`, sends `(1,0)` to `(0,1/p) ∉ ℤ_p²` | Check holds |
| 4.4 double-coset maps in `S₃` | `g = (01)`, `k = (12)`; `a = (12)`; `a = (01)(12)` | `(gk)(0) = 1`, `(kg)(0) = 2`; `(ga)(0) = 1`, `(ag)(0) = 2`; `a = (0 1 2)`, `(ga)(0) = 0`, `(ga⁻¹)(0) = 2` | Checks hold |
| 4.4 index with finite support | `S₀ = 2ℤ`, `S₁ = 3ℤ` | index `6`; `Nat.card ℤ = 0` | Checks hold |
| 4.4 coverings (Lean `isCoveringMap_levelMap`) | `GL₁/ℚ`, `U(3) ⊃ U(9)`, `K∞ = ℝ_{>0}`; `SL₂`, `K∞ = SO(2)` | fibres `3`, `#X = 2, 6`; `1 + 3ℤ̂` contains `z₂ = −1/3`, not a subgroup; `648/24 = 27 = [U(3):U(9)]` | Checks hold |
| 4.4 non-covering over `ℚ(√2)` | `η = (1+√2)⁴ = 17 + 12√2` | `η ≡ 1 (4)`, `η ≡ 1 + 4√2 (8)`, `η² = 577 + 408√2 ≡ 1 (8)`; units `≡ 1 (4)` are `⟨η⟩`; `H_G(K∞) ≠ ℝ`, so hypothesis `hKH` fails | Check holds; the Lean hypotheses exclude it |
| 4.4 groupoid stabilizers | `SL₂`, `K∞ = SO(2)`, `U = SL₂(ℤ̂)`; `GL₂`, `K∞ = ℝ_{>0}O(2)`, `ℝ_{>0}SO(2)` | `SL₂(ℤ) ∩ SO(2)` order `4`; `O₂(ℤ)` order `8`; `4` and `6` over `i`, `ρ`; `8`, `12` with `O(2)` | Checks hold |
| 4.7 Fourier limits (Lean) | `C` finite; `∏_n {±1}`; repeated character | no injection `ℕ → Ĉ`, vacuous; `∫ψ dm_n = δ_{ψ∈{1,χ_n}} → δ_{ψ=1}`; repeated `χ` keeps coefficient `1` | sound; `hχ` needed |
| 4.6 idele classes mod squares (Lean) | positive scalar `2`; `−1` at `3` | square of `√2` at infinity; `−1 ∉ ℚ₃^{×2}` survives; `C_F² = ℝ_{>0} × (C_F¹)²` closed | sound |
| 5.1 `levelQ` and the torus (Lean) | `Q = ∅`; `F = ℚ`, `Q = {3}`, `p = 2`, `n = 1`; `v ∈ Q`, `N(v) ≡ 1 (p^n)` | no `v ∈ Q` clause, independent of `p, n`; `4 = 2²` in, `2` nonsquare mod `3` out; `𝒪_v^× = k_v^× × (1+𝔪_v)` with `1+𝔪_v` `p`-divisible, so `(𝒪_v^×)^{p^n}` is the unique index-`p^n` subgroup; identity component `W/Λ_Q`, `W = ℝ^{r₁+r₂}/ℝ(1,…,1)`, `Λ_Q` of finite index in `𝒪_F^×`, rank `r₁+r₂−1 = Units.rank F` | sound; `hQ` is not needed for the torus statement (P3 note only) |
| 5.1 CG correction | real quadratic `F`, narrow class number `3`, `p = 2`, `Q = ∅` | `π₀ = Cl⁺ ≅ ℤ/3`; maximal exponent-2 quotient trivial | README's correction right |
| 5.3 Hurwitz check | `U₁(9)` at `3` | primitive rows `81 − 9 = 72`; `ℚ^× ∩ U₁(9) = 1`, central index `2`; `nrd(γ−1) = 2 − trd γ ∈ {0,1,2,3,4}`, `≡ 0 (9)` only for `γ = 1`; `72/24 = 3 = (72/2)(1/12)` | Check holds |
| 4.5/Examples line 4919–4923 (changed text) | `GL₂/ℚ`, `U = GL₂(ℤ̂)`, `g = diag(p,1)` at `p`; Iwahori `K₀(p)` | `Ug⁻¹U = p⁻¹·U diag(1,p) U = p⁻¹·U diag(p,1) U` since `w ∈ U`; the central idele `p⁻¹` at `p` equals, modulo `ℚ^×` and `U`, the scalar `p` at `∞`, absorbed iff `K∞ ⊇ ℝ_{>0}`; `w ∉ K₀(p)`, and `diag(p,1)`, `diag(1,p)` are distinct in the extended affine Weyl group, so distinct Iwahori double cosets | new text correct |
| Lean `hasStrongApproximation_of_simplyConnected` hypothesis | `SL₂/ℚ`, `Sf = ∅`; definite `SL₁(D)`; `SL₂ × SL₁(D)` | `SL₂(ℝ)` noncompact; `G(ℝ)` compact, hypothesis fails; quotient `SL₁(D)` compact, hypothesis fails; every `F`-simple factor is a nontrivial quotient, and an isogeny is proper on local points, so the hypothesis is equivalent to the simple-factor condition | sound |
| Lean `exists_compact_normOne_iff` | `G_m`; `GL₂`; `SL₁(D)`, `D` division | compact, cocharacters central; `diag(2,1)·[[1,1],[0,1]] = [[2,2],[0,1]] ≠ [[2,1],[0,1]]`, not compact; compact, only the trivial cocharacter; "every rational cocharacter central" ⇔ `G^der` anisotropic (a non-central split torus maps to a nontrivial split torus of `G^ad`) | sound |
| Lean `finite_volume_iff`, `arithmetic_finite_volume_iff` | `G_m`; `SL₂`; upper Borel | `Δ_{G(𝔸)}` trivial on `G(F)` by the product formula, so `μ(D)` is independent of `D`; `∞`, finite, `∞` versus `X* = ℤ, 0, ℤ²` | sound |

**Sources opened at the sampled locators** (source id and line; page markers checked). Conrad line 53 (Prop. 2.1, page 2), 115 (Ex. 2.3, page 3), 119 (Ex. 2.4, page 3), 281 (Thm 3.6, page 6), 452–470 (Ex. 4.2, pages 9–10). Borel (printed page = PDF page + 3) line 88–120 (§1.2, printed 6–7; discreteness at line 116, printed 7), 121 (§1.3, printed 7), 129 (§1.4, printed 7–8), 155 (§1.5 Proposition, printed 8), 184 (§1.8, printed 9), 263 onward (§1.13, printed 11), 608 (Thm 5.1, printed 19), 655–678 (Lemma 5.5, printed 20–21; the restricted-product Haar measure at 674–678, printed 21), 696–706 (§5.7, printed 21), 716 (Thm 5.8, printed 22), 734 (Lemma 5.9, printed 22). Arthur line 705–731 (`GL(1)`, page 15), 742–765 (`A_G`, `X(G)_ℚ`, `a_G`, `H_G`, `G(𝔸)¹`, pages 15–16), 1106–1108 (`GL₂` left Haar measure, page 21), 1156–1165 (standard parabolics, page 22), 1271–1283 (`K`, `G(𝔸) = P₀(𝔸)K`, page 23), 1286–1299 (`H_P`, page 24), 1307–1310 ((5.1), page 24), 1350 (page 25), 1588–1590 (page 30). Rosengarten line 49–63 (§1.1, page 2), 73–91 (page 3), 963–1007 ((3.4), page 25), 1017 (Lemma 3.5, page 26). Gordon line 117 ((1), page 3), 1626 ((48), page 32). Marzec–Neururer line 2562 (Prop. 5.10, pages 61–62), 2583 (Def. 5.11, page 62), 2599 (Rem. 5.12), 2625 (Thm 5.14, pages 62–64), 2808 (Thm 5.20, page 67), 2813 (Cor. 5.21, page 67). Dudas–Michel line 1239–1246 (Prop. 7.12(iii), page 27), 1278–1279 (Prop. 7.14, page 28). Sutherland line 285–309 (page 6). BKT line 331–366 (§2.2, (2.2), Def. 2.3, Lemma 2.4, page 8), 367 (Def. 2.5, pages 8–9), 378–392 (Prop. 2.7, page 9), 426 ((2.4), page 9), 810–816 (Def. 4.11, pages 17–18), 817–822 (`T_{e,C}`, page 18). BKT erratum line 11–34 (§1.1, page 1), 50–52 (Rem. 1.1(1), page 2), 133–141 (§1.6.1, page 4). Milne line 1483–1486 (Thm 3.3, page 33), 1500–1513 (Ex. 3.4, page 34), 1514–1525 (neatness, Prop. 3.5, page 34), 2475 (Lemma 5.12), 2486–2508 (Lemma 5.13, page 57), 2512–2513 (footnote 40, page 57), 2516–2525 (coverings and `T(g)`, page 58). Khayutin line 1001–1008 (Prop. 3.6, page 24), 1011 (Rem. 3.7, page 25), 1013–1045 (proof, page 25). CG line 3565 (unit rank, page 78), 3567–3576 (`Y`, `Y_Q`, `X_Q`, page 78), 3579–3590 (component group, circles, `H⁰`, page 79), 3591–3593 (Hecke and diamond operators, page 79). HW line 261 (weak approximation, page 6), 872 (Thm 6.1, page 21), 911–916 (Lemma 6.3 and `(⋆)`, page 22). Casselman line 579 (§1.5, modulus character, page 16). Rapinchuk line 96 (Lemma 1.2, page 3). All agree with the README except the items of R09 and R13.

**Library declarations opened at the pins.** Mathlib: `DoubleCoset.setoid` and `DoubleCoset.Quotient` (`GroupTheory/DoubleCoset.lean` lines 75, 79), `IsCoveringMap` (`Topology/Covering/Basic.lean` line 287), `UpperHalfPlane.glAction` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` line 181) and `isPretransitiveGL2R` (line 371), `NumberField.Units.rank` (`NumberTheory/NumberField/Units/DirichletTheorem.lean` line 358: `card (InfinitePlace K) − 1`), `Set.integer` (`RingTheory/DedekindDomain/SInteger.lean` line 65). Tau Ceti: `TauCeti.GlobalNumberFields.ideleNorm : IdeleGroup →* ℝ≥0ˣ` (`NumberTheory/NumberField/Global/Ideles/Norm/Basic.lean` line 291), `reductiveCommHopfAlgProperty` (`Algebra/AlgebraicGroup/Reductive/Basic.lean` line 70), `geometricallyConnectedCommHopfAlgProperty` (`Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean` line 61), `SemisimpleCommHopfAlgCat` (`Algebra/AlgebraicGroup/Semisimple/Basic.lean` line 124), `simplyConnectedSemisimpleCommHopfAlgProperty` (`Algebra/AlgebraicGroup/SimplyConnected/Basic.lean` line 67). Not at the pin: the three height declarations of R04 (`grep -rn arakelovMulHeight` empty, no `TauCeti/NumberTheory/Height` directory).

**Cross-roadmap citations resolved.** ClassFieldTheory Layers 11 and 12 on main (README lines 1683, 1724); GlobalQuadraticForms 5.1–5.4 on main (lines 78–127); IntegralLattices 2F–2G on main (lines 801–827); MassFormula, DiophantineApproximationAndTranscendence, SchemeAndStackFoundations, GlobalNumberFields, ReductiveGroups, FuchsianOrbifolds, AlgebraicTopology, LocalFieldsRamification, RepresentationTheory on main (directory listing); Chebotarev, ArithmeticDirichletSeries, NumberFieldArithmetic, RestrictedProducts, ThetaSeries under Completed. LFunctions is not on main (open pull request). FuchsianOrbifolds on main does not cite this roadmap; its open revision does (R01). ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups and IntegralHeckeAndGaloisDeterminants are the stacked base of this pull request and earlier in the merge order.

**Ownership by object** (`roadmaps grep -i --readme-only` over main and the 388 open heads). "Tamagawa measure": GeometryOfNumbersAndQuadraticArithmetic cites this roadmap as the supplier of the generic measure; OrthogonalSpinGroups lists Tamagawa measures and reduction theory outside its boundary and cites AA.1 and AA.4.1–4.2; OrthogonalTamagawaAndLatticeMass and FuchsianOrbifolds consume. "neat level", "HasStrongApproximation", "restricted product of Haar", "finiteness of class numbers": no match outside this roadmap. "Siegel set": only this roadmap. "Hasse–Schilling": OrthogonalSpinGroups (merge order #301, after this roadmap, which it cites) proves the `ℚ`-quaternion case as an orthogonal adapter "without constructing a second generic reduced-norm supplier"; this roadmap's `nrd_image` is the number-field statement and is the owner. Ownership against QuaternionicModularForms (#934) and the LFunctions head was not checked beyond the dependency check: the brief gives no checkout for them.

## Not verifiable

- Platonov–Rapinchuk–Rapinchuk 2023: Theorems 1.34, 3.60, 3.64, 3.71, 4.12, 5.22, 5.24, Lemma 3.63, Example 5.23, §2.1.14, §3.1 and the page numbers (43–44, 125, 128–130, 186–196, 206–208, 314–321) are cited by locator alone (paywalled; previous round found only the Cambridge landing page).
- Platonov–Rapinchuk 1994: Theorems 2.2, 6.4, 6.6, 7.8, 7.12, Proposition 6.17, §4.4 and §7.3: no legal full text.
- Borel–Harish-Chandra 1962 (§§1.6–1.9, pp. 489–492): JSTOR only.
- Voight, Lemma 11.2.1 and Proposition 11.3.4: Springer, treated as paywalled; the Hurwitz facts used (every right ideal principal, unit group of order 24) were checked independently in the table.
- Orr–Schnell 2023 (MSP) and Platonov 1969–1970 (English pagination): not read this round.
- Borel–Tits §5.3, §5.8, §5.9, §5.12, §5.14 (cited in 3.1 by numdam URL): not fetched this round.
- Khayutin, Annals pagination (pp. 172–173), Schneider's book, BHV Appendix B: not read; the arXiv edition of Khayutin was checked.

## Source issues

- **Misprint** in Dudas–Michel at Proposition 7.14, printed page 28: the source says the order of the finite torus of type `w` equals `det(wF − 1 | X(T))`; it should be the absolute value of that determinant (a nonsplit rank-one torus over `𝔽_q` gives `−(q+1)`); affects nothing (the README takes the absolute value).
- **Misprint** in Arthur at §5, printed page 25 (the sentence relating left and right Haar measures on `P(𝔸)`): the source says left Haar measure equals `e^{2ρ_P(H_P(p))}` times right Haar measure; it should be `e^{−2ρ_P(H_P(p))}` times it, as the source's own `GL₂` formula on page 21 (`|a|⁻¹ da* db* du`) shows; affects nothing (the README cites page 21 and has the right sign).
- **Error** in CG at §8.2, printed page 79: the source says the component group of `X_Q` is the maximal exponent-`p^n` quotient of the ray class group of conductor `Q`; it should be the extension of the narrow class group by a quotient of `∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n}` (a real quadratic field of narrow class number 3 with `p = 2`, `Q = ∅` separates them); affects a stated result (the README states the corrected form).
- **Error** in BKT at Definition 2.5 and Proposition 2.7, printed pages 8–9: the source says Siegel sets of `G/M` may be formed with varying maximal compacts; it should fix one maximal compact `K` throughout (the erratum's §1.6.1 example with `K_x`, `x ≠ i`); affects the proof; corrected in print at the BKT erratum, §1.1, p. 1.
