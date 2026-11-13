<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6849389100 -->
Review (claude) of a9d72b8

Verdict: needs_changes

1. **F01** (P3) The bridge to the Satake multiplicity function drops "counted with multiplicity", and the two ownership sentences disagree

   **Location:** `packages/LieHighestWeightPartII/README.md:590` (Downstream consumers, added in the last repair): "its multiplicity function `n_(ν,τ)(i)`, the number of weights `μ` of `τ` with `2⟨μ, ν⟩ = i`, is `weightPattern q (τ(q^ν)) i`"; and, same line, "that section adds only the normalization across residue cardinalities and the relative Weyl group refinement".

   **Claim:** (a) the number of weights with pairing `i` equals the weight pattern; (b) the consumer section adds two things.

   **Witness:** (a) adjoint representation of `SL₃`, `ν = 0`: there are 7 distinct weights (6 roots and 0), all pairing to 0, while `weightPattern q (τ(1)) 0 = dim τ = 8`. The cited section itself says "counted with multiplicity" (GlobalShtukasAndFunctionFieldLanglandsPartII at its open head, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:1207`). (b) `README.md:24` lists three kept items, the third being the Aubert-involution identity.

   **Exact repair:** in `README.md:590` write "the number of weights `μ` of `τ`, counted with multiplicity, with `2⟨μ, ν⟩ = i`", and replace "that section adds only the normalization across residue cardinalities and the relative Weyl group refinement" by "that section adds the normalization across residue cardinalities, the relative Weyl group refinement and its Aubert-involution identity (Scope)".

   **Repair test:** adjoint `SL₃`, `ν = 0`: weights counted with multiplicity at pairing 0 are `6 + 2 = 8 = weightPattern q 1 0`. Adjoint `SL₂`, `ν = (½, −½)`, `q = 4`: pairings `2, 0, −2`, one weight each; `τ(q^ν)` has eigenvalues `4, 1, ¼ = 4^(2/2), 4^0, 4^(−2/2)`, pattern `1, 1, 1` at `2, 0, −2`. Both sides agree.

2. **F02** (P3) Three open roadmaps cite this roadmap by an `N0`–`N5` numbering the README does not have

   **Location:** `packages/LieHighestWeightPartII/README.md` as a whole: its layers are "Layer 0" to "Layer 5" with sections `§k.n`; no `N`-label of this roadmap occurs (the only `N`-labels are NilpotentOrbits').

   **Claim:** citing roadmaps can find the sections they cite.

   **Witness:** at their open heads, SmoothRepresentationsOfLocalGroupsPartII (`TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1082`, "LieHighestWeightPartII N5 positive-real-part"; `:1406`, "N5 (highest-weight half-integrality)"; `:15`, "N0–N2 owns Jacobson–Morozov"), TwistedAutomorphicDescents (`TauCetiRoadmap/TwistedAutomorphicDescents/README.md:212`, "N0, nilpotent-orbit … N2, classical-partitions") and SheafConvolutionOnAbelianVarieties (`TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:145`, "§N2"). Two of the cited ids (`N0` nilpotent-orbit, Jacobson–Morozov) name objects this README hands to NilpotentOrbits.

   **Exact repair:** add to Scope and ownership, after the list of consumed objects, the sentence "Some roadmaps cite this one by a former numbering `N0`–`N5`; each former label now lives as follows." and this table (header naming the former numbering, one row per id):

   | Former label | Present location |
   |---|---|
   | N0 zero-triple | §0.1 |
   | N0 nilpotent-orbit | NilpotentOrbits N0.3 (adjoint orbits; not owned here) |
   | N0 jordan-centralizer | NilpotentOrbits N0.2 |
   | N0 jacobson-morozov, N0 kostant-conjugacy | NilpotentOrbits N2.1 |
   | N0 triple-integration | §0.2 (inner invariance); the `SL₂`-homomorphism of a triple is NilpotentOrbits N2.1 |
   | N0 neutral-conjugacy | §0.3 |
   | N1 restriction, weight-filtration, graded-comparison, tensor-exactness | §1.1, §1.2, §1.3, §1.4 |
   | N2 classical-partitions | §2.1 and §2.2 |
   | N2 half-spin-separation, classical-recognition | §2.3, §2.4 |
   | N3 dominant-characteristic, root-profile | §3.1, §3.2 |
   | N3 candidate-certificate, candidate-profile-injective | §3.3 |
   | N3 exceptional-separation, appendix-table-interface | §3.4, §3.5 |
   | N4 filtration-recognition | §4.1 |
   | N5 root-coset-half-integrality, highest-weight-test | §5.1, §5.2 |
   | N5 weight-pattern, positive-real-part, real-part-recognition | §5.3, §5.4, §5.5 |
   | N5 algebraic-highest-weight-existence | ReductiveGroups Layer 10B |
   | N5 character-separation | ReductiveGroupsPartIII §§0.3 and 0.5 |

   **Repair test:** the citation "LieHighestWeightPartII N5 positive-real-part" then resolves to §5.4, which defines `r(s)` with `χ(r(s)) = |χ(s)|`, the object SmoothRepresentationsOfLocalGroupsPartII uses as `s_ν = r(s)`; "N0–N2 owns Jacobson–Morozov" resolves to NilpotentOrbits N2.1, which the README's supplier contract already names.

Two findings, both P3, none blocking. Both are in `packages/LieHighestWeightPartII/README.md`; `Suggested.lean`, `metadata.toml` and `sources.toml` need no change. The mathematics, the Lean file, the sources and the supplier direction are sound (evidence below).

## Verified sound

### Previous findings (REV-PKG-LieHighestWeightPartII~5), in order

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2), two owners of weight-pattern recognition | `README.md:24`: "Weight patterns, `q`-geometric points, positive real parts and the recognition … (§§5.3–5.5) are owned here … §8.0 is a consumer of them, not a second owner"; `README.md:590`, the bridge; `README.md:527`, the new Check | Repaired on this package's side. This roadmap is the earlier one (merge order 241 against 367) and adds no supplier edge. The later roadmap's head still keeps its own recognition (its Scope paragraph, line 11, and the Needs line of §8.0, which does not name this roadmap); the repair report recorded that as not actionable here, and that reason is right. Residual wording: R01. |
| F02 (P3), finite-dimensional Check in the infinite-dimensional scope | `README.md:506`: "makes both sides true whenever `λ` lies in the integral weight lattice … Outside the lattice it settles nothing: over `K = ℚ` …" | Repaired; recomputed below. |

The repaired patterns were searched in the rest of the text: no other finite-dimensional claim survives in §5.2's enlarged scope (the proof paragraph, the `PGL₂` and `G_m` Checks and the Lean docstring are all qualified), and no other sentence describes another roadmap's content beyond `README.md:24` and `:590`.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §5.2 new Check, lattice case | `sl₂`, `ν(ω) = ½`, `V(1)`, `V(2)`; Verma `λ = −ω` | `2ν` on weights: `±1`; `2, 0, −2`; `−1 − 2k`. All integers; `2ν(λ)` is `1, 2, −1`. True ⇔ true. | holds |
| §5.2 new Check, outside the lattice | `K = ℚ`, `ν(aω) = a/2`, Verma `λ = −ω/2` | `ν(α) = 1`. Raising coefficients `k(λ(H) − k + 1) = −½, −3, −15/2` at `k = 1, 2, 3`, never 0 since `k ≠ ½`. `2ν(λ − kα) = −½ − 2k ∉ ℤ`, `2ν(λ) = −½`. False ⇔ false. | holds |
| `forall_weight_halfIntegral_iff_highestWeight` | `V(1)`, `V(2)`, `V(3)` with `ν(α) = ½`; `V(1) ⊕ V(0)` with `v ∈ V(0)`; `V(3)` with `ν(α) = ⅓` | `2ν` on weights: `±½`; `1, 0, −1`; `±3/2, ±½`: F⇔F, T⇔T, F⇔F. Reducible control: right side `0 ∈ ℤ`, left fails at `±½`. Root control: `2ν(3ω) = 1`, `2ν(ω) = ⅓`. | holds; both hypotheses needed |
| §5.3 new Check | `ν = (½, −½)`, `q = 4`, `16` | `diag(2, ½)`, `diag(4, ¼)`; `2 = √4`, `4 = √16`, pattern 1 at ±1; traces `5/2`, `17/4`. With `q^i`: `4^i = 2` and `16^i = 4` give `i = ½`. | holds |
| Bridge `n_(ν,τ)(i) = weightPattern q (τ(q^ν)) i` | adjoint `SL₃`, `ν = 0`; adjoint `SL₂`, `ν = (½, −½)`; std, `ν = (¼, −¼)` | 8 with multiplicity against 7 distinct weights; `1, 1, 1` at `2, 0, −2`; pairing `±½` is no integer, so both sides are 0 and `q^ν` is not `q`-geometric (`q^(1/4) = q^(i/2)` forces `i = ½`). | R01 |
| `ν ↦ q^ν` injective and Weyl-equivariant | `SL₂`, `ν`, `−ν` | `χ(q^ν) = q^⟨χ,ν⟩`, injective for `q > 1`; `diag(2, ½) ↦ diag(½, 2)` under the reflection. | holds |
| `exists_conj_positiveRealPart_of_weightPattern_eq` | `SL₂`: `diag(i, −i)` and `1`; `diag(2, ½)` and `diag(½, 2)` at `q = 4`; `G_m`: `2i`, `2`; `s = s' = u` unipotent | patterns `2δ₀ = 2δ₀`, `r = r' = 1`; `δ₋₁ + δ₁` both, Weyl-conjugate; `δ_k` both, `r = r' = 2`; with `r = u`, `r' = 1` both satisfy the predicate and are not conjugate. | holds; semisimplicity needed; `r` is semisimple because the eigenspaces of `s` span |
| `weightPattern`, `IsGeometricPoint` | zero space; `q = 1`; Jordan block at `√q` | zero function; at `q = 1` every `i` counts the unit, hence `1 < q` in the theorem; `dim ker = 1`, not 2. | definitions determine their object at semisimple points |
| `IsPositiveRealPart` | `G_m`, `s = 2i` | `r(t) = 2`, then `r(t⁻¹) = ½` through the antipode image. Wrong model `r = s`: acts by `2i ≠ 2`. | excluded |
| §3.2–§3.3 root profiles (independent script from the Cartan matrices) | all of `{0,1,2}^r`, five types | roots `12, 48, 72, 126, 240`; `θ = (3,2)`, `(2,3,4,2)`, `(1,2,2,3,2,1)`, `(2,2,3,4,3,2,1)`, `(2,3,4,6,5,4,3,2)`, so `2·ht(θ) = 10, 22, 22, 34, 58`; `|C_T| = 7, 28, 34, 274, 245`, the same numbers of distinct profiles; `E₆` without opposition `212` vectors, `123` profiles; `81` of `729` fixed by opposition. | all README values confirmed |
| §3.1–§3.5 individual profiles | `G₂`: `(2,0)`, `(2,2)`, `(0,1)`, `(1,0)`, `(0,2)`, `(−1,0)`; `F₄`: principal, `(1,0,0,0)`, `(0,0,0,1)`; `E₈` principal | `4,0,2,0,1,0,2`; `2,0,2,0,1,0,1,0,1,0,1`; `4,4,1`; `4,2,1,2`; `4,0,4,0,1`; `4,2,1,2`. `F₄`: `4,0,4,0,3,0,3,0,3,0,3,0,2,0,2,0,1,0,1,0,1,0,1` (`F_0 = 28`); `22,14,1`; `22,8,7`. `E₈` even degrees `8,8,7,7,7,7,7,7,6,6,6,6,5,5,4,4,4,4,3,3,2,2,2,2,1,…`. | equal to the CH rows at CH lines 1737, 1814, 1832–1836 |
| `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional` | `G₂` candidates `(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,2)` | 7 distinct profiles; orbit dimensions `14 − d₀ − d₁`: `0, 6, 8, 10, 12`. | holds |
| §2.3 and the type-`D` theorem | `a = (3,3,1,1)`, `(1,1,1,1)`, `(1,1)` | top degree on even sign vectors for `h_I`, `h_II`: `4, 3`; `2, 1`; `1, 0`. On odd vectors: `3, 4`; `1, 2`; `0, 1`. Full spinor: `A` for both. | separates; `r = 2` covered |
| `exists_innerAut_of_finrank_weightFiltration_so` | `n = 0, 1, 2`; `so(4)` `(2,2)` and `(3,1)`; `so(8)` `(4,4)` | `n = 0`: kernel is `⊥`, hypothesis fails; `n = 1, 2`: zero triple only; `(2,2)`: eigenvalues `1,1,−1,−1`, kernel 0, excluded; `(3,1)`: `2,0,−2,0`, kernel 2; `(4,4)`: kernel 0. | `hker` excludes exactly the very even case |
| §2.2 splitting | reflection on `U_n` | determinant `(−1)^(n+1)`: `−1` for `n` even (odd block), where `U_n` is symmetric. | holds |
| §2.0 dimensions | `r = 2, 3, 4` | `so(5) = sp(4) = 10`, `so(6) = sl₄ = 15`; `28 = 4 + 24`, `36 = 4 + 32`. | holds |
| §2.1 `β_n` | KIR basis, `w_j = j! v_j` | `f^j v_0 = j! v_j`; `e w_j = j(n − j + 1) w_(j−1)`; `e`-invariance at `j + k = n + 1`: both terms carry `j(n − j + 1)` with signs `(−1)^(j−1)`, `(−1)^j`. | holds |
| `finrank_weightFiltration_eq_iff_exists_intertwiner` | `V(2)` against `V(1) ⊕ V(0)`; zero triple against trivial module | cumulative `(1,1,2,2,3)` against `(0,1,2,3,3)`; both jump `dim M` at 0. | both directions tested |
| §1.4 dual shift | `V(1)`, `i = −1, 0` | `Ann(W_0) = Ann(K v₋₁)`, a line, equal to the weight `−1` space of `M*`; `Ann(W₋₁) = M*`. | `−i−1` correct |
| `exists_innerAut_iff_finrank_weightFiltration` | `sl₂ × sl₂`: `(t,0)`, `(0,t)`; `L = 0` | adjoint weights `2,0,−2,0,0,0` for both; first standard pullback `±1` against `0, 0`. | pullbacks needed, as stated |
| §0.1 | `(0,0,0)`; `(0,E,0)`; `sl(2, 𝔽₂)` | relations `0 = 0`; `[0,E] = 0 ≠ 2E`; in characteristic 2 `(0, E₁₂, 0)` solves all three. | holds |

### Sources: the seeded sample (15 targets) against the cached texts

| Target | Locator read | Result |
|---|---|---|
| 0.3 | DG §3, Lemmas 2–3, p.4, DG lines 139–153; SOM §3.1, p.15, SOM lines 358–364 | centralizer orbit map, surjective differential, density; injectivity of the neutral-element map. Supports the statement over `ℂ`; the general field is the README's own route. |
| 1.3 | CH proof of Lemma 10.9, p.35, CH line 1708 | restricted module determined by the filtration. |
| 1.4 | CH Definition 2.2, p.6, CH lines 288–294 | symmetric monoidal functor to filtered spaces, the two `SL(2)`-type conditions. |
| 2.0 | KIR Appendix C, pp.124–128, KIR lines 4760, 4888, 4835, 4958; Theorem 6.33, p.75, KIR line 2919 | root systems of `A`, `C`, `B`, `D` in that order; semisimplicity with `n > 2` for `so(n)`. |
| 2.2 | CH line 1709–1715, p.35 | partition classification cited there. |
| 2.3 | CH lines 1716–1727, p.35 | half-spin maxima; the README's remark on the ascending coordinates and the roots `ε₂ − ε₃` matches CH lines 1720 and 1725. |
| 3.1 | SOM p.15, SOM lines 366–373; DG §2, p.3, DG lines 86–87 | dominant representative, labels in `{0,1,2}`. |
| 3.2 | DG §2, p.3, DG lines 83–85 | integer grading, root vectors in graded pieces. |
| 3.3, 3.4 | CH lines 1728–1733, p.35 | adjoint separation asserted by computation; `E₆`, `E₇` left to a Levi argument, which the README replaces. |
| 4.1 | CH Lemma 2.4, p.6, CH line 296; Lemma 10.9, p.35, CH line 1701 | statements as cited. |
| 5.1, 5.2 | CH §6.12, Lemma 6.30 and proof, p.24, CH lines 1156–1171 | finite-dimensional, root half-integrality is all the proof uses. |
| 5.4, 5.5 | CH Proposition 10.2 and proof, p.32, CH lines 1554–1565; pattern at CH line 1550 | trace formula and Weyl conjugacy. |

Page markers were checked for every locator (CH pages 6, 7, 24, 32, 35, 36–37; DG 3, 4, 7–16; SOM 15; KIR 61, 75, 124–128). All four cited works are in `sources.toml`, each once, with no local path. No author-flagged unverified locator exists. Nothing was fetched and the manifest is unchanged.

### Lean file

- `lake env lean` on `packages/LieHighestWeightPartII/Suggested.lean` from the content checkout: exit 0, exactly nine `declaration uses sorry` warnings (lines 78, 95, 109, 126, 149, 176, 196, 215, 264), nothing else. All six `TauCeti.*` modules were present.
- One-tactic probe on a scratch copy, every sorried theorem with `simp`, `rfl`, `infer_instance`, `exact Iff.rfl` and `aesop`, each wrapped in `fail_if_success (solve | …)`: none closes a goal (on the type-`D` theorem `simp` runs out of heartbeats instead of closing). No padding.
- `#check @name` for all 14 declarations, read against the README: no binder lost. `forall_weight_halfIntegral_iff_highestWeight` has `[CharZero K]`, `IsKilling`, `FiniteDimensional K L`, the Cartan and triangularizability binders, irreducibility and the simple-root hypothesis, and neither algebraic closure nor finiteness of `M`, as §5.2 says; the recognition theorem has `1 < q`, reductivity, both semisimplicity and both geometricity hypotheses.
- Headlines of the Summary and their statements: restricted-module recovery (line 78); types `A`, `C`, `B`/`D` with odd part, full `D` (lines 95, 109, 126, 149); exceptional adjoint (176); semisimple recognition (196); half-integrality (215); positive real part (264). Two are named in the module docstring as not statable, with the missing carrier: the finite factorwise test family and the algebraic-group half-integrality form. None is absent or forced through a stand-in.
- One `import Mathlib`, six used `TauCeti.*` modules, five definitions with real bodies, no `set_option`, no `lemma`, no sorried data. Every Lean name occurs in the README and every backticked name of this roadmap in the README is declared.

### Pinned declarations opened (Mathlib and Tau Ceti at the pins of `lake-manifest.json`)

All 89 qualified library identifiers backticked in the README were resolved to a file and line. Those read for content this round:

- `TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122` (`IsHighestWeightVector`: nonzero, weight `lam`, killed by the positive nilradical; no finiteness), `:253` (`genWeightSpace_ne_bot`), `:368`; `TauCeti/Algebra/Lie/HighestWeight/Module.lean:309` (cone theorem; needs `lieSpan = ⊤`, not finiteness); `TauCeti/Algebra/Lie/Submodule/Atom.lean:54`.
- `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151`; `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90` (domain, Noetherian, torsion-free binders at lines 80–84), `:188`, `:209`.
- `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:153` (`Valid`: `A ≥ 1`, `B ≥ 2`, `C ≥ 3`, `D ≥ 4`), `:219` (`cartanMatrix`, with `G2 ↦ CartanMatrix.G₂ᵀ`); `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:118` (`G₂ = [[2,−3],[−1,2]]`, so the README's `[[2,−1],[−3,2]]` and its transpose remark are right); `TauCeti/LinearAlgebra/RootSystem/NumberOfRoots.lean:45`.
- `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`; `…/Representation/SemisimplePoint/Basic.lean:81`; `…/Representation/PointsAction/Basic.lean:102`; `…/Representation/Faithful/Basic.lean:311`, `:321`; `…/SpecialOrthogonal/Reductive.lean:149`; `…/Symplectic/Reductive/Basic.lean:102`.
- `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70`, `:108`; `TauCeti/Algebra/Lie/Sl2/Weyl/Automorphism.lean:116`, `:330`; `TauCeti/Algebra/Lie/Sl2/Standard.lean:151`, `:956`; `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean:96`, `:111`; `TauCeti/Algebra/Lie/Orthogonal/TypeD/Killing.lean:265`, `:308`; `Mathlib/Algebra/Lie/Classical.lean:92`, `:157`, `:166`, `:252`, `:321`; `Mathlib/Algebra/Lie/SerreConstruction.lean:145–164`; `Mathlib/Algebra/Lie/Derivation/Basic.lean:398`; `Mathlib/RingTheory/Nilpotent/Exp.lean:51`.

No pinned declaration proves any of the nine headlines; the half-integrality theorem needs the cone theorem, generation and an induction over the root monoid, not one lemma.

### Suppliers, order and overlap

- Dependency check, run as prescribed: `depcheck: 206 roadmaps, 1901 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Suppliers on main, headings resolved this round: LieHighestWeight Layers 0–9 (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319`–`:1432`); NilpotentOrbits N0, N2, N4 (`TauCetiRoadmap/NilpotentOrbits/README.md:93`, `:160`, `:215`); RootSystems former Layers 4–6, valid through its table of former labels (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:1128`–`:1138`); SpinRepresentations Layer 5 (`…/SpinRepresentations/README.md:777`); ReductiveGroups Layers 1–7, 5P, 9A (with 9A.1), 9B, 9D, 10B (`TauCetiRoadmap/ReductiveGroups/README.md:1275`, `:1499`, `:1537`, `:2112`, `:2370`, `:2448`, `:2821`, `:3785`, `:4410`, `:4976`, `:5378`). Earlier in the merge order, at their open heads: ReductiveGroupsPartIII §0.3 and §0.5 (`TauCetiRoadmap/ReductiveGroupsPartIII/README.md:433`, `:467`; position 240 against 241); NoncompactQuantumSymmetry Layer 3 (`:840`, `:1038`; position 156), cited for scope only.
- No gap is declared (`design/plan.json` has `"gaps": []`), and none is needed.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped or defined only by a revision. The citation resolver lists nothing.
- Roadmaps that cite this one at their open heads: SmoothRepresentationsOfLocalGroupsPartII, TwistedAutomorphicDescents, SheafConvolutionOnAbelianVarieties (all later in the merge order: 294, 242, 319). They cite design-stage labels (R02). They also state contracts against this roadmap (triple centralizers, graded open orbit, Bala–Carter tables with centralizer types; rational nilpotent orbits, dominance comparisons; a minuscule-weight table). Those are their declared contracts, not findings here; the maintainer decides whether this roadmap or NilpotentOrbits takes them. Note that the README's Scope says rational forms of nilpotent orbits are treated by neither roadmap, which the TwistedAutomorphicDescents contract asks of this one.
- Ownership against the open heads was checked with `roadmaps grep` and `roadmaps show`. The package index of the board lists three packages on unrelated subjects.

Overlap check: read LieHighestWeight (main and its two open revisions), ReductiveGroups, NilpotentOrbits, SpinRepresentations, ClassicalGroups, and GlobalShtukasAndFunctionFieldLanglandsPartII; weight patterns and positive-real-part recognition are shared with GlobalShtukasAndFunctionFieldLanglandsPartII §8.0, owner LieHighestWeightPartII (earlier in the merge order), the later roadmap to import §§5.3–5.5; Jacobson–Morozov, Kostant conjugacy and orbit classifications are NilpotentOrbits'; `Int(L)`, the Serre presentation and exceptional models are LieHighestWeight's; half-spin modules are Tau Ceti's and SpinRepresentations'.

### Shape

Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, six layers each ending in Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition (`IsSl2TripleOrZero`, `weightFiltration`, `β_n`, `D_T`, `C_T`, `weightPattern`, `IsGeometricPoint`, `IsPositiveRealPart`) has an API list and at least three Checks; every theorem has its hypotheses and a locator. The layer order is forced by the Needs lines (Layers 2 and 3 independent, both feeding Layer 4; Layer 5 independent). No layer is named after a source chapter and the README does not say it follows one. No pull-request number, date, machine path, LaTeX delimiter or process word was found.

## Not verifiable

- The published versions of CH, DG and KIR were not collated with the cached versions; the README cites the versions read and says so.
- The label-to-diagram correspondence of every row of DG's tables was not rebuilt; the principal, zero and rank-one rows and all `G₂` rows were matched to computed profiles, and the earlier round recomputed the numerical consistency of all 91 CH rows.
- The later roadmap's side of the F01 overlap (its §8.0 importing §§5.3–5.5) cannot be checked until that pull request changes.

## Source issues

- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1707: the source says the span of every triple is a copy of sl₂; it should set the zero triple aside first; affects the proof.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1720: the source says ascending neutral coordinates are dominant for chain roots written in descending order; it should reverse either the roots or the coordinates; affects nothing.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1726: the source says to take the largest index with nonzero filtration step; it should take the largest index with nonzero graded piece; affects a stated result.
- **Misprint** in CH at Tables 2–4, printed pp.35–37, CH lines 1734, 1813, 1831: the source says the columns are filtration dimensions; it should say graded dimensions, the filtration being their cumulative sums; affects a stated result.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1731: the source says the E₈ case implies the claim for its Levi subalgebras E₆ and E₇; it should justify descent of the filtration and of conjugacy, or treat them directly; affects the proof.
- **Misprint** in SOM at §3.1, printed p.15, SOM line 356: the source says conjugate homomorphisms differ by precomposing with an automorphism of the target; it should postcompose; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a9d72b873f4b5167eeba7433c30b65c3b4506867", "job": "REV-PKG-LieHighestWeightPartII~6", "model": "fable", "worker": "chris-x53"} -->
