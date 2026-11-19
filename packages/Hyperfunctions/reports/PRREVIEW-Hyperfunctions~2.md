# Review of Hyperfunctions (pull request #2592 at 73360bc)

**Verdict:** accepted

**Summary.** I found no findings: every statement I recomputed holds. Of the previous round's three findings, two are repaired and the third mostly. §3a.1 now uses the pinned extension by zero and ComplexComparisonPartII §C6.1. The Layer 0 example has the sign that §3.6 and Honda–Izawa–Suwa use. The headline theorems carry locators, which I checked against the texts; the four results still without one are C02. There are four small corrections. The main one is that two roadmaps still cite this one for content this revision has moved out, so ComplexComparisonPartII §C6.1 and §3a.1 now cite each other; the others are four results still without a locator, a sentence of the description and a file path. There are also three format notes, none of them blocking, and nothing is left for a human to decide.

## C01 — Two roadmaps still cite this one, under its former numbering, for content this revision moved out, and the table of former ids sends their readers in a circle

Once this merges, a reader who follows those citations finds nothing at the far end. In one case the citations also become two-way, between §3a.1 and ComplexComparisonPartII §C6.1.

**ComplexComparisonPartII.** On main, its §C6.1 *Needs* line cites "Hyperfunctions HF3a (the `ℂ`-module case, for the identification)". Its overview says that HF3a states extension by zero, `f_!`, c-soft resolutions, the localization triangle and proper base change (its README lines 126–130, 4796–4800 and 4828; these lines are unchanged at the head of its open overview revision). The table of former ids (line 1365) sends HF3a to Layer 3a. But §3a.1 now takes exactly these constructions from §C6.1 (lines 956–963, and the *Needs* line at 982). So the identification §C6.1 asks for compares §C6.1 with itself. The dependency check does not report this edge.

**LocallyConvexDuality.** At its open head (README line 42) it leaves "the nuclearity of its smooth-section spaces" to HF2.AnalyticPreparation.FunctionalDuality. The table (line 1355) maps that id to §2.0b, which now proves only the Fréchet–Schwartz property.

The smallest repair is one sentence for each under Downstream consumers:

- "ComplexComparisonPartII's HF3a compact-support functors (extension by zero, c-soft resolutions, the localization triangle, `f_!` and proper base change) are its own §C6.1, which §3a.1 uses with coefficients `ℂ`; the identification with HF3a is the identity and needs nothing from this roadmap."
- "Nuclearity of smooth-section spaces is not stated here."

The citing roadmaps then drop or repoint those citations in their own revisions.

## C02 — Four named results still have no source locator, so their statements cannot be checked against a text

This is what remains of the previous round's locator finding. Every headline theorem of the overview now has a locator, and I checked each against its source. The rest of the previous finding is repaired. The statements below are classical, and I checked them by computation (see the table), so this does not block.

These four still have no locator:

- SteinBundleDuality (§2.0f, lines 578–587).
- The jump formula (§4.2, lines 1161–1163), which `Suggested.lean` states as a headline.
- The gluing theorem in dimension one (§1.3, line 281). The locator there, Honda–Izawa–Suwa (6.2) on p. 19, supports the comparison with relative cohomology, not the sheaf property.
- Microlocal purity (§3a.3, line 1021). It has only the layer-level citation of Sato–Kawai–Kashiwara as a whole and of Kashiwara–Schapira Chapters III–IV, which the layer itself describes as covering conic sheaves, specialization and the Fourier–Sato transform.

Give a theorem and page for each, from a source of the author's choice.

## C03 — The description credits two Mathlib items to Tau Ceti

Under "What the old README marked as in the library", the description says "The pinned Tau Ceti already has them" and then lists "Sheaf functors: extension by zero along an open inclusion and its exactness, and the exactness of inverse image and of direct image along a closed embedding". The head says otherwise (lines 952–967):

- extension by zero is Mathlib's `Functor.sheafPullback`;
- the exactness of inverse image is Mathlib's `Functor.sheafPullbackConstruction.preservesFiniteLimits`.

Suggested text: "Sheaf functors: the exactness of extension by zero along an open inclusion and of direct image along a closed embedding (the functors themselves, and the exactness of inverse image, are Mathlib's)."

## C04 — The Tau Ceti contract puts `TauCeti.SmoothEmbedding.NormalSpace` in a directory where it is not

Line 1560 places it under `Geometry/Manifold/TubularNeighborhood/`. That directory holds only `exists_diffeomorph_normalBundle_subset`. At the pin, `NormalSpace` is declared in `Geometry/Manifold/SmoothEmbedding/NormalSpace/Basic.lean`, line 59. Name both files.

## N01 — `exists_sum_dbar_eq` (`Suggested.lean`, lines 98–99) writes `∂/∂z̄ⱼ` out by hand, but Tau Ceti's `TauCeti.conjWirtingerDeriv` (`TauCeti/Analysis/Complex/Wirtinger/Basic.lean`, line 80) is the same operator: its value at `Pi.single j 1` is exactly the summand. The conclusion could read `∑ j, TauCeti.conjWirtingerDeriv (g j) z (Pi.single j 1) = f z`, with that module imported.

## N02 — The Honda–Izawa–Suwa page numbers (pp. 7–53) are those of arXiv v4, but the paper was published in J. Math. Soc. Japan 75 (2023), 229–290, with different pages. The References entry (line 1618) could give both versions and say which one the pages refer to.

## N03 — The `Suggested.lean` docstring (lines 29–44) names the Sato sheaf on a manifold and its flabbiness as not statable, but not purity on a real-analytic manifold, of which only the flat case is stated; it could be added to the first bullet.

## Earlier findings

- **R01 (§3a.1 plans the compact-support functors again): repaired.** Lines 952–963 now read "Extension by zero `j_!` … is Mathlib's `Functor.sheafPullback` …; ComplexComparisonPartII §C6.1, with coefficient ring `ℂ`, supplies … c-soft resolutions, derived compact-support sections, the support localization triangle, and … `Rf_!`". Scope (lines 1384–1385) keeps only the projection formula, the Fubini comparison and the dimension bounds. The back-citation left in ComplexComparisonPartII is C01.
- **R02 (Layer 0 sign): repaired.** Line 228 now reads "the relative cocycle `(0, −f)` … represents the class of `f`", and cites HIS (4.5), p. 13 (line 501) and (6.2), p. 19 (line 780), both of which I checked.
- **R03 (no locators): partly repaired.** There are now 14 Honda–Izawa–Suwa locators, Komatsu Theorems 6′, 12 and 19, and Malgrange Lemme 3 a; all of them match their texts. What remains is C02.
- **C01 (purity sentence and orientation twist): repaired** (lines 17–20).
- **C02 (old-to-new numbering): repaired.** The table is at lines 1347–1367, and Downstream consumers is corrected. The content cited under two of the old ids is C01.
- **C03 (docstring reason for the `n ≥ 2` embedding): repaired** (`Suggested.lean`, lines 41–44).
- **C04 (Poisson step): repaired.** Lines 349–354 now cite `TauCeti.PDE.existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball`. At the pin, with `a = 1` and `b = c = 0`, it gives `∫∇u·∇v = ∫ g v`; with `g = −f` that is `Δv = f`, as the README says.
- **C05 (nuclearity): repaired.** §2.0b now states only the Fréchet–Schwartz property, and the word "nuclear" no longer occurs. LocallyConvexDuality's deferral is C01.
- **N01 and N02: repaired** (`Distribution.dsupport` at line 1474; Komatsu's title at lines 1623–1624).
- **Question on `or_M`: answered.** §0.3 (lines 211–214) defines it as `or_(M/TM)`, which is supported by HIS (2.10) and (2.13), p. 7.
- **Question on Ito 1986: still not verifiable** (see below).

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| §0.1 edge comparison, Checks | `ℤ` on `ℝ`, `S={0}`; pin `supportedHPresheafEdgeIso` | `0→ℤ→ℤ²→H¹_S→0` gives `ℤ`, unquotiented variant `ℤ²`; pin `H^(n+j)_Z ≅ H^j_Z(𝓗ⁿ_S)` for `Z ≤ S` | agrees | none |
| §0.2 `d_rel`, Checks | right and wrong sign; `W=ℂ`, `S={0}` | `(0, ∂̄α\|−∂̄α\|+∂̄²β)=0`; wrong sign `(0,2∂̄α\|)`; cocycles `(0,β)`, `β∈O(ℂ∖0)` modulo `O(ℂ)` | true | none |
| Convention 4 | Tau Ceti `relativeCoordinates`; Mathlib cone | cone `(−da, fa+db)`, shift by `−1`, then `b↦−b` gives `(da, fa−db)`, the pin's form | agrees | none |
| §0.3 sign, `or_M` | `n=1,…,6`; HIS (2.10), (2.13) p. 7, (6.7) p. 21 | inversions `1,3,6,10,15,21` give `−,−,+,+,−,−`; `(−1)ⁿ` agrees only at `n=1,4,5`; `or_(M/TM)=or(TM)=or_M` | true | none |
| Layer 0 example | `M=ℝ`; HIS (4.5) p. 13, (6.2) p. 19 | connecting map `θ↦(0,−θ)`; §3.6 map sends `(0,−f)` to `f` | agrees | none (R02 repaired) |
| §1.3 / `oneDimBoundaryPresheaf_isSheaf` | `1/z` on `(0,∞)` and on `ℝ` | extends across `(0,∞)`, so zero there; on `ℝ` the class is `−2πiδ`; `(1_up,0)−(0,−1_low)=1` extends | true; HIS (6.2) supports only the comparison | C02 |
| §2.0a / `exists_sum_dbar_eq` | `n=1`, `f=1`; `n=0`; Malgrange Lemme 3 a, pp. 235–236 | `v=\|z\|²`, `Δv=4`, `∂̄z̄=1`; at `n=0` the empty sum `0≠1`, so `1≤n` is needed; `½(∂ₓ+i∂_y)z̄=1` | holds; locator verified | N01 |
| Convention 9 kernels | `d=2,3`; Tau Ceti definitions | pin `‖x‖^(2−d)/(d(d−2)\|B₁\|)`, `d=3` gives `1/(4π‖x‖)`; planar `−log‖z‖/(2π)`; README's are the negatives | true | none |
| §2.0b Fréchet–Schwartz | Arzelà–Ascoli | `C^(m+1)`-bounded on a compact neighbourhood implies `C^m`-precompact on `K`: the Schwartz property | holds | C01 (nuclearity) |
| §2.0c current sign, Check | Stokes; Cauchy–Green kernel | `∫∂̄η∧α=(−1)^(p+r+1)∫η∧∂̄α`; `∂̄(1/(πz))=δ`; swapped kernel gives `−φ` | true | none |
| §2.0d strong continuity | Mathlib `ContinuousLinearMap.precomp` | any topological vector spaces, `(F→L G)→L(E→L G)` in bounded-convergence topology | holds | none |
| §2.0e | Komatsu Thms 6′ p. 375, 12 p. 377, 19 p. 381; `arrowCongr` | Thm 19(i): closed iff weak* closed; Thm 12: `X′ ≅ lim X_j′`; `arrowCongr a.symm refl` sends `λ` to `λ∘a` | supported | none |
| §2.0e Check | `B_j=ℂ`; infinite-dimensional identity bonds | `L=F=ℂ`; non-compact bonds, so `F` is not FS | true | none |
| §2.0f SteinBundleDuality | `n=0`; `V=ℂ`, `p=0` | `⊕E_x=(∏E*_x)′`; Serre: `H_c^q ≅ H^(n−q)(Ω^(n−p)(E*))′=0` for `q<n`; `H_c¹(ℂ,O) ≅ O(ℂ,Ω¹)′` | holds; no locator | C02 |
| §2.1 / HIS Thm 6.10 | `p=0`, `K⊆ℝⁿ`; `n=1`, `K={0}` | Thm 6.10 p. 22; hypothesis by Thm 6.1 (p. 23); `∮z^(m−k−1)dz=2πiδ_km` | supported | none |
| §2.1b algebraic degrees | `n=2,3` support sequence | `H_c⁰(V)=0`, `H^r(K)=0` for `r>0`: `A[K]≅H_c¹(Ω)`, `H_c^r(Ω)=0` for `2≤r≤n−1`; `Φ_q` sign `(−1)^(n(q+1))` both ways | true | none |
| §2.1c / `isZero_…` | `n=0`; `n=1`, `q=0,2`; HIS Thm 2.14(1), p. 8 | point: no higher cohomology; identity theorem kills `𝓗⁰`; `H²_ℝ` lies between `H¹(W∖ℝ)=0` and `H²(W)=0` | holds; locator verified | none |
| §2.1c Checks | `n=2` polydisc | `(D₁∖ℝ)×(D₂∖ℝ)` has `2·2=4` components; `{Im z₁≠0}` alone misses `Im z₁=0≠Im z₂` | true | none |
| §2.2 / `isFlasque_…` | `n=0`; `Z=V∖U` closed in `W`; HIS Thm 2.14(2), p. 8 | `Hⁿ(W∖Z)=0`, `H^(n+1)(W)=0` give `H^(n+1)_Z=0≅H¹_Z(𝓗ⁿ)`, hence onto | holds | none |
| §2.3 Martineau | HIS Cor 6.12, p. 23; `K=∅` | `B^(p)_K(U)≅(A^(n−p)[K]⊗or_M)′` for open `U⊆ℝⁿ`; `K=∅`: `0=0′` | flat case supported | none |
| §3.2 differential | HIS (6.4), p. 20; `d²`; cocycle | `(−1)ⁿ(∂τ₁,−∂τ₀₁)` identical; `∂α+∂̄∂β=∂(α−∂̄β)=0`; `+∂β` variant gives `2∂α` | supported | none |
| §3.3 Check | `n=1`, `b=1` | `κ(0,−1_up)=(0,−1_low)`; times `−1` gives `(0,1_low)=bv₋1`; difference `(0,−1)=d_rel(−1)` | true | none |
| §3.5 boundary values | HIS Cor 3.12 p. 11, Lemma 7.10 p. 28, `b_Ω` p. 30; `n=1` | Thom representative `(0,−θ)`, `∫θ=1`; `b_Ω(f)=[fρ(ν)]`; on `S⁰`, `ψ(+1)−ψ(−1)=1` for `(1,0)` and `(0,−1)` | supported | none |
| §3.6 table, Checks | the four classes | `(0,g)↦(−g₊,−g₋)`: `(0,−f1_up)↦(f,0)`; `(0,1/(2πiz))↦−(bv₊−bv₋)(1/z)/(2πi)=δ` | true | none |
| §3a.1 suppliers | §C6.1 on main, lines 4782–4831; pin signatures | `j_!` stalks and sections, c-soft, `RΓ_c`, triangle, `Rf_!` (locally proper, separated, paracompact, locally contractible); manifold maps qualify | agrees; §C6.1 cites HF3a back | C01 |
| §3a.2 Check | `d=1`; `η>0`, `η<0`, `η=0` | fibres `{0}`, `[0,∞)`, `[0,∞)` give `H_c`: `ℂ, 0, 0`; so `F^∧=ℂ` on `{η>0}`; with `≥` it is `{η<0}` | true | none |
| §3a.3 Check | Fourier transform of `1/(x+i0)`, phase `e^(−ixξ)` | `−iπ sgn ξ − iπ = −2πiH(ξ)`, so WF is `{ξ>0}=Γ°∖0` | true | none |
| §3a.7 Check | `bv₊(1/z)²`; `bv₊·bv₋` | `{ξ>0}∩−{ξ>0}=∅`, defined; `{ξ>0}∩−{ξ<0}={ξ>0}`, excluded | true | none |
| §4.2 / `tendsto_…` | `u=δ`; `u=1_[0,1]`; `K=∅` | `γ/(π(x²+γ²))→δ`; `π⁻¹(arctan((1−x)/γ)+arctan(x/γ))→1, ½, 0`; `K=∅` forces `u=0` | true; no locator | C02 |
| `existsUnique_isCauchyEmbedding`, `.injective` | `U=∅`; cutoff `ρ=1` near `x` | quotient over `∅` is `0`; `ι_V(u\|_V)` is the restriction of `[C_(ρu)]`; separatedness gives uniqueness; `C_(v−v′)` holomorphic across `V` | holds | none |
| §4.3 `R_θ` Check | HIS Thm 8.1 p. 46, (8.8) p. 49 | second entries `θ(σ₁−∂̄σ₀₁)` on both sides; first `∂̄θ∧σ₁+θ∂̄σ₁−∂̄θ∧∂̄σ₀₁`; tube `3⁻¹min{1,dist}` identical | true | none |
| §4.4 δ, injectivity | `n=1`; HIS Def 6.13 p. 24, Prop 8.22 p. 53 | `β₁⁰=z̄/(2πi\|z\|²)=1/(2πiz)`; `−(−1)¹=1`; `C′ₙ` identical; Gaussian proof | true | source issue noted |
| Layer 4 examples | `x>0`, `x<0` | `log(−z)` jumps `−2πi` across `x>0`, so the jump is `1`; `1/(x±i0)=PV∓iπδ` | true | none |
| §5.1 extension | `U=∅`; HIS Thm 2.14(2) | `B(∅)=0`; kernel is `Γ_(V∖U)(V,B)` | holds | none |
| §5.2 Checks | `1/(1+2z)`; `x^m` | `φ^(k)(0)=k!(−2)^k`: `L=e^(−2)≈0.1353`; literal series `1,3,7,15`; `L(x^m)=1/m!`; `\|L\|≤M_r e^(1/r)` | true | none |
| §5.3 Check; ComplexKahlerGeometry §5.2 | `z=iy`; `z=e^(iθ)y` | `exp(−1/y²)` bounded; modulus `exp(cos2θ/y²)`, `cos2θ>0` for `θ<π/4`; supplier states non-extension for `n≥1` | true | none |
| Docstring of `Suggested.lean` | its non-statable list | manifold `B_M`, compact duality, Stein, microlocal and `n≥2` embedding are named; purity on manifolds is not | incomplete | N03 |
| HIS pagination | arXiv v4 against J. Math. Soc. Japan 75 (2023) | the cited pages are arXiv v4's, the version the README links | consistent | N02 |

- **Source locators checked against the texts:** 18. These are the 14 Honda–Izawa–Suwa locators in the body (all match theorem, equation and page), Komatsu Theorems 6′, 12 and 19 with their pages, and Malgrange Lemme 3 a, pp. 235–236.
- **Library declarations opened at the pins:** 133 names `#check`ed, all of which resolve; 10 Tau Ceti modules were built first. I also read the statements in these files:
  - Tau Ceti: `OneDimensional.lean` 82–320, `CauchyTransform.lean` 106 and 270–323, `DirichletProblem.lean` 189 and 644, `Sites/ExtensionByZero.lean` 315, `Sheaves/ClosedEmbedding.lean` 108, `LocalCohomology/Basic.lean` 986, `FundamentalSolution/Euclidean/Basic.lean` 57, `Planar/Basic.lean` 47, `Wirtinger/Basic.lean` 80, `SmoothEmbedding/NormalSpace/Basic.lean` 59, `Complex/Germ/Algebra.lean` 37 (germs on subsets of `ℂ`, no topology);
  - Mathlib: `precomp`, `arrowCongr`, `instCompleteSpace`, `sheafPullbackConstruction.preservesFiniteLimits`, and `TestFunction.lean` 469.
- **Cross-roadmap citations resolved on main:** all 27 ids are present:
  - RealAnalyticGeometry R0 and R3.0–R3.2;
  - ComplexKahlerGeometry §§1.1, 1.3, 2.3–2.5, 3.1, 4.1, 5.1–5.3 and 5.10;
  - GlobalHolomorphicFunctions §§0.3, 7.1 and 7.4;
  - PseudodifferentialOperators Conventions, §P1.0, §6.2 and §§9.1–9.2;
  - BanachSpaceTheory B1 and B2;
  - ComplexComparisonPartII §C6.1, ImplicitAtlases §0.10 and ComplexManifolds Milestone 7.

  Every citation of the former HF ids that I found on main and at open heads resolves through the table; two of them point at content that has moved (C01).
- **Automatic checks:** all passed. Dependency check: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Hyperfunctions and all its suppliers are on main.
- **Elaboration:** `Suggested.lean` elaborates, and its only warnings are the 7 `sorry`s. I compared the `#check` of all 11 declarations with the README: no binder is lost and the generality is equal. One-tactic probes (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop`, `exact` the separatedness lemma) fail on all 7 theorems, so nothing is padding. There is no sorry'd data and no `set_option`, and the file imports `import Mathlib` plus four Tau Ceti modules, all of which are used.
- **Headline theorems.** The headlines are purity, flabbiness, compact duality and Martineau duality, the distribution embedding with its one-dimensional Cauchy characterization and jump formula, MalgrangeTopVanishing, SteinBundleDuality and microlocal purity.
  - Stated: the flat purity and flabbiness, Malgrange, gluing in dimension one, the jump formula, and the existence, uniqueness and injectivity of the embedding in dimension one.
  - Named in the docstring as not statable: the rest, except purity on manifolds (N03). The vanishing half of compact duality is statable, but it is a corollary of the two stated theorems.
- **Overlap check:** I read ComplexKahlerGeometry (main and its open revision), ComplexComparisonPartII (main and its open overview revision), GlobalHolomorphicFunctions (main), RelativisticQuantumFieldTheory and LocallyConvexDuality (open), and, found by searching for the objects, ImplicitAtlases and AutomorphicSpectralTheory (main). Owners of the shared objects:
  - compact-support functors: ComplexComparisonPartII §C6.1 (with the stale back-citation of C01);
  - FS/DFS calculus: this roadmap;
  - nuclear spaces: AutomorphicSpectralTheory §0.11 (C01);
  - distributions and `exp(1/‖x‖²)`: ComplexKahlerGeometry §§5.1–5.2;
  - `∂̄` solver and Cousin I: GlobalHolomorphicFunctions;
  - orientation sheaf: a K-sheaf in ImplicitAtlases §0.10, a local system in Tau Ceti, and a sheaf on opens here, with the variant stated in Scope;
  - RelativisticQuantumFieldTheory only consumes this roadmap.
- **Source independence:** 16 passages compared with 3 sources, and none share wording beyond forced formulas: HIS (2.10)/(2.13), (4.5)/(6.2), p. 17, Thm 2.14, Thm 6.10/Cor 6.12, (6.4), Cor 3.12, Lemma 7.10/`b_Ω`, Thm 8.1/(8.8), Def 6.13, Prop 8.22; Komatsu Thms 6′, 12, 19; Malgrange Lemme 3 a; and two `Suggested.lean` docstrings. The largest share is HondaIzawaSuwa2018, with 14 of the 20 in-body locators. Contents compared with HIS §§1–8 and its appendix: independent.
  - Layer 0 merges HIS §§2.1–2.3 and 4.
  - Layer 2 (Malgrange, FS/DFS, currents, Stein duality, the proofs of purity and flabbiness) and Layer 5 have no HIS counterpart, and Layer 3a is mostly Sato–Kawai–Kashiwara and Kashiwara–Schapira.
  - The order Layer 3 → Layer 4 is forced by §4.3 needing §3.5 and §4.1 needing §§3.1–3.4.
- **Research link:** Layers 1–4 build Sato's hyperfunctions in the relative Dolbeault form of Honda, Izawa and Suwa (J. Math. Soc. Japan 75, 2023; arXiv 1807.01831), whose Theorem 2.14 quotes purity and flabbiness and whose §8 embeds distributions. Layer 3a is the microlocal theory of Sato, Kawai and Kashiwara (1973). This rests on the README's references and on HIS §§1–2.

## Not verifiable

- Ito, *Theory of (vector valued) Sato hyperfunctions*, 1986, §§1.5–1.6 (the Layer 2 route, line 317). The previous round found no legal copy (sources service, CiNii, Tokushima repository). It is a route source, not a theorem locator, and I did not search again.
- Sato–Kawai–Kashiwara 1973 (line 939) and Kashiwara–Schapira Chapters III–IV (line 941) are settled as uncertified (paywalled) and were not read. The §3a statements were checked by computation only.
- The journal version of Honda–Izawa–Suwa (J. Math. Soc. Japan 75, 2023) is restricted access. I read arXiv v4, which is the version the README links.

## Source issues

- **Gap** in HondaIzawaSuwa2018 at Proposition 8.22, p. 53: the proof passes to the limit in the pairing of `θu` with the Gaussian approximants citing only their uniform convergence on compacts, which does not control a distribution of positive order; it should note that all derivatives converge uniformly too, being Gaussian approximants of the derivatives; affects the proof.

## For the human reviewers

- none
