# Review of AlgebraicTopology (pull request #1652 at c204943)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at c204943 (203 lines changed since db70d31). The gate passes, the three folder findings of the previous review are repaired, and I found nothing false, unowned or duplicated. Two P3 findings remain:

- **R01:** the pull request's title, description and merge order, carried from the previous review. It is repaired in the pull request text, not in the README.
- **R02:** one locator into May's book names chapters that do not exist. May's text became readable in this round (the cache copy is now recognised by OCR), which is why earlier reviews did not check it.

## Previous findings (review of db70d31)

- **R01 (P2), ordinary representability statable but absent: repaired.** `Suggested.lean:328` now states `ordinaryEMRepresentability` for every space K with π_i(K,k) trivial for i≠n+1 and an isomorphism e:π_(n+1)(K,k)≅A. It goes further than the repair asked: the class ι is pinned by "Kronecker evaluation on the Hurewicz image of every `a ∈ π_(n+1)(K, k)` is `e a`" (`Suggested.lean:320`–`:322`). The docstring (`:56`–`:62`) keeps only the EM loop comparison as not statable, with the reason that its content is naturality in A over a functorial family. README §8.10 names the theorem (`README.md:3886`–`:3907`) and adds eight Checks (`:3919`–`:3947`). The statement is checked below.
- **R02 (P3), Hurewicz and Mayer–Vietoris locators: repaired.** The map statements now cite "Hatcher, Theorem 4.37, p.371" with Theorem 4.32 kept for the vanishing and the abstract isomorphism (`README.md:3349`–`:3351`, `:3378`–`:3380`, `:3648`–`:3650`, `:4212`–`:4213`; `Suggested.lean:207`, `:221`, `:269`–`:270`). §3.4 now cites "§2.2, pp.149–150" for the derivation and §3.H, p.333, only for subdivision with local coefficients (`README.md:1237`–`:1240`). Verified at hatcher lines 16124–16128 (p.371), 15961–15963 (p.366), 6503–6521 (p.149) and 14569–14570 (p.333).
- **R03 (P3), dropped `stage-k` anchors: repaired.** `README.md:856`–`:865` is a table headed "Former anchor (Stage numbering) | Anchor now | Section now" with one row for each of the eight layers. I recomputed the eight new anchors from the headings at `:895`, `:1000`, `:1153`, `:1264`, `:1874`, `:2136`, `:3107` and `:3212`; each matches its row. The overlap check still lists four anchors (see "Overlaps" below); with the mapping in the README this is no longer a finding.
- **R04 (P3), pull request text: not repaired.** Carried below as R01.

## R01 (P3) — Stale title and description, no stated order against the conflicting pull requests, and DGFloerPartII §1.0 states §4.8's identification

**Location.** The title and description of the pull request (`scratch/pull-request.md`): "AlgebraicTopology: compact Cech pairs and relative cup modules"; "Add a compact-metric Čech construction … This amendment changes only README mathematics; existing Lean modules are unchanged".

**Claim.** The text describes a different head, states no order against the five open pull requests whose heads conflict with this one in this folder, and does not say which roadmap owns the compact-generation identification that this head and DGFloerPartII both state.

**Witness.**
- **Wrong scope.** `README.md:190`–`:191` puts "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap.
- **Unmentioned changes.** `git diff --stat origin/main...HEAD` deletes seven Lean modules of the folder and rewrites `Suggested.lean` (3178 lines changed).
- **Unordered conflicts.** The overlap check reports conflicts in `TauCetiRoadmap/AlgebraicTopology/README.md` or `Suggested.lean` with #1187, #1797, #1807, #1808 and #1854.
- **Two statements of one identification.** On main, `TauCetiRoadmap/AlgebraicTopology/README.md:116`–`:118` leaves the compact-generation coreflection to another roadmap. This head owns its identification with Mathlib's `GeneratedByTopCat` in §4.8 (`README.md:162`–`:166`, `:1797`–`:1807`). DGFloerPartII at 05e7c012 (#1799) states the same identification at `README.md:516`–`:532` and `Suggested.lean:106` (`compactlyGeneratedToTop_isLeftAdjoint`). AlgebraicTopology is on main, so it is the owner and the open roadmap cites it.

**Repair.** In the pull request text only:
1. Retitle, and describe the head: the Layer form at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, the seven deleted modules, §§6.6 and 8.13–8.16, the Hurewicz and representability headlines, Mathlib's coreflection consumed in §4.8, Hausdorffness of Mathlib's projectivization in §4.6, and the Stage-to-Layer anchor table.
2. State the order: this pull request first; #1797, #1807, #1808 and #1854 rebase onto it; #1187's Tau Ceti revision is superseded for this folder by 2fd255d9.
3. State that DGFloerPartII §1.0's identification, convenient products, exponential law and pointed suspension–loop adjunction become citations of AlgebraicTopology §4.8 when this merges.

## R02 (P3) — "Chapters 3 and 12" of May's book is not a locator for the Kan-group construction

**Location.** `README.md:4214`–`:4215`: "May, *Simplicial Objects in Algebraic Topology*, Chapters 3 and 12, supplies the Kan-group construction and comparison route."

**Claim.** The book has six chapters, I–VI, and numbered sections §1–§32, so there is no Chapter 12. Read as sections, §12 is "Weak homotopy type" (minimal complexes and weak equivalences of Kan complexes), which contains neither the Kan property of simplicial groups nor the comparison with spaces. The rest of the README cites the right places: §3, §14 and §17 at `README.md:1757`–`:1759`, `:3270`, `:3303`–`:3304` and in the References (`:4800`–`:4803`).

**Witness.** may1967 lines 53–79 (contents): Chapter I contains §3 "Homotopy of Kan complexes", Chapter II §12 "Weak homotopy type", Chapter III §§14–16 (the realization, adjoint functors, comparison of simplicial sets and topological spaces), Chapter IV §17 "Simplicial groups". Line 1822: Theorem 17.1, every group complex is a Kan complex. Line 1890: Proposition 17.4, the homotopy groups of a group complex are the homology of its Moore complex.

**Repair.** Replace "Chapters 3 and 12, supplies" by "§3 (homotopy groups of Kan complexes), §§14–16 (the realization and its comparison with topological spaces) and §17 (Theorem 17.1 and Proposition 17.4, simplicial groups and the Moore complex), supply". Each of these sections is at the cited lines of may1967 and agrees with the References entry.

## Verified sound

**Gate, dependencies, build.**
- My run of the gate printed every counter at 0 and "OK", as `scratch/gate.md` does (with the build).
- The dependency check printed `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exited 0 in about one minute with 17 "declaration uses `sorry`" warnings (lines 114–408) and nothing else.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty.
- No `set_option`, `lemma`, `#eval` or `#print`; imports are `Mathlib` and eleven `TauCeti.*` modules, each used by a declaration.

**Lean statements.**
- **Padding probe.** A scratch copy with every `sorry` replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (trivial; done) | (aesop; done) | (exact?; done) | sorry` elaborated in under four minutes with no error and still 17 sorries. No theorem closes in one tactic.
- **Signatures.** I compared the elaborated types of `scratch/signatures.md` with the README statements for all 25 named declarations; they agree, and each name occurs backticked in the README (1 to 6 times). The file has no `variable` block.
- **No pinned duplicate.** At Tau Ceti 2fd255d9 no file mentions a cup length, Poincaré duality, a fundamental-class predicate, a K(A,n) predicate for n≥2, the nerve of `SingleObj`, a CW-type theorem for `C(X, Y)` or for manifolds, or a bundle Euler formula. The native Hurewicz theorems are `HomotopyGroup.bijective_hurewicz` for `X : Type` (`Homotopy/Hurewicz/Absolute.lean:157`, `:161`) and the relative one with both spaces highly connected (`Hurewicz/Relative.lean:282`); both headlines are strictly more general.
- **`ordinaryEMRepresentability` is true as stated.**
  - *ι exists and is unique.* The universal coefficient sequence makes the Kronecker map onto Hom(H_(n+1)(K),A), and Hurewicz identifies H_(n+1)(K) with π_(n+1)(K,k) (for n=0 with its abelianization, which is π₁ itself since π₁≅A). The kernel is Ext(H_n(K),A), which is 0: H_n(K)=0 for n≥1 and H₀(K)=ℤ for n=0.
  - *ι represents.* For X=S^(n+1) and f representing a, naturality gives ⟨f*ι,[S^(n+1)]⟩=e(a), so the pullback map π_(n+1)(K)→A is e, a bijection. Any two classes whose Kronecker maps are isomorphisms differ by an automorphism of A, so the normalized class is a fundamental class in the sense of Hatcher p.394 (lines 17076–17079).
  - *Free classes.* K is path connected and π₁(K) acts trivially on π_(n+1)(K): for n≥1 because π₁=0, for n=0 because conjugation in an abelian group is trivial (hatcher 17083–17088).
  - *General K and X.* The route through a weak equivalence K₀→K uses Tau Ceti's `exists_comp_homotopic` and `homotopic_of_comp_homotopic` (`Homotopy/Whitehead.lean:203`, `:216`, stated for sources of CW type) and `isIso_singularHomologyMap` (`Singular/Homotopy/WeakHomotopyEquivalence.lean:110`). DGFloer's model has one vertex and no nondegenerate simplices in dimensions 1 to d−1 (Γ(A[d]) is 0 below degree d), so Hatcher's Lemma 4.31 (line 15931, p.366) applies to its (d+1)-skeleton.

**Seeded sample.** Hatcher printed page = cache marker − 9; Brown printed page = marker − 25.

| Target | Locator in the README | Source line, printed page | Result |
| --- | --- | --- | --- |
| 1.1 | Brown §6.7 Ex. 6, p.250; 6.7.2, p.240; 3.6.4, p.91; Hatcher Thm 1.20, p.43 | brown 9768–9772 (marker 275); 9424 (265); 3995 (116); hatcher 1956 (52) | sound |
| 1.5 | Brown 6.7.5, p.248; §6.7 Ex. 2, p.249; Hatcher Ex. 1.21, p.43 | brown 9692–9693 (273, proof on the points ±1); 9749–9751 (274); hatcher 1962 (52) | sound |
| 1.6 | Hatcher §3.C Ex. 5, p.291; native `cast_map_prod_mul` | hatcher 12736 (300); `FundamentalGroup/TopologicalMonoid.lean:110` | sound |
| 2.6 | Hatcher §3.H, p.333 | hatcher 14559–14575 (342): homotopic maps give isomorphic pullbacks; pair sequence, excision, additivity | sound |
| 5.1 | Stacks Lemma 15.65.4, Tag 0H7Z | stacks-more-algebra 7399–7402: objects of D^b(R), `Tor^R_(−p)`, bounded | sound |
| 5.5 | SSAT Thm 1.3, p.8; local coefficients, p.17 | hatcher-ssat 433–438 (page 8, with filtration and stable terms); 984–992 (page 17) | sound |
| 5.6 | none (a construction) | native `TauCeti.cechDoubleComplex` at `Singular/Cech.lean:113` is the constant case | no locator needed |
| 5.7 | Hatcher Prop. 2.21, pp.119–120; native `quasiIso_cechTotalAugmentation` | `Singular/Cech/OrderedQuasiIso.lean:409` | sound |
| 7.1 | Hatcher Thm 2.44, p.146; five native names | hatcher 6380 (155); `Cellular/EulerCharacteristic/Basic.lean:67`, `FiniteCWType.lean:133`, `:143` | sound |
| 7.4 | native `eulerChar_sphere`, `eulerChar_torus`, `eulerChar_complexProjectiveSpace` | `EulerCharacteristic/Sphere.lean:62`, `Torus.lean:50` (`[Nonempty ι]`, matching "n>0"), `ComplexProjective.lean:68` | sound |
| 8.4 | Hatcher Thm 4.37, p.371; Thm 4.32, p.366; §4.1, p.346 | hatcher 16117–16128 (380); 15961–15963 (375) | sound |
| 8.7 | Thm 4.32; Thm 4.37; Cor. 4.33, p.367; `IsTriangulable.finiteCWType` | hatcher 16001–16002 (376); `Topology/Triangulable/FiniteCWType.lean:41` | sound |
| 8.13 | Thom 1954 Ch. II; Lee Thms 6.26, 6.30, 6.35, 6.36; four pinned names | Mathlib `Geometry/Manifold/WhitneyEmbedding.lean:132`, `SmoothApprox.lean:79`; Tau Ceti `Analysis/Calculus/ImplicitFunctionTheorem.lean:407`, `Sard/OutermostStratum.lean:347`, `Geometry/Manifold/Sard/EqualDimension.lean:105` | names sound; Thom and Lee not verifiable |
| 8.15 | Hatcher §4.2 Ex. 26 and 28, p.391; Lemma 3.27, p.236 | hatcher 16980–16983 (400); 10255–10258 (245); `Singular/LocalHomology/Compact.lean:341` | sound |
| 8.16 | Hatcher §4.2 Ex. 34, p.392; Mathlib `onePointEquivSphereOfFinrankEq` | hatcher 17020–17023 (401); `Topology/Compactification/OnePoint/Sphere.lean:34` | sound |

May (may1967, OCR of a two-pages-per-scan copy): §3 at line 258; Theorem 14.1 at lines 1578–1580 (the realization is a CW complex with one n-cell for each nondegenerate n-simplex), supporting §4.7; Theorem 17.1 at line 1822 and Proposition 17.4 at lines 1886–1890 (Moore complex taken "with respect to the last face operator", as §8.2 says), supporting §8.2.

Also read for §8.10: Hatcher Theorem 4.57 (17069–17071, p.393), p.394 (17073–17089), Proposition 4.30 and Lemma 4.31 (15928–15935, p.366); Corollary 4.33; KMR lines 25–36 and 48–51.

**Adversarial table.** Sampled targets, all 17 headline theorems and the statements the previous findings touched.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.1/1.3 cover colimit versus based presentation | S¹ by two arcs through x₀ | intersection has 2 path components; free product of trivial groups is 1, π₁(S¹)=ℤ; groupoid on two basepoints gives ℤ | holds; pairwise hypothesis needed |
| 1.5 wedge and circle | S¹∨S¹; two-arc S¹ with basepoints ±1 | F₂ on a,b; ℤ | holds |
| 1.6 pointwise product | U(1), degrees m,n; squaring | m+n both ways; 2m+2n versus one-factor model 2m+n | holds |
| 2.6 triple naturality | (S¹,{p},∅) with sign system, u=−1; (X,X,A) | ∂(cσ)=(u−1)c=−2c, so H₀=ℤ/2; H_n(X,X;L)=0 so the connecting map is 0 | holds |
| 5.1 Künneth | RP²×RP² over ℤ, degree 3; truncation bound | Tor₁(ℤ/2,ℤ/2)=ℤ/2=H₃; total degree n uses H_i for i≤n+1, unchanged by truncating above n+2 | holds |
| 5.5 Serre sequence | Hopf; S¹×S²; ∅→B; {1}→S¹ | E² is ℤ at (0,0),(0,1),(2,0),(2,1); d² is an isomorphism for S³ (H₁=H₂=0) and 0 for the product (H₂=ℤ); E²=0; the loop has no lift, E²_(1,0)=ℤ against H₁=0 | holds |
| 5.6 Čech signs | chain c on U₀₁₂; two opens | δc=(c,−c,c) on (U₁₂,U₀₂,U₀₁); U₂-part of δδc is c−c=0, unsigned 2c; two opens (−c,+c) | holds |
| 5.7 augmented row | point covered twice; zero ring | 0→R→R²→R→0 with c↦(−c,c), (a,b)↦a+b: kernel of the sum is the image; all terms 0 | holds |
| 7.1 local-system Euler–Poincaré | Möbius system on S¹ over ℚ and 𝔽₂ | d₁=−2: both groups 0, χ=0=1·0; over 𝔽₂ both 𝔽₂, 1−1=0 | holds |
| 7.4 standard values | S⁰,S¹,S²; T¹; CP⁰,CP¹; T⁰ | 2,0,2; 0; 1 and 2=χ(S²); a point has χ=1, excluded by n>0 | holds |
| 8.4 `relativeHurewicz_bijective` | (D³,S²), n=1; (D²,S¹∨S¹); sine curve with A the segment | ℤ→ℤ; F₂→ℤ² is abelianization, excluded since A is not simply connected; all π_i(X,A)=0 but H₀(X,A)=ℤ, excluded by `h₀` | holds |
| 8.3 `hurewicz_bijective` | S², n=0; S¹; index | π₂=H₂=ℤ; excluded by k=1<2; `hurewicz R (n+1)` lands in H_(n+2) | holds |
| 8.5 `homologicalWhitehead` | Poincaré sphere P→S³; degree 2 on S² | homology isomorphism but π₁ of order 120, excluded; ×2 on H₂ | holds |
| 8.7 CW type and recognition | ℕ discrete; [0,1]; n=0; n=1 | infinite-rank H₀, no finite model; χ=2−1=1; contractible versus S⁰ (2 points), so `2 ≤ n` is needed; H₁≅ℤ contradicts simple connectivity | holds |
| 8.10 `ordinaryEMRepresentability` | K=S¹, A=ℤ, n=0, X=S¹ and X=S² | [S¹,S¹]=ℤ=H¹(S¹); [S²,S¹] one class, H¹(S²)=0 | holds |
| 8.10 hypotheses | K=S², n=1; K=S¹×CP∞, n=1; K=S¹⊔{p}, n=0; K a point | [S³,S²]=ℤ against H²(S³)=0; [S¹,K]=ℤ against H²(S¹)=0; [pt,K] has 2 elements against H¹(pt)=0; e exists only for A=0 | each hypothesis needed |
| 8.10 normalization | −e; zero class; X=S^(n+1) | −ι, evaluation −1; pullback constant, not onto ℤ; pullback map equals e | pins ι |
| 8.10 CW type of X | Warsaw circle W | weakly contractible, so H¹(W)=0 and one class; q:W→S¹ essential, so [W,S¹] has at least 2 | hypothesis needed |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; M=S¹ with a=k·generator; conjugate basis | empty map; f=z^k, k regular preimages of 1 (constant map perturbed off 1 for k=0); use the conjugate of f | holds |
| 8.13 parametric transversality | M a point, F(s)=exp(is); f≡1 with β=1 | F⁻¹(1)={(pt,0)}, dimension 0+1−1=0, bad set {0} null and nonempty; g=(1+s)/|1+s|≠1 unless s is real | holds |
| 8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; n=1; n≥2 (p=2, n=2) | p²≥4>2 points; free quotient of S¹ is S¹ with cyclic deck group; dim H^(n+1)(B(C_p²);𝔽_p)=n+2 (4) against ≤1 | holds |
| 8.16 essential map | f=p∘q:T³→S² | π_k(T³)=0 for k≥2 and π₁(S²)=0; H₂ factors through H₂(S³)=0, H₃(S²)=0; a lifted nullhomotopy ends in a fibre S¹ with H₃=0, against degree 1 | holds |
| 6.2 `lsCupLength_add_one_le_categoryCount` | point; S¹; T²; ∅; zero ring | 0+1≤1; 1+1≤2; 2+1≤3; count 0, excluded by `[Nonempty X]`; 0+1≤n | holds |
| 6.4 `poincareDuality_of_isFundamentalClass` | two points; 2[S¹]; RP² over ℤ/4 | (a,b)↦(u₁a,u₂b) bijective; local image 2, not fundamental; image 2∈ℤ/4 does not generate, nothing claimed (H⁰=ℤ/4, H₂=ℤ/2) | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP² over 𝔽₂; μ=0 | Betti 1,1,1 matched; zero class fails | holds |
| 6.6 `productBallImages_intersect` | p=q=0; p=0; f(x)=(x,0), g(y)=(0,y) | one point; g₂ missing z would retract D_q onto S_q; common point (0,0); on S_p×D_q the norm is ≥1−(1−t)=t | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | Hopf; Klein bottle; empty base | 0=2·0; 𝔽₂: 1−2+1, ℚ: 1−1+0, both 0=0·0; 0=0 | holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ/2; S₃ | point; RP∞; π₁ of order 6, nonabelian | holds |
| 8.11 `finiteSourceMappingCWType` | X=∅; βℕ into S⁰; S¹ into S¹⊂ℝ² | one point; discrete with 2^ℵ₀ points; components ℤ against contractible C(S¹,ℝ²) | holds |
| 8.5 `HasProperHomotopyExtensionProperty`, `properStrongDeformationRetract_of_inverse` | A=∅; A=X; (I,{0}); (I,{0,1/n}); (ℝ,{0}) | K=f∘pr; K=H; piecewise K; no retraction of I×I; g not proper, hypotheses fail | holds |
| 4.4 isometry A | n=1, n=2 | det(x₁,−x₀)=+1; det(x₂,−x₀,x₁)=−1=(−1)^(n+1) | holds |
| 4.7 radial map | n=2, z=(1,0) | w=(−1,1,0), m=1, weights (0,2/3,1/3) on the face opposite e₀ | holds |
| 4.8 compact generation | Sierpiński space | the map [0,1]→S with 0↦0, t>0↦1 is continuous and pulls {0} back to {0}, not open: the same three opens | holds |
| 6.0 difference map | constant ℤ tower; ×2 tower | δ(3,1,0,…)=(2,1,0,…); (1,0,1,0,…) has no preimage | holds |
| Hurewicz locators (previous R02) | Hatcher 4.32 against 4.37 | 4.32: πₙ≈Hₙ, no map; 4.37: h′ an isomorphism, absolute case A a point | repaired |
| May locator (R02) | contents of the book | six chapters I–VI; §12 is "Weak homotopy type"; simplicial groups are §17, realization §§14–16 | locator wrong |
| Anchor table (previous R03) | eight headings | recomputed anchors equal the "Anchor now" column in all 8 rows | repaired |

**Library declarations opened at the pins** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).
- For §8.10: `Cohomology/Kronecker.lean:65` (`singularKronecker`), `:89` (naturality); `Homotopy/Hurewicz/Basic.lean:157`, `:213` (`HomotopyGroup.hurewicz_map`); `Homotopy/Whitehead.lean:203`, `:216`; `Singular/Homotopy/WeakHomotopyEquivalence.lean:110`; `EilenbergMacLane/Basic.lean:58` (`IsAspherical`: path connected and π_(n+2) trivial), `:123`; `Topology/Homotopy/HomotopyGroup/LoopSpace.lean:321` (`pathLoopSpaceMulEquiv`); `Topology/CWComplex/Classical/CWType.lean:38`.
- For the sample: `Topology/Homotopy/SerreFibration/Basic.lean:107`, `:172`, `FiberBundle.lean:365`, `:395`; `Singular/CrossProduct.lean:100`; `Singular/Kunneth/Basic.lean:257`, `Sequence.lean:400`, `:416`; `FundamentalGroup/VanKampen/Basic.lean:774`, `Presentation/Cover.lean:138`, `:163`, `Presentation/Basic.lean:104`, `:140`; `FundamentalGroupoid/Cech/Diagram.lean:44`, `:66`, `Colimit.lean:141`; `Singular/Transfer/Basic.lean:179`; `EulerCharacteristic/Product.lean:48`, `:80`, `:90`; `Homotopy/CWApproximation/Basic.lean:176`; `ClassifyingSpace/Cohomology.lean:89`; Mathlib `Topology/Sets/OpenCover.lean:27`.
- The worker's resolver reports every other backticked library name found; its one lead, `Singular.BrouwerFixedPoint` (`README.md:397`), is a module name.

**Cross-roadmap citations** (resolved on main 3090489).
- Every supplier is on main: DGFloer (Layer 1 item 4's Eilenberg–MacLane family at `README.md:673`–`:690`, with n=1 the nerve of `Multiplicative A` and n≥2 the realization of Γ(A[n])), GeneralizedCohomology (`realizationProductKelleyComparison` at `:234`, `numerableFiberBundle_hurewicz` at `:651`), GeometricTopology, DifferentialGeometry, CharacteristicClasses, ComplexKahlerGeometry, TopologicalKTheory, and UniversalCovers under `Completed/`.
- TangentialBordism, DeRhamCohomologyAndDuality and "the homotopy-sphere roadmap" (`README.md:199`, `:4619`, `:4621`) occur only as consumers. No roadmap on the never-cite list is a supplier.

**Overlaps and ownership.**
- No id this README cites is dropped by an open pull request or defined only by an open revision.
- The overlap check still lists `#stage-2-…`, `#stage-4-…`, `#stage-6-…` and `#stage-8-…` as dropped and cited (GeneralAlgebraicKTheory, MorseTheory, DerivedModuleAlgebra, GeneralizedCohomology). The README now maps each in the table at `:856`–`:865`, which is the repair the rule asks for, so I do not raise it.
- The conflicting heads and DGFloerPartII are R01. Ownership against the other open pull requests was checked through the overlap list and searches of the pinned libraries, not by reading each of their folders.

## Not verifiable

- **Uncertified manifest entries cited by locator:** Thom 1954, Chapter II (§8.13); Lee, Theorems 6.26, 6.30, 6.35, 6.36 (§8.13); Milnor, *Morse Theory*, Lemmas 3.6–3.7 (§4.5); Freedman–Quinn §7.7 (§8.5); Weibel; tom Dieck; Serre 1953; Dowker 1952.
- **Conway–Friedl–Herrmann:** the published page numbers (494, 499, 502, 503–504) were not checked against the publisher's text in this round.
- **Chapter-level citations with no manifest copy:** Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary, K. Brown *Cohomology of Groups*.

## Source issues

- none
