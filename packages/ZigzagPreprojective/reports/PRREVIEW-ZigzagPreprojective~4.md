# Review of ZigzagPreprojective (pull request #1653 at 5e2b634)

**Verdict:** needs changes

## Status of the previous review's findings

| Previous finding | Status at 5e2b634 | Evidence |
|---|---|---|
| R01 (P2) Hilbert-series headline absent | repaired | `Suggested.lean:82–107`: `preprojectiveGradedCorner` (image of `TauCeti.preprojectiveGrade` under `TauCeti.cornerMap`), `preprojectiveHilbertMatrix`, and `preprojectiveHilbertMatrix_recursion` with `H₀ = I`, `H₁ = C`, `H_{d+2} + H_d = C H_{d+1}` under connectedness and the non-Dynkin hypothesis; the docstring names the two Koszulity statements as not statable (lines 36–39). |
| R02 (P3) "RootSystems Layer 5" | repaired | `README.md:393–398` cites `SimpleGraph.posDef_graphCartanMatrix_iff` (`FiniteType/SimpleGraph.lean:143` at the pin); "Layer 5" no longer occurs. |
| R03 (P3) native Layer 6 and 8 constructions restated | repaired | `README.md:219–244` lists the Ginzburg, loop-deformation and braid-complex declarations; `README.md:898–912` and `1132–1142` consume them. |
| R04 (P3) locators on Layers 1–3, 6, 8 | repaired | Huerfano–Khovanov Proposition 1 p. 4 (line 581), Ehrig–Tubbenhauer Lemma 2.7 p. 4 (617), Keller Theorems 4.8 p. 20 and 6.3 p. 27 (920, 934), Etgü–Lekili Theorem 23 p. 37 (929), Huerfano–Khovanov Proposition 7 p. 9 (1145), Khovanov–Seidel Corollary 1.2 p. 5 (1161), Crawley-Boevey §1 p. 119 (692). |
| R05 (P3) layer endings and per-target needs | repaired | every layer ends with `### Examples` and `### Dependencies` (lines 469, 477, 541, 549, 588, 595, 648, 657, 726, 734, 879, 889, 944, 954, 1112, 1122, 1203, 1213); upstream headings at lines 21, 56, 159, 268; `*Needs:*` on the non-native targets. |
| R06 (P3) Mathlib pull-request links | repaired | no `github.com`, `#NNNN` or "pull" string in `README.md`. |

## R01 (P2) — §5.2 re-plans the Koszul predicate and the general Koszul theorems owned by DGAInfinity Layer 11 and GrothendieckEulerForms Layer 3

**Location:** `README.md:771–791` ("The Koszul predicate is defined here: … A Koszul algebra is quadratic … The Koszul dual `A^!` … is the Yoneda algebra … is Koszul, and `(A^!)^! ≅ A` … The matrix Hilbert series … of a Koszul algebra and of its dual are inverse …"), new in this head (`changes.md` line 705 onward). **Claim:** this roadmap defines Koszulity and proves the general Koszul facts.

**Witness:** `TauCetiRoadmap/GrothendieckEulerForms/README.md:313–322` on main defines the linear graded projective resolution, proves its equivalence with diagonal `Ext` vanishing and with "the graded Cartan and Poincaré series being inverse up to `q ↦ -q`", and says in bold that it supplies the definition while the duality theorems belong to DGAInfinity's relative-Koszul layer and to the zigzag roadmap. `TauCetiRoadmap/DGAInfinity/README.md:642–651` on main: "Define Koszulity using graded right `A`-modules by a linear graded projective resolution … Prove that a Koszul algebra is quadratic, its quadratic dual is Koszul, and … `Ext^*_{Mod-A}(S,S)` identifies with `A!`", naming "the zigzag roadmap's classical Koszulity" as the consumer. The `*Needs:*` line of §5.2 (`README.md:815–817`) cites neither roadmap. The same object therefore has two owners, and the Mazorchuk citation (`mazorchuk` line 2568, Corollary 10.12, p. 49, over `ℂ` with `A₀ ≅ ℂᵏ`, lines 2399–2403) is attached to a theorem this roadmap is not meant to prove.

**Repair:** keep in §5.2 only the zigzag-specific statements (Koszul exactly for non-Dynkin graphs with at least three vertices, the identification of the dual with the signless algebra of §5.1, the almost-Koszul finite case, `A₁`/`A₂` by their resolutions, and the three Checks); replace lines 771–786 by consumption: "Koszulity is the predicate of DGAInfinity Layer 11 (linear resolutions from GrothendieckEulerForms Layer 3); that layer supplies Koszul ⇒ quadratic, the Koszul dual as the Yoneda algebra and the Koszulity of the dual", and add both to the `*Needs:*` line and to `## Exact supplier contracts`. The matrix Hilbert-series identity `h_A(t) · h_{A^!}(−t)ᵀ = I` may stay as this roadmap's matrix form of GrothendieckEulerForms' scalar statement, citing that layer. The `A₂`-quiver Check still pins the transpose (recomputed: `(I + tE₂₁)(I − tE₂₁) = I`, while the product without the transpose has degree-one term `E₂₁ − E₁₂`).

## R02 (P2) — The statable §4.2 self-injectivity headline is absent from `Suggested.lean`

**Location:** `README.md:709–722` ("Prove self-injectivity of `Π_k(Q)` for every finite simply-laced Dynkin graph and every field"); `Suggested.lean:22–57` (the "Stated here" and "Not statable" lists name no Layer 4 theorem). **Claim:** the acceptance file states every statable headline and names every unstatable one.

**Witness:** §4.2 is the only non-native theorem of Layer 4 and has its own subsection, route and source (Grant, Theorem 3.1). It is statable at the pin on the carriers the file already uses: `Module.Injective` is the carrier of `TauCeti.moduleInjective_zigzagAlgebra` (`Zigzag/SelfInjective.lean:381–382`), and `TauCeti.preprojectiveAlgebra k (TauCeti.DoubledQuiver.OrientedQuiver G o)` with the hypothesis `∃ t, t.Valid ∧ t.IsSimplyLaced ∧ Nonempty (G ≃g TauCeti.diagramGraph t.cartanMatrix)` is exactly the shape of `preprojective_cyclicQuotient_vanishes_iff` (`Suggested.lean:134–141`). Negative control at the pin: the only preprojective self-injectivity files are `Preprojective/ADE/A1/SelfInjective.lean` and `A2/SelfInjective.lean`, so the general statement is not native.

**Repair:** add to `Suggested.lean`, in a `/-! ## Layer 4 -/` section, `theorem moduleInjective_preprojectiveAlgebra_of_dynkin (k) [Field k] {V} [Fintype V] (G : SimpleGraph V) (hG : G.Connected) (o : TauCeti.DoubledQuiver.Orientation G) (ht : ∃ t : TauCeti.DynkinType, t.Valid ∧ t.IsSimplyLaced ∧ Nonempty (G ≃g TauCeti.diagramGraph t.cartanMatrix)) : Module.Injective (TauCeti.preprojectiveAlgebra k (TauCeti.DoubledQuiver.OrientedQuiver G o)) (TauCeti.preprojectiveAlgebra k (TauCeti.DoubledQuiver.OrientedQuiver G o)) := by sorry`, name it in the README at line 709 and in the docstring's "Stated here" list. Tested on `A₁`: the one-vertex graph is `diagramGraph (A 1).cartanMatrix`, `Π = k`, injective over itself, so the statement is true there and not vacuous.

## R03 (P2) — The §4.2 route uses the identification of the Baer–Geigle–Lenzing algebra with the presented `Π_k(Q)`, which no layer, supplier or declaration provides

**Location:** `README.md:711–716` ("the algebra there being Baer--Geigle--Lenzing's `⊕_{r ≥ 0} Hom_Λ(Λ, τ^{−r}Λ)` (Grant, Definition 2.6, p. 6), which Ringel and Crawley-Boevey identified with the presented `Π_k(Q)` (Grant, p. 6)"); `*Needs:*` at lines 721–722. **Claim:** Grant's theorem yields self-injectivity of the native `TauCeti.preprojectiveAlgebra`.

**Witness:** Grant's Theorem 3.1 (`grant` line 279, p. 7) is about `Π = ⊕_{r≥0} Hom_Λ(Λ, τ^{−r}Λ)` (`grant` lines 244–250, Definition 2.6, p. 6). The passage to the presented algebra is a theorem of Ringel and of Crawley-Boevey which Grant only reports, "up to sign" (`grant` line 252); it needs the Auslander–Reiten translation `τ` and the preprojective modules, which live in QuiverRepresentations Layer 6 (`TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:385`), not in Layer 1 as cited. Neither the identification nor Layer 6 appears in the `*Needs:*` line, and the primary sources are not in `## References`. Grant p. 4 (lines 157–160) does supply "Frobenius ⇒ self-injective", as cited.

**Repair:** either (a) state the identification `Π_k(Q) ≅ ⊕_{r ≥ 0} Hom_{kQ}(kQ, τ^{−r} kQ)` as a target of §4.2 with its primary locator (Ringel, *The preprojective algebra of a quiver*, 1998, or Crawley-Boevey, *Preprojective algebras, differential operators and a Conze embedding*, 1999; the author supplies the theorem number and adds the work to `## References`), with `*Needs:* QuiverRepresentations Layer 6 (τ, preprojective modules)`, and note the sign normalisation; or (b) route through Brenner–Butler–King, Theorem 4.8, which Grant p. 7 (line 278) says proves the statement for the path algebra of a quiver, after checking that source's hypotheses on the field. Tested on `A₂`: the BGL algebra is `End(P₁ ⊕ P₂) ⊕ Hom(kQ, τ^{−1}kQ)` of dimension `4`, matching `Π(A₂)` of dimension `2 + 2`, so the identification is the step that transports Grant's conclusion.

## R04 (P3) — Two citations are of declarations that exist only in a Tau Ceti later than the pin

**Location:** `README.md:241–244` ("`TauCeti.subsingleton_balancedTensorProduct_zigzagAlgebra_of_ne_of_not_adj` (`Zigzag/Braid/Nonadjacent.lean`)"), `README.md:1148–1150` (the same as the input to the commuting relation), and `README.md:710–711` ("`D4/SelfInjective.lean`"). **Claim:** these are native at the pin.

**Witness:** at the pinned Tau Ceti a91d3aa (`lake-manifest.json`), `TauCeti/RepresentationTheory/Quiver/Zigzag/Braid/` contains only `Basic.lean`, no declaration whose name contains `balancedTensorProduct` exists, and `TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/D4/` contains only `Basic.lean`. Both files exist at Tau Ceti 358314d. The other 127 cited `TauCeti.*`/`SimpleGraph.*` names and 60 cited file paths resolve at the pin.

**Repair:** at line 241 and 1148, replace the citation by this roadmap's own one-line target in Layer 2 or 8, "for distinct nonadjacent `i, j` the corner `e_i Z e_j` is zero, from the basis of §2.1, hence `e_i Z ⊗_Z Z e_j = 0`", or keep the name once the pin advances; at line 710 cite only the `A₁` and `A₂` files as native and list `D₄` with the general target.

## R05 (P3) — A Layer 6 item needs Layer 7

**Location:** `README.md:926–931` ("Record exactly when derived Koszul duality produces … *Needs:* the native completion and comparison morphism above; Layer 7 states the dualities.") and `README.md:957` ("Layer 7 supplies the dualities that the second item records"). **Claim:** layers are in build order.

**Witness:** the item's content is a property of the dualities of §7.1 (which native object each produces), so its proof cannot precede Layer 7; the layer's own Dependencies paragraph says so.

**Repair:** move the item into §7.1 as the second sentence of the first bullet (after the two dualities are stated), keeping in Layer 6 only the two native objects `Π₂(Q)` and `Π̂₂(Q)` with the comparison morphism; drop the clause at line 957.

## Verified sound

**Scope and principles.** The pull request revises the on-main roadmap `ZigzagPreprojective` (main has the folder with `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`; the last three are byte-identical to main). The diff outside the folder is empty. No route-specific shortcut, no computational algorithm, no copied passage (every sampled statement is in the author's words), no sorry'd data, no `set_option`, no forbidden import. The new Layer 0 target extends the existing graph owner and re-plans nothing; the affine carrier is the native `TauCeti.AffineDynkinType`, and no roadmap on main or in an open pull request constructs zigzag algebras, preprojective algebras, Ginzburg algebras, intrinsic formality or the affine recognition (searched by object with `roadmaps grep` over the 449 open pull requests and main: the only other hits are McKaySkewGroup, a consumer, and DGAInfinity/StablePeriodicCurved, which cite this roadmap).

**Gate, dependency check, elaboration.** My rerun of the gate at 5e2b634: every counter `0`, `OK`. The required dependency command printed exactly

```text
depcheck: 233 roadmaps, 2222 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: exit 0 in 9.8 s, four `declaration uses sorry` warnings (lines 70, 107, 141, 182), nothing else. A scratch copy with `#check @name` for all nine declarations elaborated; the printed types carry `[Fintype V]`, `[DecidableEq V]`, `[DecidableRel G.Adj]`, `G.Connected`, the non-Dynkin hypothesis, `G.IsTree`, `[Field k]`, `[Finite V]` exactly as the README states them, and no section variable was dropped. One-tactic probes (`simp`, `rfl`, `infer_instance`, `simp_all`, `aesop`) failed on all four sorried theorems; the three definitions and the structure have real bodies and are needed by the headlines. Nothing is padding.

**Pinned declarations opened** (Tau Ceti a91d3aa, Mathlib 6b7abb3c):

| File and line | What it says |
|---|---|
| `TauCeti/RingTheory/Idempotents/Corner.lean:56–61` | `cornerMap k e f x = e * x * f`, so `preprojectiveGradedCorner k Q d j i` is `e_j Π_d e_i` as the README says. |
| `Preprojective/Basic.lean:115`, `:601`; `Preprojective/Grading.lean:171` | `doubledVertexIdempotent` is the vertex idempotent of the symmetrified quiver; `preprojectiveMk` the quotient map; `preprojectiveGrade n` the quotient piece of the path grading. |
| `Zigzag/Orientation.lean:118,125` | `OrientedQuiver G o := V`, `vertex v = v`. |
| `Zigzag/Componentwise/Basic.lean:106`, `Grading.lean:16–17,234` | `zigzagAlgebra` is the product of component algebras; on a singleton the dual-number generator is in degree two; `zigzagAlgebraIntegerGrade` extends by zero. |
| `AInfinity/Algebra.lean:65–75`; `Minimal.lean:56,172`; `Unit.lean:44–52`; `Formal.lean:63`; `Cohomology.lean:303,463` | `m n` of degree `2 − n`, `m 0 = 0`; `IsMinimal` is `differential = 0`; `StrictUnit` is degree 0, two-sided unit for `m 2`, kills every `m n` with `n ≠ 2`; `IsFormal` is an `A∞` quasi-isomorphism to `cohomologyAInfinityAlgebra`, the zero-differential algebra on cohomology with the product induced by `m 2`; `isQuasiIso_iff_isIso` for minimal algebras. For a minimal deformation with `m 2` the product, the cohomology algebra is the strict algebra, so `IsIntrinsicallyFormal` is Liu–Wang's "no nontrivial deformation up to `A∞`-isomorphism". |
| `DynkinType.lean:156–161,193–195` | `Valid`: `A n` needs `1 ≤ n`, `D n` needs `4 ≤ n`; `IsSimplyLaced` true exactly for `A, D, E`. `IsBadPrime` covers all nine constructors. |
| `AffineDynkinType/Basic.lean:154–157,177,226–233` | `Valid`: `A n` needs `1 ≤ n`, `D n` needs `4 ≤ n`; `IsGraphical` is `t ≠ A 1`; `graph (A n) = cycleGraph (n+1)`. Hence `Valid ∧ IsGraphical` is cycles on `≥ 3` vertices, `D̃_n` (`n ≥ 4`), `Ẽ₆, Ẽ₇, Ẽ₈`, as the docstring says. |
| `Zigzag/SelfInjective.lean:381–383` | `Module.Injective (zigzagAlgebra k G) (zigzagAlgebra k G)`, the carrier for R02. |
| `FiniteRepType/Gabriel.lean:112–117` | Gabriel's theorem over a field `k` for a finite connected quiver, with the `diagramGraph` hypothesis shape used here. |
| `Preprojective/ADE/` | `A1/SelfInjective.lean`, `A2/SelfInjective.lean`, `D4/Basic.lean` only (R04). |
| `Zigzag/Braid/` | `Basic.lean` only (R04). |

The other names cited in the README (129 backticked `TauCeti.*` and `SimpleGraph.*` names, 61 file paths) were grepped at the pin: all resolve except the two of R04. Mathlib and Tau Ceti have no Koszul predicate (grep for `IsKoszul`, `KoszulAlgebra`, `Koszul algebra`: only bibliographic mentions in `ExtEuler/Graded/*.lean`), so the docstring's "not statable" entries for the Koszul statements are correct.

**Cross-roadmap citations resolved.** DGAInfinity on main: Layers 1 (line 293), 2 (317), 3 (353, transfer along a contraction), 5 (431), 6 (466, derived Morita), 8 (520; criterion `HH^{n,2-n}(H,H)=0` for `n ≥ 3` at line 540), 9 (550; `Π_n(C)=T_C(C![n-1])` at 565–566, deformed completions at 567–568), 11 (629; R01). GrothendieckEulerForms on main: Layers 3 (283, R01) and 6 (437). QuiverRepresentations on main: Layer 1 (229, representations as `kQ`-modules), Layer 6 (385, R03). McKaySkewGroup at its open head: §4.1 (line 944) and §4.2 (1008), consuming this roadmap (lines 269, 983, 991). StablePeriodicCurved (line 33) and KhovanovHomology (line 36) on main cite this roadmap as supplier. The worker's citation resolver found nothing unresolved; I confirmed each by hand.

**Sources and the seeded sample.** Grant, Mazorchuk and the ICM 2006 volume were fetched through the sources service (ids `grant`, `mazorchuk`, `crawleyboevey`); the other texts are the cache copies named by hash prefix. All locators are printed pages of the arXiv versions named in `## References`.

| # | Target and locator | Result |
|---|---|---|
| S01 | 0.1: Etingof et al. Problem 5.3(c)–(g), pp. 79–80 (30325e11… lines 3405–3438; page markers 3396, 3432) | (c) cycles, (d) degree `≥ 4`, (e) the three `E` stars, (g) affine = semidefinite = the forbidden diagrams. The null-vector route is the roadmap's own, as it says; both sides recomputed below. |
| S02 | 0.2: native declarations | every name in `README.md:436–449` resolves at the pin (`Zigzag/Basic.lean`, `Orientation.lean`, `Admissible.lean`, `ArrowIdealPresentation.lean`, `Relations.lean`, `Grading.lean`, `Isomorphism.lean`, `Componentwise/Basic.lean`). |
| S03 | 1.1: Couture Theorem 4.8 p. 12 (a9850ef7… line 547), Theorem 4.12 p. 15 (689), Lemma 4.3 (346) and Proposition 4.4 (374) with "at least 3 vertices"; Huerfano–Khovanov §4.6 p. 9 (fa1f2fbb… line 416, the `ν` parameters) and §3 p. 4 (179–183: `A₁`, `A₂` conventions) | matches the README's vertex-fixing versus `Aut(Γ)` distinction and low-rank conventions. |
| S04 | 2.1: Huerfano–Khovanov §3 p. 4 (lines 182–191: degrees `0,1,2` of dimensions `v, 2e, v`; Proposition 1, trace sending length-two paths to `1`, symmetric, nondegenerate); Ehrig–Tubbenhauer Definition 2.2 p. 3 (29429306… line 163), Lemma 2.6 p. 4 (212), §4A p. 11 (687) | matches basis, dimension `2|V| + 2|E|` and trace. |
| S05 | 3.1: Ehrig–Tubbenhauer Lemma 2.7 p. 4 (lines 218–226: `1 + q²`, `q`, `0`), Proposition 2.8 p. 5 (259: `2_q I + qA`, `2_q = 1 + q²`); Huerfano–Khovanov (36) p. 11 (513–518) | `C_G(q) = (1 + q²)I + qA_G` entrywise, with `c_{ab} = Σ q^i dim Hom(P_a{i}, P_b)` as in the Conventions. |
| S06 | 3.2: Huerfano–Khovanov §6.1 pp. 11–12 (lines 521–528) | at `q = −1` the graph Cartan matrix, determinant `0` for affine graphs, nonzero polynomial, invertible over `ℚ(q)`. |
| S07 | 4.1: Crawley-Boevey §1 printed p. 119 (`crawleyboevey` lines 4955–4959 the relation `Σ_a (aa* − a*a)`; 4977 orientation independence); Etingof–Eu Theorem 3.4.2 p. 7 (abfa7d32… line 329) | matches the relation and the finite/infinite dichotomy. |
| S08 | 4.2: Grant Theorem 3.1 p. 7 (`grant` line 279: basic, representation-finite `Λ` gives Frobenius `Π`), Definition 2.6 p. 6 (244–250), p. 4 (157–160: Frobenius implies self-injective), p. 6 (252: Ringel and Crawley-Boevey "up to sign"), field arbitrary (139) | locators correct; the route gap is R03, the missing statement R02. |
| S09 | 5.2: Huerfano–Khovanov Proposition 11 p. 11 (lines 500–506: Martínez-Villa; sentence 2 the signless relation; sentence 3 bipartite = source–sink preprojective); Etingof–Eu Definition 2.3.3 p. 3 (142), Definition 2.1.2 p. 2 (62), proof of Theorem 2.3.4 p. 3 (150–158); Mazorchuk Corollary 10.12 p. 49 (`mazorchuk` 2568–2569; setting 2399–2403) | every locator supports its sentence; the ownership defect is R01. |
| S10 | 5.3: Etingof–Eu Theorem 3.4.2 p. 7 (329–330), Definition 3.1.1 p. 4 (188), Lemma 2.2.5 p. 2 (100), Lemma 2.3.2 p. 3 (140), Theorem 2.3.4(i) p. 3 (148), Proposition 3.2.2 p. 4 (217, Lusztig at 216), §3.4 pp. 6–7 (297); Huerfano–Khovanov Proposition 12 and Corollary 2 p. 12 (536–540) | `h = (1 − Ct + t²)⁻¹` for connected non-Dynkin quivers over any field; `C_q(Γ) C^!_{−q}(Γ) = I`; Lusztig's skew-group route is the source's, correctly declared not an input. |
| S11 | 5.4: Etingof–Eu Theorem 2.3.4(ii) p. 3 (149) and Theorem 3.4.2 second statement (330–332) | Koszulity from the Hilbert series, as stated. |
| S12 | 6.1: Keller Theorem 4.8 p. 20 (ca9dc0ee… line 927: homologically smooth `A` gives smooth, `n`-Calabi–Yau `Π_n(A)`), Theorem 6.3 p. 27 (1266: `Π_n(A,c)` quasi-isomorphic to the Ginzburg algebra); Etgü–Lekili Theorem 23 p. 37 (d9397140… 1279) | hypotheses stated as in the sources. |
| S13 | 7.2: Schedler Theorem 13.1.1 p. 62 (bd20e33e… 2992–3020: `(Λ_{A_n})_+ = 0`; `D_n`: `ℤ/2` at `4 | m ≤ 2(n−2)`; `E₆`: 4, 6; `E₇`: 4, 6, 8, 16; `E₈`: 4, 6, 8, 10, 16, 18, 28 with `ℤ/5` at 10; split sequence with free `i₀Π_{Q̃}i₀`); Liu–Wang Corollary 3.4 p. 4 (d2b6f798… 198–205), Proposition 3.2 p. 3 (118) | the README's prime lists and degree ranges are the source's; nonvanishing for non-Dynkin is in degrees `≥ 3`. |
| S14 | 8.1: Huerfano–Khovanov (35) p. 9 (393), Proposition 7 p. 9 (395); Khovanov–Seidel §2d p. 11 (34e74708… 466), Corollary 1.2 p. 5 (204: faithful for all `m ≥ 1`) | matches. |
| S15 | 8.2: Seidel–Thomas Definition 2.2 p. 12 (819c173b… 510), Definition 2.5 p. 13 (554), Definition 2.9 p. 15 (609, `n > 0`), Theorem 2.17 p. 18 (768–771), Theorem 2.18 p. 19 (781–784, `n ≥ 2`) | matches, including the faithfulness restriction. |

Also checked: Liu–Wang Theorem 1.1 p. 1 (lines 19–21: finite tree, any field, bad primes), Definition 4.1 p. 5 (211–214: unital, `μ₁ = 0`, `μ₂ = μ`, equivalence is `A∞`-isomorphism), Theorem 4.2 p. 5 (217–218), Proposition 4.4 p. 5 (248), §4.4 pp. 5–6 (261), Example 4.7 p. 6 (289); Etgü–Lekili Corollary 25 p. 40 (1378–1382: right module `k = G_Γ/(G_Γ)_{>0}`, gradings coincide and match path length).

**Adversarial values.** `C = 2I − A` where a Cartan matrix is meant, `C = A` in the Hilbert recursion; centre first where a centre exists. Graded dimensions, Hilbert matrices and cyclic quotients were computed by my own linear algebra on doubled paths (ideal spanned by `p ρ_v q`, commutator space spanned by `pq − qp`), over `ℚ`, `𝔽₂`, `𝔽₃`, `𝔽₅`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `affine_graph_recognition`, both directions | every labelled connected simple graph on 1–6 vertices, exact rational kernel of `2I − A` | 27 476 graphs; a one-dimensional kernel with a strictly signed generator for 0, 0, 1, 3, 17, 150 graphs at `n = 1..6`; the list (cycles, `D̃₄`, `D̃₅`) counts 0, 0, 1, 3, 17, 150; kernel of dimension `≥ 2` never; mismatches 0 | iff holds on the sample; `t` unique by vertex count and shape |
| Same, degenerate | one vertex; one edge | `0 = 2a` forces `a = 0`; `a₁ = 2a₀`, `a₀ = 2a₁` force `a = 0`; right side: `A 0` not valid, `A 1` not graphical | both sides false |
| Reflection and stuckness | `A₂` at `(1,0)`; triangle at `(1,1,1)`; `D₄` at `(2,1,1,1)`; `D̃₄` at `(2,1,1,1,1)` | `(s₀a)₀ = −1`, `(s₁a)₁ = 1`, `Ca = (2,−1)`; all reflected values `1`, `Ca = 0`; `Ca = (4−3, 0,0,0) = (1,0,0,0)`, `aᵀCa = 2`; `Ca = (4−4,0,0,0,0) = 0` | the four Checks are right |
| Arm equation | arms `a ≤ b ≤ c` | `Σ 1/(a+1) = 1`: `a = 1` gives `(b,c) ∈ {(2,5),(3,3)}`, `a = 2` gives `(2,2)`, `a ≥ 3` gives sum `≤ 3/4`; `(1,2,4)`: `31/30` | complete list `(2,2,2), (1,3,3), (1,2,5)` |
| `Ẽ₈` marks | `T_{2,3,6}` | centre `6`; arms `3`; `4,2`; `5,4,3,2,1`; `3 + 4 + 5 = 12 = 2·6`; `gcd = 1` | agrees with native `marks E8` |
| Paths | path on `n` vertices | `a_j = j a₁`, endpoint forces `(n−1)a₁ = 2n a₁`, so `a = 0` | no positive additive function |
| Proper extension | four-leaf star plus a pendant at a leaf | pairing with `δ = (2,1,1,1,1)`: `Σ δ_v (C_H a)_v = −a_e ≥ 0` forces `a_e = 0`, then zero propagation | `a = 0` |
| `preprojectiveHilbertMatrix_recursion`, triangle | `C = J − I` | dims `3, 6, 9, 12, 15, 18`; `H₂ = J` (all entries `1`), `H₃ = J + I`, `H₄ = 2J − I`, `H₅ = 2J`; row sums `1..6`; the wrong recursion `H_{d+2} = CH_{d+1} + H_d` gives `1, 2, 5, 12` | Check correct; cyclic normal form count `d + 1` matches |
| Same, `D̃₄` | four-leaf star | dims `5, 8, 15, 16, 25`; `H₂` centre entry `3`, leaf–leaf `1` off the diagonal, `0` on it; recursion: `C² − I` has total `15`, `C³ − 2C = 2C` total `16`, `C² + I` total `25` | Check correct |
| Same, Dynkin controls | `D₄`; `A₂`; one vertex | `D₄`: dims `4, 6, 8, 6, 4, 0, 0`, `H₂` centre `2`, `H₄ = I`, `H₅ = 0`; recursion holds for `d ≤ 3`, at `d = 4` reads `I = 0`; `A₂`: `H₂ = 0`, `d = 1` reads `C = 0`; one vertex: `H₂ + H₀ = I ≠ 0` | hypothesis necessary and present |
| Koszul transpose Check | `A₂` quiver `1 → 2` | `(I + tE₂₁)(I − tE₂₁) = I`; without transpose degree-one term `E₂₁ − E₁₂` | pins the transpose |
| Signless degree-two count | triangle | `12` doubled paths of length two, `3` vertex relations on disjoint supports, dimension `9 = ` total of `J` | Check correct |
| `preprojective_cyclicQuotient_vanishes_iff` | `D₄` degree 4 over `ℚ, 𝔽₂, 𝔽₃`; `D̃₄` degree 4; `E₆` degree 6 over `𝔽₃, 𝔽₅`; `A₂`; triangle | `0, 1, 0`; `2` over `ℚ`, `3` over `𝔽₂`; `1, 0` (and `0` in degree 4 over `𝔽₃`); `A₂`: `0` in all degrees; triangle: `1, 2, 1, 2` in degrees `2..5` | reproduces Schedler's table and the three Checks; non-Dynkin nonzero in degree `≥ 3` |
| Same, hypotheses | `A₁ ⊔ A₁`; `D_n` in characteristic 2 | left true, right false without connectedness; `D₄`: degree-4 class nonzero, right side false by `IsBadPrime (D 4) 2` | connectedness and the bad-prime clause both needed |
| Threshold `d ≥ 3` | torsion degrees of Schedler's table | `D_n`: `4`; `E₆`: `4, 6`; `E₇`: `4..16`; `E₈`: `4..28`; all `≥ 3`; Liu–Wang's `HH^{2,q}`, `q > 0`, is degree `q + 2 ≥ 3` | the two-degree offset is handled |
| `IsBadPrime` | `(D 4, 2)`, `(A 2, 2)`, `(E6, 3)`, `(E6, 5)`, `(E8, 5)`, `(t, 0)`, `(t, 7)` | true, false, true, false, true, false, false | matches the API bullets |
| `IsZigzagAInfinityDeformation`, wrong model | drop `strictUnit` on `A₁` | `m₄(1,1,1,x)` has degree `0`, allowed; with the field it is `0` | the Check's negative control holds |
| `A₁` intrinsically formal | `m_n(x,…,x)` | degree `2n + 2 − n = n + 2 ∉ {0, 2}` for `n ≥ 3` | right side true for `A 1`, `IsBadPrime (A 1) p` false |
| `IsIntrinsicallyFormal` versus Liu–Wang | minimal `𝒜` with `m 2` the product | `cohomologyAInfinityAlgebra` has the product induced by `m 2` on `Cohomology = A`; `isQuasiIso_iff_isIso` makes `IsFormal` an `A∞`-isomorphism with the strict algebra | matches Definition 4.1 |
| `D̃₄` loop deformation | `m₄` on four arrows | degree `2 − 4 = −2`, inputs of total degree `4`, output degree `2` (a volume); Adams degree `n − 2 = 2` | Check correct |
| Twists on `K₀` | two `2`-spherical objects, `χ(E_i,E_i) = 2`, `χ(E₁,E₂) = −1` | `A = [[−1,1],[0,1]]`, `B = [[1,0],[1,−1]]`, `AB = [[0,−1],[1,−1]]`, `ABA = [[0,−1],[−1,0]] = BAB`; `det A = det B = −1` | Check and `A₂` Example correct |
| McKay convention | `C₄`, `C₂`, `1` | `16 = 8 + 8`; `8 ≠ 6`; `4 ≠ 2` | boundaries as stated |
| Worked examples | `D₄`, `E₈`, `Ẽ₈` zigzag | `2·4 + 2·3 = 14`, `2·8 + 2·7 = 30`, `2·9 + 2·8 = 34`; centres `5, 9, 10` | correct |
| Graded Cartan determinant | `A₂` | `(1 + q²)² − q² = 1 + q² + q⁴`, value `3` at `q = −1` | Example correct |
| Layer 6 Examples | `A₁`, `A₂` | `Π₂(A₁) = k⟨t⟩`, `d = 0`, `H^{−n} = k tⁿ`; `A₂`: `H⁰` of dimension `2 + 2 = 4`, degree-zero part the infinite doubled path algebra | correct |

## Not verifiable

- The worker's seeded sample gave the fifteen target headings; locators within them are mine.
- No `sources.toml` existed for this roadmap; the sources service created `packages/ZigzagPreprojective/sources.toml` on the board with the three entries `grant`, `mazorchuk`, `crawleyboevey` when I fetched those texts (the brief's fetch command records). The other sources remain identified by cache hash only.
- Brenner–Butler–King, Theorem 4.8 (R03, option b) and the Ringel and Crawley-Boevey identification theorems were not read: they are not cited directly by the README and are not in the cache; their statements are known to me only through Grant pp. 6–7.
- Ownership against open pull requests was checked through `roadmaps grep` over the 449 indexed pull requests and the sibling checkouts; `McKaySkewGroup` was read at its open head, which is the only other open roadmap mentioning zigzag or preprojective algebras.
- The claim that every homologically unital minimal `A∞` structure over a field is isomorphic to a strictly unital one (`README.md:1050–1052`) is a standard fact cited without locator; it is not a target.

## Source issues

- none
