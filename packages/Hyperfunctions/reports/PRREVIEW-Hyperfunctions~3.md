# Review of Hyperfunctions (pull request #2592 at 73360bc)

**Verdict:** accepted

**Summary.** Accepted: I found nothing that makes a stated result false or unsupported. Every statement, Check and convention I recomputed holds, including the link between the Fourier–Sato inequality, the cotangent sign and the wavefront of a boundary value, and every source locator and supplier citation I opened says what the README takes from it. The head is the one the previous review read, so its four small corrections still stand and I confirmed each: two roadmaps cite this one for content this revision moved out, four named results have no locator, one sentence of the description credits Mathlib items to Tau Ceti, and one file path is wrong. There are also four format notes, none blocking, and nothing is left for a human to decide.

## C01 — Two roadmaps cite this one, under its former numbering, for content this revision moved out, and the table of former ids sends their readers in a circle

A reader who follows those citations after the merge finds nothing at the far end, and in one case the two roadmaps then cite each other.

ComplexComparisonPartII on main says that "Hyperfunctions HF3a states the same constructions" (extension by zero, c-soft resolutions, the localization triangle, `f_!`, proper base change), asks for a proof "that the two agree", and lists "Hyperfunctions HF3a (the `ℂ`-module case, for the identification)" in the *Needs* line of its §C6.1 (its README lines 126–130, 4796–4800 and 4828). The table of former ids (line 1365) sends HF3a to Layer 3a, but §3a.1 now takes exactly these constructions from §C6.1 (lines 956–963, *Needs* at 977–983). So the identification compares §C6.1 with itself, and §C6.1 and §3a.1 name each other. The dependency check does not see this edge. Ownership itself is settled, with ComplexComparisonPartII the single owner, which is why this is not a finding.

LocallyConvexDuality, at its open head (README lines 42–44), leaves to HF2.AnalyticPreparation.FunctionalDuality "the nuclearity of its smooth-section spaces". The table (line 1355) maps that id to §2.0b and §2.0e, which now prove the Fréchet–Schwartz property only.

The smallest repair is one sentence each under Downstream consumers: that the compact-support functors ComplexComparisonPartII attributes to HF3a are its own §C6.1, which §3a.1 uses with coefficients `ℂ`, so the identification is the identity and needs nothing from this roadmap; and that nuclearity of smooth-section spaces is not stated here. The citing roadmaps then drop or repoint their citations in their own revisions.

## C02 — Four named results have no source locator, so their statements cannot be checked against a text

Every headline of the overview has a locator, and each one I opened matches. These four do not:

- SteinBundleDuality (§2.0f, lines 578–587).
- The jump formula (§4.2, lines 1161–1163), which `Suggested.lean` states as a headline.
- The gluing theorem in dimension one (§1.3, line 281). The locator that follows, Honda–Izawa–Suwa (6.2), p. 19, is the correspondence of quotient classes with relative cocycles; it supports the comparison, not the sheaf property.
- Microlocal purity (§3a.3, line 1021), which has only the layer's citation of Sato–Kawai–Kashiwara as a whole.

All four are classical and I checked each by computation (see the table), so nothing is in doubt. Give a theorem and page for each, from a source of the author's choice.

## C03 — The description credits two Mathlib items to Tau Ceti

Under "What the old README marked as in the library", the description says "The pinned Tau Ceti already has them" and lists "Sheaf functors: extension by zero along an open inclusion and its exactness, and the exactness of inverse image and of direct image along a closed embedding". The head says otherwise (lines 952–969): extension by zero is Mathlib's `Functor.sheafPullback`, and the exactness of inverse image is Mathlib's `Functor.sheafPullbackConstruction.preservesFiniteLimits` (`Mathlib/CategoryTheory/Sites/Pullback.lean`, line 99).

Text that would be right: "Sheaf functors: the exactness of extension by zero along an open inclusion and of direct image along a closed embedding (the functors themselves, and the exactness of inverse image, are Mathlib's)."

## C04 — The Tau Ceti contract puts `TauCeti.SmoothEmbedding.NormalSpace` in a directory where it is not

Line 1560 places it under `Geometry/Manifold/TubularNeighborhood/`. At the pin that directory holds `exists_diffeomorph_normalBundle_subset` (`Existence.lean`, line 53), while `NormalSpace` is declared in `Geometry/Manifold/SmoothEmbedding/NormalSpace/Basic.lean`, line 59. Name both files.

## N01 — `exists_sum_dbar_eq` (`Suggested.lean`, lines 98–99) writes `∂/∂z̄ⱼ` out by hand. Tau Ceti's `TauCeti.conjWirtingerDeriv` (`TauCeti/Analysis/Complex/Wirtinger/Basic.lean`, line 80) is `v ↦ ½(Dg v + i·Dg(i·v))`, whose value at `Pi.single j 1` is exactly the summand, so the conclusion could read `∑ j, TauCeti.conjWirtingerDeriv (g j) z (Pi.single j 1) = f z` with that module imported.

## N02 — The Honda–Izawa–Suwa page numbers (pp. 7–53) are those of arXiv v4; the paper appeared in J. Math. Soc. Japan 75 (2023) with other pages. The References entry (line 1618) could name both versions and say which one the pages refer to.

## N03 — The module docstring of `Suggested.lean` (lines 32–34) names the Sato sheaf on a manifold and its flabbiness as not statable, but not purity on a real-analytic manifold, of which only the flat case is stated; it could be added to that bullet.

## N04 — In §3.5 (lines 879–880) the hypothesis `Γ ∩ (−Γ) = ∅` follows from the other two: if `y` and `−y` lay in a convex `Γ`, their midpoint `0` would. It could be stated as a consequence.

## Earlier findings

The previous review read this same head and raised no finding, so there is none to check for repair. Its four small corrections and first three format notes are unchanged in the text; I verified each again and they are C01–C04 and N01–N03 above.

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| §0.1 Checks | `ℤ` on `ℝ`, `S={0}` | `0→ℤ→ℤ²→H¹_S→0` gives `ℤ`; unquotiented variant `ℤ²`; `𝓗¹_S(ℤ)` skyscraper, so `ℤ` not flasque | true | none |
| §0.2 `d_rel` | both signs; `(∂̄a, β)` | `(0, ∂̄α−∂̄α+∂̄²β)=0`; wrong sign `(0, 2∂̄α)`; `(∂̄a,β)−d_rel(a,0)=(0,β−a)` | true | none |
| Convention 4 | Mathlib cone, shift `−1`, `b↦−b` | `(−da, fa+db)` → `(da, −fa−db)` → `(da, fa−db)`, the form in Tau Ceti's contract | agrees | none |
| §0.3 (sample) | `n=1,…,6`; HIS (2.10), (2.13) p. 7, (6.7) p. 21 | inversions `#{i≤j}=n(n+1)/2`: `1,3,6,10,15,21` → `−,−,+,+,−,−`; `(−1)ⁿ` agrees at `1,4,5`; source has both isomorphisms and normal-first rule | true; locators match | none |
| Layer 0 example | `M=ℝ`; HIS (4.5) p. 13, (6.2) p. 19 | source: `[F]↔[(0,−F)]`; §3.6 map sends `(0,−f)` to `(f₊,f₋)` | agrees | none |
| §1.3 / `oneDimBoundaryPresheaf_isSheaf` | `1/z` on `(0,∞)`, on `ℝ`; step functions | extends across `(0,∞)`: zero; on `ℝ`: `−2πiδ`; `(1,0)−(0,−1)=(1,1)` extends | true; no locator for gluing | C02 |
| §1.4 (sample) | `M` a point; `n=1` | `A_M=O_X\|_M`; densities `Ω^n⊗or_M`; point: `B=ℂ`, hyperdensities `ℂ` | consistent | none |
| §2.0a (sample) / `exists_sum_dbar_eq` | `n=1`, `f=1`; `n=0`; `Ω=∅`; Malgrange Lemme 3 a, pp. 235–236 | `v=\|z\|²`, `Δv=4`, `∂̄z̄=1`; `∂̄Σ(−1)^(j−1)∂_j v dz̄_[j]=(Δv/4)dz̄`; `n=0`: empty sum `0≠1` | holds; locator matches | N01 |
| §2.0a Poisson step, Convention 9 | Tau Ceti kernels and weak Dirichlet theorem | pin `‖x‖^(2−d)/(d(d−2)\|B₁\|)>0`, `−log‖z‖/(2π)`; README's are negatives; `∫∇η∇v=−∫fη` is `Δv=f` | agrees | none |
| §2.0c sign, Check | Stokes; Cauchy–Green | `∫∂̄η∧α=(−1)^(p+r+1)∫η∧∂̄α`; `∂̄(1/(πz))=δ`; swapped kernel `−φ` | true | none |
| §2.0e | Komatsu Thms 6′ p. 375, 12 p. 377, 19 p. 381; `B_j=ℂ` | 6′: bounded sets from one stage; 12: `X′≅lim X_j′`; 19(i): closed iff weak* closed; `L=F=ℂ` | supported | none |
| §2.0f | `n=0`; `V=ℂ`, `p=0` | `⊕E_x=(∏E*_x)′`; `H_c¹(ℂ,O)≅O(ℂ,Ω¹)′`, `H_c⁰=0` | holds; no locator | C02 |
| §2.1 (sample) | HIS Thm 6.10 p. 22, remark p. 23; `n=0`; `K=∅` | source: `0` for `q≠n`, strong dual of `O^(n−p)[K]` at `q=n`; hypothesis holds for real `K`; `0=0′` | supported | none |
| §2.1b (sample) | `n≥2`, `n=1` sequences; `Φ_q`; `K={0}` | `H_c¹(Ω)≅A[K]`, `H_c^r=0` for `r≠1,n`, `H_cⁿ(Ω)≅H_cⁿ(V)`; `(−1)^(nq+n)=(−1)^(n(q+1))`; `∮z^(m−k−1)dz=2πiδ_km` | true | none |
| §2.1c (sample) / `isZero_…realLocus` | `closure Ω∖∂Ω`; `n=0,1,2`; HIS Thm 2.14(1), p. 8 | equals `Ω` for open `Ω`; kernel `A[L]′→A[K]′` zero; `n` sets give Čech degree `≤n−1`; `2·2=4` components | holds; locator matches | none |
| §2.2 / `isFlasque_…realLocus` | `n=0`; HIS Thm 2.14(2), p. 8 | `Hⁿ(W∖Z)=0`, `H^(n+1)(W)=0` give `H^(n+1)_Z=0≅H¹_Z(𝓗ⁿ)`; point: `ℂ` flasque | holds | none |
| §2.3 (sample) | HIS Cor 6.12, p. 23; `K=∅` | source: `B^(p)_K(U)≅(A^(n−p)[K]⊗or_M(U))′` for `U⊆ℝⁿ`; `0=0′` | flat case supported, as cited | none |
| Layer 2 examples | functionals at `0` | need `\|c_k\|k!r^(−k)` summable for all `r`: `\|c_k\|≤C_ε ε^k/k!`; `1/(k!)²` qualifies | true | none |
| §3.1 (sample) | restriction sequence of §5.1 | vanishing on `U` iff support in complement, by definition; kernel `Γ_(V∖U)` | consistent; no locator | none |
| §3.2 (sample) | HIS (6.4), p. 20; `d_rel` | source: `(−1)ⁿ(∂τ₁,−∂τ₀₁)`; `d_rel(∂α,−∂β)=−∂(d_rel(α,β))`, so it descends | supported | none |
| §3.3 Check | `n=1`, `b=1` | `κ(0,−1_up)=(0,−1_low)`; times `−1`: `(0,1_low)=bv₋1=1` | true | none |
| §3.5 | HIS Cor 3.12 p. 11, Lemma 7.10 p. 28, `b_Ω` p. 30; `n=1` | source: `(0,−θ)`, `∫θ=1`, `b_Ω(f)=[fρ(ν)]`; lower cone `ψ=−1` at `−1`: integral `1` | supported | N04 |
| §3.6 (sample) | the four classes | `(0,g)↦(−g₊,−g₋)`: `(0,−f1_up)↦(f,0)`, `(0,f1_low)↦(0,−f)`; `[(−1/(2πiz), −1/(2πiz))]=−(−2πiδ)/(2πi)=δ` | true | none |
| §3a.2 Check | `d=1`; `η>0`, `η<0`, `η=0` | fibres `{0}`, `[0,∞)`, `[0,∞)`: `H_c = ℂ, 0, 0`; with `≥`: `ℂ` on `η<0` | true | none |
| §3a.3 sign and Check | `n=1`, `U={η>0}` | `H¹_(y≥0)(ν)` is lower-half-plane values: `bv_Γ` at `η(y)≤0`; `ξ=−η∘J` gives `ξ(y)≥0`; `FT(1/(x+i0))=−2πiH(ξ)` | consistent | C02 (purity locator) |
| §3a.7 Check | `bv₊(1/z)²`, `bv₊·bv₋` | `{ξ>0}∩−{ξ>0}=∅`; `{ξ>0}∩−{ξ<0}={ξ>0}` | true | none |
| §4.2 / `tendsto_…_sub` | `u=δ`; `u=1_[0,1]`; `K=∅` | `γ/(π(x²+γ²))→δ`; `π⁻¹(arctan((1−x)/γ)+arctan(x/γ))→1, ½, 0`; `K=∅` forces `u=0` | true; no locator | C02 |
| `existsUnique_isCauchyEmbedding`, `.injective` | `U=∅`; cutoff `ρ=1` near `x` | `C_(u−ρu)` holomorphic across `V`, so local classes agree and glue; zero class gives zero jump | holds | none |
| §4.3 Check | HIS Thm 8.1 p. 46, (8.8) p. 49 | second entries `θ(σ₁−∂̄σ₀₁)` both sides; tube `3⁻¹min{1,dist}` as source | true | none |
| §4.4 (sample) | `n=1`; HIS Def 6.13, Thm 6.14 p. 24, Prop 8.22 p. 53 | `β₁⁰=z̄/(2πi\|z\|²)=1/(2πiz)`; `−(−1)¹=1`; constant `C′ₙ` as source | true | source issue |
| §4.5 (sample) | `1/z`; `exp(1/z²)` | `\|1/z\|≤y^(−1)`: moderate, `ι(1/(x+i0))=bv₊`; `exp(cos2θ/y²)` unbounded by `y^(−N)` | consistent; no locator | none |
| §4.6 (sample) | Hörmander-type bound; `δ`, `1/(x+i0)` | `C^(N+1)(N+1)^N(1+‖ξ‖)^(−N)`; `δ̂=1`: both rays; `−2πiH(ξ)`: `ξ>0` only | consistent; no locator | none |
| Layer 4 examples | `x>0`, `x<0` | `log(−z)` jumps `−2πi` across `x>0`: jump of class `1`; `1/(x±i0)=PV∓iπδ` | true | none |
| §5.1 (sample) | `U=∅`; `U=V`; HIS Thm 2.14(2) | `B(∅)=0`, kernel all of `B(V)`; `U=V`: kernel `0` | holds | none |
| §5.2 Checks | `1/(1+2z)`; `x^m` | `φ^(k)(0)=k!(−2)^k`: `L=e^(−2)≈0.1353`; literal series `1,3,7,15`; `L(x^m)=1/m!`; `\|L\|≤M_r e^(1/r)` | true | none |
| §5.3 (sample) | `z=iy`; `z=e^(iθ)y`; supplier §5.2 | `exp(−1/y²)`; modulus `exp(cos2θ/y²)`; supplier states non-extension for `n≥1` | true | none |
| §3a.1 suppliers | ComplexComparisonPartII §C6.1 on main | `j_!` stalks, sections, c-soft, `RΓ_c`, triangle, `Rf_!` all stated there; it cites HF3a back | agrees | C01 |

- **Source locators checked against the texts:** 18, all matching theorem, equation and page: 14 from Honda–Izawa–Suwa, Komatsu Theorems 6′, 12 and 19, Malgrange Lemme 3 a.
- **Library declarations opened at the pins:** 142 names `#check`ed in one file against Mathlib and 37 Tau Ceti modules, all resolving. Statements read: `Distribution.cauchyTransform` (`CauchyTransform.lean` 106), `cauchyTransform_congr` (280), `cauchyTransform_delta_zero` (319), `newtonianKernel` (`Euclidean/Basic.lean` 57), `planarNewtonianKernel` (`Planar/Basic.lean` 47), `existsUnique_isWeakSolutionDirichlet_laplacian_of_subset_ball` (`DirichletProblem.lean` 644), `conjWirtingerDeriv` (`Wirtinger/Basic.lean` 80), `NormalSpace` (`NormalSpace/Basic.lean` 59), Mathlib `sheafPullback` (`Sites/Pullback.lean` 99).
- **Cross-roadmap citations resolved on main:** all section ids present in RealAnalyticGeometry (R0, R3.0–R3.2), ComplexKahlerGeometry (§§1.1, 1.3, 2.3–2.5, 3.1, 4.1, 5.1–5.3, 5.10), GlobalHolomorphicFunctions (§§0.3, 7.1, 7.4), PseudodifferentialOperators (Conventions, §P1.0, §6.2, §§9.1–9.2), BanachSpaceTheory (B1, B2), ComplexComparisonPartII §C6.1, ImplicitAtlases §0.10, ComplexManifolds Milestone 7. Every citation of a former HF id that I found on main and at open heads resolves through the table.
- **Automatic checks:** all passed. Dependency check output: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- **Elaboration:** `Suggested.lean` elaborates with the 7 `sorry` warnings only. The `#check` of all 11 declarations agrees with the README statements, with no binder lost. One-tactic probes (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop`) fail on all 7 theorems. No sorry'd data, no `set_option`, `import Mathlib` plus four Tau Ceti modules, all used.
- **Headline theorems:** purity, flabbiness, compact and Martineau duality, the distribution embedding with its Cauchy characterization and jump formula, MalgrangeTopVanishing, SteinBundleDuality, microlocal purity. Stated: flat purity and flabbiness, Malgrange, gluing in dimension one, the jump formula, existence, uniqueness and injectivity of the embedding in dimension one. The rest are named in the docstring as not statable, except purity on manifolds (N03).
- **Overlap check:** read ComplexKahlerGeometry, ComplexComparisonPartII and GlobalHolomorphicFunctions (main), RelativisticQuantumFieldTheory and LocallyConvexDuality (open); compact-support functors: ComplexComparisonPartII §C6.1 (stale back-citation, C01); FS/DFS calculus: this roadmap, by LocallyConvexDuality's own deferral; distributions, the Montel property and `exp(1/‖x‖²)`: ComplexKahlerGeometry §§5.1–5.3; `∂̄` solver and Cousin I: GlobalHolomorphicFunctions; RelativisticQuantumFieldTheory only consumes.
- **Source independence:** 16 passages compared with 3 sources, none shared beyond forced formulas; largest share HondaIzawaSuwa2018, 14 of 20 locators; contents compared with HondaIzawaSuwa2018 §§1–8: independent (Layers 2, 3a and 5 have no counterpart there, Layer 0 merges its §§2–4, and the order Layer 3 before Layer 4 is forced by §4.3 needing §3.5).
- **Research link:** Layers 1–4 build Sato's hyperfunctions in the relative Dolbeault form of Honda, Izawa and Suwa (2018; J. Math. Soc. Japan 2023), whose Theorem 2.14 quotes purity and flabbiness and whose §8 embeds distributions; Layer 3a is the microlocal theory of Sato, Kawai and Kashiwara (1973). Rests on the README's references and HondaIzawaSuwa2018 §§1–2, 8.

## Not verifiable

- Ito, *Theory of (vector valued) Sato hyperfunctions*, 1986, §§1.5–1.6 (the route cited at line 317): the previous round found no legal copy and I did not search again; it is a route source, not a theorem locator.
- Sato–Kawai–Kashiwara 1973 and Kashiwara–Schapira Chapters III–IV (lines 939–942): settled as uncertified, not read; the Layer 3a statements were checked by computation only.
- The journal version of Honda–Izawa–Suwa: restricted access; I read arXiv v4, the version the README links.

## Source issues

- **Gap** in HondaIzawaSuwa2018 at Proposition 8.22, p. 53: the proof passes to the limit in the pairing of the cut-off distribution with Gaussian approximants citing only their uniform convergence on compacts; it should use uniform convergence of every derivative, which the approximants also have; affects the proof.

## For the human reviewers

- none
