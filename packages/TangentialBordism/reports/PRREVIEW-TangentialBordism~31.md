# Review of TangentialBordism (pull request #942 at b2c841c)

**Verdict:** accepted

This is a full review of `TauCetiRoadmap/TangentialBordism/` at b2c841c. All five findings of the previous review are repaired, and the full pass found nothing new. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with twelve `sorry` warnings and no other message. The folder is ready for a human's final approval.

## Verified sound

### The previous review's findings (PRREVIEW-TangentialBordism~30, read at 3324fdd)

- **R01 (P2), Sard in unequal dimensions had two owners: repaired.**
  - `Suggested.lean` no longer declares `isNullSet_image_criticalPoints_of_boundaryless`. The name occurs nowhere in the README, on main or at any open head (`roadmaps grep`, 0 matches).
  - `README.md:101–107` now reads "Sard's theorem in all dimensions for boundaryless sources is DifferentialGeometry 10.2's … B1.6 owns the extension of 10.2's theorem to sources modelled on the half-space or carrying DifferentialGeometry 5.5b's smooth face structure".
  - The DifferentialGeometry row (`:459`) lists 10.2 with its hypotheses (C^∞, M boundaryless and Lindelöf, no relation between the dimensions). 2.1's Sard bullet (`:615–640`), the parametric route (`:676`, `:690`), the exhaustion argument (`:780`), 2.1's *Needs:* (`:815`) and the Layer 2 Dependencies (`:1133`) all cite 10.2.
  - The reason for the split is stated with a witness: f(t)=t on [0,∞) reads as t↦max(t,0) in the pinned chart, which is not differentiable at 0, while the flat theorem needs `ContDiffAt`.
- **R02 (P3), the description listed #1663 and omitted #886: repaired.** The description now has "depends on: #1652". #886 is in the merge-order chain and in the revision line ("#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)"). #1663 no longer appears.
- **R03 (P3), missing DGAInfinity row and DGFloer item 4: repaired.** `README.md:463` is the DGFloer row "Layer1 items2–4", with item 4's Eilenberg–MacLane spaces and loop-fibre identification. `:464` is a new DGAInfinity Layer 0 row. Both are resolved on main below.
- **R04 (P3), 4.4's Adams-tower target rendered inside a Check: repaired.** `:1462–1463` ends at "by induction on n.", `:1465–1484` is an ordinary paragraph after a blank line, and the three bullets are in the single **Checks.** list at `:1492–1508`.
- **R05 (P3), "dropping second countability": repaired.** `:708–709` reads "admitting corners and in the control D of the homotopy". The phrase "second countability" no longer occurs in the README.

### Gate, order, build, signatures and padding

- **Gate**, rerun on b2c841c with `--base origin/main`: every counter is 0 and the line ends `OK`. The diff against `origin/main` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The worktree is clean.
- **Dependency check** (`--movable`):

  ```
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The merge order has this roadmap at line 14. The README cites none of the never-supplier roadmaps.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with twelve `declaration uses sorry` warnings (`:88`, `:111`, `:127`, `:156`, `:174`, `:192`, `:207`, `:223`, `:242`, `:268`, `:290`, `:316`) and no other message.
- **`#check @` audit.** On a scratch copy I appended `#check @` for all twelve theorems and elaborated it once. Each type matches its README statement:
  - `n ≤ 6` and `NeZero n` where stated, `0 < N`, `T2Space`, `CompactSpace`, `SigmaCompactSpace`, `LindelofSpace`, `BoundarylessManifold J P`;
  - `Set.MapsTo f (interior M)ᶜ A` for f(∂M)⊆A;
  - `Submodule.span ℤ {local image} = ⊤` on the integral pair statements, and `≠ 0` on the mod-2 statements.

  The file has no section `variable`s, so no binder can be lost. Nothing changed.
- **Padding probe.** On a second copy every `sorry` was replaced by `first | rfl | trivial | infer_instance | simp | aesop`. All twelve fail: eleven with "unsolved goals", and the half-space Sard theorem with "aesop made no progress". None is padding.

### Headline theorems

Stated (12):
- B1.6: relative smoothing, and Sard for half-space sources;
- B3.1: parallelization of oriented three-manifolds, ΩSO_n=0 for 1≤n≤3 and ΩO_n=0 for n=1,3, as nullbordism statements;
- B6.3 absolute: integral realization for n≤6, the uniform multiple, degree-seven sharpness and mod-2 realization;
- B6.3 on pairs, n≥1: the integral range, the uniform multiple and mod-2 realization.

The docstring names every other headline as not statable, each with its missing carrier: corner Sard (face structure), transversality (no predicate), bordism groups and rings (no quotient), Spin entries (no Spin structure), Pontryagin–Thom (no Thom spectra), Steenrod/Adams (no operations), ABS/KO (no KO), projective transfers, and the Cayley plane (no compact Albert algebra). It also says that boundaryless Sard is DifferentialGeometry 10.2's and is not restated. I found no statable headline that is absent.

### Seeded sample: locators read in the text

| Target | README locator | Where in the source | Result |
| --- | --- | --- | --- |
| 1.1 (B3.2(a)) | GeometricTopology 4.3.1 | main `GeometricTopology/README.md`, Layer 4.3.1 | supports the itemized algebra; Checks computed below |
| 2.2 (B1.1) | no external locator; pinned names and supplier sections | `Sphere.lean:463` (generator [−b₀]−[b₀]); DifferentialGeometry 2.1, 2.2 on main and 5.5b at #886; AlgebraicTopology 6.3 at #1652 | supports; signs computed below |
| 2.3 (B1.5) | Munkres, Theorem 10.6, p.104 | not readable | Not verifiable |
| 2.7 (B1.7) | Milnor–Stasheff, Problem 16-D, p.203; Gompf–Stipsicz §§3.1, 8.3; IndexTheory I7.2 | milnorStasheff lines 5357–5364 (footer 203 at 5365); IndexTheory I7.2 at #1077 | Problem 16-D supports (c(Kⁿ)=c(Kⁿ⁺¹)/(1+u), s_n=d(n+2−dⁿ)); Gompf–Stipsicz not verifiable |
| 3.1 (B2.1) | Milnor–Stasheff Ch.17, Lemma 17.2 | milnorStasheff lines 5452–5465 | supports |
| 3.3 (B2.3) | Freed, Lecture 12, p.103; Miller Ch.1 Thm 4.2, p.10 | freedBordism lines 4226–4246 (footer 103 at 4247); millerCobordism line 392 (header p.10 at 388) | supports: Freed asserts the homology-theory axioms for every stable tangential structure; Miller's 4.2 is Whitehead's theorem for a spectrum |
| 4.1 (B4.1) | Hatcher §4.L (1)–(7) p.489, Adem p.496, Thms 4L.12 p.504, 4L.13 p.506; Medina-Mardones Defs 1–2; Milnor–Stasheff Ch.8 | hatcherAT lines 21048–21060, 21406–21409, 21777, 21864; medinaMardonesCupI lines 239–266; milnorStasheff lines 2499–2522 | supports |
| 4.2 (B4.2) | Guillou–Weibel v1 Thm 6.2, p.18; Miller Ch.1 Thm 11.2 | guillouWeibel lines 752–759 (page 18 from 726); millerCobordism line 1142 | supports |
| 4.4 (B4.7) | Hatcher §4.L (1)–(6) pp.489–490, Adem p.496, Thm 4L.16 p.513; Guillou–Weibel Def 6.1, Thm 6.2 p.18, Thm 6.5(1)–(3) p.19 | hatcherAT lines 21083–21093, 21410–21411, 22197 (header 513 at 22164); guillouWeibel lines 748–759, 784–788 | supports: 6.5(1) gives τβ=−βτ, 6.5(3) gives x^(ℓ−1)⊗y ↦ −Q^a(y) for n=2a |
| 5.7 (B5.7) | Hatcher SS Ch.1 §1.1, pp.18–19 | hatcherSS lines 997–1012 | supports: E²=H_p(X;h_q(pt)), finite-dimensional convergence, naturality |
| 6.3 (B4.6) | Milnor–Stasheff, Problems 16-D–F, pp.203–204 | milnorStasheff lines 5357, 5370, 5379 | supports: 16-E is the degree-(1,1) hypersurface, 16-F the mod-2 calculus |
| 6.4 (B4.8) | Milnor, §4, Theorems 4–5, p.519 | not readable | Not verifiable; series computed below |
| 7.1 (B3.0) | Atiyah–Bott–Shapiro §§10–11 | uncertified | Not verifiable |
| 8.2 (B3.2(c)) | Atiyah §4, Prop 4.1 and Thm 3′, p.58 | atiyahSpin1971 lines 419 and 432 (PDF page 13 = printed 58) | supports: the mod-2 index criterion and the count of bounding Spin structures |
| 9.1 (B3.6) | Baez §§3.4 and 4.2 | baezOctonions lines 1297 (§3.4, OP² and the exceptional Jordan algebra) and 1768 (§4.2, F₄) | supports |

The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | C=M; M=P=S¹ with D={\|p−q\|<1} | C=M: g=f with the constant homotopy. g=−z has \|g(z)−z\|=2∉D, so it is excluded. | pass |
| `isNullSet_image_criticalPoints_halfSpace` | f=t and t² on [0,∞); t↦(t,0) into ℝ²; (t,s)↦s on [0,∞)×ℝ; ℝ²_δ×[0,∞) | t is regular at 0 (derivative 1) but critical on the stratum {0}; t² is critical at 0 with image {0}, null. For t↦(t,0) every point is critical and the half-line is null in ℝ². The projection has derivative (0 1), no critical point, and image ℝ, not null. Without Lindelöf the critical values are all of ℝ². | pass |
| 2.1 Sard route | number of strata; n=1 | A face-structured n-manifold has the n+1 strata M_0…M_n, so "finitely many" is right. For n=1 the boundary stratum is a 0-manifold, where every point is critical and the image is countable, null when dim N≥1. | pass |
| `orientedThreeManifold_parallelization` | A=∅; RP²×ℝ; the ℝ³ frame | `IsOrientedAtlas` requires the atlas to cover M, so A=∅ is excluded on nonempty M. RP²×ℝ has no oriented atlas. det(e₁,e₂,e₃)=1 and det(−e₁,e₂,e₃)=−1. | pass |
| `closedOrientedManifold_isOrientedBoundary` | n=0,1,3,4; M=∅ | A point has signed count 1≠0. S¹=∂D². n=3 is Rokhlin (thom1954 line 2688). CP² has σ=1. M=∅ gives W=∅. | pass |
| `closedManifold_isBoundary` | n=1,2,3 | S¹=∂D². RP² has χ=1, odd, so n=2 is excluded. 𝔑₃=0 (thom1954 line 2619). | pass |
| `exists_mapFundamentalClass_eq` | n=0; n=6 over K(ℤ/m,1); n=7 | k[pt] is realized by \|k\| signed points. H₆(B(ℤ/m);ℤ)=0. n=7 is excluded by the sharpness row. | pass |
| `exists_pos_forall_mapFundamentalClass_eq_nsmul` | N=0; quantifier order | 0•z=0=f_*[∅] would make the statement vacuous, so 0<N is needed. ∃N∀X matches III.4, whose N depends only on the degree (thom1954 line 1826). | pass |
| `exists_not_mapFundamentalClass_eq_seven` | X=L×L, L=S⁷/C₃ | Applying the operation to u₁³v₂−v₁u₂³ with u⁴=0, v²=0 leaves −v₁v₂u₁³u₂³≠0 mod 3. | pass |
| `exists_modTwoFundamentalClass_map_eq` | RP²; n=0 | H₂(RP²;F₂)=F₂ is realized by the identity while H₂(RP²;ℤ)=0. The local groups are F₂, so "≠0" pins μ. | pass |
| `exists_relFundamentalClass_map_eq` | ([0,1],{0,1}); 2μ; A=∅; A=X | H₁=ℤ is realized by the identity with local image ±1. 2μ spans 2ℤ≠⊤ and is excluded. A=∅ forces ∂M=∅. H_n(X,X)=0 is realized by ∅. | pass |
| `exists_pos_forall_relFundamentalClass_map_eq_nsmul` | N=0 | 0<N is needed as in the absolute case. | pass |
| `exists_modTwoRelFundamentalClass_map_eq` | Möbius band B | ∂B is twice the core in H₁(B), so H₂(B,∂B;ℤ)=0 while H₂(B,∂B;F₂)=F₂, realized by the identity. | pass |
| 1.1 Checks | zero form; xy; x²+xy+y²; two copies | Zero form: Arf 0, Gauss sum 1=2⁰. xy: q(1,0)=0, Arf 0·0=0. Anisotropic: q(1,0)=q(0,1)=1 and q(1,1)=3=1, Arf 1. On the diagonal q(v,v)=2q(v)=0 and B=2B=0, a q-zero subspace of dimension 2 in dimension 4. | pass |
| 2.2 Checks | interval; cylinder I×[0,1]; u₁ | ∂[0,1]=[1]−[0], total 0. det(e_t,e_s)=1, det(−e_t,−e_s)=1, det(−e_s,e_t)=1, det(e_s,−e_t)=1; the free face is −(I×∂[0,1]), sign (−1)¹. Pinned generator [−b₀]−[b₀] against [1]−[−1] gives u₁=−1. | pass |
| 2.3 Checks | ℝ/ℤ; mapping tori; rank 0 and 1 disc bundles | ℝ/ℤ=S¹. Identity monodromy gives T², a reflection the Klein bottle. The rank-one disc over a point is [−1,1] with 2 boundary points; rank zero is a point with empty boundary. | pass |
| 2.7 | Fermat quartic; E(1) | (1+h)⁴/(1+4h)=1+6h², so c₁=0, c₂[M]=6·4=24, p₁=−2c₂=−12h², p₁[M]=−48, σ=−16, Â=48/24=2. Problem 16-D's formula gives s₂=4(4−16)=−48. For E(1): (3H−ΣE_i)²=9−9=0, χ=3+9=12, σ=1−9=−8, and (3,−1,…,−1) is characteristic for diag(1,−1,…,−1). | pass |
| 3.1, 3.3 Checks | ±pt; interval over its endpoints | (+pt)+(−pt) bounds an interval; (+pt)+(+pt) has count 2. The interval maps to (−1,1), whose sum is 0. Ω(X,X)=0. | pass |
| 4.1 | the edge [0,1]; c of degree 2 | −∂([0,1]⊗[0,1])=[0]⊗[0,1]−[1]⊗[0,1]+[0,1]⊗[1]−[0,1]⊗[0]=AW−T·AW. From dD₁+D₁d=(1−T)D₀ with a=c, b=δc (sign +, δδc=0): δ(c∪₁δc)=c∪δc−δc∪c−δc∪₁δc. | pass |
| 4.2 Check | Adams d₂ | (s,t)=(1,2)↦(3,3), stem 1→0 | pass |
| 4.4 | K(ℤ/3,2); Kudo with k=1 | Generators ι₂, βι₂, P¹βι₂, βP¹βι₂ in degrees 2, 3, 3+4=7, 8. r=2k(p−1)+1=5 and the transpotence has degree 2kp+2=8. z²=−z² gives z²=0 at p=3 only. | pass |
| 5.7 Checks | X=pt; total degree 0 | Only p=0 survives over a point. With Ω_q=0 for q<0, total degree 0 has only (0,0). | pass |
| 6.3 | H_R(2^r,2^(r+1)s); H(2,4); H(1,2) | Dimension 2^r(2s+1)−1=d. Bit r of 2^r(2s+1) is 1, so C(m+n,m) is odd by Lucas. C(6,2)=15 is odd. C(3,1)=3 is odd although H(1,2) has Newton number 0, so m,n≥2 is needed. | pass |
| 6.4 | p=3; p=5 | 2k+1∈{3,9} is excluded at p=3, so C starts 1+t⁸+t¹²; ξ₁ has degree 2(3−1)=4 and fills H₄. \|v₁\|=(1,5), stem 4. At p=5, v₁ has stem 8 and k=1 stays. | pass |
| 7.1 Checks | K3; K3×K3 | Â=2 and c(a)=2u², so α=a; a²=4b. | pass |
| 8.2 Checks | q(a)=q(b)=0; two Lie tori | Arf 0 with the q-zero line ⟨a⟩. Arf 1+1=0 for two copies. | pass |
| 9.1 Check | (x,y)=(i,j); general chart change | A₁₁=1/3, A₀₁=−i/3, A₂₁=j(−i)/3=k/3, so chart1 reads (−i,k)=(x⁻¹,yx⁻¹); x⁻¹y=−k. In general A₀₁/A₁₁=x̄/N(x)=x⁻¹ and A₂₁/A₁₁=yx̄/N(x)=yx⁻¹. | pass |

### Library declarations opened at the pins

Mathlib and Tau Ceti as pinned by the branch's `lake-manifest.json`.

- **Sard and null sets:** `TauCeti.isNullSet_image_criticalPoints` and `TauCeti.dense_isRegularValue` (`Geometry/Manifold/Sard/EqualDimension.lean:105`, `:112`; the latter has `hdim : finrank ℝ E = finrank ℝ E'`); `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean`, `ContDiffAt` on U). The pin has no null-set Sard theorem in unequal dimensions, so `isNullSet_image_criticalPoints_halfSpace` is not already proved.
- **Signatures.** `scratch/signatures.md` and my own `#check @` run agree on all twelve declarations. `scratch/library-matches.md` has no same-name hit.
- The other pinned declarations opened in the previous review (orientation, local homology, Pontryagin–Thom, Clifford and Spin carriers) are unchanged, since the pins and those statements are unchanged.

### Cross-roadmap citations resolved

- **DifferentialGeometry, #886 at 5436a54.**
  - 10.2 (`README.md:2647–2668`): the target is Sard in all dimensions for a C^∞ map with M Lindelöf, from the flat Morse–Sard theorem in pairs of extended charts. On main 10.2 is the equal-dimension theorem only (`:884`), so this citation depends on #886, which the description names.
  - 10.2's target sentence does not state a boundary hypothesis, and its route reaches interior points only. This README consumes the boundaryless case, says so in the supplier row, and gives the reason its half-space and face-structured forms are a separate theorem. The citation is exact as written.
  - 5.5b's face structure is at `:1883–1990`.
- **AlgebraicTopology, #1652 at c610f76:** 6.3, 6.4 and 8.13 as before. Its scope paragraph (`:100–109`) assigns B1.6 "its own Sard theorem in unequal dimensions on manifolds with corners", which agrees with this head.
- **DGFloer, on main:** Layer 1 item 2 has the multiplicative cohomological Serre sequence with local coefficients (`:559–611`); item 3 the filtered-complex spectral sequence and its convergence theorems (`:621–658`); item 4 the functorial K(A,n), its uniqueness and the identification of ΩK(A,n) with K(A,n−1) for n≥2 (`:659` onward).
- **DGAInfinity, on main:** Layer 0 (`:263–287`) has graded modules with duals under finite-projectivity hypotheses, homogeneous multilinear maps with Koszul signs, and the braiding x⊗y↦(−1)^(\|x\|\|y\|) y⊗x on cochain complexes. The new row describes exactly these.
- **StringOrientation (#948 at 07f0981), IndexTheory (#1077 at 6d85f5d), GeometricTopology, LieHighestWeight, SpinGeometry, CharacteristicClasses, GeneralizedCohomology and the others on main:** the heads are the ones the previous review resolved, and the citing passages did not change.
- **Ownership sweep.** Sard in unequal dimensions now has one owner per source class: DifferentialGeometry 10.2 (boundaryless) and B1.6 (half-space and face-structured). No other open head or roadmap on main states the half-space or corner form.
- **Overlaps** (`scratch/overlaps.md`, five items, each checked):
  - no open pull request changes this roadmap or drops a cited id;
  - 5.5b (#886) and AlgebraicTopology Layers 2/4/6/8 (#1652) are defined only at those heads, and the description names both;
  - of the vocabulary neighbours, HomotopySpheres is not cited, StringOrientation is an earlier supplier, FourManifolds is a later consumer, and GeneralizedCohomology is cited at its main numbering.

## Not verifiable

- **Munkres**, *Elementary Differential Topology*, Theorem 10.6 (2.3). Not in the sources cache; cited by locator.
- **Gompf–Stipsicz**, §§3.1 and 8.3 (2.7). Not in the sources cache. The E(1) numbers were recomputed above.
- **Milnor 1960**, §4, Theorems 4–5, p.519 (6.4). Not in the sources cache. The Poincaré series and degrees were recomputed above.
- **Atiyah–Bott–Shapiro** (7.1) and **Kreck–Stolz** (10.4): recorded `uncertified` in the manifest.
- **Lee**, *Introduction to Smooth Manifolds* (2.1, 8.5), and **Wall 1960**, **Anderson–Brown–Peterson**, **Stolz 1992**, **Stong**, **McCleary**: not in the sources cache. This review edits no manifest, so they were not fetched.

## Source issues

- none
