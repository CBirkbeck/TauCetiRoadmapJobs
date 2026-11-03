# Review of CompactGroups (pull request #1047 at 7c7d91c)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroups/`
**Verdict:** needs changes

Full independent AI review of the same head the previous review read (the folder has zero changed lines since 7c7d91c; nothing outside the folder changed). The gate, the dependency check, direct elaboration, nineteen signature checks and a fourteen-declaration one-tactic probe all pass, and the fourteen admitted statements survive the adversarial pass below. One blocking finding remains, carried unchanged since the second review: the pull request overwrites a roadmap that main records as done, in its own folder, and reassigns its layer numbers, which roadmaps on main and in open pull requests cite. Two P3 notes on convention witnesses are new. The previous review's P3 on a source inventory is dropped, for the reason given under "Previous findings".

## R01 (P2) — Keep the completed base roadmap in this folder; put the new programme in CompactGroups Part II

**Location:** `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:1–7` (“Build on normalized Haar measure … Peter–Weyl, compact character theory and the SU(2) symmetric-power classification. The comparison targets concern invariant metrics, G-finite vectors …”), `:11–19`, `:168–176`, and `Suggested.lean:1–22`; the whole file is a replacement.

**Claim:** Carried from r2 R05, r3 R02 and r4–r7 R01; no repair report marks it not actionable. Main's CompactGroups is a finished roadmap, and this head replaces its README and `Suggested.lean` by a different programme in the same folder with the same title, renumbering the layers: Layer 0 (Haar) becomes interface comparisons, Layers 1–2 (unitarizability, complete reducibility) become invariant metrics and Banach density, Layer 4 (Schur orthogonality) becomes product duals, Layer 5 (Peter–Weyl) becomes compact abelian Fourier theory, Layer 6 (characters) becomes global forms. The base content survives only as a list of library names under "Scope and ownership"; its specification, worked examples and section anchors are gone. The brief's contract is that an existing roadmap is built on, never re-planned, and that an extension is a Part II.

**Witness:** Main `TauCetiRoadmap/RepresentationTheory/STATUS.md:5` records Layers 0–6 of this folder as `done` with a pinned README hash, and `:42` lists CompactGroups under Done; the family index `TauCetiRoadmap/RepresentationTheory/README.md:47–49` (unchanged by this head) still describes the folder as Haar through Peter–Weyl, characters and the SU(2) engine. Consumers cite main's numbering and now resolve to the wrong mathematics at this head: main `RepresentationTheory/LieHighestWeight/README.md:915` links `CompactGroups/README.md#layer-6-characters-of-compact-groups`, a fragment that does not exist here; main `RepresentationTheory/CharacterTheory/README.md:231–235` consumes "Layer 5 (the Peter–Weyl theorem, the isotypic decomposition)"; main `GeneralizedCohomology/README.md:2494`, `CharacteristicClasses/README.md:1164` and `TensorProductCombinatorics` cite "Layer 0's normalized Haar"; `BordismFormalGroups/README.md:2631` cites "Layers 1–2, unitarizability"; open DeligneWeightsAndPurity `:504,508` cites "Layer 5 (Peter–Weyl)" and "Layers 0, 6 and the SU(2) engine case"; open NoncompactQuantumSymmetry `:3963` cites "Layer 4 coefficient orthogonality"; open QuantumFoundations `:69` cites "Layers 1–5: unitarization, Peter–Weyl"; open LieGroups `:893` and MetaplecticAutomorphicForms `:2914` cite "Layer 5". The renumbering has already split the consumers: AutomorphicFormsOnReductiveGroups `:82,302` and SmoothBanachRepresentations `:9,58` declare `gap:banach-gfinite-density` against "CompactGroups Layer 5" (this head's §2.1), AutomorphicFormsOnReductiveGroups `:649` and AdelicAlgebraicGroups `:126,512` cite "Layer 5" for compact abelian Fourier theory (this head's §5.1), and TopologicalKTheory `:83,972` cites "Layer 5.1" for G-finite vectors at this pull request's earlier head e081fe4d, where that was Layer 5. No two of these groups can be right at once.

**Exact repair:** Restore main's `README.md` and `Suggested.lean` in this folder (with at most the corrections this pull request found necessary to the base text). Create `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/` carrying this head's README and `Suggested.lean` under `namespace TauCetiRoadmap.CompactGroupsPartII`, with an introduction saying where the base stops (native Haar, unitarization, Peter–Weyl, characters, SU(2)) and citing the base by its main layer numbers; add the Part II line to the family index, which is this pull request's own. Keep the fourteen statements, the declared gap and the Knapp locator chain verbatim.

**Repair test:** No mathematical statement changes; every consumer citation listed above resolves again on main's text; the Banach gap is then declared against "CompactGroupsPartII §2.1" by its two consumers (their edit, not this pull request's). The nominal cycle "LieHighestWeight's precursor to Layer 6 consumes CompactGroups Layers 0–6, this head's Layer 6 consumes LieHighestWeight Layers 0–6" disappears with the split, because Part II is placed after LieHighestWeight.

## R02 (P3) — §1.3's basis-change convention has no discriminating witness

**Location:** `README.md:328–330`: “Under a decomposition change `d'=(⊕_i(id⊗U_i))d`, with each U_i unitary, prove `A_i'=U_i A_i U_i†`”; Check at `:349–350` (“swapping copies changes it to diag(2,1)”).

**Claim:** The only Check on this law uses the coordinate swap, which is self-adjoint, so it cannot tell `U A U†` from `U† A U`; the direction depends on whether `d'` or `d` carries the new coordinates and is left unpinned.

**Witness:** With `U = diag(1, i)` and `A = [[1,1],[1,2]]`, `U A U† = [[1, −i],[i, 2]]` while `U† A U = [[1, i],[−i, 2]]`; both are positive definite Hermitian with the same spectrum, so positivity Checks do not separate them either.

**Exact repair:** Add that pair as a Check (“for `U = diag(1,i)` and `A = [[1,1],[1,2]]` the new block is `[[1,−i],[i,2]]`; the opposite conjugation would give `[[1,i],[−i,2]]`”), and state in the sentence which of `d`, `d'` reads the new coordinates.

## R03 (P3) — §6.4's SU(3) Check depends on an unstated matrix convention

**Location:** `README.md:821–823`: “For SU(3), with s₁=(12), s₂=(23), the coordinate character e₁ satisfies (s₁s₂)·e₁=e₂ but (s₂s₁)·e₁=e₃”.

**Claim:** With `(w·χ)(t) = χ(n⁻¹ t n)` and a permutation matrix realizing σ by `n_σ e_j = e_{σ(j)}`, one computes `n_σ⁻¹ t n_σ = diag(t_{σ(1)}, t_{σ(2)}, t_{σ(3)})`, so `σ·e_i = e_{σ(i)}` and the Check's values are `e₂`, `e₃` as stated. With the equally common realization `n_σ e_j = e_{σ⁻¹(j)}` the same computation gives `σ·e_i = e_{σ⁻¹(i)}`, `(s₁s₂)·e₁ = e₃`. The Check is meant to detect a reversed multiplication, but it detects the matrix convention instead unless that is fixed.

**Witness:** Both readings satisfy the action law `(w₁w₂)·χ = w₁·(w₂·χ)` proved in the subsection; the Check alone does not single out one.

**Exact repair:** State the realization (“the transposition `(ij)` is represented by the permutation matrix exchanging `e_i` and `e_j`, and `σ` composes right to left”) in the Check.

## Previous findings

- r7 R01 — not repaired: README:1–19 and the layer headings are unchanged; main STATUS.md still records the folder as done; LieHighestWeight:915 still links a fragment absent at this head. Carried as R01.
- r7 R02 (add a `sources.toml` inventory) — dropped, not repaired. The brief treats a non-roadmap file inside the roadmap folder as a stray file and says sources are the README's references, and the board manifest (`packages/CompactGroups/sources.toml`) is written by the package pipeline, which this externally opened pull request did not pass through. The README's References already give Knapp's eleven printed locators and the legal author edition, Etingof's institutional copy with its countable-base caveat, and Conway's DOI with its uncertified status; nothing further is asked of the author here.

## Verified sound

**Gate, dependency check, elaboration.** The worker's gate at this head reports every check zero including `build=0`. The prescribed dependency command printed exactly:

```text
depcheck: 204 roadmaps, 1656 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, both equal to `lake-manifest.json`) exited 0 with exactly fourteen "declaration uses `sorry`" warnings at lines 39, 101, 116, 123, 135, 154, 169, 182, 205, 214, 221, 233, 253, 266 and nothing else. A scratch file importing the module and running `#check @name` on all nineteen declarations (fourteen theorems, `IsGFinite`, `gFiniteSubmodule`, `compactCharacter`, the two local Borel instances) elaborated; I compared each displayed type with its README sentence: Banach density carries `[CompleteSpace E]` and the orbit-continuity hypothesis; the countability theorems carry `[CompactSpace G] [T2Space G]`, the L² ones `[MeasurableSpace G] [BorelSpace G]`; the product-dual theorems carry `[∀ j, CompactSpace (G j)] [∀ j, T2Space (G j)]` and `character_finite_coordinates` deliberately only `IsTopologicalGroup`; the two definitions keep only the algebraic data their bodies use. Nothing changed and no binder was lost.

**Padding probe.** On a scratch copy with every `sorry` replaced by `first | (simp; done) | rfl | infer_instance`, all fourteen declarations fail (the reported error at each is the last alternative's), so none closes in one tactic. By reading, none restates a definition, mirrors a Check or computes a value; `exists_su2_of_multiplicities` requires an actual direct-sum construction. No padding.

**Lean form.** Single `import Mathlib` plus two `TauCeti.*` modules that exist at the pin; one module docstring naming the three headline groups that are not statable (continuous representation ring and root dictionary, multiplicity-space comparison, Hilbert–Schmidt comparison) with the missing carrier of each; `theorem` only (zero `lemma`); no `set_option`, `#eval`, `#print axioms` or `True` placeholder; both `def`s have real bodies; 275 lines. Every backticked name of the roadmap's own in the README is declared in the file, and the resolver's run found no unresolved name or citation.

**Headline inventory.** README headlines and their acceptance statements, all in `Suggested.lean`:

| README headline | Statement |
| --- | --- |
| §1.2 scalar invariant metrics | `positive_selfIntertwiner_existsUnique_scalar`, :39 |
| §2.1 Banach G-finite density | `gFiniteSubmodule_dense`, :101 |
| §3.1 countability, metrizability, circle products | :116, :123, :135 |
| §4.1 finite coordinates, product duals, torus characters | :154, :169, :182 |
| §5.1 class/character bijection, uniform density, Fourier basis | :205, :214, :221 |
| §6.9 U(2) weight recognition | `u2_weight_character_iff`, :233 |
| §7.1 SU(2) multiplicities, faithfulness, realization | :253, :266 |
| §0.2 Hilbert–Schmidt comparison; §1.3 multiplicity blocks; §§6.1–6.8 | docstring: no Hilbert–Schmidt carrier, no chosen isotypic decomposition, no continuous representation ring, maximal torus or finite central cover at the pins |

The missing carriers were checked: neither pinned library has a Hilbert–Schmidt operator type (Tau Ceti's `TraceCoefficient/HilbertSum.lean` and `IsotypicBlock/Basic.lean` only use the finite-dimensional trace form on blocks); neither has maximal tori of compact Lie groups or a continuous representation ring (`Algebra.GrothendieckAddGroup`, `Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean:36`, is the bare additive localization the README cites as a carrier only).

**Supplier contract, Tau Ceti at `a91d3aaf`.** Every module in the contract exists and every named declaration was opened: `haarProb`, `haarProb_def`, `haarProb_apply_univ` (`Compact/Haar.lean:93–113`); `haarAverage` (`Averaging.lean:59`); `gramOperator` (`Unitarizable.lean:125`), `isUnitarizable` (`:271`); `exists_isUnitary_congr` (`UnitaryModel.lean:92`); `IsUnitary` (`Continuous/Unitary/Basic.lean:52`, every `π g` preserves the inner product); `exists_orthogonal_irreducible_decomposition` (`OrthogonalDecomposition.lean:194`); `exists_eq_smul_one_of_isIrreducible` (`Continuous/Schur.lean:86`); `matrixCoeff` (`Continuous/MatrixCoefficient.lean:73`, `g ↦ ⟪π g v, w⟫`, which is the README's coefficient convention), `matrixCoeffLp` (`Compact/MatrixCoefficient.lean:73`); `schur_orthogonality_self` and `_basis` (`SchurOrthogonality.lean:109,127`, with `IsUnitary` and `IsIrreducible` hypotheses and the conjugation on the first vector factor); `representativeStarSubalgebra_dense` (`RepresentativeDensity.lean:142`); `integratedOperatorL1`, `_toL1`, `norm_…_le`, `comp_…`, `tendsto_…_apply` (`Continuous/Integrated/Basic.lean:141,178,188,198,403`): the integrated form is defined for an additive `G` acting through `Multiplicative G`, covariance uses `-h + g` and left invariance with `[CompleteSpace E]`, and the convergence theorem's section variables (`:392–397`) carry no `SecondCountableTopologyEither`, confirming the README's "no second countability or separability" sentence (only the convolution identity, `:284`, asks for it, and the README does not use it); `IrrepModel` (`PeterWeyl.lean:142`, a structure bundling dimension, representation, parameter continuity, unitarity and irreducibility separately), `IrrepClass` (`:668`, a quotient in the universe of `G`), `stdPeterWeylBasis` and `coe_stdPeterWeylBasis` (`:711,721`); `characterBasis`, `coe_characterBasis` (`Character/Basis.lean:346,356`); the three Frobenius–Schur theorems (`FrobeniusSchur/InvariantForm.lean:135,148`, `StructureMap.lean:130`); `SU2.exists_isConj_torusHom` (`SU2/TorusConjugacy.lean:153`), `symPower_torusHom_weightBasis` (`SU2/Weight.lean:134`, eigenvalue `z ^ (2i − d)` by `weight_def` at `:108`), `symPowerModel` and `existsUnique_nonempty_equiv_symPower` (`SU2/Exhaustion.lean:99,299`), `weyl_integration_formula` (`SU2/Weyl/Integration.lean:146`); `fourierPeterWeylIndexEquiv` (`FourierPeterWeyl.lean:123`, with `fourierPeterWeylIndexEquiv_apply : … = -x.1`, the sign the README records), `peterWeylFamily_fourierIrrepModel` (`:147`); `fourierPontryaginDualEquiv` (`Analysis/Fourier/AddCircle.lean:246`); `Hodge.complexificationConjugation`, `_toEquiv_tmul` (`Geometry/Hodge/Conjugation.lean:112,124`, `z ⊗ v ↦ conj z ⊗ v`), `LinearMap.map_eigenspace_baseChange` (`:143`); `virtualCharacters` (`CharacterTable/VirtualCharacter.lean:132`, an additive subgroup of all functions, which is why the README refuses to use its full carrier).

**Supplier contract, Mathlib at `6b7abb3c`.** `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:54`, a monoid hom into `V →L[R] V`; no continuity in `g`, as the README says), `ContRepresentation.toRepresentation` (`:72`), `ContIntertwiningMap` (`:80`); `Representation.IsIrreducible` (`Irreducible.lean:29`, `IsSimpleOrder` of subrepresentations, hence `V ≠ 0`) and `IsIrreducible.finrank_eq_one_of_isMulCommutative` (`:85`, hypotheses: finite dimension, algebraically closed field, `[IsMulCommutative G]`, no topology); `LinearMap.continuous_of_finiteDimensional` (`Topology/Algebra/Module/FiniteDimension.lean:282`, `[T2Space E] [FiniteDimensional 𝕜 E]`); `Summable.countable_support_ennreal` (`Topology/Algebra/InfiniteSum/ENNReal.lean:553`, hypothesis `∑' f ≠ ∞`); `Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` (`Analysis/SpecialFunctions/Complex/Circle.lean:483`, hypothesis `∀ n > 0`, which the README's "all positive powers" matches); `PontryaginDual` with `instance [CompactSpace A] : DiscreteTopology (PontryaginDual A)` (`Topology/Algebra/PontryaginDual.lean:84`); `ContinuousMap.toLp_denseRange` (`MeasureTheory/Function/ContinuousMapDense.lean:351`, `[μ.WeaklyRegular] [IsFiniteMeasure μ]`); `Representation.character` (`RepresentationTheory/Character.lean:55`, the trace); `FDRep` (`FDRep.lean:63`); `HilbertBasis` (`Analysis/InnerProductSpace/l2Space.lean`, which has no separability-versus-countable-index lemma, so §3.1's bridge is correctly owned here).

**Cross-roadmap citations, resolved on main or at the indexed open head.**

| Citation | Where it resolves |
| --- | --- |
| LieGroups Layers 0, 2–7 | main `RepresentationTheory/LieGroups/README.md:233,275,300,326,358,383,407`; Layer 2 states Cartan's automatic-smoothness corollary (`:297–299`); Layer 6 states tori as `Circle^r`, torus exhaustion and conjugacy, `N(T)/T` and Weyl integration (`:385–400`) |
| LieHighestWeight Layers 0–7, 9 | main `RepresentationTheory/LieHighestWeight/README.md:319,351,370,405,537,567,773,931,1432`; dominant-integral classification at `:549–562`, lower-weight bound `dominantWeightBelow` at `:793–799`, formal characters at `:806–815`; the precursor at `:608–616` consumes main's CompactGroups "invariant Hermitian forms, complete reducibility and character orthogonality" (R01) |
| OperatorTheory/OperatorIdeals Part C, OI-C01–OI-C11 | main `OperatorTheory/OperatorIdeals/README.md:530,540,558` (Part C runs OI-C01–OI-C14) |
| Completed/OrthogonalL2Bases Part B | `Completed/OrthogonalL2Bases/README.md:245` |
| CharacterTheory Layers 0–4 | main `RepresentationTheory/CharacterTheory/README.md:260,302,…`; its own supplier table at `:231–235` cites main's CompactGroups Layer 5 (R01) |
| CharacteristicClasses C5.1 | main `CharacteristicClasses/README.md:1060` (section C5) with labels C5.1–C5.5 at `:1224,1237,1371,…` |
| AutomorphicFormsOnReductiveGroups §§2.1, 2.7 | open head (#1037) `:300,468`; the gap text at `:52,302–309` matches §2.1 here item by item (`IsGFinite`, `gFiniteSubmodule`, `gFinite_add/smul/map`, `gFiniteSubmodule_dense` as density of the submodule as a set) |
| SmoothBanachRepresentations §4.1 | open head (#1145) `:286–297`; its gap statement at `:58` agrees |

Direction: this roadmap has no `*Needs:*` line on any open roadmap; the two open consumers are named only as consumers. AutomorphicFormsOnReductiveGroups sits at line 63 of the merge order and consumes this folder's §2.1 through a declared gap; that is its contract, not a finding here.

**Ownership by object.** Searched main, the board packages index and the 440 indexed open heads for the field-general orbit-span predicate and Banach density (only AutomorphicFormsOnReductiveGroups and SmoothBanachRepresentations, as consumers; NoncompactQuantumSymmetry `:654` builds on "the supplied prefix"), the dual of an arbitrary product of compact abelian groups (nothing: ArithmeticGaloisDuality `:3376` is finite products of local duals; JacobianChallenge `:384` is a projection/inclusion remark), the compact abelian Fourier basis indexed by `PontryaginDual` (AdelicAlgebraicGroups and PhiGammaModules consume it; no open roadmap constructs it), the U(2) weight criterion and the SU(2)→U(n) partition count (no owner). At the pins: no `IsGFinite`-type predicate, no Pontryagin dual of a product, no separability-versus-index lemma for `HilbertBasis`, no `IrrepClass` countability or metrizability statement (Tau Ceti's `SecondCountableTopologyEither` hypotheses at `ClassFunctionLp.lean:54`, `Character/Basic.lean:62` are hypotheses, not theorems). The library owns what the contract lists; this roadmap owns the rest, subject to R01 on where it lives.

**Sources.** Knapp, author edition, cache `5ba1b91d` (printed page = PDF page − 18). All eleven listed locators were opened:

| Locator | Cache lines, printed page | Supports |
| --- | --- | --- |
| Proposition 2.13 | `knapp line 6121`–6123, p.136 | Cartan subalgebra = maximal abelian with simultaneously diagonalizable ad, in a complex semisimple algebra |
| Proposition 4.8, Corollary 4.9 | `knapp line 10109`–10120, p.240 | intertwiner dichotomy; self-intertwiner of a finite-dimensional irreducible is scalar |
| Proposition 4.24, Corollaries 4.25–4.26 | `knapp line 10491`–10511, p.249 | Ad-invariant inner product, ad skew; `g = Z ⊕ [g,g]` with `[g,g]` semisimple; Killing form negative semidefinite |
| Theorem 4.29 | `knapp line 10549`–10581, pp.250–251 | compact connected: `G = (Z_G)_0 G_ss`, `G_ss` closed with finite centre; negative definiteness on `[g,g]` at `:10572`–10577 |
| (4.31), (4.32) | `knapp line 10683`–10714, pp.253–254 | root-space decomposition with centre in the zero space; `Ad(t)X = ξ_α(t)X`, differential of `ξ_α` is `α` on `t₀`, imaginary there |
| Propositions 4.58–4.59 | `knapp line 11115`–11141, pp.264–265 | analytically integral iff `λ(H) ∈ 2πiℤ` on `ker exp`; implies `2⟨λ,α⟩/|α|² ∈ ℤ` |
| Proposition 4.67 | `knapp line 11241`–11245, p.267 | index of analytically integral forms = kernel order (see Source issues) |
| Theorem 4.69 | `knapp line 11261`–11263, p.268 | compact semisimple: finite fundamental group, compact universal cover |
| Theorem 5.107 | `knapp line 14142`–14152, p.334 | simply connected compact semisimple: algebraically integral ⇒ analytically integral |
| Theorem 5.110 and proof | `knapp line 14203`–14247, pp.335–336 | compact connected: irreducibles ↔ dominant analytically integral forms; uniqueness uses the central scalar and the derived highest weight (`:14219`–14227), descent through `exp t₀ ⊇ Z` (`:14238`–14247) |

Etingof, OCW lecture 11, cache `5093fe43` (printed = PDF page + 198): §37.1 at `etingof line 6`–11 and Theorem 37.5 at `:151`–157 both assume a countable base, as the README says (p.199, p.202). Conway's Course in Functional Analysis is not in the cache (the cached `conway.pdf` is an unrelated 16-page scan); it is paywalled and the README marks it locator-only.

**Adversarial table.** Computed this round; rows cover the fifteen seeded targets, the headline statements and the targets of R02–R03. Elaboration and finite instances are evidence about conventions and hypotheses, not proofs of the universal statements.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: coefficient vs trace | Circle scalar action at `i`, `v=w=1` | `⟪i·1, 1⟫ = conj(i) = −i`; trace `i`; native index `fourierPeterWeylIndexEquiv x = −x.1` | consistent; none |
| Conventions: nonabelian coefficient | S₃ standard rep, 3-cycle rotation by 2π/3 | `⟪Re₁,e₁⟫ = cos(2π/3) = −1/2`; identity gives 1; zero vector 0 | consistent; none |
| Irreducibility convention | `V = 0`; trivial ℂ; trivial ℂ² | lattice sizes 1, 2, 3; `IsSimpleOrder` false, true, false | matches "V ≠ 0 and no proper nonzero invariant subspace"; none |
| 0.1 tensor and dual | C₃ character ω | tensor trace ω²; dual trace ω⁻¹ = ω²; using the original instead gives ω | consistent; none |
| 0.2 HS norm identity | two atoms of mass ½, `k = 1` | `A_k` = projection onto constants, HS² = 1; `∫|k|² = 4·¼ = 1` | consistent; none |
| 0.2 adjoint vs transpose | same measure, `k(1,2) = i` | matrix entry `⟪A e₂, e₁⟫ = √2·(i√2/2)·½ = i/2`; adjoint entry at (2,1) `−i/2`; HS² = ¼ = `|i|²·¼` | consistent; none |
| 0.2 degenerate measure | `μ = 0`, `k = 1` | `A_k = 0`, both norms 0, `k ≠ 0` | injectivity needs full support, as stated; none |
| 1.1 Gram slot | ℂ, `T = 2I` | `h(1,i) = ⟪1, 2i⟫ = 2i`; swapped slot `⟪2i, 1⟫ = −2i` | consistent; none |
| 1.1 invariance ⇔ commutation | ℂ², `T = diag(1,2)`, swap action S | `h(Se₁,Se₁) = 2 ≠ 1`; `STe₁ = e₂`, `TSe₁ = 2e₂` | both sides fail together; none |
| 1.2 Lean theorem, existence | irreducible ℂ, `T = 2I` | Schur `c = 2`; `re⟪1,2⟫ = 2 > 0`; unique since `V ≠ 0` | consistent; none |
| 1.2 Lean theorem, `hself` needed | irreducible ℂ, `T = (1+i)I` | `re⟪v,Tv⟫ = ‖v‖² > 0` but `c = 1+i ∉ ℝ`; `T` not self-adjoint | hypothesis is load-bearing; none |
| 1.2 reducible control | trivial ℂ², `T = diag(1,2)` | not scalar; `IsIrreducible` false (invariant line) | excluded by hypothesis; none |
| 1.2 isometry | `h₂ = 4h₁` | `h₂(v/2, v/2) = h₁(v,v)`; inverse `2I` | consistent; none |
| 1.3 commutant, block order | `S ⊕ S`, `E₁₂E₂₁` | `= E₁₁`, `E₂₁E₁₂ = E₂₂`; `E₁₂† = E₂₁` | consistent; none |
| 1.3 basis-change direction | `U = diag(1,i)`, `A = [[1,1],[1,2]]` | `UAU† = [[1,−i],[i,2]]`; `U†AU = [[1,i],[−i,2]]`; swap `U = U†` cannot separate | R02 |
| 1.3 empty and simple blocks | `V = 0`; one copy | product over ∅ has one element, vacuously positive; `ℂ` with cone ℝ>0 | consistent; none |
| Finite-group averaging | C₃ trivial action | normalized average `h`; unnormalized `3h` | consistent; none |
| 2.1 `IsGFinite`, submodule | `0`; nonzero `v` in a trivial rep over 𝔽₂; modes 0 and 1 on C(S¹) | orbit-span dimensions 0, 1, 2; `span(orbit(v+w)) ≤ span(orbit v) ⊔ span(orbit w)` (bodies at :74–83) | consistent; none |
| 2.1 strong vs norm continuity | rotations `R_θ` on C(S¹), θ ≠ 0 | `‖R_θ − I‖ = 2`; each orbit continuous | hypothesis form correct; none |
| 2.1 compactness needed | ℤ-shift on ℓ²(ℤ), `δ₀` | translates `δ_n` independent, orbit span infinite-dimensional, G-finite false | outside the theorem's hypotheses; none |
| 2.1 covariance | S₃ left regular, `f = 6δ_t`, `h = (12)`, `t = (23)` | `T_f = π(t)`; `π(h)T_f = π(ht) = π((123))`; reversed `π((132))` | matches native `-h + g`; none |
| 2.1 mass normalization | trivial action, kernels of mass 1 and 2 | `T_f v = v`, `2v` | consistent; none |
| 2.1 error estimate | `C_π = 2`, `‖v‖ = 3`, `‖p−u‖₁ < ε/12` | `C‖p−u‖₁‖v‖ < ε/2`; total `< ε` | consistent; none |
| 3.1 second countable ⇔ countable dual | trivial group; Circle; `Circle^J`, J uncountable | (true,true) with dual size 1; (true,true) with dual ℤ; (false,false) with dual ⊇ {χ_j} | consistent; none |
| 3.1 separable L² ⇔ countable dual | same | Hilbert-basis index sizes 1, ℵ₀, ≥ |J|; unit vectors at distance √2 | consistent; none |
| 3.1 coordinate orthogonality | `χ_j, χ_k`, j ≠ k | flipping coordinate j by −1 sends `∫ conj χ_j χ_k` to its negative, so 0; `‖χ_j − χ_k‖² = 2` | consistent; none |
| 3.1 per-vector support | `χ_j`; 0 | supports of size 1 and 0; `Summable.countable_support_ennreal` needs `∑' ≠ ∞`, satisfied by Parseval | consistent; none |
| 3.1 Borel choice | empty product; `Circle^J` uncountable | σ-algebra {∅, G}; complement of the identity is open hence Borel, not cylinder-measurable | the local instances choose the right σ-algebra; none |
| 4.1 finite coordinates, proof step | tail element with `χ(x) = −1` | `x¹ ∉ centeredArc(π/2)`; Mathlib lemma hypothesis `∀ n > 0` | consistent; none |
| 4.1 finite coordinates, factorization | empty J; `S₃ × C₃`, sign × χ at ((12), g) | `1` = empty product; `(−1)·ω = −ω`, factors noncommutative | consistent; none |
| 4.1 product dual inverse | `Circle²`, exponents (1,−1), point (i,−1) | `i·(−1)⁻¹ = −i`; restrictions to `ι_j` recover `z`, `z⁻¹`; `pr_k ∘ ι_j = 1` for k ≠ j | both inverse laws; none |
| 4.1 torus characters, uniqueness | Circle, exponents 0, 1, −1 at `i` | `1, i, −i`; `z ↦ z^m` trivial iff `m = 0` | `∃!` justified; none |
| 4.1 topology distinction | `χ_n` on `Circle^ℕ` | each fixed restriction eventually 1; `χ_n(−1,−1,…) = −1`; dual discrete so no convergence | consistent; none |
| 5.1 class/character bijection | trivial group; C₃ character; zero rep; trivial ℂ² | dims 1, 1, 0, 2; only the first two are irreducible inputs to `finrank_eq_one_of_isMulCommutative` | consistent; none |
| 5.1 scalar-action pinning | Circle, scalar χ(z)=z | Lean: `rep g = (e i g) • id`, so `e i = χ`; PW coefficient is `conj χ = χ⁻¹`, index −1 in the native circle basis | matches README reindexing sentence; none |
| 5.1 character operations | Circle χ, χ⁻¹ at `i` | `i·(−i) = 1`; `conj(i) = −i = χ⁻¹(i)`; trivial character 1 | consistent; none |
| 5.1 orthonormality, Parseval | C₃ χ, χ²; `f = c_χ + 2c_ψ` | pairing `(1+ω+ω²)/3 = 0`, diagonal 1; coordinates (1,2), `‖f‖² = 5` | consistent; none |
| 5.1 uniform density | trivial group; C₃ | constant 1 spans ℂ; Fourier matrix of rank 3 spans ℂ³ | consistent; none |
| 6.1 group completion | trivial group | `R = ℤ`, unit 1, zero 0; `−[ℂ]` has dimension −1 and is not genuine | consistent; none |
| 6.2 period lattice | period 2π, slopes 1 and ½ | `exp(2πi) = 1`; `exp(πi) = −1`; Knapp (i) `λ(H) ∈ 2πiℤ` with `λ = iℓ` ⇔ `ℓ(H) ∈ 2πℤ` | consistent; none |
| 6.2 weights, dual labels | `z ↦ z⁻¹` at `i`; trivial ℂ²; zero module | weight −1, trace −i; weight 0 with multiplicity 2, trace 2; trace 0 | consistent; none |
| 6.3 conjugation on weights | real rotation plane, `v = e₁ − ie₂` | `R_θ v = e^{iθ}v`; `c(v) = e₁ + ie₂` has `e^{−iθ}`; `c(iv) = −ic(v)`; `c² = id` | matches `z ⊗ v ↦ conj z ⊗ v`; none |
| 6.4 action law | `n` replaced by `nt`, t ∈ T; `(w₁w₂)·χ` | `χ((nt)⁻¹ s (nt)) = χ(n⁻¹sn)`; `χ((n₁n₂)⁻¹ s n₁n₂) = (w₁·(w₂·χ))(s)` | left action; none |
| 6.4 SU(3) Check | `s₁ = (12)`, `s₂ = (23)`, `n_σ e_j = e_{σ(j)}` vs `e_{σ⁻¹(j)}` | `(s₁s₂)·e₁ = e₂` and `(s₂s₁)·e₁ = e₃`, or `e₃` and `e₂` | R03 |
| 6.5 covers and kernels | Circle; SU(2)→SO(3); `S¹×SU(2)→U(2)` | kernel orders 1, 2, 2 (`zA = I ⇒ z² = 1`); Lie dimensions 1 = 1+0, 3 = 0+3, 4 = 1+3 | consistent; none |
| 6.5 torus descent parity | U(2) pairs (q,a) = (1,1), (0,1) | `(−1)^{q−a}` = 1, −1; `t₁ᵃt₂ᵇ` pulls back to `z^{a+b}w^{a−b}`, `q − a' = 2b` even | consistent; none |
| 6.5 root dictionary | SU(2), `H = diag(1,−1)` | `[H,E₁₂] = 2E₁₂`; `α(diag(iθ,−iθ)) = 2iθ` imaginary, `α(H) = 2`; `z ↦ zⁿ` has `λ(H) = n`; `λ(H) = ½` gives `exp(iπ·…)`: value `iπ` on `diag(2πi,−2πi)` whose exponential is I | matches (4.32), 4.58; none |
| 6.5 reductive control | U(2) | `𝔲(2) ⊗ ℂ = 𝔤𝔩₂`, Killing form `B(I,I) = 0`; dictionary on `𝔰𝔩₂` only | consistent; none |
| 6.5 index = kernel order | SU(2)→SO(3) | SU(2) lattice ℤ, SO(3) lattice 2ℤ, index 2 = |{±I}| | matches 4.67; none |
| 6.6 descent, uniqueness | SU(2) weights 1, 2; U(2) pairs (1,0), (2,1) | `−I ↦ −1, +1`; central exponents 1 and 3, at `i`: `i`, `−i`; derived coordinate 1 = 1 | central character needed, as Knapp `:14221`–14223; none |
| 6.7 restriction ring | trivial group; Circle; SU(2) | ℤ = ℤ; ℤ[t,t⁻¹] = ℤ[t,t⁻¹]; `χ₂ = (t² + t⁻²) + 1`, leading coefficient 1; `t² + t⁻² = χ₂ − χ₀` | positive-cone distinction correct; none |
| 6.8 U(n) congruence | U(3), λ = (2,1,−1); fundamental (1,0) with q = 0 | q = 2, (a₁,a₂) = (1,2), `1 + 4 = 5 ≡ 2 (mod 3)`; `ζ^{0−1} = ζ⁻¹ ≠ 1` | consistent; none |
| 6.8 ranks 0, 1 | U(0), U(1), U(2) | ℤ; ℤ[t,t⁻¹] with vacuous congruence; `(t₁t₂)(t₁t₂)⁻¹ = 1` | consistent; none |
| 6.9 Lean iff, ⇒ | `L_(p,q)`, weight (a,b) with a ≥ b | (a,b) weight iff `a+b = p+q`, `q ≤ b` (then `b ≤ (p+q)/2 ≤ p`); (a+1,b−1) weight ⇒ (a,b) weight; each summand contributes ≥ 0 to `f(a,b) − f(a+1,b−1)`; swap matrix gives symmetry | consistent; none |
| 6.9 Lean iff, ⇐ | string sum s, `m_(p,q) = f(p,q) − f(p+1,q−1)` | telescoping `Σ_{p ≥ a} m_(p,q) = f(a,b) − 0` by finite support | consistent; none |
| 6.9 instances | f = 1,2,1 at (2,0),(1,1),(0,2); f = 1 at (1,−1),(−1,1); f = 0 | differences 1,1, `Sym² ⊕ det`, dim 1+2+1 = 3+1; `f(1,−1) = 1 ≤ f(0,0) = 0` false, both sides false; n = 0, both sides true | consistent; none |
| 6.9 negative powers | `det⁻¹` at `diag(i,−1)` | trace `(i·(−1))⁻¹ = i`; entries have modulus 1 so zpow is safe | consistent; none |
| 7.1 kernels | `Sym^d` at `z = i`, `z = −1`, d = 0,1,2 | eigenvalues `i^{2k−d}`: `(−i,i)`, `(−1,1,−1)`; at −1: `(−1,−1)`, `(1,1,1)`; kernels SU(2), {I}, {±I} | consistent; none |
| 7.1 Lean uniqueness and n = 0 | characters `χ_d` orthonormal; zero rep | `m` determined by the trace identity alone; n = 0: `m = 0`, `π` not injective, no odd d | consistent, including the degenerate case; none |
| 7.1 realization vs unitarity | `Sym²` monomial model | monomial basis orthogonal, not orthonormal in the invariant form; character unchanged under equivalence | `exists_su2_of_multiplicities` asks for a unitary π with the same trace; none |
| 7.1 counts | n = 0…4 | p = 1,1,2,3,5; p_odd = 1,1,1,2,2; differences 0,0,1,1,3; n = 4 classes {4},{2,2},{2,1,1} | consistent; none |
| Etingof scope | Theorem 37.5 | hypothesis "countable base" at `etingof line 152`; this roadmap's §3.1 drops it and proves the equivalence instead | correctly cited as the countable case only; none |

## Not verifiable

- Conway, *A Course in Functional Analysis*, VII.9 Exercises 8–11: paywalled (DOI 10.1007/978-1-4757-4383-8), not in the sources cache, cited locator-only and marked so in the README. The four exercises' mathematics was checked independently above; the attribution was not.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap service's grep over the indexed heads (index of 2026-11-03T18:00:57Z).

## Source issues

- **Misprint** in etingof at Corollary 37.7 proof, printed p.203 (`etingof line 176`): the source says the quotient by the kernel of the first m irreducibles embeds into the unitary group of the first n; it should be the first m; affects the proof.
- **Gap** in knapp at Proposition 4.67 proof, printed p.267 (`knapp line 11245`): the source says the index statement follows from Corollary 4.47 and Proposition 4.58; it should also show every character of the finite kernel extends to the covering torus; affects the proof; corrected in print at the appended Corrections as of June 30, 2023, pp.814–815 (`knapp line 34709`–34727).
