# Review of TangentialBordism (pull request #942 at 993f5f4)

**Verdict:** needs changes

Full review of the head (231 changed lines since ef08ea4). Of the previous review's seven findings, five are repaired by this head (R01–R05 of ~19: the B1.6 source class, the two stated Sard theorems, the Hatcher §4.L locators, the deleted IntegralLattices row with the `sigPos`/`sigNeg` contract, the 4.4 Check wording). The two description findings (~19 R06, R07) are unchanged and are the only findings of this round; both are P3 and have one common repair. The seeded sample (15 targets), the adversarial pass, the elaboration, the signature and padding probes and the dependency check found nothing else.

## R01 (P3) — AlgebraicTopology 8.13 exists only at #1663, which the description does not name

Re-raised: ~19 R06 (~18 R01, ~17 R04). Not repaired: the description's revision paragraph still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:85–86`: "For boundaryless sources the smoothing, parametric and relative transversality theorems are AlgebraicTopology 8.13's". Also cited at `:319`, `:496`, `:526`, `:547`, `:569`, `:614` and `:3104–3108`.

**Claim.** Every id this roadmap cites that only an open revision defines is named in the description or its merge-order paragraph.

**Witness.** "8.13" occurs 0 times in AlgebraicTopology on main (4daf5e1) and 0 times at #1652 (287181d). At #1663 (bc3d150) it occurs at `README.md:69–77` ("Stage 8.13 … TangentialBordism B1.6 consumes these three for boundaryless sources and extends them to sources with corners") and `:2925` (the 8.13 row of the stage table); its smoothing target at `:2630–2634` is stated for "a boundaryless sigma-compact Hausdorff second-countable smooth manifold M", the hypotheses this README's `:319` repeats. The description names #1652 only.

**Repair.** No README change. One description edit, shared with R02: write the revision paragraph as "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8), then #1663 rebased on #1652 (AlgebraicTopology 8.13)". The paragraph sits in the worker-maintained `revision-deps` block; regenerating it from the current overlap data, which already lists #886, and adding #1663 by hand is enough.

## R02 (P3) — DifferentialGeometry 5.5b exists only at #886, which the description does not name

Re-raised: ~19 R07 (~18 R02, ~17 R05). Not repaired: same paragraph.

**Location.** `README.md:320`: "5.5b's smooth face structure and face-indexed abstract boundary of a manifold with corners". Also at `:78–80`, `:413–414`, `:462`, `:483`, `:501–502`, `:545`, `:577`, `:614`, `:626`, `:693`, `:741`, `:765`, `:840` and `:932`. This head makes 5.5b a hypothesis of the corner Sard and transversality theorems (`:410–416`), so the dependency is now load-bearing.

**Witness.** "5.5b" occurs 0 times in DifferentialGeometry on main and at #886 (e7464d1) at `README.md:38`, `:69`, `:83` ("smooth face structure data (5.5b)") and `:93`. `scratch/overlaps.md` lists the same lead for lines 614 and 840: "#886 defines it … main does not: that pull request must merge first". The description names #1652 only.

**Repair.** The single description edit of R01.

## Previous findings (~19)

- **R01 (B1.6 scoped to face-structured sources): repaired.** `:408–416`: "Each is a smooth statement on Hausdorff manifolds over finite-dimensional real models with corners in Mathlib's sense … The statements whose routes run through face strata … assume in addition that the source is boundaryless, is modelled on the half-space, or carries DifferentialGeometry 5.5b's smooth face structure … The smoothing theorem assumes no face data." The Sard bullet (`:450–463`) names the three source classes, the transversality bullet (`:499–503`, `:544–546`) and the relative theorem (`:569–570`) the same classes, and `exists_contMDiff_homotopicRel` keeps an arbitrary `I` (`Suggested.lean:70–82`). The disc model I used as the witness is now covered: `:603` says a manifold on the closed unit disc "can be given that face structure", and the cone model is the new non-example.
- **R02 (unequal-dimension Sard stated): repaired.** `Suggested.lean:90–100` states `isNullSet_image_criticalPoints_of_boundaryless` and `:108–116` `isNullSet_image_criticalPoints_halfSpace`, the second with the probe's exact signature; the README names both (`:458`, `:460`) and the docstring (`:30–32`) names the face-structured corner case as not statable, "the pins have no face structure on a manifold with corners".
- **R03 (Hatcher §4.L locators): repaired.** `:1114–1127` and `:1222–1223` cite properties (1)–(7) p.489, Theorem 4L.12 p.504, the Adem relations p.496, Theorem 4L.13 p.506, the Pⁱ properties pp.489–490 and Theorem 4L.16 p.513, and Medina-Mardones Definition 1 with (5), p.6, and Definition 2, p.7, for the cup-i formula; all verified below.
- **R04 (IntegralLattices row): repaired.** "IntegralLattices" occurs 0 times. The signature contract moved to From Mathlib (`:151–154`) and B1.7's *Needs:* (`:924`) cites `sigPos` and `sigNeg`. At the pin these are root-level names (`Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:41`, inside `section LinearOrder` with no namespace; the file's own docstring writes `QuadraticForm.sigPos`, but `#check @QuadraticForm.sigPos` fails and `#check @sigPos` elaborates to `QuadraticForm R M → ℕ`), so the README's unqualified names are the right ones.
- **R05 (4.4 Check): repaired.** `:1271–1273`: "the second exterior generator P^1βι₂, after βι₂ in degree3, lies in degree 3+2(3−1)=7".
- **R06: not repaired.** See R01.
- **R07: not repaired.** See R02.

## Verified sound

### Gate, dependency check, elaboration and probes

- **Gate.** The worker's record at 993f5f4 passes every check, `build=0` included. My rerun with `--base origin/main` at the same head:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
- **Dependency check** (`--movable`):

  ```text
  depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). No forbidden supplier is cited; DGFloer, DGAInfinity, AffineMorseLefschetz, GeneralizedCohomology, CharacteristicClasses, TopologicalKTheory, ClassifyingSpaces, RiemannianGeometry, SpinGeometry, LieHighestWeight, LieGroups and SpinRepresentations are on main.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/TangentialBordism` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.AT"`).
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 7 s with exactly six `sorry` warnings (`:70`, `:90`, `:108`, `:124`, `:153`, `:171`) and nothing else.
- **`#check @` probe** on all six declarations: each elaborated type matches `scratch/signatures.md` and its README statement. The boundaryless Sard theorem carries `[BoundarylessManifold I M] [LindelofSpace M]` and `[MeasurableSpace E'] [BorelSpace E']` on the target model, with no relation between `E` and `E'`; the half-space one carries `[NeZero n]`, `[IsManifold (𝓡∂ n) ∞ M]`, `[LindelofSpace M]` and the same target binders. The file has no section `variable`s, so no binder can be lost; the "structure `,`" entry of `signatures.md` is the docstring phrase at `:151`, not a declaration. `Rep.FiniteCyclicGroup.groupHomologyIsoEven` (10.1) and `ChartedSpace.secondCountable_of_sigmaCompact` (From Mathlib) elaborate with the hypotheses the README states (`[NeZero i]`, `Even i`; `[SecondCountableTopology H] [SigmaCompactSpace M]`).
- **Padding probe.** Each `sorry` replaced by `first | simp | infer_instance | rfl | trivial | aesop` on a scratch copy: all six fail (`aesop` makes no progress at `:82`, `:100`, `:116`; goals unsolved at `:144`, `:165`, `:178`). Nothing is padding; no declaration restates a definition or a Check.
- **Lean form.** One module docstring naming the roadmap and every not-statable headline with its missing carrier; `namespace TauCetiRoadmap.TangentialBordism`; Layer 2 and Layer 8 section comments in README order; a docstring on every declaration; `theorem` only; no `set_option`, no `lemma`, no `#eval`; `import Mathlib` plus six `TauCeti.*` modules, all existing at the pin and all used (`Measure` and `RegularValue` are the two added for Sard). `roadmaps grep --lean-only` finds the six names in no other roadmap.
- **Duplication of the Sard theorems at the pin.** `TauCeti/Geometry/Manifold/Sard/` holds only `EqualDimension.lean` (`isNullSet_image_criticalPoints` `:105` and `dense_isRegularValue` `:112`, both with `hdim : finrank ℝ E = finrank ℝ E'`) and `Meagre.lean` (`ContMDiff.isMeagre_image_criticalPoints` `:114`, meagre conclusion). The flat input `addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`) takes `ContDiffAt` at every point of `U` and `(finrank E)²+1 ≤ n`, as the README says. `IsNullSet` (`Measure.lean:36`) is "null in every extended chart for every additive Haar measure on the model"; `IsRegularPoint` (`RegularValue.lean:86`) is surjectivity of `mfderiv`. `isManifold_boundary` (`Boundary/Charts.lean:321`) and `isSmoothEmbedding_subtypeVal_boundary` (`:374`) both take `hk : k ≠ 0` and are stated for `𝓡∂ (n+1)`, as the README's From Tau Ceti says. No open roadmap owns unequal-dimension manifold Sard: `roadmaps grep -i sard` finds HomotopySpheres #1287 (`:113`, `:483`) and AlgebraicTopology #1663 (`:74`) citing TangentialBordism B1.6 as its owner, and GeometricTopology #903 (`:1298`) citing its own Layer 1.7.1 for the classical statement only.

### Seeded sample (15 targets)

Cached texts whose ids are not in the manifest are cited by hash prefix: `4f8edd74` Milnor–Stasheff (TeXromancers edition), `c70bf1f2` Miller, `b27fcec7` Guillou–Weibel arXiv v1, `f8087fb9` Baez arXiv v4. The two fetches went through the sources service; the manifest was restored to its pre-fetch state afterwards, since this review edits no manifest.

| Target | Locator | Text at the locator | Result |
| --- | --- | --- | --- |
| 3.4 (B2.4) | AlgebraicTopology Layer 6 relative fundamental classes and duality; B1.6 | AT #1652 `:1655` Layer 6, `:1991` 6.3 "Homological orientation and fundamental classes", relative fundamental class at `:90`, `:3120`, `:3605` | Pass |
| 4.1 (B4.1) | Hatcher §4.L (1)–(7) p.489, 4L.12 p.504, Adem p.496, 4L.13 p.506; Medina-Mardones Def. 1/(5) p.6, Def. 2 p.7; MS Ch.8 pp.100–101, §8.1 | hatcherAT lines 21051–21061 (folio 489 at 21048), 21777 (folio 504 at 21741), 21409–21411 (folio 496 at 21387), 21864 (folio 506 at 21829); medinaMardonesCupI lines 239–248 (page 6), 266–273 (page 7); `4f8edd74` lines 2499–2534 (folios 100 at 2507, 101 at 2535: the four properties and w_i=φ⁻¹Sqⁱφ(1)), 2538 "8.1 Verification of the Axioms" | Pass |
| 4.2 (B4.2) | Guillou–Weibel v1 Thm 6.2 p.18 at ℓ=2; Miller Ch.1 Thm 11.2 | `b27fcec7` lines 748–759 (Def. 6.1 ℓ-simple system; Thm 6.2: V free graded-commutative on τ(x_i) and, for ℓ≠2 and even x_j, on τ(y_j⊗x_j^(ℓ−1)); page 18 at 726), 760 (proof is McCleary 6.21); `c70bf1f2` line 1142 "Theorem 11.2 (Milnor)" | Pass |
| 4.4 (B4.7) | Hatcher Pⁱ (1)–(6) pp.489–490, Adem p.496, 4L.16 p.513; GW Thm 6.5(1)–(3) p.19, Def. 6.1, Thm 6.2 p.18 | hatcherAT 21083–21093 (folio 490 at 21087), 21410–21411, 22197 (folio 513 at 22164); `b27fcec7` 784–788 (page 19 at 765): β(x) transgresses to −β(y), Pᵃ(x) to Pᵃ(y), x^(ℓ−1)⊗y to −Qₐ(y) | Pass |
| 5.3 (B5.3) | Thom IV.8 p.75; StringOrientation S2.2; GeneralizedCohomology G2.10; CharacteristicClasses C1 | thom1954 line 2462; SO #948 `:551` "2.2 Geometric String bordism (S2.2)"; GC main `:542–562` `MappingPathSpace`; CC main `:212` C1 | Pass |
| 5.5 (B5.5) | Miller Ch.2 §1 Thm 1.4 p.41; Ch.1 §1 pp.1–2; Ch.1 §5 pp.12–14; S2.3 | `c70bf1f2` 1565–1566 (Thm 1.4 (Thom), Ω^G_*(X)≅MG_*(X); folio 42 at 1568, so p.41), 95–104 (pp.1–2), pages 12–14 at markers 17–19 (lines 451–522); SO #948 `:607` | Pass |
| 5.6 (B5.6) | GC G4.3, G5.1–G5.2, G5.3 | GC main `:1224` item 3 "Orientation data and Thom isomorphism" (G4.3), G5 items 1–3 "Finite spectra and Spanier–Whitehead duality", "Geometric duality adapter", "Thom spectra from diagrams" | Pass |
| 5.7 (B5.7) | Hatcher SS Ch.1 §1.1 pp.18–19 | hatcherSS 997–1011 (page 18: general homology theories, finite-dimensional B, E²=H_p(X;h_q(point))), 1012 Naturality | Pass |
| 6.1 (B4.4) | Miller Ch.1 Thms 12.3–12.4 pp.32–34 | `c70bf1f2` 1239 (12.3: H*MO free over A), 1261 (12.4: weak equivalence to a wedge of HF₂'s); markers 37–39 at 1221–1292 = printed 32–34 | Pass |
| 6.2 (B4.5) | Thom IV.10 and Cor. IV.11 p.77 | thom1954 2528–2529 (all SW numbers zero ⇒ mod 2 boundary), 2538–2539 (equal SW numbers ⇒ cobordant mod 2), folio 77 at 2545 | Pass |
| 6.3 (B4.6) | MS Problems 16-D–F pp.203–204 | `4f8edd74` 5357 (16-D, folio 203 at 5365), 5370–5372 (16-E, m,n≥2, −(m+n)!/m!n!), 5379–5383 (16-F, real (1,1) hypersurfaces, Yⁿ orientable for n odd; folio 204 at 5390) | Pass |
| 7.1 (B3.0) | ABS §§10–11; SpinGeometry G5.0, G6.0; GC G3.8, G5.5; IndexTheory I2.5, I5.4; PDO P5–P6 | ABS not verifiable (below); SpinGeometry main `:506` `realCliffordSpinorBundle`, `:569` G6; GC `:797` `spectrumConnectiveCover`, `:2084` `realMixedCliffordIndexClassification`, `:2099` `realNegativeCliffordFamilyIndex`; IT #1077 `:648` I2.5, `:1187` I5.4; PDO main `:927` P5, `:1484` P6 | Pass (ABS not verifiable) |
| 7.2 (B3.4) | Beaudry–Campbell Thm 5.1.1, Cor. 5.1.2 p.42, Remark 3.2.2 p.18, Fig. 31 p.41; SpinGeometry G6.7; IndexTheory I7.2, I7.5; S5.3 | beaudryCampbell 1770–1776 (page 42 at 1766: H*(MSpin)≅A⊗_{A1}(ℤ/2⊕M), M zero in degrees t<8; Ext iso for t−s<8), 792–796 (page 18: H*(ko)≅A//A1), 1741 (MSpin row ℤ, ℤ/2, ℤ/2, 0, ℤ; Figure 31 at 1752, page 41); SpinGeometry `:831` `realSpinDiracIndexClass = α·a`; IT #1077 `:1371` I7.2, `:1514` I7.5 with σ(M)=−16α at `:1530`; SO #948 `:1158` S5.3 | Pass |
| 8.5 (B3.5) | MS §16.3 p.194; Lee 21.10, 21.13 | `4f8edd74` 5076–5078 (folio 194 at 5087): CP^(2n+1) bounds the disc bundle associated to a bundle over quaternionic projective space (the source writes "circle-bundle", see Source issues; the README's "S² fibre" is the correct one); Lee paywalled | Pass (source error noted) |
| 9.2 (B3.7) | Baez §§3.4, 4.2; LHW Layer 8; LieGroups Layers 2, 4; SpinRepresentations Layer 7; `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`; `TauCeti.realCliffordForm` | `f8087fb9` 1297 "3.4 OP2 and the Exceptional Jordan Algebra", 1425 (trace-1 projections are the points), 1356 (Spin(9)⊆Aut), 1768 "4.2 F4"; LHW main `:1197` Layer 8 with `compactAlbertAlgebra` `:1333` and the derivation names `:1363–1385`; LieGroups `:356` Layer 2 (closed-subgroup theorem), `:463` Layer 4 (Lie's third theorem, equivalence of categories); SpinRepresentations `:881` Layer 7 (real Clifford algebras, Bott periodicity, Spin(p,q)); `Geometry/Lie/Subgroup/Embedded.lean` and `LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:113` at the pin | Pass |

The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `isNullSet_image_criticalPoints_of_boundaryless` | pt→ℝ²; projection ℝ²→ℝ; M=∅; dim N=0; I the half-space model with M boundaryless | critical set = pt, image one point, null; no critical point, image ℝ not null but not claimed; empty image null; mfderiv onto the zero space, critical set ∅ (a Haar measure on {0} is a point mass, so only ∅ is null, and ∅ is what is claimed); chart images lie in the open interior of range I, so the flat theorem's `ContDiffAt` hypothesis holds | Pass |
| `isNullSet_image_criticalPoints_halfSpace` | n=1, M=[0,∞), f(t)=t², f(t)=t; n=1 into a 0-dimensional N; non-Lindelöf ℝ²_δ×[0,∞) | critical values {0} ⊂ {f(0)} ∪ crit(f on interior) = {0}; f(t)=t: boundary point regular for f, critical for f|{0}, so the inclusion crit(f) ⊆ ∪ crit(restrictions) holds and its converse fails, as `:605` says; into a 0-dimensional N every point is regular; the discrete-plane example has critical values all of ℝ², excluded by `[LindelofSpace M]` (`:602`) | Pass |
| Lindelöf ⇒ second countable (route `:476–477`) | half-space charts | a Lindelöf space covered by second-countable open chart domains has a countable subcover, hence a countable base; boundary and interior strata are then Lindelöf | Pass |
| flat input order | k=∞ | `((finrank E)²+1 : ℕ∞ω) ≤ ∞` holds for every E | Pass |
| `exists_contMDiff_homotopicRel` | M=∅; C=U=M with f smooth; M=P=S¹, f=id, C=∅; the cone model | g=∅; g=f, constant homotopy; a smooth g≃id has degree 1, constant maps degree 0; `Continuous.exists_contMDiff_approx_and_eqOn` takes any `(I : ModelWithCorners ℝ E H)`, so the cone source (`:603`) is covered | Pass |
| cone model (`:486–490`, `:603`) | closed cone z≥√(x²+y²) | convex with nonempty interior, so `UniqueDiffOn` and `range ⊆ closure (interior range)` hold and it is a legal model; the tangent cone at the vertex is a round cone, the quadrant's tangent cones are polyhedral, and a C¹ diffeomorphism carries tangent cones linearly, so no face chart exists at the vertex | Pass |
| `orientedThreeManifold_parallelization` | ℍ³ coordinate frame; first vector negated; RP²×ℝ; ∅ | det 1; det −1, excluded; no oriented atlas exists, so `hA` is false; the empty frame | Pass |
| `closedOrientedManifold_isOrientedBoundary` | n=1 S¹ with ±o; n=2 genus g; n=3 T³; n=0; n=4 | D² and −D² (`boundaryOrientation_neg`); handlebody; T²×D²; a point has signed count 1≠0, excluded by 1≤n; σ(CP²)=1≠0, excluded by n≤3 | Pass |
| `closedManifold_isBoundary` | n=1; n=3; zero set of ΩO_n, n≤7 | S¹⊔S¹ bounds D²⊔D²; RP²×S¹ bounds RP²×D²; ΩO₀=F₂, ΩO₂=F₂, ΩO₄=F₂², ΩO₅=F₂, ΩO₆=F₂³, ΩO₇=F₂ (Thom pp.79–80), so {1,3} is exactly the zero set below 8 | Pass |
| 3.4 witness invariance at n=1 | W=[0,1]; W=S¹; unoriented W=[0,1] | ∂[W,∂W]=[1]−[0] ↦ 0 in H₀(W), signed count −1+1=0; no boundary, 0; two points, even | Pass |
| 3.4 degree-zero isomorphisms | k(+pt); {+,−}; Spin point signs | right inverse k; the pair bounds an arc; ΩSpin₀=ℤ by σ, forgetting to O sends k to k mod 2 | Pass |
| 3.4 RP² Check | two projective lines | a·a=a²≠0 in H*(RP²;F₂), one transverse point, [pt]≠0 in ΩO₀=F₂ although w₁(RP²)=a≠0 | Pass |
| 4.1 chain equation | i=1; the edge [0,1] | dD₁+D₁d=(1−T)AW; AW−T·AW=d(−[0,1]⊗[0,1]); over F₂ this is Medina-Mardones (5) with Δ₀=AW | Pass |
| 4.1 squares | a∈H¹(RP∞); a² | Sq¹a=a², Sq²a=0 (instability); Sq¹(a²)=2a³=0, Sq²(a²)=a⁴ (Cartan); Sq^k[c]=[c⌣_(n−k)c] is Definition 2 with [α]↦[(α⊗α)Δ_(n−k)] | Pass |
| 4.2 Adams bidegree | d₂ on (s,t)=(1,2) | d_r has bidegree (r,r−1), so (1,2)↦(3,3) and t−s drops 1→0 | Pass |
| 4.2 completion vs tensor | ℤ/2^∞ | classical: lim (ℤ/2^∞)/2ⁿ=0; derived: L₀=Ext(ℤ/2^∞,ℤ/2^∞)=0 (divisible target), L₁=Hom(ℤ/2^∞,ℤ/2^∞)=ℤ₂, so π₁ of the completed Moore spectrum is ℤ₂ | Pass |
| 4.2 simple system | F₂[a] | a^n = ∏ a^(2^i) over the binary digits of n, unique, so a, a², a⁴,… is a simple system; a⁴ is the next element, not 0 | Pass |
| 4.4 Kudo degrees | general k,p; p=3,k=1 | y^(p−1)⊗z in (2k+1, 2k(p−1)); r=2k(p−1)+1 lands in (2kp+2, 0); |βP^k z|=2k+1+2k(p−1)+1=2kp+2; p=3: 8; P¹βι₂ in 3+4=7, βι₂ in 3 | Pass |
| 4.4 signs | τβ=−βτ; z of degree 3 | GW 6.5(1): β(x) transgresses to −β(y); z²=(−1)^9 z²=−z², so 2z²=0, z²=0 for p odd, vacuous at p=2 | Pass |
| 4.4 p-simple monomials | p=3: y⁴, y⁹ | y⁴=y·y³ has digits (1,1) on the system y, y³, y⁹; y⁹ is the next element; neither is 0 in F₃[y] | Pass |
| 4.4 Milnor degrees | ξ_i, τ_i, Q_i | |ξ_i|=2(p^i−1), |τ_i|=2p^i−1, Q₀=β of degree 1, Q₁=P¹β−βP¹ of degree 2p−1 | Pass |
| 5.2/5.3 regression | n=0, k=1, B={a,b} | Th=S¹∨S¹; a+,b+,a−,b− gives aba⁻¹b⁻¹≠1 in F₂; a+,a−,b+,b− gives 1; abelianised counts (0,0); B a point: degree one ↦ one positive framed point; constant map ↦ ∅ | Pass |
| 5.5 degrees | +pt, −pt, ∅, ∂[0,1] | +1, −1, 0, 1−1=0 in π₀S=ℤ | Pass |
| 5.6 shifts | i=(g,j):N^d→P^e×ℝ^r; id; pt→S¹; stabilize by one | rank ν_i=r+e−d from ν_i⊕TN≅g*TP⊕ε^r; n+r−(r+e−d)=n+d−e; d=e gives 0; d=0,e=1 gives −1 and a degree-one circle cycle has one positive preimage; r+1 and r+1+e−d give the same d−e | Pass |
| 5.7 Checks | X=pt; total degree 0; two components | E²=H_p(pt;Ω_q)=Ω_q at p=0 only; only (0,0) for connective coefficients; H₀({x,y};Ω₀)=Ω₀² | Pass |
| 6.1 multiplicities | degrees 0–4 | monomials in x₂,x₄,x₅,x₆,…: 1; 0; 1 (x₂); 0; 2 (x₄, x₂²); π₀MO=F₂ and 2·id_MO≃0 through the unit | Pass |
| 6.2 numbers | RP²; S²; degree 0 | w(RP²)=(1+a)³=1+a+a²: w₁²[RP²]=w₂[RP²]=1; w(S²)=1: 0, 0; empty partition evaluates 1 on a point, 0 on ∅ | Pass |
| 6.3 Newton numbers | H_R(2,4); H_R(1,2); general r,s; orientability | d=5=2·3−1, m=2, n=4, binom(6,2)=15≡1; H_R(1,2): w=(1+x)²(1+y)³(1+x+y)⁻¹=1+x+xy+y² with x²=y³=0, so w₁²[H]=⟨x²(x+y),[RP¹×RP²]⟩=0 while binom(3,1)≡1, as the Check says; Lucas: binom(2^r(2s+1),2^r)≡binom(2s+1,1)≡1; w₁(TH)=mx+ny≡0 for m,n even | Pass |
| 7.1/7.2 genus | K3; K3×K3; Lie circle; sign consistency | Â=−p₁/24=48/24=2, c(α)=2u²=c(a), α=a; α(K3×K3)=a²=4b, onto at odd p; η∈KO₁=ℤ/2 with KU₁=0; α(M)=k·a with 2k=Â=−σ/8 gives k=−σ/16, matching σ=−16α_ℍ and `realSpinDiracIndexClass=α_ℍ·a`; complex K3: σ=−16, k=1 | Pass |
| 7.2 low groups | n<8, n=8; p odd | π_nMSpin and ko_n both ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0 (BC Fig. 31 and A//A(1)); degree 8 onto since the Bott manifold has Â=1; H^+(BC₂;F_p)=0 for p odd and π₁MSpin=ℤ/2≠0=π₁MSO at 2 | Pass |
| 8.5 dimensions and degrees | γ_C^⊗2 on CP^(n−1); Im End_H(γ_H) on HP^(n−1); n=1; Hopf derivative | v↦v⊗v identifies ±v, boundary S^(2n−1)/±1=RP^(2n−1), total dimension 2(n−1)+2=2n; fibre S²=CP¹ since (4n−2)−(4n−4)=2, total dimension 4(n−1)+3=4n−1; D² and D³; at q=1+j(x+iy)=1+jx−ky the first-order change of q i q⁻¹ is x(ji−ij)+y(jii−iji)=−2xk−2yj, a matrix with det −4<0 in the oriented (j,k) plane, degree −1; (−1)^(n−1)·(−1)=(−1)^n gives +1 at n=2, −1 at n=1 | Pass |
| 9.2 Clifford relations | (t,a)·(x,y)=(tx+ay, āx−ty) | (1,0)² = id; (0,a)²=N(a)·id; (0,a)(0,b)+(0,b)(0,a)=2⟨a,b⟩·id; (1,0) and (0,1) anticommute: (y,−x) vs (−y,x); positive Clifford relation, matching `realCliffordForm 9 0` | Pass |
| 9.2 volume witness | C₀C₁⋯C₈ on (1,0), Cayley–Dickson product (a,b)(c,d)=(ac−d̄b, da+bc̄) | the nested product equals e₁ē₂e₃ē₄e₅ē₆e₇ē₈ with four conjugations of imaginary units, hence e₂(e₃(e₄(e₅(e₆(e₇e₈))))); e₇e₈=(kj,0)=(−i,0), e₆(−i,0)=(0,−1), e₅(0,−1)=(1,0), then k, jk=i, i·i=−1: (1,0)↦(−1,0); negating C₈ flips the sign; Cl(9,0)≅ℝ(16)⊕ℝ(16) has exactly two 16-dimensional modules distinguished by the volume sign | Pass |
| 10.1 cyclic homology | m=3, i even | `groupHomologyIsoEven` needs `[NeZero i]`, `Even i`; the complex ℤ→ℤ→ℤ with 1−g=0 and norm m has middle homology ker(m)=0; odd degrees give ℤ/m | Pass |
| 10.4 Newton numbers | n=2, r=0; n=3, r=0,1 | −2(binom(4,2)−1)=−10; −2(binom(6,2)−1)=−28, gcd 28=2²·7 with a=2 at n=3=2²−1 | Pass |
| Supplier layering | B5.4 → S2.2 → S2.1 → EllipticCohomology E5 | unchanged from ~19: S2.2 *Needs:* S1.2, S2.1, G5, DGFloer, GT1, C2 (#948 `:551–575`); S5.3 uses the K(ℤ/2,1) fibre, DGFloer items 2 and 4 and C2, not F3–F5 (#948 `:1173–1186`) | Pass |

### Cross-roadmap citations resolved

- **Main (4daf5e1):** DifferentialGeometry 2.1–2.2 (`:345–356`); SpinGeometry G4 (`:395`), G5.0 (`:506`), G6 (`:569`), G6.7 (`:831`); GeneralizedCohomology G1.1 (`:136`), G2.10 (`:542–562`), G3.3 (`:710`, "Arbitrary-CW comparison theorem"), G3.8 (`:797`), G3.9 (item 9), G4.0a, G4.3 (`:1224`), G5.0–G5.5 (items 0–5 from `:1375`); CharacteristicClasses C1 (`:212`), C1.3 (`:664`), C1.4 (`:682`), C2 (`:728`), C3 (`:1000`), C3.3, C3.6 (`:1394–1412`), C6 (`:1731`), C7.3a (`:1936`, `:2002`); TopologicalKTheory T5 (`:1107`), T7 (`:1517`); PseudodifferentialOperators P5 (`:927`), P6 (`:1484`); ClassifyingSpaces Stage 4 (`:222`, `groupHomology` at `:238`); RiemannianGeometry R1 (`:179`, HP^d metric at `:280`); DGFloer Layer 1 (`:451`, Serre spectral sequence items at `:142`, `:226`); LieHighestWeight Layer 8 (`:1197`); LieGroups Layers 2 and 4 (`:356`, `:463`); SpinRepresentations Layer 7 (`:881`); AffineMorseLefschetz and BordismFormalGroups present.
- **Open heads:** StringOrientation #948 (07f0981): S1.3 (`:366`), S1.5 (`:458`), S2.2 (`:551`), S2.3 (`:607`), S5.3 (`:1158`). IndexTheory #1077 (6d85f5d): I2.5 (`:648`), I5.4 (`:1187`), I7.2 (`:1371`), I7.5 (`:1514`, σ=−16α at `:1530`). GeometricTopology #903 (5859c0d): 1.1 (`:788`), 1.3 (`:851`), 1.5 (`:974`), 4.3.1 (`:2430–2441`: symplectic-basis Arf, basis independence, plane decomposition, classification, Gauss sum and zero count, every item of the README's contract `:334–347`), 11.3. AlgebraicTopology #1652 (287181d): Layers 2 (`:704`), 4 (`:913`), 6 (`:1655`), 6.3 (`:1991`), 8 (`:2610`). AlgebraicTopology #1663 (bc3d150): 8.13 (R01). DifferentialGeometry #886 (e7464d1): 5.5b (R02). FourManifolds #936 cites TangentialBordism B4, B1.7, B3.2(b)–(c) and 5.2 (`:53`, `:449`, `:585`, `:627`, `:803`) and owns the Pontryagin square (`:2096`), as this README's `:1085` says. HomotopySpheres #1287 (ec8d4d7) cites B1.6's Sard theorem (`:113`, `:483`, `:3201`).
- **Declared gap.** No readable `plan.json`; `gap:finite-quadratic-arf` reads as a citation of GeometricTopology 4.3.1 at #903, which the description links, and 4.3.1 states every item of the contract.
- **Overlaps.** No open pull request changes this roadmap or drops an id it cites. The "only an open revision defines" leads are #1652 (named in the description) and #886 (R02); 8.13 at #1663 is R01.

## Not verifiable

- **Lee**, *Introduction to Smooth Manifolds*, Theorems 6.10, 6.26, 6.35, 6.36 (2.1) and 21.10, 21.13 (8.5): Springer, paywalled; the statements are standard and the pinned declarations carry the hypotheses the README states.
- **Atiyah–Bott–Shapiro**, *Clifford modules*, §§10–11 (7.1, sample): the previous round's service query found DOI prefix 10.1016 paywalled and the institutional mirror in no licence class; not re-queried this round.
- **McCleary**, *A User's Guide to Spectral Sequences*, Theorem 6.21 (4.4): Cambridge, paywalled; cited through Guillou–Weibel's Theorem 6.2, whose proof defers to it.
- **Ownership against GeneralizedCohomology #1187 and HomotopySpheres #284**: close in vocabulary, no checkout given, not checked. GeneralizedCohomology was checked on main, HomotopySpheres at #1287.

## Source issues

- **Error** in Milnor–Stasheff (TeXromancers edition, `4f8edd74` line 5077) at §16.3, printed page 194: the source says CP^(2n+1) is the total space of a circle bundle over a quaternionic projective space; it should be a 2-sphere bundle, the fibre of CP^(2n+1)→HP^n being CP¹, since the dimensions differ by 2; affects nothing (the boundary conclusion stands with the associated 3-disc bundle, and the README's 8.5 already uses the S² fibre).
