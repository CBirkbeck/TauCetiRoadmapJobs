# Review of GeometricTopology (pull request #1797 at 67b939d)

**Verdict:** needs changes

:robot: AI review of the folder `TauCetiRoadmap/GeometricTopology/` at this head. The pull request's own change to this folder is the deletion of the `references/` directory (27 quoted source extracts, 2,069 lines) and the removal of the 41 `[extract](references/…)` links from `README.md`, replacing them by the bibliographic locators; `Suggested.lean`, `metadata.toml` and every other line of the README are byte-identical to main's. That change repairs the stray-files finding of the previous review and introduces nothing new. The rest of the folder is main's text, which the previous review (pull request #1791 at fcad6f1) found defective in 23 places (its R09–R31) and which no repair has touched; those findings are re-checked below against the current pins and the cached sources and carried as R03–R25, with line numbers of this head. R01 and R02 are the two gate failures at this head.

## Previous findings (pull request #1791 at fcad6f1)

- R01, R02, R04, R05 (the SurfaceTopology and PlanarTopology citations at that head's lines 754, 884, 892): **not applicable** here. Those three lines were #1791's edits; this head is main's text, which contains no citation of either roadmap (grep for "Surface Topology", "Planar", "Radó" finds only "planar graphs" at line 427).
- R03 (build gate fails on the module-system warning): **not repaired**, now R01.
- R06 (residue at line 534): **not repaired**, now R02 (the line is 528 at this head).
- R07 (`references/` are stray files): **repaired**. The directory is deleted; my gate rerun reports `stray-files=0`; every former extract link now reads as a chapter, theorem or page locator (README 206–207, 218, 226, 373, 421–422, 501, 528–529, 648–652, 875–876, 979–1115).
- R08 (an edit outside the named folders): **not applicable**. The prescribed filtered three-dot diff for this pull request is empty.
- R09–R31 (defects of main's text): **not repaired**, carried as R03–R25. Every quoted passage is byte-identical at this head; each witness was recomputed this round and several are strengthened by declarations that now exist at the pinned Tau Ceti (R18, R19).

## R01 (P1) — The build gate fails on the module-system warning

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:1`: `import Mathlib`. **Claim:** the acceptance file passes the targeted build. **Witness:** the worker's gate at 67b939d records `build=1 FAIL` with the single warning that `Mathlib` is designed for the module system and the file should start with `module`. My `lake env lean` of a copy of the file elaborates with no message (the warning is Lake's, raised by the targeted `lake build`, not Lean's), so this is the gate's classification of the build, and the gate blocks acceptance while it fails. The sibling folders of this pull request were folded into one `Suggested.lean` each; this one was not touched. **Repair:** start the file with `module`, then `public import Mathlib`, and `public section` before any declaration, and rerun the targeted build until `build=0`; never suppress the warning with an option.

## R02 (P3) — The residue gate still fails

**Location:** `README.md:528`: "the layer-4-to-layer-5 handoff that lean-eval lacks". **Witness:** the worker's gate and my rerun both report `residue=1` at this line ("handoff" is a listed process word). **Repair:** replace the sentence by the mathematics: the knot exterior is the compact 3-manifold with one torus boundary component per link component, and Dehn filling glues a solid torus to each. Rerun the gate until `residue=0`. (The five other `lean-eval` mentions at lines 6, 291, 358, 407, 464 and 1143 are project narrative that the house style also excludes; fold them into R25.)

## R03 (P1) — The foliation headline reverses the cited theorem

**Location:** `README.md:802–805`: "the inequality `|⟨e(F), [S]⟩| ≤ −χ(S)` on every leaf-or-surface `S`, and a witness foliation violating it"; line 812: `gabai_yazdi : ∃ … Taut F ∧ ¬ EulerClassBounded F`. **Claim:** Gabai–Yazdi exhibit a taut foliation whose Euler class violates the bound. **Witness:** the bound quantified over every embedded surface is false for every foliation: a small sphere bounding a ball has `⟨e, [S]⟩ = 0` and `−χ = −2`, so `0 ≤ −2` fails; the correct inequality (Thurston's theorem, with the Thurston norm `x`) is `|⟨e(F), [S]⟩| ≤ x([S])`, which on the sphere reads `0 ≤ 0`. The source's Main Theorem (yazdi2016 lines 111–114) is the opposite shape: infinitely many closed hyperbolic 3-manifolds with an integral class of dual Thurston norm one, satisfying the parity condition, realised as the Euler class of *no* taut foliation; Gabai's theorem (lines 100–102) realises every vertex of the dual unit ball. Nothing in the roadmap defines the Thurston norm or "realised as an Euler class". **Repair:** define the Thurston norm on `H₂(M, ∂M)` and its dual norm, state Thurston's bound (`|⟨e(F), a⟩| ≤ x(a)` for every taut `F` and every class `a`) as one target, and state Yazdi's theorem as "there is a closed hyperbolic `M` and a class `a` with dual norm one and the right parity that is the Euler class of no taut foliation". Tested on the sphere: the corrected bound holds with `0 ≤ 0`; the roadmap's version fails there.

## R04 (P1) — PL embeddings need not be locally flat

**Location:** `README.md:323–324`: "**Smooth and PL embeddings are locally flat**, stated against layer 1's structure groups". **Witness:** the cone on a polygonal trefoil in `S³ = ∂D⁴` is a PL embedded disc in `D⁴`; the link of the cone point in the complement has fundamental group the trefoil group (non-abelian), whereas a locally flat disc has local complement group `ℤ` at every point. So the PL statement is false in codimension two. The smooth statement holds for embeddings that are immersions (a smooth embedding of a compact manifold is locally a slice by the implicit function theorem). **Repair:** keep "smooth embeddings of compact manifolds are locally flat" with the immersion hypothesis, and state the PL case only under the link condition (PL locally flat, Rourke–Sanderson Chapter 3); add the trefoil cone as a negative Check and the cone on an unknotted polygon as a positive one.

## R05 (P1) — The JSJ definition admits redundant tori

**Location:** `README.md:705–710`: "A `JSJDecomposition M` bundles the family of disjoint incompressible embedded tori, … and the proof each piece is Seifert-fibered or atoroidal; existence and canonicity (up to isotopy) are then *theorems*". **Witness:** on `T³` the empty family leaves one piece, `T³` itself, which is Seifert fibred; one coordinate torus leaves `T² × I`, also Seifert fibred. Both satisfy every field of the structure at lines 718–720, so "canonical up to isotopy" (line 721) is false for the object as defined: counts 0 and 1. The native `TauCeti.IsJSJDecomposition` (`TauCeti/LowDimTopology/JSJDecomposition.lean:210`) carries the missing law: no proper subfamily is a torus decomposition. **Repair:** consume the native predicate (it is the owner), or add its minimality law to any enriched object; keep `T³` with the two families as the discriminating Check.

## R06 (P1) — Smale is written as a topological-group isomorphism

**Location:** `Suggested.lean:43`: `theorem smale_conjecture : Diff (sphere 3) ≃ₜ* orthogonalGroup 4`. **Witness:** `O(4)` is compact and `Diff(S³)` with the weak Whitney topology is not (the time-`t` map of a flow with a hyperbolic fixed point has derivative norm `eᵗ`, unbounded), so no topological-group isomorphism exists; Hatcher's theorem is that the inclusion `O(4) → Diff(S³)` is a homotopy equivalence, which README line 390 states correctly, so the file contradicts the README. The native `TauCeti.SmaleConjecture` (`TauCeti/Geometry/Diffeomorphism/Smale.lean:46`) is exactly that statement and is statable now (R19). **Repair:** delete the comment at line 43 and state `theorem smale : TauCeti.SmaleConjecture := by sorry`.

## R07 (P2) — Cerf's connectedness omits orientation preservation

**Location:** `README.md:1024`: "`Γ₄ = 0` and `π₀(Diff S³) = 0` (Théorème 1)"; line 960: "`π₀ Diff(S³)` … stateable". **Witness:** the identity and a reflection of `S³` have degrees `+1` and `−1`, which are isotopy invariants, so `π₀(Diff S³)` has at least two elements; Cerf's theorem is `π₀(Diff⁺ S³) = 0`, equivalently `π₀(Diff S³) ≅ ℤ/2`. **Repair:** write `π₀(Diff⁺(S³)) = 0` and keep the reflection as the Check that distinguishes the two.

## R08 (P1) — Concordance endpoints are replaced by mirrors

**Location:** `README.md:602`: `Concordant (K K') := ∃ Σ : Annulus (sphere 3 ×ₘ I), boundary Σ = K ⊔ K'.mirror`; lines 582–583: "the reverse mirror the inverse". **Witness:** the product annulus `K × [0,1]` has boundary `K ⊔ K`, not `K ⊔ K.mirror`, so with the stated definition reflexivity fails whenever `K ≄ K.mirror`: the right trefoil has signature `2` and its mirror `−2`. Conversely the definition would make every `K` concordant to `K.mirror`, so the square knot `T # T.mirror` would be the relation's identity rather than a slice representative of it. The native `TauCeti.Concordance`/`Concordant` (`TauCeti/Geometry/Manifold/SmoothEmbedding/Concordance.lean:93, 101`) uses the actual endpoints. **Repair:** the boundary is `K` at `0` and `K'` at `1` (orientation reversed on the incoming end); the reverse mirror is the group inverse only. Check: the trefoil cylinder is a concordance from the trefoil to itself (signatures `2, 2`), and the square knot is slice (`Δ = (t − 1 + t⁻¹)²`, signature `0`).

## R09 (P2) — Zeeman's conjecture omits finiteness

**Location:** `README.md:898–899`: "for a contractible `2`-complex `K`, the product `K × I` is collapsible"; line 909. **Witness:** the triangulated plane (infinitely many triangles) is contractible and 2-dimensional, but no finite sequence of elementary collapses reduces `K × I` to a point, so the statement as written is false. The native `TauCeti.Contractible2Complex` (`TauCeti/AlgebraicTopology/SimplicialComplex/Zeeman.lean:62`) includes `K.faces.Finite`. **Repair:** finite complex, finite collapse sequence; consume the native predicate; keep the conjecture stated, not attached to a solver.

## R10 (P1) — The link recursion rejects dimension zero

**Location:** `README.md:882–883`: "`K` is a **combinatorial `n`-manifold** if the link of every vertex is a combinatorial `(n−1)`-sphere … or `(n−1)`-ball"; line 904 `(n-1)`. **Witness:** a single point is a combinatorial 0-manifold with empty vertex link; under natural-number subtraction the condition at `n = 0` asks for a combinatorial 0-sphere (two points) or 0-ball (one point), neither of which is empty, so no 0-manifold satisfies it. The native `TauCeti.IsCombinatorialManifold` (`…/CombinatorialManifold/Basic.lean:214`) splits `0` (void links) from `n + 1`. **Repair:** consume the native definition; restrict "`∂Δⁿ ≃ Sⁿ⁻¹`" (line 965) to `n ≥ 1`.

## R11 (P2) — The smooth-link carrier omits immersion and multiple components

**Location:** `README.md:477`: `SmoothLink (M) := { f : C^∞(circle, M) // IsEmbedding f }`. **Witness:** `t ↦ t − sin t` is a smooth homeomorphism of the circle with derivative `0` at `0`, so a smooth topological embedding need not be a smooth embedding; and one circle carries neither the empty link nor the two-component unlink. The pinned `Manifold.IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean`, elaborated this round: `ModelWithCorners` pair, `WithTop ℕ∞`, `(M → N) → Prop`) and Tau Ceti's `SmoothCircleEmbedding` (`TauCeti/KnotTheory/SmoothCircle.lean:118`) are the carriers. **Repair:** smooth embeddings (immersive) of a finite disjoint union of circles; components as data.

## R12 (P2) — Quotient geometries need free actions and interiors

**Location:** `README.md:703–704`: "a **geometric structure** on `M` as a complete locally homogeneous metric … (equivalently `M = X / Γ` for a discrete `Γ ≤ Isom X`)". **Witness:** `Γ = {±I}` is discrete in `Isom(E³)` and fixes the origin; `E³/Γ` is the cone on `ℝP²`, not a manifold (the vertex link is `ℝP²`, `H₁ = ℤ/2`). Also a compact JSJ piece has torus boundary and carries its complete geometry on its interior, not on the piece. **Repair:** free, properly discontinuous `Γ`; geometry on the interior of each piece with the finite-volume qualification; `E³/ℤ³` as the positive Check.

## R13 (P2) — Local flatness lacks a boundary model

**Location:** `README.md:299–300`: "`IsLocallyFlat f` for a topological embedding `f : N → M` of topological manifolds (allowing boundary), via 'a slice chart `ℝⁿ ⊆ ℝᵐ` exists at every image point'". **Witness:** the inclusion of the ray `[0, ∞)` into `ℝ` is the model of a neat boundary point; the punctured image germ at `0` has one component, while a full slice `ℝⁿ ⊆ ℝᵐ` punctured has two, so no full slice chart exists and the definition excludes every manifold with boundary. The native `TauCeti.IsLocallyFlat` (`TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:376`) is boundaryless, with `LocallyFlat/Neat.lean` for the neat case. **Repair:** three named variants (boundaryless, boundary-disjoint, neat), consuming the native ones.

## R14 (P2) — Heegaard existence exceeds the handlebody scope

**Location:** `README.md:738`: "Every closed 3-manifold splits into two handlebodies"; 743–744 "a handlebody is a boundary-sum of solid tori"; 753–754 "every closed 3-manifold has a splitting". **Witness:** `ℝP² × S¹` is closed and non-orientable; a union of two orientable handlebodies (boundary sums of solid tori) along a connected closed surface is orientable, so it has no splitting of the kind defined. Scharlemann §2.1 (scharlemann2002 lines 88–91) derives splittings from Moise's triangulation for compact connected 3-manifolds, with handlebodies that may be non-orientable. **Repair:** state existence for connected closed orientable 3-manifolds, or add non-orientable handlebodies (`I`-bundles over non-orientable surfaces); keep `ℝP² × S¹` as the negative Check for the orientable version.

## R15 (P1) — The Conway route imports the wrong obstruction

**Location:** `README.md:509–510`: "`0`-shake genus vs slice genus, `[Kir97, Problem 1.41]` (Piccirillo, via the Conway knot, jointly with the combinatorial Heegaard Floer roadmap's `τ`)"; 594–596. **Witness:** Piccirillo proves the trace-equivalent knot `K′` non-slice with Rasmussen's `s`-invariant and remarks that `τ(K′) = 0` for any such `K′` (piccirillo2020 lines 100–104); the bound `|τ| ≤ g₄` therefore gives only `0 ≤ g₄(K′)`. No roadmap on main owns `s` (CombinatorialHeegaardFloer supplies `τ`). **Repair:** state the trace argument (Proposition 1.4, line 93) and name an owner of `s`, or cut the 0-shake-genus unlock.

## R16 (P1) — The supplier relationship with CombinatorialHeegaardFloer is cyclic

**Location:** `README.md:35–39`: "the dependency runs there-to-here for the *definitions* and here-to-there for the *invariants*"; 570–571, 574. **Witness:** `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:328–334` on main consumes this roadmap's Layer 4 (presentations, slice-ness, polynomials); this roadmap's Layer 6 consumes its `τ` and its grid adequacy. Both are on main, so the dependency check (which reports cycles only among roadmaps in `ORDER.txt`) does not see it; the single-direction principle does. **Repair:** keep the foundations here; move the `τ`- and `s`-dependent applications (Piccirillo, the mutation and Levine unlocks that need Floer invariants) to a Part II that consumes both.

## R17 (P1) — Internal supplier citations name nonexistent supplies

**Location:** `README.md:713`: "the prime/connected-sum decomposition, which is layer 1"; 726; 743–744 "Layer 1's handlebodies"; 746 "the surface (closed orientable 2-manifold) classification for the splitting surface"; 751 "consume layer 3's surface mapping classes". **Witness:** Layer 1 (177–283) builds connected sums and defines no prime decomposition (uniqueness is Milnor–Kneser, nowhere a target) and no handlebody; Layer 3 (353–402) is diffeomorphism-group topology on general manifolds and defines no surface mapping class; no layer and no named roadmap supplies the classification of surfaces. Check on `L(2,1) # L(3,1)`: `π₁ = C₂ * C₃`, two prime factors, and no target states that the factorisation is unique. **Repair:** add prime decomposition with uniqueness as a Layer 1 or Layer 8 target; define handlebodies before splitting existence; cite an owner for the classification of surfaces and for the mapping class group of a surface (on main none exists; the open SurfaceTopology roadmap of pull request #271 plans both and is not citable until its own direction is fixed, see the previous review's R01).

## R18 (P2) — Native objects are planned again

**Location:** `Suggested.lean:22–31`: Mathlib has "**none** of the geometric-topology primitives … no connected sum or boundary gluing, no locally flat embeddings, no diffeomorphism-group topology, no knot theory beyond `Quandle`, no Dehn surgery, no Riemannian volume or hyperbolic structures, no Heegaard genus, no foliation Euler class, no triangulation-of-a-manifold"; `README.md:152–157`, 406, 622–623. **Witness:** at the pinned Tau Ceti (`358314d`) these exist, by file and line: `IsLocallyFlat` (LocallyFlat/Basic.lean:376), `brownBicollaring` (LocallyFlat/Brown.lean:39, proved), `AnnulusConjecture` (LocallyFlat/Annulus.lean:105), `Diff` (Diffeomorphism/Group.lean:178) with the weak Whitney topology and `SmaleConjecture` (Smale.lean:46), `SmoothCircleEmbedding` (KnotTheory/SmoothCircle.lean:118), `IsSmoothlySlice`/`IsTopologicallySlice` (KnotTheory/Slice/Basic.lean:142, 277), `FreedmanSliceTheorem` (Slice/Freedman.lean), `alexander` (Alexander.lean:378), `jonesPolynomial` (PDCode/Jones.lean:110), `Concordance` (Concordance.lean:93), `Slope` (DehnSurgery/Slope.lean:122), `riemannianVolume` (VolumeDensity/Volume.lean:76), `HyperbolicMetric` (Riemannian/Hyperbolic.lean:46), `hypVolumeOfMetric` and `hypVolume` (Hyperbolic/Volume.lean:50, 122), `MostowRigidity` (Hyperbolic/Mostow.lean:72), `IsJSJDecomposition` (JSJDecomposition.lean:210), `FibersOverCircle` (Topology/MappingTorus.lean:261), `IsHakenSurfaceEmbedding` (Haken.lean:74), `Foliation` (Foliation/Basic.lean:63), `IsTriangulable` (Topology/Triangulable.lean:40), `IsCombinatorialSphere`/`IsCombinatorialManifold` (CombinatorialManifold/Basic.lean:87, 214), `Collapsible` (Collapse/Basic.lean:160), `Contractible2Complex` (Zeeman.lean:62), `PLPregroupoid`/`PLGroupoid` (PLGroupoid.lean:73, 106). The README's Layers 2, 3, 4, 5, 7, 8, 10 and 11 plan each of them again as new definitions. **Repair:** a supplier-contract section naming each native declaration consumed, and layer text that keeps only the genuinely missing extensions (gluing and connected sum, handlebodies and Heegaard genus, the Euler class of a plane bundle, the Thurston norm, the ordered-simplex CW structure, the Weeks manifold).

## R19 (P2) — Statable headlines remain absent

**Location:** `Suggested.lean:29–31`: "there are no compiled targets to state against the pin yet: the whole point of the issue is that these theorems are not statable today"; line 59. **Witness:** a scratch file with `theorem smale_probe : TauCeti.SmaleConjecture := by sorry` elaborates under `lake env lean` with exactly the sorry warning (this round, 0 errors; `#check` prints `TauCeti.SmaleConjecture : Prop`). At the same pin `TauCeti.AnnulusConjecture n`, `TauCeti.FreedmanSliceTheorem` and `TauCeti.MostowRigidity` are closed `Prop` definitions (files above), so the annulus theorem (for all `n`), Freedman's theorem and Mostow rigidity are statable with one line each, and the roadmap names all four as headlines (README 349–351, 401, 511, 657–658). **Repair:** state these four; for each remaining headline (Property P, Weeks, Agol, JSJ existence and uniqueness, geometrization, Li, Yazdi, Manolescu, Zeeman) say in the module docstring which carrier is missing (a Dehn-filling construction, a hyperbolic-manifold enumeration, the Thurston norm, a closed topological 5-manifold type).

## R20 (P2) — Two end theorems are unnecessarily narrowed

**Location:** `README.md:765`: `waldhausen_false : ∃ M, groupRank (FundamentalGroup M) < heegaardGenus M`; line 907: `∃ M : ClosedTopological5Manifold, ¬ IsTriangulable M`. **Witness:** Li's Theorem 1.1 makes the discrepancy arbitrarily large (li2013 lines 66–68); Manolescu's theorem gives non-triangulable manifolds in every dimension `≥ 5` (manolescu-lectures lines 15–16). The targets keep gap `≥ 1` and `n = 5`. **Repair:** `∀ k, ∃ M, g(M) − rank π₁(M) ≥ k` and `∀ n ≥ 5, ∃ M …`; keep gap one and `n = 5` as Checks.

## R21 (P2) — Executable algorithms remain deliverables

**Location:** `README.md:465–473`: "Knot polynomials, each a project in itself, with several algorithms apiece … we will likely want **multiple algorithms for the same invariant**"; 954 "computed by the layer-4 algorithm". **Witness:** the roadmap's contract excludes computational algorithms; the mathematics (Seifert-matrix, skein, Burau and bracket constructions with agreement theorems) is what a library states. **Repair:** keep the constructions and the agreement theorems; drop "algorithm" and "implementation"; the unknot (`1`), trefoil (`t − 1 + t⁻¹`) and figure-eight (`−t + 3 − t⁻¹`) are the Checks.

## R22 (P2) — Named milestones still lack mathematical contracts

**Location:** `README.md:282–283` (`⋆RP⁴ # ⋆CP²`: no fake `ℝP⁴` is constructed anywhere); 395–402 (Watanabe: "a specific element of `π_k(Diff(D⁴, ∂))` … is nonzero", no `k`); 557–563 (cosmetic surgery: no slope pair or orientation quantifiers); 605–606 (Levine: no ambient cobordism named); 679 (the Weeks manifold: "pick one"). **Witness:** Watanabe's Theorem 1.1 is a surjection `π_k BDiff(D⁴, ∂) ⊗ ℚ → A_k` for every `k ≥ 1`, with `A₁ = 0` and the first nontrivial class detected in `A₂ ≅ ℚ` (watanabe2018 lines 32–36), so the first nonzero element lies in `π₂ BDiff ≅ π₁ Diff(D⁴, ∂)`, rationally; the Weeks manifold is the `(5,1), (5,2)` filling of the Whitehead link (gmm2009 lines 54–55). **Repair:** objects, quantifiers and locators for each: the Cappell–Shaneson `ℝP⁴`; `π₁(Diff(D⁴, ∂)) ⊗ ℚ ≠ 0`; "two distinct slopes `r ≠ r′` with `M(r) ≅ M(r′)` orientation-reversingly"; Levine's homology sphere `Y` and the concordance in `Y × I`; the Weeks manifold by its filling.

## R23 (P3) — Incorrect source locators remain

**Location:** `README.md:401` and 1026 (`[Kir97, 4.34]` for Hatcher's `S³` theorem); 561 and 1058 (`[Kir97, 1.82]` for Property R); 1109 ("D. Gabai, M. Yazdi, *On Thurston's Euler class-one conjecture*"); 845–872 (the realization, compactness and CW block, no locator). **Witness:** Problem 4.34 asks whether `Diff(S⁴) ≃ O(5)` (kirby1997 cache `9812f2d7` line 5950); Property R is Problem 1.16 (line 425) and 1.82 asks which framed links produce `# S¹ × S²` (line 1638); the Acta paper is by Yazdi alone (yazdi2016 line 6; the arXiv listing names one author); the compact-subset clause is Hatcher, *Algebraic Topology*, Proposition A.1 (hatcher-at lines 22534–22535). **Repair:** correct the numbers and the attribution; add the locators.

## R24 (P3) — Invariant and cellular sign conventions are incomplete

**Location:** `README.md:500–501` (Alexander "`Δ_K(t) = Δ_K(t⁻¹)`, `Δ_unknot = 1`"; Jones "fix the trefoil value from Lickorish"); 604 (`signature (K) (ω : Circle) : ℤ`); 869–870 (cellular boundary `∑ (−1)ʲ`). **Witness:** symmetry and `Δ_unknot = 1` do not fix the sign of `Δ` for a knot with `Δ(1) = −1` under the wrong normalisation (`Δ` and `−Δ` are both symmetric; the law `Δ(1) = 1` does); the Jones trefoil value (`t + t³ − t⁴` for the right-handed trefoil under `t = A⁻⁴`) is referred to a book rather than stated, so mirror ambiguity remains (`1` at `t = 1` on both sides); at a root of the Alexander polynomial the one-sided signatures differ (trefoil at `ω = e^{iπ/3}`: `0` and `2`, average `1`), and livingston2005 line 228 defines `σ_ω` as that limiting average, which the README does not say; reflecting the interval's characteristic map turns `∂[ab] = b − a` into `a − b`, so the `o`-ordered characteristic maps must be pinned as oriented ball-to-simplex maps. **Repair:** add `Δ(1) = 1`; state the trefoil Jones value; define `σ_ω` as the limiting average with `σ₁ = 0`; fix the orientation of the characteristic maps.

## R25 (P3) — The required shape, APIs and Checks are missing

**Location:** `README.md:1–1147`. **Witness:** no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build`; the layers are `### Layer k` blocks with `**From Mathlib**`/`**What to build**`/`**Design notes**`/`**Unlocks**` field lists, no `### k.n` prose subsections, no `*Needs:*` lines, no `### Examples`/`### Dependencies`, no `**Checks.**` lists (a single `## Acceptance criteria` at 945–970 carries seven checks for eleven layers), process narrative throughout (lines 6, 165–167, 291, 358, 407, 464, 1126–1138, 1140–1147), and Lean fences that are comments rather than statements. **Repair:** the README shape of the brief; the open revision of this folder (pull request #903) already has it, so the repair belongs on that text and this pull request's deletion of `references/` should be rebased onto it.

## Verified sound

**Scope of this head.** `git diff --stat origin/main...HEAD -- TauCetiRoadmap/GeometricTopology`: 29 files, 41 insertions, 2,110 deletions: `README.md` (41 lines changed, all link removals) and the 27 files of `references/` deleted (plus its index). `Suggested.lean`, `metadata.toml`, `PROGRESS.md` and `STATUS.md` are byte-identical to main (`git diff --quiet`). The prescribed filtered three-dot diff outside this pull request's five folders is empty. Each removed link was checked against its replacement: every former `[extract]` now has the chapter, theorem or page it stood for (Hirsch 6.1/6.3/6.6, Lee 9.25/6.24, Hirsch Ch. 2, Lickorish Ch. 1/3/6/8/16.10, Rolfsen Ch. 9, Lee GTM 176, Thurston, Ratcliffe 11.8.5, Moise 35.3/36.2, Rourke–Sanderson Ch. 1–3, Munkres 10.5/10.6, Freedman–Quinn 11.7B, Gompf–Stipsicz Ch. 4–5, Cerf Thm 1, Candel–Conlon, Kirby–Siebenmann); the Jones row (line 501) gained Lickorish's Definitions 3.1, 3.4, 3.6 and Theorem 3.5.

**Gate.** My rerun at this head:

```text
gate GeometricTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=1 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=22 source-material=0 FAIL
  residue: line 528: layer-4-to-layer-5 handoff that lean-eval lacks.
```

Every `outside-folder` entry is a file of `TauCetiRoadmap/AlgebraicTopology`, `ReductiveGroups`, `QuadraticFormInvariants` or `RepresentationTheory/LieHighestWeight`, this pull request's own folders. The worker's run adds `build=1` (R01); `stray-files` went from 1 to 0 (R07 of the previous review, repaired).

**Dependency check.** The exact requested command:

```text
depcheck: 223 roadmaps, 2095 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. GeometricTopology is on main, so it is not in `ORDER.txt`; the cycle of R16 is between two main roadmaps and lies outside the checker's universe (confirmed at the previous review with a control line). `roadmaps resolve` on this README: no cross-roadmap citation and no Lean name found nowhere.

**Elaboration.** `Suggested.lean` (one `import Mathlib`, a docstring, an empty namespace): a copy elaborated under `lake env lean` with no message; it has zero declarations, so there is nothing to `#check`, no one-tactic probe and no padding. The scratch probe importing `TauCeti.Geometry.Diffeomorphism.Smale`, `TauCeti.LowDimTopology.JSJDecomposition` and `TauCeti.Topology.Triangulable` with `theorem smale_probe : TauCeti.SmaleConjecture := by sorry` exited 0 with exactly the sorry warning; `#check` printed `TauCeti.SmaleConjecture : Prop`, `@TauCeti.IsJSJDecomposition : … (ι → C(Circle × Circle, M)) → Prop`, `TauCeti.IsTriangulable : (X : Type) → [TopologicalSpace X] → Prop`. `#check @Group.rank` at the pin: `(G : Type) → [Group G] → [Group.FG G] → ℕ`, so the hedge at README 771–773 is answered: the invariant exists and needs `Group.FG (FundamentalGroup M)` (true for closed manifolds, but a hypothesis to discharge). No Lean process was left running.

**Pins.** `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; the declarations of R18 were read in `.lake/packages/TauCeti` at that revision, file and line as listed there, and `Manifold.IsSmoothEmbedding` was elaborated from `.lake/packages/mathlib`.

**Cross-roadmap citations resolved this round** (main at 3b51055 or the named head):

| Citation | Where it resolves |
|---|---|
| CombinatorialHeegaardFloer (README 35–39, 570–574) | main `CombinatorialHeegaardFloer/README.md:328–334`, Lane K consumes this roadmap's Layer 4 (R16) |
| DifferentialGeometry 5.5 (204, 231) and 12.4 (629) | main lines 532 (faces of corners "the geometric-topology roadmap consumes") and 923–929 (`TauCeti.riemannianVolume`, "no second one is defined") |
| HopfRinow Layer 1 Levi-Civita (624, 638) | `Completed/HopfRinow/README.md:38–41` ("the Geometric Topology roadmap consumes the connection"), 303 |
| ClassifyingSpaces, AlgebraicTopology (consumers of Layer 11) | main `ClassifyingSpaces/README.md:65`; `AlgebraicTopology/README.md:63, 834, 1813` (same at this pull request's head) |
| FourManifolds (open, #936) | consumes GT Layers 1, 2, 4, 5 (its README 13–29, 175, 188); pins `TauCeti.brownBicollaring`, `TauCeti.AnnulusConjecture 3`, `TauCeti.IsTopologicallySlice` (132–143); "no GeometricTopology layer consumes this roadmap" (175) |
| KleinianGroups (open, #432), MorseNovikov (main) | consumers of this roadmap's hyperbolic volume (KleinianGroups 28) and Layers 1, 3–5, 11 (MorseNovikov 28, 165) |

**Ownership against open work.** Searched by object (`Heegaard genus`, `Dehn filling/surgery`, `concordance group`, `hyperbolic volume`, `Smale conjecture`, `Annulus`, `taut foliation`, `JSJ decomposition`, `combinatorial manifold`, `locally flat`) with `roadmaps grep` over the open heads and main: the only other roadmaps that mention them are consumers (FourManifolds, KleinianGroups, MorseNovikov, AffineMorseLefschetz via AlgebraicTopology) and the three open revisions of this same folder (#903 at 309be2f, #1517 at 2559c13, #1791 at fcad6f1), which are not suppliers. The open PlanarTopology/SurfaceTopology pull request (#271) is not cited by this head. No second builder of any Layer object was found; the native Tau Ceti declarations of R18 are the owners of what they define.

**Sources read this round** (cache ids, line-numbered texts; nothing copied into the repository): li2013 `90768f44…`, livingston2005 `e7d9e5eb…`, gmm2009 `c6dc414e…`, agol2013 `ea8c7f39…`, km2004 `b0376a66…`, scharlemann2002 `a5efa71a…` (the manifest's entries); yazdi2016 `8e338304…`, piccirillo2020 `233da6e9…`, manolescu-lectures `d17456df…`, watanabe2018 `07d3cd2f…`, hatcher-at `bebb3032…`, kirby1997 `9812f2d7…` (see Not verifiable). No fetch was needed; the manifest was not edited.

**Seeded sample.** The 15 seeded labels (four "From Mathlib / earlier layers", two "Design notes", five "What to build", four "Unlocks") were taken where the carried findings touch them:

| Target | Source or pin at its locator | Supports the statement as written? |
|---|---|---|
| L3 From Mathlib (`Diffeomorph`, no group topology) | pin: `TauCeti.Diff` Group.lean:178, weak Whitney topology in `TauCeti.DiffeomorphWeakWhitney` (Smale.lean:40) | No: the topology exists (R18) |
| L7 From Mathlib (volume, Levi-Civita) | pin: `riemannianVolume` Volume.lean:76; HopfRinow main 38–41 | Yes |
| L9 From Mathlib (rank, surface classification) | pin: `Group.rank` with `[Group.FG]`; classification: no owner (R17) | Partly |
| L11 From Mathlib (realization) | pin: `IsTriangulable` Triangulable.lean:40, `Realization` | No: planned again (R18) |
| L6 Design notes (signature) | livingston2005 228 (limiting average) | Yes; convention incomplete (R24) |
| L7 Design notes (Mostow, Weeks) | gmm2009 52–55; pin `MostowRigidity` Mostow.lean:72 | Yes; Mostow statable (R19) |
| L2 What to build (annulus) | pin `AnnulusConjecture` Annulus.lean:105: locally flat `n`-spheres in `ℝⁿ⁺¹`, `range g ⊆ filledHull (range f) \ range f` | Content yes; planned again (R18), statable (R19) |
| L4 What to build (slice-ness) | pin `IsSmoothlySlice`/`IsTopologicallySlice` Slice/Basic.lean:142, 277 | Planned again (R18) |
| L5 What to build (slopes) | pin `Slope` Slope.lean:122, `Slope.value : Slope (ℤ × ℤ) → OnePoint ℚ` (241) | Planned again (R18) |
| L10 What to build (Euler bound) | yazdi2016 100–102 (Gabai), 111–114 (Main Theorem) | No (R03) |
| L11 What to build (compact subsets) | hatcher-at 22534–22535 (Prop. A.1) | Yes; no locator (R23) |
| L3 Unlocks (Smale, Watanabe) | kirby1997 5950 (4.34 is `S⁴`); watanabe2018 32–36 | 4.34 wrong (R23); no degree (R22) |
| L4 Unlocks (Piccirillo, Freedman) | piccirillo2020 93, 100–104; pin `FreedmanSliceTheorem` | `τ` wrong (R15); Freedman statable (R19) |
| L5 Unlocks (Property P, R) | km2004 41, 54–55; kirby1997 425 (1.16), 1638 (1.82) | P yes; R number wrong (R23) |
| L7 Unlocks (Agol, Weeks) | agol2013 27–30 (9.1 aspherical, 9.2 hyperbolic); gmm2009 52–55 | Yes |
| L9, L11 Unlocks (Li, Manolescu) | li2013 66–68; manolescu-lectures 15–16 | Narrowed (R20) |

**Adversarial table.** Every row is this round's computation on the statement at this head.

| # | Statement or object | Instances tried | Values on each side | Result / change |
|---|---|---|---|---|
| A1 | Euler-class bound (802–805) | small bounding `S²`; genus-2 leaf `Σ₂` | pairing `0` vs `−χ = −2` (`0 ≤ −2` false); `−2` vs `−2` | R03 |
| A2 | Thurston norm on the sphere | `[S²] = 0 ∈ H₂` | `x(0) = 0`; corrected bound `0 ≤ 0` | R03 repair holds |
| A3 | PL local flatness (323) | cone on a trefoil; cone on an unknot | local complement group: trefoil group (non-abelian) / `ℤ` | R04 |
| A4 | JSJ object (705–720) | `T³` with `∅`; with one coordinate torus | tori `0` / `1`; pieces `T³` / `T² × I`, both Seifert fibred | R05 |
| A5 | Smale as `≃ₜ*` (Suggested.lean 43) | compactness | `O(4)` compact; `Diff(S³)` not (derivative norms `eᵗ`) | R06 |
| A6 | `π₀(Diff S³) = 0` (1024) | identity; reflection | degrees `+1` / `−1`, so `|π₀| ≥ 2` | R07 |
| A7 | Concordance by mirror (602) | trefoil cylinder; square knot | signatures `(2, 2)` vs mirror `(2, −2)`; square knot slice but `Δ = (t − 1 + t⁻¹)² ≠ 1` | R08 |
| A8 | Zeeman (898) | triangulated plane `× I` | infinitely many simplices before and after any finite collapse | R09 |
| A9 | Link condition at `n = 0` (882) | a point | link `∅` vs required `S⁰` (2 points) or `B⁰` (1 point) | R10 |
| A10 | `SmoothLink` carrier (477) | `t ↦ t − sin t`; empty link; 2-unlink | derivative `0` at `0` yet an embedding; components `0`, `2` vs one circle | R11 |
| A11 | `X/Γ` (704) | `E³/ℤ³`; `E³/{±I}` | stabilisers trivial / order 2 at `0`; link `S²` / `ℝP²` (`H₁ = 0` / `ℤ/2`) | R12 |
| A12 | Full-slice local flatness with boundary (299) | ray endpoint; line interior | punctured image-germ components `1` / `2` | R13 |
| A13 | Heegaard existence (738) | `ℝP² × S¹` | non-orientable; union of orientable handlebodies orientable | R14 |
| A14 | `τ` versus `s` (509) | `K′` trace-equivalent to Conway | `τ(K′) = 0` gives `0 ≤ g₄`; `s(K′) ≠ 0` obstructs | R15 |
| A15 | Supply direction with CHF | GT→CHF (570–574); CHF→GT (CHF 328–334) | 2 citing passages each way; cycle length 2 | R16 |
| A16 | Prime decomposition (713) | `S³ # M`; `L(2,1) # L(3,1)` | `M`; `π₁ = C₂ * C₃`, two factors, uniqueness unstated | R17 |
| A17 | "none at the pin" (Suggested.lean 25–31) | 27 named objects | 27 found at Tau Ceti `358314d`, 0 missing | R18 |
| A18 | Statable headlines | Smale, annulus, Freedman, Mostow | elaborated (Smale); closed `Prop` defs at the pin (three) | R19 |
| A19 | Li's gap (765) | gap `1`, `2` | source: arbitrarily large; README existential `> 0` | R20 |
| A20 | Manolescu (907) | `n = 5`, `6` | source: all `n ≥ 5`; README: `5` only | R20 |
| A21 | Watanabe's class (395–397) | `A₁`, `A₂` | `A₁ = 0`, `A₂ ≅ ℚ`; first class in `π₂ BDiff ⊗ ℚ ≅ π₁ Diff(D⁴, ∂) ⊗ ℚ` | R22 |
| A22 | Kirby numbers (401, 561) | 4.34, 1.16, 1.82 | `Diff(S⁴) ≃ O(5)?`; Property R; framed links giving `# S¹ × S²` | R23 |
| A23 | Alexander sign (500) | unknot, trefoil, figure-eight at `t = 1` and `t = −1` | `1, 1, 1` at `t = 1`; `1, −3, 5` at `t = −1`; `−Δ` also symmetric | R24 |
| A24 | Jones mirror (501) | right trefoil, mirror | `t + t³ − t⁴` vs `t⁻¹ + t⁻³ − t⁻⁴`; both `1` at `t = 1` | R24 |
| A25 | Signature at a root (604) | `V = [[1,0],[−1,1]]`, `θ = π/3 ± 0.001` | signatures `0` and `2`; average `1`; at `ω = 1` the form is `0` | R24 |
| A26 | Cellular boundary sign (869) | edge `ab`, triangle `abc` | `∂ab = b − a`, `∂abc = bc − ac + ab`, `∂² = 0`; reflected map gives `a − b` | R24 |
| A27 | Slopes (530–536) | `(0,0)`, `(2,2)`, `(1,0)`, `(0,1)`; `1/0` | gcd `0, 2, 1, 1`; `OnePoint ℚ` carries `∞` natively | consume `Slope.value` (R18) |
| A28 | Unknot surgeries (957–959) | `0`, `∞`, `2/1` | `H₁ = ℤ, 0, ℤ/2`: `S¹ × S²`, `S³`, `L(2,1)` | positive controls, sound |
| A29 | Weeks volume (672) | Weeks; identity cover | `v₁ = 0.9427…`; `V ≤ V` | sound |
| A30 | Agol (673) | `Σ₂ × S¹`, identity cover | fibre `Σ₂`, `χ = −2`; 9.2 hypothesis closed hyperbolic | sound |
| A31 | Property P (561) | trefoil `+1`; unknot `0` | nontrivial `π₁ → SO(3)` exists / `π₁ = ℤ`, `S¹ × S²` | sound |
| A32 | Realization of `∂Δⁿ` (965) | `n = 0, 1, 2` | `∅`, two points, circle; `S⁻¹` under Nat subtraction wrong | R10 |
| A33 | Compact subsets of `|K|` (851–853) | one closed triangle; infinite wedge, one interior point per edge | 3 vertices suffice; the chosen set is closed, discrete, infinite, not compact | Prop. A.1 supports the clause |
| A34 | `Group.rank` (764, 771) | `FundamentalGroup` of a closed 3-manifold | pin signature needs `[Group.FG G]`; finite generation is a hypothesis to prove | note under Verified sound |

**Headline inventory.** The README's end theorems: collars, tubes and connected sum (L1); Brown collaring and the annulus theorem (L2); Smale and Watanabe (L3); Reidemeister and Markov, invariant agreement, Freedman and Piccirillo (L4); Property P and R, unknot surgeries (L5); the concordance group, mutation, Levine (L6); Mostow invariance, Weeks, Agol (L7); JSJ, geometrization, Poincaré (L8); Heegaard existence, rank ≤ genus, Li (L9); the Euler-class bound and Yazdi (L10); triangulations, Manolescu, Zeeman as a conjecture (L11). `Suggested.lean` states none; Smale, the annulus theorem, Freedman and Mostow are statable at the pin (R19), Brown's bicollaring is already proved there (`brownBicollaring`, Brown.lean:39), and the docstring does not say which carrier each other headline lacks. No padding exists because no declaration exists.

## Not verifiable

- kirby1997: the manifest's cached copy (`c95e08ef…`, the Berkeley author-page PostScript) could not be rendered by the service (0 pages). The problem numbers were read in the earlier cache `9812f2d7…`, a file of unstated provenance whose numbering matches the published list (4.34 at line 5950, 1.16 at 425, 1.82 at 1638); a certified copy should replace it before the locators are marked verified.
- Cerf (LNM 53), Brown 1962, Kirby 1969, Freedman 1982, Quinn 1982, Freedman–Quinn, Rolfsen, Hirsch, Lee GTM 218 and 176, Lickorish, Burde–Zieschang, Rourke–Sanderson, Hudson, Munkres, Kirby–Siebenmann, Moise, Thurston (Princeton), Ratcliffe, Candel–Conlon, Scott, Zeeman 1964, Palais 1960, Levine 2016, Gompf–Stipsicz, Daverman–Venema, Birman: in copyright and not read this round; their locators (the ones that replaced the deleted extracts) are carried as the README states them, not certified.
- Livingston §3.1's "even integer" clause recorded by an earlier review was not re-located in the cached text; line 230 says `σ_ω` is onto `2ℤ` for `ω ≠ 1`, which is the nearest statement.
- Gabai–Meyerhoff–Milley, *Minimum volume cusped hyperbolic three-manifolds* (arXiv 0705.4325, README 1080–1081): not read; only the Mom-technology paper (`gmm2009`) was, and it carries the closed-case theorem the README cites.

## Source issues

- none
