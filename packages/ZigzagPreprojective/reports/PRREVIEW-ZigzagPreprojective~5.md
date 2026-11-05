# Review of ZigzagPreprojective (pull request #1653 at ea07bf8)

**Verdict:** needs changes

## Status of the previous review's findings

| Previous finding | Status at ea07bf8 | Evidence |
|---|---|---|
| R01 (P2) §5.2 re-planned the Koszul predicate and the general Koszul theorems | repaired | `README.md:809–820`: "Koszulity is the predicate of DGAInfinity Layer 11 … GrothendieckEulerForms Layer 3 supplying linear resolutions … None of this is redefined here"; only the matrix Hilbert-series form (831–836) and the zigzag-specific statements remain; `*Needs:*` at 861–865 and the contracts at 250–256 and 258–265 name both suppliers; Mazorchuk is no longer cited anywhere. Both supplier sections exist on main as described (`DGAInfinity/README.md:629–660`, `GrothendieckEulerForms/README.md:283–322`). |
| R02 (P2) the §4.2 self-injectivity headline was absent from `Suggested.lean` | repaired | `Suggested.lean:82–97` states `moduleInjective_preprojectiveAlgebra_of_dynkin` with `[Field k]`, `[Finite V]`, the orientation and the valid simply-laced Dynkin hypothesis; the docstring lists it at lines 27–29; `README.md:750` names it. |
| R03 (P2) the route used the unowned identification of the Baer–Geigle–Lenzing algebra with `Π_k(Q)` | repaired, but the repair introduces R01 below | `README.md:733–749` states the identification as a target with Crawley-Boevey, Theorem 2.3, p. 5 and Theorem 3.1, p. 6, and Ringel, Theorem A, p. 2, the sign normalisation, and the two works added to `## References` (1344–1352); the Auslander–Reiten input is now its own item (717–732). |
| R04 (P3) two citations of declarations that exist only after the pin | repaired | `README.md:238–242` no longer names `Zigzag/Braid/Nonadjacent.lean`; `README.md:1195–1199` makes the middle-factor vanishing this roadmap's own one-line target; `README.md:753–754` cites only the `A₁` and `A₂` files and makes `D₄` an instance. All 128 backticked `TauCeti.*`/`SimpleGraph.*` names and 63 file paths now resolve at Tau Ceti a91d3aa (the one non-`TauCeti` name, `SimpleGraph.adjMatrix`, is Mathlib's). |
| R05 (P3) a Layer 6 item needed Layer 7 | repaired | the item is gone from Layer 6 (`README.md:966–986`); its content is the sentence "Part of each statement is which of the two native objects of Layer 6 it produces …" in §7.1 (`README.md:1018–1022`); Layer 6's Dependencies (1000–1001) no longer mention Layer 7. |

## R01 (P2) — §4.2 re-plans the Auslander–Reiten translate and the Nakayama functor, which ArtinAlgebras owns on main and Tau Ceti already has at the pin

**Location:** `README.md:717–732` ("Define the `kQ`-bimodule `E = Ext¹_{kQ}(D(kQ), kQ)` and the endofunctors `τ⁻ = E ⊗_{kQ} −` and `τ = Hom_{kQ}(E, −)` … `ν = D Hom_{kQ}(−, kQ)` the Nakayama functor … QuiverRepresentations Layer 6 states the translate `τ = D Tr` … over an algebraically closed field; the statements over every field use the hereditary description above"), and the `*Needs:*` lines at 730–732, 748–749, 763–764. **Claim:** the translate over an arbitrary field is defined here, because the only existing owner is QuiverRepresentations Layer 6 over an algebraically closed field.

**Witness:** `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/README.md` on main, §4.1 (lines 806–822): "`τ M = D_R (Tr M)` and `τ⁻ M = Tr (D_R M)`" for every Artin `R`-algebra, "Over a field, `TauCeti.AuslanderReitenTranslate` and the quiver translate `TauCeti.arTranslate` are this construction with `R = k`"; §2.3 (lines 626–652): "The Nakayama functor `ν = D_R ∘ Hom_A(-, A)`", an equivalence from projectives to injectives; §4.2 (825–850): the Auslander–Reiten formulas `Ext¹_A(M, N) ≅ D_R(Hom_A(τ⁻ N, M) …)`. At the pin: `TauCeti.AuslanderReitenTranslate` (`TauCeti/Algebra/Module/AuslanderReiten/Translate.lean:111`, `Module.Dual k (AuslanderReitenTranspose p₁)` with its `A`-action), `TauCeti.AuslanderReitenTranspose` (`Transpose.lean:103`), `TauCeti.arTranslate` (`TauCeti/RepresentationTheory/Quiver/Representation/Translate.lean:85`, "formed from a finite minimal projective presentation" of a quiver representation over a field). So `τ`, `τ⁻` and `ν` over every field have an owner on main and a carrier at the pin, and the "algebraically closed" restriction the README attributes to the existing theory is QuiverRepresentations' alone. The hereditary description `τ⁻ ≅ E ⊗_Λ −`, `τ ≅ Hom_Λ(E, −)` with `E = Ext¹_Λ(Λ^*, Λ)` (`grant` lines 235–239, Proposition 2.5, p. 6) and Serre duality for projectives (`grant` lines 196–200, Theorem 2.3, p. 5) are not stated by ArtinAlgebras and may stay here, as theorems about the owned translate rather than as its definition.

**Repair:** rewrite the first item of §4.2 as: consume `τ`, `τ⁻` from ArtinAlgebras §4.1 (`TauCeti.AuslanderReitenTranslate`, `TauCeti.arTranslate` at the pin) and `ν` from ArtinAlgebras §2.3; prove here, for `Λ = kQ` hereditary over any field, that `τ⁻ ≅ E ⊗_Λ −` and `τ ≅ Hom_Λ(E, −)` with `E = Ext¹_Λ(D Λ, Λ)`, hence `τ⁻ ⊣ τ` and `τ⁻ M ≅ Ext¹_Λ(D Λ, M)` (Grant, Proposition 2.5, p. 6; Crawley-Boevey, Lemma 2.2, p. 5), Serre duality `Hom_Λ(P, M) ≅ D Hom_Λ(M, νP)` for `P` projective (Grant, Theorem 2.3, p. 5), and Grant's Theorem 2.7 consequence `I_i ≅ τ^{−ℓ(i)} P_{ρ(i)}`; delete "the statements over every field use the hereditary description above, and its agreement with `D Tr` … is a target here" and the QuiverRepresentations Layer 6 citation (it is the algebraically closed special case of ArtinAlgebras Layer 4, as ArtinAlgebras line 224 says); replace it by `ArtinAlgebras §2.3 and §4.1` in the three `*Needs:*` lines, add an `### From TauCetiRoadmap.ArtinAlgebras` paragraph to `## Exact supplier contracts` naming those sections and the three pinned declarations, and list ArtinAlgebras in Layer 4's `### Dependencies` (R03). Tested on `A₂` (`1 → 2`): ArtinAlgebras' `τ⁻` of the simple projective `P₂ = S₂` is `S₁ = I₁`, and `E ⊗ P₂ = Ext¹(D(kQ), P₂) = Ext¹(I₁, S₂) ⊕ Ext¹(I₂, S₂) = k ⊕ 0`, so the hereditary description agrees with the owned translate and `ℓ(1) = 1`, `ρ(1) = 2`, `ℓ(2) = 0`, `ρ(2) = 1`; the BGL dimension `3 + 1 = 4` equals `dim Π_k(A₂) = 2 + 2`. The dependency check accepts the citation: with `ArtinAlgebras §2.3 and §4.1` inserted into the line-730 `*Needs:*` of a scratch copy it printed `depcheck: 240 roadmaps, 2309 edges, 0 problem(s)`, while a control citation of a later roadmap on the same line produced an `UPWARD` line, so the line is parsed.

## R02 (P3) — "Frobenius, hence self-injective" is a pinned theorem

**Location:** `README.md:761–762` ("so `Π_BGL(kQ)` is Frobenius, hence self-injective (Grant, p. 4)"); `## Exact supplier contracts` names no Frobenius declaration. **Claim:** the step is supplied by a source.

**Witness:** `TauCeti/Algebra/Algebra/Frobenius/Basic.lean:90` defines `LinearMap.IsFrobeniusFunctional φ` (the pairing `(a, b) ↦ φ (a * b)` is nondegenerate, over any `[CommSemiring k] [Semiring A] [Algebra k A]`), and `Basic.lean:366–369` proves `IsFrobeniusFunctional.moduleInjective_self : Module.Injective A A`, with the right-module form at 371–375. Grant's Definition 2.1 (`grant` lines 150–153, a left-module isomorphism `A ≅ A^*`) is this functional's dual-equivalence form, `frobeniusFunctionalEquivDualEquiv` (`Basic.lean:259`).

**Repair:** state the conclusion of Grant's Theorem 3.1 here as a Frobenius functional on `Π_BGL(kQ)` (the functional dual to the left-module isomorphism `Π ≅ D Π`), cite `TauCeti.IsFrobeniusFunctional.moduleInjective_self` (`Algebra/Algebra/Frobenius/Basic.lean`) for "hence self-injective" in the sentence and under `### From Tau Ceti`, and keep Grant p. 4 only for the mathematics. Tested on `A₂`: `φ(a) = φ(a^*) = 1`, `φ(e_i) = 0` has Gram matrix `[[0,0,0,1],[0,0,1,0],[1,0,0,0],[0,1,0,0]]` in the basis `e₁, e₂, a, a^*` (the products `a a^*` and `a^* a` are the two relators), nondegenerate, so the native theorem returns `Module.Injective` for `Π_k(A₂)`.

## R03 (P3) — Layer 4's Dependencies and the QuiverRepresentations contract do not record what §4.2 now consumes

**Location:** `README.md:778–779` ("Layer 4 uses Layer 0 …, Mathlib's `Quiver.Symmetrify`, two-sided ideals and injective modules, and Tau Ceti's path algebras."); `README.md:246–248` (QuiverRepresentations "owns general path algebras, projectives, bound quivers, and Ringel forms"). **Claim:** every layer lists its dependencies and every supplier contract the sections consumed.

**Witness:** §4.2's `*Needs:*` lines (730–732, 748–749, 763–764) cite QuiverRepresentations Layers 1 and 6, Mathlib `Ext`, `Module.Baer`, Tau Ceti's Gabriel theorem and the gauge isomorphism, none of which the Dependencies paragraph or the QuiverRepresentations paragraph mentions; after R01 they also cite ArtinAlgebras.

**Repair:** in the same edit as R01, rewrite line 778–779 as "Layer 4 uses Layer 0 (…), ArtinAlgebras §2.3 and §4.1, QuiverRepresentations Layer 1, Mathlib's `Quiver.Symmetrify`, two-sided ideals, `Ext` and injective modules, and Tau Ceti's path algebras, Gabriel's theorem and Frobenius functionals", and add to the QuiverRepresentations paragraph the sentence "Its Layer 1 identifies representations with left `kQ`-modules, which §4.2 uses." Tested by reading each `*Needs:*` of Layer 4 against the rewritten paragraph: every item is covered.

## Verified sound

**Scope and principles.** The pull request revises the on-main roadmap `ZigzagPreprojective` (the folder on main has `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`; the last three are byte-identical). `git diff --stat origin/main...HEAD` outside the folder is empty. No route-specific shortcut, no computational algorithm, no copied passage (every sampled statement is in the author's words), no sorry'd data, no `set_option`, no forbidden import, no process word (a grep for "so far", "current", "removed", "checkpoint", "handoff", "pull request", round labels, `github.com`, `#NNNN`, LaTeX delimiters found nothing). No roadmap on main or in an open pull request constructs zigzag algebras, preprojective algebras, Ginzburg algebras, intrinsic formality or the affine recognition: `roadmaps grep` over the 457 indexed pull requests and main for "preprojective algebra" hits only this roadmap, McKaySkewGroup (a consumer) and GrothendieckEulerForms; for "Baer", "Nakayama functor", "Serre duality" and "Auslander" the only representation-theoretic owners are QuiverRepresentations and ArtinAlgebras on main (R01); QuiverRepresentationsPartII (#1486) is about multisegments and owns none of it.

**Gate, dependency check, elaboration.** My rerun of the gate at ea07bf8: every counter `0`, `OK`. The required dependency command printed exactly

```text
depcheck: 240 roadmaps, 2309 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. `lake build TauCetiRoadmap.ZigzagPreprojective.Suggested` from the pull-request worktree: exit 0, five `declaration uses sorry` warnings (lines 74, 91, 128, 162, 203), nothing else; `lake env lean` on `Suggested.lean`: exit 0 in 16 s, the same five warnings. A scratch file with `#check @name` for all ten declarations elaborated; the printed types carry `[Fintype V]`, `[DecidableEq V]`, `[DecidableRel G.Adj]`, `G.Connected`, the non-Dynkin hypothesis, `G.IsTree`, `[Field k]`, `[Finite V]` and, for the new theorem, `[Finite V]`, the orientation and the valid simply-laced Dynkin hypothesis, exactly as the README states them; no section variable was dropped. One-tactic probes (`infer_instance`, `simp`, `simp_all`, `aesop`, `exact Module.Baer.injective …`) all failed on `moduleInjective_preprojectiveAlgebra_of_dynkin`; the previous review's probes on the other four sorried theorems stand (the statements are unchanged). The three definitions and the structure have real bodies on native carriers and are needed by the headlines. Nothing is padding.

**Pinned declarations opened** (Tau Ceti a91d3aa, Mathlib 6b7abb3c):

| File and line | What it says |
|---|---|
| `Algebra/Module/AuslanderReiten/Translate.lean:95–125`; `Transpose.lean:98–110`; `RepresentationTheory/Quiver/Representation/Translate.lean:80–95` | `AuslanderReitenTranslate k p₁ = Module.Dual k (AuslanderReitenTranspose p₁)` with the left `A`-action through `dualRightAction`; the transpose is the cokernel of `Hom(p₁, A)`; `arTranslate` applies it to a minimal presentation of a pointwise finite-dimensional quiver representation over a field, independent of the presentation (`nonempty_iso_arTranslate`). R01. |
| `Algebra/Algebra/Frobenius/Basic.lean:84–96, 259, 366–375` | `IsFrobeniusFunctional` (nondegenerate pairing `φ (a * b)`), `IsSymmetricFrobeniusFunctional`, `frobeniusFunctionalEquivDualEquiv`, `moduleInjective_self`, `moduleInjective_op_self`. R02. |
| `RingTheory/Idempotents/Corner.lean:56–61` | `cornerMap k e f x = e * x * f`, so `preprojectiveGradedCorner` is `e_j Π_d e_i`. |
| `Preprojective/Basic.lean:115, 601`; `Grading.lean:171` | vertex idempotents of the symmetrified quiver, the quotient map, the path-length pieces. |
| `Zigzag/Orientation.lean:118, 125` | `OrientedQuiver G o := V`, `vertex v = v`. |
| `FiniteRepType/Gabriel.lean:112–117` | Gabriel's theorem over a field `k`, with the `diagramGraph` hypothesis shape used here. |
| `Zigzag/SelfInjective.lean:381–383`; `Preprojective/ADE/A1/SelfInjective.lean`, `A2/SelfInjective.lean` | `Module.Injective` is the carrier; the general preprojective statement is not native. |
| `DynkinType.lean:156–161, 193–195`; `AffineDynkinType/Basic.lean:154–157, 177, 226–233` | `Valid`, `IsSimplyLaced`, `IsGraphical`, `graph (A n) = cycleGraph (n+1)`, as the docstrings say. |
| `AInfinity/Algebra.lean:65–75`; `Minimal.lean:56, 172`; `Unit.lean:44–52`; `Formal.lean:63` | `m n` of degree `2 − n`; `IsMinimal`; `StrictUnit`; `IsFormal`; `isQuasiIso_iff_isIso`. |

All 128 backticked `TauCeti.*` and `SimpleGraph.*` names and all 63 `.lean` paths in the README resolve at the pin (`SimpleGraph.adjMatrix` in Mathlib).

**Cross-roadmap citations resolved on main.** DGAInfinity Layer 11 (`DGAInfinity/README.md:629–660`: Koszulity by a linear graded projective resolution of the right module `S`, taken from GrothendieckEulerForms Layer 3; Koszul ⇒ quadratic; dual Koszul and equal to `Ext^*_{Mod-A}(S,S)` with the Yoneda order fixed; double-orthogonal comparison only under the stated dualizability hypotheses), Layers 1–3, 5, 6, 8, 9 as before. GrothendieckEulerForms Layer 3 (`GrothendieckEulerForms/README.md:283–322`: linear resolutions, diagonal `Ext` vanishing, graded Cartan and Poincaré series inverse up to `q ↦ −q`, "the duality theorems … belong to the DG/`A∞` roadmap's relative-Koszul layer and to the zigzag roadmap"). QuiverRepresentations Layer 1 (line 229, representations as left `kQ`-modules), Layer 6 (385–418, `[IsAlgClosed k]`, `τ = D Tr`, almost-split sequences). ArtinAlgebras §2.3, §4.1, §4.2 (R01). McKaySkewGroup at its open head §4.1 and §4.2 consume this roadmap; StablePeriodicCurved (line 33) and KhovanovHomology cite it as supplier; neither has a `*Needs:*` line on this roadmap, and ArtinAlgebras §2.3 and §4.1 need only its own §2.2 and Tau Ceti, so the R01 citation closes no layer-level cycle.

**Sources and the seeded sample.** All locators are printed pages of the versions named in `## References`.

| # | Target and locator | Result |
|---|---|---|
| S01 | 0.1: Etingof et al. Problem 5.3(c)–(g), pp. 79–80 (`30325e11…` lines 3405–3438) | (c) cycles, (f) the classification, (g) affine = semidefinite = the forbidden diagrams; the null-vector route is this roadmap's own, as it says. |
| S02 | 0.2: the native declarations of `README.md:441–454` | all resolve at the pin. |
| S03 | 1.1: Couture Lemma 4.3, Proposition 4.4 ("at least 3 vertices", lines 346, 374), Theorem 4.8 p. 12 (547), Theorem 4.12 p. 15 (689) | matches the vertex-fixing versus `Aut(Γ)` distinction. |
| S04 | 2.1: Huerfano–Khovanov §3 p. 4 (`fa1f2fbb…` 182–186: degrees `0,1,2`, dimensions `v, 2e, v`, `X` in degree 2 for one vertex); Ehrig–Tubbenhauer Definition 2.2 p. 3 (163) | matches basis and dimension. |
| S05 | 3.1: Ehrig–Tubbenhauer Lemma 2.7 (218–221), Proposition 2.8 p. 5 (259, `2_q I + qA`); Huerfano–Khovanov (36) p. 11 (513–516) | `C_G(q) = (1 + q²)I + qA_G`. |
| S06 | 4.1: Crawley-Boevey ICM §1 printed p. 119 (`crawleyboevey` 4954–4958, 4977) | the relation and orientation independence. |
| S07 | 4.2: Grant Theorem 2.3 p. 5 (`grant` 196–200), Proposition 2.5 p. 6 (235–239), Definition 2.6 p. 6 (244–250, product `τ^{−r} g ∘ f`), p. 6 (252, Ringel and Crawley-Boevey "up to sign"), Theorem 2.7 p. 7 (265–274, after Auslander–Platzeck and Gabriel, `I_i ≅ τ^{−ℓ(i)} P_{ρ(i)}`), Theorem 3.1 p. 7 (279–292: Serre duality, the adjunction and "every injective is preprojective" give `Π ≅ Π^*` as left modules), p. 4 (157–160); Crawley-Boevey 1999 Lemma 2.2 p. 5 (`cb99` 218–224, `Ext¹(DA, −) ≅ Ext¹(DA, A) ⊗_A −`, `τ⁻ = Ext¹(DA, −)`), Theorem 2.3 p. 5 (231, `Π⁰(A) = Π_BGL(A)`), Theorem 3.1 p. 6 (244–245, 269: `Π^λ(KQ) = KQ̄/(Σ[a,a^*] − Σλ_i e_i)`); Ringel Theorem A p. 2 (`ringel98` 69–74: `P_k(Q) ≅ kQ⟨Ext¹(D(kQ), kQ)⟩`, identity on `kQ`, reverse-arrow ideal onto the augmentation ideal), relation `ρ = Σ ε_Q(α) α^* α` (50), §6 pp. 16–17 (657–676: `P'(Q)` with `ρ' = Σ α^* α` not isomorphic to `P_k(Q)` for the affine `Ã₂` quiver in characteristic `≠ 2`, dimension vector `(1,1,1)` at 698) | every locator supports its sentence; the ownership defect is R01, the native step R02. Brenner–Butler–King is `uncertified` in the manifest and cited by locator as Grant attributes it. |
| S08 | 5.2: Huerfano–Khovanov Proposition 11 p. 11 (500–503); Etingof–Eu Definition 2.3.3 p. 3 (142), Definition 2.1.2 p. 2 (62), Theorem 2.3.4 and its proof p. 3 (148–150) | matches; the general theorems are now consumed from DGAInfinity Layer 11 and GrothendieckEulerForms Layer 3. |
| S09 | 5.4: Etingof–Eu Theorem 2.3.4(ii) (149), Theorem 3.4.2 p. 7 (329–331) | Koszulity from the Hilbert series. |
| S10 | 6.1: Keller Theorem 4.8 p. 20 (`ca9dc0ee…` 927–928), Theorem 6.3 p. 27 (1266–1268) | hypotheses as in the source. |
| S11 | 7.1: Etgü–Lekili Theorem 23 p. 37 (`d9397140…` 1279–1281, right modules over the opposite zigzag algebra, both gradings), Corollary 25 p. 40 (1378–1380) | matches, including the placement of the two-native-objects sentence. |
| S12 | 7.2: Schedler Theorem 13.1.1 p. 62 (`bd20e33e…` 2992–2996); Liu–Wang Proposition 3.2 (118–120), Corollary 3.4 (198–200) | matches. |
| S13 | 7.3: Liu–Wang Theorem 1.1 (19–21), Definition 4.1 (211–213), Theorem 4.2 (217–218), Example 4.7 (289) | matches. |
| S14 | 8.1: Huerfano–Khovanov Proposition 7 p. 9 (395); Khovanov–Seidel §2d (466), Corollary 1.2 p. 5 (204) | matches. |
| S15 | 8.2: Seidel–Thomas Definitions 2.2 (510), 2.5 (554), 2.9 (609–613, `n > 0`, (K3), (K4)), Theorems 2.17 (768–770), 2.18 (781–783, `n ≥ 2`) | matches. |

**Adversarial values.** Computed this round by my own linear algebra on doubled paths (ideal spanned by `p ρ_v q`, commutator space spanned by `pq − qp`), ranks over `𝔽₂`, `𝔽₃`, `𝔽₅` exactly and over `ℚ` through a large prime proxy; graph enumeration with exact rational kernels.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `affine_graph_recognition`, both directions | every labelled connected simple graph on 1–6 vertices | 1, 1, 4, 38, 728, 26 704 graphs; a one-dimensional kernel of `2I − A` with a strictly signed generator for 0, 0, 1, 3, 17, 150 of them; the list (cycles, `D̃_n`, the three arm triples) counts 0, 0, 1, 3, 17, 150; mismatches 0; kernel of dimension `≥ 2` never | iff holds on the sample, `t` unique |
| Arm equation | `a ≤ b ≤ c`, `a < 20` | solutions `(1,2,5), (1,3,3), (2,2,2)`; `(1,2,4)` gives `31/30` | the list is complete |
| `moduleInjective_preprojectiveAlgebra_of_dynkin` | `A₁`; `A₂`; `D₄`; empty vertex type | `Π(A₁) = k`; `Π(A₂)` of dimension `4` with the Frobenius form of R02; `Π(D₄)` of dimension `4 + 6 + 8 + 6 + 4 = 28`, `H₄ = I`, `H₅ = 0`; for `V` empty no valid `t` has rank `0`, so the hypothesis fails and nothing is claimed | true where it applies, not vacuous |
| Same, hereditary description versus the owned translate | `A₂`, `1 → 2` | `τ⁻ P₂ = S₁`, `τ⁻ P₁ = 0`; `E ⊗ P₂ = Ext¹(I₁, S₂) = k`; `ℓ = (1, 0)`, `ρ = (2, 1)`; BGL dimension `3 + 1 = 4` | the two descriptions agree |
| Ringel's sign normalisation | `Σ_{α ∈ Q̄₁} ε(α) α^* α` | `= Σ_{α ∈ Q₁} α^* α − Σ_{α ∈ Q₁} α α^* = −Σ_α (α α^* − α^* α)` | the same ideal as the native relator; the cited gauge isomorphism is not needed but is harmless |
| `preprojectiveHilbertMatrix_recursion`, triangle | `C = J − I`, `d ≤ 5` | `dim Π_d = 3, 6, 9, 12, 15, 18`; `H₂ = J`, `H₃ = J + I`, `H₄ = 2J − I`, `H₅ = 2J`; row sums `1..6` | Check correct |
| Same, `D̃₄` | centre first, `d ≤ 4` | `dim Π_d = 5, 8, 15, 16, 25`; `H₂` centre entry `3`, leaf–leaf `1` off the diagonal and `0` on it; `H₄` centre `5` | Check correct |
| Same, Dynkin controls | `D₄`; `A₂`; `A₁` | `D₄`: `4, 6, 8, 6, 4, 0, 0`, `H₂` centre `2`, `H₄ = I`, `H₅ = 0`, recursion fails at `d = 4`; `A₂`: `H₂ = 0`, `H₁ = C ≠ 0`; `A₁`: `H₂ + H₀ = I ≠ 0` | hypothesis necessary and present |
| `preprojective_cyclicQuotient_vanishes_iff` | `D₄` degree 4 over `ℚ, 𝔽₂, 𝔽₃`; `D̃₄` degree 4 over `ℚ, 𝔽₂`; `E₆` degree 6 over `𝔽₃, 𝔽₅` (and degrees `1..5`); `A₂`; triangle degrees `2..5` | `0, 1, 0`; `2, 3`; `1, 0` (and `0` in degrees `1..5`); `A₂`: `0` in every degree `≥ 1`; triangle: `1, 2, 1, 2` | reproduces Schedler's table and the three Checks; non-Dynkin nonzero in degree `≥ 3` |
| `IsBadPrime` | `(D 4, 2)`, `(A 2, 2)`, `(E6, 3)`, `(E6, 5)`, `(E8, 5)`, `(t, 0)` | true, false, true, false, true, false | matches the API bullets |
| `A₁` intrinsically formal | `m_n(x, …, x)` | degree `2n + 2 − n = n + 2 ∉ {0, 2}` for `n ≥ 3` | right side true for `A 1` |
| Twists on `K₀` | two `2`-spherical objects | `A = [[−1,1],[0,1]]`, `B = [[1,0],[1,−1]]`, `ABA = BAB = [[0,−1],[−1,0]]`, `det A = det B = −1` | Check and `A₂` Example correct |
| Koszul transpose Check | `A₂` quiver `1 → 2` | `(I + tE₂₁)(I − tE₂₁) = I`; without the transpose the degree-one term is `E₂₁ − E₁₂` | pins the transpose |
| Signless degree-two count | triangle | `12` doubled paths of length two, `3` vertex relations on disjoint supports, dimension `9` = total of `J` | Check correct |

## Not verifiable

- The worker's seeded sample gave the fifteen target headings; locators within them are mine.
- Brenner–Butler–King, Theorem 4.8 is recorded `uncertified` in the manifest and was not read; the README cites it by locator as Grant attributes it, which is the allowed form.
- The manifest records `crawleyboevey` and `ringel98` without authors, title or year (the cache lists them as empty); this review edits no manifest, and the README's `## References` entries for both are complete.
- Ownership against open pull requests was checked through `roadmaps grep` over the 457 indexed pull requests and the sibling checkouts named in the brief; McKaySkewGroup and QuiverRepresentationsPartII were read at their open heads.
- The claim that every homologically unital minimal `A∞` structure over a field is isomorphic to a strictly unital one (`README.md:1099–1101`) is a standard fact cited without locator; it is not a target.

## Source issues

- none
