# Review of IntegralHeckeAndGaloisDeterminants (pull request #792 at a107311)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/` (README.md, 5450 lines; Suggested.lean, 1481 lines). The push gate fails at this head (`sorry-data=3`, `imports=1`, `sorry-examples=75`, `blob=4`, `depcheck=3`); every failure is a finding below. I re-elaborated `Suggested.lean` with `lake env lean` from the worktree: exit 0, 112 warnings, all `declaration uses sorry`. The mathematics of the stated headlines checked out (table under *Verified sound*); the blocking defects are in the acceptance test's form, not in the theorems.

## R01 (P1) — sorry'd data in three definitions and one example

Location: `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/Suggested.lean` lines 62–68 (`def ker … add_mem' := sorry, zero_mem' := sorry, smul_mem' := sorry`), 138–141 (`def traceLinear … map_add' := sorry, map_smul' := sorry`), 145–154 (`def ofMatrix … isCompat' := sorry … isHomogeneous := sorry, isMultiplicative := sorry`), 268 (an `example` builds a `MonoidHom` with `map_one' := sorry, map_mul' := sorry`).

Claim: these are definitions (data) whose bodies are admitted. The principle "no sorry'd data, and nothing that mentions one" is binding; `ofMatrix` is mentioned by `exists_semisimple_ofMatrix_eq`, `exists_ofMatrix_eq_of_henselian`, `exists_semisimple_specialization` (lines 561, 564, 579, 580, 898, 902) and by `charpoly_ofMatrix`, so the three reconstruction headlines currently rest on admitted data.

Witness: gate line `sorry-data (3)` naming lines 62, 138, 145; the `#check @Determinant.ofMatrix` I elaborated gives a term of type `Determinant A R d` whose three proof fields are `sorry`.

Repair, tested on the instances above:
- `ker`: give the three closure proofs. They are one-liners from the carrier: `b ⊗ₜ (x + y) + m = b ⊗ₜ x + (b ⊗ₜ y + m)` (`TensorProduct.tmul_add`, `add_assoc`) and `b ⊗ₜ (a • x) = (a • b) ⊗ₜ x` (`TensorProduct.tmul_smul`, `smul_tmul'`).
- `ofMatrix`: either prove the three fields (`isCompat'` is naturality of `Matrix.det` under `RingHom.mapMatrix` through `matrixEquivTensor`, i.e. `RingHom.map_det`; `isHomogeneous` is `Matrix.det_smul`; `isMultiplicative` is `Matrix.det_mul` and `Matrix.det_one`), or delete the definition and restate the three headlines through characteristic polynomials: replace `Determinant.ofMatrix ρ = D` by `∀ x, D.charpoly x = (ρ x).charpoly`, and `D.IsCoefficientChange φ (Determinant.ofMatrix ρbar)` by `∀ g, (D.charpoly (of g)).map φ = (ρbar (of g)).charpoly`. By `Determinant.eq_of_charpoly_eq` (stated in the same file) the two formulations agree on group algebras, which is where all three headlines live.
- `traceLinear`: delete the `def`. Linearity of `Λ₁` is a theorem (Chenevier §1.10), not a definition. State `isPseudocharacter_trace` as `∃ T : R →ₗ[A] A, ⇑T = D.trace ∧ IsPseudocharacter d T`, and the two bijection theorems with `T.toFun = D.trace` in place of `D.traceLinear = T`.
- Line 268: replace the `sorry`'d `MonoidHom` by `(Units.coeHom ℤ).toMonoidHom`-style data with real proofs, or delete the example (R04 deletes it anyway).

## R02 (P2) — the acceptance test imports another roadmap's module

Location: `Suggested.lean` line 3, `import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested`; used at lines 487 and 489–510 (`gsp4SpinPolynomial` is `Polynomial.reflect 4 (SmoothRepresentationsOfLocalGroups.SpinPolynomial q T₀ T₂ T₁)`).

Claim: imports must be `import Mathlib` plus individual `TauCeti.*` modules; "never another roadmap's module, nothing from a roadmap that is still a pull request". The gate refuses the import (`imports (1)`), so the file cannot pass as written, and its correctness now depends on a sibling pull request's file.

Witness: gate line `imports (1)`: found `import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested` (line 3).

Repair, tested on the instance: delete line 3 and define `gsp4SpinPolynomial` with its explicit body `X ^ 4 - C T₁ * X ^ 3 + C (q * T₂ + (q ^ 3 + q) * T₀) * X ^ 2 - C (q ^ 3 * T₀ * T₁) * X + C (q ^ 6 * T₀ ^ 2)`; this is exactly the value `SpinPolynomial.reciprocal` proves for the supplier's polynomial after the index swap (SmoothRepresentationsOfLocalGroups `Suggested.lean` lines 849–861: `reflect 4 (SpinPolynomial q T0 T1 T2) = X^4 − C T2 X³ + C(q T1 + (q³+q) T0) X² − C(q³ T2 T0) X + C(q⁶ T0²)`). The three `gsp4SpinPolynomial` examples then close by `norm_num [gsp4SpinPolynomial]; ring` (I recomputed them: `(2,1,3,5) ↦ X⁴−3X³+20X²−24X+64`, `(1,1,4,4) ↦ (X−1)⁴`, `(0,1,3,5) ↦ X⁴−3X³`). Keep the supplier cited in the docstring and README (§3a.2 already does).

## R03 (P2) — the module docstring does not name the headlines that are not statable, and one statable headline is absent

Location: `Suggested.lean` lines 5–27 (module docstring: "records the definitions and the headline theorems that can already be stated … It is not an exhaustive list of the targets of any layer"); README §0.6 "Azumaya reduced-norm determinant" (lines 1246–1266).

Claim: the required form is a docstring "<title>: target signatures" that says the roadmap is README.md, that this file states the headline theorems against the pinned APIs, and which headline theorems are not statable and what each lacks. None of the roadmap's unstatable headlines is named: Vaccarino's theorem and the determinant coordinate ring `Z_A(R,d)` (no `Γ^d_A(M)` carrier), Roby representability, the general invariant-word colimit and `B_H^Γ`, faithful quotients over arbitrary fields (Chenevier 2.16, no `δ_C` law), the henselian GMA structure and reducibility ideals (no GMA carrier), the lower-Borel restriction isomorphism and good-filtration acyclicity (no rational cohomology), Buchsbaum–Rim exactness, and DKSW Theorems 4.22–4.23. Conversely the Azumaya headline (every degree-`d` determinant on an Azumaya algebra of rank `d²` is the reduced norm; Chenevier Example 1.7(ii), Grothendieck Thm 5.1) is statable at the pins and absent.

Witness: `IsAzumaya` is `Mathlib/Algebra/BrauerGroup/Defs.lean` and `Mathlib/Algebra/Azumaya/Basic.lean` (namespace `IsAzumaya` at line 36); `Module.rankAtStalk` is in `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean`; `Determinant A R d` is line 112 of the file. So `theorem Determinant.subsingleton_of_isAzumaya [IsAzumaya A R] (hd : 0 < d) (hr : Module.rankAtStalk (R := A) R = fun _ ↦ d * d) : ∀ D E : Determinant A R d, D = E` together with `Nonempty (Determinant A R d)` elaborates with the file's own carrier.

Repair: rewrite the docstring in the required form, listing the unstatable headlines above with the missing carrier for each; add the Azumaya uniqueness-and-existence statement (both halves, the existence being the reduced norm) with `sorry`.

## R04 (P3) — admitted examples, a proved projection and elementary lemmas are padding

Location: `Suggested.lean`: 75 admitted `example`s (gate `sorry-examples (75)`, first at line 71); `IsNonEisenstein.isGaloisType` (line 798, proved by destructuring the existential) with the definitions `Spherical.IsGaloisType`/`IsNonEisenstein` (lines 740–764) that serve no headline; `Nilpotence.sup`, `Nilpotence.comparison`, `Nilpotence.inverse_limit` (lines 907–941), which the README (§5.2) itself calls "elementary ideal-power and module-filtration consequences".

Claim: an admitted example tests nothing; examples mirroring README Checks (every one of these has its Check in the README's tables) and declarations that follow from definitions or are boundary arithmetic are padding.

Witness: my one-tactic probe (`simp_all` with the obvious lemma set) does not close `inverse_limit`, `sup`, `eval_eq_of_charpoly_eq_glnPolynomial` or `similitude_dual_twist`, so none is one-tactic padding; `IsNonEisenstein.isGaloisType` is already closed in place by projecting the existential (lines 802–804), i.e. it restates the definition.

Repair: delete the 75 admitted examples (the README keeps every Check); delete `IsNonEisenstein.isGaloisType` and, since no headline mentions them, the Layer 3b definitions; delete the three `Nilpotence` lemmas (README §5.2 keeps them as targets). Keep the proved examples that compute `glnPolynomial` and the dual-spin polynomial only if the author regards them as nontrivial tests of a kept definition (at most a handful).

## R05 (P3) — links into the roadmap repository pinned to commits

Location: README lines 478, 484, 493, 505 (`github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` for PadicMeasuresIwasawaAlgebras §5.1, §4.5 and SchemeAndStackFoundations §0.20, §2.22).

Witness: gate `blob (4)`.

Repair: replace each by the relative path on main (`../PadicMeasuresIwasawaAlgebras/README.md#51-…`, `../SchemeAndStackFoundations/README.md#020-…`, as the README already does for `[reductivegroups9]` and `[classfieldtheory7]`), or name the roadmap and section in prose.

## R06 (P3) — Mathlib pull-request numbers and an instruction to build in Tau Ceti

Location: README lines 4181–4189 (§6.4, "Koszul complex of a finite sequence"): three links to `github.com/leanprover-community/mathlib4/pull/43708`, `/43711`, `/43706`, and "Build these contracts in Tau Ceti when absent from the pin and use Mathlib's declarations when supplied".

Claim: pull-request numbers are process references, and `koszulComplex` does not exist at the pinned Mathlib (grep of `Mathlib/` for `def koszulComplex`: none), so the paragraph cites declarations the pin lacks and defers work to a library; a Tau Ceti roadmap defers to Mathlib but never waits for it or pushes work to it.

Repair: delete the three links and the sentence; keep the README's own definition of `K(x)` with its Stacks locators (tags 0622, 0623, 0624, 0664, 062F, all of which I resolved) as the target.

## R07 (P3) — supplier drift: the Fitting annihilator bound is named `TauCeti.Iwasawa.…` by its owner

Location: README lines 103, 485, 3689, 5294 cite `TauCeti.Module.fittingIdeal_le_annihilator` as owned by PadicMeasuresIwasawaAlgebras §4.5.

Witness: PadicMeasuresIwasawaAlgebras `README.md` on main, §4.5, lines 2695–2702: "*Lean:* `TauCeti.Iwasawa.fittingIdeal_le_annihilator`, `TauCeti.Iwasawa.fittingIdeal_prod` … stated for finitely presented modules".

Repair: rename the four occurrences to `TauCeti.Iwasawa.fittingIdeal_le_annihilator` (the hypotheses stated here, finitely presented over a commutative ring, already match the owner's).

## R08 (P3) — DKSW is cited under two texts with two paginations

Location: README References entry **DKSW** (the IISc author manuscript of 21 September 2023) versus the locators at lines 3827, 3854, 4066, 4087, 4288, 4620, 4648, 4698, 4762, 5019, which cite `arxiv.org/pdf/2310.16396v2` "printed pp."; Wang–Erickson "§2.3, pp.15–16" at line 2392.

Claim: a source has one entry; the arXiv version is not in the References, and its page numbers are not those of the manuscript the References name (I read the manuscript: Theorem 2.1 pp.7–8, Prop. 3.3 p.21, Cor. 5.12 p.43, Prop. 5.14 p.46 as cited, so the two paginations happen to agree, but the text does not say so). In the Wang–Erickson author manuscript §2.3 begins on p.12; the adapted-ring material is pp.15–17.

Repair: one DKSW entry with both locators and a version note on the numbering; cite one of them throughout. Change the Wang–Erickson locator to "§2.3, pp.12–17; Proposition 2.23, pp.16–17".

## R09 (P3) — dependency check: three UPWARD lines, all to roadmaps on main

Location: README lines 91, 467, 1849, 1963 (ClassFieldTheory), 94, 439, 2912, 3761, 3896, 3907 (ProfiniteCohomology), 447 (RepresentationTheory/SemisimpleAlgebras).

The check I ran prints:

```
UPWARD: IntegralHeckeAndGaloisDeterminants (#24) -> ClassFieldTheory (#262) at README lines [91, 467, 1849, 1963]
UPWARD: IntegralHeckeAndGaloisDeterminants (#24) -> ProfiniteCohomology (#376) at README lines [94, 439, 2912, 3761, 3896, 3907]
UPWARD: IntegralHeckeAndGaloisDeterminants (#24) -> RepresentationTheory (#180) at README lines [447]
not movable: IntegralHeckeAndGaloisDeterminants consumes ProfiniteCohomology (#376) and is consumed by PeriodsAndSpecialValues (#323) …
depcheck: 163 roadmaps, 1184 edges, 3 problem(s)
```

I believe these are false positives. All three roadmaps are on the content repository's main branch, which the merge-order header allows ("A roadmap may consume only roadmaps ABOVE it in this file, roadmaps on main, and other authors' PRs"), the open pull requests carrying those names (1215, 616, 1278) are revisions of existing roadmaps, and every cited section exists on main: ClassFieldTheory `### Layer 7: the absolute local Artin map, its normalizations, and conductors` (line 1312) with `geometricArtinMap` and `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`; ProfiniteCohomology layer 2 with `B1` and `explicitRes1` (lines 210–211); RepresentationTheory/SemisimpleAlgebras `### Layer 0/2/3/4/5` (lines 169, 212, 233, 249, 274). The "not movable" line is a board-level ordering matter (PeriodsAndSpecialValues is placed before ProfiniteCohomology), not a defect of this README. No change here; the board settles the lines.

## R10 (P3) — small text defects

- README line 1371: "the delta basis of left cosets `C₂g`": with the stated convention `F(hg) = hF(g)` these are the cosets `C₂g`, i.e. right cosets; write "cosets `C₂g`" (the values of `F` on representatives of `C₂\S₃`).
- README §3a.1 "Arithmetic and geometric Frobenius conversion" cites ACC "Notation §1.2, pp.905–906 and §2.2.20"; §2.2.20 begins on p.931 and the inversion formula is on p.932. Write "§2.2.20, pp.931–932".
- `Suggested.lean` uses `local instance : HasDerivedCategory.{u + 1} (ModuleCat.{u} A) := HasDerivedCategory.standard _` (line 634). It elaborates and is not a `set_option`; say in the docstring that the derived category is the standard one, since `Supported`/`IsGhost` depend on the instance.

## Verified sound

**Gate and build.** `lake env lean …/Suggested.lean`: exit 0, 112 warnings, every one `declaration uses sorry`; no other warning. `#check @name` for all 48 kept declarations elaborated (scratch file); the elaborated types agree with the README statements (no section variable was lost: `coefficient_descent` keeps completeness, noetherianity and the residue-field identification; `local_ribet` keeps `IsArtinianRing B`, `IsPrincipalIdealRing B`, `IsLocalization (nonZeroDivisors Tilde) B`, both completeness instances and the lattice hypothesis; `global_ribet` keeps `IsReduced A` and `IsAdicComplete`). One-tactic probes (`simp_all` with the natural lemma sets) on `Nilpotence.inverse_limit`, `Nilpotence.sup`, `eval_eq_of_charpoly_eq_glnPolynomial`, `similitude_dual_twist`: none closes. `DerivedCategory` has no `IsIdempotentComplete` instance at the pin, so `exists_idempotent_splitting` is not a library one-liner either.

**Adversarial table** (statement; instances; values on each side; result; change).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Amitsur Check §0.5 | `r=E₀₁, s=E₁₀` over ℤ and 𝔽₂; two copies of `I₂` | `Λ₁(r)Λ₁(s)−Λ₁(rs) = 0−tr(E₀₀) = −1`, so mixed coefficient `−tu` (ℤ), `tu` (𝔽₂); `det(tI+uI)=(t+u)²`, mixed `2` and formula gives `t²+u²+tu(4−2)` | agrees | none |
| Newton/cycle sign Check | `M=[[2,3],[4,5]]` | `tr²−tr(M²)=49−53=−4=2det M` | agrees | none |
| Two-dim determinant relation (Ex 1.8/Lemma 1.9) | `g=diag(a,b), h=diag(c,d)` | `T(gh)+D(g)T(g⁻¹h)=ac+bd+bc+ad=(a+b)(c+d)=T(g)T(h)` | agrees | none |
| Contragredient Check | `diag(2,3)` over ℚ | inverse roots `1/2,1/3`: `X²−(5/6)X+1/6` | agrees | none |
| `reciprocal_charpoly` | `d=1`, `χ`; `d=2`, `diag(a,b)`, `i=0,1,2` | `i=0`: `(−a⁻¹b⁻¹)(ab)=1=coeff₂`; `i=1`: `−(a⁻¹+b⁻¹)ab=−(a+b)=coeff₁`; `i=2`: `1·ab=coeff₀` | agrees; general case is `D(X−g⁻¹)=D(g)⁻¹(−1)^dD(1−Xg)` | none |
| `charpoly_smul_coeff` | `a•diag(2,3)`, `i=1,2` | `coeff₁ = −a(2+3)`, `coeff₀ = a²·6` | agrees (`Λᵢ` homogeneous of degree `i`) | none |
| `glnPolynomial` and Satake | `n=0,q=0,T₀=1`; `n=2,q=2,T=(1,3,5)`; `s=2,z=(3,5)`; `n=1` | `1`; `X²−3X+10`; `(X−6)(X−10)=X²−16X+60` and `T=(1,16,15)`: `X²−16X+2·15·2=X²−16X+60`; `n=1`: `X−z₀` both sides | agrees, including `n=0` (empty product `1`, `T₀ = e₀ = 1`) | none |
| Double-coset inversion (ACC p.932) | `q=2,T=(1,5,3)` | `ι(P)=X²−(5/3)X+2/3`; `q²P^rec(X/2)=4(X²/4−5X/12+1/6)` = same | agrees | none |
| `gsp4SpinPolynomial` | `(1,1,4,4)`, `(0,1,3,5)`, `(2,1,3,5)` | `(X−1)⁴`; `X⁴−3X³`; `X⁴−3X³+20X²−24X+64` (`qT₂+(q³+q)T₀=10+10`, `q³T₀T₁=24`, `q⁶T₀²=64`) | agrees with SR's `SpinPolynomial.reciprocal` after the `T₁↔T₂` swap | none |
| `gsp4DualSpinPolynomial_reciprocal` | symbolic; `(2,2,3,5)` | `X⁴Q(q³/X)/Q(0)` expands coefficientwise to `P`; `Q(0)=256`, `P(0)=16`, `P=X⁴−1.5X³+7.5X²−6X+16` | agrees | none |
| `charpoly_dualSpin` | roots `α` of `Q`, `ε(F)=ℓ⁻¹` | `(ρ∨⊗ε⁻³)(F)=q³ρ(F)⁻ᵀ`, roots `q³/α` = roots of `P` | agrees with BCGP Lemma 1.8.28 | none |
| `similitude_dual_twist` | `n=2`, `r=diag(2,3)`, `J=[[0,1],[−1,0]]`, `θ=5` | `rᵀJr=6J`; `θr⁻ᵀ` on `J⁻¹`: `25/6` | agrees; `n=0` trivial | none |
| `ℤ/4` multiplier Check | `1,−1` | `1²=(−1)²=1`, `1≠−1` | agrees | none |
| Classical weight Check | `k=4,ℓ=2,a=3,ω=1` | `X²−3X+8`; `ℓT₂` with truncated `k−2` at `k=1` gives `2≠1` | agrees | none |
| `eq_of_charpoly_eq` | monoid `G`; `d=0` | Amitsur expresses every mixed coefficient in `Λᵢ(w)`, `w∈G` (Chenevier (1.5), Cor. 1.14); `d=0`: both laws constant `1` | sound | none |
| `existsUnique_isCoefficientChange_of_compact` | `ι=∅`; `G=ℤ` discrete, `B=𝔽₂` | `ι=∅` forces `A` subsingleton, unique determinant over the zero ring; `G` noncompact: proof uses only `ι(A)` closed in `∏Bᵢ` and density of `S` (Chenevier Ex. 2.32, no compactness of `G` used) | sound | none |
| `eq_of_charpoly_frobenius` | `V=∅`; `G` not a topological group | `Dense ∅` forces `G=∅`, impossible: vacuous; class functions agree on the dense saturation, continuity + `T2Space A` extend | sound | none |
| `existsUnique_interpolation` | levels `D_r` not assumed compatible; `A` zero ring | compatibility follows: `D_s mod J_r` and `D_r` are both locally constant with the same Frobenius polynomials, uniqueness on the discrete quotient gives equality; limit law exists by representability (`Z_ℤ(ℤ[G],d)→lim A/J_r≅A` via `hsep`,`hcomplete`); coefficients continuous since `J_r` is a basis; zero ring trivial | sound | none |
| `existsUnique_descent_kerLift` | `d=0`; `J` not nilpotent | degree 0 unique; statement never uses nilpotence (descent is compact gluing for the single map `kerLift`) | sound | none |
| `Nilpotence.sup` | `ℚ[x,y]/(x²,y³)` | `(x+y)³=3xy²≠0`, `(x+y)⁴=0`: bound `2+3−1=4` sharp | agrees | none |
| `Nilpotence.comparison` | symbolic | `L=f⁻¹I∩g⁻¹J`: `L^b≤ker f`, `L^c≤ker g`, so `L^{max}≤ker f∩ker g`, `L^{a·max}=0` | sound | none |
| Extension bound Check §5.2 | `ℤ/64`, `J=(2)`, `K=(8)` | `K²=0`, `J³=K`, `J⁵=(32)≠0`, `J⁶=0` | agrees | none |
| Rescaling Check §5.3 | `P=diag(2,3)`, `U=[[2,6],[0,3]]` | `PUP⁻¹=[[2,4],[0,3]]`, `c=2↦4/3=(2/3)c` | agrees | none |
| `ghost_nilpotence` / Ext check | `𝔽₂[0]⊕𝔽₂[−1]`, `X↦δ` | `X` ghost, `X²=0`, `2=0`: ghost kernel `(2,X)`, `ker α=(2,X²)`; exponent `2` needed on `[0,1]` | agrees with ACC Lemma 2.2.4 (`I^{d+1}=0`) | none |
| Telescope sign Check | `t=−1` | `[0,3]=[1,−3]`, so `[0,3]+[1,3]=0` | agrees | none |
| `finite_local_factors` | `T=0` (`s=0`) | empty product is the zero algebra | agrees with Stacks 0325 (Lemma 10.160.2) | none |
| `exists_semisimple_ofMatrix_eq` | `d=0` excluded; kernel clause | Chenevier 2.12: `ker ρ = ker D` | matches | none |
| `exists_ofMatrix_eq_of_henselian` | uniqueness among all `σ` with `det∘σ=D` | `σ` factors through `A[G]/CH(D)≅M_d(A)`; the induced endomorphism of `M_d(A)` preserves `det`, hence is injective (`1+aE₁₁`), hence an inner automorphism over a local ring (ANT proof of 2.4) | sound | none |
| `coefficient_descent` | residue identification `e`,`he` | `he` gives `m_B∩A=m_A`; hypotheses are CHT Lemma 2.1.10's | matches | none |
| `symplectic_coefficient_descent` | `p=2` | excluded (`2<p`), as Gee–Geraghty Lemma 7.1.1 | matches | none |
| Ribet cocycle Check §6.1 | `g=diag(2,3)`, `h=[[1,1],[0,1]]` | `gh=[[2,2],[0,3]]`, `κ(gh)=2/3=κ(g)+α(g)κ(h)=0+(2/3)·1` | agrees; pins `ψ⁻¹` and `α(g)` on the right factor | none |
| Sign-character Check §6.1 | `G=ℤˣ`, `ρ(u)=uI₂`, `χ=ψ=1` | `Δψ=2ℤI₂`, `ΔχΔψ=4ℤI₂`, `M₀≅ℤ/2` | agrees | none |
| `global_ribet` with `I=⊥` | `I=0` | exact split characteristic polynomials force, on each field factor, a faithful quotient `k×k` or `k` of the image algebra, which is `M₂(k)` or a quadratic field by irreducibility: contradiction, so the case is vacuous | sound | none |
| `global_ribet` with `I=⊤` | `I=T` | `M=0`, `κ=0`, span condition trivially `⊤` | sound | none |
| `local_ribet` weighted containment | `P=∅`; weight `2`, minor `5` over ℤ | empty product `1`; `10∈(2)` while `5∉(2)` | agrees with DKSW (12) | none |
| Stabilization Checks §6.2 | `(d)` with row `(α,−1)`; `D=(5)`, `z=2`, pivot `1` | `det[[d,0],[α,−1]]=−d`; `det[[2,1],[0,5]]=10` | agrees | none |
| Local-column orientation §6.6 | `Y_σ=[[1,2],[3,4]]`, `Y_τ=[[5,6],[7,8]]`, `x_σ=9`, `x_τ=10` | `A_σ=(5,3)`, `B_σ=(2,8)`, `A_τ=(2,7)`, `B_τ=(6,5)`; wedges `29,7,−2,−38`; `−C_στ=29`, `−D_στ=7`, `A_στ=−2`, `B_στ=−38` | agrees | none |
| Lower-Borel action §6.4 | `g=[[x,0],[y,z]]`, `M=[[A,B],[C,D]]` | `g⁻¹Mg=[[A+(y/x)B,(z/x)B],[(x/z)C−(y/z)A−(y²/xz)B+(y/z)D, D−(y/x)B]]` | agrees with DKSW Ex. 4.2 | none |
| Lower-Borel coproduct §6.4 | `g=[[2,0],[3,5]]`, `h=[[7,0],[11,13]]` | `(gh)₂₁=76`, `(hg)₂₁=61`; `Δy=y⊗x+z⊗y` | agrees | none |
| Induced modules §6.4 | `λ=(0,−1)`, `(1,0)`, `(0,1)` | `f(gb)=z f(g)`: second-column coordinates `b,d`; `(1,0)`: `b/det, d/det`; `(0,1)`: `0` | agrees (DKSW label `Ind(−λ)` names the same modules) | none |
| Twisted vanishing Checks | `H¹(B,ℤ(1))`, `H¹(B,ℤ)`, `H²(B,ℤ(1))` | `≠0`, `0`, `0` by Lemma 4.11 (`i>j`) and 4.12(1) | agrees | none |
| Buchsbaum sign Check §6.5 | `ℤ²` | `ω(e₁*∧e₂*)(e₁∧e₂)=1`, `ω(e₁*)ω(e₂*)(e₁∧e₂)=−1` | agrees (Lemma 1.1 sign) | none |
| `d₂` cyclic contraction | columns `(b_i,b′_i)` | `f(r₁₂e₃+r₂₃e₁+r₃₁e₂)=0` (both coordinates cancel) | agrees | none |
| Koszul two-term sign | `(2,3)` | `d(e₀∧e₁)=2e₁−3e₀`, next boundary `2(−3)+3·2=0` | agrees | none |
| Generic combinations Checks | `(x)` in `ℤ[x]`, two rows | `V₁·(V₂x)∈(V₁x)`, `V₁∉(V₁x)`: not weakly regular | agrees | none |
| Mixed-minor Check | one block, `u=0`, two rows | `(V₁₁b′₁+V₁₂b′₂)b_j−b′_jL₁=±V_{1,·}r₁₂∈` minor ideal, so `L₂` kills a nonzero class | agrees | none |
| Formal comparison Checks §6.7 | `h=1,x=2,ν=4,a=2`, `Ĩ=(2)`; `a=7` | `det𝔈=6`, `det𝔈′=0`, `e=−6`, correction `6−4=2`, arithmetic `4∈(2)`; `a=7`: `e=−11∉(2)`, `det𝔈′=−5` | agrees | none |
| Pairing lemma Checks §6.7 | `[[b,x−a],[0,1]]`; `I₂` one block | `det=b`; `det=1` | agrees (conditions 2 and 3 needed) | none |
| DKSW standing hypotheses | `K` noetherian local with principal maximal ideal that is its own total fraction ring | every ideal is `(π^n)`; `π` a zero-divisor forces `π^{n+1}=0`, so `K` is artinian: README's "equivalently" holds | sound | none |

**Library declarations opened at the pins** (file, line where read): `IsIdempotentElem.Corner` `Mathlib/RingTheory/Idempotents.lean:552`; `ModuleCat.finite_ext` `Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean:26` (noetherian, two finite modules, as the README says); `CochainComplex.IsKProjective.Qh_map_bijective` `…/DerivedCategory/KProjective.lean:43`; `HasExponent` `Mathlib/FieldTheory/PurelyInseparable/Exponent.lean:54`, `exponent` `:65`, `iterateFrobenius` same file; `exteriorPower.oneEquiv` `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:452`; `TensorProduct.AlgebraTensorModule.cancelBaseChange` `…/TensorProduct/Tower.lean:435`; `Module.Flat.of_projective` `Mathlib/RingTheory/Flat/Basic.lean:227`; `ModuleCat.preservesColimit_restrictScalars` `…/ChangeOfRings.lean:934`; `TauCeti.fittingIdeal` `TauCeti/RingTheory/FittingIdeal/Basic.lean:343`, `fittingIdeal_eq_minorsIdeal_ker` `:349`, `Submodule.minorsIdeal` `:85`, `det_mem_minorsIdeal` `:92`, `fittingIdeal_baseChange` `…/BaseChange.lean:134`, `fittingIdeal_eq_minorsIdealOfSet` `…/Generators.lean:109`; `TauCeti.exists_unit_conj_of_algEquiv` `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:139`; `completedGroupAlgebra.proj` `…/CompletedGroupAlgebra/Basic.lean:161`, `isEmbedding_coeffFamily` `:383`; `Comodule.Corestrict` `TauCeti/Algebra/Coalgebra/Comodule/Corestrict.lean:110`; `pointsFunctor` `TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/Basic.lean:211`; `Module.Flat.quotient_span_singleton_of_lTensor_mulLeft_injective` `TauCeti/RingTheory/Flat/QuotientRegular.lean`; and by grep at the pin: `Module.rankAtStalk`, `IsAzumaya`, `groupCohomology.IsCocycle₁/IsCoboundary₁`, `Algebra.FormallyEtale.equivPiOfIsSepClosed`, `Algebra.norm_eq_one_of_not_module_finite`, `PadicInt.inverseLimitRingEquiv/inverseLimitContinuousMulEquiv`, `IsArithFrobeniusLift.coe_localCyclotomicCharacter`, `HeckeRing.GL2.Newform.satakeParameters`, `Comodule.cofree`, `Comodule.fixedSubcomodule`, `Subsemigroup.mem_corner_iff`, `PrimeSpectrum.comap_quotientMk_bijective_of_le_nilradical`, `Ideal.relIsoOfSurjective`, `RingCat.sectionsSubring`, `IsAdicComplete.liftRingHom`, `MonoidAlgebra.antipode_single`, `Matrix.charpolyRev`, `Matrix.charpoly_inv`, `Matrix.reverse_charpoly`, `Matrix.charpoly_diagonal` (Charpoly/Basic.lean), `Polynomial.mul_scaleRoots_of_noZeroDivisors`, `Polynomial.reflect`, `exteriorPower.zeroEquiv`, `CliffordAlgebra.contractLeft_ι_mul`, `Matrix.det_fromBlocks_zero₂₁`, `MvPolynomial.mul_esymm_eq_sum`, `LinearMap.eventually_isCompl_ker_pow_range_pow`, `Ideal.sup_pow_add_le_pow_sup_pow`, `Matrix.det_one_add_mul_comm`, `IsAdicComplete.henselianRing`, `IsArtinianRing.equivPi`, `Module.free_of_flat_of_isLocalRing`, `Matrix.toLinAlgEquiv'`, `RingTheory.Sequence.IsWeaklyRegular`, `TensorProduct.finsuppScalarLeft`, `MvPolynomial.basisMonomials`, `Ideal.Quotient.factorₐ`, `Module.FinitePresentation`, `RingHom.kerLift`, `TauCeti.cornerMap_apply`, `Comodule.tensor`. Absent at the pin, as the README correctly treats them as roadmap or supplier targets: `koszulComplex` (R06), `Ring.IsJapanese/IsNagata`, `IsAzumaya.exists_etale_matrix_splitting`, `projectiveDeterminant*`, `fittingIdeal_le_annihilator` (R07), `IsAbsolutelyIrreducible`.

**Cross-roadmap citations resolved.** SmoothRepresentationsOfLocalGroups at this head: `SpinPolynomial`, `SpinPolynomial.reciprocal` (Suggested.lean 849–861), SR.4.3 *gln-generators* (README 3254–3256), SR.4.5 *gsp4-spin-polynomial*, *gsp4-galois-comparison* (3497–3525), SR.6.1 *One integral finite-wild cocycle scheme* (4629), SR.6.3 *Finite-wild excursion algebra* (4741); SR's own supplier table names this roadmap only as a consumer (4923–4924), and neither AdelicAlgebraicGroups nor ReductiveGroupsPartII cites IntegralHeckeAndGaloisDeterminants, so no cycle. On main: ClassFieldTheory Layer 7 (line 1312) and both named declarations; ProfiniteCohomology layer 2 `B1`, `explicitRes1`; RepresentationTheory/SemisimpleAlgebras Layers 0, 2, 3, 4, 5; ReductiveGroups Layer 9 (line 1092); ReductiveGroupsPartII RG2.2, RG2.3 (lines 56–61); Chebotarev (Completed) Layer 10 (line 410); ModularForms Layer 9 with `X² − aₚX + χ(p)p^{k−1}` (line 981); PadicMeasuresIwasawaAlgebras §5.1 with `projectiveDeterminant`, `_constantRank`, `_baseChange` (3172–3214) and §4.5 (2620, name as in R07); SchemeAndStackFoundations §0.20 with the four `Ring.IsJapanese/IsNagata` names (1302–1389) and §2.22 `IsAzumaya.exists_etale_matrix_splitting` with the same hypotheses (4454, 4553); AlgebraicVectorBundles L0C (254); FreeProbability F8 (consumer only). Ownership against the other open pull requests whose files the brief lists was checked only through the resolver's report (no cross-roadmap citation found nowhere) and the sibling folders of this pull request; the 392 open pull requests were not searched by object.

**Sources, seeded sample** (all read at the locator; theorem number, page, hypotheses and support of the statement as written):
- 0.3: Chenevier §1.17 p.16 (kernel definition), Lemma 1.18(i)–(iii) p.16, Lemma 1.19(i)–(ii) p.17 (proper iff `d>0`, `R≠0`) — all as stated.
- 0.4: Chenevier §1.2 p.8 (Roby representability, footnote 13 on the internal algebra), Prop. 1.6 p.9, Ex. 1.7(i),(ii),(iv) p.10, Thm 1.15 (Vaccarino) pp.14–15; Roby Prop./Def. IV.1 p.265, Thm IV.1 p.266, Thm III.3 p.262, Prop. IV.9 p.285, Thm IV.2 and Prop. IV.5 p.272, Chapter III §§1–2 pp.248–249 — as stated.
- 0.5: Chenevier §1.10 p.12, Ex. 1.11(ii) eq. (1.3) p.12, Lemma 1.12(i)–(iv) pp.12–14 with (1.4)–(1.5), Cor. 1.14 p.14, Prop. 1.27 p.20 (injection needs the standing `d!∈A^×` of its pseudocharacter definition, as the README records), Prop. 1.29 pp.20–22 — as stated.
- 1.3: Chenevier Lemma 2.6 p.26, Lemma 2.7(i),(v) pp.26–27, Lemma 2.8(i)–(ii) pp.27–28, Ex. 2.9 p.28, Lemma 2.10(i) p.28, Thm 2.22(i)–(ii) p.34 and its matrix-unit lifting; ANT Thm 2.4, Prop. 2.5 p.5; CN Lemma 3.2.2 p.48, Prop. 3.2.3–3.2.4 pp.49–50; BC Def. 1.3.1 p.20, Lemma 1.3.5 p.22, Props. 1.3.9 p.23, 1.3.13 pp.27–28, Lemma 1.4.3 p.30, Thm 1.4.4 p.31; Wang–Erickson Prop. 2.23 pp.16–17 — as stated.
- 1.5: Chenevier §1.22 and Prop. 1.23 p.18; CHT Lemma 2.1.10 p.13 (hypotheses as in `coefficient_descent`); Gee–Geraghty Lemma 7.1.1 p.25 (residue characteristic `>2`); BIP Lemma 3.1 p.10 — as stated.
- 2.1–2.3: ACC §2.2.3 pp.920–921, Lemma 2.2.4 p.920 (`I^{d+1}=0`); Boxer–Pilloni Lemma 2.4.3 p.18 (finite algebra generated by `T`, invertible/nilpotent splitting) and Lemma 2.4.6 p.19; Bökstedt–Neeman Cor. 1.7 p.213, Def. 2.1 and Rem. 2.2 p.213, Prop. 3.2 pp.221–222; Stacks 0325 = Lemma 10.160.2; CG2018 §7.1 p.73 (`lim (U−β)^{n!}`) — as stated.
- 4.1–4.2: Chenevier §2.30 p.37, Ex. 2.31–2.32 p.38 (gluing: proof uses closedness of `ι(A)` and density only), Lemma 2.33 p.38, Lemma 3.2 p.41; Scholze Def. 5.1.8, Rem. 5.1.9, Cor. 5.1.10 p.1037, Cor. 5.1.11 p.1038 — as stated.
- 5.1: Scholze Thm 5.4.1 pp.1058–1059, Cor. 5.4.2 with footnote 29, Cors. 5.4.3–5.4.4 p.1060 — as stated.
- 6.1: DKSW Thm 1.1 pp.2–3, Thm 2.1 pp.7–8 (hypotheses on `K`, local conditions (9)–(11), conclusion (12)), §2.1 (13)–(14) pp.8–9, Lemma 2.3 p.9 — as stated (with the sign correction the README notes).
- 6.2: DKSW §2.2 (16)–(24) pp.10–11, §2.3 pp.11–12, §2.4 (27)–(30) pp.12–13 (`det E = ∏z·det D`), Lemma 2.4 pp.13–14 — as stated.
- 6.4: DKSW Ex. 4.2 p.22 (action formulas), Thm 4.4 p.23, Def. 4.6 (finite filtrations only) and Thm 4.7 p.23, Thm 4.8, Cor. 4.9, Lemma 4.11 p.24, Lemma 4.12 pp.24–25, Cor. 4.13 p.25, Lemma 4.14 pp.25–26, Thm 4.15 p.26, Thm 4.16 pp.26–27, Cor. 4.17 pp.27–28, Lemma 4.18 pp.29–30 — as stated.
- 6.7: DKSW (52) p.29, Lemma 4.19 pp.30–33, Lemma 4.20 pp.31–32, Lemma 4.21 pp.32–33, Thms 4.22–4.23 pp.33–34, Prop. 3.3 p.21, Lemma 3.2 and (47) pp.20–21 — as stated.
- Also read for the Checks: Quast Def. 3.1 p.11, Lemma 3.2 p.12, Def. 3.10 and Lemmas 3.11–3.12 p.16, §§3.4–3.7, Ex. 3.14, Lemma 3.18, Prop. 3.19, Thm 3.20 pp.17–20; Emerson–Morel Thm 4.1 pp.13–14; BHKT Def. 4.1, Lemma 4.3 p.13; Grothendieck Thm 5.1 p.210, 5.10 p.212, §5.13 p.213; BCGP (1.8.27) and Lemma 1.8.28 p.17, §1.8.7–8 pp.9–10; Buchsbaum Lemma 1.1 p.184, Prop. 2.1 and Cor. 2.2 p.187, Lemmas 2.3–2.8 pp.188–190, Thm 2.9 p.191, Lemmas 2.10–2.11 pp.192–193, §3 definition and Prop. 3.1 p.194; Stacks 032W (Lemma 10.162.8), 00IN (Lemma 10.51.2), 00M9 (§10.96).

## Not verifiable

- Ribet, *A modular construction of unramified p-extensions*, Prop. 2.1 pp.154–155 (README §1.4 "Classical Ribet lattice"): the author-page PDF is an image-only scan and OCR is not available on this worker; the locator is recorded as uncertified.
- Jantzen, *Representations of Algebraic Groups* (I.2.3, I.3.3–3.7, I.4.2, I.4.14–4.18, II.2.6, II.4.16–4.21): a book with no legal open copy; not fetched; the README's convention paragraphs on induction and good filtrations were checked against DKSW §4 instead.
- Stacks tags 07ZA, 068P, 0663, 0622–0624, 0664, 062F (More on Algebra) were not opened; tag 0325 and the three Algebra tags above were.
- Ownership by object against the 392 open pull requests outside this pull request's own folders was not searched (see *Verified sound*).

## Source issues

- **Misprint** in DKSW at §2.1, printed p.9: the second relation generating `Q` is written with the factor `(1 − χψ⁻¹(σ))` while Theorem 2.1 states `(χψ⁻¹(σ) − 1)`; it should be the latter (or `y_v ↦ −y_v`); affects nothing.
- **Misprint** in DKSW at equation (47), printed p.21: the second factor is written as `ξ_v` evaluated at `ψ`; it should be `ξ_v(τ) − ψ(τ)` for the second group element `τ`; affects nothing.
- **Gap** in DKSW at §2.1, printed p.9: the module `N` is asserted finitely generated "since `G` is compact, `ρ` is continuous and `Σ` is finite", with no hypothesis bounding the image of `G` inside a finite `T`-submodule of `M₂(K)` (the topology on `K` is not specified); it should assume such a lattice (the README adds it as the input `Λ`); affects a stated result (the finiteness clause of Theorem 2.1).
- **Misprint** in Scholze at Corollary 5.4.4, printed p.1060: the displayed characteristic polynomial is written for `σ_ψ` where the representation `σ_m` just constructed is meant; affects nothing.
