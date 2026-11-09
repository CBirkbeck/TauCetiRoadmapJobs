# Review of QuantumGroups (pull request #1649 at 50d79b7)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuantumGroups/` at `50d79b7`, the same head the previous review (`~27`) read. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with four `sorry` warnings and nothing else. Every Check in the README was recomputed, and every supplier citation and pinned name was resolved. Every sampled locator that can be read was read. There are five findings:

- **R01 (P2), R02 (P2):** two groups of Layer 0 objects have a second claimed owner among open roadmaps, and each side says the other consumes from it.
- **R03 (P3):** the conflict with #1705 has no stated order, and the description is stale. Carried from `~27`.
- **R04 (P3):** the Q8 item ids cited by two roadmaps on main are dropped without an old → new mapping.
- **R05 (P3):** three library and external citations do not resolve at the pins.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

## Previous findings (review `~27` at `50d79b7`)

- **R01 (P3), #1705 conflict and stale description: not repaired.** The description still opens "Current head `d7a6c540…`", still says "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged", and does not mention #1705. #1705 still conflicts, now at `f4ad8e4`. Carried as R03 below.

## R01 (P2) — §0.2's sign isomorphism and radical identification have a second owner

**Location:** `:37–41`: "Section 0.2 owns … the sign map s:TL_n(−d)→TL_n(d) over ℂ … and the identification of Subfactors 3.2's trace radical with … TemperleyLieb Layer 6's negligible ideal at the loop parameters ±d". `:47–51` leaves "the sign map over every commutative coefficient ring and every loop parameter, the radical identification at every real loop parameter" to TemperleyLiebOperatorAlgebras. `:1712–1713` lists it as consuming §0.2.

**Claim:** one object is split by generality between two open texts that each claim it. This head owns the ℂ, ±d case of the sign isomorphism and says TemperleyLiebOperatorAlgebras 1.3 and 2.1 consume it. It also hands the general case to that roadmap, which therefore builds the same isomorphism a second time.

**Witness:** TemperleyLiebOperatorAlgebras at `ba43cc7`, `README.md:72–76`: "the sign isomorphism 2.1 … are the single home … Roadmaps that need these objects consume them from here". `:1155` builds `s : TemperleyLieb R δ n ≃ₐ[R] TemperleyLieb R (−δ) n`. It never cites QuantumGroups.

**Repair:** QuantumGroups is on main and cannot consume an open roadmap, so it keeps both objects, stated at the generality that roadmap would otherwise re-prove.
- In `:38–41` and §0.2 (`:270–279`), state s for every commutative ring R and every δ∈R, with `s(e_i)=−e_i` and `T_n^(δ)(s x)=(−1)^n T_n^(−δ)(x)`. Your displayed computation uses neither ℂ nor d>0.
- State the radical identification at every d>0, and at −d through s.
- Delete the two clauses at `:47–49`.
- TemperleyLiebOperatorAlgebras 1.3 and 2.1 then cite §0.2.

Tested on the instances the current wording excludes:
- R=𝔽₂: s is the identity and TL_n(δ)=TL_n(−δ).
- δ=0: `(−e_i)²=e_i²=0=0·(−e_i)`.
- The parity k+c≡n is a property of diagrams and holds over every R.

## R02 (P2) — §0.1's C*-category objects are claimed by CategoricalOperatorAlgebras, which hands them back

**Location:** `:29–37`: "Layer 0 … is the single home of the following objects. Section 0.1 owns C*-categories … standard solutions … intrinsic dimension … the unitary dual functor … signed self-dualities". `:42–44` says "CategoricalOperatorAlgebras CA1a–CA2a … consume these objects from §§0.1–0.2". The same claim is at `:1709–1711`.

**Claim:** two open texts each name themselves the single home of these objects, and each says the other consumes them. The allocation in this folder is the admissible one: main's README cites CategoricalOperatorAlgebras CA1a and CA2a as a supplier (main `README.md:42`) although that roadmap is not on main. The double ownership persists because the other text was not changed.

**Witness:** CategoricalOperatorAlgebras at `b9c0a6f`, `README.md:40–46`: CA1a and CA2a "have their single home here; QuantumGroups consumes CA1a and CA2a"; `:2625` says the same. TemperleyLiebOperatorAlgebras at `ba43cc7`, `:106`, `:1336`, `:1369`, instantiates CA1a and CA2a.

**Repair:** no edit in this folder.
- Revise CategoricalOperatorAlgebras, a pull request by the same author, at `README.md:40–46` and `:2625`: CA1a and CA2a cite QuantumGroups §0.1 instead of building these objects.
- Point TemperleyLiebOperatorAlgebras Layer 3's CA1a/CA2a citations (`:106`, `:1336`, `:1369`) to QuantumGroups §0.1.
- Record in this pull request's description that both roadmaps follow it in the merge order.

## R03 (P3) — The conflict with #1705 has no stated order, and the description describes an earlier head

Carried from `~27`. No repair report marks it not actionable.

**Location:** this pull request's description (data): "Current head `d7a6c540…`"; "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged"; the dependency block names only #860.

**Claim:** two open pull requests change this roadmap and conflict, and the description says neither which is rebased on which nor what this head contains. The two heads also disagree on ownership, not only on numbering.

**Witness:** `roadmaps overlaps QuantumGroups`: "#1649 and #1705 conflict in `README.md`, `Suggested.lean`".
- #1705 at `f4ad8e4` numbers Layer 0 as §0.1 free-module coaction legs, §0.2 C*-categories and §0.3 unitary Temperley–Lieb category.
- Its scope says "§0.3 is the single home of the unitary Temperley–Lieb category". This head leaves that category to TemperleyLiebOperatorAlgebras Layer 3 (`:50–51`).

**Repair (pull-request text, no folder edit):**
- Rewrite the description for `50d79b7`: §1.1 ClassicalMultipliers; Layer 0 as §§0.1–0.2; Layer 8 on the native `TauCeti.UqSl2`; the six-declaration `Suggested.lean`.
- State which of #1649 and #1705 is rebased on the other.
- State which head's Layer 0 numbering and which owner of the unitary Temperley–Lieb category survive.

## R04 (P3) — The Q8 item ids cited on main are dropped without a mapping

**Location:** `:187`: "The labels Q1–Q8 refer to these same layers." Main's README numbers Q8's parts "1." to "7.", and this head renames them §§8.1–8.7. No sentence maps the items.

**Claim:** an id that roadmaps on main cite disappears at the merge with no old → new numbering.

**Witness:**
- HopfologicalAlgebra on main cites "QuantumGroups Q8 item 5" at `README.md:40`, `:72`, `:319`, `:331`, `:337` and `:379`.
- QuantumEnvelopingAlgebras on main cites "QuantumGroups Q8 item 1" at `README.md:510`.

**Repair:** extend `:187` to "The labels Q1–Q8 refer to these same layers, and item k of Q8 is §8.k." Tested on both citations:
- Item 5 → §8.5, which owns `TauCeti.FiniteHopfModuleCat`, the object HopfologicalAlgebra `:165` consumes.
- Item 1 → §8.1, the PBW and Hopf API that QuantumEnvelopingAlgebras `:510` uses.

## R05 (P3) — Three library and external citations do not resolve at the pins

**Locations and repairs:**
- **`:247`** (§0.1 *Needs:*): "Mathlib … `CategoryTheory.Karoubi`". At Mathlib `1b1ccf4`, `#check @CategoryTheory.Karoubi` fails ("Unknown identifier"). The declaration is `CategoryTheory.Idempotents.Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`). Rename it.
- **`:1550`** (§8.5): `IsGroupLikeElem` links to mathlib4 commit `6b7abb3c`, not the pin `1b1ccf4`. At the pin the declaration is at `Mathlib/RingTheory/Coalgebra/GroupLike.lean:37`. Replace the link with the backticked name and that pinned path.
- **`:1770–1774`** (References): "Q8 … extends this mathematical scope and compares the σ=id specialization". No target in §8.1 carries a comparison with the external AlgebraicAnalysis construction. That construction is at an unpinned commit; its `rightMul_assoc_of_ring` and `oreLift` exist there and are derivation-only. Cut "and compares the σ=id specialization", or add a §8.1 target with its statement.

## Verified sound

**Gate.** Rerun on this head: every scanner 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. `PROGRESS.md` and `STATUS.md` are on main too, and the gate counts them as roadmap files. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 235 roadmaps, 2267 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. QuantumGroups is on main, so its suppliers must be on main, and all thirteen are: CStarAlgebras, VonNeumannAlgebras, HilbertModules, TemperleyLieb, Subfactors, OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups, RepresentationTheory/LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups and PivotalSpherical. No *Needs:* line names CategoricalOperatorAlgebras, TemperleyLiebOperatorAlgebras or another open roadmap.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`). The six elaborated types in `scratch/signatures.md` match the README statements:
- §3.1's two Schur forms, with `δ_jl (F̃⁻¹)_ik/Tr F̃⁻¹` and `δ_ik F̃_jl/Tr F̃`;
- `[Nontrivial A]` in `compactType_iff`, matching "nonzero Hopf *-algebras";
- `A ≃ₐ[ℂ] A` with `∃!` in `haar_modular_automorphism`;
- `S∘S = id` in `haar_trace_iff_antipode_involutive`.

The flagged `[StarModule ℂ A]` is missing only from `AlgebraicHaar`, whose fields do not use it. No other open roadmap declares these fully qualified names; only #1705, the same roadmap, does.

**Padding probe.** `rfl`, `simp`, `infer_instance` and `aesop` were each tried on all four theorems: 16 failures. Errors: "rfl failed", "simp made no progress", "type class instance expected", "aesop failed". No padding.

**Headlines.** The README's headlines are:
- Layer 0: standard solutions, fiber functors, and the TL comparison.
- Layer 1: Haar state existence and uniqueness; the classical bi-C*-algebra.
- Layer 2: Peter–Weyl.
- Layer 3: Schur orthogonality, modular theory, the pivotal and Kac comparison, Tomita.
- Layer 4: compact type, completions, coamenability.
- Layer 5: SUq(2) and O_F^+.
- Layer 6: Tannaka–Krein.
- Layer 7: fusion, Haar laws, coamenability.
- Layer 8: the U_q(sl₂) classification.

The statable ones are stated: Schur orthogonality, compact type, the modular automorphism and the Kac equivalence. Every other headline is named in the module docstring with what it lacks. I checked the missing carriers at the pins:
- No minimal C*-tensor product (grep for minimal or spatial tensor in Mathlib and Tau Ceti; the only hit is `PointedCone.minTensorProduct`).
- No CQG, SUq(2) or O_F^+ carrier.
- No universal C*-envelope: Tau Ceti's `Analysis/CStarAlgebra/Completion.lean` only completes a C*-seminormed ring.

Layer 8's headlines are proved at the pin and are cited, not restated.

**Pinned declarations opened (Tau Ceti `2fd255d`).** All 97 `TauCeti.*` names in the README resolve: 94 by `#check` in one scratch file, and 3 in `QuantumGroups/UqSl2/Verma/Submodule.lean` (`:85`, `:155`, `:301`, namespace `TauCeti.UqSl2.VermaModule`). I also resolved `FDRep.ofShrink`/`ofShrinkEquiv` (`RepresentationTheory/FDRep/Basic.lean:314`), `matrixComodule` (`Comodule/MatrixCoefficient/FromMatrix.lean:166`), `convolutionAction` (`Comodule/Convolution.lean:46`) and `OreExtension.skewPolynomialEquiv` (`OreExtension/SkewPolynomial.lean`).

Statements compared with the README's prose:
- `quantumInteger` is `(q^r−q^(−r))/(q−q⁻¹)`, so 0 at q=1, as in Check `:1351`.
- `IsGenericQuantumParameter` is `q≠0 ∧ ∀ n>0, q^n≠1`.
- `StarCoalgebra` is only `comul_star` (`Algebra/Coalgebra/Star.lean:46`).
- `antipode_star_antipode_star` is `S(star(S(star a)))=a`, so `S⁻¹(a)=S(a*)*`.
- `comul_e` is `E⊗1+K⊗E`.
- `comul_e_pow` carries the weight `q^(s(r−s))[r choose s]`.
- `e_mul_f_pow` is the commutator of `:1429–1430`.
- `casimirScalar_units_mul_pow` is `ε(q^(m+1)+q⁻¹^(m+1))/(q−q⁻¹)²`.
- `clebschGordanCoeff` (`ClebschGordan/Basic.lean:76–79`) is the recurrence of `:1571–1572`, and `e_smul_clebschGordanVector` requires `j ≤ m`.
- `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` and `LadderModule.not_isTypeOne` (for every m) match.
- `instStarRing` requires `Fact (IsSelfAdjoint q)`.
- `FiniteHopfModuleCat` (`FiniteHopfModuleCat/Basic.lean:50`) is the full subcategory of `ModuleCat.{u} H` that is finite over k.
- The pivotal map is `unitEvalNatIso` with `(j m)(φ)=φ(g m)` (`FiniteHopfModuleCat/Pivotal.lean:82–124`).
- From `TauCeti.rightTrace := η_ X Xᘁ ≫ f ▷ Xᘁ ≫ ev_pivotal` and the analogous `leftTrace` (`Pivotal/Trace.lean:88–94`), I derived rightTrace f = tr(gf) and leftTrace f = tr(g⁻¹f), as `:1596–1597` and §3.3 `:699–700` state.
- `Comodule.tensor` coacts by `m⊗n ↦ m₀⊗n₀⊗m₁n₁`, with basis coactions given by columns, which is the `U_13 V_23` convention of `:100–102`.
- §1.1's locally compact identification is not a duplicate. Tau Ceti has only the discrete case, `ZeroAtInftyContinuousMap.curryEquiv` (`Topology/ContinuousMap/ZeroAtInfty/Discrete.lean:654`), a linear isometry.

**Mathlib names (`1b1ccf4`) resolved by `#check`:**
- `ObjectProperty.FullSubcategory`, `ContinuousLinearMap.finite_dimensional_eigenspace` (requires `μ ≠ 0`, as `:138` says) and `orthogonalComplement_iSup_eigenspaces_eq_bot`;
- `HopfAlgebra.antipode_mul_antidistrib`, `IsSemisimpleModule.extension_property`/`lifting_property`, `ModuleCat.restrictScalars`;
- `PositiveLinearMap.GNS`/`gnsStarAlgHom`, `Rep.equivalenceModuleMonoidAlgebra`, `VonNeumannAlgebra`, `WithConv`;
- `IsGroupLikeElem`, `GroupLike.toUnits`, `IsSl2Triple`, `SkewPolynomial`, `FGModuleCat`.

The only one that fails is `CategoryTheory.Karoubi` (R05).

**Cross-roadmap citations resolved on main:**
- CStarAlgebras C1.8 `C1.CommutativeMultiplierMorphisms` (`:497–522`) and C5.2 (`:1143`): `C₀(X)⊗min A≅C₀(X,A)`, and `C(X×Y)` only for compact spaces, as `:340–341` says. C2.1, C4.1 and C8.4 (Toeplitz) also resolve.
- VonNeumannAlgebras V4.Core/PositivePredual/Normality (`:972`, `:1059`, `:1124`), V10.ModularTheory and V10.KMS (`:2364`, `:2459`), and Layer 11's full left Hilbert algebras (`:2794`).
- HilbertModules H1–H3.
- TemperleyLieb Layer 2's `TLCat.lift`/`lift_unique` (`:459–474`, which requires `ExactPairing V V`; both zigzags hold for (R, εR*)), Layer 4 trace uniqueness (`:596`), and Layers 6–7.
- Subfactors 3.1–3.3, with `markovTrace_nonneg_iff` and `jonesLoopParameters` (`:729–731`).
- PivotalSpherical Layers 0–2 and 7; OperatorTheory Part B (`:252`).
- CompactGroups: `π_{v,w}(g)=⟨π g v,w⟩` (`:170`) gives the conjugate crosswalk of `:442–443`, and `su2Irrep` exists.
- OperatorAlgebraDynamics D1–D2; FreeProbability F1, F3 ("norm 2sqrt3 … sends it to 4", `:307`) and F6; AmenableGroups Layers 1, 5 and 7.

`scratch/citations.md` lists nothing unresolved. Moving these objects into Layer 0 removes main's dangling supplier citation of CategoricalOperatorAlgebras (main `:42`), as a roadmap on main must.

**Seeded sample and headline locators** (each read at its locator; the statement matches):

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 0.1 | Longo–Roberts §2 p.4; Lemma 3.3 p.10; Thm 3.8 p.15; Thm 3.11 p.17; Appendix p.48 | `longoroberts` lines 123–136, 389–391, 621–625, 681–683, 2000–2013 | C*-property; uniqueness up to a unitary; product of standard solutions; `‖R‖²‖R̄‖² ≥ d²` with equality iff a multiple is standard, so "minimum need not be standard" is right |
| 0.1 | Neshveyev–Tuset §2.2 pp.29–36; §2.5 p.52 | `nt` lines 1293–1595, 2425–2438 | Theorem 2.2.14: standard iff left trace = right trace. (2.5.1) `−τ(R*⊗ι)(ι⊗R)=ι` gives τ=−ε, as `:220–221` says |
| 0.2 | Neshveyev–Tuset §2.5 pp.52–54 | `nt` lines 2462–2516 | Lemma 2.5.1 gives `e e' e = d⁻² e`; Example 2.5.2 has R=(1⊗F)r, F F̄=−τ1, `‖R‖²=Tr(F*F)` |
| 1.1 | Kustermans–Vaes Def. 2.1, p.853 | `kustermansvaes` lines 739–744 | bi-C*-algebra: nondegenerate Δ:A→M(A⊗A), coassociative |
| 4.1, Lean | Neshveyev–Tuset Thm 1.6.6 p.18; Thm 1.7.3 p.22; Prop. 1.7.7 p.23 | `nt` lines 798–837, 966–978, 1030–1048 | Invariant functional of a Hopf *-algebra generated by unitary coefficients; `h(ab)=h(bσ_(−i)(a))` with `σ_z=f_(iz)*·*f_(iz)` and `f*a=(ι⊗f)Δ(a)`; trace ⟺ S²=ι; `τ_z=f_(−iz)*·*f_(iz)`, `S²=τ_(−i)` |
| 4.2–4.3, 7.1 | Bédos–Murphy–Tuset Thm 2.2 p.6; Thm 2.8 p.10; Cor. 2.9 p.11; Thm 2.12 p.13; Cor. 2.13 p.14; Thm 3.6 pp.18–19 | `bmt` lines 257–258, 461–464, 478–483, 592, 614, 645, 858–865 | Each as the README states; Theorem 2.12 is for 0<\|q\|<1, matching "interior" |
| 5.1 | Bédos–Murphy–Tuset §2, pp.13–14 | `bmt` lines 598–605 | `U=[[α,−qγ*],[γ,α*]]` |
| 5.2 | Banica Prop. 1, Lemma 1 | `banica` lines 54–66 | `E(1)=Σ F_ji e_i⊗e_j`, `(E*⊗1)(1⊗E)=c` |
| 7.2 | Banica Prop. 2, Thm 1, pp.2–4 | `banica` lines 67–75, 42–46 | `β=c⁻²‖E(1)‖⁴`; SU(2) fusion (n≥2; see Source issues) |
| 6.1 | Malacarne Thm 4.1, pp.5–6 | `malacarne` lines 285–289 | As stated |
| 6.2 | Malacarne Lemmas 1.2, 2.1, 3.1 and the proof of Thm 4.1, pp.2–6 | `malacarne` lines 52–60, 126–127, 170–183, 235 | `I_(n+1)∩A_n=I_n`; `R=(ι⊗F)r`; `A/I_F≅C[O_F^+]`; Hopf *-ideal |
| 8.1 | Virelizier §2.3, Prop. 2.4, p.8 | `virelizier` lines 348–359 | Same relations, ΔE=K⊗E+E⊗1, ΔF=1⊗F+F⊗K⁻¹, S as stated, `S²=Ad(K⁻¹)`, spanning |
| 8.2–8.4 | Virelizier §3.2, Ex. 3.3, Prop. 3.7, Cor. 3.8, Thm 3.13, Cor. 3.14, pp.11–13 | `virelizier` lines 529–555, 585–594, 625–636 | Type 1 = eigenvalues q^n; Example 3.3's E coefficient simplifies to [i][n−i+1] |
| 8.5 | Virelizier Lemma 2.3, Prop. 4.1, pp.6, 13 | `virelizier` lines 265–267, 644–651 | ev/coev are module maps; the fusion rule |
| 8.6, 8.7 | Virelizier §2.3, Ex. 3.3 | as above | As stated |
| 8.5 | EGNO §§5.1–5.3 | `egno` lines 160–162 | Fiber functors, bialgebras, Hopf algebras |

**Adversarial table** (each row: instances, values computed on each side):

| # | Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.1 minimal norm product vs standardness | ℂ²: R=2e₀⊗e₀+e₁⊗e₁, R̄=½e₀⊗e₀+e₁⊗e₁; rescaled standard (2R₀, R̄₀/2) | zigzag a_j b̄_j: 2·½=1, 1·1=1; ‖R‖‖R̄‖=√5·√(5/4)=5/2>2=d. Rescaled: norms² 8 and ½, product 2=d, but R*R=8≠½=R̄*R̄, so minimal and not standard | pass | none |
| 2 | §0.1 signed self-duality and NT sign | SU(2) cup e₀⊗e₁−e₁⊗e₀; symmetric cup | (R*⊗1)(1⊗R): e₀↦−e₀, e₁↦−e₁, so ε=−1; symmetric cup ε=+1; NT (2.5.1) gives τ=−ε | pass | none |
| 3 | §0.1 C*-identity Checks | diag(2,1); [[1,1],[0,0]]; J(z₁,z₂)=(−z̄₂,z̄₁) | 4=4, HS √17≠5; norm √2 (MMᵀ=diag(2,0)); J²(z)=(−z₁,−z₂) | pass | none |
| 4 | §0.2 Φ_R from `TLCat.lift` | ExactPairing (R, εR*) | (εR*⊗1)(1⊗R)=ε²=1; adjoint gives (1⊗εR*)(R⊗1)=ε·ε=1; loop εR*R=εd | pass | none |
| 5 | §0.2 sign map and trace parity | n=1,2 at ±d; R=𝔽₂; δ=0 | (−e)²=de=(−d)(−e); T₁: d=−(−d); T₂(se)=−d=T₂^(−d)(e); 𝔽₂: s=id; δ=0: 0=0 | pass, and general | R01 |
| 6 | §0.2 Jones obstruction | d=3/2 | [2]=3/2, [3]=5/4, [4]=3/8, [5]=−11/16<0; √2<3/2<(1+√5)/2 | pass | none |
| 7 | §0.2 signed traces | Rep SU(2), δ=−2 | T_r(f_r)=1,−2,3; dims 1,2,3=ε^r T_r(f_r) | pass | none |
| 8 | §1.1 C₀ identification | ℤ², H=1[m+n=0] | slices 1[−m] of norm 1, so not in C₀ on either side; the discrete case is `curryEquiv` | pass | none |
| 9 | §1.1 coproduct and inverse diagrams | S₃ g=(12), h=(23); ℤ, a=1[1], b=1[−1] | gh=(123) (right to left), Δf(g,h)=1, Δf(h,g)=0; d(a⊗b)=0, r₊=1[1]=aS(b), r₋=1[−1]; r₊Δ(1[0])=1=ε | pass | none |
| 10 | §1.2 cancellation, Haar, Fell | monoid {1,0}; C(C₂); Γ=ℤ | Δ(A)(A⊗1)={F: F(0,0)=F(0,1)}, dim 3<4; h(1[e])=½ vs evaluation 1; W(λ₁⊗1)W*(δ₁⊗δ₂)=δ₂⊗δ₃=(λ₁⊗λ₁)(δ₁⊗δ₂) | pass | none |
| 11 | §2.1 column convention | S₃ permutation rep; C₂ sign | u₁₃(gh)=1 since (123)·3=1; u₁₃(hg)=0; sign⊗sign: 1, versus −2 for a direct sum | pass | none |
| 12 | §2.2 unitarization | U(s)=[[1,2],[0,−1]]; U=0 | U²=I; T=½(I+U*U)=[[1,1],[1,3]], det 2, U*TU=T; U=0 gives T=0, not invertible | pass | none |
| 13 | §2.3 regular multiplicities | C₂; S₃ | 1+1=2; 1+1+4=6 | pass | none |
| 14 | `schur_orthogonality` | SUq(2), q=½; general derivation; reducible ℂ², u=I₂ | ū*F̃ū=F̃ ⟺ f₂=q²f₁: ½=¼·2. Tr F̃=Tr F̃⁻¹=5/2; h(a*a)=(½)/(5/2)=1/5, h(c*c)=4/5=1/(1+q²); h(aa*)=2/(5/2)=4/5=1−¼·4/5. Applying h to ū*F̃ū=F̃ gives M=F̃/Tr F̃; applying h to ūF̃⁻¹ū*=F̃⁻¹ gives N=F̃⁻¹/Tr F̃⁻¹, with the Lean index orders. u=I₂ gives h(u₁₁*u₂₂)=1 vs δ₁₂=0, so `IsSimpleOrder` is needed | pass | none |
| 15 | `AlgebraicHaar` | ℂ[C₂]; zero functional; C(C₂) counit | h((1+u)*(1+u))=2≥0, h(1)=1; 0(1)=0≠1; (id⊗ε)Δa=a≠ε(a)1, so the counit is not invariant | pass | none |
| 16 | §3.2 Woronowicz characters | SUq(2) a; Vandermonde | f_z(a)=2^z; θ(u)=FuF gives 4a; f₁*f₁(a)=F₁₁²=4=f₂(a); [[1,1],[1,4]] det 3 | pass | none |
| 17 | §3.3 pivots, traces, metrics | F=diag(2,½); left, right and double duals | tr(F·diag(1,0))=2, tr(F⁻¹·diag(1,0))=½; S²u=FuF⁻¹ preserves F⁻²; ⟨jx,jy⟩=(Fx)*F⁻²(Fy)=x*y, so j is unitary; the S⁻¹ dual matrix F̃ūF̃⁻¹ preserves F̃⁻¹; (Tr F)(Tr F⁻¹)≥n² | pass | none |
| 18 | §3.4 σ, τ, KMS | SUq(2), q=½ | σ_t(a)=4^(it)a, σ_(−i)(a)=4a, h(aa*)=4/5=h(a*·4a); τ_(−i)(c)=(FuF⁻¹)₂₁=c/4=S²(c); σ_t(c)=c; the inverse convention gives 1/20 | pass | none |
| 19 | `compactType_iff` | ℂ; zero ring; ℂ[x], x primitive self-adjoint | ℂ: both sides hold. Zero ring: h(1)=h(0)=0≠1, excluded by `[Nontrivial A]`. ℂ[x]: (id⊗h)Δx=x+h(x)≠h(x); the only group-like is 1, and [[1,x],[0,1]] has (u*u)₂₂=x²+1≠1, so both sides are false | pass | none |
| 20 | `haar_modular_automorphism` | ℂ[S₃]; SUq(2) | θ=id; θ(a)=4a; θ⁻¹ gives h(a*·a/4)=1/20≠4/5, so uniqueness excludes it | pass | none |
| 21 | `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SUq(2) | δ_(gk,e)=δ_(kg,e) and S²=id: both true. 4/5≠1/5 and S²(c)=c/4: both false | pass | none |
| 22 | `unitaryCoefficientSet` | ℂ[C₂]; n=0 | 1×1 comodules 1 and u with u*u=1; Fin 0 contributes nothing | pass | none |
| 23 | §5.1 SUq(2) | u*u=uu*=1; q=1 and q=½ with (a,c)=(0,1) | relations ac=qca, ac*=qc*a, cc*=c*c; S(c)=S(u₂₁)=u₁₂*=−qc; q=1 gives a unitary; q=½ gives aa*+q²c*c=¼≠1 | pass | none |
| 24 | §5.2 O_F^+ | F=[[0,1],[−2,0]]; F=I₂; n=1 | FF̄=−2I; E=−2e₀⊗e₁+e₁⊗e₀, ‖E‖²=5, bound 5/2, J(e₀)=−√2e₁; F=I₂ gives cup² 2; n=1 gives u*=u, u²=1 | pass | none |
| 25 | §6.1 reconstruction | Rep S₃; Hilb_f | 1+1+4=6 vs 4 diagonal; ℂ | pass | none |
| 26 | §6.2 filtration | H=ℂ | dim A_≤1=2; degree 1·1 goes to degree 2 | pass | none |
| 27 | §7.1 Haar laws | q=½; q=±1; q=−1 model | (¾)Σ(1/16)^j=4/5; (¾)Σ(1/64)^j=16/21; ∫t=½, ∫t²=⅓; σ₃σ₁=−σ₁σ₃ gives ac=−ca, a*a+c*c=1; (5/2)²=1+21/4 | pass | none |
| 28 | §7.2 fusion and laws | F=[[0,1],[−2,0]]; n=1,3; n=2 congruence | δ=−5/2, β=25/4; dims 1,2,3,4 vs 1, 5/2, 21/4, 85/8; ε(χ)=3∉[−2,2]; m₂=m₄=1 vs 1,2; the swap V maps Banica's [[0,−μ⁻¹],[1,0]] to [[0,1],[−μ⁻¹,0]] | pass | none |
| 29 | §8.1 presentation and Hopf | q=½; q=0; q=±1 | KF=4FK; L₁⁺ EF−FE=diag(1,−1)=(K−K⁻¹)/(−3/2); Δ(E²) middle term (1+q²)EK⊗E=q[2]=5/4; q=0 forces E=F=0; q²=1 makes the algebra commutative | pass | none |
| 30 | §8.2 ladders | L₂⁺, L₁⁻, q=½ | weights ¼,1,4; F 1, 5/2, 0; E 0, 5/2, 1; diagonal 5/2, 0, −5/2; L₁⁻ gives diag(−1,1)=(K−K⁻¹)/(q−q⁻¹) | pass | none |
| 31 | §8.3 Casimir | q=½ | 10/9, 17/9, 65/18; L₁⁺: diag(0,1)+diag(17/9,8/9)=17/9·I | pass | none |
| 32 | §8.5 Clebsch–Gordan and pivot | m=n=j=1, q=½; L₁⁺, L₀⁻ | α₁=−½; ΔE(v₀⊗v₁−½v₁⊗v₀)=½v₀⊗v₀−½v₀⊗v₀=0; tr K⁻¹=5/2 and −1=ε[m+1] | pass | none |
| 33 | §8.6 compact form | q=½, m=1 | h₁=q=½; E†v₀=2v₁=KFv₀; orthonormal entries √2=q^(−½), 1/√2=q^(½); ΔF of the cup is ½v₁⊗v₁−½v₁⊗v₁=0 | pass | none |
| 34 | §8.7 classical | v=1, m=1,2 | [E,F]=H, [H,E]=2E; diag(2,0,−2); Virelizier E coefficient = [i][n−i+1] after v_j ↦ v_j/[j]! | pass | none |
| 35 | §0.1 ownership | #888 `:40–46`, `:2625` | both texts claim the single home | fail | R02 |
| 36 | `:187` id mapping | HopfologicalAlgebra `:40`, QuantumEnvelopingAlgebras `:510` | "item 5", "item 1": no target id at this head | fail | R04 |
| 37 | `:247` Mathlib name | `#check @CategoryTheory.Karoubi` | unknown; `CategoryTheory.Idempotents.Karoubi` exists | fail | R05 |

**Shape.**
- 28 `**Checks.**` blocks, one per subsection, each with at least three bullets.
- All nine layers end with Examples and Dependencies.
- No LaTeX, process word or pull-request number in the folder.
- Every Lean name appears in the README, and every backticked name of this roadmap's own is declared in `Suggested.lean`.

**Ownership against open work.** Compared against the sibling checkouts of CategoricalOperatorAlgebras (`b9c0a6f`) and TemperleyLiebOperatorAlgebras (`ba43cc7`), against #1705 (`f4ad8e4`, read through `roadmaps show`), and with `roadmaps grep` over main and all open heads. This gives R01–R03. Other open roadmaps closest in vocabulary (ClassicalGroupsPartII, NoncompactQuantumSymmetry) state no Layer 0–8 object of this roadmap.

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), is recorded `uncertified`, so it is cited by locator only. Its locators for §§1.2, 2.1–2.3, 3.1–3.4, 4.1, 5.1, 7.1 and 8.6 were not read. Their statements were cross-checked against `nt`:
  - Theorem 1.6.6 and Step 2 (lines 810–840) for compact-type positivity and orthogonality;
  - Theorem 1.7.3 and Proposition 1.7.7 for the modular and Kac statements.
- The descriptions of #888, #867 and #1705 were not read; their README texts were.

## Source issues

- **Error** in banica at Theorem 1, p.2: the source states the SU(2) fusion rules for A_o(F) for every n∈ℕ; it should require n≥2, as its abstract does, since for n=1 A_o(F)=C*(ℤ/2) has two irreducibles; affects a stated result.
- **Misprint** in bmt at the proof of Theorem 2.12, p.13: the source writes the Haar state as (1−q²) times the plain sum of the diagonal coefficients at e_(n,0); it should weight the n-th term by q^(2n), since otherwise h(1) diverges; affects nothing.
