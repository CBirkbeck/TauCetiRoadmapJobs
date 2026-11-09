# Review of TangentialBordism (pull request #942 at 3324fdd)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/TangentialBordism/` at 3324fdd; the folder changed by 220 lines since d2fece9. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with thirteen `sorry` warnings and nothing else.

There is one finding, a P3, and it is outside the folder: the pull-request description still omits the revision that defines a cited id. Nothing in `README.md` or `Suggested.lean` needs to change.

## R01 (P3) — The description still lists #1663 and omits #886, the only head that defines DifferentialGeometry 5.5b

Re-raised: H04

**Location.** The pull-request description, quoted as data:
- "- [ ] depends on: #1663";
- "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

#886 appears nowhere in it.

**Claim.** The description names every open revision whose numbering the README cites, and names only open pull requests.

**Witness.**
- The README cites DifferentialGeometry 5.5b at `README.md:102–104`, `:449`, `:544`, `:582–588`, `:803` and `:1029`.
- DifferentialGeometry on main (3090489) contains "5.5b" 0 times; the head of #886 (cd5e804) contains it 30 times.
- `scratch/overlaps.md` lists §5.5b as defined only by #886.
- The roadmap index of 2026-11-09 has no open #1663.

**Why the reason in H04 fails.** H04 says the change is "to the description only". That is true and is why no file is edited, but the overlap rule keeps an uncited revision a P3 until the description or its merge-order paragraph names it, and the description is unchanged since the previous two reviews.

**Repair.** No file in the folder changes; edit the description only:
- delete "depends on: #1663";
- add #886 to the Depends-on block;
- write the revision line as "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".

## Verified sound

### The previous review's findings (PRREVIEW-TangentialBordism~28)

- **R01 (P2), mod-2 realization absent: repaired, and extended.**
  - `Suggested.lean:256–270` adds `exists_modTwoFundamentalClass_map_eq`, the statement the review proposed.
  - `Suggested.lean:282–343` adds three statements on pairs that the review had accepted as not statable: `exists_relFundamentalClass_map_eq`, `exists_pos_forall_relFundamentalClass_map_eq_nsmul` and `exists_modTwoRelFundamentalClass_map_eq`. They use `TauCeti.localHomology` of `ModelWithCorners.interior`, which is `H_n(M, M∖int M) = H_n(M,∂M)`.
  - The two docstring bullets that called these not statable are gone. The README names all four at `:20–27` and `:3047–3059`, rewrites the contract paragraph at `:325–352`, extends 10.1's *Needs:* line (`:3094`) and adds the RP², interval and Möbius-band Checks (`:3077–3079`).
- **R02 (P3), description: not repaired.** See R01 above.
- **R03 (P3), 5.4 locator: repaired.** `README.md:1821–1826` now cites "Chapter 2, §1, Theorem 1.4, p.41" and says the proof is left to the reader along the lines of Chapter 1. millerCobordism lines 1562–1566 say exactly that; the next page header (line 1568) is 42.

### Gate, order, build, signatures and padding

- **Gate** (rerun on this head): every check is 0 and OK, as in `scratch/gate.md`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** (`--movable`):

  ```
  depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. ORDER.txt has this roadmap at line 14, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13).
- **Elaboration.** `lake env lean` on `Suggested.lean` exits with thirteen `declaration uses sorry` warnings (`:86`, `:107`, `:125`, `:141`, `:170`, `:188`, `:206`, `:221`, `:237`, `:256`, `:282`, `:304`, `:330`) and no other message.
- **Signatures.** I compared the thirteen elaborated types in `scratch/signatures.md` with their README statements rather than rerunning `#check`. The file has no section `variable`s, so no binder can be lost. Every README hypothesis is present: `n ≤ 6`, `0 < N`, `NeZero n` on the half-space statements, `T2Space`, `CompactSpace`, and `Set.MapsTo f (interior M)ᶜ A` for `f(∂M) ⊆ A`. I changed no file.
- **Padding probe.** On a scratch copy I replaced every `sorry` by `first | rfl | trivial | simp | aesop`. All thirteen fail (eleven "unsolved goals", two "aesop made no progress"). None is padding.

### Headline theorems

Stated (13):
- relative smoothing, and Sard in unequal dimensions for boundaryless and half-space sources (B1.6);
- oriented three-manifold parallelization, ΩSO_n=0 for 1≤n≤3 and ΩO_n=0 for n=1,3 as nullbordism statements (B3.1);
- B6.3 absolute: integral realization for n≤6, Thom's uniform multiple, degree-seven sharpness, mod-2 realization;
- B6.3 on pairs for n≥1: the integral range, the uniform multiple, mod-2 realization.

Named in the docstring as not statable, each reason checked at the pins in the previous round and unchanged here: corner Sard, transversality, the bordism groups with Thom's and Wall's rings, the Spin entries, the Pontryagin–Thom isomorphisms, the Steenrod and Adams results, ABS and the KO kernel, the projective transfers, the Cayley-plane theorems. I found no statable headline that is absent.

### Seeded sample: locators read in the text

| Target | README locator | Where in the source | Result |
| --- | --- | --- | --- |
| 2.1 (B1.6) | Lee, Thms 6.10, 6.26, 6.35, 6.36, pp.129–147 | not readable | Not verifiable |
| 2.2 (B1.1) | library declarations only | 19 pinned names of its *Needs:* line resolved (below) | supports |
| 2.4 (B1.2) | Milnor–Stasheff Thm 17.1, Lemma 17.2, pp.206–207; Miller Ch.1 Defs 1.1–1.2, pp.1–2; Ch.2 Defs 1.1, 1.3, pp.39–41 | milnorStasheff 5439 (p.206), 5457 (p.207); millerCobordism 95, 104, 1453, 1538 | supports |
| 5.2 (B5.2) | Thom IV.8, p.75 | thom1954 2462, page footer 75 at 2464 | supports; states only the stable coefficient theorem, as 5.2 says |
| 5.3 (B5.3) | Thom IV.8, p.75 | same; IV.6 at 2410 (p.74) | supports |
| 5.5 (B5.5) | Miller Ch.2 Thm 1.4, p.41; Ch.1 §1, pp.1–2 | millerCobordism 1565; 76–91 | supports |
| 6.3 (B4.6) | Milnor–Stasheff Problems 16-D–F, pp.203–204 | milnorStasheff 5357–5389, footers 203 (5365) and 204 (5390) | supports: 16-F gives the real (1,1) hypersurfaces with nonzero top Newton number when n+1 is not a power of 2, orientable for n odd |
| 6.6 (B6.2) | Wall, Lemmas 7–13, Thm 1 | OCR of the scan at the References' URL: Lemma 7 (p.300), Lemmas 8–9 (p.303), Lemmas 10–12 (p.304), Thm 1 and Lemma 13 (p.305) | supports: ∂₂σ(1)=0, ∂₂σ(2)=1, ∂₂σ(i)=σ(i−2); CP^n∼(RP^n)²; free direct summand; kernel mod image dual to mod-2 Pontryagin numbers |
| 7.1 (B3.0) | Atiyah–Bott–Shapiro §§10–11 | uncertified | Not verifiable |
| 7.2 (B3.4) | Beaudry–Campbell Thm 5.1.1, Cor 5.1.2, p.42; Remark 3.2.2, p.18; Figure 31, p.41 | beaudryCampbell 1770–1776; 792–796; 1741 | supports: the module M vanishes below degree 8; the MSpin row is ℤ, ℤ/2, ℤ/2, 0, ℤ |
| 8.1 (B3.2(b)) | Atiyah Thm 5 with proof, pp.59–60; Thm 2, p.48 | atiyahSpin1971 462–492; 75 | supports: the coefficient of x_i is the Spin class of the dual submanifold, and the bilinear form is the intersection number |
| 8.2 (B3.2(c)) | Atiyah Prop 4.1, Thm 3′, p.58 | atiyahSpin1971 419–433, page header 58 at 415 | supports |
| 8.3 (B3.3) | Freed (5.57), p.45; Beaudry–Campbell Fig. 31, p.41; Hatcher §4.2, p.385 | freedBordism 1810, 1817; beaudryCampbell 1741; Hatcher read in the previous round | supports |
| 8.5 (B3.5) | Milnor–Stasheff §16.3, p.194; Lee Thms 21.10, 21.13 | milnorStasheff 5076–5078 (p.194); Lee not readable | supports the bounding claim; the README's S² fibre corrects the source (Source issues); Lee Not verifiable |
| 9.3 (B3.8) | Borel–Hirzebruch §19, Thm 19.4 | borelHirzebruchI 3021–3027 | supports: p₂=6u, p₄=39u², index 1 |

Further locators read: Hatcher §3.3, p.253 (hatcherAT 10966–10970, page header 253 at 10932) for the relative fundamental class that the new pair statements use. The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_modTwoFundamentalClass_map_eq` | n=0; M=∅; RP² | μ=Σ[x] and any Σεᵢ[xᵢ] is one point per εᵢ=1; μ=0 with the condition vacuous; [RP²]₂≠0 while H₂(RP²;ℤ)=0. Dropping the local condition would admit μ=0 on nonempty M. | pass |
| `exists_relFundamentalClass_map_eq` | ([0,1],{0,1}); A=∅; A=X; Möbius band; n=5, 6 | H₁=ℤ, realized by the identity. A=∅ forces ∂M=∅. H_n(X,X)=0 is realized by ∅. H₂(B,∂B;ℤ)=0 because ∂B is twice the core, so the generating condition fails and B is excluded. d₅ and d₆: next row. | pass |
| integral range on pairs (AHSS, E²=H_p(X,A;ΩSO_q)) | n=5, 6 | ΩSO_1–3=0 kills d₂–d₄. d₅ is torsion (H⁵(HZ;ℤ) is finite). n=5: the target H₀(X,A;ℤ) is free on the components missing A. n=6: a class of H₁ is detected in K(ℤ/m,1), where H₆=ker(m)=0. d₆ into H₀(−;F₂) is detected in S⁰, where H₆=0. | pass |
| `exists_pos_forall_relFundamentalClass_map_eq_nsmul` | N=0; quantifier order | N=0 would make 0•z=f_*[∅] true for every z, so `0<N` is needed. ∃N∀(X,A) matches Thom III.4 (thom1954 1825). | pass |
| `exists_modTwoRelFundamentalClass_map_eq` | Möbius band; orientable source | H₂(B,∂B;F₂)=F₂ is realized by id. An orientable source pushes forward the reduction of a class of H₂(B,∂B;ℤ)=0. | pass |
| "μ generates at interior points" pins [M,∂M] | D¹; 2μ; nonorientable M | ±[D¹,∂D¹] generate. 2μ has local image 2, not a generator. H_n(M,∂M;ℤ)=0 on a nonorientable component, so no μ exists. | pass |
| `localHomology N (interior M) n` is H_n(M,∂M) | pinned definition | `System.lean:85`: `(TopPair.ofSubset Sᶜ).singularHomology`; Mathlib `compl_interior` gives (int M)ᶜ=∂M. | pass |
| `exists_mapFundamentalClass_eq`, `…_eq_nsmul`, `…_eq_seven` | n=0; n=6, X=B(ℤ/3); n=7 | k[pt] by \|k\| signed points; H₆(B(ℤ/3);ℤ)=0; Thom's z has 3z=0, so 3 divides N₇. | pass |
| Lens example (10.1) | u_i⁴=0, v_i²=0 | P¹β(v₁v₂)=u₁³v₂−v₁u₂³; β(v₁v₂u₂²)=u₁v₂u₂²−v₁u₂³; the product is −v₁v₂u₁³u₂³, the other three terms vanishing. | pass |
| `exists_contMDiff_homotopicRel` | C=M; S¹ with D={\|p−q\|<1} | g=f with the constant homotopy; g=−z has \|g−f\|=2∉D. Mathlib's approximation lemma needs sigma-compact, Hausdorff, any model: `SmoothApprox.lean:79`. | pass |
| Sard, boundaryless and half-space | t↦(t,0); ℝ²_δ×[0,∞); t and t² on [0,∞) | The line is null. Without Lindelöf the critical values are all of ℝ². t is regular at 0 but critical on the stratum {0}. The flat input needs order ≥ (dim E)²+1 (`OutermostStratum.lean:347–349`), which C^∞ meets. | pass |
| Parallelization; ΩSO_n=0; ΩO_n=0 | ℝ³ frame; n=0,…,4 | det 1, and −1 after negating e₁. A point has count 1; S¹=∂D²; CP² has σ=1; RP² has χ=1; RP²×S¹=∂(RP²×D²). | pass |
| 2.2 Checks | cylinder I×[0,1]; factor swap | Faces: +e_s at t=1, −e_s at t=0, +e_t at s=0, −e_t at s=1, which is minus the product orientation, (−1)^(dim I). A swap of two lines has det −1. | pass |
| 2.4 Checks | glue [0,1]∪[1,2] | endpoints −[0]+[2], total 0 | pass |
| 5.2, 5.3 four points | S¹∨S¹ | aba⁻¹b⁻¹≠1 in the free group; aa⁻¹bb⁻¹=1; abelianized counts (0,0) | pass |
| 5.5 Checks | framed points; interval | +1, −1, 0; 1−1=0 | pass |
| 6.3 | H_R(2,4); H_R(1,2); RP², RP¹; w₁(H) | d+1=6, binom(6,2)=15≡1. For H_R(1,2): s₂=2x²+3y²−(x+y)²=2y²≡0, while binom(3,1)≡1, so m,n≥2 is needed. 3≡1 and 2≡0. w₁=mx+ny=0 for m,n even. | pass |
| 6.6 Checks | σ₄; Y₆Y₅; oriented point | ∂₂σ₄=σ₂ and ∂₂²σ₄=1; δ(Y₆Y₅)=Y₅²; 1−ρ=2 | pass |
| 7.1, 7.2 | K3; K3×K3; odd p | Â=48/24=2, c(a)=2u², α=a; a²=4b; σ=−16 is a unit multiple of CP² at odd p; α(M)=−(σ/16)a agrees with 2k=−σ/8. | pass |
| 8.1, 8.2 | Lie torus; two copies | q(a+b)=1+1+1=1, Arf=1·1=1; Arf 1+1=0 | pass |
| 8.3 | ℤ/24 | ord(12ν)=2, ord(4ν)=6 | pass |
| 8.4 Checks | RP⁴, RP²×RP², CP² | (w₄,w₂²)=(1,0), (1,1), (1,1), from (1+a)⁵=1+a+a⁴ | pass |
| 8.5 | q=1+j(x+iy); dimensions | derivative (x,y)↦−2xk−2yj, determinant −4 in the basis (j,k), so degree −1; 2(n−1)+2=2n and 4(n−1)+3=4n−1; total sign (−1)^(n−1)·(−1) | pass |
| 9.3 Checks | OP² | (381·39−19·36)/14175=14175/14175=1 | pass |

### Library declarations opened at the pins

- 117 of the README's 125 backticked library names resolve to a declaration in the pinned Mathlib or Tau Ceti. The other 8 are suppliers' names, found in LieHighestWeight, SpinGeometry and GeneralizedCohomology on main.
- Opened for the new statements:
  - `TauCeti.localHomology` (`AlgebraicTopology/Singular/LocalHomology/System.lean:85`) and `TauCeti.localHomologyRestriction` (`:90`);
  - `TauCeti.existsUnique_singularHomology_localHomologyRestriction_eq_of_invariant` (`LocalHomology/Section.lean:99`), for any `N : ModuleCat Λ`, with `[T2Space M]`, `[CompactSpace M]` and `finrank ℝ E = n`;
  - `TopPair.ofSubsetMap` (`Topology/Category/TopPair.lean:61`) and `TopPair.singularHomologyMap` (`AlgebraicTopology/Singular/Relative.lean:300`);
  - Mathlib `ModelWithCorners.compl_interior` (`Geometry/Manifold/IsManifold/InteriorBoundary.lean:150`).
- Opened for the sample: `exists_embedding_euclidean_of_compact` (`Geometry/Manifold/WhitneyEmbedding.lean:132`, any model, `T2Space` and `CompactSpace`), `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`) and `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`).
- `scratch/library-matches.md` has no same-name hit, and no pinned declaration proves a stated target.

### Cross-roadmap citations resolved

- **AlgebraicTopology (#1652, c204943).**
  - 6.3 (`:2491`) derives the compact-boundary class [M,∂M] and characterizes it uniquely by its interior local images (`:2735–2739`), as `README.md:346–347` says.
  - 6.4 (`:2873`) defines a fundamental class over a commutative ring R by generating local images, with the two-torsion case needing no orientation (`:2875–2885`), as `README.md:340–341` says.
  - 8.13 is at `:4222`.
- **DifferentialGeometry 5.5b:** defined only at #886 (R01).
- **StringOrientation (#948, 07f0981) and IndexTheory (#1077, 6d85f5d):** unchanged heads; the sections resolved in the previous round stand.
- **Ownership sweep** (`roadmaps grep` for realization of homology classes, Steenrod realization and Thom III.2–4): no other roadmap states realization. DGFloerPartII 3.1 (`:1161–1173`) consumes B6.3's multiplicative theorem by name. I found no second owner.
- **Overlaps** (`scratch/overlaps.md`, five items): no open pull request changes this roadmap or drops a cited id. The AlgebraicTopology layers come from #1652, which the description names; 5.5b comes from #886, which it does not (R01). Of the vocabulary neighbours, HomotopySpheres is not cited, StringOrientation is an earlier supplier, FourManifolds is a later consumer and GeneralizedCohomology is cited at its main numbering.

## Not verifiable

- **Lee**, *Introduction to Smooth Manifolds* (2.1: Theorems 6.10, 6.26, 6.35, 6.36; 8.5: Theorems 21.10, 21.13): a book that is not in the sources cache; cited by locator.
- **Atiyah–Bott–Shapiro** (7.1): recorded `uncertified` in the manifest.
- **Wall 1960** (6.6): read through OCR of an image-only scan, so formula-level detail (the brace coefficient of Lemma 9) is legible only in part. The statements of Lemmas 7, 8, 9 and 13 and of Theorem 1 are legible and agree with the README. The paper is not in `sources.toml`.
- **Munkres, Milnor 1960, Stong, Anderson–Brown–Peterson, Stolz 1992, McCleary, Gompf–Stipsicz, Kreck–Stolz:** outside this round's sample; not read.

## Source issues

- **Error** in milnorStasheff at §16.3, p.194: the source says the odd complex projective space is the total space of a circle bundle over a quaternionic projective space; it should be a 2-sphere bundle, the dimensions differing by two; affects nothing.
- **Misprint** in milnorStasheff at Problem 16-F, p.204: the source says Thom's products form a basis "for π_n"; it should be the unoriented cobordism group 𝔑_n defined two lines earlier; affects nothing.
