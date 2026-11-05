# Review of CompactGroups (pull request #1047 at 5ccf6cc)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroups/`
**Verdict:** needs changes

Full independent review of the same head the previous review read (the folder has zero changed lines since `5ccf6cc`; nothing outside the folder changed). The gate, the dependency check, direct elaboration, seventeen signature checks and a fourteen-declaration one-tactic probe all pass; every sampled locator is at the stated printed page of a legal text; the fourteen admitted statements survive the adversarial pass recomputed below. One blocking finding remains, carried unchanged since the second review and answered but not applied by the last repair: the pull request overwrites a roadmap that main records as done, in that roadmap's own folder, under its title, with renumbered layers that roadmaps on main cite. Nothing else is asked of the author.

## R01 (P2) — Keep the completed base roadmap in this folder; put the new programme in CompactGroups Part II

Re-raised: H01 (repair report for `5ccf6cc`).

**Location:** `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:1–7` (“Build on normalized Haar measure, finite-dimensional unitarization, Peter–Weyl, compact character theory and the SU(2) symmetric-power classification. The comparison targets concern invariant metrics …”), `:11–19`, the layer headings at `:203, 286, 411, 498, 565, 641, 721, 1213`, and `Suggested.lean:1–22`; the whole folder is a replacement.

**Claim:** Carried from r2 R05, r3 R02 and r4–r9 R01. Main's CompactGroups is a finished roadmap (Layers 0–6 done). This head replaces its README and `Suggested.lean` in the same folder, under the same title, by a different programme with renumbered layers: Layer 0 (normalized Haar measure) becomes interface comparisons, Layers 1–2 (unitarizability, complete reducibility) become invariant metrics and Banach density, Layer 4 (Schur orthogonality) becomes duals of arbitrary products, Layer 5 (Peter–Weyl) becomes compact abelian Fourier theory, Layer 6 (characters) becomes global forms. The base survives only as a list of library names under "Scope and ownership". The brief's contract is that an existing roadmap is built on, never re-planned, and that an extension is a Part II.

**Why the repair report's reason fails:** The report answers H01 as correct but "not one this job can make" because the repair job may edit only the two files of the existing folder. That is a statement about the repair worker's allowance, not about the pull request: the author can create the folder and the family-index line, and `accepted` means the folder is ready for a human's final approval, which a folder that overwrites a done roadmap is not. The finding stands on the pull request; since the repair pipeline cannot act, a human has to.

**Witness (re-checked on main `a0ad405` at this head):** main `TauCetiRoadmap/RepresentationTheory/STATUS.md:6` records Layers 0–6 of this folder as `done` with a pinned README hash and `:43` lists CompactGroups under Done; main's `CompactGroups/README.md` has the headings "Layer 0: normalized Haar measure and averaging" through "Layer 6: characters of compact groups" (`:205–390`), none of which this head carries; the family index `RepresentationTheory/README.md:47–49` (byte-identical at this head and on main) still describes the folder as Haar through Peter–Weyl, characters and the SU(2) engine. Consumers resolve to the wrong mathematics at this head: main `AmenableGroups/README.md:90` links `CompactGroups/README.md#layer-0-normalized-haar-measure-and-averaging` and main `RepresentationTheory/LieHighestWeight/README.md:915` links `#layer-6-characters-of-compact-groups`, two fragments absent here; main `CharacterTheory/README.md:114,569,583,708` consume "CompactGroups Layer 5 (the isotypic decomposition)", which at this head is compact abelian Fourier theory; main `PseudodifferentialOperators/README.md:131,1471` consume "Layers 0–3 normalized averaging"; main `BordismFormalGroups/README.md:2631` consumes "Layers 1–2, unitarizability"; main `RandomMatrices/README.md:173,693` consume "Layer 0 and `weyl_integration_formula`"; main `GeneralizedCohomology/README.md:2494` and `CharacteristicClasses/README.md:1164` consume "Layer 0's normalized Haar". The renumbering has already split the other side: main `TopologicalKTheory/README.md:83,972` and its open revision cite "Layer 5.1" for G-finite vectors at this pull request's earlier head, AutomorphicFormsOnReductiveGroups (open, `:52,302,308–309,314`) and SmoothBanachRepresentations (open, `:9,58,294`) declare `gap:banach-gfinite-density` against "CompactGroups Layer 5", which at this head is §2.1. No `CompactGroupsPartII` folder exists on main, at this head, or in any indexed open pull request (service grep, no match).

**Exact repair:** Restore main's `README.md` and `Suggested.lean` in this folder (with at most the corrections this pull request found necessary to the base text). Create `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/` carrying this head's README and `Suggested.lean` under `namespace TauCetiRoadmap.CompactGroupsPartII`, with an introduction saying where the base stops (native Haar, unitarization, Peter–Weyl, characters, SU(2)) and citing the base by its main layer numbers; add the Part II line to the family index, which is this pull request's own. Keep the fourteen statements, the consumer-declared gap and the Knapp locator chain verbatim.

**Repair test:** No mathematical statement changes; every consumer citation above resolves again on main's text; the two gap declarations are then repointed to "CompactGroupsPartII §2.1" by their consumers. The nominal loop "LieHighestWeight's precursor to Layer 6 consumes main's CompactGroups; this head's Layer 6 consumes LieHighestWeight Layers 0–6" disappears, because Part II is placed after LieHighestWeight.

## Previous findings

- r9 R01 — not repaired: `README.md:1–19` and the layer headings are unchanged (zero changed lines); main still records the folder as done; the fragments cited above are still absent. The repair report answered it as outside the job's allowance. Carried and re-raised as R01.
- r8 R02 (§1.3 basis-change witness) — repaired at `5ccf6cc` and re-verified this round: `README.md:365–368` states that `d'` reads the new coordinates `m' = U_i m` and derives `A_i' = U_i A_i U_i†`; the Check at `:388–392` gives `[[1,−i],[i,2]]` against `[[1,i],[−i,2]]` (both recompute, table).
- r8 R03 (§6.4 matrix convention) — repaired at `5ccf6cc` and re-verified: Conventions `:59–62` fix right-to-left composition and `n_σ e_j = e_{σ(j)}`; the Check at `:865–871` states the realization and the determinant correction (all values recompute, table).

## Verified sound

**Gate, dependency check, elaboration.** The worker's gate at this head reports every check zero, including `build=0`, and `OK`. The prescribed dependency command printed exactly:

```text
depcheck: 206 roadmaps, 1686 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean` at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, both equal to `lake-manifest.json`) exited 0 with exactly fourteen "declaration uses `sorry`" warnings at lines 39, 101, 116, 123, 135, 154, 169, 182, 205, 214, 221, 233, 253, 266 and nothing else. The worker's own signature extraction failed only because its lake directory lacks the `PeterWeyl` object file; the worktree's does not, and I elaborated directly.

**Signature check.** A scratch file whose first 274 lines are byte-identical to `Suggested.lean`, followed by `#check @name` for the seventeen declarations of the roadmap's own (fourteen theorems, `IsGFinite`, `gFiniteSubmodule`, `compactCharacter`), elaborated; each displayed type was compared with its README sentence. `positive_selfIntertwiner_existsUnique_scalar` carries `[Group G]`, `[FiniteDimensional ℂ V]`, irreducibility, self-adjointness and strict positivity, no topology on `G` (§1.2: "requires neither compactness nor parameter continuity"). `gFiniteSubmodule_dense` carries `[CompactSpace G] [T2Space G] [CompleteSpace E]` and the orbit-continuity hypothesis (§2.1). The two countability theorems carry `[CompactSpace G] [T2Space G]`, the L² ones also `[MeasurableSpace G] [BorelSpace G]`; `not_separable_L2_circleProduct` takes `¬ Countable J`. `character_finite_coordinates` carries only `[∀ j, IsTopologicalGroup (G j)]` (§4.1: "without compactness or commutativity"); `exists_productDualEquiv` adds `CommGroup`, `CompactSpace`, `T2Space` per factor and fixes the discrete topology by `letI`; `circleProduct_character` is an `∃!` over `J →₀ ℤ`. The three Layer 5 theorems carry `[CommGroup G]` with compactness and Hausdorffness; `exists_characterBasis` adds the Borel instances. `u2_weight_character_iff` quantifies over `n : ℕ` and a continuous `ContRepresentation` on `EuclideanSpace ℂ (Fin n)`. The two SU(2) theorems carry `Continuous π` and `IsUnitary π`. The two `def`s keep only the algebraic data their bodies use. No binder was lost.

**Padding probe.** On a scratch copy with every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (exact Iff.rfl) | decide`, the elaboration reports exactly fourteen errors, one at each admitted declaration, so none closes in one tactic. By reading, none restates a definition, mirrors a Check or computes a value. No padding.

**Lean form.** Single `import Mathlib` plus two `TauCeti.*` modules that exist at the pin (`RepresentationTheory/Compact/PeterWeyl.lean`, `RepresentationTheory/SU2/Exhaustion.lean`); one module docstring naming the headline groups that are not statable (continuous representation ring and root dictionary, multiplicity-space comparison, Hilbert–Schmidt comparison) with the missing carrier of each; `theorem` only; no `set_option`, `#eval`, `#print axioms` or `True` placeholder; both `def`s have real bodies; 275 lines. Every backticked name of the roadmap's own in the README is declared in the file (gate `readme-ids-missing=0`), and the resolver found no unresolved name or citation.

**Headline inventory.**

| README headline | Statement |
| --- | --- |
| §1.2 scalar invariant metrics | `positive_selfIntertwiner_existsUnique_scalar`, :39 |
| §2.1 Banach G-finite density | `gFiniteSubmodule_dense`, :101 |
| §3.1 countability, metrizability, circle products | :116, :123, :135 |
| §4.1 finite coordinates, product duals, torus characters | :154, :169, :182 |
| §5.1 class/character bijection, uniform density, Fourier basis | :205, :214, :221 |
| §6.9 U(2) weight recognition | `u2_weight_character_iff`, :233 |
| §7.1 SU(2) multiplicities, faithfulness, realization | :253, :266 |
| §0.2 Hilbert–Schmidt comparison; §1.3 multiplicity blocks; §§6.1–6.8 | docstring: no Hilbert–Schmidt carrier (no `HilbertSchmidt` declaration in either pinned library), no chosen isotypic decomposition, no continuous representation ring, maximal torus or finite central cover at the pins |

**Supplier contract at the pins.** Tau Ceti `a91d3aaf`: `IrrepModel` (`Compact/PeterWeyl.lean:142`), `IrrepClass` (`:668`, a quotient in `Type (max u v)`), `IrrepClass.model` (`:675`, `Quotient.out`), `stdPeterWeylBasis` (`:711`, indexed by `Σ i, Fin dim × Fin dim`); `haarProb_def`, `haarProb_apply_univ` (`Compact/Haar.lean:97,113`); `isUnitarizable` (`Unitarizable.lean:271`, a self-adjoint strictly positive `S` with `π(g)* S π(g) = S`); `exists_isUnitary_congr` (`UnitaryModel.lean:92`); `exists_orthogonal_irreducible_decomposition` (`Continuous/OrthogonalDecomposition.lean:194`); `exists_eq_smul_one_of_isIrreducible` (`Continuous/Schur.lean`, algebraically closed field, finite dimension, no topology on `G`, as §1.2 says); `matrixCoeff` (`Continuous/MatrixCoefficient.lean:73`); `schur_orthogonality_self`, `_basis` (`Compact/SchurOrthogonality.lean:109,127`, hypotheses `IsUnitary` and `IsIrreducible`); `representativeStarSubalgebra_dense` (`RepresentativeDensity.lean:142`, closure `= ⊤`, compact group, no Hausdorffness); `integratedOperatorL1`, `_toL1`, `norm_…_le`, `comp_…`, `tendsto_…_apply` (`Continuous/Integrated/Basic.lean:141,178,188,198,403`: additive `G` acting through `Multiplicative G`, `[R1Space G] [BorelSpace G]`, `μ.InnerRegularCompactLTTop`, `[CompleteSpace E]`, and the approximate-identity section `:392–397` carries no `SecondCountableTopologyEither`, which only the convolution section `:284` asks for; the README's "no second countability or separability" sentence is correct); `fourierPeterWeylIndexEquiv` and `_apply` (`FourierPeterWeyl.lean:123,132`, the `−x.1` sign), `peterWeylFamily_fourierIrrepModel` (`:147`), `fourierPontryaginDualEquiv` (`Analysis/Fourier/AddCircle.lean:246`); `characterBasis`, `coe_characterBasis` (`Character/Basis.lean:346,356`); the three Frobenius–Schur theorems (`FrobeniusSchur/StructureMap.lean:130` and the two it rewrites with at `:136`); `SU2.exists_isConj_torusHom` (`SU2/TorusConjugacy.lean:153`), `symPower_torusHom_weightBasis` (`SU2/Weight.lean:134`), `symPowerModel`, `existsUnique_nonempty_equiv_symPower` (`SU2/Exhaustion.lean:299`), `weyl_integration_formula` (`SU2/Weyl/Integration.lean:146`); `Hodge.complexificationConjugation`, `_toEquiv_tmul`, `LinearMap.map_eigenspace_baseChange` (`Geometry/Hodge/Conjugation.lean:112,124,143`); `virtualCharacters` (`CharacterTable/VirtualCharacter.lean:132`, an `AddSubgroup (G → k)`, which is why §6.1 refuses its full carrier). Mathlib `6b7abb3c`: `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:54`, a structure with no continuity in `g`), `toRepresentation` (`:72`); `Representation.IsIrreducible` (`Irreducible.lean:29`, `IsSimpleOrder`, hence `V ≠ 0`); `finrank_eq_one_of_isMulCommutative` (hypotheses `[FiniteDimensional] [IsAlgClosed] [IsMulCommutative G]`, no topology); `Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` (hypothesis `∀ n > 0`); `Summable.countable_support_ennreal` (hypothesis `∑' ≠ ⊤`); `PontryaginDual` with `instance [CompactSpace A] : DiscreteTopology (PontryaginDual A)` (`Topology/Algebra/PontryaginDual.lean:84`); `instance : TopologicalSpace (Multiplicative X)` (`Topology/Constructions.lean:84`, so the `letI` in `exists_productDualEquiv` is the only topology on the direct sum); `ContinuousMap.toLp` (`MeasureTheory/Function/LpSpace/ContinuousFunctions.lean:143`); `Algebra.GrothendieckAddGroup` (elaborates, `(M) [AddCommMonoid M] → Type`); `Analysis/InnerProductSpace/l2Space.lean` contains no separability-versus-countable-index lemma, so §3.1's bridge is correctly owned here.

**Cross-roadmap citations, resolved on main or at the open head.**

| Citation | Where it resolves |
| --- | --- |
| LieGroups Layers 0, 2, 3, 4, 5, 6, 7 | main `RepresentationTheory/LieGroups/README.md:233,275,300,326,358,383,407`; automatic smoothness `:297`; `weylGroup T = N_G(T)/T` finite and `Circle^r` tori `:386–395`; Layer 7 complexification `:407–410` states no Cartan or root identification |
| LieHighestWeight Layers 0–6 | main `RepresentationTheory/LieHighestWeight/README.md:319,351,370,405,537,567,773`; dominant integral classification `:549`; formal characters `:142`, lower-weight bounds in Layer 6 |
| OperatorTheory/OperatorIdeals Part C, OI-C01–OI-C11 | main `OperatorTheory/OperatorIdeals/README.md:540,558` (C runs OI-C01–OI-C14, `:581`) |
| Completed/OrthogonalL2Bases Part B | `Completed/OrthogonalL2Bases/README.md:59,105` |
| CharacterTheory Layers 0–4 | main `RepresentationTheory/CharacterTheory/README.md:260,302,347,397,713` |
| CharacteristicClasses §C5.1 | main `CharacteristicClasses/README.md:1060` (section C5, items labelled C5.1–C5.5 in its own text at `:1224,1237,1371`) |
| AutomorphicFormsOnReductiveGroups §§2.1, 2.7 | open head `e8f59c8`: `:300`, `:486`; its gap text `:52,302–309` matches §2.1 here item by item (`IsGFinite`, `gFiniteSubmodule`, `gFinite_add/smul/map`, `gFiniteSubmodule_dense` as density of the submodule as a set) |
| SmoothBanachRepresentations §4.1 | open head `b04eb8f`: `:286–294`; gap statement `:58` agrees |

Direction: this roadmap has no `*Needs:*` line on any open roadmap; the two open consumers are named only as consumers (Scope and Downstream consumers). The gap `banach-gfinite-density` is declared by those consumers against this folder, not by this roadmap.

**Ownership by object.** Service grep over main and the 444 indexed open heads: no `CompactGroupsPartII` folder or "CompactGroups Part II" anywhere; the orbit-span predicate and Banach density appear only here and in its consumers (AutomorphicFormsOnReductiveGroups, SmoothBanachRepresentations, TopologicalKTheory, NoncompactQuantumSymmetry `:654`, which consumes AutomorphicFormsOnReductiveGroups §2.1); the dual of an arbitrary product, the U(2) outward-difference criterion and the `p(n) − p_odd(n)` count have no other owner. One overlap to record for the human: the LieGroups open revision (`rev` head of #1051, `README.md:641` "Layer 5A: compact Lie-algebra metric and splitting" and `:750` "Compact real roots and the Weyl comparison") builds the Ad-invariant metric, `g = z(g) ⊕ [g,g]`, `t = z(g) ⊕ t_ss`, the root characters `χ_α : T → S¹` with `dχ_α = iα`, the Cartan identification of `t_ss,C` and the root-pairing isomorphism with LieHighestWeight, and main `CharacteristicClasses/README.md:1064–1069` already consumes them from "LieGroups Layer 5A and Layer 6". This head's §6.5 (`README.md:881–885, 903–925`) states the same splitting and dictionary as its own targets, saying (`:27–33`) that LieGroups on main states no Cartan or root identification, which is true of main (`LieGroups/README.md:383–427` has tori, `N(T)/T`, Weyl integration and complexification only). A pull request that revises an existing roadmap is not citable as a supplier, so §6.5 owning the dictionary is the allowed design today; once the LieGroups revision merges, the object has two owners and §6.5 should reduce to citations of LieGroups Layer 5A and Layer 6. Not raised as a finding; recorded here so that whoever merges second reconciles it.

**Sources.** Knapp, author edition, cache `5ba1b91d` (printed page = PDF page − 18, checked at the markers for pages 154, 259, 267–269, 272, 283, 286, 352–354, 833). Every locator the README gives was opened this round:

| Locator | Cache lines, printed page | Supports |
| --- | --- | --- |
| Proposition 2.13 | `knapp line 6121`–6123, p.136 | Cartan subalgebra = maximal among abelian subalgebras with simultaneously diagonable ad, in a complex semisimple algebra; §6.5 applies it "as in §IV.5" |
| Proposition 4.8, Corollary 4.9 | `knapp line 10109`–10120, p.240 | intertwiner dichotomy; a self-intertwiner of a finite-dimensional irreducible is scalar (§§1.2–1.3) |
| Proposition 4.24, Corollaries 4.25–4.26 | `knapp line 10491`–10511, p.249 | Ad-invariant inner product with ad skew; `g = Z_g ⊕ [g,g]`, `[g,g]` semisimple; Killing form negative semidefinite (§6.5) |
| Theorem 4.29 | `knapp line 10549`–10581, pp.250–251 | `G = (Z_G)_0 G_ss`, `G_ss` closed with finite centre; negative definiteness on `[g,g]` at `:10572`–10577 (§6.5) |
| (4.31), (4.32) | `knapp line 10683`–10714, pp.253–254 | root-space decomposition with the centre in the zero space; `Ad(t)X = ξ_α(t)X`, differential of `ξ_α` is `α` on `t_0`, imaginary there, real on `it_0` (§6.5) |
| Propositions 4.58–4.59 | `knapp line 11115`–11141, pp.264–265 | analytically integral iff `λ(H) ∈ 2πiℤ` on `ker exp`; implies `2⟨λ,α⟩/|α|² ∈ ℤ` (§§6.2, 6.5) |
| Proposition 4.67 | `knapp line 11241`–11245, p.267 | index of analytically integral forms = kernel order (Source issues) |
| Theorem 4.69 | `knapp line 11261`–11263, p.268 | compact semisimple: finite fundamental group, compact universal cover (§6.5) |
| Theorem 5.107 | `knapp line 14142`–14152, p.334 | simply connected compact semisimple: algebraically integral ⇒ analytically integral (§6.5) |
| Theorem 5.110 and proof | `knapp line 14203`–14247, pp.335–336 | irreducibles ↔ dominant analytically integral forms; dominance depends only on `it'_0` (`:14201`–14202); uniqueness via the central scalar and the derived highest weight (`:14219`–14227); descent through `Z_G̃ ⊆ exp t_0` (`:14238`–14247) (§§6.5–6.9) |

Etingof, OCW lecture 11, cache `5093fe43` (printed = PDF page + 198): §37.1 at `etingof line 6`–11 (p.199) and Theorem 37.5 at `:151`–157 (p.202) both assume a countable base, as the README says at `:543–544` and `:1306`. Conway is not in the cache and is paywalled (Not verifiable).

**Adversarial table.** All rows computed this round (matrix, permutation, partition and congruence values by script; the rest by hand). Elaboration and finite instances are evidence about conventions and hypotheses, not proofs of the universal statements.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: coefficient vs trace (`:51–55`) | circle scalar action at `i`, `v = w = 1` | `⟪i·1, 1⟫ = conj(i) = −i`; trace `i`; native `fourierPeterWeylIndexEquiv x = −x.1` | consistent; none |
| Conventions: nonabelian coefficient | S₃ standard rep, 3-cycle | `⟪Re₁, e₁⟫ = cos(2π/3) = −1/2`; identity 1; zero vector 0 | consistent; none |
| Conventions: permutation matrices (`:59–62`) | S₃, `σ = (12)(23)`, `t = diag(11,22,33)` | `n_{(12)} n_{(23)} = n_{(12)(23)}` entrywise (true); with left-to-right composition it would equal `n_{(23)(12)}` (false); `n_σ⁻¹ t n_σ = diag(22,33,11) = diag(t_{σ(1)},t_{σ(2)},t_{σ(3)})` | consistent; none |
| Irreducibility convention (`:64–67`) | `V = 0`; trivial ℂ; trivial ℂ² | lattice sizes 1, 2, 3; `IsSimpleOrder` false, true, false | matches; none |
| 0.1 tensor and dual | C₃ character ω | tensor trace ω²; dual trace ω⁻¹ = ω²; original would give ω | consistent; none |
| 0.2 HS identity | two atoms of mass ½, `k = 1` | orthonormal-basis matrix `[[½,½],[½,½]]`, HS² = 1; `∫|k|² = 4·¼ = 1` | consistent; none |
| 0.2 adjoint vs transpose | same measure, `k(1,2) = i` | matrix entry `i/2` at (1,2); adjoint entry `−i/2` at (2,1); HS² = ¼ = `|i|²·¼` | consistent; none |
| 0.2 degenerate measure | `μ = 0`, `k = 1` | `A_k = 0`, both norms 0, `k ≠ 0` | injectivity needs full support, as stated; none |
| 1.1 Gram slot | ℂ, `T = 2I` | `h(1,i) = ⟪1, 2i⟫ = 2i`; swapped `⟪2i, 1⟫ = −2i` | consistent; none |
| 1.1 invariance ⇔ commutation | ℂ², `T = diag(1,2)`, swap S | `h(Se₁,Se₁) = 2 ≠ 1`; `STe₁ = e₂ ≠ 2e₂ = TSe₁` | both fail together; none |
| 1.2 Lean theorem: existence, `hself`, control, uniqueness | ℂ with `T = 2I`; `T = (1+i)I`; trivial ℂ² with `diag(1,2)`; `V ≠ 0` | `c = 2`, `re⟪1,2⟫ = 2 > 0`; `re⟪v,(1+i)v⟫ = ‖v‖² > 0` but `1+i ∉ ℝ`, excluded by `hself`; `diag(1,2)` not scalar, excluded by irreducibility; `c` unique since `V ≠ 0` | consistent; none |
| 1.2 isometry | `h₂ = 4h₁` | `h₂(v/2,v/2) = h₁(v,v)`; inverse `2I` | consistent; none |
| 1.3 block order, adjoint | `S ⊕ S` | `E₁₂E₂₁ = E₁₁`, `E₂₁E₁₂ = E₂₂`, `E₁₂† = E₂₁` | consistent; none |
| 1.3 basis-change direction (`:365–368`, `:388–392`) | `U = diag(1,i)`, `A = [[1,1],[1,2]]`; swap `P` | `UAU† = [[1,−i],[i,2]]`; `U†AU = [[1,i],[−i,2]]`; `PAP = [[2,1],[1,1]]` either way; with `h = m†An`, `m = U†m'` gives `m'†(UAU†)n'` | consistent; none |
| 1.3 empty and simple blocks | `V = 0`; one copy | product over ∅ has one element; `ℂ` with cone ℝ>0 | consistent; none |
| Finite-group averaging | C₃ trivial action | normalized `h`; unnormalized `3h` | consistent; none |
| 2.1 `IsGFinite`, submodule bodies | `0`; nonzero `v` in a trivial rep over 𝔽₂; modes 0 and 1 on C(S¹) | orbit-span dimensions 0, 1, 2; `span(orbit(v+w)) ≤ span(orbit v) ⊔ span(orbit w)` and `span(orbit(cv)) ≤ span(orbit v)` (bodies `:74–95`) | consistent; none |
| 2.1 strong vs norm continuity | rotations `R_θ` on C(S¹), `θ ≠ 0` | `‖R_θ − I‖ = 2`; each orbit continuous | hypothesis form correct; none |
| 2.1 compactness needed | ℤ-shift on ℓ²(ℤ), `δ₀` | translates independent, orbit span infinite-dimensional | outside the theorem; none |
| 2.1 covariance order (`:485–487`) | S₃, `f = 6δ_t`, `h = (12)`, `t = (23)` | `T_f = π(t)`; `ht: 1↦2↦3↦1 = (123)`; `th = (132)`; native `−h + g ↦ h⁻¹g` | consistent; none |
| 2.1 mass and error | trivial action, kernels of mass 1, 2; `C_π = 2`, `‖v‖ = 3`, `‖p−u‖₁ < ε/12` | `T_f v = v`, `2v`; `C‖p−u‖₁‖v‖ < ε/2`, total `< ε` | consistent; none |
| 3.1 second countable ⇔ countable dual | trivial; Circle; `Circle^J`, J uncountable | (true,true), dual size 1; (true,true), dual ℤ; (false,false), dual ⊇ {χ_j} | consistent; none |
| 3.1 separable L² ⇔ countable dual | same | basis index sizes 1, ℵ₀, ≥ |J|; distinct unit vectors at distance √2, balls of radius 1/3 disjoint | consistent; none |
| 3.1 coordinate orthogonality | `χ_j, χ_k`, `j ≠ k` | flipping coordinate `j` by −1 negates `∫ conj χ_j χ_k`, so 0; `‖χ_j − χ_k‖² = 2` | consistent; none |
| 3.1 per-vector support | `χ_j`; 0 | supports of size 1 and 0; lemma hypothesis `∑' ≠ ⊤` from Parseval | consistent; none |
| 3.1 Borel choice | empty product; `Circle^J` uncountable | σ-algebra `{∅, G}`; complement of the identity open hence Borel, not cylinder-measurable | the local instances choose the right σ-algebra; none |
| 4.1 finite coordinates, proof step | tail element with `χ(x) = −1` | `x¹ = x ∉ centeredArc(π/2)`; lemma hypothesis `∀ n > 0` matches "all positive powers" | consistent; none |
| 4.1 factorization | empty J; `S₃ × C₃`, sign × χ at ((12), g) | `1` = empty product; `(−1)·ω = −ω`, noncommutative factor allowed | consistent; none |
| 4.1 product dual inverse | `Circle²`, exponents (1,−1), point (i,−1) | `i·(−1)⁻¹ = −i`; restrictions along `ι_j` recover `z`, `z⁻¹`; `pr_k ∘ ι_j = 1` for `k ≠ j` | both inverse laws; none |
| 4.1 torus characters, `∃!` | Circle, exponents 0, 1, −1 at `i` | `1, i, −i`; `z ↦ z^m` trivial iff `m = 0`, so the finsupp is unique | consistent; none |
| 4.1 topology distinction | `χ_n` on `Circle^ℕ` | each fixed restriction eventually 1; `χ_n(−1,−1,…) = −1`; dual discrete, no convergence | consistent; none |
| 5.1 class/character bijection | trivial group; C₃ character; zero rep; trivial ℂ² | dims 1, 1, 0, 2; only the first two are inputs to `finrank_eq_one_of_isMulCommutative` | consistent; none |
| 5.1 scalar-action pinning (Lean `:205–211`) | Circle, scalar `χ(z) = z` | `rep g = (e i g) • id` forces `e i = χ`; coefficient `conj χ = χ⁻¹`, native index −1 | matches the reindexing sentence `:673–678`; none |
| 5.1 operations, orthonormality, Parseval | Circle χ, χ⁻¹ at `i`; C₃ χ, χ²; `f = c_χ + 2c_ψ` | `i·(−i) = 1`, `conj(i) = χ⁻¹(i)`; pairing `(1+ω+ω²)/3 = 0`, diagonal 1; coordinates (1,2), `‖f‖² = 5` | consistent; none |
| 5.1 uniform density | trivial group; C₃ | constant 1 spans ℂ; Fourier matrix of rank 3 spans ℂ³ | consistent; none |
| 6.1 group completion | trivial group | `R = ℤ`, unit 1, zero 0; `−[ℂ]` dimension −1, not genuine | consistent; none |
| 6.2 period lattice | period 2π, slopes 1 and ½ | `exp(2πi) = 1`; `exp(πi) = −1`; Knapp (i) `λ(H) ∈ 2πiℤ` with `λ = iℓ` ⇔ `ℓ(H) ∈ 2πℤ` | consistent; none |
| 6.2 weights, labels | `z ↦ z⁻¹` at `i`; trivial ℂ²; zero module | weight −1, trace −i; weight 0 twice, trace 2; trace 0 | consistent; none |
| 6.3 conjugation on weights | real rotation plane, `v = e₁ − ie₂` | `R_θ v = e^{iθ}v`; `c(v) = e₁ + ie₂` has `e^{−iθ}`; `c(iv) = −ic(v)`; `c² = id` | matches `z ⊗ v ↦ conj z ⊗ v`; none |
| 6.4 action law | `n ↦ nt`; `(w₁w₂)·χ` | `χ((nt)⁻¹ s (nt)) = χ(n⁻¹sn)`; `χ((n₁n₂)⁻¹ s n₁n₂) = (w₁·(w₂·χ))(s)` | left action; none |
| 6.4 SU(3) Check (`:865–871`) | `s₁ = (12)`, `s₂ = (23)`, `d = diag(−1,1,1)` | `(s₁s₂)(1) = 2`, `(s₂s₁)(1) = 3`; inverse realization gives 3 and 2; `det n_{s₁} = −1`, `det(n_{s₁}d) = det(n_{s₂}d) = 1` | consistent; none |
| 6.5 covers and kernels | Circle; SU(2)→SO(3); `S¹×SU(2)→U(2)` | kernel orders 1, 2, 2; Lie dimensions 1+0, 0+3, 1+3 | consistent; none |
| 6.5 descent parity | U(2) pairs (q,a) = (1,1), (0,1), (3,1), (−1,1) | `(−1)^{q−a}` = 1, −1, 1, 1; `t₁ᵃt₂ᵇ ↦ (a+b, a−b)`, `q − a' = 2b` | consistent; none |
| 6.5 root dictionary | SU(2), `H = diag(1,−1)` | `[H,E₁₂] = 2E₁₂`; `α(diag(iθ,−iθ)) = 2iθ`, `α(H) = 2`; `z ↦ zⁿ` has `λ(H) = n`; `λ(H) = ½` gives `iπ` on `diag(2πi,−2πi)` whose exponential is `I` | matches (4.32), 4.58; none |
| 6.5 reductive control, index | U(2); SU(2)→SO(3) | `B(I,I) = 0` on `𝔤𝔩₂`; lattices ℤ ⊃ 2ℤ, index 2 = |{±I}| | matches 4.67; none |
| 6.6 descent, uniqueness | SU(2) weights 1, 2; U(2) (1,0), (2,1) | `−I ↦ −1, +1`; central exponents 1, 3, at `i`: `i`, `−i`; derived coordinate 1 = 1 | central character needed, as `knapp line 14221`–14223; none |
| 6.7 restriction ring | trivial; Circle; SU(2) | ℤ; ℤ[t,t⁻¹]; `χ₂ = (t² + t⁻²) + 1`; `t² + t⁻² = χ₂ − χ₀` | positive-cone distinction correct; none |
| 6.8 U(n) congruence identity | λ = (2,1,−1), (5,0,−3), (1,1,1) in U(3); (4,−2,−2,7) in U(4) | `Σ i a_i = q − n λ_n`: 5 = 2 − 3(−1), 11, 0, −21 = 7 − 4·7; residues 2, 2, 0, 3 equal `q mod n` | congruence holds generally; none |
| 6.8 fundamental weight, ranks 0, 1 | (1,0) with q = 0; U(0), U(1), U(2) | `ζ^{0−1} = ζ⁻¹ ≠ 1`; ℤ; ℤ[t,t⁻¹] vacuous congruence; `(t₁t₂)(t₁t₂)⁻¹ = 1` | consistent; none |
| 6.9 Lean iff, ⇒ | `L_(p,q)`, weight (a,b), `a ≥ b` | weights are `(p−j, q+j)`, `0 ≤ j ≤ p−q`; if `(a+1,b−1)` is a weight then `b−1 ≥ q` and `a+1 ≤ p`, so `(a,b)` is a weight; symmetry by the swap matrix | each summand contributes ≥ 0 to `f(a,b) − f(a+1,b−1)`; none |
| 6.9 Lean iff, ⇐ | string sum `s = a+b`, `m(p,s−p) = f(p,s−p) − f(p+1,s−p−1)` | weight `(a,b)` of the sum is `Σ_{p ≥ a} m(p,s−p) = f(a,b)` by telescoping and finite support | consistent; none |
| 6.9 instances | `f = 1,2,1` at (2,0),(1,1),(0,2); `f = 1` at (1,−1),(−1,1); `f = 0`; `det⁻¹` at `diag(i,−1)` | `m = {(2,0):1,(1,1):1}`, reconstructed weights equal `f`, dimension 4 = 3+1; `f(0,0) ≥ f(1,−1)` is `0 ≥ 1`, false, both sides false; `n = 0` both sides true; trace `1/(i·(−1)) = i` versus `det = −i` | consistent; none |
| 7.1 kernels | `Sym^d`, `d = 0,1,2`, at `z = i` and `z = −1` | eigenvalues `i^{2k−d}`: (1), (−i,i), (−1,1,−1); at −1: (1), (−1,−1), (1,1,1); kernels SU(2), {I}, {±I} | consistent; none |
| 7.1 Lean uniqueness, `n = 0` | characters `χ_d` orthonormal; zero rep | `m` determined by the trace identity alone; `n = 0`: `m = 0`, `π` not injective, no odd `d` | consistent in the degenerate case; none |
| 7.1 realization vs unitarity | `Sym²` monomial model | monomial basis orthogonal, not orthonormal; character unchanged under equivalence | `exists_su2_of_multiplicities` asks for a unitary π with the same trace; none |
| 7.1 counts | `n = 0…6` | `p = 1,1,2,3,5,7,11`; `p_odd = 1,1,1,2,2,3,4`; differences 0,0,1,1,3,4,7; `n = 4` classes {4},{2,2},{2,1,1} | consistent; none |
| Etingof scope | Theorem 37.5 | hypothesis "countable base" at `etingof line 152`; §3.1 drops it and proves the equivalence | cited as the countable case only; none |

**Shape.** Summary, Scope and ownership, Conventions (with Checks), Exact supplier contracts (Mathlib, Tau Ceti, named roadmaps), How to read the build, Layers 0–7 each ending in Examples and Dependencies, Downstream consumers, References. Every definition has an API list and at least three Checks (counts 3, 3, 3, 3, 4, 6, 5, 4, 5, 3, 3, 3, 3, 6, 5, 3, 3, 4, 5 for §§0.1–7.1); every target has a locator or is marked as a deduction from named inputs; no LaTeX, process words, pull-request numbers or local paths (gate scanners all zero).

## Not verifiable

- Conway, *A Course in Functional Analysis*, VII.9 Exercises 8–11: paywalled (DOI 10.1007/978-1-4757-4383-8), not in the sources cache, cited locator-only and marked uncertified in the README (`:1308–1310`). The four exercises' mathematics was checked independently above; the attribution was not.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap service's grep over the indexed heads (index of 2026-11-04T15:42:16Z).

## Source issues

- **Misprint** in etingof at Corollary 37.7 proof, printed p.203 (`etingof line 176`): the source says the quotient by the kernel of the first m irreducibles embeds into the unitary group of the first n; it should be the first m; affects the proof.
- **Gap** in knapp at Proposition 4.67 proof, printed p.267 (`knapp line 11245`): the source says the index statement follows from Corollary 4.47 and Proposition 4.58; it should also show every character of the finite kernel extends to the covering torus; affects the proof; corrected in print at the appended Corrections as of June 30, 2023, pp.814–815 (`knapp line 34709`–34727).
