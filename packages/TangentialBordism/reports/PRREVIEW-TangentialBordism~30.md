# Review of TangentialBordism (pull request #942 at 3324fdd)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/TangentialBordism/` at 3324fdd. The folder has not changed since the previous review. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with thirteen `sorry` warnings and no other message.

There are five findings:
- R01 (P2) is a second owner of Sard's theorem in unequal dimensions. The cited supplier's open revision now claims the theorem.
- R02 (P3) is the pull-request description, unchanged since the last two reviews.
- R03–R05 (P3) are a supplier row that is missing or incomplete, a Markdown layout fault in 4.4, and one overclaim in 2.1.

## R01 (P2) — Sard in unequal dimensions has two owners: DifferentialGeometry §10.2 and B1.6

**Location.**
- `TauCetiRoadmap/TangentialBordism/README.md:101–104`: "B1.6 owns the Sard theorem in unequal dimensions for sources that are boundaryless, modelled on the half-space, or carry DifferentialGeometry 5.5b's smooth face structure".
- The same claim appears at `:12–15`, `:448`, `:449` ("B1.6 owns the Sard theorem in unequal dimensions and derives its transversality theorems from it"), `:549–551` and `:603–614`.
- `Suggested.lean:101–117` states `isNullSet_image_criticalPoints_of_boundaryless`, and `:119–133` states `isNullSet_image_criticalPoints_halfSpace`.

**Claim.** B1.6 is the only owner of the unequal-dimension manifold Sard theorem.

**Witness.**
- At the head of #886 (5436a54), DifferentialGeometry claims the same theorem. `TauCetiRoadmap/DifferentialGeometry/README.md:2657–2659` reads: "**The target** is Sard's theorem in all dimensions: for a `C^∞` map `f : M → N` between finite-dimensional manifolds with `M` Lindelöf, the set of critical values … is null in `N`". Its summary at `:99` also lists "Sard in all dimensions (10.2)".
- AlgebraicTopology at the head of #1652 (c610f76), `README.md:4261–4262`, still reads 10.2 as "Sard in equal dimensions only". So the open pull requests now disagree about who owns the theorem.

**Repair.**
- DifferentialGeometry is on main and earlier than this roadmap, so it is the owner, and this roadmap narrows its claim. Cite DifferentialGeometry §10.2 for the boundaryless case:
  - delete `isNullSet_image_criticalPoints_of_boundaryless` from `Suggested.lean` (`:101–117`), from the summary (`:13–15`) and from the 2.1 Sard bullet (`:610–611`);
  - add "10.2 (Sard in all dimensions, boundaryless sources)" to the DifferentialGeometry row (`:449`) and to 2.1's *Needs:* line (`:803`).
- Keep `isNullSet_image_criticalPoints_halfSpace` and the face-structured form as B1.6's own:
  - rewrite `:101–104`, `:448–449` and `:549–551` to say that B1.6 extends DifferentialGeometry §10.2 to sources with boundary and with face-structured corners by the stratum route;
  - give the reason: the flat theorem `TauCeti.addHaar_image_criticalPoints_eq_zero` needs `ContDiffAt` at each point (`TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:347–349`), and chart representatives satisfy this only at interior points.
- The description then names #886 for both 5.5b and 10.2 (R02).
- The alternative is for #886 to narrow §10.2 back to equal dimensions, which is how AlgebraicTopology 8.13 already reads it. One of the two changes is needed; a second owner cannot stay.

## R02 (P3) — The description still lists #1663 and does not name #886

Re-raised: H01

**Location.** The pull-request description, quoted as data:
- "- [ ] depends on: #1663";
- "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

#886 appears nowhere in it.

**Claim.** The description names every open revision whose numbering the README cites, and names only pull requests that are open.

**Witness.**
- DifferentialGeometry on main contains "5.5b" 0 times; at #886 (5436a54) it is the smooth-face item at `README.md:1883`.
- The README cites 5.5b 23 times, among them `:103`, `:449`, `:544`, `:582–588`, `:803` and `:1029`.
- `roadmaps list` (index of 2026-11-10) has no #1663.

**Why the reason in H01 fails.** H01 accepts the finding and says that only the description is affected, which a repair job cannot edit. That explains why no file changed. It does not close the finding: the overlap rule keeps an unnamed revision a P3 until the description or its merge-order paragraph names it, and three reviews later the description is unchanged.

**Repair.** No file changes. In the description:
- delete "depends on: #1663";
- add #886 to the Depends-on block and to the merge-order chain;
- write the revision line as "#886 (DifferentialGeometry 5.5b and, after R01, 10.2), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".

## R03 (P3) — The supplier contracts omit DGAInfinity and DGFloer Layer 1 item 4

**Location.** The table at `README.md:446–461` has no DGAInfinity row, and its DGFloer row (`:453`) reads "[DGFloer], Layer1 items2–3".

**Claim.** The supplier contracts list every consumed supplier section.

**Witness.**
- DGAInfinity Layer 0 is consumed at four places in Layer 4:
  - `:1320` (4.1 *Needs:*, "DGAInfinity Layer 0 signed tensors");
  - `:1465` ("Use DGAInfinity Layer0's signed graded tensor/dual infrastructure");
  - `:1498` (4.4 *Needs:*);
  - `:1506` (Layer 4 Dependencies).
- On main this is `TauCetiRoadmap/DGAInfinity/README.md:263`, "Layer 0: signed graded multilinear and tensor-coalgebra infrastructure".
- 4.2's *Needs:* (`:1376`) and the Layer 4 Dependencies (`:1506`) cite "DGFloer Layer 1 items 2–4". On main, item 4 of DGFloer Layer 1 is "Serre classes and Hurewicz modulo a class" (`TauCetiRoadmap/DGFloer/README.md:659`).

**Repair.**
- Add a row: "[DGAInfinity](../DGAInfinity/README.md), Layer 0 | Koszul-signed graded multilinear maps, tensors, duals and the braiding (−1)^(\|a\|\|b\|) | B4.1's integral higher diagonals and B4.7's odd Hopf objects and exterior Q_i are built on it".
- Change the DGFloer row to "Layer1 items2–4", adding "item 4's Serre classes and Hurewicz theorem modulo a class" to its interface column.

## R04 (P3) — In 4.4 the odd-prime Adams-tower target renders inside a Check

**Location.** `README.md:1450–1451` ends a prose paragraph with "…by induction on n. **Checks.**". Three bullets follow (`:1453–1464`), and then, with no blank line, prose resumes at `:1465` ("Use DGAInfinity Layer0's …") and runs to `:1484`. The subsection has a second **Checks.** block at `:1492`.

**Claim.** Each subsection lists its targets as prose, followed by its API and then its Checks.

**Witness.** In CommonMark, a non-indented line that directly follows a list item with no blank line continues that item. So `:1465–1484` render inside the third Check bullet. That passage holds the odd Hopf-object conventions and the HF_p Adams tower, which 6.4 and BordismFormalGroups consume. My scan of the README found no other such line.

**Repair.**
- End `:1450` at "by induction on n.".
- Move the three bullets of `:1453–1464` into the Checks list at `:1492–1496`.
- `:1465–1484` then becomes an ordinary paragraph before the API list at `:1486`.

## R05 (P3) — 2.1 says relative smoothing "drops second countability", which it does not

**Location.** `README.md:697–698`: "the statement here differs from it in admitting corners, in dropping second countability and in the control D of the homotopy".

**Claim.** `exists_contMDiff_homotopicRel`, with hypotheses `[SigmaCompactSpace M]` and `[T2Space M]`, is more general than AlgebraicTopology 8.13 in not assuming second countability.

**Witness.** The model space is finite-dimensional, so H is second countable (Mathlib `ModelWithCorners.secondCountableTopology`, `Geometry/Manifold/IsManifold/Basic.lean:452`). Then `ChartedSpace.secondCountable_of_sigmaCompact` (`Geometry/Manifold/ChartedSpace.lean:236`) makes M second countable, as `README.md:178–179` itself says.

**Repair.** Replace the clause with "differs from it in admitting corners and in the control D of the homotopy". The Lean statement is unchanged.

## Verified sound

### The previous review's finding (PRREVIEW-TangentialBordism~29)

- **R01 (P3), the description omits #886: not repaired.** The description still has "depends on: #1663" and the revision line "…merge first: #1652". The last repair report (H01) answered it with no change. It is re-raised above as R02.

### Gate, order, build, signatures and padding

- **Gate**, rerun on 3324fdd with `--base origin/main`: every counter is 0 and the line ends `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The worktree is clean.
- **Dependency check** (`--movable`):

  ```
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. ORDER.txt has this roadmap at line 14, after EllipticCohomology (6), IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). The README cites none of the never-supplier roadmaps (0 matches).
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with thirteen `declaration uses sorry` warnings (`:86`, `:107`, `:125`, `:141`, `:170`, `:188`, `:206`, `:221`, `:237`, `:256`, `:282`, `:304`, `:330`) and no other message.
- **`#check @` audit.** On a scratch copy I appended `#check @` for all thirteen declarations and elaborated it once. Each type matches its README statement:
  - `n ≤ 6` and `NeZero n` where stated, `0 < N`, `T2Space`, `CompactSpace`, `SigmaCompactSpace`, `LindelofSpace`, `BoundarylessManifold`;
  - `Set.MapsTo f (interior M)ᶜ A` for f(∂M)⊆A;
  - `Submodule.span ℤ {local image} = ⊤` on the integral pair statements, and `≠ 0` on the mod-2 statements.

  The file has no section `variable`s, so no binder can be lost. Nothing changed.
- **Padding probe.** On the same copy every `sorry` was replaced by `first | rfl | trivial | infer_instance | simp | aesop`. All thirteen fail: eleven with "unsolved goals" and the two Sard theorems with "aesop made no progress". None is padding.

### Headline theorems

Stated (13):
- B1.6: relative smoothing, and Sard for boundaryless and half-space sources (but see R01);
- B3.1: parallelization of oriented three-manifolds, ΩSO_n=0 for 1≤n≤3 and ΩO_n=0 for n=1,3, as nullbordism statements;
- B6.3 absolute: integral realization for n≤6, the uniform multiple, degree-seven sharpness and mod-2 realization;
- B6.3 on pairs, n≥1: the integral range, the uniform multiple and mod-2 realization.

The docstring names every other headline as not statable, each with its missing carrier: corner Sard (face structure), transversality (no predicate), bordism groups and rings (no quotient), Spin entries (no Spin structure), Pontryagin–Thom (no Thom spectra), Steenrod/Adams (no operations), ABS/KO (no KO), projective transfers, and the Cayley plane (no compact Albert algebra). I found no statable headline that is absent.

### Seeded sample: locators read in the text

| Target | README locator | Where in the source | Result |
| --- | --- | --- | --- |
| 1.1 (B3.2(a)) | GeometricTopology 4.3.1 | main `GeometricTopology/README.md:2430`: Gauss sum and zero count `:2441–2442`, two anisotropic planes `:2452`, m=0 `:2459` | supports every itemized fact of `:463–476` |
| 2.1 (B1.6) | Lee Thms 6.10, 6.26, 6.35, 6.36 | not readable | Not verifiable; pinned inputs verified (below) |
| 2.4 (B1.2) | Milnor–Stasheff Thm 17.1, Lemma 17.2, pp.206–207; Miller Ch.1 Defs 1.1–1.2, pp.1–2; Ch.2 Defs 1.1, 1.3, pp.39–41 | milnorStasheff line 5439 (footer 206 at 5445), line 5457 (p.207); millerCobordism lines 95 and 104 (header p.2 at 94), 1453 (p.39), 1538 (p.41) | supports; the proof of 17.2 uses ∂([0,1]×M)=M+(−M), the outward-first convention |
| 3.1 (B2.1) | Milnor–Stasheff Ch.17, Lemma 17.2 | milnorStasheff lines 5452–5465 | supports |
| 4.1 (B4.1) | Hatcher §4.L (1)–(7) p.489, Adem p.496, Thms 4L.12 p.504, 4L.13 p.506; Medina-Mardones Def 1 (5) p.6, Def 2 p.7; Milnor–Stasheff Ch.8 pp.100–101 | hatcherAT lines 21053–21060 (p.489), 21406 (p.496), 21777 (p.504), 21864 (p.506); medinaMardonesCupI lines 239–243 (p.6), 266 (p.7); milnorStasheff lines 2499–2522 | supports |
| 4.2 (B4.2) | Guillou–Weibel v1 Thm 6.2, p.18; Miller Ch.1 Thm 11.2 | guillouWeibel line 752 (p.18); millerCobordism line 1142 (Milnor's ℤ/2[ξ₁,ξ₂,…]≅A_*, p.30) | supports |
| 5.2 (B5.2) | Thom IV.8, p.75 | thom1954 line 2462, footer 75 at line 2464 | supports; only the stable coefficient theorem, as 5.2 says |
| 5.7 (B5.7) | Hatcher SS Ch.1, pp.18–19 | hatcherSS lines 997–1011 (General Homology Theories), 1012 (Naturality), p.18 | supports: E²=H_p(X;h_q(pt)), finite-dimensional convergence, naturality |
| 7.1 (B3.0) | Atiyah–Bott–Shapiro §§10–11 | uncertified | Not verifiable |
| 7.2 (B3.4) | Beaudry–Campbell Thm 5.1.1, Cor 5.1.2, p.42; Remark 3.2.2, p.18; Fig. 31, p.41 | beaudryCampbell lines 1770–1776, 792–796, 1741 | supports: M vanishes below degree 8; Ext_A agrees with Ext_A1 for t−s<8; the MSpin row is ℤ, ℤ/2, ℤ/2, 0, ℤ |
| 8.1 (B3.2(b)) | Atiyah Thm 5 with proof, pp.59–60; Thm 2, p.48 | atiyahSpin1971 lines 462–492 (header p.60 at 487), line 75 | supports; φ(a)−φ(0)=Spin(A) is the README's normalized q |
| 9.2 (B3.7) | no external locator; supplier sections and pinned names | StringOrientation S1.5 (#948, `README.md:458–512`); LieHighestWeight Layer 8 (main `:1351–1356`); 14 pinned names (below) | supports; the volume-sign Check computed below |
| 9.3 (B3.8) | Borel–Hirzebruch §19, Thm 19.4 | borelHirzebruchI lines 3021–3027 (p.535) | supports: p₂=6u, p₄=39u², index 1 for the u² orientation |
| 10.1 (B6.3) | Thom III.2–III.4 p.59, III.7 p.62, III.9 and example pp.62–63; Hatcher Thm 3.26 p.236, p.253 | thom1954 lines 1818–1828 (footer 59 at 1834), 1911 (p.62), 1936–1969; hatcherAT lines 10237–10246 (header 236 at 10232), 10966–10970 | supports; III.4's N depends "only on p" (line 1826), as `∃ N ∀ X z` states |
| 10.3 (B6.5) | Führing Thms 1.1 and 1.3, pp.355–357; §9 | fuehringProjective lines 18–20 (p.355), 66 (p.356), 1415–1431 (§9, G=SO(3), fibre RP²) | supports |

Further locators read: Thom IV.6 p.74 (thom1954 line 2410), IV.12 and "𝔑₃=0" p.79 (2610, 2619), IV.13 p.81 with Rokhlin (2686–2688); Milnor–Stasheff p.209, ΩSO_0≅ℤ (line 5503); Miller Thms 4.2 p.10 and 12.3–12.4 pp.32–33; Freed Prop 5.55 and (5.57) p.45 (lines 1805, 1817); Hatcher p.385, η³=12ν (line 16751); Benedetti–Lisca Thm 1 p.1 and §2.1 p.2; Rosenberg–Stolz Thm 3.3 p.8 (line 302); Borel–Hirzebruch §15.5 (13) p.519 (line 2417); Führing §3 p.359 and Prop 3.4 p.362. The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | C=M; M=P=S¹, D={\|p−q\|<1}; second countability | C=M: g=f with the constant homotopy. g=−z has \|g(z)−z\|=2∉D, so it is excluded. SigmaCompact plus a finite-dimensional model gives second countability (R05). | pass; R05 |
| `isNullSet_image_criticalPoints_of_boundaryless` | t↦(t,0); the projection ℝ²→ℝ; ℝ²_δ×[0,∞) | Every point is critical and the line is null in ℝ². The projection has no critical point, and its image ℝ is not null. Without Lindelöf the critical values are all of ℝ². | true; second owner (R01) |
| `isNullSet_image_criticalPoints_halfSpace` | f=t and t² on [0,∞); n=1 with E'=0 | t is regular at 0 (derivative 1) but critical on the stratum {0}; t² is critical at 0 with image {0}, null. With E'=0 every point is regular. The flat theorem needs ContDiffAt, hence the strata. | pass |
| `orientedThreeManifold_parallelization` | A=∅; RP²×ℝ; the ℝ³ frame | `IsOrientedAtlas.exists_mem_source` (OrientedAtlas.lean:288) excludes A=∅ on nonempty M. RP²×ℝ has no oriented atlas. det(e₁,e₂,e₃)=1 and det(−e₁,e₂,e₃)=−1. Positive transitions make positivity independent of the chart. | pass |
| `closedOrientedManifold_isOrientedBoundary` | n=0,1,3,4; M=∅ | A point has signed count 1≠0. S¹=∂D². n=3 is Rokhlin (thom1954 line 2688). CP² has σ=1. M=∅ gives W=∅. The orientation carrier has locally constant chart signs (Lift.lean:52–70). | pass |
| `closedManifold_isBoundary` | n=1,2,3 | S¹=∂D². RP² has χ=1, odd, so n=2 is excluded. 𝔑₃=0 (thom1954 line 2619). RP²×S¹=∂(RP²×D²). | pass |
| `exists_mapFundamentalClass_eq` | n=0; n=6 over K(ℤ/m,1); n=7 | k[pt] is realized by \|k\| points with signs. H₆(B(ℤ/m);ℤ)=ker(m)=0. n=7 is excluded by the next row. | pass |
| `exists_pos_forall_mapFundamentalClass_eq_nsmul` | N=0; quantifier order; n=7 | 0•z=0=f_*[∅] would make the statement vacuous, so 0<N is needed. ∃N∀X matches III.4. In degree 7, 3z=0 and ±z are not realized, so 3∣N. | pass |
| `exists_not_mapFundamentalClass_eq_seven` | X=L×L, L=S⁷/C₃ | X·(u₁³v₂−v₁u₂³): the term v₂² is 0, u₂⁵=0 since u⁴=0, v₁² is 0, leaving −v₁v₂u₁³u₂³≠0 mod 3. Thom prints +; see Source issues. | pass |
| `exists_modTwoFundamentalClass_map_eq` | RP²; n=0 | H₂(RP²;F₂)=F₂ is realized by the identity while H₂(RP²;ℤ)=0. The local groups are F₂, so "≠0" pins μ=[M]₂. For n=0, μ=Σ[x]. | pass |
| `exists_relFundamentalClass_map_eq` | ([0,1],{0,1}); 2μ; A=∅; A=X; AHSS d₂–d₆ | H₁=ℤ is realized by the identity with local image ±1. 2μ spans 2ℤ≠⊤ and is excluded. A=∅ forces ∂M=∅. H_n(X,X)=0 is realized by ∅. d₂–d₄ land in ΩSO_1–3=0. d₅ is torsion: into free H₀ for n=5, and for n=6 into H₁, detected in B(ℤ/m) where H₆=0. d₆ is detected in S⁰, where H₆=0. | pass |
| `exists_pos_forall_relFundamentalClass_map_eq_nsmul` | N=0; the obstruction group | 0<N is needed as above. [HZ, Σ(F/τ_{≥n}F)] is finite: F/τ_{≥n}F has f.g. groups ΩSO_q, 1≤q≤n−1, and H^j(HZ;B) is finite for j≥1. | pass |
| `exists_modTwoRelFundamentalClass_map_eq` | Möbius band B | ∂B is twice the core in H₁(B), so H₂(B,∂B;ℤ)=0 while H₂(B,∂B;F₂)=F₂, realized by the identity. | pass |
| 1.1 Checks | zero form; anisotropic plane; two copies | Arf 0 with Gauss sum 1=2⁰. q(1,0)=q(0,1)=q(1,1)=1, so Arf 1 with no nonzero zero. On the diagonal q(v,v)=2q(v)=0, a Lagrangian of dimension 2. | pass |
| 2.2 Check: u₁ | the pinned zero-sphere generator | `Sphere.lean:463`: [−b₀]−[b₀]. The AlgebraicTopology segment gives [1]−[−1], so u₁=−1. | pass |
| 2.4, 3.1 Checks | [0,1]∪[1,2]; ±pt | −[0]+[1]−[1]+[2] has total 0. (+pt)+(−pt) bounds an interval. (+pt)+(+pt) has count 2. | pass |
| 4.1 equations | the edge [0,1]; c of degree 2 | −d([0,1]⊗[0,1])=[0]⊗[0,1]−[1]⊗[0,1]+[0,1]⊗[1]−[0,1]⊗[0]=AW−T·AW. From dD₁+D₁d=(1−T)D₀: δ(a∪₁b)=a∪b−(−1)^{\|a\|\|b\|}b∪a−δa∪₁b−(−1)^{\|a\|}a∪₁δb, and with a=c, b=δc (sign +, δδc=0) this is the stated identity. | pass |
| 4.2 Check | Adams d₂ | (s,t)=(1,2)↦(3,3), stem 1→0 | pass |
| 5.2 regression | S¹∨S¹ | aba⁻¹b⁻¹≠1 in F₂; aa⁻¹bb⁻¹=1; abelianized counts (0,0) | pass |
| 6.1, 6.4, 6.5 Checks | multiplicities; p=3; H_C(2,3), H_C(1,1) | Multiplicities 0,1,0,2 in degrees 1–4. At p=3, k=1 is excluded since 3=3¹, and the series is 1+t⁸+t¹²+…. s₂(H_C(2,3))=−C(5,2)=−10 and gcd(5,10)=5. H_C(1,1)=CP¹ has s₁=+2 while −C(2,1)=−2. | pass |
| 6.3 | H_R(2^r,2^{r+1}s) | dimension 2^r(2s+1)−1=d; by Lucas C(2^r(2s+1),2^r)≡1; w₁=mx+ny=0 | pass |
| 7.1, 7.2 | K3; K3×K3 | Â=48/24=2 and c(α)=2u²=c(a), so α=a; a²=4b. α(M)=−(σ/16)a and Â=−σ/8 give k=1 for σ=−16. | pass |
| 8.1, 8.3, 8.4 | Lie torus; ℤ/24; RP⁴, RP²×RP², CP² | q(a+b)=1+1+1=1 and Arf=1. ord(12ν)=2, ord(4ν)=6. (w₄,w₂²)=(1,0),(1,1),(1,1), from (1+a)⁵=1+a+a⁴. | pass |
| 9.1 Check | (x,y)=(i,j) | A₂₁=j·(−i)/3=k/3 and chart1 gives (−i,k)=(x⁻¹,yx⁻¹); x⁻¹y=−k | pass |
| 9.2 Checks | the pinned product (a,b)(c,d)=(ac−d̄b, da+bc̄) (`CayleyDickson/Basic.lean:203`) | Script: C₀C₁⋯C₈ sends (1,0)↦(−1,0); with −C₈ it gives (1,0). All C²=+1 and pairwise anticommutation hold. X=[[1,1],[1,−1]] has X²=2(1−E₀). The frame stabilizer has dimension 52−24=28. | pass |
| 9.3, 9.4 | OP², HP^k | (381·39−19·36)/14175=14175/14175=1. (1+u)⁶/(1+4u)=1+2u+7u², and (49−4)/45=1. k=1 gives 1 mod u². | pass |
| 10.4 | KO-Pontryagin; Kreck–Stolz; Dickson | λ_s(ℓ−2)=1+s(ℓ−2)/(1+s)², so π_{t/(1+t)²} is consistent. −2(C(4,2)−1)=−10; −2(C(6,2)−1)=−2(C(6,4)−1)=−28=−4·7. Sq¹t₂=t₃ and Sq²t₃=x₁⁴x₂+x₁x₂⁴=t₂t₃. | pass |

### Library declarations opened at the pins

Mathlib 1b1ccf4 and Tau Ceti 2fd255d.

- **Orientation and atlases:** `TauCeti.IsOrientedAtlas` (`Geometry/Manifold/Orientation/OrientedAtlas.lean:283`; covers M, lies in the maximal atlas, positive transitions); `OrientationLift` (`Orientation/Lift.lean:52`) and `TauCeti.Manifold.Orientation` (`Orientation/Basic.lean:32`).
- **Sard and null sets:** `TauCeti.IsNullSet` (`Geometry/Manifold/Measure.lean:36`); `TauCeti.IsRegularPoint` (`RegularValue.lean:86`); `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`, ContDiffAt on U); `ContMDiff.isMeagre_image_criticalPoints` (`Sard/Meagre.lean:114`). The pin has no unequal-dimension null-set Sard.
- **Homology:** `TauCeti.HomologicalOrientation` (`LocalHomology/Orientation/Homological.lean:75`); `fundamentalClass` and `mapFundamentalClass` (`FundamentalClass.lean:204`, `:275`); `localHomology` and `localHomologyRestriction` (`System.lean:85`, `:90`); `existsUnique_singularHomology_localHomologyRestriction_eq_of_invariant` (`Section.lean:99`); `reducedSingularHomologySphereIso` (`Singular/Sphere.lean:470`).
- **Pontryagin–Thom:** `SmoothEmbedding.exists_isFramedTube` (`PontryaginThom/Existence.lean:68`; boundaryless models, T2, second countable, global linear trivialization); `pontryaginThomCollapseMap_homotopic`, `pontryaginThomCollapseMap_comp_prodUnitsHomeomorph_homotopic` and `pontryaginThomSphereMap` (`PontryaginThom/Basic.lean:149`, `:196`, `:217`).
- **Clifford, Spin and Lie (9.2):** all fourteen names of 9.2's *Needs:* resolve, among them:
  - `realCliffordSpinUnitsRangeLieGroup` (`Geometry/Lie/CliffordAlgebra/Spin/Projection.lean:171`);
  - `isLocalDiffeomorph_realCliffordSpinToSpecialOrthogonalSmoothRange` (`LocalDiffeomorph.lean:126`);
  - `spinToSpecialOrthogonal_surjective_of_posDef` (`LinearAlgebra/CliffordAlgebra/Spin/Real/Basic.lean:70`);
  - `posDef_realCliffordForm_zero` (`RealForm/Basic.lean:173`);
  - `toContMDiffMonoidMorphism` (`Geometry/Lie/AutomaticSmoothness.lean:156`);
  - `DivisionOctonionReal := CayleyDickson ℍ[ℝ]` (`Algebra/CayleyDickson/Quaternion.lean:312`).
- **Mathlib:** `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`; any model, SigmaCompact, T2); `ChartedSpace.secondCountable_of_sigmaCompact` (`ChartedSpace.lean:236`); `ModelWithCorners.secondCountableTopology` (`IsManifold/Basic.lean:452`).
- `scratch/library-matches.md` has no same-name hit, and no pinned declaration proves a stated target.

### Cross-roadmap citations resolved

- **AlgebraicTopology, #1652 at c610f76** (the head has moved since the last review):
  - 6.3 (`:2491`) has the twisted compact-boundary class [M,∂M] and the bijection between smooth and homological orientations;
  - 6.4 (`:2873`) defines `IsFundamentalClass` over every commutative ring, with the ring 2=0 needing no orientation;
  - 8.13 (`:4224`) owns smoothing and both transversality theorems for boundaryless sources.
- **DifferentialGeometry, #886 at 5436a54:** 5.5b's smooth face structure, local quadrant data and depth (`:1883–1990`); 2.1 and 2.2 on main. §10.2: R01.
- **StringOrientation, #948 at 07f0981:**
  - S1.5 (`:458–512`) matches the README's list (OP², F₄, Spin(9) isotropy, cells, p₂, p₄, signature, Spin and String lifts, p(HP²));
  - S2.2 (`:551`) is Ω^θ≅π_*Mθ for every diagram, with S2.1 needed only for String;
  - S2.3 takes ν from EllipticCohomology E4.S;
  - S5.3 proves MSpin[1/2]≃MSO[1/2] from DGFloer items 2 and 4 and the Thom isomorphism, without BordismFormalGroups.

  This is the target-level layering the README states at `:45–56` and `:3436–3456`.
- **IndexTheory, #1077 at 6d85f5d:** I2.5 (`:648`), I5.4 (`:1187`), I7.2 (`:1371`), and I7.5 (`:1514`, σ(M)=−16α).
- **On main:**
  - GeometricTopology 1.1 (interior is boundaryless and a homotopy equivalence, `:788–810`), 4.3.1 and 11.3 (Cairns–Whitehead, `:7887`);
  - LieHighestWeight Layer 8 (trace-one = primitive, three-member frames, transitivity left to this roadmap, `:1351–1356`);
  - DGFloer Layer 1 items 2–4; SmoothBundlesConnections B1.4;
  - GeneralizedCohomology G-items (item numbering under G1–G5, `realMixedCliffordIndexClassification`, `spectrumConnectiveCover`);
  - CharacteristicClasses C1 items 3–4 (`:663–689`), C3.6, C6, C7.3a;
  - SpinGeometry G4.3, G4.4, G5.0, G6.0, G6.7 and the four `realSpin…` names;
  - TopologicalKTheory T5–T7, RiemannianGeometry R1, ClassifyingSpaces Stage 4, AffineMorseLefschetz A0/A5/A6, ComplexKahlerGeometry K7.1, PseudodifferentialOperators P5–P6.
- **Ownership sweep** (`roadmaps grep`, every open head and main):
  - Sard in unequal dimensions: DifferentialGeometry #886 and this roadmap (R01), with HomotopySpheres #1287, a non-supplier, citing B1.6.
  - Parallelizable three-manifolds: no other owner.
  - Realization of homology classes and Thom III.2–4: no other owner.
  - Pontryagin–Thom isomorphism: StringOrientation S2.2 owns the coefficient form, which B5.4 consumes.
  - Steenrod algebra and Adams towers: StableHomotopyKTheoryPartII (#1733) consumes TangentialBordism §B4 (`:12`, `:258`) and owns none of it.
  - Corner rounding: the HomotopySpheres and GeometricTopology #1797 hits are their own plumbing and knot constructions.
- **Overlaps** (`scratch/overlaps.md`, five items, each checked):
  - no open pull request changes this roadmap or drops a cited id;
  - 5.5b (#886) and AlgebraicTopology Layers 2/4/6/8 (#1652) are defined only at those heads (#1652 is named in the description, #886 is not: R02);
  - of the vocabulary neighbours, HomotopySpheres is not cited, StringOrientation is an earlier supplier, FourManifolds is a later consumer, and GeneralizedCohomology is cited at its main numbering.

## Not verifiable

- **Lee**, *Introduction to Smooth Manifolds*, 2nd ed. (2.1: Theorems 6.10, 6.26, 6.35, 6.36; 8.5: Theorems 21.10, 21.13). A Springer book, not in the sources cache; cited by locator.
- **Atiyah–Bott–Shapiro** (7.1) and **Kreck–Stolz** (10.4): recorded `uncertified` in the manifest.
- **Munkres** (2.3, Theorem 10.6), **Wall 1960** (6.6), **Milnor 1960** (6.4), **Anderson–Brown–Peterson**, **Stolz 1992**, **Stong**, **McCleary**, **Gompf–Stipsicz**: not in the sources cache. This review edits no manifest, so they were not fetched. None is a seeded target except through 2.1's Lee.

## Source issues

- **Misprint** in thom1954 at the example after Théorème III.9, p.63: the source gives X·St₃⁴St₃¹(v₁v₂) as +v₁v₂(u₁u₂)³. Expanding its own factors with u⁴=0 and v²=0 gives −v₁v₂(u₁u₂)³. Affects nothing; the class is nonzero either way.
- **Gap** in freedBordism at Lecture 5, after (5.57), p.45: the source says SU(3) represents "the generator" of π₈S. Its own table (5.56) gives π₈S=ℤ/2⊕ℤ/2, so the class should be named. Affects nothing.
