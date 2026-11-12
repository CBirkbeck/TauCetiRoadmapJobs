# Review of CompactGroupsPartII (pull request #1047 at 562ebbd)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. This is a full review of the head that the previous report read incrementally. There are seven findings. One is blocking (R01, P2): a headline that the module docstring calls unstatable is in fact statable at the pins. The other six are P3. R06 and R07 are the previous report's two findings, which are still open (R07 only in part).

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md` and Lean locations to `Suggested.lean` in the same folder.

## R01 (P2) — The continuous-kernel identity of §0.2 is statable at the pins but is missing from `Suggested.lean`

**Location.** `Suggested.lean:27–29`: “the continuous-kernel norm identity: the pins have the Hilbert–Schmidt energy and norm of an operator but not the integral operator of a continuous kernel on a compact space with a finite Borel measure.”

**Claim.** The headline cannot be stated without a named kernel operator, so the docstring lists it among the headlines that cannot be stated.

**Witness.** The statement below, pinned by its pointwise formula as `exists_characterBasis` is pinned by its vectors, elaborates at the pins with one extra import, `TauCeti.Analysis.InnerProductSpace.HilbertSchmidt.Basic`. The only warning is `sorry`.

**Repair.** State it in a Layer 0 section of `Suggested.lean`, name it in §0.2 of the README, and delete the third bullet of the module docstring:

```lean
/-- The integral operator of a continuous kernel on a compact Hausdorff space with a finite
regular Borel measure has Hilbert–Schmidt energy equal to the L² mass of the kernel. -/
theorem exists_kernelOperator_hilbertSchmidtEnergy
    {X ι : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
    [MeasurableSpace X] [BorelSpace X] (μ : Measure X) [IsFiniteMeasure μ] [μ.Regular]
    (k : C(X × X, ℂ)) (b : HilbertBasis ι ℂ (Lp ℂ 2 μ)) :
    ∃ A : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ,
      (∀ f : Lp ℂ 2 μ, (A f : X → ℂ) =ᵐ[μ] fun x => ∫ y, k (x, y) * f y ∂μ) ∧
      A.hilbertSchmidtEnergy b = ∫⁻ p, ‖k p‖ₑ ^ 2 ∂(μ.prod μ) := by
  sorry
```

I tested it on the README's own Checks. On two points of mass 1/2 with k = 1, the energy is 1 and the lintegral is 4·(1/4) = 1. With μ = 0, `Lp` is zero, so ι is empty and both sides are 0. The almost-everywhere formula determines A, so the existential is not vacuous. A continuous k is a uniform limit of finite sums a(x)b(y), which is the README's Stone–Weierstrass step (README:423–425). It is therefore measurable for the product σ-algebra, and the lintegral is the true integral even when X is not second countable.

## R02 (P3) — The pins do have a maximal-torus conjugacy theorem, for U(n), and §§6.8–6.9 do not cite the pinned U(n) torus

**Location.** README:282–283: “The pins have no root characters, positive system or conjugacy theorem for maximal tori.” Related lines: README:1287–1290 (§6.7 routes “every element of K is conjugate into T” through LieGroups Layer 6), the *Needs* line of §6.8 (README:1355–1361, “then apply the fundamental theorem of symmetric polynomials”), and the *Needs* line of §6.9 (README:1421–1423).

**Claim.** The pins have no conjugacy theorem for maximal tori, so every U(n) and U(2) input goes through LieGroups Layer 6.

**Witness.** Tau Ceti `Analysis/Matrix/UnitaryGroup/MaximalTorus.lean:66,101` (`TauCeti.isMaximalTorus_unitaryTorus`, `TauCeti.exists_map_conj_eq_of_isMaximalTorus`), `Torus.lean:175` (`TauCeti.exists_isConj_unitaryTorusHom`), `Weyl.lean:176` (`TauCeti.unitaryTorusNormalizerQuotientMulEquivPerm`: the Weyl group of U(n) is `Equiv.Perm (Fin n)`).

**Repair.**
- Qualify the sentence at README:282–283 with “for a general compact connected Lie group”.
- Add to the Tau Ceti contract the four declarations above and `TauCeti.unitaryTorusNormalizer_mul_unitaryTorusHom_mul_inv` (`Weyl.lean:131`).
- Cite them in §6.8 (the U(n) torus, with W = S_n acting by permutation) and in §6.9 (the symmetry `f(a,b)=f(b,a)`, and the fact that the trace on the diagonal torus determines the representation).
- In §6.8, replace “the fundamental theorem of symmetric polynomials” with Mathlib `MvPolynomial.esymmAlgEquiv` (`Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:341`).

I checked that the convention carries over unchanged. The pinned law `g·diag(z)·g⁻¹ = diag(z ∘ σ⁻¹)` is the README's `n_σ⁻¹ diag(t) n_σ = diag(t_{σ(1)},…,t_{σ(n)})` (README:99–101). For SU(3) both give (s₁s₂)·e₁ = e₂ and (s₂s₁)·e₁ = e₃.

## R03 (P3) — §0.2 depends on OperatorIdeals Part C targets that the pinned Tau Ceti already proves

**Location.** README:421–422: “This is a deduction from OperatorTheory/OperatorIdeals Part C, specifically OI-C01–OI-C11”. The same dependency appears in the *Needs* line (README:438), in Layer 0's Dependencies (README:473), and in the supplier contract (README:331–332, “supplies Hilbert–Schmidt operators and their compactness for Layer 0”).

**Claim.** The Hilbert–Schmidt column theory is supplied by a roadmap.

**Witness.** Tau Ceti `Analysis/InnerProductSpace/HilbertSchmidt/Columns.lean` proves it: `norm_columnOperator_apply_le` (:163, OI-C10), `tsum_norm_columnOperator_apply_self_sq` (:171, OI-C11), `hilbertSchmidtEnergy_columnOperator` (:221, OI-C12) and `existsUnique_columnOperator_eq` (:241, OI-C08). `Basic.lean:141` has `hilbertSchmidtEnergy_adjoint`.

**Repair.**
- Wherever README:422, 438 and 473 cite “OI-C01–OI-C11”, cite the pinned `HilbertBasis.*` declarations above instead.
- Add `ContinuousLinearMap.norm_le_hilbertSchmidtNorm` (`Basic.lean:269`, needed for the completion step) and `ContinuousLinearMap.hilbertSchmidtEnergy_adjoint` (needed for the adjoint bullet), and list all of them under “From Tau Ceti”.
- Remove OperatorIdeals Part C from the supplier contracts. The Scope sentence that names it as the owner of the generic theory can stay.
- Compactness (OI-C14) is not used by Layer 0, so drop “and their compactness”.
- Adjust the description's sentence “OperatorTheory/OperatorIdeals Part C supplies the general Hilbert–Schmidt theory used for the continuous-kernel norm comparison” to match.

The README's third Check of §0.2 already exercises one of these declarations: with k(1,2)=i on two points of mass 1/2, A_k and its adjoint both have energy 1/4, as `hilbertSchmidtEnergy_adjoint` says.

## R04 (P3) — An earlier roadmap already owns the isotypic tensor decomposition that §1.3 constructs, and the README does not state the boundary

**Location.** README:569–571: “The chosen unitary isotypic tensor decomposition and its comparison are constructed here.” The README never mentions NoncompactQuantumSymmetry.

**Claim.** §1.3 owns the decomposition `V≃⊕_i(S_i⊗ℂ^{m_i})` of a finite-dimensional unitary representation.

**Witness.** NoncompactQuantumSymmetry M0 (an open roadmap, earlier in the merge order), `NoncompactQuantumSymmetry/README.md:857–863` at its head, proves `H_τ≅τ⊗Hom_K(τ,H)` with a normalized multiplicity inner product for every strongly continuous unitary Hilbert representation of a compact K. Finite-dimensional V is included.

**Repair.** Add one clause to Scope and ownership: NoncompactQuantumSymmetry M0 owns the Hilbert isotypic decomposition; §1.3 takes a finite unitary decomposition as data and identifies the commutant with `∏_i Matrix (Fin m_i) (Fin m_i) ℂ`. Its own construction of that decomposition is the elementary finite-dimensional case, from complete reducibility and Schur. Do not cite M0 as a supplier. M0 consumes `gFiniteSubmodule_dense` (line 867 there), so a citation would make the two roadmaps supply each other.

For S⊕S, choosing an orthonormal basis of M0's `Hom_K(S,V)=ℂ²` gives exactly §1.3's `V≃S⊗ℂ²`. The §1.3 Check “diag(1,2) becomes diag(2,1)” is then the change to the swapped basis.

## R05 (P3) — §§6.1, 6.4 and 6.8 have neither a locator nor a deduction statement

**Location.** §6.1 (README:934–973), §6.4 (README:1047–1079) and §6.8 (README:1329–1371). None of the three names a source or says “a deduction from”, unlike §§0.1, 0.2, 1.1, 2.1, 6.3 and 7.1.

**Claim.** The targets are stated without a locator.

**Witness.** A locator exists for §6.1. Its weight-space decomposition follows from complete reducibility (Knapp2021, Corollary 4.7, p.240, line 10101) and the one-dimensionality of irreducibles of an abelian group (the example after Corollary 4.9, p.241, line 10123).

**Repair.**
- §6.1: cite “Knapp, Corollary 4.7 and the example after Corollary 4.9, pp.240–241” for the decomposition. Say that the formal-character laws are deductions from it and from Layer 5's orthogonality.
- §6.4: say that the laws are deductions from the definition and from commutativity of T.
- §6.8: say that its statements are deductions from §§6.5–6.7 and `MvPolynomial.esymmAlgEquiv` (see R02), or cite a textbook for the U(n) ring of invariants.

I read both Knapp lines. For T they give the finite internal direct sum of one-dimensional character spaces that §6.1's first API bullet states.

## R06 (P3) — The family index still mentions representation rings and a highest-weight supplier (previous R01, not repaired)

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:53`: “representation rings, and unitary SU(2) actions”. Lines 99–102: “for its global forms the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** These lines describe this roadmap's scope and its global-form suppliers.

**Witness.** README:62–63 says “this roadmap constructs no Grothendieck ring of representations”. README:324–325 says “The semisimple highest-weight theory is consumed through the Mathlib and Tau Ceti declarations listed above”. The index is unchanged since the previous report.

**Repair.**
- Replace “representation rings” with “their formal characters”.
- Rewrite the dependency line to say that the global forms use LieGroups Layers 0, 2–5, 5A, 6 and 7, ConvexityToric T1's period dictionary and the pinned highest-weight modules, and that Layer 3 uses BanachSpaceTheory B5.

This matches the README: §6.7's object is a ℤ-basis of `ℤ[X]^W` (for SU(2), `t²+1+t⁻²` and `1`, README:1323), not the ring R(G) that TopologicalKTheory T6 owns.

## R07 (P3) — The generated summary block still names the representation ring and the highest-weight roadmap (previous R02, partly repaired)

**Location.** The description's `roadmap-summary` block reads “the representation ring of a compact connected group with its restriction to a maximal torus” and “the highest-weight roadmap's dominant integral classification”.

**Claim.** The block describes this roadmap's scope and its suppliers.

**Witness.** README:62–63 and 324–325, as in R06. The author-written part is repaired: it now says “The family index … gains the Part II entry and a dependency line” and “Part II constructs no Grothendieck ring”.

**Repair.** Regenerate `roadmap-summary` from this head. It should name the formal-character basis of `ℤ[X]^W` and the actual suppliers: LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; and the pinned highest-weight modules.

## Previous findings

- Previous R01 (family index) is not repaired. `RepresentationTheory/README.md:53` and :101 still read as quoted in R06.
- Previous R02 (description) is partly repaired. (a) The `roadmap-summary` block is unchanged; see R07. (b) The sentence “Both wordings are inaccurate …” is gone, replaced by “The family index `TauCetiRoadmap/RepresentationTheory/README.md` gains the Part II entry and a dependency line.”

## Verified sound

**Gate and pins.** The worker's gate at this head passes every check, with `build=0`, `depcheck=0`, `statement-hygiene=0` and `outside-folder=0`. The dependency check, run for this review, printed:

```text
depcheck: 235 roadmaps, 2132 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` lists three files: the two roadmap files and the family index, which this nested pull request owns. The checked-out libraries are at the manifest pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. A scan for process words, LaTeX delimiters, `lemma`, `set_option`, `#eval` and `#print` found nothing.

**Lean.** `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. I put `#check @name` for all 16 declarations in one scratch file and compared each elaborated type with its README statement. They agree. The one binder lead in the tool's signature list is `compactCharacter`, which keeps only `CommGroup` and `TopologicalSpace`. Its body `continuous_subtype_val.comp (map_continuous χ)` needs nothing more, and README:849 asks nothing more. One remark that needs no change: `circleProduct_character` carries an unused `[DecidableEq J]`. It restricts nothing, since every type has decidable equality classically.

**One-tactic probe.** I replaced every `sorry` with `first | rfl | infer_instance | simp | trivial | decide | aesop` and elaborated the copy. All 13 theorems stay open. No single library lemma closes `positive_selfIntertwiner_existsUnique_scalar` either: the pinned `ContRepresentation.exists_eq_smul_one_of_isIrreducible` (`Continuous/Schur.lean:86`) gives a complex scalar, and realness, positivity and uniqueness still need V ≠ 0. None of the 13 is padding.

**Headline theorems.**
- Stated (13 theorems):
  - §1.2: the positive-scalar classification.
  - §2.1: Banach G-finite density.
  - §3.1: the second-countability and separable-L² criteria.
  - §4.1: finite coordinates, the product dual and characters of a circle product.
  - §5.1: the character classification, uniform density and the character basis.
  - §6.9: U(2) weight recognition.
  - §7.1: SU(2) multiplicities with faithfulness, and their realization.
- Correctly named in the docstring as not statable:
  - §6.5–6.7: `Y = Q∨`, the classification by dominant characters and the formal-character basis. I confirmed that the pins have no root characters or coroots of a general compact Lie group, no finite central cover and no formal character of a continuous representation.
  - §1.3: the multiplicity-space comparison, which needs the decomposition as data.
- Statable but absent: §0.2 (R01).

**Sources: the seeded sample.** The README flags no locator as unverified. I checked each sampled target against the cached texts.

| Sampled target | Locator | Checked against the text |
| --- | --- | --- |
| 0.1, 0.2, 1.1, 2.1 | stated as deductions, with no textbook locator | the inputs are pinned declarations or named supplier sections, all resolved (below) |
| 1.2, 1.3 | Knapp Prop 4.8, Cor 4.9, p.240 | Knapp2021 lines 10109–10120 (PDF page 258, printed 240): Schur for irreducible representations of a compact group; a self-intertwiner is scalar |
| 3.1 | Etingof §37.1 p.199; Thm 37.5 p.202 | Etingof2024 lines 6–9, 46 and 151–169: both assume a countable base, as the README says; the lecture runs to p.203 (line 219) |
| 4.1, 5.1 | Conway VII.9 Ex. 8–11 | uncertified; see Not verifiable |
| 6.2 | Knapp Prop 4.58, pp.264–265 | lines 11115–11136: (i) ⟺ (ii) define analytic integrality; real on `t_R`; the proof is on p.265 |
| 6.3, 6.4 | deduction for 6.3; none for 6.4 | 6.4: R05 |
| 6.5 | Knapp Thm 4.29 pp.250–251; Thm 5.107 p.334; Props 4.59 p.265 and 4.67 p.267; p.335 | lines 10549–10581, 14142–14152, 11137–11141, 11241–11245 and 14194–14202 match the hypotheses as stated: compact connected; simply connected semisimple for 5.107; finite covering for 4.67; dominance read on `it′₀` |
| 6.6, 6.7, 6.9 | Knapp Thm 5.110 pp.335–336 | statement at line 14203 (p.335); descent and central-character uniqueness at lines 14219–14247 (p.336) |
| 6.8 | none | R05 |

**Library declarations opened at the pins (file:line):**
- Mathlib:
  - `Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` (`Analysis/SpecialFunctions/Complex/Circle.lean:483`)
  - the `DiscreteTopology (PontryaginDual A)` instance for compact A (`Topology/Algebra/PontryaginDual.lean:87`)
  - `Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative` (`RepresentationTheory/Irreducible.lean:91`, under `FiniteDimensional` and `IsAlgClosed`)
  - `Summable.countable_support_ennreal` (`Topology/Algebra/InfiniteSum/ENNReal.lean:568`)
  - `ContRepresentation.trivial` (`RepresentationTheory/Continuous/Basic.lean:439`)
- Tau Ceti, `RepresentationTheory/` (paths below are relative to it):
  - `IrrepModel` and `IrrepClass` (`Compact/PeterWeyl.lean:137, 670`); `stdPeterWeylBasis` (:713), with no countability or T2 hypothesis
  - `convolutionOperator`, with `(k*f)(x)=∫k(xy⁻¹)f(y)` (`Compact/Convolution.lean:214, 320`), which matches README:433
  - `integratedOperatorL1` (`Continuous/Integrated/Basic.lean:144`), `comp_integratedOperatorL1` (:211, needs `CompleteSpace`, `MeasurableAdd`, left invariance) and `tendsto_integratedOperatorL1_apply` (:437, no separability); the `Additive G` transport is already done this way at `Compact/Convolution.lean:387–399`
  - `ContRepresentation.tprod` (`Continuous/TensorProduct.lean:57`); the file has no tensor-character identity, as README:195–196 says
  - `ContRepresentation.nonempty_equiv_iff` (`Continuous/Intertwining.lean:155`)
  - `ClassicalGroups/UnitaryTrick.lean`: restriction from GL(n) to U(n) only, with no extension from U(n), so §6.8 is not already proved at the pin
- Tau Ceti, other paths:
  - `IsDominantIntegral` (`Algebra/Lie/HighestWeight/Basic.lean:286`, natural values on simple coroots)
  - `formalCharacter_eq_orbitSum_add_lower` (`Algebra/Lie/HighestWeight/OrbitSum.lean:89`)
  - the Hilbert–Schmidt and U(n) torus declarations listed in R02 and R03

**Cross-roadmap citations resolved (on main unless stated):**
- LieGroups:
  - Layers 0 and 2–5 (`RepresentationTheory/LieGroups/README.md:252–639`)
  - Layer 5A (:641)
  - Layer 6, including its “Compact real roots and the Weyl comparison” target (:673)
  - Layer 7's “Compact semisimple integration” (:883–891)
- ConvexityToric T1 = §1.1 (`SymplecticGeometry/ConvexityToric/README.md:206–260`): Λ_Z = (2π)⁻¹ker exp, characters as (1/i)dχ, `exp(2πα∨)=1`, Cartan-integer pairing, and finite index under central isogeny.
- BanachSpaceTheory B5 (`BanachSpaceTheory/README.md:840–845`): the Hilbert-basis separability criterion.
- OperatorIdeals Part C (`OperatorTheory/OperatorIdeals/README.md:530–581`).
- TopologicalKTheory T6.1 (:86–91, :1213): it consumes `gFiniteSubmodule_dense` under `gap:banach-gfinite-density`.
- AutomorphicFormsOnReductiveGroups §§2.1 and 2.7 (open head, lines 54, 304 and 488) and SmoothBanachRepresentations §4.1 (open head, lines 7 and 106): both match the Scope paragraph.
- Not premises: LieHighestWeight Layers 7 (:931) and 9 (:1432), CharacteristicClasses C5 (:1344), Completed/OrthogonalL2Bases Part B (:245) and CharacterTheory Layers 0–4.
- The base roadmap's “What is not consumable, and is a build item here” list (`CompactGroups/README.md:145–160`).

**Ownership against open work and main.**
- **Banach density.** It has one planned owner. AutomorphicFormsOnReductiveGroups, NoncompactQuantumSymmetry, SmoothBanachRepresentations and TopologicalKTheory all record `gap:banach-gfinite-density` against CompactGroups. They use the names `IsGFinite`, `gFiniteSubmodule` and `gFiniteSubmodule_dense`, and the same hypotheses: compact Hausdorff, complex Banach, continuous orbit maps, and density of the submodule.
- **`Y = Q∨`.** It is also in LieHighestWeight Layer 10 on main (:1705–1714). Both open LieHighestWeight heads drop it without naming a new owner: #1797 at lines 107–123 (“not part of this roadmap either”) and #1220 at lines 107–117 (“belong to LieHighestWeight, Part II”, which exists nowhere). §6.5 therefore states it here, as the brief's open-revision rule asks.
- **U(n).** LieHighestWeight's “Precursor to Layer 6” on main (:608–772) proves the U(n) case by a type-A Haar route. §6.7 is the general compact theorem, of which U(n) is an instance proved by a different route, and both open heads move the precursor out of LieHighestWeight. No citation is requested.
- **No name clash.** AutomorphicFormsOnReductiveGroups §6.3's `compactCharacter` lives in another namespace.
- **Board packages.** The board lists three unrelated packages.

**Adversarial mathematics.** Each row gives the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `positive_selfIntertwiner_existsUnique_scalar` | ℂ, T=2I; trivial ℂ², T=diag(1,2); V=0 | c=2, while c=1 gives ⟪1,T1⟫=2≠1; diag(1,2) is not scalar, but π is reducible; on V=0 every c works, and irreducibility (`IsSimpleOrder` needs ⊥≠⊤) excludes it | true; both hypotheses needed | none |
| `IsGFinite`, `gFiniteSubmodule` | 0; trivial action over 𝔽₂; rotations on C(S¹) with e^{iθ} and 1+e^{iθ}; ℤ on ℓ²(ℤ) at δ₀ | orbit-span dimensions 0, 1, 1, 2, ∞ | as defined | none |
| `gFiniteSubmodule_dense` | E=0; trivial G; rotations on C(S¹) | E=0 is trivially dense; every vector is G-finite; ‖R_θ−I‖=2 for θ≠0 while orbits are continuous, and trigonometric polynomials are dense | true without operator-norm continuity | none |
| `secondCountable_iff_…`, `separable_L2_iff_…` | trivial; C₃; Circle^ℕ; Circle^J, J uncountable | (T,T); (T,T), 3 classes; (T,T), dual `ℕ →₀ ℤ`; (F,F): ‖χ_j−χ_k‖₂=√2 gives an uncountable orthonormal family | both sides agree | none |
| §3.1 Borel Check | Circle^J, J uncountable, U = complement of {1} | U is open (Hausdorff), hence Borel; it depends on uncountably many coordinates, so it is not in the cylinder σ-algebra | as stated | none |
| `character_finite_coordinates` | J=∅; S₃×C₃ with sign·ω at ((12),g); Circle^ℕ with χ₀χ₁ | F=∅, value 1; F={1,2}, (−1)·ω=−ω; F={0,1}, z₀z₁ | true without compact or commutative factors | none |
| `exists_productDualEquiv` | J=∅; Circle² with the generators χ₁ and χ₂⁻¹ at (i,−1) | 0 ↦ 1; i·(−1)⁻¹=−i | e is pinned on generators; it maps discrete to discrete | none |
| `circleProduct_character` | J=∅; z₁z₂⁻¹ at (i,−1); z⁻¹ on Circle at i | n=0, value 1; n=(1,−1), value −i; n=−1 gives −i, versus i for n=+1 | uniqueness holds | none |
| `exists_irrepClass_characterEquiv` | C₃; trivial group; Circle at i | 3 classes ↔ {1,ω,ω²}; 1 ↔ 1; scalar i, coefficient ⟪i·1,1⟫=−i | e is pinned by the scalar | none |
| `compactCharacter_span_dense`, `exists_characterBasis` | trivial; C₃; f=c_χ+2c_ψ | span{1}=C(pt); 3 independent characters span C(C₃)=ℂ³; pairing (1+ω+ω²)/3=0; Parseval 1+4=5=‖f‖² | true | none |
| `u2_weight_character_iff` | f=0; {(2,0):1,(1,1):2,(0,2):1}; {(1,−1):1,(−1,1):1}; {(−1,−1):1}; {(1,0):1} | n=0, trace 0, 0=0 and 0≥0; m(2,0)=m(1,1)=1, Sym²⊕det, dimension 4; 1≤0 fails at (0,0) and the character is the virtual det⁻¹Sym²−1; at diag(i,−1), i⁻¹(−1)⁻¹=i; f(0,1)=0≠1, and the permutation matrix swaps the diagonal | both directions agree | none |
| `su2_multiplicities_and_faithfulness` | n=0; Sym¹⊕Sym¹; Sym²; Sym³ | not injective, no odd d; kernel {I}, d=1 odd, 2·2=4; kernel {±I}, no odd d; kernel {I}, d=3 | the iff agrees | none |
| `exists_su2_of_multiplicities` | m=0; m=single 2 1 | dimension 0; dimension 3, χ₂(diag(i,−i)) = −1+1−1 = −1 | true | none |
| §7.1 count | n=2, 3, 4 | p−p_odd = 2−1, 3−2, 5−2 = 1, 1, 3 | matches | none |
| §0.1 tensor and dual | trivial ℂ; C₃ | 2I⊗3I acts by 6 on 1⊗1; ω·ω=ω², dual ω⁻¹=ω² | cited | none |
| §0.2 identity (R01 probe) | two points of mass 1/2, k=1; k(1,2)=i; μ=0 | 1 = 4·(1/4); 1/4 = 1/4, adjoint entry −i/2; 0 = 0 | true and statable | R01 |
| §1.1 Gram form | T=2I on ℂ; swap action with diag(1,2) | h(1,i)=⟪1,2i⟫=2i, while the other slot gives −2i; h(πe₁,πe₁)=2≠1 | convention fixed | none |
| §1.3 block change | U=diag(1,i), A=[[1,1],[1,2]] | UAU†=[[1,−i],[i,2]]; U†AU=[[1,i],[−i,2]] | direction fixed | none |
| §2.1 covariance | S₃, h=(12), t=(23) | ht=(123) (right to left), th=(132) | as stated | none |
| §4.1 topology | Circle^ℕ, χ_n at the constant tuple −1 | χ_n(−1,…)=−1 for every n; the restriction to a fixed coordinate j is 1 for n≠j | as stated | none |
| §6.2 normalization | Circle, zⁿ; z⁻¹ at θ=π/2 | ℓ(2π)=2πn; exp(−iπ/2)=−i, versus exp(−π/2)≈0.208 | as stated | none |
| §6.3 conjugation | rotation plane, v=e₁−ie₂ | R_θv=e^{iθ}v; c(v)=e₁+ie₂ has weight −1; c(iv)=−ic(v) | as stated | none |
| §6.4 Weyl action | SU(3), s₁=(12), s₂=(23) | (s₁s₂)·e₁=e₂; (s₂s₁)·e₁=e₃; the pinned U(n) law gives the same | left action | R02 (citation only) |
| §6.5 lattices | SU(2); SO(3); H=−iα_ℝ∨ | exp(2πH_R)=I and exp(πH_R)=−I, so Y=ℤH_R; Y=(1/2)ℤH_R; α(H)=(2i)(−i)=2 | needs simple connectedness | none |
| §6.5 U(2) parity | (q,a)=(1,1), (0,1); t₁ᵃt₂ᵇ | (−1)^{q+a} = +1, −1; (q,a′)=(a+b, a−b), with q−a′=2b | as stated | none |
| §6.6 central part | U(2), highest weights (1,0) and (2,1) at z=i | z ↦ i; z³ ↦ −i | the central exponent separates them | none |
| §6.7 basis | SU(2) | χ₂=t²+1+t⁻²=m₂+m₀; t²+t⁻²=χ₂−χ₀ | unitriangular | none |
| §6.8 congruence | U(3), λ=(2,1,−1); (1,0) with q=0 | q=2, a=(1,2), 5≡2 (mod 3), and Σλ−3λ₃=5; ζ⁰·ζ⁻¹≠1 | as stated | R02, R05 |

No counterexample to any statement was found.

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1 and 5.1). The manifest records it as uncertified (paywalled), so it is cited by its locator alone and its exercise numbers were not checked against the text.
- §6.8 has no source to check (R05). Knapp2021 has no U(n) global-forms section to propose as its locator.

## Source issues

- none
