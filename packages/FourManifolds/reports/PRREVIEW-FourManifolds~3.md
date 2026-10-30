# Review of FourManifolds (pull request #936 at c7b2a73)
**Verdict:** needs changes

## R01 (P1) — The generic F3 contracts are still unowned: no supplier is named and no gap is declared

**Location:** `TauCetiRoadmap/FourManifolds/README.md:113`–138: “They require an extension of the generic theory, with the following boundaries.”

**Claim:** F3's proof routes consume a spherical-fibration classifier BG with G/PL and TOP/PL fibres, quadratic L-groups with the Laurent splitting, a K/Whitehead spectrum with negative K-groups on neighbourhood fundamental groups, the punctured-torus immersion, Brown's generalized Schoenflies theorem, proper locally flat Euclidean embeddings, low-codimension normal-neighbourhood theorems, relative PL structure theory in dimension five, PL smoothing in low dimension, and the Kirby–Siebenmann and Marin transversality ranges.

**Witness:** The section names no supplier and no `gap:` slug, and the brief records no readable `design/plan.json`. On main, `TauCetiRoadmap/GeometricTopology/README.md:289`–356 (Layer 2) and 930–951 (the comparison) state none of these; `grep` of main for `Schoenflies`, `microbundle`, `Marin`, `Whitehead spectrum` finds nothing in GeometricTopology or MorseTheory. The pinned `TauCeti.brownBicollaring` (`TauCeti/Geometry/Manifold/LocallyFlat/Brown.lean:39`) is the collaring theorem, not Schoenflies. Only the open revisions of GeometricTopology (§2.2) and MorseTheory plan Brown's theorem, and revisions of existing roadmaps are not suppliers.

**Repair:** The previous review asked for an owner or a declared gap; this head states the contracts precisely (the L₅(ℤ[ℤ]) ≅ ℤ correction and the dropped `puncturedTorusImmersion`/`brownGeneralizedSchoenflies` names are repaired) but still owns them nowhere. Do one of the two: (a) under `## Exact supplier contracts` add a GeometricTopology subsection with one line per contract, `What GeometricTopology must provide (gap:<slug>): <needs>`, one slug each (for example `gap:controlled-k-whitehead-spectrum`, `gap:spherical-classifier-g-top`, `gap:laurent-l-group-splitting`, `gap:brown-schoenflies`, `gap:marin-stable-transversality`, `gap:relative-pl-five`, `gap:low-codimension-normal-bundles`), each `needs` sentence carrying its hypotheses (the K/Whitehead contract must say which groups and which vanishings; the transversality contract must say the excluded dimensions of `freedmanquinn` lines 5879–5887), and ask the worker to record the same slugs in the plan's `gaps`; or (b) state them here as Layer 3 targets with locators. Before either, shrink the list by R03: simply connected normal maps, L_n(ℤ), the σ/8 normalization and the E₈ realization already belong to HomotopySpheres Stage 7, so only the ℤ[ℤ] Laurent splitting, BG/G/TOP and the controlled coefficients remain generic.

## R02 (P2) — Earlier roadmaps are described as consumers of F3, and the two end theorems this produces are statable headlines that `Suggested.lean` omits

**Location:** `TauCetiRoadmap/FourManifolds/README.md:102` (“Layer6 consumes F3's cyclic surgery and zero-form theorem for Alexander-one slicing; Layer4's Freedman application then consumes Layer6”), 136–138, 1107 (“GT Layer2 consumes this n=4 theorem”), 1217, 2335–2336; `TauCetiRoadmap/FourManifolds/Suggested.lean:14`–46.

**Claim:** GeometricTopology Layers 2, 4 and 6 consume this roadmap's annulus theorem and its ℤ[ℤ]-surgery and normal-filling theorems; the four-dimensional annulus theorem is owned at 1098 and the Alexander-one slicing application is supplied to GeometricTopology.

**Witness:** GeometricTopology is on main and earlier in every order; it cannot consume a later roadmap, and on main it does not: `TauCetiRoadmap/GeometricTopology/README.md:329`–341 states the annulus conjecture in every dimension as its own target with Kirby's route as the intended proof, and 595–600 owns “the existence of locally flat slice discs for Alexander-polynomial-one knots”. Both end theorems exist at the pin: `TauCeti.AnnulusConjecture 3` (`TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean:105`) and `TauCeti.FreedmanSliceTheorem` (`TauCeti/KnotTheory/Slice/Freedman.lean:64`, a recorded unproved proposition). A scratch file with `theorem annulus_four : TauCeti.AnnulusConjecture 3 := by sorry` and `theorem freedman_slice : TauCeti.FreedmanSliceTheorem := by sorry` elaborates with exactly two `sorry` warnings.

**Repair:** Delete every sentence that says GeometricTopology consumes F3 (102, 136–138, 1107, 1217, 2335–2336). State the two end theorems here as headlines in `Suggested.lean`, on the pinned carriers above, with the Freedman statement importing `TauCeti.KnotTheory.Slice.Freedman` (and `TauCeti.Geometry.Manifold.LocallyFlat.Annulus`), and name them in the README at §3.6 as the end theorems of the ℤ[ℤ]-surgery and controlled-product routes. In `## Scope and ownership` say that GeometricTopology Layer 2 states the annulus theorem in every dimension and that its dimension-four case, like Freedman's slice theorem, is proved here from §3.3–§3.6 without any return supply; the intake records the ownership move (GeometricTopology's open revision already assigns the dimension-four case to FourManifolds). The docstring's “not statable” list then no longer covers these two; keep its other items.

## R03 (P2) — The E₈ plumbing, simply connected normal maps and `L_n(ℤ)` are planned again although HomotopySpheres and the pinned Tau Ceti own them

**Location:** `TauCetiRoadmap/FourManifolds/README.md:274`–297 (“Construct the +2 E₈ plumbing”), 1196–1202 (“Pin the positive E₈ plumbing to the eight-vertex tree with arms of lengths 1,2,4”), 997–1020 (“Define a degree-one geometric TOP normal map”), 1044 (“Consume L₄(ℤ)≅ℤ with σ/8 and L₅(ℤ)=0”), 119–123; `## Exact supplier contracts` at 89–96 lists from Tau Ceti only `TopCat.singularCup` and `ofIntegralForm`.

**Claim:** This roadmap constructs the E₈ plumbing with its boundary and generators, defines degree-one normal maps and normal bordism, and consumes the simply connected surgery groups as an unowned generic contract.

**Witness:** HomotopySpheres (earlier: entry 64 against 119) at `TauCetiRoadmap/HomotopySpheres/README.md:1083`–1114 constructs the signed E₈ tree plumbing for every k ≥ 1 with the negative E₈ matrix, determinant 1 and signature −8, keeping k = 1 as its homology-three-sphere branch; 1141–1154 defines degree-one normal maps and normal bordism; 1155–1218 defines `L_n(ℤ)`, proves the σ/8 identification in dimension 4k, the vanishing for odd n ≥ 5 and the E₈ plumbing realization. The pinned Tau Ceti has `TauCeti.PlumbingGraph` with `intersectionForm` (`TauCeti/LowDimTopology/Plumbing/IntersectionForm.lean:89`, 108), `TauCeti.e8Plumbing` with framing −2, chain 0…6 and vertex 7 on vertex 2, proved negative definite (`.../Plumbing/E8.lean:63`, 199), and `characteristicVectors` (`.../Plumbing/Characteristic.lean:63`).

**Repair:** Cite HomotopySpheres 6B for the E₈ plumbing (this roadmap's +2 plumbing is its orientation reversal; keep only the comparison of the boundary with the oriented Poincaré sphere and the cap) and HomotopySpheres 7A–7C for normal maps, `L₄(ℤ) ≅ ℤ` with σ/8 and `L₅(ℤ) = 0`; keep the TOP normal-map variant with one clause on what differs (TOP stable normal complement, no Lie frame). Add the three pinned plumbing declarations to `From Tau Ceti` and make the F1.6 lattice statements (determinant, minors, characteristic vectors) comparisons with `TauCeti.e8Plumbing` and `TauCeti.PlumbingGraph.intersectionForm`; the sign convention (−2 at the pin, +2 here) becomes a Check. Remove the corresponding items from the R01 list.

## R04 (P2) — GeometricTopology is cited for statements it does not make on main

**Location:** `TauCetiRoadmap/FourManifolds/README.md:318` (“GT's topological CW-type theorem applies without a triangulation”), 371 (“GeometricTopology's smooth tubular collapse and link bordism”), 242, 278 and 296 (“Kirby moves”, “Layers 4–5's framed links and handle slides”), 102 (“Framed links, linking, Seifert surfaces and Arf precede F1/F3”), 12–15 (“its tangent-microbundle and stable-classifier interfaces”).

**Claim:** GeometricTopology supplies the CW type of topological manifolds, the Pontryagin–Thom collapse for links, handle slides and Kirby moves, the knot Arf invariant, and tangent microbundles with stable classifiers.

**Witness:** On main, `grep -i` of `TauCetiRoadmap/GeometricTopology/README.md` for `CW`, `collapse`, `slide`, `Kirby move`, `Kirby calculus`, `Arf`, `microbundle` finds only Mathlib's CW-complex files (130–132), simplicial collapse in Layer 11 (905), a bibliography entry for Gompf–Stipsicz (1075) and the smoothing comparison (947); Layer 1 has handle attachment and tubular neighbourhoods (213–221), Layer 4 has Seifert surfaces and framings (436, 505), Layer 5 is Dehn surgery (519).

**Repair:** For each item cite the real owner or state it as a target here: the finite-wedge Pontryagin–Thom comparison is already owned in Layer 2 (344–372), so drop the GT citation and cite TangentialBordism 5.2 (`TauCetiRoadmap/TangentialBordism/README.md:1012`) for the framed collapse; the knot Arf invariant goes to TangentialBordism 1.1 (`finiteQuadraticArf`) on GT Layer 4's Seifert matrix; handle slides and Kirby moves become F1.4/F1.6 targets with a Gompf–Stipsicz locator; the CW-type theorem for topological manifolds and the tangent-microbundle/stable-classifier interfaces join R01's gap list with their own slugs.

## R05 (P3) — Locators: the seeded Layer 6 targets and six subsections still carry none, and three citations point to the wrong place

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1852`–2005 (§6.1–§6.3), 1293 (“TangentialBordism B4.1–B4.2's Wu identities”), 553 (“Freedman–Quinn Proposition2.9”), 1452 (the SmoothBundlesConnections link), 1163–1219 and 2200–2256 (§3.7–§3.9, §8.1–§8.2 without `*Needs:*`), 2340–2359.

**Claim:** The blowup laws, the local node and marked monodromy comparison and the cubic pencil comparison are specified with their sources.

**Witness:** No theorem or page locator appears in §6.1–§6.3; the only readable Gompf–Stipsicz text (`gompfstipsicz`) ends at printed page 36, before §2.2 (p. 41) and §3.1 (p. 67) listed at `gompfstipsicz` lines 15 and 19. Wu and Thom classes are TangentialBordism 4.3 (`TauCetiRoadmap/TangentialBordism/README.md:829`), not 4.1–4.2. The group-reduction statement is Proposition 2.9.1, printed p. 36 (`freedmanquinn` line 1496), stated for poly-(finite or cyclic) groups and gropes of height at least 3. The heading at `TauCetiRoadmap/SmoothBundlesConnections/README.md:1844` is “Layer 8: Yang–Mills energy and its variational calculus”, whose anchor is `#layer-8-...`, not `#b8-...`. The References section lists neither Powell–Ray–Teichner, Gabai–Gay–Hartman–Krushkal–Powell, Tancer, Bastl et al., Rabin, Browder, Quinn (1988 and *Ends of maps I*), Marin, Lees–Lashof, Kirby–Siebenmann nor Farrell–Taylor–Wagoner, all cited inline.

**Repair:** Attach a theorem-and-page locator to each §6.1–§6.3 claim (Gompf–Stipsicz §2.2 and §3.1 may be cited `uncertified` by locator; the local node model may also cite TangentialBordism 2.7), add `*Needs:*` lines to §3.7–§3.9, §6.3, §8.1–§8.2, correct the three citations, and record every cited work once in `sources.toml` and the References section.

## R06 (P3) — Stale internal labels, an empty subsection and two definitions without their Checks

**Location:** `TauCetiRoadmap/FourManifolds/README.md:411`–415 (§3.1 is three lines), 1046, 1086, 1088, 1091, 1138, 1149, 1215 (“item1”, “item1b”, “1b.2”, “§3.3.2”, “item2”), 1317, 1331, 1354 (“§3.1's punctured smoothing”, which lives in §3.5), 1717–1821 (“G0”, “G1”, “G2” for §5.1–§5.3, colliding with GroebnerGeometry G1 at 1884), 101 (“comparison3”), 1955–2001 (“E1”), 2283–2284 (“Own the needed the … theorem theorem”), 314–407 (Layer 2 has no `### 2.n` subsections), 869–880 (“Define generic TOP immersed surfaces” has no Checks), 881–960 (the transversality block has no `*Needs:*` and no Checks).

**Claim:** The README is in TauCetiRoadmap form with every definition carrying its Checks and every target its dependencies.

**Witness:** The counts are 35 `*Needs:*` lines, 34 `**Checks.**` blocks and 29 API blocks against 19 `Define` sentences, so the shape finding of the previous review is largely repaired, but the labels above refer to a numbering that no longer exists, and the two definitions named carry no Checks.

**Repair:** Replace each stale label by the current `§k.n`; move the §3.1 sentence into §3.2 or give §3.1 content; split Layer 2 into `### 2.1`–`### 2.4`; add three Checks for generic TOP immersed surfaces (a transverse coordinate-plane pair with one double point, a plumbed normal neighbourhood with Euler number −1 against the product, a wild embedding that fails the sheet-chart condition) and a `*Needs:*` line and Checks for the map-transversality target (q = 5 avoidance, q = 1 collar input, expected preimage dimension 4 kept separate).

## Verified sound

:robot: Independent AI review. I read the whole README (2359 lines) and `Suggested.lean` (132 lines) at `c7b2a73`, checked the previous review's six findings against the new text first, then reviewed every section. I changed nothing in the pull-request worktree. The diff outside the folder is empty. The worker's gate passes every check; my own `lake env lean` of `Suggested.lean` succeeds in three seconds with exactly the four `sorry` warnings at lines 71, 95, 109 and 118.

The dependency command returned exactly:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. FourManifolds is entry 119; StringOrientation, SmoothBundlesConnections, PseudodifferentialOperators, TangentialBordism and HomotopySpheres are entries 6–9 and 64. IndexTheory is absent from the order and from main; it is consumed from its open new-roadmap head, which is permitted. The mechanical check sees only `*Needs:*` edges, so it cannot see R02's prose return supply or R03's duplication.

**Previous findings.** R01 (absent GT prerequisites): partly repaired; the contracts are now stated honestly with the ℤ[ℤ] coefficient corrected, but unowned (current R01). R02 (TangentialBordism duplication): repaired; lines 31–43 import the Fermat quartic, E(1), its node chart and the Lie Spin complement from TangentialBordism 2.7, and no “generator for TangentialBordism” sentence remains. R03 (exotic headline): repaired, `exoticFourSpace_exists` at Lean 118–128 with the native carriers. R04 (good groups): repaired; §3.2 defines good groups by the grope condition of `powellrayteichner` line 481, proves closure and subexponential growth, and states both disk theorems with the good-group hypothesis, with the (RP³×I)#(S²×S²) Check. R05 (locators): partly repaired, current R05. R06 (shape): largely repaired, current R06. No repair report marked any finding not actionable.

**Signatures.** A scratch file with `#check @` for all ten declarations elaborates; each elaborated type equals the README statement (seed polynomial and map, the quartic derivative theorem for every nonzero cone vector, the three Vandermonde quadrics, the linear and projective sign change, the Jacobian theorem with both hypotheses, the projective zero set, the no-fixed-point theorem, the exotic-space existential). No section binder is lost. One-tactic probes (`simp` with the definitions unfolded, `rfl`, `infer_instance`) fail on all four sorried theorems, so none is padding. The standard-atlas negative control `¬ IsEmpty (Diffeomorph … (EuclideanSpace ℝ (Fin 4)) (EuclideanSpace ℝ (Fin 4)) ∞)` is proved by `Diffeomorph.refl`.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Intersection form on torsion quotient | S⁴; Enriques | ranks 0 and 10; the order-two class pairs to 0 in ℤ; w₂ ≠ 0 survives before quotienting | pass |
| Signed signature | H; −CP² | inertia (1,0,1) gives 1−1=0; (0,0,1) gives −1 | pass; integer subtraction needed |
| §1.1 CP² ring | line, reversed | h²[CP²]=1, h³=0, h²[−CP²]=−1 | pass |
| §1.1 product form | S²×S² | a²=b²=0, a·b=1, det H=−1 | pass |
| §1.2 twisted bundle | S,F | Gram [[−1,1],[1,0]]; H=S+F: H²=−1+2=1, H·S=−1+1=0, S²=−1 | pass; diag(1,−1) |
| §1.3 sums | CP²#−CP², CP²#CP², M#S⁴ | σ=0, χ=4; σ=2; Δχ=2−2=0 | pass |
| §1.4 matrices | unknots 0,+1; Hopf | [0], [1], [[0,1],[1,0]] det −1 | pass |
| §1.5 boundary | [0],[2],[1] | coker ℤ, ℤ/2, 0; ker ℤ, 0, 0 | pass |
| §1.6 realization | framings 1,2 linking 1 | det(2−1)=1; inverse [[2,−1],[−1,1]] | pass |
| §1.6 E₈ | Cartan matrix | leading minors 2,3,4,5,4,3,2,1; det 1; σ=8 | pass; owner is HomotopySpheres 6B (R03) |
| Layer 2 π₃ of wedge | r=0,1,2 | ranks 0,1,3 = r+r(r−1)/2 | pass |
| Layer 2 attaching map | Q=[[1,1],[1,2]] | C=Q⁻¹=[[2,−1],[−1,1]]; QC=I; 2η₁+η₂−[ι₁,ι₂] | pass |
| Layer 2 isotropic splitting | H; diag(1,−1); diag(1,−2) | (1,0)²=0; (1,1)²=0; x²=2y² has no nonzero integral solution | pass; unimodularity essential |
| Layer 2 homotopy classification | GS Thm 1.2.25 | source: homotopy equivalent iff forms isometric (`gompfstipsicz` line 728); README adds the oriented refinement Q or −Q | pass |
| §3.2 λ(f,f) identity | one ± double point, e=0 | µ=±1, sym=±2, λ=±2; `powellrayteichner` line 290 | pass |
| §3.2 involution | π=ℤ | t+t⁻¹ invariant under t↦t⁻¹; orientation character trivial on oriented M | pass |
| §3.2 reduced µ | cusp | changes identity coefficient only; quotient by ℤ·1 (`powellrayteichner` lines 280–284) | pass |
| §3.2 good group | Def 3.2 | height-1.5 capped grope, labels mapped to 1 (`powellrayteichner` line 481); closure list line 114 | pass |
| §3.2 growth Checks | C₂, S₃, ℤ | balls ≤2, ≤6; 2n+1 | pass |
| §3.2 disk theorem | Theorem A | hypotheses λ(g_i,g_j)=0=µ̃(g_i), algebraic duals; conclusion locally flat embedding, geometric duals, same boundary framing (`powellrayteichner` lines 87–96) | pass |
| §3.2 C₂ Check | (RP³×I)#(S²×S²) | π₁=C₂ good; λ(f,g)=1, λ(g,g)=0, µ(g)=0 | pass |
| §3.2 FQ 5.2.1 | poly-(finite or cyclic) | source hypothesis (`freedmanquinn` line 3112); README cites it only for the Whitney argument | pass |
| §3.2 FQ 2.9 | locator | source is Proposition 2.9.1, height ≥3, p. 36 | R05 |
| §3.3 (δ,1)-connected | FQ 5.7 | relative 2-complex extension within δ (`freedmanquinn` lines 3214–3222) | pass |
| §3.3 Checks | tolerance 1/2, 1/8, strict 1/4 | 1/4<1/2 yes; 1/4<1/8 no; 1/4<1/4 no | pass |
| §3.4 Theorem 7.5 | hypotheses | simplicial NDR, good local π₁, δ-1-connected δ-h-cobordism, obstruction in H₁^lf(X;S(p)) (`freedmanquinn` lines 3854–3859) | pass |
| §3.4 Theorem 7.6 | over U^2ε, no handles over V^2ε | obstruction in H₁^lf(U^ε−V^ε;S(p)) (lines 3906–3914) | pass |
| §3.4 coefficients | groups 1, ℤ | Wh, K̃₀, K₋ᵢ all 0; L₅(ℤ)=0 but L₅(ℤ[ℤ])=ℤ | pass; owner R01 |
| §3.4 proper product | FQ 7.7.1–7.7.2 | finitely many stable ends, torsion-free poly-(finite or cyclic) (lines 3995–4011) | pass |
| §3.5 opened cobordism | W=(V×[0,1))∪(B×{1}) | H_c⁴(W)=ℤ, two boundary restrictions ±1; FTW Cor 4.9 needs simply connected at infinity (`farrelltaylorwagoner` lines 752–756) | pass |
| §3.5 8.15, 8.17, 8.19 | statements | sum-stable smoothing; 5-connected; no compact components (lines 4495–4502, 4640–4645, 4652–4656) | pass |
| §3.5 pseudo-isotopy | Gabai et al. 1.1, 1.3 | compact simply connected smooth; π₄(TOP(4)/O(4))=0 (`gabaietal` lines 45–46, 71) | pass |
| §3.5 normal bundles | FQ 9.6 | existence and uniqueness up to ambient isotopy, relative version (lines 4983–4988) | pass |
| §3.5 transversality | FQ 9.12.3 | exceptions: ambient 4; dimension-4 submanifold against codimension 1–2; expected intersection 4 (lines 5883–5887) | pass; matches README's three branches |
| §3.6 G/TOP | FQ 11.4 | π₂=ℤ/2, π₄=ℤ, trivial first k-invariant; H²(X;ℤ/2)⊕H⁴(X;ℤ) in dimension 4 (lines 7560–7566) | pass |
| §3.6 Checks | point, S², S⁴ | (0,0); ℤ/2 only; σ-defect 8 per generator | pass |
| §3.6 pinch | S²×S², CP² | ⟨w₂,α⟩=0 gives coefficient 1; =1 gives 0 | consistent |
| §3.6 knot filling | unknot, trefoil | Arf 0 vs 1; zero surgery on the unknot is S¹×S² | pass |
| §3.6 annulus | pin | `TauCeti.AnnulusConjecture 3` elaborates with `sorry` | R02 |
| §3.6 slice theorem | pin | `TauCeti.FreedmanSliceTheorem` elaborates with `sorry`; hypothesis π'' = π' ⇔ Δ ≐ 1 | R02 |
| §3.6 E₈ action | insert once, twice | Δσ=8,16 | pass |
| §3.7 realization | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0; odd admits both | pass |
| §3.8 killing normal invariant | b=0 | KS equality gives ⟨a²,[M]⟩=0 | pass |
| §3.9 E₈ caps | E₈, 2E₈ | σ=8 KS=1; σ=16 KS=0; −I₈ odd so not isometric | pass |
| §4.1 Spinᶜ | (−1,−1) | z²=1; character has kernel μ₂ | pass |
| §4.1 determinant | CP², S²×S², Enriques | 3h→5h; 0→2a; t+2t=t with lift changed | pass |
| §4.2 formula | CP² line; E₈; 2E₈ | (1−1)/8+0=0; 8/8=1; 16/8≡0 | pass |
| §4.2 Arf | torus | q=(1,1): q(a+b)=1, Arf 1; q=(0,0): q(a+b)=1, Arf 0 | pass |
| §4.2 Bastl 5.3 sign | characteristic c | source ks=Arf+(c²−σ)/8 (`bastletal` line 429); README uses (σ−F²)/8; equal mod 2 since integral | pass |
| §4.2 Freedman–Kirby | smooth | (K·K−σ)/8+Arf≡0 (`freedmankirby` line 116) | pass |
| §4.3 Pontryagin square | CP², S²×S² | P(h̄)=1; P(a+b)=0+0+j(1)=2 | pass |
| §4.3 coefficient map | j | j(1)=2, j(1)²=0≠j(1)=2 | pass; not a ring map |
| §4.3 half-spin | S⁴ | p₁=−2(−u+u)=0; e=u−(−u)=2u=χ·u | pass |
| §4.3 RP²×RP² | a,b order 2 | H⁴=ℤ/2 generated by ab; p₁=−4ab=0; λ=−2ab=0; (a+b)²=2ab=0 | pass |
| §5 energy | k | E=∫(|F⁺|²+|F⁻|²), 8π²k=∫(|F⁻|²−|F⁺|²), E=8π²k+2‖F⁺‖²; B=−tr matches SmoothBundlesConnections 8.1 `YM=∫|F|²` with no 1/2 | pass |
| §5 charge | SU(2) | c₂=tr(F∧F)/8π² for tr F=0 | pass |
| §5.1 index | S⁴, S²×S² flat | −3=0−3−0; −6=0−3−3; full H²=6 | pass |
| §5.1 Q₈ | Σ₂×Σ₂, a=i,b=j | [i,j]=−1, product of two commutators 1; b₁=8, b₂=18, b₂⁺=9; index −6; adjoint = three sign characters, each H¹(Σ₂)=2 so (0,6,0); Künneth (0,6,24,0,0); split 12+12 | pass |
| §5.1 Kuranishi | x=0 | κ(0)=0, Dκ(0)=0; Feehan–Leness §3.1 p. 16 (`feehanleness` line 666) | pass |
| §5.2 pointwise rank | su(2) | rank F + rank ψ ≤ 3 under orthogonality | pass |
| §5.2 budget | N=5, s=3 | q=6, ℓ=10; pinned Sard–Smale threshold is (dim ker)²+1 on an open set of a Banach space (`TauCeti/Analysis/Fredholm/SardSmale.lean:468`) | pass; README correctly separates the sharp theorem |
| §5.3 gluing source | FL Thm 3, Cor 5–7 | base any closed connected oriented smooth 4-manifold; hypotheses H²=H⁰=0, conformally flat ball (`feehanleness` lines 275–284, pp. 7–9) | pass |
| §5.3 reducible | c²=−1 | k=1, index 5, H⁰=1, H²=0 ⇒ H¹=6=ℂ³; link CP² | pass |
| §5.3 Donaldson | Q=−I_r | r pairs ±e_i; σ+r=0 | pass |
| §6 real blowup | fibres | over 0: RP¹; over (1,0): point; transition −1 | pass |
| §6.1 blowup | CP²; nine times | χ=4, σ=0; χ=12, σ=−8; (3H−ΣE)²=0 | pass; no locator (R05) |
| §6.1 discriminant | x²+y²; x²; 0 | no common projective zero; vanishes at [0:1]; zero equation excluded | pass |
| §6.2 node | u=z₁+iz₂, v=z₁−iz₂ | uv=z₁²+z₂²; Jacobian det −2i | pass |
| §6.2 fibre square | e=−2, one positive double point | −2+2=0; negative gives −4 | pass |
| §6.2 monodromy | a·b=1 | a↦a, b↦b+a: [[1,1],[0,1]]; inverse [[1,−1],[0,1]] | pass |
| §6.3 matrices | A,B,S | SAS⁻¹=[[1,0],[−1,1]]=B; AB=[[0,1],[−1,1]]; (AB)³=−I; (AB)⁶=I | pass |
| §6.3 abelianization | SL₂(ℤ) | ℤ/12; 12 nodal fibres for E(1), 24 for E(2) | pass |
| §7.1 indices | K3 | −(−16)/8=2; −(−16)/16=1; IndexTheory I7 line 865–871 states 8·ind=−σ and σ=−16α | pass |
| §7.1 ρ(T³) | complement σ=−8 | −8 mod 16 = 8; footnote 3 at `kirbymelvin` lines 463–467, p. 99 | pass |
| §7.2 E(n) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34); even form rank 8n+2(2n−1)=12n−2, σ=−8n; odd I_(2n−1,10n−1) σ=−8n | pass |
| §7.2 seed derivative | coordinate zero; all nonzero | any z_i=0 forces all zero; product of the four equations gives 81=1 | pass; theorem true |
| §7.2 seed Checks | e₀, e₂, (1,1,1,1) | dz₂; dz₁; value 4, derivative 4Σdzᵢ | pass |
| §7.3 Jacobian | v with ≤2 nonzero coordinates | (t_a−t_b)z_b²=0 forces a contradiction; on the zero cone ≥3 nonzero coordinates, Vandermonde rank 3 | pass; `hz` needed (e₀ has rank 1) |
| §7.3 Check vector | (i,√3,i√3,1,0,0) | squares (−1,3,−3,1,0,0); quadric values −1+3−3+1=0, −1+6−9+4=0, −1+12−27+16=0; minor 8·(i·√3·i√3)·2=−48 | pass |
| §7.3 freeness | fixed line | eigenspaces (z₀,z₁,z₂) or (z₃,z₄,z₅); Vandermonde dets for (1,2,3) and (4,5,6) both 2 | pass |
| §8.1 nonrecognition | Tancer | Theorems 1–2 p. 2, Prop 5 p. 3 (`tancer` lines 73–78, 131–135): deficiency 9, boundary H₂ free of rank 2k | pass |
| §8.2 bound | Q=Q′=[1]; rank 0 | v²≤1, solutions ±1; empty matrix | pass; Lemma 6.5 at `bastletal` line 598, p. 12 |
| §8.2 KS | +1 unknot | (1−1)/8+0=0 | pass |
| §8.3 headline | standard ℝ⁴ | `Diffeomorph.refl` refutes the IsEmpty conjunct; empty type not homeomorphic to ℝ⁴ | pass |
| §8.3 contradiction | K3 minus 3H | 2(−E₈): rank 16, σ=−16, even; −I₁₆ odd | pass |

That is 82 rows. No instance refuted a stated theorem; the findings are ownership, supply direction, duplication and locators.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Projectivization` and `mk` (`Mathlib/LinearAlgebra/Projectivization/Basic.lean:48`, 60), `submodule` (103), `mk_eq_mk_iff` (110), `map` (193, injective semilinear maps only); `ChartedSpace` (`Mathlib/Geometry/Manifold/ChartedSpace.lean:141`, no Hausdorff or second-countability axiom, supplied here by the homeomorphism); `IsManifold` (`.../IsManifold/Basic.lean:777`); `Diffeomorph` (`.../Diffeomorph.lean:82`); `TauCeti.IntegralLattice.ofIntegralForm` (`TauCeti/LinearAlgebra/IntegralLattice/Rationalization.lean:118`); `TauCeti.AnnulusConjecture`, `CoboundAnnulus` (`.../LocallyFlat/Annulus.lean:105`, 91); `TauCeti.IsLocallyFlat` (`.../LocallyFlat/Basic.lean:376`); `TauCeti.brownBicollaring` (`.../LocallyFlat/Brown.lean:39`); `TauCeti.FreedmanSliceTheorem` and `IsTopologicallySlice` (`TauCeti/KnotTheory/Slice/Freedman.lean:64`, `Slice/Basic.lean:277`); `TauCeti.PlumbingGraph`, `e8Plumbing`, `characteristicVectors` (as in R03); `TauCeti.parameterProj` (`TauCeti/Analysis/Fredholm/Parametric.lean`) and `isMeagre_image_criticalPoints_of_isFredholm` (`SardSmale.lean:468`).

**Cross-roadmap citations resolved** (main unless stated): AlgebraicTopology 8.5 `SimplyConnectedAtInfinity`, `endComponents`, `ConnectedAtInfinity`, `stableFundamentalGroupAtEnd`, `properWhiteheadSimplyConnectedCW`, `properStrongDeformationRetract_of_inverse` (`TauCetiRoadmap/AlgebraicTopology/README.md:1703`–1752); CharacteristicClasses C1.2a S0–S5 (331–343), C2 (550), C3 (720); AffineMorseLefschetz A0 (67), A4.0 (210), A5 (494), A6 (535); GroebnerGeometry G1 (63); IntegralLattices Layers 0, 1 and 6 (507, 590, 1641); ComplexKahlerGeometry K5, K5a, K7 (568, 33, 1405); TopologicalKTheory T1, T6 (163, 962); GeneralizedCohomology G4.0b, G5.0 (939–958, 39); SpinGeometry G4, G5, G6 (395, 504, 569); SeibergWittenTheory SW1 consumes F4 (15, 27); HeegaardFloer F0 (161); TangentialBordism head: 2.7 (517–578: Fermat quartic, E(1), node model, Lie Spin complement, σ=−8), 1.1 `finiteQuadraticArf` (152–189), 8.1–8.3 (1804–1872), 7.2 (1739), 4.1 (724: Pontryagin square assigned to FourManifolds at 738), 4.3 (829); SmoothBundlesConnections head: B1.5 Ehresmann (473), B8.1–B8.3 (1846–1972, FourManifolds F5 owner at 77 and 1944); PseudodifferentialOperators head P5–P7 (883, 1273 and later); IndexTheory head I4 (432), I7 items 2 and 5 (851–877); StringOrientation head S1.1–S1.2 with the three intended names (186–241); HomotopySpheres head 3C (477), 4B (648), 6C (1115), Stage 9 (1246), and 6B/7A–7C (R03).

**Ownership against open work.** `roadmaps grep` over the open heads for Pontryagin square, Enriques covers, Donaldson's theorem, Freedman's classification, Casson handles, Spinᶜ(n), E(2) and exotic ℝ⁴: TangentialBordism assigns the ℤ/4 Pontryagin square to FourManifolds; K3Surfaces K7 and EnriquesSurfaces U0 plan the general Enriques cover theory (both later or unordered, not citable), while §7.3 here is one explicit quadric model with polynomial statements, which is a legitimate example; CombinatorialHeegaardFloer mentions exotic ℝ⁴ only as literature. No second `Suggested.lean` declares any of the ten fully qualified names. The HomotopySpheres and pinned-Tau-Ceti duplications are R03.

**Sources read at their locators:** `powellrayteichner` (arXiv 2006.05209v3) Theorem A p. 2, §1.3 (1.1) p. 6, Definition 3.2 p. 9, closure p. 3; `freedmanquinn` (2013 reformat) 2.9.1, 5.2.1, §5.7, 7.5, 7.6, 7.7.1–7.7.2, 8.15, 8.17, 8.19, 9.6, 9.12.3, §11.4; `krushkalquinn` unnumbered theorem p. 408 (line 60); `feehanleness` (1910.14580v1) Theorem 3 p. 7, Corollaries 5–7 pp. 8–9, §3.1 p. 16; `kirbymelvin` §2(c) p. 99 footnote 3; `tancer` (2310.07421v2) Theorems 1–2, Proposition 5; `bastletal` (2411.08775v2) Theorem 5.3 p. 9, Proposition 5.6 p. 10, Lemma 6.5 p. 12; `gabaietal` (2311.11196v2) Theorems 1.1 and 1.3; `farrelltaylorwagoner` Corollary 4.9 p. 21; `gompfstipsicz` preview Theorem 1.2.25 pp. 14–15 and contents; `freedmankirby` (OCR) the characteristic-surface formula. Bastl et al. and Gabai et al. were fetched through the sources service from arXiv this round.

## Not verifiable

- **§6.1–§6.3 (seeded 6.2 and 6.3):** no locator is given and the only legal Gompf–Stipsicz text ends at printed p. 36; the blowup laws, the local node model and the cubic pencil are checked by instance only (R05).
- **`freedman1982`, `donaldson1983`, `gompf1983`:** the sources service reached only Project Euclid landing pages (Freedman recorded in the missing-reference file; Gompf and Donaldson failed on network trouble this round). Corollary 1.2 and §10 of Freedman, Donaldson's theorem and Gompf's Theorem 1.2 are cited by locator; their proof steps are not certified here. A Donaldson survey copy in the cache is not the 1983 paper.
- **Kirby–Siebenmann, Lees–Lashof, Quinn 1988 and *Ends of maps I*, Marin, Browder:** no readable legal text in the cache (the Kirby–Siebenmann scan is image-only without OCR); the transversality ranges, stable-germ definition and ambient surgeries are cited by locator only.
- The global shrinking, controlled-product, obstruction-gluing and continuation arguments are not proved by the instance table; the table checks their stated values and hypotheses.

## Source issues

- **Misprint** in tancer at Proposition 5(iii), printed p. 3: the source calls H₂ of the boundary a free product of copies of ℤ; it should say free abelian group of rank 2k; affects a stated result.
- **Misprint** in bastletal at the proof of Lemma 6.5, printed p. 12: the source refers to the result as Proposition 6.5; it should say Lemma 6.5; affects nothing.
- **Gap** in freedmanquinn at Theorem 8.17, printed p. 134: the source attributes the i = 5 vanishing to a reference whose replacement criterion is not justified; it should cite the stable pseudo-isotopy route of Gabai–Gay–Hartman–Krushkal–Powell, Theorem 1.3; affects the proof; corrected in print at arXiv 2311.11196, Theorem 1.3.
