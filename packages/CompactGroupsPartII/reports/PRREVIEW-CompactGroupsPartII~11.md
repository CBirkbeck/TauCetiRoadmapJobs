# Review of CompactGroupsPartII (pull request #1047 at bc17800)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. This is a full review of the head `bc17800`, which is the head the previous review read: nothing has changed since. Three P3 findings, none blocking. Two are carried from the previous report and lie outside the folder (the family index, which belongs to this nested pull request, and the generated block of the description). The third is new: one supplier declaration is listed without its file. The mathematics, the sources, the pinned declarations and the Lean file were all checked again and are sound.

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md` and Lean locations to `Suggested.lean` in the same folder.

## R01 (P3) — The family index still says “representation rings” and names a highest-weight supplier (previous R01, not repaired)

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:52–53`: “global forms and representation rings, and unitary SU(2) actions”. Lines 99–102: “for its global forms the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** These lines describe this roadmap's scope and its suppliers.

**Witness.** README:60–65 says this roadmap “constructs no Grothendieck ring of representations”; README:392–393 says the highest-weight theory “is consumed through the Mathlib and Tau Ceti declarations listed above”. The index is unchanged since `2a23724`.

**Repair.**
- Replace “global forms and representation rings” with “global forms and their formal characters”, and add “unitary equivalence from characters” after “invariant Hermitian metrics”.
- Rewrite the dependency line: the global forms use LieGroups Layers 0, 2–5, 5A, 6 and 7, ConvexityToric T1's period dictionary and the pinned highest-weight modules; Layer 3 uses BanachSpaceTheory B5.

The file is outside the roadmap folder but is this nested pull request's own, so the edit is a commit to the family index on this branch.

## R02 (P3) — The generated `roadmap-summary` block still names the representation ring and the highest-weight roadmap (previous R02, not repaired)

**Location.** The `roadmap-summary` block of the description: “the representation ring of a compact connected group with its restriction to a maximal torus” and “the highest-weight roadmap's dominant integral classification”.

**Claim.** The block describes this roadmap's scope and its suppliers.

**Witness.** As in R01. The block also omits two stated headlines: §0.2's energy identity (`Suggested.lean:53`) and §1.4's unitary equivalence (`Suggested.lean:86`). The author-written part of the description is accurate at this head (3 definitions and 15 theorems counted; all consumed roadmap contracts are on main).

**Repair.** Regenerate `roadmap-summary` from this head. It should name:
- the formal-character basis of `ℤ[X]^W` in place of the representation ring;
- the continuous-kernel energy identity and unitary equivalence from equal characters, with the U(n)-conjugacy classification of unitary SU(2) actions;
- the actual suppliers: LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; BanachSpaceTheory B5; and the pinned highest-weight modules.

## R03 (P3) — `TauCeti.fourierPontryaginDualEquiv` is listed without its file, under a bullet for another file

**Location.** README:297–299: “`Compact/FourierPeterWeyl.lean`: `TauCeti.fourierPeterWeylIndexEquiv` and `TauCeti.peterWeylFamily_fourierIrrepModel`, including the sign −n. `TauCeti.fourierPontryaginDualEquiv` supplies the single-circle dual.”

**Claim.** By README:189 (“Paths in this list are below `TauCeti/RepresentationTheory/` unless given in full”) the declaration is read as living in `Compact/FourierPeterWeyl.lean`.

**Witness.** At the pin the declaration is `TauCeti/Analysis/Fourier/AddCircle.lean:364`, of type `Multiplicative ℤ ≃* PontryaginDual (Multiplicative (AddCircle T))`. The name does not occur in `Compact/FourierPeterWeyl.lean` or anywhere else under `TauCeti/RepresentationTheory/`.

**Repair.** Give it its own clause with the full path, for example: “`TauCeti/Analysis/Fourier/AddCircle.lean`: `TauCeti.fourierPontryaginDualEquiv`, the group isomorphism `Multiplicative ℤ ≃* PontryaginDual (Multiplicative (AddCircle T))`, supplies the single-circle dual.” §4.1 already says how it is consumed (with `AddCircle.homeomorphCircle` at period 2π), so nothing else changes. This was the only one of the 120 library names in the README whose file disagrees with the pin.

## Previous findings

- Previous R01 (family index) — not repaired; the head is unchanged. See R01.
- Previous R02 (`roadmap-summary` block) — not repaired; the description is unchanged. See R02.

## Verified sound

### Gate and dependency check

The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`).

I re-ran the gate with the brief's command. It printed `depcheck: NOT IN ORDER: CompactGroupsPartII` and `outside-folder: TauCetiRoadmap/RepresentationTheory/README.md`. Neither is a defect of the head: the gate's default order does not list this roadmap while the candidate order does (line 404), and the family index is this nested pull request's own.

The dependency check against the candidate order printed:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The branch manifest pins the same Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`) revisions as main. `git diff --stat origin/main...HEAD` lists three files: the two roadmap files and the family index.

### Lean

- `lake env lean` on `Suggested.lean`: 15 `sorry` warnings and nothing else. The file has 3 definitions and 15 theorems, a single `import Mathlib` followed by three `TauCeti.*` modules that are all used, no `set_option`, no sorry'd data.
- I compared the elaborated type of each of the 18 declarations with its README statement. The tools flag `compactCharacter` as having lost `[IsTopologicalGroup G]`, `[CompactSpace G]` and `[T2Space G]`: its body needs none of them (it is the coercion of a continuous character into ℂ), and README:1010 defines it for any χ in `PontryaginDual G`, so nothing is missing. Every theorem carries its compactness, Hausdorff, completeness, finite-dimension and unitarity hypotheses in its own signature.
- One-tactic probe: on a scratch copy I replaced every `sorry` by `first | rfl | infer_instance | trivial | simp | exact?`. All 15 theorems stay open. Nothing is padding; the three definitions are each needed by a stated headline.

### Headline theorems

Stated: §0.2 energy identity; §1.2 scalar metrics; §1.4 unitary equivalence; §2.1 Banach density with its two definitions; §3.1 (two); §4.1 (three); §5.1 (three, with `compactCharacter`); §6.9; §7.1 (two, which with §1.4 give the U(n)-conjugacy classification). Named in the module docstring as not statable: the §§6.5–6.7 lattice equality, classification and formal-character basis (the pins have no root characters, positive system, finite central cover or formal character of a continuous representation for a general compact connected Lie group) and the full §1.3 comparison. No statable headline is absent and none is stated through a stand-in.

### Sources: the seeded sample

The README flags no locator as unverified. In Knapp2021 the PDF page is the printed page plus 18; in Etingof2024 the printed pages are 199–204.

| Target | Locator in the README | Checked at | Result |
| --- | --- | --- | --- |
| §1.2 | Knapp, Corollary 4.9, p.240 | Knapp2021 lines 10115–10120 (printed 240) | an operator commuting with an irreducible finite-dimensional representation is scalar; supports the deduction |
| §1.3 (touching §1.2) | Proposition 4.8 and Corollary 4.9, p.240 | lines 10109–10120 | Schur's lemma in both forms |
| §6.1 | Corollary 4.7, p.240; example after Corollary 4.9, p.241 | lines 10101–10104, 10123–10127 (printed 241) | complete reducibility; abelian irreducibles are one-dimensional |
| §6.2 (used by §6.5) | Proposition 4.58, pp.264–265 | lines 11115–11136 | condition (i) is `λ(H) ∈ 2πiℤ` when `exp H = 1`; (ii) the character `ξ_λ`; as restated |
| §6.5 | Theorem 4.29, pp.250–251 | lines 10549–10560 | `(Z_G)_0` and `G_ss` closed, `G = (Z_G)_0 G_ss`, as restated |
| §6.5 | Proposition 4.59, p.265 | lines 11137–11141 | analytically integral implies `2⟨λ,α⟩/|α|² ∈ ℤ` |
| §6.5 | Proposition 4.67, p.267 | lines 11241–11245 | index of integral forms equals the order of the covering kernel |
| §6.5 | Theorem 5.107 and proof, p.334 | lines 14142–14152 | simply connected compact semisimple: algebraically integral implies analytically integral; the README's route through fundamental modules is its own and is correct |
| §6.5 | dominance, p.335 | lines 14194–14202 | negative of the invariant form; dominance depends only on `it'_0` |
| §§6.5, 6.6, 6.9 | Theorem 5.110 and proof, pp.335–336 | lines 14203–14247 | the bijection with dominant analytically integral forms; the descent through the centre of the cover is on p.336 |
| §3.1 | Etingof §37.1, p.199; Theorem 37.5, p.202 | Etingof2024 lines 6–11, 151–157 | both assume a countable base, as the README says |
| §§0.1, 0.2, 1.4, 6.3, 6.4, 6.8, 7.1 | none: each is stated as a deduction from pinned declarations and earlier targets | the declarations below | inputs exist with the stated hypotheses |
| §§4.1, 5.1 | Conway VII.9, Exercises 8–11 | — | see Not verifiable |

### Pinned declarations opened

All 120 library names backticked in the README resolve at the pins, and each file path the README gives agrees with the pin except the one in R03. Those I opened for content:

- `TauCeti/RepresentationTheory/Compact/Convolution.lean:214–215`: `convolutionCLM k f x = ∫ y, k (x * y⁻¹) * f y`, so §0.2's kernel `k(x,y)=f(xy⁻¹)` is the right one (not `f(y⁻¹x)`); `convolutionOperator` at :320.
- `TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean:89, 141, 150, 212, 231, 269` and `Columns.lean:105, 158, 163, 171`: energy in `ℝ≥0∞`, adjoint and basis independence, the column operator with its bound.
- `TauCeti/RepresentationTheory/Compact/PeterWeyl.lean:137–147, 670, 677`: `IrrepModel` (dimension, continuous unitary irreducible action on `EuclideanSpace 𝕜 (Fin dim)`), `IrrepClass` as its quotient, `IrrepClass.model`.
- `TauCeti/RepresentationTheory/Continuous/Unitary/Equivalence.lean:51–54` (irreducible source and a given equivalence); `Semisimple.lean:63–66` (`[CharZero k]`, both finite-dimensional, a monoid); `Continuous/Intertwining.lean:155`; `Continuous/LinHom.lean:276–278` (character `χ_π(g⁻¹)·χ_ρ(g)`); `Continuous/Character.lean:120`; `Continuous/TensorProduct.lean:57, 74`; Mathlib `RepresentationTheory/Continuous/Basic.lean:439` (`ContRepresentation.trivial`).
- `TauCeti/Geometry/Lie/Subgroup/Torus.lean:82–89, 214, 241–242` (a torus is a compact connected commutative subgroup; maximal means `Maximal IsTorus`; no closedness in the definition) and `Weyl/Finite.lean:194`.
- `TauCeti/Analysis/Matrix/UnitaryGroup/Torus.lean:175`, `MaximalTorus.lean:66, 101`, `Weyl.lean:131–135, 161, 176`; `TauCeti/LinearAlgebra/Matrix/UnitaryGroup/Basic.lean:49–51` (`permutationUnitary σ` is the permutation matrix of `σ⁻¹`).
- `TauCeti/RepresentationTheory/SU2/Weyl/Integration.lean:146–149` (`(1/(2π))∫₀^π f·4 sin²θ`), `SU2/Weight.lean:134`, `SU2/Exhaustion.lean`.
- Mathlib `Analysis/SpecialFunctions/Complex/Circle.lean:435, 483`; `RepresentationTheory/Irreducible.lean:91`; `Topology/Algebra/InfiniteSum/ENNReal.lean:568`; `RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:341`; `LinearAlgebra/RootSystem/Base.lean:456–461`; `MeasureTheory/Function/ContinuousMapDense.lean:352` (`ContinuousMap.toLp_denseRange` needs `[μ.WeaklyRegular]`: the README uses it only for Haar measure and §0.2 deliberately avoids it).

### Duplication by object

- Pinned Tau Ceti and Mathlib: no orbit-finite predicate or Banach density; no dual of a product of groups; no countability criterion for `IrrepClass` beyond the finite-group `finite_irrepClass`; no Hilbert–Schmidt energy of a kernel operator; no Hilbert basis indexed by `PontryaginDual`; no faithfulness criterion for SU(2); unitary replacement of an equivalence only for an irreducible source. None of the 15 theorems is already proved.
- Roadmaps: the base CompactGroups README on main plans none of Part II's targets (no Banach, G-finite, metrizability, Pontryagin or global-form target; its Layer 5 keeps only the continuous-kernel-to-Hilbert–Schmidt step, which README:70–74 distinguishes). A search of the open heads finds no second owner of any `Suggested.lean` name. ClassicalGroups treats characters of algebraic `GLₙ` as symmetric Laurent polynomials; §6.8 is the compact U(n) statement on formal characters of the pinned diagonal torus, a different carrier.
- The consumers of the density theorem (AutomorphicFormsOnReductiveGroups §2.1, NoncompactQuantumSymmetry, SmoothBanachRepresentations §4.1, IndexTheory, and TopologicalKTheory T6 on main) record it as `gap:banach-gfinite-density` against CompactGroups and quote the conclusion `Dense (gFiniteSubmodule π.toRepresentation : Set E)`, which is `Suggested.lean:148–152` verbatim. None of them owns it, and this README cites none of them as a supplier.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision.

### Cross-roadmap citations resolved (on main unless stated)

- CompactGroups: “What is not consumable, and is a build item here” (README:145), with the forgetful correspondence and irreducibility comparison.
- LieGroups: Layer 0 (:252), Layer 2 (:356; the link fragment `#layer-2-the-closed-subgroup-cartan-theorem` matches the heading), Layers 3–5 (:446, :463, :518), Layer 5A (:641, metric, splitting, negative-definite Killing form), Layer 6 “Compact real roots and the Weyl comparison” (:750: `t=z(g)⊕t_ss`, `χ_α`, `dχ_α=iα`, multiplicity one, comparison with `rootSystem`) and conjugacy (:737–741), Layer 7 “Compact semisimple integration” (:883, compact cover, finite π₁).
- SymplecticGeometry/ConvexityToric T1 (:218–228): `Λ_Z=(2π)⁻¹ker(exp)`, characters as `(1/i)dχ`, `α_χ(λ)/(2π)∈ℤ`, `exp(2πα∨)=1`, the isogeny comparison.
- BanachSpaceTheory B5 (:841–842): separable iff the index of a Hilbert basis is countable.
- TopologicalKTheory T6 (:1202); OperatorTheory/OperatorIdeals Part C (:531); LieHighestWeight Layers 7 and 9 (:931, :1432); CharacteristicClasses C5 item 1 (:1344–1346); Completed/OrthogonalL2Bases Part B (:245); CharacterTheory Layers 0–4 (:260–713).
- At open heads: AutomorphicFormsOnReductiveGroups §2.1 and §2.7; SmoothBanachRepresentations §4.1; NoncompactQuantumSymmetry M0 (`H_τ≅τ⊗Hom_K(τ,H)`); AutomorphicSpectralTheory §0.8 (measurable kernels on σ-finite standard Borel spaces). These are named as owners or consumers, never as suppliers.

### Adversarial mathematics

Each row gives the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_kernelOperator_hilbertSchmidtEnergy` | two points of mass ½: k=1; k(1,2)=i; μ=0; Dieudonné measure on [0,ω₁] | projection of rank 1, energy 1 = 4·¼; entry i/2, energy ¼ = 1·¼; `Lp`=0, 0=0; `A_k`=k(ω₁,ω₁) on constants, both sides `|k(ω₁,ω₁)|²` | true, without regularity | none |
| §0.2 operator bound | Cauchy–Schwarz twice | `|A f(x)| ≤ sup|k|·μ(X)^½‖f‖₂`, so `‖A‖ ≤ μ(X) sup|k|` | as stated | none |
| §0.2 convolution bullet | pinned formula | `∫ k(xy⁻¹)f(y)` = kernel `f(xy⁻¹)`; on S₃ the other order `f(y⁻¹x)` differs | matches the pin | none |
| `positive_selfIntertwiner_existsUnique_scalar` | ℂ, T=2I; trivial ℂ², diag(1,2); V=0 | c=2 (c=1 gives 2≠1); reducible, hypothesis fails; excluded by `IsSimpleOrder` | true | none |
| `exists_linearIsometryEquiv_of_character_eq` | SU(2): g and ḡ; ℤ: diag(1,(−1)ⁿ) and Sⁿ; unipotent ℤ-action | J g J⁻¹=ḡ with traces a+ā; B=[[1,1],[1,−1]], B†B=2I, B/√2 unitary; character 2 but `‖(1,1)‖=√2`, not unitary | true; unitarity needed | none |
| §1.3 base change | U=diag(1,i), A=[[1,1],[1,2]] | UAU†=[[1,−i],[i,2]]; U†AU=[[1,i],[−i,2]] | direction fixed | none |
| `IsGFinite`, `gFiniteSubmodule_dense` | 0; trivial action over 𝔽₂; modes 0 and 1 on C(S¹); ℤ on ℓ²(ℤ); E=0 | orbit-span dimensions 0, 1, 2, ∞; `‖R_θ−I‖=2` yet orbits continuous; dense trivially | true without norm continuity | none |
| §2.1 covariance Check | S₃, h=(12), t=(23) | ht: 1→2→3→1 = (123); th = (132) | as stated | none |
| `secondCountable_iff_countable_irrepClass`, `separable_L2_iff_countable_irrepClass` | trivial group; C₃; Circle^ℕ; Circle^J, J uncountable | 1 class; 3 classes; dual `ℕ →₀ ℤ` countable; `‖χ_j−χ_k‖₂²=2`, uncountably many separated vectors, not metrizable | both sides agree | none |
| `character_finite_coordinates` | J=∅; S₃×C₃, sign·ω | F=∅, value 1; value −ω at ((12),g); tail subgroup lies in the arc, so is killed | true for non-abelian factors | none |
| `exists_productDualEquiv`, `circleProduct_character` | Circle², n=(1,−1) at (i,−1); coordinate characters on Circle^ℕ at the constant −1 | i·(−1)⁻¹=−i; each value −1, so no convergence to 1: discrete, not the subspace topology | as stated | none |
| `exists_irrepClass_characterEquiv`, `exists_characterBasis` | Circle at i; C₃; f=c_χ+2c_ψ | coefficient ⟪i·1,1⟫=−i, trace i, so c_χ is the block of χ⁻¹; (1+ω+ω²)/3=0; Parseval 1+4=5 | true | none |
| `compactCharacter_span_dense` | trivial group; C₃ | span = ℂ = C(G); 3 characters span ℂ³ | true | none |
| §6.2 | z⁻¹ at θ=π/2; functional ½ | exp(−iπ/2)=−i (not exp(−π/2)); exp(iπ)=−1 at the period 2π | as stated | none |
| §6.3 | rotation plane, v=e₁−ie₂ | R_θv=e^{iθ}v, weight +1; c(v)=e₁+ie₂, weight −1; c(iv)=−ic(v) | as stated | none |
| §6.4 | SU(3), s₁=(12), s₂=(23) | `n_σ⁻¹tn_σ e_j=t_{σ(j)}e_j`, so σ·e_i=e_{σ(i)}; (s₁s₂)·e₁=e₂, (s₂s₁)·e₁=e₃; orbit of (1,1,0) has 3 elements | left action, matches the pinned `permutationUnitary` | none |
| §6.5 | SU(2), SO(3), U(2) | exp(2πH_R)=I, exp(πH_R)=−I: Y=ℤH_R=Q∨; SO(3): Y=½ℤH_R; `λ_χ(H_α)=(iℓ_χ)(−iα_ℝ∨)=ℓ_χ(α_ℝ∨)`; kernel scalar (−1)^{q−a}: (1,1) descends, (0,1) does not | as stated | none |
| §6.6 | U(2), (1,0) and (2,1) | derived coordinate 1 both; central z and z³: i and −i at z=i; q−a = 0 and 2 | central exponent separates | none |
| §6.7 | SU(2) | χ₂=t²+1+t⁻²=m₂+m₀; t²+t⁻²=χ₂−χ₀ | unitriangular; positivity not implied | none |
| §6.8 | U(3), λ=(2,1,−1); (1,0) with q=0; general n | q=2, a=(1,2), 1+2·2=5≡2 mod 3; ζ⁰·ζ⁻¹≠1; `Σ i a_i = q − nλ_n ≡ q` | congruence correct | none |
| `u2_weight_character_iff` | {(2,0):1,(1,1):2,(0,2):1}; {(1,−1),(−1,1)}; {(−1,−1)}; f=0 | m(2,0)=1, m(1,1)=2−1=1, dimension 3+1=4; f(0,0)=0<1 fails; trace at diag(i,−1) is 1/(−i)=i; n=0 | both directions; `m(a,b)=f(a,b)−f(a+1,b−1)` telescopes | none |
| `su2_multiplicities_and_faithfulness` | n=0; Sym²; Sym¹⊕Sym¹; Sym⁰⊕Sym¹ | not injective, no odd d; −I acts by (−1)²=1; kernel {I}, 2·2=4; injective, n=3 | iff agrees | none |
| `exists_su2_of_multiplicities`, §7.1 count | m=δ₂; n=2, 3, 4 | dimension 3; p(n)−p_odd(n) = 2−1, 3−2, 5−2 = 1, 1, 3 | true | none |
| Layer 0 Examples | Weyl integration of 1 | (1/(2π))·4·(π/2)=1, the pinned normalisation | as stated | none |
| R03 | `fourierPontryaginDualEquiv` | defined in `Analysis/Fourier/AddCircle.lean:364`; 0 occurrences under `RepresentationTheory/` | path missing | R03 |

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1 and 5.1). The manifest records it as uncertified (paywalled), so it is cited by its locator alone and I did not check the exercise numbers against the text. Both sections are proved in the README from pinned declarations and do not depend on the exercises.

## Source issues

- none
