# Review of AlgebraicTopology (pull request #1652 at c610f76)

**Verdict:** needs changes

Full review of the folder at an unchanged head (the previous review read the same commit). The folder itself has no finding: the README was read end to end, the fifteen sampled targets were checked against the cached texts, the adversarial pass was recomputed, the gate and the dependency check pass, and `Suggested.lean` elaborates with `sorry` as its only warning. The one finding is the previous review's, in the pull request's title and description, which have not changed.

## R01 (P3) — Title and description describe a different head

**Location.** The pull request's title and description (the author's text, outside the generated `merge-order` block): "AlgebraicTopology: compact Cech pairs and relative cup modules"; "Add a compact-metric Čech construction by finite-cover nerves and refinement colimits …"; "This amendment changes only README mathematics; existing Lean modules are unchanged."

**Claim.** The text says the head adds compact Čech pairs and leaves the Lean modules alone.

**Witness.**
- `TauCetiRoadmap/AlgebraicTopology/README.md:190`–`:191` places "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap; the README has no ENR comparison, finite-cover nerve colimit or cube-module target.
- `git diff --stat origin/main...HEAD -- TauCetiRoadmap/AlgebraicTopology`: seven Lean modules deleted, `Suggested.lean` rewritten (3178 changed lines), `README.md` 4565 changed lines.
- This head moves the compact-generation identification into §4.8 (`README.md:162`–`:166`, `:1797`–`:1807`; main's README gave it to another roadmap). DGFloerPartII, an open new roadmap, states the same identification at its head 4ecec6e in §1.0 (`TauCetiRoadmap/DGFloerPartII/README.md:566`–`:580`) and `TauCetiRoadmap/DGFloerPartII/Suggested.lean:106` (`compactlyGeneratedToTop_isLeftAdjoint`), with no citation of §4.8. AlgebraicTopology is on main, so it is the owner and the edit is on the DGFloerPartII side; this pull request only has to say so.

**Repair.** In the pull request text only; nothing in the folder changes.
1. Retitle and describe the head: the Layer form at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b; the seven deleted modules and the headline-only `Suggested.lean`; §6.6 and §§8.13–8.16; the Hurewicz and representability headlines; Mathlib's coreflection consumed in §4.8; Hausdorffness of Mathlib's projectivization in §4.6; the Stage-to-Layer anchor table.
2. Delete the sentence "This amendment changes only README mathematics; existing Lean modules are unchanged."
3. State that DGFloerPartII §1.0's identification of the two compact-generation carriers, its convenient products, exponential law and pointed suspension–loop adjunction become citations of AlgebraicTopology §4.8 once this merges.

## Previous findings

- R01 (title and description) — partly repaired, unchanged since the last review. The generated block still has "`AlgebraicTopology`: **this pull request** → #1807 → #1808 → #1854 → #1187 (pin bump)", which settles the order. The title "AlgebraicTopology: compact Cech pairs and relative cup modules" and the sentence "existing Lean modules are unchanged" are as before, and DGFloerPartII is not mentioned. Carried above as R01; the DGFloerPartII witness is re-read at its new head 4ecec6e.

## Verified sound

### Gate, dependency check, elaboration, padding

- **Gate** (rerun on this head): every counter 0, `OK`, as in the worker's `gate.md` (there with `build=0`).
- **Dependency check**, verbatim: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: 17 "declaration uses `sorry`" warnings, nothing else.
- **Form.** One module docstring; `import Mathlib` plus eleven `TauCeti.*` modules, all present at the pin; no `set_option`, no sorry'd data, no `variable` line (so no declaration can lose a section binder; the worker's `signatures.md` reports 0 dropped binders on 27 declarations, and I compared each elaborated statement with its README paragraph). Every Lean name is backticked in the README.
- **Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | (intros; rfl) | (intros; simp; done) | (constructor <;> simp; done) | trivial | sorry`. All 17 theorems still report `sorry`: none closes in one tactic. The eight definitions (`singularCohomology`, `cupProduct`, `LSPositiveCupProduct`, `lsCupLength`, `IsFundamentalClass`, `HasProperHomotopyExtensionProperty`, `groupClassifyingSpace`, `groupClassifyingSpaceBasepoint`) each make a headline statable and have real bodies.
- **Headlines.** Stated: LS cup-length bound; closed-manifold duality with a fundamental class and its 2=0 form; product-ball intersection; bundle Euler formula; absolute Hurewicz in every universe; relative Hurewicz for a simply connected subspace; homological Whitehead; finite CW type of compact manifolds (two models); homology-sphere recognition; mapping-space CW type; nerve K(G,1); ordinary representability; proper rectification; transverse circle classifying map; C_p×C_p on spheres. Named as not statable in the docstring, each with its missing carrier: twisted, boundary and compact-triad duality; Künneth and Cartan–Leray spectral sequences; Milnor tower comparison; EM loop comparison; obstruction criteria; proper Whitehead; the pair and marked-point CW forms. I checked two of the claimed absences at the pin: no theorem makes `singularCap` bijective, and `HomotopyGroup.bijective_hurewicz` is stated for `{X : Type}` with `ModuleCat.of ℤ ℤ` (`AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean:157`–`:163`), so `hurewicz_bijective` is not a restatement.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty.

### Source sample (15 targets, all read at the locator)

Hatcher's extraction carries PDF page markers; printed page = marker − 9. Brown's: printed = marker − 25.

| Target | Locator in README | Read at | Result |
| --- | --- | --- | --- |
| 1.1 | Brown §6.7 Ex. 6, p.250 | `brown` line 9768 (p.250): cover closed under pairwise intersections of a subcover, colimit of π restricted to the cover | supports |
| 1.3 | Hatcher Thm 1.20, p.43 | `hatcher` line 1956 (p.43): surjectivity with pairwise, kernel with triple intersections path connected | supports |
| 1.5 | Brown 6.7.5, p.248; Ex. 2, p.249; Hatcher Ex. 1.21, p.43 | `brown` lines 9692, 9749; `hatcher` line 1962 | supports |
| 2.6 | Hatcher §3.H, p.333 | `hatcher` lines 14562–14575: homotopic maps give isomorphic pullbacks; pair sequence, excision, additivity with local coefficients | supports |
| 3.2 | Hatcher Prop. 2.21, p.119; §3.H, p.333 | `hatcher` lines 5222, 14569–14570 (excision by iterated subdivision with local coefficients) | supports; the twisted form is stated as proved here |
| 4.1 | Hatcher Appendix Ex. 1, p.529 | `hatcher` line 22952 | supports |
| 4.2 | Cellular boundary formula, p.140; Lemma 2.34, p.137 | `hatcher` lines 6086, 5963 | supports |
| 4.5 | Hatcher Thm 4.8, p.349; Prop. 0.19, p.16; Prop. A.3, p.522; Thm A.6, p.524; Strøm Thm 6, p.135 | `hatcher` lines 15205, 867, 22617, 22693; `strom1972` line 181 (one subspace closed, as {0,1}⊂I is) | supports |
| 4.7 | May Thm 14.1; Hatcher VBKT Prop. 1.20, p.36 | `may1967` lines 1578–1580; `hatcher-vbkt` line 1445 (page header "36") | supports |
| 5.4 | Hatcher Thm 3B.6, p.275; Ex. 3.16, p.216 | `hatcher` lines 11898, 9388 | supports |
| 6.0 | Hatcher Prop. A.1, p.520; Thm 3.5, p.203 | `hatcher` lines 22534, 8799 | supports |
| 6.3 | Hatcher Lemma 3.27, p.236; Prop. 3.29, p.239 | `hatcher` lines 10255, 10370 | supports |
| 6.6 | Hatcher Thm 3B.6 and relative form, pp.275–276 | `hatcher` lines 11898, 11937–11938 (p.276) | supports |
| 8.5 | Hatcher Thm 4.5, p.346; Cor. 4.33, p.367; Ch. 0, p.14; FTW Thm 1.6, Thm 4.2, Lemma 4.3, Cor. 4.9 | `hatcher` lines 15109, 16001, 796; `ftw1973` lines 134, 600, 610, 752 | supports; Cor. 4.9's hypotheses equal the README's |
| 8.10 | Hatcher Thm 4.57, p.393; fundamental class and free classes, p.394; Lemma 4.31, p.366 | `hatcher` lines 17069–17071, 17076–17089, 15931 | supports |

Also read while sampling: Hatcher Thm 4.37 (line 16124, p.371), Thm 4.32 (15961, p.366), Thm 3.30 (10453, p.241), Thm 3.26 (10237, p.236), Thm 3.43 (10976, p.254), Ex. 2.48 (6588, p.151), Thm 2.44 (6380, p.146), Prop. 1B.9 (3905, p.90), Ex. 1B.7 (3844, p.89), Thm 2C.5 (7923, p.182), Prop. 4.48 (16461, p.379), Prop. A.11 (22877, p.528); `hatcher-vbkt` Lemma 3.18 (3881, p.100) and Prop. 3.19 (3908, p.101); `brown` 6.7.2 (9424, p.240) and 3.6.4 (3995). All at the page the README gives. The README flags no locator as unverified.

### Adversarial table

Values computed in this review.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 2.6 triple connecting map | S¹ with sign system, loop σ, coefficient c | ∂(cσ)=(u−1)c=−2c; coker gives H₀=ℤ/2; ignoring transport gives 0 and ℤ | holds |
| 3.1 `∂T+T∂=id−Sd` | σ=[v₀,v₁]; a 0-simplex | Sdσ=[b,v₁]−[b,v₀]; Tσ=[b,v₀,v₁]−[b,v₁,v₁]+[b,v₀,v₀]; ∂Tσ+T∂σ=σ−Sdσ; degree 0: 0=0 | holds |
| 3.2 small chains | cover [0,.3),(.2,.8),(.7,1] | [0,1/2] in no member; the four quarters lie in members 1,2,2,3 | holds |
| 4.4 isometry A and native cube quotient | n=1, 2 | det A=+1, −1=(−1)^(n+1); frame (−e_last,e₀,…) has det (−1)^(n+1); product +1 | holds |
| 4.7 radial map | n=1: z=±1; n=2: z=(1,0) | e₁, e₀; weights (0,2/3,1/3) on the face opposite e₀ | holds |
| 5.2 two-map Wang sequence | g reflection; g=z²; g constant; f=g=id | H₁=ℤ/2⊕ℤ; ℤ (and ℤ/3 for id+g_*); ℤ; H_n(Y)⊕H_(n−1)(X) | holds |
| 5.6 Čech signs | three opens, c on U₀₁₂; (1,1) position | U₂-component of δδc is c−c=0; D²c=∂δc−δ∂c=0 with the column sign | holds |
| 5.7 augmented row | point covered twice; zero ring | 0→R→R²→R→0, c↦(−c,c), (a,b)↦a+b exact; all terms 0 | holds |
| 6.0 difference map and homotopy-square maps | constant ℤ tower; ×2 tower; f_n=n·id; ×3 tower | (3,1,0,…)↦(2,1,0,…); 3x₀≡−1 mod 4ᵏ for all k, no solution; (2n+1)s=(n+1)s+ns; Σ3ⁿ=−1/2∉ℤ | holds |
| 6.1 backward transport | R=ℤ/5, u=2 | u⁻¹a−a=2a against ua−a=a | holds, Check discriminates |
| 6.2 `lsCupLength_add_one_le_categoryCount` | point; S¹; T²; ∅; zero ring; two points | 0+1≤1; 1+1≤2; 2+1≤3; excluded by `Nonempty` (count 0); 0+1≤count, count ≥1; 0+1≤2 | holds |
| 6.4 `poincareDuality_of_isFundamentalClass` | two points, R=ℤ; S¹ with 2[S¹]; RP² over ℤ/4; zero ring; M=∅ | (a,b)↦(u₁a,u₂b) bijective; local image 2 not a generator; ker 2={0,2}, image 2 not a generator, so no hypothesis; 0→0; 0→0 | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP² over 𝔽₂; S¹ over 𝔽₂; μ=0 | Betti 1,1,1 matched with 1,1,1; 𝔽₂↔𝔽₂ twice; zero class gives zero caps, not selected | holds |
| 6.5 linking symmetry | (n,i)=(3,1); (5,2) | exponent 4, symmetric; 9, skew; squares mod 5 are {1,4}, closed under negation | holds |
| 6.6 `productBallImages_intersect` | p=q=0; p=0; homotopy H_t; constant maps | one point; g₂ onto D_q by no-retraction; norms ≥t on both parts of B, coefficient (−1)^q·1·1; d_f=d_g=0 and disjoint images (boundary-degree form only) | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | Hopf; Klein bottle over 𝔽₂ and ℚ; B=∅; F=∅ | 0=2·0; 1−2+1=0 and 1−1+0=0, =0·0; 0=0·χ(F); 0=χ(B)·0 | holds |
| 7.3 stratification additivity | S²: point, equator, sphere | 1−1+2=2; dropping the middle pair gives 3 | holds |
| 8.2 nerve order, Moore complex | g=(12), h=(23); ℤ[Δ¹/∂Δ¹] | hg sends 1 to 3, gh sends 1 to 2; N₁=ℤ(e−s₀v), d₀=0, ranks 2 and 3 unnormalized | holds |
| 8.3 `hurewicz_bijective` | S², n=0; S¹ (π₁≠0); X=∅ | ℤ→ℤ; hypothesis at k=1 fails; no point x | holds |
| 8.4 `relativeHurewicz_bijective` | (D³,S²), n=1; (D²,S¹∨S¹); sine-curve pair | π₃=π₂(S²)=ℤ→H₃=ℤ; F₂→ℤ² excluded by simple connectivity of A; excluded by `h₀` (H₀(X,A)=ℤ) | holds |
| 8.5 `homologicalWhitehead` | id of a point; Poincaré sphere → S³; degree 2 on S² | identity; excluded (π₁ of order 120); ×2 not an isomorphism | holds |
| 8.5 `HasProperHomotopyExtensionProperty`, `properStrongDeformationRetract_of_inverse` | A=∅; A=X; (I,{0}); (I,{0,1,1/2,…}); (ℝ,{0}) | K=f∘pr proper; K=H; glued K agrees on the diagonal; no retraction of I×I onto the comb (`hatcher` line 796); g not proper | holds |
| 8.7 CW type, recognition | n=0 finite set; ℕ; n=0, 1 in the recognition | that many 0-cells; H₀ of infinite rank; contractible against S⁰; H₁=0 against ℤ | holds, `2 ≤ n` needed |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ; S₃ | point; π₁=ℤ; π₁ of order 6, nonabelian | holds |
| 8.10 `ordinaryEMRepresentability` | K=S¹, n=0; K=S², n=1; K=S¹×CP∞; K=S¹⊔{p}; K a point; X the Warsaw circle; X=∅ | degree map ℤ=H¹(S¹); [S³,S²]=ℤ against 0, excluded by π₃; ℤ against H²(S¹)=0, excluded by π₁; 2 against 1, excluded at i=0; A=0 only; excluded by `CWType`; 1=1 | holds; ι is unique (H^(n+1)=Hom(H_(n+1),A), the Ext term vanishes) |
| 8.11 `finiteSourceMappingCWType` | X=∅; X a point; Y=∅≠X; S¹ into S¹⊂ℝ² | one point; Y; ∅; components ℤ against contractible ambient | holds |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; dim M=0; M=S¹, a=k·b₀ | empty map; H¹=0, f constant ≠1 (no surjective derivative possible at a point of the fibre); z^k, k regular preimages | holds |
| 8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; n=1; n≥2 | p²≥4>2 points; deck group of a circle cover is cyclic; dim H^(n+1)=n+2 against ≤1 | holds |
| 8.16 essential map T³→S² | f=p∘q | π_k and H̃_k maps 0; a lifted nullhomotopy ends in a fibre S¹, H₃ map 0 against degree 1 | holds |

In the 6.2 row the two-point space has count 2: an open set containing both points has no nullhomotopic inclusion.

### Library declarations opened at the pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b)

Each exists at the file the README names:
- `AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean:161` `bijective_hurewicz`; `Hurewicz/Relative.lean:282` `bijective_hurewicz_of_subsingleton_homotopyGroup`; `Homotopy/Relative/Hurewicz.lean:332` and `Hurewicz/Basic.lean:180` `hurewicz_map`.
- `AlgebraicTopology/Homotopy/Whitehead.lean:203`, `:216`, `:263` (`exists_comp_homotopic`, `homotopic_of_comp_homotopic`, `homotopyEquiv_toFun`); `Singular/Homotopy/WeakHomotopyEquivalence.lean:110` `isIso_singularHomologyMap`.
- `AlgebraicTopology/Cohomology/Kronecker.lean:89` `singularKronecker_naturality`; `Cellular/EulerCharacteristic/FiniteCWType.lean:133`; `Cellular/LocalDegree.lean:626`; `Singular/Subdivision/Small/Equiv.lean:423`; `Singular/Torus/Exterior.lean:325`; `Singular/LocalHomology/TopHomology.lean:97`; `Singular/LocalHomology/FundamentalClass.lean:204`.
- `AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean:110` `cast_map_prod_mul`; `FundamentalGroup/VanKampen/Basic.lean:774`; `FundamentalGroupoid/Cech/Colimit.lean:141`.
- `AlgebraicTopology/Homotopy/SimplyConnectedAtInfinity.lean:71`; `Sphere/CubeQuotient.lean:361`; `Disk.lean:336`.
- `Topology/CWComplex/Classical/CellularApproximation.lean:94`, `:106`; `Classical/DeltaGenerated.lean:61`; `Analysis/Calculus/Sard/OutermostStratum.lean:347`; `Geometry/Manifold/Sard/EqualDimension.lean:105`; `RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean:166`.
- Mathlib: `Topology/Convenient/HomSpace.lean:96` `curryEquiv`; `Topology/Convenient/Category.lean:297` `adj`; `RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:91`; and by file, `WhitneyEmbedding.lean`, `SmoothApprox.lean`, `OnePoint/Sphere.lean`, `Topology/Algebra/Projectivization.lean`, `Separation/Hausdorff.lean`, `Convenient/GeneratedBy.lean`, `Covering/Quotient.lean`.

A further 25 names of the supplier contracts were located by name at the pin without opening the statement (Brouwer, LS covers, CW type, Serre fibrations, tower algebra, ends, proper inverses, NDR and colimit lemmas, CW approximation, loop-space equivalences).

### Cross-roadmap citations and ownership

- The worker's resolver reports no cross-roadmap citation found nowhere. Its one Lean lead, `Singular.BrouwerFixedPoint` (`README.md:397`), is a module: `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` exists at the pin.
- Suppliers named in `## Exact supplier contracts` (UniversalCovers, GeometricTopology, DifferentialGeometry, DGFloer, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, ComplexKahlerGeometry) are all on main (f8836c4). Resolved there: DGFloer Layer 1 items 1–4 (`README.md:462`, `:470`, `:621`, `:659`, the K(A,n) family at `:673`) and Layer 2 (`:846`); GeneralizedCohomology `realizationProductKelleyComparison` (`:234`) and `numerableFiberBundle_hurewicz` (`:651`); CharacteristicClasses C1.2a S0–S4 (`:66`–`:67`, `:514`) and C2 (`:728`); ComplexKahlerGeometry K7 (`:1405`) and K7.1; GeometricTopology Layer 1 (`:783`), 11.1 (`:7740`), 11.3 (`:7887`); DifferentialGeometry Layers 2, 5 and 10 (`:341`, `:503`, `:877`).
- TangentialBordism, FourManifolds and ImplicitAtlases are not on main; the README names them only as consumers or in an ownership remark, never in a `*Needs:*` line or supplier contract.
- **Overlaps.** Conflicting heads #1187, #1807, #1808, #1854: ordered after this pull request in the description. No cited id is dropped by an open pull request or defined only by an open revision. The four `#stage-k-…` anchors that other roadmaps cite are mapped by the table "Former anchor (Stage numbering) | Anchor now | Section now" (`README.md:856`–`:865`), with the item-to-section list after it.
- Ownership against open pull requests was checked through the overlap list, the resolver and DGFloerPartII's folder, not by reading every open folder.

## Not verifiable

- Settled as uncertified and cited by locator only: Thom 1954, Chapter II; Lee, Theorems 6.26, 6.30, 6.35, 6.36; Milnor, *Morse Theory*, Lemmas 3.6–3.7; Freedman–Quinn §7.7; Weibel; tom Dieck; Serre 1953; Dowker 1952.
- Not in the manifest, cited by chapter: Eilenberg–Steenrod; G. W. Whitehead; Dold; McCleary; K. Brown, Chapter VII; Serre 1951; Conway–Friedl–Herrmann (the L(5,q) values −q/5 of §6.5 rest on their Proposition 1.2, which I did not read).
- `may1967` is an OCR of a two-pages-per-scan copy: Theorem 14.1 is legible at lines 1578–1580 but interleaved with the facing page.

## Source issues

- none
