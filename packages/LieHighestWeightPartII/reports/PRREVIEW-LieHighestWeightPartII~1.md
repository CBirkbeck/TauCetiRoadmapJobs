# Review of LieHighestWeightPartII (pull request #2277 at f68e387)

**Verdict:** needs changes

## R01 (P2) — LieHighestWeight §5.1 and §7.1 are renumbered at the head of its open revision

**Location:** `TauCetiRoadmap/LieHighestWeightPartII/README.md` line 98: "§5.1, `invariantForm_isSymm_iff_tits_sign` … §7.1, the split Serre presentation"; the same ids in Scope (line 14) and in the *Needs:* lines of §§0.3, 2.0, 2.1, 3.4, 4.1.

**Claim:** Both ids resolve on main, but the open revision of LieHighestWeight (#1797, head ff51f30, branched before main gained the opposition layer) moves the content, and the README cites neither id as it is at that head.

**Witness:** #1797 `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`: `### 7.1 The centre, central characters and the Harish-Chandra isomorphisms`, `### 7.5 Serre's presentation`, `### 5.1 The invariant form on weights and the Casimir element`; `invariantForm_isSymm_iff_tits_sign` does not occur.

**Repair:** Fix the order of the two pull requests. If #1797 is rebased on main and keeps main's §5.1 and §7.1, or adds the mapping "former §7.1, Serre's relations, is now §7.5", nothing changes here. Otherwise cite `LieHighestWeight §7.5` for the Serre presentation throughout, drop the §5.1 citation from §2.1 and Scope (the identity `β_n(w_k, w_j) = (−1)^n β_n(w_j, w_k)` of §2.1 already proves the parity), and name #1797 in the description's merge-order paragraph.

## R02 (P3) — §2.2: the parity conditions have no locator into a text that states them

**Location:** `README.md` §2.2, line 322: "(CH Appendix, proof of Lemma 10.9, p.35, CH line 1709, cites the partition classification; the proof here uses §2.1.)"

**Claim:** The statement gives the exact conditions (even block sizes with even multiplicity in the orthogonal case, odd ones in the symplectic case, splitting exactly for very even partitions), and the only locator is a proof line that does not state the first two.

**Witness:** CH lines 1712–1713 say only that the partitions satisfy "certain additional properties" for `so(N)`, `sp(N)` and defer to [CM, Theorems 5.1.1, 5.1.6]; CH lines 1716–1718 state the very even splitting.

**Repair:** Replace the parenthesis by "(Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras*, 1993, the theorems of §5.1 that CH line 1713 cites, for the parity conditions; CH Appendix, proof of Lemma 10.9, p.35, CH lines 1716–1718, for the very even splitting; the proof here uses §2.1.)", add the book to References with the theorem numbers for types `B`, `C`, `D` checked against it, and record it in the manifest.

## R03 (P3) — §5.4: the locator for the positive real part is not where CH defines it, and the normalisation differs

**Location:** `README.md` §5.4, line 564: "after moving `s` into a fixed maximal torus `r(s)` is well defined up to the Weyl group (CH §10.1, proof of Proposition 10.2, p.32, CH line 1555)."

**Claim:** CH line 1555 uses `ℜ(s)` without defining it. CH's `ℜ(s)` is an element of the real Lie algebra of the torus; the README's `r(s)` is the group element `q^(ℜ(s))`, and no sentence says so.

**Witness:** CH line 781 (p.16): polar decomposition `T∨ = T∨_ℝ · T∨_c`. CH lines 1334–1335 (§8.1, p.28): `ℜ(s)` is the unique element of `Lie(T∨_ℝ)` with `s = q^(ℜ(s)) · s_c`.

**Repair:** Replace the parenthesis by "(CH §6, p.16, CH line 781, the polar decomposition; CH §8.1, p.28, CH line 1334, where `ℜ(s)` is the element of `Lie(T∨_ℝ)` with `s = q^(ℜ(s)) · s_c`, so that `r(s) = q^(ℜ(s))`; CH §10.1, proof of Proposition 10.2, p.32, CH line 1555, uses it)". Check on the Layer 5 example: `ℜ(s) = ½H`, `r(s) = q^(H/2) = diag(q^(1/2), q^(−1/2))`.

## R04 (P3) — Summary states the recognition theorem without its field and without semisimplicity

**Location:** `README.md` line 3: "Attach to every `sl₂`-triple of a Lie algebra, the zero triple included, an increasing filtration … and prove that the dimensions of these filtrations, taken over all modules, determine the triple up to inner automorphism."

**Claim:** §4.1 and `exists_innerAut_iff_finrank_weightFiltration` assume `K` algebraically closed of characteristic zero and `L` finite-dimensional Killing; the sentence, which the description's summary block also carries, assumes neither.

**Witness:** `K = ℝ`, `L = sl₂(ℝ)`: `(H, E, F)` and `(H, −E, −F)` are triples with the same `h`, hence equal filtrations on every module, and `Ad(diag(a, a⁻¹))E = a²E ≠ −E`, so they are not `Int(L)`-conjugate.

**Repair:** "Over an algebraically closed field of characteristic zero, attach to every `sl₂`-triple of a Lie algebra, the zero triple included, an increasing filtration on each finite-dimensional module, and prove that in a finite-dimensional semisimple Lie algebra the dimensions of these filtrations, taken over all modules, determine the triple up to inner automorphism." Over `ℂ` the witness pair is conjugate by `Ad(diag(i, −i))`.

## R05 (P3) — Pull request description: a roadmap named in the README is neither on main, a consumer nor a prerequisite

**Location:** description of #2277: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README also names NoncompactQuantumSymmetry Layer 3, which is not on main and is not a consumer.

**Witness:** `README.md` line 16 names NoncompactQuantumSymmetry Layer 3 as owner of the analytic `Ad(G) = Int(𝔤) = Aut(𝔤)₀` (found at line 1038 of its open head); §0.2 is a kept algebraic variant and consumes nothing from it.

**Repair:** "Roadmaps on main are cited by name; of the others named in the README, GlobalShtukasAndFunctionFieldLanglandsPartII and SmoothRepresentationsOfLocalGroupsPartII are consumers, and NoncompactQuantumSymmetry Layer 3 is a comparison that is not consumed; none is a prerequisite."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 `IsSl2TripleOrZero` | `(0,0,0)`; `(0,E,0)` in char 0; `sl(2, 𝔽₂)` `(0, E₁₂, 0)` and `(0, E₁₂, E₂₁)` | `[0,E] = 0 ≠ 2E`; char 2: all brackets `0 = 2e`; `[E₁₂,E₂₁] = diag(1,1) ≠ 0` | holds; `IsSl2Triple` as wrong model excluded by the zero triple | none |
| §0.2 `Ad(G(K)) = Int(L)` | `SL₂`, `w(c) = x(c) y(−c⁻¹) x(c)` | `w(c) = [[0,c],[−c⁻¹,0]]`, `w(c) w(1)⁻¹ = diag(c, c⁻¹)`; abelian `L`: `Int = 1` | holds | none |
| §0.3 conjugacy from `h` | `(H, cE, c⁻¹F)`; `K = ℝ` pair of R04 | `Ad(diag(c^(1/2), c^(−1/2)))E = cE`; over `ℝ` `a² = −1` has no solution | holds over closed `K` only, as stated | none |
| §1.2 `weightFiltration` | adjoint `sl₂`; `M = 0`; zero triple | `dim W_i = 1,1,2,2,3`; decreasing convention gives `3,2,2,1,1`; `N = 0` | holds | none |
| §1.3 and `finrank_weightFiltration_eq_iff_exists_intertwiner` | `V(2)` vs `V(0) ⊕ V(1)`; `V(1) ⊕ V(0)`; zero triple vs trivial module, `L ≠ L'` | `(1,1,2,2,3)` vs `(0,1,2,3,3)`; `m_0 = d_0 − d_2 = 1`, cumulative reading gives `2 − 3`; six zero actions intertwine | iff holds both ways | none |
| §1.4 exactness, tensor, dual | `V(1) ⊗ V(1)`; `V(1)*`; unit | `d = 1,2,1`, cumulative `1,1,3,3,4`; `W_(−1)(M*) = Ann(W_0 M)`, dim 1; `W_(−i)` variant gives `0` | holds | none |
| §2.0 classical types | `r = 4`; `so(2)`; `so(4)`; pinned `TauCeti.DynkinType.Valid` | `28 = 4+24`, `36 = 4+32` twice; Killing matrix `[0]`; roots split `±(ε₁−ε₂)`, `±(ε₁+ε₂)`; `A≥1, B≥2, C≥3, D≥4` | holds | none |
| §2.1 `β_n` | `e`, `f` on basis; `n = 1, 2` | `e`: both terms `j(n−j+1)`, signs opposite; `det = 1`; `tr(E·(−2F)) = −2`, `tr(H²) = 2`, so trace form `= −2β₂`; rescaling `c⁻²` | holds | none |
| §2.2 partitions | `sp(4)`; `so(8)`; `so(4)`; `V = 0` | `(3,1)` excluded; `(4,4)`, `(2⁴)` split, `(3,3,1,1)` not; reflection has `det (−1)^(n+1)` on `V(n) ⊗ U_n`; `O(0) = SO(0)` | holds; locator R02 | R02 |
| §2.3 half-spin separation | `(4,4)`, `(2⁴)` in `so(8)`; `L(ω₃)`; minus signs at `i < r` and `r` | `a = (3,3,1,1)`: `4`, `3`; `(1⁴)`: `2`, `1`; `L(ω₃)`: `3`, `4`; value `A − a_i ≤ A − a_r` | holds; agrees with CH `i_II = ½(−a₁ + …)` after reversing coordinates | none |
| §2.4 `…_sl`, `…_sp`, `…_so`, `…_typeD` | `sl(1)`; `so(2)`; `so(4)`; `ι = Fin 2`, `Fin 4`; odd `|ι|` | only zero triple; `(3,1)`, `(1⁴)` have kernel, `(2,2)` has none; `S⁺` separates `(t,0)`, `(0,t)`; `4` vs `3`; no very even partition when `4 ∤ 2r` | holds | none |
| §3.1 characteristic | `E₆`; `G₂` `(2,0)` | `3⁴ = 81` of `729`; profile `4,0,2,0,1,0,2`, `d_4 = 1 < d_6 = 2` | holds | none |
| §3.2 `D_T` | all five types, reflection closure of simple roots | roots `12, 48, 72, 126, 240`; `ht θ = 5, 11, 11, 17, 29`; `G₂`: `(0,1) ↦ 4,4,1`, `(1,0) ↦ 4,2,1,2`; `F₄` principal `Σ_(j≤0) = 28` | holds | none |
| §3.3 `C_T`, injectivity | every `a ∈ {0,1,2}^r`, each type | `|C_T| = 7, 28, 34, 274, 245`, as many distinct profiles; `E₆` without opposition: `212` vectors, `123` profiles; `C_(G₂)` as listed | holds | none |
| §3.4 `…_adjoint_exceptional` | zero triple; `G₂` classes; `so(8)` control | five `G₂` profiles pairwise distinct; follows from §3.3 row and §0.3 | holds | none |
| §3.5 CH tables | Tables 2–4 parsed, 70, 16, 5 rows | every row equals `D_T(a)` for one `a ∈ C_T`, with the printed `i_max`; rows pairwise distinct; `F₄`: `D(1,0,0,0) = 22,14,1`, `D(0,0,0,1) = 22,8,7` | holds; entries are graded, as the README says | none |
| §4.1 `exists_innerAut_iff_finrank_weightFiltration` | `sl₂ × sl₂` `(t,0)`, `(0,t)`; `L = 0`; `D₄` under triality; universe `max u v` | adjoint weights `2,0,−2,0,0,0` for both; pulled-back standard: jumps `1,1` at `±1` vs `2` at `0`; a twisted identification gives the test family of another identification | holds | none |
| §5.2 `forall_weight_halfIntegral_iff_highestWeight` | `V(1) ⊕ V(0)`; `V(3)`, `ν(α) = ⅓`; Verma `λ(H) = −2`, `−½` | `ν(0) = 0`, `ν(±ω) = ±¼`; `2ν(3ω) = 1`, `2ν(ω) = ⅓`; `k(λ(H) − k + 1) = −k(k+1)`, `−k(k − ½) ≠ 0` | holds; irreducibility and `hν` needed | none |
| §5.3 `weightPattern`, `IsGeometricPoint` | `diag(2, ½)` at `q = 4, 3`; Jordan block; `diag(4, ¼)` at `q = 16` | pattern `1` at `±1`; `2 ≠ 3^(i/2)` for `i ≠ 0`; block gives `1`, not `2`; traces `5/2`, `17/4` | holds | none |
| §5.4 `IsPositiveRealPart` | `G_m`, `s = 2i`; unipotent `u`; `SL₂` `z = i` | `r(t) = 2`, `r(t⁻¹) = ½`; both `u` and `1` satisfy the predicate at `u`; `r = 1` | determines `r` at semisimple points only, as stated; locator R03 | R03 |
| §5.5 `exists_conj_positiveRealPart_of_weightPattern_eq` | `G_m`, `q = 4`, `s = 2i`, `s' = 2`; `s = s' = u`, `r = u`, `r' = 1`; `H = ℂ` | patterns `1` at `k`, `r = r' = 2`; without semisimplicity `u ≁ 1`; `tr τ(r) = Σ n(i) q^(i/2)` | holds | none |
| Summary sentence | `sl₂(ℝ)`, `(H, E, F)`, `(H, −E, −F)` | equal `h`; `a²E ≠ −E` over `ℝ`; over `ℂ` conjugate by `Ad(diag(i, −i))` | prose wider than §4.1 | R04 |

- Source locators checked against the text: CH 24 line locators (lines 277, 279, 288, 291, 296, 323, 1158, 1163, 1550, 1554, 1555, 1701, 1703, 1707–1709, 1716–1728, 1734–1837), DG 7, SOM 3, KIR 3 (six lines); all carry the stated page; two repaired by R02, R03.
- Library declarations opened at the pins: 45, among them `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70`, `TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean:228`, `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:153` and `:219`, `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean:96`, `TauCeti/Algebra/Lie/HighestWeight/Module.lean:309`, `TauCeti/RingTheory/Invariant/OrbitSeparation.lean:89`, `Mathlib/Algebra/Lie/SerreConstruction.lean:152–164`; none missing, none already proving a target; no triple-conjugacy theorem from the neutral element exists at the pin.
- Cross-roadmap citations resolved: LieHighestWeight §5.1, §7.1, Layer 8 (main; R01 at #1797); NilpotentOrbits N0.2, N0.3, N2.1, N2.2, N2.4, N4 (main, over `ℂ`); RootSystems §4.1 (main and #2212); SpinRepresentations Layer 5 (main and #1207); ReductiveGroups Layers 1–7, 5P, 7C, §§9A, 9B, 9D, 10B (main); ReductiveGroupsPartIII §0.3, §0.5 (#2131); NoncompactQuantumSymmetry Layer 3 (#1015); GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 (#1845).
- Dependency check: `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`; no change outside the roadmap folder; the worker's gate passed every check.
- Elaboration of `Suggested.lean`: 9 warnings, all `declaration uses sorry`. `#check @name` for the 14 declarations: no lost binder, each type equals its README statement. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on the nine theorems: none closes.
- Headlines: nine stated; the Layer 4 test family and the group form of §5.2 are named in the docstring as not statable, and the pin has no highest weight of a comodule.
- Overlap check: read LieHighestWeight (main and #1797), SpinRepresentations, RealSemisimpleLieGroups, ClassicalGroups, RootSystems, ReductiveGroups, RootSystemsPartII, NilpotentOrbits; triple conjugacy and weighted diagrams over `ℂ`: NilpotentOrbits N2.2, N2.4 (§0.3 here is the variant over `K`); `Int(𝔤₀)` of a real algebra: RealSemisimpleLieGroups §0.2 (another carrier); half-spin modules: SpinRepresentations Layer 5; Serre presentation: LieHighestWeight; nothing owned twice.
- Open consumers TwistedAutomorphicDescents, SheafConvolutionOnAbelianVarieties and SmoothRepresentationsOfLocalGroupsPartII declare gaps on this roadmap (rational nilpotent orbits, classical dominance, a minuscule weight table, triple centralizers, graded open orbits, orbit tables); this head states none of them, and its Scope excludes rational forms and the dominance order.
- Source independence: 17 passages compared with 4 sources, none shared; largest share CH, 24 of 37 line locators; contents compared with CH: independent (Layers 0–1 ↔ §2, Layers 2–3 ↔ Appendix, Layer 4 ↔ §2.2, Layer 5 ↔ §6.12 and §10.1, not in the source's order).

## Not verifiable

- Collingwood–McGovern, *Nilpotent Orbits in Semisimple Lie Algebras* (the source R02 asks for): not in the sources cache and not read; its theorem numbers are known here only from CH line 1713.
- The Annals version of CH: not collated, as the README's References say; all locators were checked against arXiv v1 only.
- The published version of DG and the published book of KIR: not collated; locators checked against the arXiv v2 and author-page texts.

## Source issues

- **Gap** in CH at Appendix, proof of Lemma 10.9, p.35: the source says the cases `E₆` and `E₇` follow from `E₈` because they are Levi subalgebras; it should be proved in each root system, since the Levi summand does not control the rest; affects the proof.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, p.35: the source lists simple roots `ε₂ − ε₃, …, ε_(n−1) − ε_n` with dominant coordinates in increasing order; it should be `ε_(i+1) − ε_i`, or decreasing coordinates; affects nothing.
- **Misprint** in CH at Tables 2–4, pp.36–37: the source heads the columns as dimensions of the filtration steps; it should be dimensions of the graded pieces, the entries not being monotone; affects nothing.
- **Misprint** in CH at §8.1, p.28: the source defines the real part for elements of the real torus and later treats it as a torus element; it should be defined for all torus elements, with the group element being its exponential; affects nothing.

## For the human reviewers

- **Scope.** The four end theorems are Lemmas 2.4, 6.30, 10.9 and Proposition 10.2 of one article (CH), read at arXiv v1; 24 of the README's 37 line locators are into it.
- **Scope.** §3.3 (injectivity of profiles on 7, 28, 34, 274, 245 candidates) is a finite check over `3^r` label vectors; CH reports a computer calculation for it and no source gives a proof. This review reproduced the counts by script.
- **Licence.** SOM is an unpublished, unfinished set of notes (its §3.2 ends "to be continued", §4.1 is empty) hosted on another mathematician's university page, not the author's; the manifest classes it `institutional`.
- **Licence.** KIR is the draft on the author's page of a book published by Cambridge University Press; the manifest classes it `author-page`.
