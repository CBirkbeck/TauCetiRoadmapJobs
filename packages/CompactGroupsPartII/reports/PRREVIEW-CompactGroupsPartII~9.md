# Review of CompactGroupsPartII (pull request #1047 at 2a23724)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** needs changes

:robot: Independent AI review. This is a full review, because the folder changed by 231 lines since `562ebbd`. There are four findings. One is blocking (R01, P2): a headline that the Summary names is statable at the pins but is not stated. The other three are P3. R02 and R03 are the previous report's R06 and R07, which are still open. Previous R01–R05 are repaired (see **Previous findings**).

Unless another path is given, README locations refer to `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md` and Lean locations to `Suggested.lean` in the same folder.

## R01 (P2) — The U(n)-conjugacy classification of §7.1 is statable at the pins but is not stated

**Location.** README:12: “… global forms with their torus characters and unitary conjugacy of SU(2) actions.” README:1561–1567 asks to “classify continuous group homomorphisms SU(2)→U(n), with conjugacy by U(n)” and to “Construct the bijection”. `Suggested.lean:266–289` states only that the multiplicities are unique and can be realized.

**Claim.** `su2_multiplicities_and_faithfulness` and `exists_su2_of_multiplicities` state §7.1's classification. The module docstring does not list the conjugacy statement as unstatable.

**Witness.** Those two theorems do not imply injectivity on conjugacy classes, that is, that equal multiplicities give U(n)-conjugate actions. The statement below elaborates at the pins with only a `sorry` warning, and the one-tactic probe leaves it open.

**Repair.** State it in Layer 7 of `Suggested.lean`:

```lean
/-- Two unitary SU(2) actions on the same standard space with the same trace character are
conjugate by a unitary map; with the two theorems above, the multiplicities classify unitary
SU(2) actions up to U(n)-conjugacy. -/
theorem exists_linearIsometryEquiv_of_su2_character_eq (n : ℕ)
    (π ρ : ContRepresentation ℂ TauCeti.SU2 (EuclideanSpace ℂ (Fin n)))
    (hπ : _root_.ContRepresentation.IsUnitary π) (hρ : _root_.ContRepresentation.IsUnitary ρ)
    (h : ∀ g : TauCeti.SU2, π.toRepresentation.character g = ρ.toRepresentation.character g) :
    ∃ e : EuclideanSpace ℂ (Fin n) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin n),
      ∀ (g : TauCeti.SU2) (v : EuclideanSpace ℂ (Fin n)), e (π g v) = ρ g (e v) := by
  sorry
```

Name it in the first paragraph of §7.1, together with the two existing signatures, and add it to the headline list in the module docstring.

The statement needs no continuity hypothesis, and the pins do not already prove it:
- A unitary action is semisimple: `ContRepresentation.IsUnitary.isSemisimpleRepresentation` (`TauCeti/RepresentationTheory/Continuous/InvariantComplement.lean:190`).
- Equal characters therefore give a linear equivalence: `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation` (`TauCeti/RepresentationTheory/Semisimple.lean:63`).
- §7.1's positive polar factor then makes that equivalence unitary.
- The pinned `ContRepresentation.exists_linearIsometryEquiv_congr_eq` (`TauCeti/RepresentationTheory/Continuous/Unitary/Equivalence.lean:51`) covers only an irreducible source, so it does not settle the general case.

I tested the statement on two instances:
- Take ρ(g) = ḡ on ℂ². Its character equals that of Sym¹, because tr g is real on SU(2). J = [[0,−1],[1,0]] satisfies J g J⁻¹ = ḡ. At g = diag(i,−i) we have ḡ = diag(−i,i) ≠ g, so the identity map is not a valid e. This makes a good README Check.
- Trivial ℂ² against Sym¹: the characters at −I are 2 and −2, so the hypothesis fails, as it should.

## R02 (P3) — The family index still says “representation rings” and names a highest-weight supplier (previous R06, not repaired)

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:53`: “global forms and representation rings, and unitary SU(2) actions”. Lines 99–102: “for its global forms the Lie-groups roadmap's maximal tori and coverings and the highest-weight roadmap's dominant integral classification”.

**Claim.** These lines describe this roadmap's scope and its suppliers.

**Witness.** README:62–63 says that this roadmap “constructs no Grothendieck ring of representations”. README:373–374 says that the highest-weight theory is consumed only through the pinned Mathlib and Tau Ceti declarations. The index is unchanged at this head.

**Repair.**
- Replace “representation rings” with “their formal characters”.
- Rewrite the dependency line. It should say that the global forms use LieGroups Layers 0, 2–5, 5A, 6 and 7, ConvexityToric T1's period dictionary and the pinned highest-weight modules, and that Layer 3 uses BanachSpaceTheory B5.

## R03 (P3) — The generated `roadmap-summary` block still names the representation ring and the highest-weight roadmap (previous R07, not repaired)

**Location.** The `roadmap-summary` block of the description reads “the representation ring of a compact connected group with its restriction to a maximal torus” and “the highest-weight roadmap's dominant integral classification”.

**Claim.** The block describes this roadmap's scope and its suppliers.

**Witness.** README:62–63 and 373–374, as in R02. The block also omits §0.2's Hilbert–Schmidt energy identity, which is now a stated headline (`Suggested.lean:51`). The author-written part of the description is accurate.

**Repair.** Regenerate `roadmap-summary` from this head. It should name:
- the formal-character basis of `ℤ[X]^W`;
- the continuous-kernel energy identity;
- the actual suppliers: LieGroups Layers 0, 2–5, 5A, 6 and 7; ConvexityToric T1; and the pinned highest-weight modules.

## R04 (P3) — The Tau Ceti contract can be read as saying the pins have root characters and a positive system for U(n)

**Location.** README:312–315: “For a general compact connected Lie group the pins have no root characters, positive system or conjugacy theorem for maximal tori; for U(n) they have all three torus facts of the next item.”

**Claim.** “all three” follows a list of three objects (root characters, a positive system, conjugacy), so the sentence reads as claiming all three for U(n).

**Witness.** The next item (README:316–332) lists element conjugacy, maximal-torus conjugacy and the Weyl group, but no root characters and no positive system. A search of `TauCeti/Analysis/Matrix/UnitaryGroup/*.lean` finds neither.

**Repair.** End the sentence with: “for U(n) they have element conjugacy into the diagonal torus, conjugacy of maximal tori and the Weyl group `Equiv.Perm (Fin n)` (next item), but no root characters or positive system.”

## Previous findings

- **R01 (§0.2 statable but absent): repaired.** `Suggested.lean:51–58` states `exists_kernelOperator_hilbertSchmidtEnergy`, and README:468–469 names it. The docstring bullet is gone.
  - The author dropped my proposed `[μ.Regular]`, and the statement is still true without it. The README's route uses only Stone–Weierstrass, finite-rank Parseval/Fubini on the product σ-algebra and the column model, with no regularity.
  - The new Dieudonné Check (README:518–525) is correct. I recomputed it with k(x,y)=f(x)g(y), where f and g are eventually 2 and 3: the energy is |6|²=36 and the iterated lintegral is 4·9=36.
- **R02 (U(n) torus): repaired.**
  - README:312–332 qualifies the sentence and lists the pinned U(n) declarations.
  - §6.8 (README:1425–1431, 1455–1465) and §6.9 (README:1527–1531) cite them, and §6.8 uses `MvPolynomial.esymmAlgEquiv`.
  - The convention text is right. `Matrix.permutationUnitary σ = σ⁻¹.permMatrix` (`TauCeti/LinearAlgebra/Matrix/UnitaryGroup/Basic.lean:51,58`) sends e_j to e_{σ(j)}. For σ=(123), diag(t∘σ⁻¹) has t₁ in position 2.
  - The wording at README:314–315 is the subject of R04.
- **R03 (OI-C targets): repaired.** README:67–70 says that the column model is pinned. §0.2's *Needs* (README:499–507) and Layer 0's Dependencies (README:547–550) cite pinned declarations, and the OperatorIdeals supplier sentence is gone.
- **R04 (NoncompactQuantumSymmetry M0 boundary): repaired.** README:87–92 states the boundary. M0 at its head (`NoncompactQuantumSymmetry/README.md:863, 867`) has `H_τ≅τ⊗Hom_K(τ,H)` and consumes `gFiniteSubmodule_dense`, so citing M0 as a supplier would indeed make the two roadmaps supply each other.
- **R05 (locators): repaired.** §6.1 cites Knapp Cor 4.7 and the example after Cor 4.9 (README:1027–1028); I checked both in the text (below). §6.4 (README:1144–1145) and §6.8 (README:1452–1453) now say that they are deductions.
- **R06 (family index): not repaired.** See R02.
- **R07 (summary block): not repaired.** See R03.

## Verified sound

### Gate and dependency check

The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `outside-folder=0`).

I re-ran the gate with the brief's command. It printed `depcheck: NOT IN ORDER: CompactGroupsPartII` and `outside-folder: TauCetiRoadmap/RepresentationTheory/README.md`. Neither is a defect of the head:
- The gate's default order does not list this roadmap. The candidate merge order lists it (line 404), and the dependency check against that order is clean.
- The family index belongs to this nested pull request, as the brief says.

The dependency check against the candidate order printed:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line.

`git diff --stat origin/main...HEAD` lists three files: the two roadmap files and the family index. A scan for process words, LaTeX delimiters, `lemma`, `set_option`, `#eval` and `#print` found nothing. The libraries are at the manifest pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

### Lean

- `lake env lean` on `Suggested.lean` gives 14 `sorry` warnings and nothing else (14 s).
- I put `#check @name` for all 17 declarations in one scratch file and compared each elaborated type with its README statement. Nothing changed and they agree.
- The tool's one binder lead, `compactCharacter`, keeps only `CommGroup` and `TopologicalSpace`. Its body needs nothing more, and README:932 asks nothing more.

### One-tactic probe

I replaced every `sorry` with `first | rfl | infer_instance | trivial | decide | simp | aesop`. All 14 theorems stay open, and so does the R01 statement. Nothing is padding.

### Headline theorems

- **Stated:**
  - §0.2 energy identity
  - §1.2 positive scalar
  - §2.1 Banach density, with its two definitions
  - §3.1, two criteria
  - §4.1, three statements
  - §5.1, three statements
  - §6.9 U(2) recognition
  - §7.1 multiplicities with faithfulness, and their realization
- **Correctly named as not statable:**
  - §§6.5–6.7: there are no compact root characters or coroots, finite central cover or formal character at the pins.
  - §1.3: the decomposition would have to be data.
- **Statable but absent:** the §7.1 conjugacy classification (R01).

### Sources: the seeded sample

The README flags no locator as unverified.

| Target | Locator | Checked against the text |
| --- | --- | --- |
| 0.1, 0.2, 1.1, 2.1, 7.1 | stated as deductions | every input is a pinned declaration or a resolved supplier section (below) |
| 1.2, 1.3 | Knapp Prop 4.8, Cor 4.9, p.240 | Knapp2021 lines 10109–10120: a page-240 header at line 10084 (Schur; a self-intertwiner is scalar) |
| 3.1 | Etingof §37.1 p.199; Thm 37.5 p.202 | Etingof2024 lines 6–9 (page footer 199 at line 46) and 151–152 (footer 202 at line 169): both assume a countable base |
| 4.1 | Conway VII.9 Ex. 11 | uncertified (Not verifiable) |
| 6.1 | Knapp Cor 4.7 p.240; example after Cor 4.9 p.241 | lines 10101–10104 (complete reducibility); 10123–10127 (page-241 header at 10122): irreducibles of an abelian group are 1-dimensional |
| 6.2 | Knapp Prop 4.58 pp.264–265 | line 11115 (p.264): (i)⟺(ii) is analytic integrality; real on `t_R`; the proof is on p.265 (line 11125) |
| 6.4, 6.8 | deductions | inputs pinned (`finite_normalizerQuotient`; the U(n) torus; `esymmAlgEquiv` at `Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:341`, over a `CommRing`) |
| 6.5 | Knapp Thm 4.29 pp.250–251; Thm 5.107 p.334; Prop 4.59 p.265; Prop 4.67 p.267; p.335 | lines 10549–10552 (p.250, commuting product, closed `G_ss`); 14142–14152 (p.334, simply connected semisimple, via integration of highest-weight modules); 11137–11139; 11241–11244 (finite covering, index = kernel order); 14201–14202 (dominance depends only on `it′₀`) |
| 6.7, 6.9 | Knapp Thm 5.110 pp.335–336 | statement at lines 14203–14209 (p.335); proof at lines 14214–14247 (p.336): Schur on `(Z_G)₀`, descent through a central kernel inside `exp t₀` |

### Library declarations opened at the pins (file:line)

**Mathlib:**
- `Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative` (`RepresentationTheory/Irreducible.lean:91`)
- `Summable.countable_support_ennreal` (`Topology/Algebra/InfiniteSum/ENNReal.lean:568`)
- `Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` (`Analysis/SpecialFunctions/Complex/Circle.lean:483`)
- `ContinuousMap.toLp_denseRange` (`MeasureTheory/Function/ContinuousMapDense.lean`, compact space and finite measure)
- the instance `DiscreteTopology (PontryaginDual A)` for `[CompactSpace A]` (`Topology/Algebra/PontryaginDual.lean:87`)
- `MvPolynomial.esymmAlgEquiv` (`RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:341`)

**Tau Ceti, `Analysis/InnerProductSpace/HilbertSchmidt/`:**
- `Basic.lean`: `hilbertSchmidtEnergy` (:89, equal to `∑' i, ‖T (b i)‖ₑ ^ 2`), `hilbertSchmidtEnergy_adjoint` (:141), `hilbertSchmidtEnergy_indep` (:150), `hilbertSchmidtNorm` (:212), `sq_hilbertSchmidtNorm` (:231) and `norm_le_hilbertSchmidtNorm` (:269). All come after `[CompleteSpace E] [CompleteSpace F]` at :136, as the contract says.
- `Columns.lean`: `columnOperator` (:105), `columnOperator_mk` (:158), `norm_columnOperator_apply_le` (:163), `tsum_norm_columnOperator_apply_self_sq` (:171), `hilbertSchmidtEnergy_columnOperator` (:221) and `existsUnique_columnOperator_eq` (:241).
- None of these files has an integral operator of a kernel. A search for `integralOperator` and `kernelOperator` in both libraries is empty, so §0.2 is not already proved.

**Tau Ceti, U(n) torus:**
- `Analysis/Matrix/UnitaryGroup/Torus.lean`: `unitaryTorusHom` (:72), `unitaryTorus` (:111) and `exists_isConj_unitaryTorusHom` (:175).
- `MaximalTorus.lean`: `isMaximalTorus_unitaryTorus` (:66) and `exists_map_conj_eq_of_isMaximalTorus` (:101).
- `Weyl.lean`: `unitaryTorusNormalizer_mul_unitaryTorusHom_mul_inv` (:131, `g·diag(z)·g⁻¹ = diag(z ∘ σ_g⁻¹)`), `unitaryTorusNormalizerPerm_permutationUnitary` (:161) and `unitaryTorusNormalizerQuotientMulEquivPerm` (:176).

**Tau Ceti, `RepresentationTheory/`:**
- `Continuous/Schur.lean:86`
- `Continuous/OrthogonalDecomposition.lean:192`
- `Continuous/Unitary/Equivalence.lean:51` (irreducible source only)
- `Continuous/InvariantComplement.lean:190`
- `Semisimple.lean:63`
- `Compact/Convolution.lean:320` (`convolutionOperator`)

### Cross-roadmap citations resolved (on main unless stated)

- LieGroups:
  - Layer 5A (`RepresentationTheory/LieGroups/README.md:641`)
  - Layer 6 (:673), including its compact real roots target (:750)
  - Layer 7 (:787), including compact semisimple integration (:883)
- ConvexityToric T1 = Layer 1 (`SymplecticGeometry/ConvexityToric/README.md:200, 204–206`)
- BanachSpaceTheory B5 (:800), with the Hilbert-basis separability criterion at :840–843
- TopologicalKTheory T6 (:1202), which consumes `gap:banach-gfinite-density` (:86–90, :1213)
- OperatorIdeals Part C (:530)
- CharacteristicClasses C5 (:1344)
- Completed/OrthogonalL2Bases Part B (:245)
- Open heads:
  - AutomorphicSpectralTheory §0.8 (lines 240–258): measurable L² kernels on σ-finite standard Borel spaces, as README:75–79 says
  - AutomorphicFormsOnReductiveGroups §2.1 and §2.7 (lines 54, 302–311, 488)
  - SmoothBanachRepresentations §4.1 (line 319 and the gap at line 79)
  - NoncompactQuantumSymmetry M0 (lines 863–867)

### Ownership

- **§0.2.** The closest owner is AutomorphicSpectralTheory §0.8, which covers standard Borel spaces only. README:75–79 records how §0.2 differs. RandomMatrices §8.3 (on main, :984–995) owns Mercer and trace class for positive kernels on Polish spaces, which is a different theorem.
- **Banach density.** Four roadmaps record `gap:banach-gfinite-density` with the same names and hypotheses.
- **`Y = Q∨`.** It is still in LieHighestWeight Layer 10 on main (:1705–1714). Both open LieHighestWeight heads drop it without naming a new owner (#1220 lines 109–114; #1797 lines 107–109), so §6.5 is the owner.
- **The R01 name** occurs nowhere on main or in any open roadmap pull request.

### Adversarial mathematics

Each row gives the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_kernelOperator_hilbertSchmidtEnergy` | two points of mass ½, k=1; k(1,2)=i; μ=0; Dieudonné with k=f⊗g; X=∅ | energy 1 versus 4·¼=1; with e_x=√2δ_x, A e₂=(i/2)e₁, so ¼ versus ¼; Lp=0 gives 0=0; 36 versus 4·9=36; 0=0 | true without `μ.Regular` | none |
| §0.2 adjoint bullet | k(1,2)=i | k*(2,1)=−i; both energies ¼ (`hilbertSchmidtEnergy_adjoint`) | as stated | none |
| §0.2 Dieudonné Check | [0,ω₁], club measure | μ([0,ω₁))=1, compact subsets have measure 0; μ({ω₁})=0, neighbourhoods have measure 1; L²=constants | as stated | none |
| `positive_selfIntertwiner_existsUnique_scalar` | ℂ with T=2I; trivial ℂ² with diag(1,2); V=0 | c=2, while c=1 gives ⟪1,T1⟫=2≠1; reducible; V=0 is excluded by `IsSimpleOrder` | true | none |
| `IsGFinite`, `gFiniteSubmodule` | 0; trivial action over 𝔽₂; e^{iθ} and 1+e^{iθ} on C(S¹); ℤ on ℓ²(ℤ) | orbit-span dimensions 0, 1, 1, 2, ∞ | as defined | none |
| `gFiniteSubmodule_dense` | E=0; rotations on C(S¹) | trivially dense; ‖R_θ−I‖=2 while orbits are continuous, and trigonometric polynomials are dense | true without norm continuity | none |
| §3.1 criteria | trivial; C₃; Circle^ℕ; Circle^J with J uncountable | 1 class; 3 classes; dual `ℕ →₀ ℤ`; ‖χ_j−χ_k‖₂=√2, so uncountably many separated vectors | both sides agree | none |
| `character_finite_coordinates` | J=∅; S₃×C₃ with sign·ω at ((12),g) | F=∅ and value 1; F={1,2}, value −ω | true for non-abelian factors | none |
| `exists_productDualEquiv`, `circleProduct_character` | Circle², n=(1,−1) at (i,−1); z⁻¹ versus z at i | i·(−1)⁻¹=−i; −i≠i, so n is unique | as stated | none |
| `exists_irrepClass_characterEquiv` | Circle, scalar action at i | coefficient ⟪i·1,1⟫=−i; trace i | e is pinned by the scalar | none |
| `compactCharacter_span_dense`, `exists_characterBasis` | C₃; f=c_χ+2c_ψ | (1+ω+ω²)/3=0; Parseval 1+4=5 | true | none |
| `u2_weight_character_iff` | {(2,0):1,(1,1):2,(0,2):1}; {(2,−1),(1,0),(0,1),(−1,2)} each 1; {(1,−1),(−1,1)}; {(−1,−1)}; f=0 | m(2,0)=1, m(1,1)=2−1=1, dimension 4; m(2,−1)=1, giving det⁻¹⊗Sym³; at (0,0), 1>0 fails; at diag(i,−1), (−i)(−1)=i; 0=0 | both directions agree | none |
| `su2_multiplicities_and_faithfulness` | n=0; Sym¹⊕Sym¹; Sym²; Sym⁰⊕Sym¹ | not injective, no odd d; injective, 2·2=4; kernel {±I}, no odd d; injective, n=3 | iff agrees | none |
| `exists_su2_of_multiplicities` | m=δ₂ | dimension 3; χ₂(diag(i,−i))=−1+1−1=−1 | true | none |
| R01 statement | ρ(g)=ḡ versus Sym¹; trivial ℂ² versus Sym¹ | equal real traces, J g J⁻¹=ḡ, ḡ≠g at diag(i,−i); traces at −I are 2 and −2 | true, statable, open under the probe | R01 |
| §6.8 convention | σ=(123) on U(3) | `permutationUnitary σ = σ⁻¹.permMatrix`, e_j↦e_{σ(j)}; diag(t∘σ⁻¹)=diag(t₃,t₁,t₂) | matches the Conventions | none |
| §6.8 Laurent step | U(2), t₁⁻¹+t₂⁻¹ | e₂·(t₁⁻¹+t₂⁻¹)=e₁, so it equals e₁e₂⁻¹ | as stated | none |
| §6.8 congruence | U(3), λ=(2,1,−1); (1,0) with q=0 | q=2, 1+2·2=5≡2; ζ⁰·ζ⁻¹≠1 | as stated | none |
| §6.1 | Circle, z↦z⁻¹ at i | weight −1, trace −i | as stated | none |
| §6.4 | SU(3), s₁=(12), s₂=(23) | (s₁s₂)·e₁=e₂; (s₂s₁)·e₁=e₃ | left action | none |
| §6.5 | SU(2); SO(3); U(2) with (q,a)=(1,1) and (0,1) | Y=ℤH_R; Y=½ℤH_R; (−1)^{q+a}=+1 and −1 | as stated | none |
| §6.6 | U(2), (1,0) and (2,1) at z=i | i versus i³=−i | central exponent separates them | none |
| §6.7 | SU(2) | χ₂=t²+1+t⁻²=m₂+m₀ | unitriangular | none |
| §6.2 | z⁻¹ at θ=π/2 | exp(−iπ/2)=−i versus exp(−π/2)≈0.208 | as stated | none |
| §0.1, §1.1, §1.3 | C₃ dual; T=2I; U=diag(1,i), A=[[1,1],[1,2]] | ω⁻¹=ω²; h(1,i)=2i; UAU†=[[1,−i],[i,2]] | as stated | none |
| §2.1 covariance | h=(12), t=(23) | ht=(123) (right to left) | as stated | none |
| §7.1 count | n=2, 3, 4 | 2−1, 3−2, 5−2 = 1, 1, 3 | matches | none |
| R04 sentence | U(n) root characters | none in `Analysis/Matrix/UnitaryGroup/` | the wording overreaches | R04 |

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11 (§§4.1 and 5.1). The manifest records it as uncertified (paywalled), so it is cited by its locator alone and I did not check the exercise numbers against the text.

## Source issues

- none
