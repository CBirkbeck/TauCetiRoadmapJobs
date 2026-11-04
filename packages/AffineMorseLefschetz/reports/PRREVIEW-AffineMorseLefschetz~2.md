# Review of AffineMorseLefschetz (pull request #1764 at f332df5)

**Verdict:** needs changes

Full re-review of the repaired head (1230 changed lines since 0561aef). The previous review's eight findings were checked one by one first; the whole folder was then reviewed again. One blocking finding (an unowned prerequisite that the previous review's R02 class did not cover) and six P3 notes. No file of the pull request was changed; the diff outside `TauCetiRoadmap/AffineMorseLefschetz` is empty.

## Status of the previous review's findings

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 reciprocal RealAnalyticGeometry supply | README.md:35–39 "Layer 5 owns the continuous band-closure, endpoint/restriction and collapsed-band transfer … No input to this lift comes from that consumer." RealAnalyticGeometry is cited nowhere as a supplier; §5.5 builds the band map and an endpoint-only pulling triangulation. | Repaired on this side. RealAnalyticGeometry on main still claims the reverse (see R07). |
| R02 nonexistent GeometricTopology exports | §2.2 (README.md:444–490) owns the Euclidean distance/normal-endpoint calculation on `TauCeti.addHaar_image_eq_zero_of_not_surjective_fderivWithin` and DifferentialGeometry §10.2; §4.2 (README.md:688–717) owns the exhaustion-adapted refinement with the quantified containment "every closed simplex meeting K_r lies in int K_(r+1)". | Repaired. The same class recurs once for corner rounding: R01 below. |
| R03 build gate | Suggested.lean:1–5 `module` / `public import Mathlib` / two `TauCeti.*` modules. Worker gate: every check 0, build 0. `lake env lean` on the file: exactly six `declaration uses 'sorry'` warnings. | Repaired. |
| R04 closed-embedding headline | Suggested.lean:81 `closed_holomorphic_embedding_cw_bound`, :110 `q_positive_exhaustion_cw_bound`, :129 `finite_semialgebraic_triangulation`; the module docstring (:17–32) names the missing carrier of each remaining headline. | Repaired. |
| R05 commit-pinned links | README.md:123–150 cite roadmaps by relative path and section; gate blob=0. | Repaired. |
| R06 scaffolding in the acceptance file | The projective carrier definitions and the two proved helpers are gone; the two kept definitions (`realHessian`, `leviDiagonal`, `qPositiveLeviInCharts`) occur in headline types. | Repaired. |
| R07 shape | Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 with `*Needs:*`, `**Checks.**`, Examples and Dependencies. Every definition has at least three Checks (counted: 0.1:4, 0.2:3, 0.3:3, 0.4:3, 1.1:4, 1.2:4, 2.1:3, 2.2:3, 2.3:4, 3.1:3+4, 4.1:4, 4.2:3, 4.3:3, 4.4:4, 4.5:3, 5.1:4, 5.2:3, 5.3:3+3, 5.4:4, 5.5:3+3, 5.6:3, 5.7:3, 6.1:3, 6.2:3, 7.1:3). | Repaired. |
| R08 locators | Claim-level locators into Milnor and Hatcher with printed pages; Bochnak–Coste–Roy flagged "locator-only" at README.md:1440. | Repaired, with one page slip (R02 below). |

## R01 (P1) — Corner rounding of the collar cuts has no owner

**Location:** `TauCetiRoadmap/AffineMorseLefschetz/README.md:132` "give collars, tubular normal bundles, gluing/rounding of corner faces" and `:840` "round their collar corners by GT's relative rounding, retaining the actual compact boundary pairs".

**Claim:** §4.5 intersects the product-like compact sublevels with M and then rounds the resulting corner (the edge where the collar face ∂₀K meets the regular cut ∂₁K) so that each piece is a smooth manifold with boundary whose boundary is split along a codimension-two edge, as AlgebraicTopology 6.4's `compactTriadPoincareLefschetz` requires ("K carries an actual Mathlib manifold-with-boundary structure", AlgebraicTopology README.md:1522). The README attributes the rounding to GeometricTopology Layer 1.

**Witness:** `TauCetiRoadmap/GeometricTopology/README.md:177–287` (Layer 1 on main) states collars (:205), gluing along boundary pieces that *produces* corners (:210–212, :278), and tubular neighbourhoods (:218); a search of the whole GeometricTopology README for "round", "straighten" or "smoothing corners" finds nothing. AlgebraicTopology does not own it either: its 6.4 statement says "common codimension-two edge (rounded from the GT corner model)" (AlgebraicTopology README.md:1536). The only roadmaps carrying a rounding construction are the open revision of GeometricTopology and HomotopySpheres/TangentialBordism, none of which this roadmap may cite (a revision pull request is never a dependency; the other two are later or unrelated). So the step is written as supplied and no supplier states it.

**Repair:** Own it in §4.5, where it is used, as a target with hypotheses: for the rectified exhaustion that is product-like on the collar ∂M×[0,ε), a regular cut K = M ∩ {ρ̃ ≤ c} is a manifold with corners whose corner locus is (∂M ∩ {ρ̃ = c}) × {0}; construct a smooth manifold with boundary K' and a homeomorphism K → K' that is a diffeomorphism off the edge, is the identity outside a neighbourhood of the edge, and sends ∂₀K and ∂₁K to the two closed faces of a splitting of ∂K' along a codimension-two submanifold with the collars AlgebraicTopology 6.4 asks for. The standard construction is "straightening the angle" (Conner and Floyd, Differentiable Periodic Maps, 1964, Chapter I; Douady, "Arrondissement des angles", Séminaire Henri Cartan 14, 1961/62, exposé 3, on Numdam); cite one of these at the claim. Then correct the supplier line :132 (GeometricTopology Layer 1 gives collars, gluing and tubular neighbourhoods; rounding is a Layer 4 target) and :840. Test on M = closed half-plane {s ≥ 0} with ρ̃ = s² + t²: K is the half-disc with two corners at (0, ±√c); the rounded K' is a disc with ∂₀K' the diameter and ∂₁K' the arc, and the four formulas give H⁰(K') = ℤ = H₂(K', ∂K'), H⁰(K', ∂₀K') = 0 = H₂(K', ∂₁K'), as the triad theorem predicts.

## R02 (P3) — Hatcher Theorem 3.35 is on printed page 245

**Location:** `README.md:1434` "Theorem 3.35, p. 246 (compact-support duality)".

**Witness:** hatcher bebb3032 line 10637 (the theorem statement) lies under the marker for page 254; this extraction's marker page is printed page + 9 (page marker 248 carries the running head "Section 3.3 239", line 10362), so the statement is on printed page 245; page 246 begins with Lemma 3.36 (line 10649).

**Repair:** write "Theorem 3.35, p. 245".

## R03 (P3) — Milnor 6.3 is a Lemma

**Location:** `README.md:450` "Corollary 6.2, Assertions 6.3–6.4, Lemma 6.5 and Theorem 6.6, pp. 32–36".

**Witness:** milnor 65731a25 lines 5875–5876 read "LEMMA 6.3" (the focal points along a normal line); only 6.4 is an Assertion (lines 6051–6052).

**Repair:** "Corollary 6.2, Lemma 6.3, Assertion 6.4, Lemma 6.5 and Theorem 6.6, pp. 33–36" (Corollary 6.2 is on p. 33, Lemma 6.3 on p. 34, Assertion 6.4 on p. 35, Lemma 6.5 and Theorem 6.6 on p. 36).

## R04 (P3) — O(d) is ComplexKahlerGeometry K7.2, not K7.1

**Location:** `README.md:123–125` "[K1, K3, K7.1] give … projective charts on the native quotient, with complex orientation and O(d)" and `:1402–1403` "ComplexKahlerGeometry K7.1 projective and O(d) charts".

**Witness:** `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407` K7.1 is "Projective charts and orientation"; the tautological O(−1), its dual powers O(k) and the identification of H⁰(O(k)) with degree-k forms are K7.2 (:1445–1452).

**Repair:** cite K7.2 for O(d) and the pullback of O(1) in §7.1 and in the supplier contract; keep K7.1 for the charts and orientation.

## R05 (P3) — Build order inside Layer 5

**Location:** `README.md:1054–1056` "*Needs:* §5.3 bounded sections … and the rational extension of §5.4"; `:1143` "*Needs:* Layer 5.4 completed face lists"; `:927–928` "The triangulation uses §§5.2–5.6 below".

**Claim:** The completed-list recursion (second half of §5.3) consumes the rational-extension lemma stated after it in §5.4; §5.5's first Needs line attributes the completed face lists to §5.4, but they are built in §5.3; the headline of §5.1 needs every later subsection. None of these is a logical cycle (§5.4 is a stand-alone lemma on supplied boundary data, as its Needs line says), but each is a target that needs a later one.

**Repair:** place the rational-extension lemma before the completed-list recursion (for instance: 5.3 root extension, 5.4 rational extension, 5.5 completed face lists, 5.6 band transfer and pulling, 5.7 projection, 5.8 projective pairs), and point §5.5's Needs at the completed-list subsection. State the §5.1 headline with "proved from §§5.2–5.6" kept, which is already how it reads.

## R06 (P3) — Notation slips

**Location:** `README.md:774` "`d^k=(−1)^(k+1)∂`"; `:87` "A factor 1/2 would give 2 instead of 1"; the abbreviations "Four's" (:278, :620, :858), "AT", "GT", "CC" (passim).

**Claim:** In :774 the reindexed *cochain* differential is written with ∂, the symbol used for the chain boundary two lines earlier; the identity meant is d^k = (−1)^(k+1) δ, which the Check at :802–803 computes correctly (for k = 0: ∂(z⌢φ) = −z⌢δφ). In :87 the wrong model intended is "dividing the paired sum by 2 instead of 4" (which gives 2); "a factor 1/2" on the Hessian would give 1/2. "Four" is not a roadmap name.

**Repair:** write δ at :774; say "dividing by 2 instead of 4" at :87; write FourManifolds, and expand AT/GT/CC once at first use (or use the roadmap names).

## R07 (P3) — Consumers that still cite the old ownership

**Location:** `TauCetiRoadmap/RealAnalyticGeometry/README.md:185–186` "the single subdivision supplier for A4.1's finite lifting", `:188–192` "A4.1 consumes these same helpers", `:527–529`; `:28` links the old anchor `#a4-compact-algebraic-pairs-triangulation-and-complement-duality`. StringOrientation (open pull request) cites A0 "`complexProjectiveZeroLocus`" at its README.md:229, :1147, :1216.

**Claim:** After this head, RealAnalyticGeometry on main and this roadmap each say they own the band helpers and the subdivision of the completed bands; RealAnalyticGeometry's lemma cones to an interior point, which §5.5 here explicitly rejects ("no interior lifted vertex is added"). The direction of supply is right on this side (RealAnalyticGeometry consumes A4.1 at its line 28, so it is the later roadmap), and a roadmap revision cannot edit another folder. StringOrientation names a Lean declaration that the previous review had deleted from `Suggested.lean`.

**Repair:** nothing in this folder beyond keeping the Scope sentence at :35–39. Record for the RealAnalyticGeometry revision: drop the "single subdivision supplier" and "A4.1 consumes these helpers" sentences, consume §5.5's band maps and pulling triangulation, and repoint the anchor to "Layer 5 (A4.1)". Record for StringOrientation: cite "A0 projective zero locus" in prose.

## Verified sound

**Gate and build.** The worker's gate at this head reports every check 0 including build=0; my rerun of the plain gate (no build) reports the same zeros and OK. `lake env lean TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean` elaborates in 5 s with exactly the six `declaration uses 'sorry'` warnings at lines 55, 63, 69, 81, 110, 129 and nothing else. The manifest pins (mathlib f6090c70, TauCeti 358314d4) match the checked-out packages. No `set_option`, no sorried data, no `lemma`, no `#eval`, no process words (gate forbidden=0, round-labels=0).

**Dependency check** (`gate --depcheck … --movable`) printed exactly

```text
depcheck: 205 roadmaps, 1657 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap and all nine suppliers it names are on main (the merge order lists only FourManifolds and AlgebraicTopologyPartII among the roadmaps involved, both consumers).

**Signatures.** `#check @name` for all nine declarations on a scratch copy gives the types recorded in the worker's signature list; no section binder is lost (both definitions are stated without finite dimension, as the README says at :314; the three index bounds carry `[FiniteDimensional ℂ V]`; the two manifold theorems carry `T2Space`, `SecondCountableTopology`, `IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ M` explicitly, matching Conventions :45). README generality equals the Lean generality in every case I compared (§1.1 ↔ lines 55–74; §2.3 ↔ 81–91; §3.1 ↔ 97–121; §5.1 ↔ 129–143). The hypotheses `hq : q ≤ n` in `morseIndex_le_complex_finrank_add` and `q_positive_exhaustion_cw_bound` are not needed for truth (for q > n the natural subtraction gives n − q = 0 and the conclusions index ≤ n + q, cells ≤ n + q are then weaker than the trivial bound 2n); they match the README's 0 ≤ q ≤ n and are a note, not a finding.

**Padding probe.** Each of the six sorried theorems was tried with `first | rfl | simp | infer_instance` on the scratch copy; all six fail (type-class or unsolved goals), so nothing closes in one tactic. By reading: none restates a definition, mirrors a Check or computes a value. The two definitions have real bodies on native carriers (`fderiv`, `extChartAt`, `Submodule ℂ`); `qPositiveLeviInCharts` is a predicate that a headline needs, not a free `Prop`.

**Headline inventory.**

| README headline | Suggested.lean |
| --- | --- |
| A1 negative-subspace, strict and q-positive index bounds (§1.1–1.2) | Stated, lines 55–74. |
| A2 closed holomorphic embedding CW bound (§2.3) | Stated, line 81, on `Manifold.IsImmersion`, `Topology.IsClosedEmbedding`, `Topology.CWComplex`, `ContinuousMap.HomotopyEquiv`. |
| A3 q-positive proper exhaustion CW bound (§3.1) | Stated, line 110, with the chart predicate at 97. |
| A4.0 four noncompact dualities, compact-pair comparison | Not statable: neither pinned library has locally finite chains or Borel–Moore homology (grep of `TauCeti/` for Borel–Moore and "locally finite chain": nothing; Mathlib has `AlgebraicTopology/SingularHomology` but no locally finite variant). Docstring :19–21 says so. |
| A4.1 finite marked-family triangulation (§5.1) | Stated, line 129, on `Geometry.SimplicialComplex`, `intrinsicInterior`, `TauCeti.IsSemialgebraic`. The refined lift and complement duality are not statable (docstring :22–26). |
| A5 homological and relative-homotopy weak Lefschetz | Not statable: no `TopologicalSpace (Projectivization ℂ V)` instance at the pin (grep of `Mathlib/` for such an instance: nothing), so the pair has no topology. Docstring :27–29. |
| A6 Veronese transport | Not statable for the same reason. Docstring :30–31. |
| A0 proper incidence and full-rank submersion | Not statable (needs K7.1's charts). Docstring :17–18. |

**Pinned declarations opened** (file and line at the pins):

- `TauCeti/Analysis/Calculus/Morse/Index.lean:76` `hessianQuadraticForm f x` with `:81–82` `hessianQuadraticForm f x v = fderiv ℝ (fderiv ℝ f) x v v`, and `:148–149` `morseIndex f x = sigNeg (hessianQuadraticForm f x)`. So the Lean `realHessian f x v v` is literally the Tau Ceti quadratic form, and no criticality or smoothness is assumed, as README :111–114 says.
- `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:98` `sigNeg Q = sigPos (−Q)`, documented as the maximal finrank of a negative-definite subspace; this is exactly the quantity the J-intersection argument bounds.
- `TauCeti/Analysis/Calculus/Sard/EqualDimension.lean:65–68` `addHaar_image_eq_zero_of_not_surjective_fderivWithin`: equal finrank, `HasFDerivWithinAt` on `s`, nowhere-surjective derivative, conclusion `ν (f '' s) = 0`; the header (:18–30) states it for two possibly different finite-dimensional real normed spaces with an additive Haar measure. §2.2's use (C¹ endpoint map, equal dimensions, countably many normal charts) matches.
- `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68–71` `IsSemialgebraic` is membership in the set algebra generated by polynomial zero and positivity sets over any `σ → R`; compactness and the coordinate dimension are separate hypotheses, as README :119–122 says.
- `Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean:59–63` `Geometry.SimplicialComplex` (affine-independent faces, intersection in the convex hull of the common face), `:73` `empty_notMem`, `:77` `space`; `Mathlib/Analysis/Convex/Intrinsic.lean:61` `intrinsicInterior`. The Lean statement's "membership constant on `intrinsicInterior (convexHull s)`" is the open-simplex formulation of Bochnak–Coste–Roy 9.2.1.
- `Mathlib/Algebra/Homology/Embedding/Basic.lean:257–258` `embeddingUpIntLE p` has degree map `n ↦ p − n`, as §4.4 uses.
- `Mathlib/Geometry/Manifold/Immersion.lean:173–192` `IsImmersionAt` is the chart normal form `u ↦ (u, 0)` with a chosen complement; `Mathlib/Topology/Maps/Proper/Basic.lean:77` `IsProperMap` extends `Continuous`; `Mathlib/Topology/CWComplex/Classical/Basic.lean:167/183` dimension-indexed `cell`.

**Cross-roadmap citations resolved on main** (content at 929496d4):

| Citation | Where found | Agreement |
| --- | --- | --- |
| MorseTheory M1–M4 | MorseTheory/README.md:90, :124, :430, :458 | M1 critical Hessian and C² persistence (:90–123); M2 proper bounded-below relative CW models (:402–420); M3 strong C^k topology, Morse approximation, global C⁰ error < 1, relative approximation fixing a neighbourhood of a closed set (:430–452); M4 top cellular homology free for arbitrary rank, cohomology above d vanishes by AT 6.1 UCT, "do not infer degree-d cohomology torsion-free" (:474–480). Matches §3.1 :571–574 exactly. |
| ComplexKahlerGeometry K1, K3, K7.1 | :96, :296, :1407 | K7.1 carrier `Projectivization ℂ (Fin (n+1) → ℂ)`, charts by `Fin.succAbove` ratios, T2/compact/second-countable, complex orientation (:1407–1442): matches §0.1's transport through Fin N ≃ Fin ((N−1)+1). O(k) is K7.2 (R04). |
| GeometricTopology Layer 1, Layer 11, comparison step 1 | :177, :831, :930–939 | Collars, gluing, tubular neighbourhoods; realization, links, subdivision, combinatorial manifolds; smooth triangulation (Whitehead, far-horizon step 1). Rounding is absent (R01). |
| RiemannianGeometry R5a, R6 | :1044, :1221 | R6 focal points, `det(I − tS_v)`, focal times 1/κ_i, index by focal multiplicities "(Milnor Lemma 6.5)" (:1263–1269); the sign agrees with §2.1's Checks. |
| AlgebraicTopology Stages 2–4, 6.0–6.4, 8 | :326, :471, :499, :946 (6.0 Milnor/lim¹ :952–992, 6.3 local systems and cap :170–176, :385, 6.4 duality :1515–1557), :1602; `BasedTopPair` :183, :1609; `compactTriadPoincareLefschetz` :1534 | Cap pinned to Hatcher's front/back faces with `∂(c⌢φ)=(−1)^k(∂c⌢φ−c⌢δφ)` (:173–176); local coefficient at the first vertex (:385); duality twist `L⊗_ℤ or_M` with R acting on L (:1518–1520); the zigzag `(K,∂K)→(U,U∖int K)←(U,U∖K)` (:1524); the triad theorem states "AffineA4.0 consumes this single compact triad theorem in its collar exhaustion" (:1553). All match §§4.3–4.5. |
| DifferentialGeometry §10.2 | :884–885 | `IsNullSet` through charts, `isNullSet_image_criticalPoints`, `dense_isRegularValue`. |
| CharacteristicClasses C1.2a S0–S5 | :331–400 | Supported cochain complex, enlargement, cofinality, proper pullback, jointly proper homotopy, support excision for a closed pair with controlled collar data. |
| RealAlgebraicGeometry Layers 3–6 (Completed) | :298, :341, :374, :437; coordinate convention :94 | Distinguished coordinate 0 with `Fin.cons t x` matches §5.3's `Equiv.swap 0 (Fin.last n)` adapter; Layer 4 root continuity under fixed degree and gcd degree (:367–371). |
| RealAnalyticGeometry (consumer) | :28, :185–194, :456–530 | Consumes A4.1's parametrized lifting data; stale reverse claims (R07). |
| AlgebraicTopologyPartII, FourManifolds, StringOrientation, TangentialBordism, ComplexComparisonPartII, FormalConnectionsOpers, StratifiedSpacesAndTameTopology (open consumers) | grep of the open heads | They cite A0, A2–A3, A4, A4.0, A4.1, A5–A6; every one of these labels survives as a heading identifier (README :15). StringOrientation's Lean name is R07. |

**Ownership.** Borel–Moore homology with local coefficients: on main only AlgebraicTopology (compact triads) and this roadmap mention it; the open hits (CompletedCohomologyPartII, CompletedCohomologyAndLocalGlobalCompatibility) are the Borel–Serre relative homology of locally symmetric spaces, a different object. Semialgebraic triangulation: StratifiedSpacesAndTameTopology and AlgebraicTopologyPartII consume A4.1; nobody builds it. Veronese: the hits on main and in open pull requests are scheme-level (Proj, Gröbner, étale), not the classical chart comparison. Levi forms: ComplexKahlerGeometry has only the Fubini–Study `∂∂̄` convention (K1 :59, :88), no Levi form or plurisubharmonicity target. The q-pseudoconvex exhaustion occurs nowhere else. Ownership against open pull requests whose files the brief does not give was checked only through the index grep.

**Sources at their locators.**

- milnor 65731a25 (Ranicki copy, two printed pages per marker page; §6 lines 5359–6606, §7 lines 6607–7215). Corollary 6.2 line 5571 (p. 33: almost every point is not focal), Lemma 6.3 line 5875 (p. 34), Assertion 6.4 line 6051 (p. 35: focal iff `g_ij − t v·ℓ_ij` singular, nullity = multiplicity), Lemma 6.5 line 6170 and Theorem 6.6 line 6203 (p. 36: degenerate critical point of L_p iff p focal; L_p Morse for almost all p), Lemma 6.9 line 6524 (p. 37–38, index = number of focal points on the segment). Theorem 7.1 line 6628 and Theorem 7.2 line 6651 (p. 39: closed bianalytically embedded complex k-manifold has the homotopy type of a k-dimensional CW complex), Assertion 1 line 6710 (p. 39–40: eigenvalues of the real part of a complex quadratic form come in ± pairs), proof completed line 7095 (p. 41), Corollary 7.3 line 7098 (p. 41: isomorphisms below k−1, onto at k−1; its proof uses Lefschetz duality `H_r(V,V∩P) ≅ H^{2k−r}(V∖(V∩P))` and 7.2), Theorem 7.4 line 7199 (pp. 41–42, π_r(V,V∩P)=0 for r<k; the proof starts from the hypothesis that a neighbourhood of V∩P deforms into it, line 7215 ff, as §5.7 :1254 says, uses f = 1/L_p with index ≥ 2k−k, and cellular pushing of an r-cube for r<k). Every Milnor locator in the README (§1.1 :359, §2.1 :442, §2.2 :450–451, :473, §2.3 :497, §3.1 :599, §5.7 :1254, §6.1 :1279, §6.2 :1306, References :1427–1430) is supported as written, with the Lemma/Assertion slip of R03.
- hatcher bebb3032 (marker = printed + 9). §3.3 begins line 10131 (p. 233); cap product definition lines 10391–10396 (p. 239) with the boundary formula line 10400 (p. 240) `∂(σ⌢φ)=(−1)^ℓ(∂σ⌢φ−σ⌢δφ)`; Theorem 3.35 line 10637 (p. 245, R02); Theorem 3.43 lines 10976–10982 (p. 254: compact R-orientable n-manifold, ∂M = A ∪ B with ∂A=∂B=A∩B, cap with [M] gives H^k(M,A)≅H_{n−k}(M,B); "A, B or A∩B may be empty"). The README's use (:773, :809, :824, :1434–1435) matches: constant coefficients and compactness are Hatcher's; the local-system noncompact extension is this roadmap's derivation.

**Adversarial pass.** One row per statement checked; values computed on both sides. "Retain" means no defect on that instance.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Levi normalisation, Conventions :49–54 | f=x²+y², v=1 | D²f(v,v)+D²f(Jv,Jv)=2+2; /4 = 1 = ∂²f/∂z∂z̄ | Retain; /2 would give 2 (R06 wording) |
| Hessian intrinsic only at critical points, :57–58 | f=Re z, chart z=w+w² at 0 | Hessians 0 and diag(2,−2); Levi 0 and 0 | Retain |
| Integer-degree duality, :90–91 | U=ℝ, j=2 | H₂^BM=0, H^{−1}=0; truncated H⁰=ℤ | Retain |
| §0.1 zero locus carrier | N=0; N=1 no equations; p=0, p=1 on ℂP¹ | ∅; one point; whole space, ∅ | Retain |
| §0.1 homogeneity | X₀−1 at (1,0),(2,0) | 0 and 1 | Non-homogeneous equation excluded |
| §0.1 reduced-set invariance | X₀, X₀² at (0,1) | same locus {[0:1]}; Jacobian rows (1,0),(0,0) | Retain (rank not invariant) |
| §0.2 coefficient space | N=2,d=2 | basis X₀²,X₀X₁,X₁²: 3 | Retain |
| §0.3 incidence fibres | degree-0 parameter c on ℂP¹ | fibre ℂP¹ (c=0), ∅ (c≠0); proper, not surjective | Retain |
| §0.4 Euler identity | p=X₀²+X₁², v=(1,i) | J=(2,2i); Jv=2+2i²=0=2p(v) | Retain |
| §0.4 full rank | X₀ on ℂP¹ at [0:1] | rank 1, dimension N−1−|ι| = 2−1−1 = 0; X₀² rank 0 | Retain |
| `finrank_negative_subspace_le_complex` (sampled headline) | B non-symmetric allowed; w∈W∩JW, w=Jw' | B(w,w)<0, B(w',w')<0 ⇒ B(w',w')+B(Jw',Jw')<0, contradicts Levi>0; so W∩JW=0 and 2 dim W ≤ 2n | True without symmetry (only diagonal values used) |
| Same, sharpness | Hessian diag(6,−2) on ℂ, W = y-axis | B(i,i)=−2, Levi (6−2)/4=1>0, dim W = 1 = n | Bound attained |
| `morseIndex_le_complex_finrank` | f=3x²−y² on ℂ; V=0 | Levi 1, sigNeg 1 ≤ 1; 0 ≤ 0 | Retain; `sigNeg` = max negative-definite finrank at the pin |
| `morseIndex_le_complex_finrank_add` | n=2,q=1, Hessian diag(6,−2,−2,−2) | Levi diag(1,−1); P = first axis (dim 1 ≥ 1); index 3 ≤ 3 | Retain |
| Same, proof route | general W negative, P positive complex | dim_ℝ(W∩P) ≤ dim_ℂ P (J-argument inside P); dim W ≤ dim(W∩P)+2n−2dim_ℂP ≤ 2n−dim_ℂP ≤ n+q | Route closes |
| Same, q=n boundary | f=−Σ|z|², P=0 | dim 0 ≥ 0; index 2n = n+q | Retain |
| Same, unused `hq` | q=n+1 | n−q=0, P=0 admissible; index ≤ 2n ≤ n+q | Note only |
| §1.1 pullback and product | f=|w|², w=z² at 1; f=g=|z|² | Levi(|z|⁴)=4=|2|²·1; L(fg)=4 vs L(f)g+fL(g)=2, cross terms 2 | Retain |
| §1.1 openness | f_ε=(1−ε)|z|² | ε=1/2: 1/2; ε=1: 0 | Strict positivity needed |
| §1.2 J pairing | A=diag(1,−1) | AJ=−JA; J(1,0)=(0,1) exchanges ±1 | Retain |
| §1.2 q-convention | |z₁|²−|z₂|² on ℂ² | Levi diag(1,−1): one positive direction, q=1 (n−q=1); fails q=0; index 2 ≤ 3 | Retain |
| §2.1 complex-bilinear form (sampled) | i(z)=(z,z²) at 0 | D²i(v,w)=(0,2vw): B(1,1)=2, B(i,i)=−2, B(1,i)=2i; B(Jv,Jw)=−B(v,w) | Retain |
| §2.1 shape operators | ν=(0,1), ν'=(0,i) | S_ν=diag(2,−2); S_{ν'}=[[0,2],[2,0]]=J S_ν; S_ν J=−J S_ν | Signs as displayed |
| §2.1 focal pairing | S_ν=diag(2,−2); flat plane | det(I−tS)=1−4t², t=±1/2; flat: no focal time | Retain |
| §2.2 distance Hessian (sampled) | graph, a=(0,c) | ρ_a=c²+(1−2c)x²+(1+2c)y²+(x²+y²)² (expanded: |z²−c|²=(x²+y²)²−2c(x²−y²)+c²); Hess diag(2−4c,2+4c), sum 4, Levi 1 | Retain |
| §2.2 identity Hess(v,v)+Hess(Jv,Jv)=4‖di v‖² | general holomorphic u | D²u(Jv,Jv)=i²D²u(v,v) cancels; 2‖Du v‖²+2‖Du Jv‖²=4‖Du v‖² — holds at every point, so Levi>0 everywhere | Retain |
| §2.2 degeneracy ↔ endpoint singularity | c=1/2 and c=1 | det Hess 0 at c=1/2, I−S eigenvalues 0,2; c=1: eigenvalues −2,6, index 1 | Retain |
| §2.2 properness | closed graph; ℂ*⊂ℂ | ρ₀≤2 ⇒ |z|≤1; 1/k has no limit in ℂ* | Closedness essential |
| `closed_holomorphic_embedding_cw_bound` (sampled headline) | ℂ, ℂ*(zw=1), (ℂ*)², n=0 discrete, empty M | models point / circle / torus / 0-cells / empty; max cell dims 0≤1,1≤1,2≤2,0≤0 | Retain; ℂ²∖0 (H₃=ℤ) shows closedness needed |
| §3.1 `qPositiveLeviInCharts` (sampled) | |z|², q=0; −|z|², q=0 and q=1; z=2w | P=ℂ, Levi 1; none / P=0; Levi 4, dim 1 | Retain; chart-target openness makes `fderiv` of `f∘chart.symm` honest at the image of x |
| `q_positive_exhaustion_cw_bound` | ℂ* with |z|²+|z|⁻², q=0 | Levi 1+|z|⁻⁴>0, proper, bounded below; circle model, cells ≤1 | Retain; condition is C²-open so M3's fine approximation preserves it |
| §3.1 compact submanifold bound | ℂP¹×ℂ with |z|², n=2,q=1; ℂ² with |z|², q=0 | restriction Levi ≤0 at a maximum vs. positive subspace of dim n−q: dim Z ≤ q; 1≤1, 0 | Retain |
| §3.1 cohomology warning | ℝP² | H₂=0 free, H²=ℤ/2 | Retain |
| §4.1 chain carrier | discrete ℕ | C₀^lf=∏ℤ ≠ ⊕ℤ; restriction to evens kills odd coordinates | Retain |
| §4.1 ray boundary | edges [k,k+1], k≥0 | ∂Σ = Σ([k+1]−[k]) = −[0]; H₀^BM(ℝ)=0 | Retain |
| §4.1 compact pair | ([0,1],{0,1}) | H₁ pair = ℤ = H₁^BM((0,1)); H₁((0,1))=0 | Retain |
| §4.1 zigzag | V⊂U open, L_s⊂V compact | excision needs L_s ⊂ int V: holds; towers degreewise surjective (quotients) | Route closes |
| §4.2 refinement (new) | ℝ, K_r=[−r−1,r+1], mesh 1/2; edge [−3,3] | interval meeting K_r ⊂ [−r−3/2,r+3/2] ⊂ (−r−2,r+2); [−3,3]⊄(−2,2) | Retain |
| §4.3 cancellation and twist (sampled) | edges [0,1],[1,2]; o↦−o | +[1]−[1]=0; (−o)⊗(−o)↦1 | Retain |
| §4.4 cap sign | k=0 on [v₀,v₁], values a,b | ∂(σ⌢φ)=a[v₁]−a[v₀]; ∂σ⌢φ−σ⌢δφ=(b[v₁]−a[v₀])−(b−a)[v₁]: equal | Hatcher sign reproduced; chain map needs d^k=(−1)^{k+1}δ |
| §4.4 ε_k | k=0..3 | ε=(1,−1,−1,1); ε_{k+1}/ε_k=(−1)^{k+1}: −1,+1,−1 | Retain; ε intertwines δ with (−1)^{k+1}δ |
| §4.4 embeddingUpIntLE | pin :258 | degree map n ↦ p−n | Retain |
| §4.4 cofinal shift | punctured plane, disc K_r in annulus K_{r+1} | H¹(K_{r+1})=ℤ→H¹(K_r)=0 not iso | Levelwise iso rightly not claimed |
| §4.5 four dualities (sampled) | [0,∞), m=1 | H⁰=ℤ=H₁^BM(M,∂M); H⁰(M,∂M)=0=H₁^BM(M) (ray has boundary −[0]); H_c¹=0=H₀(M,∂M); H_c¹(M,∂M)=H_c¹((0,∞))=ℤ=H₀(M) | Retain |
| §4.5 compact case | [0,1]; point with L; L=0 | H⁰=ℤ↔H₁(I,∂)=ℤ; L→L identity; all 0 | Retain |
| §4.5 corner rounding | half-plane, ρ̃=s²+t² | half-disc with two corners; no supplier states the rounding | R01 |
| §4.5 H₀^BM | ℝ vs discrete ℕ | 0 vs ∏ℤ (singletons compact) | "no compact component" is the right hypothesis |
| `finite_semialgebraic_triangulation` (sampled headline) | X=[0,1] marked (0,1),{0}; X=∅; mark {1/2} | edge interior and vertex are open simplices; empty complex (faces=∅ allowed: `empty_notMem` only forbids ∅ as a face); subdivision at 1/2 forced | Retain; ∃m is implied by BCR's m=n |
| §5.1 dimension | point, (0,1), ∅, closure | 0, 1, −∞, 1 | Retain |
| §5.2 shear (sampled) | y²+t, a=0,1; y and t−y, a=2 | t²-coefficient a²; 2 and −1 | Retain; a=±1 excluded for y²−t² |
| §5.2 density | finite family | ∏H_{p_i}(a,1) nonzero polynomial (H(y,1)≡0 would force H=0) | Retain |
| §5.3 root extension (sampled) | t²−x on (0,1); (x+y)t−x near (0,0) | √x → 0, specialisation t² ≠ 0; root x/(x+y) limits 1/2 (x=y), 2/3 (x=2y), specialisation 0 | Hypothesis excludes the failure |
| §5.3 limit argument | general | limit set ⊂ finite root set, connected (balls ∩ simplex interior connected) ⇒ one point | Route closes |
| §5.3 completed lists (sampled) | interval, gap [0,1] | I={x: 0<x≤1}∋1; auxiliary (1 at F_d, 0 at v_d) ≠ original b=(1,1); a=b on F_d ⇒ I=∅ | Retain |
| §5.3 restriction | heights 0,x,1 at x=0 | 0,0,1: nondecreasing, onto {0,1}, not injective | Retain |
| §5.3 facet rule coherence | F_i∋v_d, F_id | ρ(x)≠a|F_id ⇒ a<ρ(x)≤b on F_id so aux^{F_i}_{ρ(x)} defined; else value a: agrees at v_d and on F_id | Recursion well-founded (dimension) |
| §5.4 E_l (sampled) | λ=(1/2,1/2), r(v₀)=0, r(v₁)=1, α=1/2 | p₀ lands at v₁: numerator 1/8+1/2=5/8, denominator 1/4+1=5/4, E=1/2 | Retain |
| §5.4 vertex limit | λ=(1−2ε,ε,ε) | w₀=ε², w₁=w₂=(1−2ε)ε, w_*=(1−2ε)ε²; opposite fraction → 0 | Retain |
| §5.4 collapsed gap | [2,2+x], E∈[0,1] | height ∈[2,2+x] → 2 | Retain, no 0/0 |
| §5.4 a<b on E-facets | F_i∋v_d (i<d), F_d | F_i° ⊂ open cell of v_d where a<b; I≠∅ ⇒ a<b pointwise on F_d° (distinct sections, connectedness) | Route closes |
| §5.5 band map (new) | point base [0,2]→[1,5]; a=0,b=x,A=2,B=2+x² | 0,1,2↦1,3,5, inverse 3↦1; t=x/2↦2+x²/2→2 | Retain |
| §5.5 collapse condition | [0,1]→{0}; one-way implication | continuous surjection, no inverse; map continuous, not a homeomorphism | Both directions needed, as stated |
| §5.5 pulling (new) | unit square, least vertex (0,0) | triangles (0,0),(1,0),(1,1) and (0,0),(0,1),(1,1); common edge the diagonal; collapsed band = edge | Retain; restriction to faces is the pulling triangulation of the face |
| §5.6 projection (new) | graph edge (0,a)–(1,b); vertical edge; centre vertex (1/2,1/2) | (1−t)(0,a)+t(1,b)↦t both ways; vertical edge ↦ vertex 0; centre ↦ 1/2 ∉ base vertices | Endpoint-only rule needed |
| §5.7 projector model | [1:0]; rescale by 2 | diag(1,0); zz*/‖z‖² same with denominator 4 | Retain |
| §5.7 retraction | A={0}⊂[0,1] | (t,s)↦(1−s)t: fixes 0, ends at 0 | Retain |
| §5.7 complement duality | (S²,pt), n=1 | H₂ pair=ℤ=H⁰(ℝ²); H₁=0=H¹; ordinary H₂(ℝ²)=0 wrong | Retain |
| §6.1 component meets H | component X₀ ∩ H = ∅ | X₀ ⊂ U smooth compact of dim n≥1 in ℂᴺ: |z|² maximum has Levi ≤ 0 on a nonzero tangent, affine Levi > 0 | Contradiction; n ≥ 1 needed |
| §6.1 weak Lefschetz (sampled) | plane cubic, transverse line; (ℂP²,ℂP¹); U=∅; n=0 | H₀(A)=ℤ³→ℤ onto, kernel ℤ²; relative H_j=0 for j<2; all 0; range empty | Degrees as Milnor 7.3 |
| §6.1 Bertini by Sard | smooth X, dual family | tangent-hyperplane image has real dim 2(N−1) < 2N | Null set in every dual chart |
| §6.2 reversed function | ρ=|z|², z=0 | F=1−ρ+…, Hess F=−2I, index 2=2n−0; F→0 at ∞ | Retain |
| §6.2 cellular pushing | r<n, cells of dim ≥ n | r < n ≤ cell dimension so cellular approximation applies | Route closes |
| §7.1 Veronese (sampled) | d=2, [1:2]; x²+y²; d=1; d=0; ℂP⁰ | [1:2:4], 1·4−2²=0; y₀+y₂=0; identity, O(1); constant map, not an embedding; one point | Retain |
| §7.1 chart inverse | x_i≠0 | x_j/x_i = (x_i^{d−1}x_j)/(x_i^d) | Retain |

## Not verifiable

- **bcr**: Bochnak, Coste and Roy, Real Algebraic Geometry (1998), §9.1 Proposition 9.1.2, Theorem 9.1.4, §9.2 Theorem 9.2.1. The DOI resolves only to the paywalled Springer book; recorded as uncertified by the previous review and not reopened. A legal substitute for the triangulation statement (Coste, An Introduction to Semialgebraic Geometry, author page) timed out in the sources service. The README correctly calls these locator-only (:1440); the Lean statement is checked against the standard form of the theorem, not against the text.
- **hain**: Notes on the Morse theory of complex manifolds. The author-page URL returns HTTP 403 through the sources service (again). Listed in the scratch `needs-references.toml`.
- **mark**: Thomas Mark, Math240 lecture of 7 December 2001. No URL and no page numbers in the README; no legal text found. Listed in `needs-references.toml`.
- The full generality of §4.5 (arbitrary module-valued local systems, noncompact, collared boundary) and the whole recursive construction of §§5.3–5.6 are checked on the instances above and on their stated proof routes; they are not certified by a source, and the review does not claim to have proved them.

## Source issues

- none
