# Review of MorseTheory (pull request #1682 at eafa0a0)

**Verdict:** accepted

This is a full review: the folder changed by 205 lines since d49dff0. All five findings of the previous review are repaired, and the full pass over the folder found no defect. The gate passes.

## Previous findings

- **R01 (P2, the handle theorem was statable but absent): repaired.** `Suggested.lean:108` states `exists_homeomorph_pushout_handles` on the definitions `handle`, `attachingRegion` and `attachingRegionIncl` (`:81–98`). It also asserts `∀ q, f (φ q) = c - ε`, which the proposed repair did not have and which the README states ("with image in the level f⁻¹(c−ε)", `README.md:744–745`). The module docstring keeps only the §2.3 chart comparison under "Not stated". `README.md:733–766` names the four declarations and gives their API.
- **R02 (P3, the smooth proper exhaustion was unnamed): repaired.** `README.md:1007–1014`: "The smooth proper exhaustion that it approximates is `TauCeti.exists_contMDiffMap_isProperMap_nonneg` … Its controlled form `CompactExhaustion.exists_contMDiffMap_isProperMap`". The Tau Ceti contract (`:307–313`) and a Check (`:1033`) carry it too.
- **R03 (P3, the regularity input of the decay route was unnamed): repaired.** `README.md:1527–1531`: "the pinned `TauCeti.contMDiffOn_two_of_isMIntegralCurveOn`, applied on the boundaryless M to s=`Icc 0 T₁`, which has unique derivatives since T₁>0". The *Needs:* line names it "decay only" (`:1542–1543`).
- **R04 (P3, a Check named no function): repaired.** `README.md:773` begins "For f=x² on ℝ, the point x=1 …".
- **R05 (P3, nine consumers on main were missing): repaired.** `README.md:1585–1600` names GeometricCurrents, DGFloer, MorseNovikov, SymplecticFieldTheory, DiagrammaticCoherence, SchubertGeometry, CombinatorialHeegaardFloer, HamiltonianFloerOperations and HamiltonianReduction with the layers each uses.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** Re-run on this head: every counter is 0 and the result is `OK`. The worker's `gate.md` agrees and records `build=0`. The worktree is clean afterwards, and nothing outside `TauCetiRoadmap/MorseTheory/` differs from main.
- **Dependency check.** Output: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` prints eight `declaration uses sorry` warnings (`:108`, `:126`, `:151`, `:162`, `:176`, `:190`, `:210`, `:223`) and nothing else.
- **Signatures.** `#check @name` for all 12 declarations, compared with the README.
  - Every manifold theorem keeps `FiniteDimensional`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology` and `IsManifold I ∞`.
  - Both gradient theorems keep `RiemannianBundle` and `IsContMDiffRiemannianBundle I ∞ E`.
  - `handle` and `attachingRegion` are `ℕ → ℕ → Type`; `attachingRegionIncl` takes `k : ι → ℕ` and `m`.
  - `morse_inequalities` and `bettiNumber` take the field in M's universe, as `README.md:1076` and `:1090–1091` say.
  - No binder is lost and no statement differs in generality from the README.
- **Padding probe.** Each `sorry` in a scratch copy was replaced by `first | rfl | infer_instance | simp | (intros; exact?) | aesop`. All eight fail, including the m=0 branch of `nonempty_homeomorph_sphere_of_two_criticalPoints`. Nothing is padding.
- **Headlines.**
  - Stated (8): the handle attachment (§2.2), the CW model (§2.4), the polynomial inequalities (§4.1), the two-critical-point sphere theorem with its two inputs (§4.4), and convergence and decay of arbitrary forward curves (§6.1).
  - Consumed from the pin and named in the docstring: the normalized chart, compact finiteness, the regular fibre, band deformation, relative CW attachment, Morse density, proper Morse existence, the alternating inequalities, the LS bound, Reeb, and the maximal-trajectory theorems.
  - Not stated, with the reason given: the §2.3 parametrised chart comparison (a long encoding over families of charts and fibrewise adjunction spaces).
  - Not statable: Layer 5. The pin has no Morse–Bott predicate (`grep MorseBott` over Tau Ceti finds nothing).
- **Not at the pin.** No handle homeomorphism: `Morse/Cell/Comparison.lean:457` is the cell form, a strong deformation retract, and `Morse/HandleRetraction.lean:241` a deformation. No `bettiNumber`, `lsCupLength` or polynomial Morse identity. `library-matches.md` lists no same-name hit, and none of its candidates states a target.

### README identifiers at the pins

The README has 180 distinct backticked identifier tokens. A scan of the pinned sources for a declaration with each final name component leaves 12 unresolved: the 11 declarations of `Suggested.lean` other than `handle`, and `lsCupLength`, which is AlgebraicTopology's (main `README.md:1117`). `handle` is declared at `Suggested.lean:81`.

### Library declarations opened (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b)

Paths under `TauCeti/` unless marked Mathlib.

- `Geometry/Manifold/Exhaustion.lean:46`: `∃ f, IsProperMap f ∧ ∀ x, (K.find x : ℝ) ≤ f x`, for a Hausdorff manifold with a finite-dimensional model; no boundaryless or σ-compactness hypothesis. `:71`: the nonnegative form, with `SigmaCompactSpace`.
- `Geometry/Manifold/IntegralCurve/Regularity.lean:116`: `UniqueDiffOn ℝ s`, the curve equation on s, a field C¹ along the image, `BoundarylessManifold` and `IsManifold I 2` give `ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s`.
- `Geometry/Manifold/Riemannian/Gradient/Basic.lean:273`: a C^n metric and a C^(n+1) function give a C^n field `−mgradient`.
- `Geometry/Manifold/IntegralCurve/Maximal.lean:116` (`subset_maximalIntegralCurveInterval`) and `:267`, which uses Mathlib's open-interval uniqueness.
- `Geometry/Manifold/Morse/Deformation.lean:247` (`exists_sublevelHomeomorph`: a≤b, compact critical-free band, carries the level b onto the level a) and `:259`.
- `Geometry/Manifold/Morse/Cell/Comparison.lean:396`, `:457`. `Morse/RelCWComplex.lean:298`. `Morse/Exhaustion.lean:110`.
- `Topology/Homotopy/LusternikSchnirelmann.lean:182` (`pad` needs `Nonempty X`), `:287`, `:454`. `Morse/MinCriticalCount.lean:122`.
- `Geometry/Manifold/ContMDiffMap/Chart/Strong.lean:303`.
- Mathlib `Geometry/Manifold/Riemannian/PathELength.lean:220`: `riemannianEDist_le_pathELength` takes a C¹ curve on `Icc a b` and a≤b.
- Mathlib `Geometry/Manifold/IntegralCurve/ExistUnique.lean:228`: `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless`.

### Cross-roadmap citations, resolved on main 71c8f21

None of the cited roadmaps changed on main since 08d58bb (`git diff --stat` over their folders is empty).

- **GeometricTopology.** Layer 1 (`:783`), collars 1.1 (`:788`), 1.3 "Gluing along the boundary and handle attachment" (`:851`: the smooth handle `Dᵏ × Dⁿ⁻ᵏ` with corner straightening, which §2.2 cites and does not restate), 2.2 (`:1357`).
- **DifferentialGeometry.** Layer 3 (`:371`), Layer 5 (`:503`), Layer 12 (`:910`).
- **AlgebraicTopology.** Stage 4 (`:499`; MorseTheory named as consumer at `:634`, `:715`, `:738`), Stage 6 (`:946`), `lsCupLength` and its bound on nonempty X (`:1117–1123`).
- **Others.** CharacteristicClasses C2 (`:728`); ComplexKahlerGeometry K1 (`:96`), K7 (`:1405`); ComplexManifolds Milestone 1 (`:172`); DGFloer Layer 1 item 3 (`:622–630`).
- **Consumers.** All 17 READMEs on main that mention MorseTheory were opened. The 13 consumers match `README.md:1579–1600`: GeometricCurrents `:85`, `:323` (M3 exhaustion); DGFloer `:192` (M5), `:1176` (M1–M6 through HeegaardFloer Lane M), `:1361` (`c(M)`); MorseNovikov `:130–134` (M1–M4, M6); SymplecticFieldTheory `:205–208` (M1–M6); DiagrammaticCoherence `:50` (M1, M3); SchubertGeometry `:126` (M2 characteristic maps); CombinatorialHeegaardFloer `:622`; HamiltonianFloerOperations `:19`; HamiltonianReduction R2a `:157`.
- **DGFloer in both directions.** DGFloer consumes M4/M5 and §5.1 consumes DGFloer Layer 1 item 3. This is already so on main, DGFloer records it as layer-acyclic (`:192`), and the dependency check reports no cycle.

### Overlaps and ownership

- **Dropped ids.** `overlaps.md` lists `#m2-…` and `#m5-…`, cited by HeegaardFloer (`:647`, `:1064`). `README.md:493–499` maps all seven former ids, and the new anchors were recomputed from the headings.
- **Open pull requests.** None changes this roadmap, and none drops an id it cites.
- **Second owners.** `roadmaps grep` over main and all open heads for `handle`, `attachingRegion`, `attachingRegionIncl`, `bettiNumber`, the three Layer 2/4 theorem names and the namespace `TauCetiRoadmap.MorseTheory` finds this roadmap only. The closest roadmaps in vocabulary (ManifoldOptimization, RiemannianGeometry, DifferentialGeometry, DGFloer, AlgebraicTopology, MorseNovikov at their heads) only consume MorseTheory.

### Seeded sample: sources

Printed page = PDF page − 13 for cohen-iga-norbury, − 10 for nicolaescu-invitation, − 1 plus the journal's first page for the others.

- **§1.3.** Theorem 5.3, cohen-iga-norbury line 1322 (p. 36); Corollary 5.4, line 1423 (p. 38).
- **§2.2.** nicolaescu-invitation: handle `D^k×D^(m−k)` with `∂₋=∂D^k×D^(m−k)` and attachment along it, lines 1761–1779 (pp. 34–35); Theorem 2.2.3, line 1950 (p. 38: homeomorphism, one critical point; f exhaustive and M connected, line 1860); Remark 2.2.5, line 2177 (p. 42: several points on one level).
- **§2.4.** Theorem 5.7, line 1519 (p. 40, closed M).
- **§4.1.** Corollary 5.11, line 1569 (p. 42).
- **§4.2.** weber-conley Theorem 1.1, line 65 (p. 2: C², closed M; category the least ℓ≥1, lines 62–63). takens-1968 lines 69, 79–81, 91–96 (pp. 197–198).
- **§4.3.** Application 5.13, line 1617 (p. 43).
- **§4.4.** milnor-1959 Theorem 1(3), lines 72–76 (p. 440); Corollary 1, line 117 (p. 442). brown-1960 Theorem 5, lines 101–103 (p. 76).
- **§5.1.** Theorems 15.1 (line 4986, p. 143), 15.4 (line 5091, p. 146, compact M), 15.6 (line 5142, p. 147), 15.7 (line 5161, p. 147).
- **§6.1.** Theorem 4.6, line 1022 (p. 27, closed M).
- **§1.1, §1.2, §2.1, §2.3, §3.1, §3.2.** Pinned declarations (opened above or in the identifier scan) or uncertified texts.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line model | df=(1,0)=(1,0); range [0,∞)≠ℝ, excluded by `Boundaryless` | consistent | none |
| 2 | §1.2 index identity | −x²+y²; f=0 and x² on ℝ | 1+1=2; 0+0=0≠1, and 0+1=1 | needs nondegeneracy, as stated | none |
| 3 | §1.3 seminorm comparison | τ(y)=y/2, K=[−2,2], g=x² | g∘τ=y²/4: sups (1,1,1/2) ≤ 1·(1,2,2); reverse change scales order m by 2^m | true; C depends on k | none |
| 4 | §2.1 levels and faces | f=x on ℝ², c=0; x² at 0; x²+y², a=1 | tangent span(e₂)=ker df; df=0, not regular; circle modelled on `Fin 1→ℝ` | consistent | none |
| 5 | §2.2 smaller bands | x², a<a′<b′<b | x↦√a′↦√a equals the one-step image √a | true | none |
| 6 | `handle`, `attachingRegion` | (0,m); (1,1); (2,2); l>m | S⁻¹=∅ since ‖0‖=0≠1, handle pt×D^m; two points × pt in [−1,1]×pt; S¹ in D²; m−l=0 gives D^l×pt | bodies match the README | none |
| 7 | `attachingRegionIncl`, pushout API | X Hausdorff, any φ; core retraction | collar of ∂D^k×D^(m−k) in the handle separates points, so the pushout is Hausdorff; D^k×D^(m−k) retracts onto ∂D^k×D^(m−k)∪D^k×0 | true | none |
| 8 | `exists_homeomorph_pushout_handles` | x², c=0; −x², c=0; height on S², c=1; no critical point; dim 0; index m | ∅⊔[−1,1]≅[−√ε,√ε]; rays joined at ±√ε, f(±√ε)=−ε, gives ℝ; disc∪disc=S²; empty index, pushout M_(c−ε)≅M_(c+ε) by the band homeomorphism; isolated points added; attaching region S^(m−1) | true; level condition holds | none |
| 9 | §2.3 double well | y=x√(2−x²), ε=1/2 | 1−y²=(x²−1)²; x²=1−1/√2, so α±(1)=±0.541 in two components | consistent | none |
| 10 | `exists_cwComplex_homotopyEquiv` | T²; x² on ℝ; ∅; f=x; eˣ | cells (1,2,1); one 0-cell; empty; no critical points and ∅≄ℝ, but f=x is not bounded below; eˣ not proper | true; needs proper and bounded below | none |
| 11 | §3.1 restriction laws | δψ restricted to (0,1) | some 0<x<δ has ψ=1, so \|g(x)\|<x fails | strong-to-strong needs a proper inclusion, as stated | none |
| 12 | §3.2 exhaustion | ℝ, Kₙ=[−n,n]; arctan | `K.find x`=⌈\|x\|⌉≤g(x), so {g≤n}⊆[−n,n]; {arctan≤2}=ℝ, not compact | matches `Exhaustion.lean:46` | none |
| 13 | `morse_inequalities` | RP² over ℚ and 𝔽₂; T²; ∅; r points | (1+t+t²)−1=(1+t)t; Q=0; (1+2t+t²)−(1+2t+t²)=0; 0=0; r=r | true | none |
| 14 | §4.1 partial sums | c=(2,0,0,2), b=(1,0,0,1) | degree 1: −2≥−1 is false; S_n+S_(n−1)=x_n gives c_j−b_j=q_j+q_(j−1) | route correct | none |
| 15 | `bettiNumber` | RP², j=1; discrete ℕ, j=0 | 0 over ℚ, 1 over 𝔽₂; `finrank` of ⊕_ℕ k is 0 (junk, as the API says) | matches the API | none |
| 16 | §4.2 LS and cup length | S¹; T²; ∅ | 2≥2≥1+1; 4≥3≥2+1; 0+1≤0 is false | true; nonemptiness needed, as stated | none |
| 17 | §4.3 parity | m odd, c_j(−f)=c_(m−j)(f) | χ=(−1)^m χ, so χ=0 | true | none |
| 18 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | S¹ height, ε=δ=1/2; m=0 | η²=1−1/4=3/4, T>2/(3/4)=8/3; U={x}≅ℝ⁰ | consistent | none |
| 19 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | point, m=0; ℝ^m; radial bicollar | 1≠2 points, excluded by 0<m; not compact; s/(1+\|s\|) maps ℝ onto (−1,1), so b is onto the annulus | true | none |
| 20 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3 on S^m; two points; h² on S¹ | f=2/3−r⁴/4+…, Hessians 0, count 2; S⁰; count 4, hypothesis fails | true | none |
| 21 | §5.1 Morse–Bott | y²; y⁴; RP² filtration | kernel span(e₁); kernel ℝ², not Morse–Bott; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | consistent | none |
| 22 | `tendsto_of_isMIntegralCurveOn_neg_mgradient` | f=x on ℝ; metric x⁻²dx² | x₀−t, untrapped; x₀/(1+x₀t)→0, a regular point (metric not smooth) | true; hypotheses needed | none |
| 23 | `exists_edist_le_exp_of_tendsto_neg_mgradient` | −cos u; x⁴; 4dx² with x² | tan(u/2)=tan(u₀/2)e^(−t), rate 1; (x₀⁻²+8t)^(−1/2), excluded by Morse; 2\|x₀\|e^(−t/2) | true | none |
| 24 | §6.1 constants and regularity | t≥T₁; t≤T₁; γ=x₀e^(−2t) on `Icc 0 1` | Ce^(μt₁)e^(−μt); B≤Be^(μT₁)e^(−μt); C² within the set, right derivative −2x₀ | route correct, inputs named | none |

## Not verifiable

- **milnor-1963, hirsch-differential-topology, lee-smooth-manifolds.** The manifest settles them as uncertified; they were not read. This covers Milnor 1963 Theorem 3.1 (p. 12), Lemma 3.6 (pp. 20–21), Theorem 3.5 (p. 20) and Corollary 6.7 (p. 36); Hirsch Chapter 2 §1 and Chapter 6 Theorem 1.2; Lee Corollary 5.14 and Proposition 5.38.
- **ManifoldOptimization.** No checkout was given; ownership against it was checked through `roadmaps grep` over the open heads only.

## Source issues

- **Misprint** in nicolaescu-invitation at §2.1, definition of a handle, p. 34: the source says the upper boundary part of the handle is `D^k×∂D^(k−m)`; it should be `D^k×∂D^(m−k)`; affects nothing.
- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i and b_i; it should be c_k and b_k; affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.6, p. 147: the source says relative homology of the filtration's subquotients is the E² term; it should be the E¹ term, E² being its homology; affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.1, p. 143: the source says the normal-form diffeomorphism is defined on all of U×ℝ^λ×ℝ^(m−n−λ); it should be defined on a neighbourhood of U×{0}, since the quadratic form is unbounded; affects a stated result.
- **Gap** in cohen-iga-norbury at Theorem 4.6, p. 28: the source says the derivative of f∘γ tends to 0 because f∘γ is bounded and decreasing; it should also use uniform continuity of ‖∇f‖² along γ (bounded speed on compact M); affects the proof.
- **Misprint** in cohen-iga-norbury at Application 5.13, p. 43: the source says the lower disc is f⁻¹[t₁,a]; it should be f⁻¹[t₀,a], t₀ being the minimum value; affects the proof.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)`, while calling it the stable manifold; it should be `W^s(0)`; affects nothing.
