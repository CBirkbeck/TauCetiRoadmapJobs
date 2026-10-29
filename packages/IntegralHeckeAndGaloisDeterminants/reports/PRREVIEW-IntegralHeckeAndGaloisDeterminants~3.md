# Review of IntegralHeckeAndGaloisDeterminants (pull request #792 at 6008aed)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since a107311. The folder `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/` is byte-identical to the head the previous review read (README.md 5450 lines, Suggested.lean 1481 lines); the pull request's two commits since then touch only `TauCetiRoadmap/AdelicAlgebraicGroups/`, and neither that folder nor ReductiveGroupsPartII cites this roadmap (grep for the roadmap name in both: none). SmoothRepresentationsOfLocalGroups, the one sibling folder this roadmap consumes, is unchanged since a107311. So every finding of the previous report that lives in the folder stands as written; the one that lived in the merge order (R09) is now resolved by the board. The push gate still fails at this head (`sorry-data=3`, `imports=1`, `sorry-examples=75`, `blob=4`; `depcheck=0`, `build=0`), and every failure is a finding below. I re-elaborated `Suggested.lean` with `lake env lean` from the worktree: exit 0, 112 warnings, all `declaration uses sorry`, nothing else.

## R01 (P1) — sorry'd data in three definitions and one example

Location: `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/Suggested.lean` lines 62–68 (`def ker … add_mem' := sorry, zero_mem' := sorry, smul_mem' := sorry`), 138–141 (`def traceLinear … map_add' := sorry, map_smul' := sorry`), 145–154 (`def ofMatrix … isCompat' := sorry … isHomogeneous := sorry, isMultiplicative := sorry`), 268 (an `example` builds a `MonoidHom` with `map_one' := sorry, map_mul' := sorry`).

Claim: these are definitions (data) whose bodies are admitted. "No sorry'd data, and nothing that mentions one" is binding; `ofMatrix` is mentioned by `exists_semisimple_ofMatrix_eq`, `exists_ofMatrix_eq_of_henselian`, `exists_semisimple_specialization` and `charpoly_ofMatrix`, so three reconstruction headlines rest on admitted data.

Witness: gate line `sorry-data (3)` naming lines 62, 138, 145 at this head; the passages are unchanged since a107311 (I re-read them at this head).

Repair, unchanged from the previous report and still applicable line for line:
- `ker`: give the three closure proofs (`TensorProduct.tmul_add`, `add_assoc`; `TensorProduct.tmul_smul`, `smul_tmul'`).
- `ofMatrix`: prove the three fields (`RingHom.map_det` through `matrixEquivTensor` for `isCompat'`, `Matrix.det_smul` for `isHomogeneous`, `Matrix.det_mul` and `Matrix.det_one` for `isMultiplicative`), or delete it and restate the three headlines through characteristic polynomials (`∀ x, D.charpoly x = (ρ x).charpoly`, and `∀ g, (D.charpoly (of g)).map φ = (ρbar (of g)).charpoly` for the coefficient-change form); by `Determinant.eq_of_charpoly_eq` the two formulations agree on group algebras, where all three headlines live.
- `traceLinear`: delete the `def`; linearity of `Λ₁` is a theorem (Chenevier §1.10). State `isPseudocharacter_trace` as `∃ T : R →ₗ[A] A, ⇑T = D.trace ∧ IsPseudocharacter d T`, and the two bijection theorems with `⇑T = D.trace` in place of `D.traceLinear = T`.
- Line 268: delete the example (R04 deletes it anyway) or give the two proofs.

## R02 (P2) — the acceptance test imports another roadmap's module

Location: `Suggested.lean` line 3, `import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested`; used at lines 487–510 (`gsp4SpinPolynomial` is `Polynomial.reflect 4 (SmoothRepresentationsOfLocalGroups.SpinPolynomial q T₀ T₂ T₁)`).

Claim: imports are `import Mathlib` plus individual `TauCeti.*` modules, never another roadmap's module and nothing from a roadmap still in a pull request. The gate refuses the import (`imports (1)`), so the file cannot pass as written.

Witness: gate line `imports (1)` at this head: found `import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested` (line 3). The supplier at this head still declares `SpinPolynomial` (its `Suggested.lean` line 849) and `SpinPolynomial.reciprocal` (line 855), so the explicit body below is still the right one.

Repair: delete line 3 and define `gsp4SpinPolynomial` with its explicit body `X ^ 4 - C T₁ * X ^ 3 + C (q * T₂ + (q ^ 3 + q) * T₀) * X ^ 2 - C (q ^ 3 * T₀ * T₁) * X + C (q ^ 6 * T₀ ^ 2)`, which is what `SpinPolynomial.reciprocal` proves for the supplier's polynomial after the index swap. The three `gsp4SpinPolynomial` examples then close by `norm_num [gsp4SpinPolynomial]; ring` (`(2,1,3,5) ↦ X⁴−3X³+20X²−24X+64`, `(1,1,4,4) ↦ (X−1)⁴`, `(0,1,3,5) ↦ X⁴−3X³`). Keep the supplier cited in the docstring and README (§3a.2 already does).

## R03 (P2) — the module docstring does not name the headlines that are not statable, and one statable headline is absent

Location: `Suggested.lean` lines 5–27 (module docstring: "records the definitions and the headline theorems that can already be stated … It is not an exhaustive list of the targets of any layer"); README §0.6 "Azumaya reduced-norm determinant" (lines 1246–1266).

Claim: the required docstring says the roadmap is README.md, that the file states the headline theorems against the pinned APIs, and which headlines are not statable and what each lacks. None of the unstatable headlines is named (Vaccarino's theorem and `Z_A(R,d)`, Roby representability, the invariant-word colimit and `B_H^Γ`, faithful quotients over arbitrary fields, the henselian GMA structure and reducibility ideals, the lower-Borel restriction isomorphism and good-filtration acyclicity, Buchsbaum–Rim exactness, DKSW Theorems 4.22–4.23). Conversely the Azumaya headline (every degree-`d` determinant on an Azumaya algebra of rank `d²` is the reduced norm; Chenevier Example 1.7(ii), Grothendieck Thm 5.1) is statable at the pins and absent.

Witness: `IsAzumaya` at the pin in `Mathlib/Algebra/Azumaya/Basic.lean` (namespace at line 36) and `Module.rankAtStalk` in `Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean`; `Determinant A R d` is line 112 of the file; the docstring at this head is the quoted one (lines 5–27 unchanged).

Repair: rewrite the docstring in the required form, listing the unstatable headlines above with the missing carrier for each; add `theorem Determinant.subsingleton_of_isAzumaya [IsAzumaya A R] (hd : 0 < d) (hr : Module.rankAtStalk (R := A) R = fun _ ↦ d * d) : ∀ D E : Determinant A R d, D = E` together with `Nonempty (Determinant A R d)`, both with `sorry`.

## R04 (P3) — admitted examples, a proved projection and elementary lemmas are padding

Location: `Suggested.lean`: 75 admitted `example`s (gate `sorry-examples (75)`, first at line 71); `IsNonEisenstein.isGaloisType` (line 798, closed by projecting the existential) with the definitions `Spherical.IsGaloisType`/`IsNonEisenstein` (lines 740–764) that serve no headline; `Nilpotence.sup`, `Nilpotence.comparison`, `Nilpotence.inverse_limit` (lines 907–941), which README §5.2 itself calls elementary consequences.

Witness: gate `sorry-examples (75)` at this head; the one-tactic probe of the previous report (none of `inverse_limit`, `sup`, `eval_eq_of_charpoly_eq_glnPolynomial`, `similitude_dual_twist` closes by `simp_all`) still applies to the identical file.

Repair: delete the 75 admitted examples (the README keeps every Check); delete `IsNonEisenstein.isGaloisType` and the Layer 3b definitions no headline mentions; delete the three `Nilpotence` lemmas (README §5.2 keeps them as targets). Keep the proved `glnPolynomial` and dual-spin examples only as a handful of nontrivial tests.

## R05 (P3) — links into the roadmap repository pinned to commits

Location: README lines 478, 484, 493, 505 (`github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` for PadicMeasuresIwasawaAlgebras §5.1, §4.5 and SchemeAndStackFoundations §0.20, §2.22).

Witness: gate `blob (4)` at this head.

Repair: replace each by the relative path on main (`../PadicMeasuresIwasawaAlgebras/README.md#…`, `../SchemeAndStackFoundations/README.md#…`, as the README already does for `[reductivegroups9]` and `[classfieldtheory7]`), or name the roadmap and section in prose.

## R06 (P3) — Mathlib pull-request numbers and an instruction to build in Tau Ceti

Location: README lines 4181–4189 (§6.4, "Koszul complex of a finite sequence"): three links to `github.com/leanprover-community/mathlib4/pull/43708`, `/43711`, `/43706`, and "Build these contracts in Tau Ceti when absent from the pin and use Mathlib's declarations when supplied".

Claim: pull-request numbers are process references; `koszulComplex` does not exist at the pinned Mathlib, so the paragraph cites declarations the pin lacks and defers work to a library.

Repair: delete the three links and the sentence; keep the README's own definition of `K(x)` with its Stacks locators (tags 0622, 0623, 0624, 0664, 062F) as the target.

## R07 (P3) — supplier drift: the Fitting annihilator bound is named `TauCeti.Iwasawa.…` by its owner

Location: README lines 103, 485, 3689, 5294 cite `TauCeti.Module.fittingIdeal_le_annihilator` as owned by PadicMeasuresIwasawaAlgebras §4.5.

Witness: PadicMeasuresIwasawaAlgebras `README.md` on main, §4.5, lines 2695–2700 (re-read this round): the Lean names are `TauCeti.Iwasawa.fittingIdeal_le_annihilator`, `TauCeti.Iwasawa.fittingIdeal_prod`.

Repair: rename the four occurrences to `TauCeti.Iwasawa.fittingIdeal_le_annihilator`.

## R08 (P3) — DKSW is cited under two texts with two paginations

Location: README References entry **DKSW** (the IISc author manuscript) versus locators at lines 3827, 3854, 4066, 4087, 4288, 4620, 4648, 4698, 4762, 5019 citing `arxiv.org/pdf/2310.16396v2` "printed pp."; Wang–Erickson "§2.3, pp.15–16" at lines 2393 and 4009.

Claim: a source has one entry; the arXiv version is not in the References and the text does not say its pagination agrees with the manuscript's (the previous report checked that it does for the cited theorems). In the Wang–Erickson manuscript §2.3 begins on p.12; the adapted-ring material is pp.15–17.

Repair: one DKSW entry with both locators and a version note; cite one throughout. Change the Wang–Erickson locator to "§2.3, pp.12–17; Proposition 2.23, pp.16–17".

## R09 (P3) — small text defects

- README line 1371: "the delta basis of left cosets `C₂g`": with the stated convention `F(hg) = hF(g)` these are the cosets `C₂g`, i.e. right cosets; write "cosets `C₂g`".
- README line 1848 (§3a.1 "Arithmetic and geometric Frobenius conversion") cites ACC "Notation §1.2, pp.905–906 and §2.2.20"; §2.2.20 begins on p.931 and the inversion formula is on p.932. Write "§2.2.20, pp.931–932".
- `Suggested.lean` line 652: `local instance : HasDerivedCategory.{u + 1} (ModuleCat.{u} A) := HasDerivedCategory.standard _`. It elaborates and is not a `set_option`; say in the docstring that the derived category is the standard one, since `Supported`/`IsGhost` depend on the instance. (The previous report gave this line as 634; it is 652.)

## Previous findings

- R01 — not repaired: `def ker … add_mem' := sorry`, `def traceLinear … map_add' := sorry`, `def ofMatrix … isCompat' := sorry` at lines 62, 138, 145; the example at line 268 still admits `map_one'`, `map_mul'`. Re-raised as R01.
- R02 — not repaired: line 3 still reads `import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested`; gate `imports (1)`. Re-raised as R02.
- R03 — not repaired: docstring lines 5–27 unchanged ("It is not an exhaustive list of the targets of any layer"); no Azumaya statement in the file. Re-raised as R03.
- R04 — not repaired: 75 admitted examples (gate), `IsNonEisenstein.isGaloisType` at line 798, the three `Nilpotence` lemmas. Re-raised as R04.
- R05 — not repaired: the four `blob/<sha>` links at README lines 478, 484, 493, 505; gate `blob (4)`. Re-raised as R05.
- R06 — not repaired: README lines 4181–4189 still link `mathlib4/pull/43708`, `43711`, `43706` and say "Build these contracts in Tau Ceti". Re-raised as R06.
- R07 — not repaired: `TauCeti.Module.fittingIdeal_le_annihilator` at README lines 103, 485, 3689, 5294. Re-raised as R07.
- R08 — not repaired: `arxiv.org/pdf/2310.16396v2` locators at line 3827 and following; Wang–Erickson "§2.3, pp.15–16" at lines 2393, 4009. Re-raised as R08.
- R09 — repaired (by the board, not by the folder): the dependency check at this head prints `depcheck: 186 roadmaps, 1137 edges, 0 problem(s)` with no UPWARD, CYCLE or "not movable" line; ClassFieldTheory, ProfiniteCohomology and RepresentationTheory are on main and no longer listed in the merge order, so the three lines the previous report called false positives are gone. Nothing to carry.
- R10 — not repaired: README line 1371 "left cosets `C₂g`", line 1848 "Notation §1.2, pp.905–906 and §2.2.20", `local instance` at `Suggested.lean` line 652 without a docstring note. Re-raised as R09 of this report.

## Verified sound

**The change set.** `git diff --stat a107311..6008aed` touches only `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` (314 insertions, 244 deletions across both files) and its `Suggested.lean`; the diff contains no occurrence of this roadmap's name; `git diff --stat origin/main...HEAD` outside the four roadmap folders is empty. SmoothRepresentationsOfLocalGroups and ReductiveGroupsPartII are unchanged since a107311. The only sibling that names this roadmap is SmoothRepresentationsOfLocalGroups, as a consumer in its supplier table (README lines 4923–4924), so no cycle.

**Gate and build.** The worker's gate at this head: `set_option=0 blob=4 … sorry-data=3 sorry-examples=75 … imports=1 … depcheck=0 … build=0 FAIL`. My elaboration, `lake env lean TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/Suggested.lean`: exit 0, 112 warnings, every one `declaration uses sorry`, no other warning or error (the Tau Ceti Fitting-ideal object file is present in this worktree, so the elaboration ran; the worker's signature printer failed only because it looked in a different lake directory). The `#check @name` comparison of the 48 kept declarations against the README was done in the previous review on the identical file; no section variable is lost (`coefficient_descent`, `local_ribet`, `global_ribet` keep their completeness, noetherian, artinian, principal-ideal, localization and reducedness binders).

**Dependency check**, run this round:

```
depcheck: 186 roadmaps, 1137 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. IntegralHeckeAndGaloisDeterminants is line 14 of the merge order, directly after SmoothRepresentationsOfLocalGroups (line 13), its last supplier in the order.

**Resolver leads.** The worker's resolver lists 67 Lean names "found nowhere"; every one is a name of this roadmap's own namespace (`Determinant.*`, `HeckeImage.*`, `IntegralRibet.*`, …), each declared in `Suggested.lean`, so none is a missing citation. Cross-roadmap citations found nowhere: none.

**Adversarial table.** The diff leaves every statement untouched, so every row carries forward from the previous report (PRREVIEW-IntegralHeckeAndGaloisDeterminants~2, table under *Verified sound*), with its computed values; no row needed recomputation. The rows, each "statement; instances; values on each side; result", as recorded there:

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Amitsur Check §0.5 | `r=E₀₁, s=E₁₀` over ℤ and 𝔽₂; two copies of `I₂` | `Λ₁(r)Λ₁(s)−Λ₁(rs) = −1`, mixed coefficient `−tu` (ℤ), `tu` (𝔽₂); `det(tI+uI)=(t+u)²`, mixed `2` and formula gives `t²+u²+tu(4−2)` | agrees (previous report) | none |
| Newton/cycle sign Check | `M=[[2,3],[4,5]]` | `tr²−tr(M²)=49−53=−4=2det M` | agrees (previous report) | none |
| Two-dim determinant relation | `g=diag(a,b), h=diag(c,d)` | `T(gh)+D(g)T(g⁻¹h)=(a+b)(c+d)=T(g)T(h)` | agrees (previous report) | none |
| Contragredient Check | `diag(2,3)` over ℚ | `X²−(5/6)X+1/6` | agrees (previous report) | none |
| `reciprocal_charpoly` | `d=1`; `d=2`, `diag(a,b)`, `i=0,1,2` | `1=coeff₂`, `−(a+b)=coeff₁`, `ab=coeff₀` | agrees (previous report) | none |
| `charpoly_smul_coeff` | `a•diag(2,3)`, `i=1,2` | `coeff₁=−a·5`, `coeff₀=a²·6` | agrees (previous report) | none |
| `glnPolynomial` and Satake | `n=0`; `n=2,q=2,T=(1,3,5)`; `z=(3,5)`; `n=1` | `1`; `X²−3X+10`; `X²−16X+60` both ways; `X−z₀` | agrees (previous report) | none |
| Double-coset inversion (ACC p.932) | `q=2,T=(1,5,3)` | `ι(P)=X²−(5/3)X+2/3` = `q²P^rec(X/2)` | agrees (previous report) | none |
| `gsp4SpinPolynomial` | `(1,1,4,4)`, `(0,1,3,5)`, `(2,1,3,5)` | `(X−1)⁴`; `X⁴−3X³`; `X⁴−3X³+20X²−24X+64` | agrees with SR `SpinPolynomial.reciprocal` after the `T₁↔T₂` swap (previous report; supplier re-checked at lines 849–861 this round) | none |
| `gsp4DualSpinPolynomial_reciprocal` | `(2,2,3,5)` | `Q(0)=256`, `P(0)=16`, `P=X⁴−1.5X³+7.5X²−6X+16` | agrees (previous report) | none |
| `charpoly_dualSpin` | roots `α` of `Q`, `ε(F)=ℓ⁻¹` | roots `q³/α` = roots of `P` | agrees with BCGP Lemma 1.8.28 (previous report) | none |
| `similitude_dual_twist` | `n=2`, `r=diag(2,3)`, `J` standard, `θ=5` | `rᵀJr=6J`; `θr⁻ᵀ` on `J⁻¹`: `25/6` | agrees (previous report) | none |
| `ℤ/4` multiplier Check | `1,−1` | `1²=(−1)²=1`, `1≠−1` | agrees (previous report) | none |
| Classical weight Check | `k=4,ℓ=2,a=3,ω=1` | `X²−3X+8`; truncation at `k=1` gives `2≠1` | agrees (previous report) | none |
| `eq_of_charpoly_eq` | monoid `G`; `d=0` | Amitsur expresses every mixed coefficient in `Λᵢ(w)`; `d=0` both laws `1` | sound (previous report) | none |
| `existsUnique_isCoefficientChange_of_compact` | `ι=∅`; `G=ℤ` discrete, `B=𝔽₂` | zero ring unique; no compactness of `G` used (Chenevier Ex. 2.32) | sound (previous report) | none |
| `eq_of_charpoly_frobenius` | `V=∅`; `G` not a topological group | `Dense ∅` forces `G=∅`: vacuous; continuity + `T2Space A` extend | sound (previous report) | none |
| `existsUnique_interpolation` | levels not assumed compatible; `A` zero ring | compatibility follows from uniqueness on discrete quotients; limit law by representability | sound (previous report) | none |
| `existsUnique_descent_kerLift` | `d=0`; `J` not nilpotent | degree 0 unique; nilpotence unused | sound (previous report) | none |
| `Nilpotence.sup` | `ℚ[x,y]/(x²,y³)` | `(x+y)³=3xy²≠0`, `(x+y)⁴=0`: bound `4` sharp | agrees (previous report) | none |
| `Nilpotence.comparison` | symbolic | `L^{a·max}=0` | sound (previous report) | none |
| Extension bound Check §5.2 | `ℤ/64`, `J=(2)`, `K=(8)` | `J⁵=(32)≠0`, `J⁶=0` | agrees (previous report) | none |
| Rescaling Check §5.3 | `P=diag(2,3)`, `U=[[2,6],[0,3]]` | `c=2↦4/3` | agrees (previous report) | none |
| `ghost_nilpotence` / Ext check | `𝔽₂[0]⊕𝔽₂[−1]`, `X↦δ` | ghost kernel `(2,X)`, `ker α=(2,X²)`; exponent `2` | agrees with ACC Lemma 2.2.4 (previous report) | none |
| Telescope sign Check | `t=−1` | `[0,3]+[1,3]=0` | agrees (previous report) | none |
| `finite_local_factors` | `T=0` | empty product is the zero algebra | agrees with Stacks 0325 (previous report) | none |
| `exists_semisimple_ofMatrix_eq` | `d=0` excluded; kernel clause | Chenevier 2.12: `ker ρ = ker D` | matches (previous report) | none |
| `exists_ofMatrix_eq_of_henselian` | uniqueness among all `σ` | injective endomorphism of `M_d(A)` is inner over a local ring | sound (previous report) | none |
| `coefficient_descent` | residue identification `e`,`he` | `m_B∩A=m_A`; CHT Lemma 2.1.10 hypotheses | matches (previous report) | none |
| `symplectic_coefficient_descent` | `p=2` | excluded, as Gee–Geraghty Lemma 7.1.1 | matches (previous report) | none |
| Ribet cocycle Check §6.1 | `g=diag(2,3)`, `h=[[1,1],[0,1]]` | `κ(gh)=2/3=0+(2/3)·1` | agrees (previous report) | none |
| Sign-character Check §6.1 | `G=ℤˣ`, `ρ(u)=uI₂` | `M₀≅ℤ/2` | agrees (previous report) | none |
| `global_ribet` with `I=⊥` / `I=⊤` | `I=0`; `I=T` | contradiction with irreducibility, vacuous; `M=0`, `κ=0`, span `⊤` | sound (previous report) | none |
| `local_ribet` weighted containment | `P=∅`; weight `2`, minor `5` over ℤ | `1`; `10∈(2)` while `5∉(2)` | agrees with DKSW (12) (previous report) | none |
| Stabilization Checks §6.2 | row `(α,−1)`; `D=(5)`, `z=2` | `−d`; `10` | agrees (previous report) | none |
| Local-column orientation §6.6 | `Y_σ=[[1,2],[3,4]]`, `Y_τ=[[5,6],[7,8]]`, `x_σ=9`, `x_τ=10` | wedges `29,7,−2,−38` | agrees (previous report) | none |
| Lower-Borel action and coproduct §6.4 | `g=[[x,0],[y,z]]`; `g=[[2,0],[3,5]]`, `h=[[7,0],[11,13]]` | conjugation formula; `(gh)₂₁=76`, `(hg)₂₁=61` | agrees with DKSW Ex. 4.2 (previous report) | none |
| Induced modules §6.4 | `λ=(0,−1)`, `(1,0)`, `(0,1)` | coordinates `b,d`; `b/det,d/det`; `0` | agrees (previous report) | none |
| Twisted vanishing Checks | `H¹(B,ℤ(1))`, `H¹(B,ℤ)`, `H²(B,ℤ(1))` | `≠0`, `0`, `0` | agrees (previous report) | none |
| Buchsbaum sign Check §6.5 | `ℤ²` | `1` versus `−1` | agrees (previous report) | none |
| `d₂` cyclic contraction; Koszul two-term sign | columns `(b_i,b′_i)`; `(2,3)` | both coordinates cancel; `2(−3)+3·2=0` | agrees (previous report) | none |
| Generic combinations and mixed-minor Checks | `(x)` in `ℤ[x]`; one block, `u=0` | `V₁∉(V₁x)`; `±V_{1,·}r₁₂` in the minor ideal | agrees (previous report) | none |
| Formal comparison Checks §6.7 | `h=1,x=2,ν=4,a=2`, `Ĩ=(2)`; `a=7` | `det𝔈=6`, `det𝔈′=0`, correction `2`; `e=−11∉(2)`, `det𝔈′=−5` | agrees (previous report) | none |
| Pairing lemma Checks §6.7 | `[[b,x−a],[0,1]]`; `I₂` | `det=b`; `det=1` | agrees (previous report) | none |
| DKSW standing hypotheses | principal maximal ideal, own total fraction ring | `π` a zero-divisor forces `π^{n+1}=0`: artinian | sound (previous report) | none |

**Cross-roadmap citations resolved this round.** SmoothRepresentationsOfLocalGroups at this head: `SpinPolynomial` (`Suggested.lean` line 849), `SpinPolynomial.reciprocal` (line 855), supplier-table rows naming this roadmap as consumer (README 4923–4924). PadicMeasuresIwasawaAlgebras on main §4.5 lines 2695–2700 (the `TauCeti.Iwasawa.*` names of R07). ClassFieldTheory, ProfiniteCohomology and RepresentationTheory are folders on main (`ls` of the content checkout), which is what makes the depcheck clean. The remaining citations (ReductiveGroups Layer 9, ReductiveGroupsPartII RG2.2–2.3, Chebotarev Layer 10, ModularForms Layer 9, PadicMeasuresIwasawaAlgebras §5.1, SchemeAndStackFoundations §0.20 and §2.22, AlgebraicVectorBundles L0C, FreeProbability F8) were resolved in the previous review against the same texts and are unchanged.

**Library declarations.** Opened in the previous review at the same pins (`lake-manifest.json` unchanged): the list under its *Verified sound*, from `IsIdempotentElem.Corner` (`Mathlib/RingTheory/Idempotents.lean:552`) to `TauCeti.fittingIdeal` (`TauCeti/RingTheory/FittingIdeal/Basic.lean:343`), and the declarations confirmed absent at the pin (`koszulComplex`, `Ring.IsJapanese/IsNagata`, `IsAzumaya.exists_etale_matrix_splitting`, `projectiveDeterminant*`, `fittingIdeal_le_annihilator`, `IsAbsolutelyIrreducible`). Re-opened this round: the Tau Ceti Fitting-ideal module's object file (present, so the import at line 2 resolves).

**Sources, seeded sample.** This round's sample (0.1, 0.2, 0.4, 0.5, 1.3, 1.4, 1.6, 1.7, 4.2, 5.1, 5.2, 5.3, 6.1, 6.5, 6.7) falls entirely in unchanged text; the targets 0.4, 0.5, 1.3, 4.2, 5.1, 6.1, 6.7 were read at their locators in the previous review (Chenevier §1.2, Prop. 1.6, Ex. 1.7, Thm 1.15, §1.10, Lemma 1.12, Cor. 1.14, Props. 1.27, 1.29, Lemmas 2.6–2.10, Thm 2.22, §2.30–Lemma 2.33; ANT Thm 2.4; CN Prop. 3.2.3–4; BC Thm 1.4.4; Wang–Erickson Prop. 2.23; Scholze Cor. 5.1.10–11, Thm 5.4.1, Cors. 5.4.2–4; DKSW Thm 2.1, §2.1, Lemma 2.3, (52), Lemmas 4.19–4.21, Thms 4.22–4.23, Prop. 3.3), with theorem number, page and hypotheses as the README states them. The remaining sample targets (0.1, 0.2, 1.4, 1.6, 1.7, 5.2, 5.3, 6.5) rest on the same sources (Chenevier §1.1–1.5, §1.17–1.23, Prop. 1.23, Lemmas 2.6–2.8; Buchsbaum Lemma 1.1, Prop. 2.1, Thm 2.9; Scholze §5.4), which the previous review opened for the adjacent targets and whose Checks are in the table above; an incremental re-review of 0 changed lines does not reopen them.

## Not verifiable

- Ribet, *A modular construction of unramified p-extensions*, Prop. 2.1 pp.154–155 (README §1.4): image-only scan, OCR not available on this worker; recorded as uncertified.
- Jantzen, *Representations of Algebraic Groups* (I.2.3, I.3.3–3.7, I.4.2, I.4.14–4.18, II.2.6, II.4.16–4.21): no legal open copy; the induction and good-filtration conventions were checked against DKSW §4 instead.
- Stacks tags 07ZA, 068P, 0663, 0622–0624, 0664, 062F were not opened this round or last.
- Ownership by object against the open pull requests outside this pull request's own folders was not searched (the resolver reports no cross-roadmap citation found nowhere).

## Source issues

- **Misprint** in DKSW at §2.1, printed p.9: the second relation generating `Q` is written with the factor `(1 − χψ⁻¹(σ))` while Theorem 2.1 states `(χψ⁻¹(σ) − 1)`; it should be the latter (or `y_v ↦ −y_v`); affects nothing.
- **Misprint** in DKSW at equation (47), printed p.21: the second factor is written as `ξ_v` evaluated at `ψ`; it should be `ξ_v(τ) − ψ(τ)` for the second group element `τ`; affects nothing.
- **Gap** in DKSW at §2.1, printed p.9: the module `N` is asserted finitely generated from compactness of `G`, continuity of `ρ` and finiteness of `Σ`, with no hypothesis bounding the image of `G` in a finite `T`-submodule of `M₂(K)`; it should assume such a lattice (the README adds it as the input `Λ`); affects a stated result (the finiteness clause of Theorem 2.1).
- **Misprint** in Scholze at Corollary 5.4.4, printed p.1060: the displayed characteristic polynomial is written for `σ_ψ` where the representation `σ_m` just constructed is meant; affects nothing.
