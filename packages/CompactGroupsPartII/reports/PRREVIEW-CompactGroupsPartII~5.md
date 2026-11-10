# Review of CompactGroupsPartII (pull request #1047 at aafe102)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. Four findings, all P3, none blocking. This is a full review of the head, not an incremental one.

**Previous findings, checked first.**

- Previous R01 (consume the base roadmap's categorical comparison): **repaired**. README:28–29 now reads “§0.1 adds only tensor and dual compatibility of that correspondence, preserving its underlying maps”, and the supplier contracts (README:176–186) cite `ContRepresentation.intertwiningMapEquiv`, its identity and composition laws, `ContRepresentation.nonempty_equiv_iff`, `FDRep.ofShrink`, `FDRep.ofShrinkEquiv` and `FDRep.character_ofShrink`.
- Previous R02 (Hilbert-basis countability criterion): **repaired**. README:76–77 “BanachSpaceTheory B5 owns the equivalence between separability … and countability of a Hilbert-basis index”; §3.1 (README:651–653) applies it and the Needs line names B5. The criterion is at `TauCetiRoadmap/BanachSpaceTheory/README.md:840–843` on main.
- Previous R03 (compact cocharacter theorem): **repaired**. README:50–53 “§6.5 owns the compact-group equality of the cocharacter and coroot lattices for a simply connected compact semisimple group”, with the proof route at README:1044–1058. No citation of LieHighestWeight Layer 10 remains; Layers 7 and 9 are named only as excluded owners and keep their numbers at both open LieHighestWeight heads.
- Previous R04 (family index): **not repaired**. It is R01 below.
- Previous R05 (generated summary block): **not repaired**. It is R02 below.

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`.

## R01 (P3) — The family index still describes a representation ring and a supplier the roadmap does not use

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings, and unitary SU(2) actions”; lines 100–102: “the highest-weight roadmap's dominant integral classification”.

**Claim.** These two entries describe this roadmap's scope and the suppliers of its global-form layer.

**Witness.** README:62–65: “this roadmap constructs no Grothendieck ring of representations and no target here uses that carrier”. README:296–299 takes the highest-weight theory from pinned Mathlib and Tau Ceti declarations, and §6.5 proves the cocharacter comparison itself.

**Repair.** In the first entry replace “representation rings” by “their formal characters”. Rewrite the dependency line so that the global forms use the Lie-groups roadmap's compact structure, maximal tori, real roots and covers, ConvexityToric's period dictionary, BanachSpaceTheory B5 and OperatorIdeals Part C, with the highest-weight modules taken from the pinned libraries. Tested on the refuting instance: §6.7's object is a ℤ-basis of `ℤ[X]^W` (for SU(2), `t²+1+t⁻²` and `1`), not a ring `R(G)`, which TopologicalKTheory T6 owns.

## R02 (P3) — The description disagrees with the head in three places

**Location.** Pull-request description. (a) Generated block `roadmap-summary`: “the representation ring of a compact connected group with its restriction to a maximal torus”; “the highest-weight roadmap's dominant integral classification”. (b) Author text: “The full folder gate flags the missing configured-order entry and the family-index change outside the roadmap folder.” (c) Author text: “These index discrepancies remain to be corrected.”

**Claim.** (a) states the scope and supplier route; (b) states the gate result; (c) reports an open defect.

**Witness.** (a) README:62–65 and 296–299, as in R01. (b) The gate at this head passes every check (`outside-folder=0`, `depcheck=0`, `build=0`). (c) is the defect of R01, acknowledged but left in the pull request.

**Repair.** Regenerate the `roadmap-summary` block from the head so that it names the formal-character basis of the Weyl invariants and the actual suppliers. Replace sentence (b) by the gate result at the head. Delete sentence (c) once R01 is applied. The author's own scope and dependency paragraphs already state the correct carriers and need no change.

## R03 (P3) — §0.1 and §1.3 restate objects the pinned Tau Ceti already has, without citing them

**Location.** README:332–336 “Construct its tensor comparison from the algebraic image of V⊗W … and its dual comparison from the algebraic image of V*”; README:348–349 “The transported tensor and dual actions have trace characters χ_Vχ_W and g↦χ_V(g⁻¹)”; README:533–535 “For finite discrete groups compare native unitarization's Haar average with `|G|⁻¹ Σ_g⟪π(g)v,π(g)w⟫`”.

**Claim.** The continuous tensor and dual representations are unnamed carriers taken from “Mathlib finite-dimensional tensors, duals” (Needs, README:354), and the dual character and the finite-group average are proof obligations here.

**Witness.** At the Tau Ceti pin `2fd255d`: `RepresentationTheory/Continuous/TensorProduct.lean:57,74` (`ContRepresentation.tprod`, `continuous_tprod`); `Continuous/LinHom.lean:96,128,276` (`linHom`, `continuous_linHom`, `character_linHom`: the character is `χ_π(g⁻¹)·χ_ρ(g)`); `Compact/Finite.lean:263,436` (`TauCeti.integral_haarProb`, `haarAverageMap_eq_smul_sum`).

**Repair.** Add these declarations to “From Tau Ceti” and to §0.1's Needs. In §0.1 name the continuous tensor representation as `ContRepresentation.tprod` (it is stated for inner-product spaces, so the comparison is taken on unitarized or Euclidean models) and the dual as `ContRepresentation.linHom` into the trivial line. Drop the dual half of the third API bullet, citing `ContRepresentation.character_linHom` with `ContRepresentation.character_trivial` instead, and keep the tensor character as the remaining obligation. In §1.3 replace the finite-group comparison by a citation of `TauCeti.integral_haarProb` and keep the C₃ Check. Tested on the README's own instances: for the C₃ character with value ω, `character_linHom` gives `ω⁻¹·1 = ω²`, the README's dual trace; for C₃, `integral_haarProb` gives `(1/3)Σ`, so the unnormalized sum is 3h.

## R04 (P3) — Four Knapp locators in the References support no claim

**Location.** README:1469–1474: “Proposition 2.13 p.136”; “Proposition 4.24 and Corollaries 4.25–4.26 p.249”; “equations (4.31)–(4.32) pp.253–254”; “Theorem 4.69 p.268”.

**Claim.** The reference list attributes these locators to the roadmap.

**Witness.** No section cites them: the body cites only Proposition 4.8, Corollary 4.9, Theorem 4.29, Propositions 4.58, 4.59 and 4.67, and Theorems 5.107 and 5.110 (README:461, 491, 927, 1058–1088, 1164, 1179, 1239, 1316). The facts they covered are now LieGroups Layer 5A, 6 and 7 inputs.

**Repair.** Delete the four locators from the Knapp entry, or attach each to the sentence it supports. The remaining eight locators were each opened and are correct (see below), so the entry then lists exactly what the text cites.

## Verified sound

**Scope, gate and dependency check.** Read all 1,482 README lines and all 274 Lean lines, the family-index change, the repository README's checklist and CONTRIBUTING. The pull request changes three files: the two roadmap files and the family index. The library checkouts match the manifest pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`); roadmaps on main were read at `8101f2c`. The worker's gate at this head passes every check; there is no gate failure to report. The dependency check, run for this review:

```text
depcheck: 228 roadmaps, 2123 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line was read; none names a later roadmap. AutomorphicFormsOnReductiveGroups, SmoothBanachRepresentations and TopologicalKTheory T6 appear only as consumers of §2.1.

**Lean.** `lake env lean` on `Suggested.lean` exits 0 with 13 `sorry` warnings and nothing else. One scratch copy carried `#check @name` for all 16 declarations; each elaborated type was compared with its README statement and nothing needs changing. `compactCharacter` keeps only the commutative-group and topology binders: its body is a real composition of a native circle character with the inclusion into ℂ, so the dropped compactness, Hausdorff and topological-group binders are not needed. The 13 theorems keep compactness and Hausdorffness, completeness and orbit continuity, the Borel structure, and continuity and unitarity where their statements use them.

**Padding probe.** The same scratch copy replaced each `sorry` by `first | simp | rfl | infer_instance | exact? | aesop`. All 13 theorems stayed open. No declaration restates a definition or mirrors a Check.

**Headlines.** The README's headline results are: the positive-scalar metric classification (§1.2); the multiplicity-space classification (§1.3); Banach G-finite density (§2.1); the four-way countability criterion (§3.1); finite-coordinate factorization and the product dual (§4.1); the character classification, uniform density and Fourier basis (§5.1); `Y = Q∨`, the dominant-character classification and the formal-character basis (§§6.5–6.7); U(2) weight recognition (§6.9); SU(2) multiplicities, realization and faithfulness (§7.1). Thirteen theorems state those statable at the pins. The module docstring names the three that are not (Layer 6's lattice equality, classification and basis; §1.3; §0.2's kernel norm identity) and the carrier each lacks; I confirmed that the pins have no root characters of a compact Lie group, no finite central cover and no continuous-kernel integral operator on a general compact space.

**Sources: the seeded sample.** No README locator is flagged unverified. Knapp2021's file pages are printed pages plus 18.

| Sampled target | What was opened, and the outcome |
| --- | --- |
| §0.2 continuous kernels | A deduction, with no textbook locator. `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:540–558` has OI-C01 to OI-C11 as cited. Tau Ceti `Compact/Convolution.lean:21,215` gives `(k*f)(x)=∫k(xy⁻¹)f(y)`, the README's `k(x,y)=f(xy⁻¹)`. |
| §1.1 Gram operators | A deduction from Mathlib Riesz duality; the convention `h(v,w)=⟨v,Tw⟩` matches the standing first-slot conjugate-linearity. |
| §1.2 scalar metrics | Knapp2021 lines 10115–10120, printed p.240: Corollary 4.9, finite-dimensional irreducible, commuting map scalar. No compactness in the proof, as the README says. |
| §1.3 multiplicity metrics | Knapp2021 lines 10109–10120, p.240: Proposition 4.8 (zero or bijective) and Corollary 4.9. Supports the block structure as stated. |
| §2.1 Banach density | Deduction from pinned declarations; all five integrated-action names and `TauCeti.representativeStarSubalgebra_dense` resolve at the pin. No source is cited for the Banach statement, correctly. |
| §3.1 countability | Etingof2024 lines 6–12 (§37.1, p.199) and lines 151–157 (Theorem 37.5, p.202) both assume a countable base; the README says so and derives the converse itself. |
| §4.1 product characters | Conway1990: see Not verifiable. The argument was checked independently (table below). |
| §6.1 torus weights | A deduction from Layer 5; Knapp2021 lines 14135–14141 (Lemma 5.106) agrees that the restriction to T splits into characters. |
| §6.3 real complexification | Deduction from `TauCeti.Hodge.complexificationConjugation` and `LinearMap.map_eigenspace_baseChange`, both present at the pin. |
| §6.4 left Weyl action | A deduction; `TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient` present at the pin. |
| §6.6 highest weights and descent | Knapp2021 lines 14203–14247, pp.335–336: Theorem 5.110 and its proof. Knapp descends from the universal cover `ℝⁿ × G̃_ss`; the README's finite cover `Z(K)^0 × K_der,sc` is that cover modulo the central lattice, and the descent step (a character trivial on the kernel) is the same. |
| §6.7 restriction | Same locator, cited “for the classification” only; the basis statement is the README's own deduction from the pinned orbit-sum expansion. |
| §6.8 classical global forms | No locator; a deduction, recomputed below. |
| §6.9 U(2) recognition | Same Theorem 5.110 locator for exhaustion, with the pinned SU(2) weight strings. |
| §7.1 SU(2) actions | Deduction from the pinned classification; `TauCeti.SU2.symPowerModel d` acts on `EuclideanSpace ℂ (Fin (d+1))` (`SU2/Exhaustion.lean:97`), so the Lean dimension `d+1` is right. |

Further Knapp locators opened: Theorem 4.29 (line 10549, pp.250–251); Proposition 4.58 (lines 11115–11136, pp.264–265), whose condition (i) is the README's `λ(H) ∈ 2πiℤ`; Proposition 4.59 (line 11137, p.265); Proposition 4.67 (lines 11241–11244, p.267); Theorem 5.107 (lines 14142–14152, p.334); the convention on p.335 (lines 14194–14202) that B is the negative of an invariant inner product and that dominance depends only on `it′₀`, as the README states.

**Library declarations opened at the pins.** A script resolved all 96 library names the README backticks against the two pinned trees; none is missing. Opened individually:

| Pin and file | What it says, and what it does not |
| --- | --- |
| Tau Ceti `RepresentationTheory/Compact/PeterWeyl.lean:137,670,677,713` | `IrrepModel` bundles a dimension, a representation on `EuclideanSpace 𝕜 (Fin dim)`, continuity, unitarity and irreducibility; `IrrepClass` is its quotient; `IrrepClass.model` chooses a representative; `stdPeterWeylBasis` has no countability hypothesis. |
| Tau Ceti `RepresentationTheory/SU2/Exhaustion.lean:97,298` | `symPowerModel d` on `Fin (d+1)`; `existsUnique_nonempty_equiv_symPower` for continuous irreducibles. The model is not asserted unitary, as the README warns. |
| Tau Ceti `RepresentationTheory/SU2/Weyl/Integration.lean:146` | `∫ f = (1/(2π)) ∫₀^π f(torusExp θ)·4sin²θ dθ`; with f=1 this is `(1/(2π))·4·(π/2)=1`, the Layer 0 example. |
| Tau Ceti `RepresentationTheory/Compact/Convolution.lean:215,320` | The convolution convention above. |
| Tau Ceti `RepresentationTheory/Continuous/TensorProduct.lean:57`, `LinHom.lean:96,276`, `Compact/Finite.lean:263,436` | The carriers of R03. |
| Tau Ceti `RepresentationTheory/Compact/DegreeSum.lean:172`, `Compact/Circle.lean:384` | `finite_irrepClass` (finite groups) and the single-circle classification: special cases, not duplicates of §3.1 or §5.1. |
| Tau Ceti `RepresentationTheory/Continuous/Pontryagin/Basic.lean:48`, `Analysis/CStarAlgebra/UnitaryCharacter.lean:40`, `Topology/Algebra/PontryaginDual.lean:47` | Character detection from an integrated form and the dual of ℤ; none states the product dual of §4.1 or the compact abelian basis of §5.1. |
| Mathlib `LinearAlgebra/RootSystem/Base.lean:456,460` | `toCoweightBasis` is a basis of the coroot space with `toCoweightBasis i = P.coroot i`, as §6.5 uses it. |

Searches by object in the pinned Tau Ceti for an orbit-finite predicate, a Pontryagin dual of a product, and countability of `IrrepClass` returned nothing.

**Cross-roadmap citations resolved (12).** CompactGroups “What is *not* consumable, and is a build item here” (`RepresentationTheory/CompactGroups/README.md:145–159`: the correspondence, character compatibility, irreducibility and intertwiner comparisons). BanachSpaceTheory B5 (lines 840–843). OperatorIdeals Part C (lines 540–558). LieGroups Layers 0, 2–5, 5A (line 641), 6 (line 673; conjugacy and exhaustion at 713; “Compact real roots and the Weyl comparison” at 750, with `t=z(g)⊕t_ss`, `dχ_α=iα`, multiplicity one and the root-system comparison) and 7's “Compact semisimple integration” (lines 883–890: compact simply connected cover, finite π₁). ConvexityToric T1 (`SymplecticGeometry/ConvexityToric/README.md:40–51`: `(2π)⁻¹ker(exp)`, characters by `(1/i)dχ`, `exp(2πα∨)=1`, the integer pairing, the finite-index comparison and the U(2) coupling). LieHighestWeight Layers 7 and 9 (present on main and at both open heads). CharacteristicClasses C5 (line 1344). TopologicalKTheory T6 (line 1202). Completed/OrthogonalL2Bases Part B. CharacterTheory Layers 0–4. AutomorphicFormsOnReductiveGroups §§2.1 and 2.7 and SmoothBanachRepresentations §4.1, at their open heads, as consumers.

**Ownership against open work.** `roadmaps grep` over the open heads and main for G-finite density, the product dual, the countable dual and `Y = Q∨`. Banach density has one owner: AutomorphicFormsOnReductiveGroups, NoncompactQuantumSymmetry, IndexTheory and TopologicalKTheory all record it as the contract `gap:banach-gfinite-density` with the names `IsGFinite`, `gFiniteSubmodule` and `gFiniteSubmodule_dense` that this file declares. `Y = Q∨` also appears in LieHighestWeight Layer 10 on main; the README states why §6.5 proves it for compact groups from T1 and the pinned modules, and the description says no open revision need merge first. The overlap list reports no competing change, no dropped id and no id defined only by an open revision.

**Adversarial mathematics.** Recomputed for this review.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: coefficient versus trace | scalar circle action at i | coefficient `⟨i·1,1⟩ = −i`; trace i | conjugate, as stated | none |
| §0.1 dual and tensor characters | C₃ with value ω | dual `ω⁻¹=ω²`; tensor square `ω²`; original ω | dual distinguished from original | R03: cite pinned carriers |
| §0.2 norm identity | two points of mass 1/2, k=1; k₁₂=i only; μ=0 | energy 1 = `4·1/4`; entry i/2, adjoint entry −i/2 at (2,1), both squared norms 1/4; 0=0 | equal | none |
| §0.2 convolution | pin convention | `k(x,y)=f(xy⁻¹)` on both sides | agrees with pin | none |
| §1.1 Gram form | T=2I on ℂ; T=0; swap action with diag(1,2) | h(1,i)=2i (wrong slot −2i); 0 not positive; 2≠1 so not invariant | conventions fixed | none |
| §1.2 `positive_selfIntertwiner_existsUnique_scalar` | ℂ with T=2I; trivial ℂ² with diag(1,2); V=0 | c=2 unique; nonscalar but reducible; V=0 fails irreducibility | true on tests | none |
| §1.3 block change | U=diag(1,i), A=[[1,1],[1,2]] | `UAU†`: (1,2) entry `1·1·(−i)=−i`, (2,1) entry i; `U†AU` has the opposite signs | direction fixed | none |
| §1.3 finite average | C₃, trivial action | `(1/3)·3h = h`; unnormalized 3h | factor needed | R03: cite `integral_haarProb` |
| §2.1 `IsGFinite`, `gFiniteSubmodule` | 0; trivial vector over 𝔽₂; modes 0 and 1 on C(S¹); ℤ on ℓ²(ℤ) | orbit-span dimensions 0, 1, 2, ∞ | positive and negative examples | none |
| §2.1 `gFiniteSubmodule_dense` | E=0; rotations on C(S¹) | closure of 0 is 0; `‖R_θ−I‖=2` for θ≠0 by a bump with values 1 and −1, yet polynomials are dense | orbit continuity, not norm continuity | none |
| §2.1 covariance | S₃, f=6δ_t, h=(12), t=(23) | `T_f=(1/6)·6·π(t)`; `ht=(123)`, `th=(132)` | order as stated | none |
| §2.1 error estimate | C_π, ‖v‖≠0 | `C_π·(ε/(2C_π‖v‖))·‖v‖ = ε/2`; total ε | denominator nonzero | none |
| §3.1 two Lean headlines | trivial G; C₃; `Circle^J`, J uncountable | dual sizes 1, 3, uncountable; second countable and separable L²: true, true, false | both directions agree | none |
| §3.1 B5 application | empty basis; ℕ; uncountable J | separable = countable = true, true, false; distinct basis vectors at squared distance 2 | matches B5 on main | none |
| §3.1 Borel versus cylinder | empty J; uncountable J | {∅,G}; complement of a point is open but depends on every coordinate | full Borel needed | none |
| §4.1 `character_finite_coordinates` | empty J; `Circle²` exponents (1,−1) at (i,−1); S₃×C₃ | F=∅ gives 1; `i·(−1)⁻¹=−i`; `−1·ω=−ω` | noncommutative factors allowed; tail subgroup maps into the arc and is trivial | none |
| §4.1 `exists_productDualEquiv` | generator at j evaluated at x | `χ(x_j)`; product of generators gives `∏χ_i(x_i)` | equation pins e | none |
| §4.1 `circleProduct_character` | n=−1 versus 1 at i; n=0 | −i versus i; 1 | n unique | none |
| §4.1 topologies | `χ_n` on `Circle^ℕ` at constant −1 | −1 for every n; coordinatewise limit trivial | three topologies differ | none |
| §5.1 `exists_irrepClass_characterEquiv` | C₃; trivial group; ℂ² and 0 | 3 classes of dimension 1; 1 class; excluded by irreducibility | true on tests | none |
| §5.1 `exists_characterBasis`, sign | Circle at i; C₃ | coefficient of χ is −i, vector `c_χ` is i, so `c_χ` belongs to `χ⁻¹`; `(1+ω+ω²)/3=0`, diagonal 1 | orthonormal, reindexed by inverse | none |
| §5.1 `compactCharacter_span_dense` | trivial group; C₃ | span dimension 1 = dim C(G); rank 3 = 3 | true on tests | none |
| §5.1 Parseval | `f=c_χ+2c_ψ` | coordinates 1, 2; both sides 5 | equal | none |
| §6.1 formal character | `z↦z⁻¹`; trivial ℂ²; `t·t⁻¹`; `−e⁰` | weight −1, trace −i at i; `2e⁰`; product 1 with traces i·(−i)=1; negative coefficient, no representation | carrier and duality pinned | none |
| §6.2 period map | Circle, `χ=zⁿ`; functional 1/2; n=−1 at π/2 | `ℓ(2π)=2πn`; `exp(iπ)=−1`; `exp(−iπ/2)=−i` versus `exp(−π/2)` without the i | T1 normalization | none |
| §6.3 conjugation | rotation plane, `v=e₁−ie₂` | weight +1; `c(v)=e₁+ie₂` weight −1; `c(iv)=−ic(v)` | opposite weights, semilinear | none |
| §6.4 Weyl action | SU(3), s₁=(12), s₂=(23) | `n_σ⁻¹tn_σ e_j = t_{σ(j)}e_j`; `(s₁s₂)·e₁=e₂`, `(s₂s₁)·e₁=e₃`; `w₁·(w₂·χ)(t)=χ(n₂⁻¹n₁⁻¹tn₁n₂)` | left action | none |
| §6.5 `Y = Q∨` | SU(2); SO(3); trivial group | `α_ℝ∨=diag(i,−i)`, `exp(2πα_ℝ∨)=I`, `exp(πα_ℝ∨)=−I`, so `Y=ℤα_ℝ∨`; fundamental weight pairs to 1, and to 1/2 with half the coroot; SO(3): `Y=(1/2)ℤα_ℝ∨`; 0=0 | needs simple connectedness; both inclusions use only T1 and the pinned modules | none |
| §6.5 cover and descent | U(2); Circle; SO(3) | kernel {(1,I),(−1,−I)}, scalar `(−1)^(q+a)`: (1,1) descends, (0,1) does not; kernel sizes 1 and 2 | congruence, not a split | none |
| §6.5 dominance | SU(2), `χ=zⁿ` | `λ(H)=(iℓ)(−iα_ℝ∨)=ℓ(α_ℝ∨)=n`; dominant iff n≥0 | matches `IsDominantIntegral` | none |
| §6.6 descent | SU(2) weights 1, 2 to SO(3); U(2) weights (1,0), (2,1) | −I acts by −1, +1; central characters z and z³, i versus −i at z=i | central character needed | none |
| §6.7 basis | SU(2) | `χ₂=m₂+m₀`, `χ₀=m₀`, determinant 1; `t²+t⁻²=χ₂−χ₀` | integral basis, not a positive cone | none |
| §6.8 U(n) congruence | U(3), λ=(2,1,−1); weight (1,0) with q=0 | q=2, a=(1,2), `1+4=5≡2 mod 3`; kernel scalar `ζ⁰·ζ⁻¹≠1` | congruence as stated | none |
| §6.9 `u2_weight_character_iff` | (2,0),(1,1),(0,2) with 1,2,1; (1,−1),(−1,1); δ at (−1,−1); δ at (1,0); f=0 | differences 1,1, dimension 4; `0≥1` fails at (0,0); `det⁻¹` at diag(i,−1) is `(−i)·(−1)=i`; symmetry fails; n=0 | both directions | none |
| §7.1 `su2_multiplicities_and_faithfulness` | n=0; Sym¹⊕Sym¹; Sym² | m=0, not injective, no odd d; `2·2=4`, kernel {I}; z=−1 acts by 1,1,1, kernel {±I} | uniqueness from the character equation; dimension from the value at 1 | none |
| §7.1 `exists_su2_of_multiplicities` | m=0; m₁=2 | dimension 0; dimension 4 | realized | none |
| §7.1 partition count | n=2,3,4 | `2−1`, `3−2`, `5−2` = 1, 1, 3 | as stated | none |

37 rows. No counterexample to any statement was found; R03 concerns citation of pinned objects, not different formulas.

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, second edition, VII.9, Exercises 8–11, cited for §§4.1 and 5.1. The manifest records it as uncertified (paywalled); it is cited by locator alone and was not requested again. Exercise numbering and hypotheses are unchecked; the mathematics of both sections was checked independently above.
- Board packages: the board lists no package under review that plans compact-group representation theory; open pull requests were searched through the roadmap index of 2026-11-10 only.

## Source issues

- **Gap** in Knapp2021 at Proposition 4.67, printed p.267: the source says the index formula follows by combining two earlier results, without an argument; it should give the injectivity of character pullback and both index bounds; affects the proof; corrected in print at the corrections list of the digital second edition, entry for page 267 (Knapp2021 line 34709).
