# Review of MorseTheory (pull request #1682 at d49dff0)

**Verdict:** needs changes

This is a full review. The folder changed by 2986 lines since cc6f063, the head the previous review read. `lake-manifest.json` pins Tau Ceti 2fd255d and Mathlib 1b1ccf4, as main does, and nothing outside `TauCetiRoadmap/MorseTheory/` differs from main.

All seven findings of the previous review are repaired. One finding remains, on the pull-request description only; the roadmap folder has none.

## Previous findings

- **R01 (P2, headlines on private copies of pinned carriers): repaired.**
  - `Suggested.lean:4–7` imports `TauCeti.Geometry.Manifold.Morse.{Basic,Index,CriticalPoints}` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`.
  - The four private definitions are gone. The headlines use `TauCeti.criticalPoints` (`:82`, `:166`), `TauCeti.criticalCount` (`:104`), `TauCeti.totalCriticalCount` (`:113`, `:141`) and `TauCeti.Manifold.mgradient` (`:164`, `:177`).
  - `README.md:493–496`: "It states them on the pinned carriers … and its only definition is `bettiNumber`".
- **R02 (P3, ten restatements of pinned theorems): repaired.** The ten theorems and `sublevelInclusion` are deleted. No own-name backtick in the README names a deleted declaration (gate `readme-ids-missing=0`).
- **R03 (P3, minimum-count block): repaired.** The seven declarations are deleted. `README.md:1094–1104` consumes `TauCeti.minCriticalCount`, `TauCeti.exists_totalCriticalCount_eq_minCriticalCount` and `TauCeti.minCriticalCount_ne_top`.
- **R04 (P3, legacy README shape): repaired.**
  - Headings: `# Roadmap:` with `**Summary.**` (`:1–3`), `## Scope and ownership` (`:12`), `## Conventions` (`:83`), `## Exact supplier contracts` (`:116`), `## How to read the build` (`:471`), `## Layer 1` … `## Layer 6` each with `### Examples` and `### Dependencies`, `## Downstream consumers` (`:1517`), `## References` (`:1525`).
  - Every subsection has a `*Needs:*` line.
  - Pinned results are listed once in the Tau Ceti contract (`:156–354`); the Layers say "is pinned" and then "Owned here".
- **R05 (P3, stale name and commit links): repaired.** `IsMorse.finite_setOf_mfderiv_eq_zero` no longer occurs, and the README has no link to a Tau Ceti commit.
- **R06 (P3, spacing and capitals): repaired.** With code spans and link targets stripped, no letter is directly followed by a digit outside the labels K1, K7, AT4–AT6; "SAME" and "POINTS" are gone.
- **R07 (P3, Takens' connectedness): repaired.** `README.md:1100–1104`: "For connected M this is Takens' F.(M) … which he defines for compact connected manifolds only (Takens 1968, Introduction, pp. 197–198)".

## R01 (P3) — The description claims page numbers for Hirsch and Lee; the README cites them by chapter and theorem number

**Location.** Pull-request description, the README list, last item: "Locators and Checks throughout, with page numbers for Milnor (1963 and 1959), Cohen–Iga–Norbury, Nicolaescu, Hirsch, Lee, Weber, Brown and Takens."

**Claim.** The sentence says the head gives page numbers for nine sources. For two of them it gives none.

**Witness.**
- Hirsch: `README.md:298–299`, `:939–940`, `:945` and `:1547–1549` cite "Chapter 2, §1" and "Chapter 6, Theorem 1.2", with no page.
- Lee: `README.md:206–207`, `:611–612` and `:1550–1552` cite "Corollary 5.14 and Proposition 5.38", with no page.
- The other seven do carry pages, for example "Theorem 3.5, p. 20" (`:1529`) and "Theorem 1.1, p. 2" (`:1554`).

**Exact repair.** Replace the sentence with: "Locators and Checks throughout, with page numbers for Milnor (1963 and 1959), Cohen–Iga–Norbury, Nicolaescu, Weber, Brown and Takens, and chapter, section and theorem numbers for Hirsch and Lee." No change to the folder: chapter and theorem numbers are valid locators for these two texts.

**Tested.** `grep -n "Hirsch\|Lee," README.md` returns the seven lines above; none contains "p." or "pp.".

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** Re-run on this head: every check 0, `OK`; the worker's `gate.md` agrees and records `build=0`. The worktree is clean afterwards.
- **Dependency check.** Output: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean` prints seven `declaration uses sorry` warnings (`:76`, `:101`, `:112`, `:126`, `:140`, `:160`, `:173`) and nothing else.
- **Signatures.** The eight elaborated types in `signatures.md` were compared with the README.
  - Every manifold theorem keeps `FiniteDimensional`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology` and `IsManifold I ∞`.
  - `morse_inequalities` takes `k : Type u_1`, M's universe (`README.md:1024–1025`).
  - The two-open-cell theorem carries only `T2Space`, `CompactSpace` and `0 < m` (`:1275–1277`).
  - Both gradient theorems carry `RiemannianBundle` and `IsContMDiffRiemannianBundle I ∞ E` (`:1439–1440`).
  - `bettiNumber` puts k and X in one universe (`:1039–1040`).
- **Padding probe.** In a scratch copy each `sorry` was replaced by `first | rfl | infer_instance | simp | (intros; exact?)`. All seven fail (four "unsolved goals", two `exact?` failures, one "`simp` made no progress"). Nothing is padding.
- **Headlines.**
  - Stated: the CW model (§2.4), the polynomial strong inequalities (§4.1), the degenerate two-critical-point sphere theorem with its two inputs (§4.4), and convergence and exponential decay of arbitrary forward curves (§6.1).
  - Docstring, consumed from the pin: the normalized chart, compact finiteness, the regular-level embedding, band deformation, the relative CW attachment, Morse density, proper Morse existence, the alternating inequalities, the Lusternik–Schnirelmann bound, Reeb, and the maximal-trajectory theorems.
  - Docstring, not stated: the handle homeomorphism and chart-change comparison (§2.2–§2.3), as a long encoding.
  - Docstring, not statable: Layer 5. The pin has no Morse–Bott predicate.
  - Not at the pin (grep of `Geometry/Manifold/Morse/`): a polynomial identity for a Morse function (`Inequalities.lean` stops at `:429`, Euler's equality); a global CW model (`Exhaustion.lean` has only `:51` and `:110`); a degenerate two-critical-point theorem (`Reeb.lean:148` needs `IsMorse`); curve theorems on `Set.Ici 0` (all of `GradientFlow.lean` and `ExponentialConvergence.lean` are about `maximalIntegralCurve`); a Betti number.

### README identifiers at the pins

All 153 backticked identifiers were searched in the pinned Tau Ceti and Mathlib. 146 are found; the other seven are this roadmap's theorems, each declared in `Suggested.lean`.

### Library declarations opened (Tau Ceti 2fd255d, Mathlib 1b1ccf4)

Tau Ceti, 22 declarations:

- `Morse/Basic.lean:212` `IsMorse` (Morse on `univ`).
- `Morse/CriticalPoints.lean:274` `IsMorse.finite_criticalPoints_inter`: only `[IsManifold I 1 M]` in scope (`:249`), as `README.md:176–178` says. `:426` `IsMorse.criticalCount_neg`, with `j ≤ finrank ℝ E`.
- `Morse/RelCWComplex.lean:298`: `0 < ε ∧ ε ≤ δ`, a finite `RelCWComplex C {f ≤ c−ε}`, cells ≃ critical points of index m on the level, and a retraction with `HomotopyRel` (`README.md:272–276`).
- `Morse/Exhaustion.lean:110`: strictly increasing regular levels, `K 0 = ∅`, finitely many critical points per stage.
- `Morse/Generic/Strong.lean:110`, `:279` and `:290` (`exists_isMorse_isProperMap_bddBelow`).
- `Morse/LusternikSchnirelmann.lean:185`: smooth f, compact M, standing binders at `:82`.
- `Morse/MinCriticalCount.lean:68` (infimum over `C^∞⟮I, M; 𝓘(ℝ), ℝ⟯`) and `:122`.
- `Morse/Reeb.lean:148`: the sphere of `EuclideanSpace ℝ (Fin (finrank ℝ E + 1))`.
- `Morse/GradientFlow.lean:208`, `:235`, `:261` and `:282`.
- `Morse/ExponentialConvergence.lean:102` and `:303`: `∃ μ > 0, ∃ C > 0, ∀ᶠ t in atTop`, which gives the T₀ of `README.md:1472`.
- `IntegralCurve/Maximal.lean:116` (true by definition of the maximal interval, as `:349` says) and `:252` (needs `T2Space`, `IsManifold I 1 M`, `BoundarylessManifold` and a C¹ field).
- `Riemannian/Gradient/Basic.lean:73`: `rieszDual x (mvfderiv I f x)`.
- `Morse/ChartTransition.lean:74`.
- `Analysis/InnerProductSpace/Hemisphere.lean:377`: closed A and B with `A ∪ B = univ`, two homeomorphisms to the closed unit ball, the intersection ↔ norm 1.
- `AlgebraicTopology/Singular/JordanBrouwer.lean:218`: `finrank F = finrank E + 1`, a continuous injection, `Nat.card (ZerothHomotopy (range h)ᶜ) = 2`.
- `AlgebraicTopology/Cellular/EulerCharacteristic/MorseInequalities.lean:148`: finitely many cells through n, none in degree n+1, Q's coefficients the ranks of `d (i+1) i`.
- `Geometry/Manifold/LocallyFlat/Bicollar.lean`: `IsBicollar` is an open embedding `N × ℝ → M` with the given zero slice.
- Also present: `Analysis/Calculus/Morse/SpectralSplitting.lean`, `Analysis/Calculus/Morse/NormalForm.lean:245`, `Analysis/Normed/Algebra/SquareRoot.lean:80`, `LinearAlgebra/FreeModule/PID.lean:42`, `Geometry/Manifold/Boundary/InducedOrientation.lean:145`.

Mathlib, 6 declarations:

- `Geometry/Manifold/IntegralCurve/Basic.lean:65`: `IsMIntegralCurveOn` uses `HasMFDerivAt[s]`, the derivative within s. This is the one-sided endpoint of `README.md:1446–1448`.
- `Geometry/Manifold/IntegralCurve/ExistUnique.lean:228`.
- `Geometry/Manifold/Riemannian/PathELength.lean:220`: needs γ of class C¹ on `Icc a b`.
- `Topology/Compactification/OnePoint/Sphere.lean:34`: `finrank ℝ V + 1 = Fintype.card ι`.
- `Topology/Compactification/OnePoint/Basic.lean:630`.
- `Analysis/Calculus/ContDiff/Bounds.lean:444`.

### Cross-roadmap citations, resolved on main 2bbd3cb

- **AlgebraicTopology.**
  - Stage 4 item 4 has `diskBoundaryRelCW` (`:624`).
  - Item 5 (`:635`) has `relativeCWPushout` (`:644`), `homotopyPushoutGluingComparison` (`:658`), `cofibrationTowerHomotopyEquivalence` (`:683`), the compact-subset factorization (`:696`), `cwSubcomplexTowerUnion` (`:700`) and `relativeCWPushoutCWModel` (`:716`).
  - Item 6 (`:789`) is the projective carrier.
  - Stage 6 item 1 has the universal-coefficient sequence (`:1041`).
  - The supplement after 6.2 has `LSCategoricalCover` (`:1082`), `lsCategoryCount` (`:1091`), `lsCupLength` (`:1117`) and the bound `lsCupLength X R+1≤lsCategoryCount X X` on nonempty X for every commutative R (`:1120–1126`). `lsCupLength` is not at the pin, so §4.2 rightly cites the roadmap for it.
- **GeometricTopology.** §2.2 (`:1357–1365`): n ≥ 1, a bicollared Sⁿ⁻¹ in Sⁿ, each closure ≃ Dⁿ restricting to the parametrization. Layer 1 has collars (`:788`), handle attachment (`:851`) and tubular neighbourhoods (`:974`).
- **DifferentialGeometry.** Layers 3 (`:371`; 3.3 has compact-manifold completeness), 5 (`:503`; 5.1 at `:507`), 10 (`:877`; 10.2 Sard at `:884`) and 12 (`:910`; 12.2 at `:918`, 12.3 at `:920`).
- **Others.** CharacteristicClasses C2 (`:728`); ComplexKahlerGeometry K1 (`:96`), K7 (`:1405`), K7.1 (`:1407`), K7.2 (`:1444`); ComplexManifolds Milestone 1 (`:172`); DGFloer Layer 1 item 3 `SpectralObject` (`:624–630`); HeegaardFloer Lane M (`:70`); ConvexityToric T2 (`:73`); RiemannianGeometry R3 (`:369`); AffineMorseLefschetz consumes M1–M4 (`:130`).
- None is on the forbidden list, and each is on main.

### Overlaps and ownership

- **Dropped ids.** `overlaps.md` lists `#m2-…` and `#m5-…`, cited by HeegaardFloer on main (`:647`, `:1064`). `README.md:477–483` maps all seven former ids to the new headings, so those citations can be followed. Not a finding.
- **Other pull requests.** None changes this roadmap. No cited id is dropped by an open pull request, and none is defined only by an open revision.
- **Second owners.** `roadmaps grep` over main and all open heads for the two-open-cell recognition, two critical points, Morse inequalities, one cell per critical point, compact trapping, and the seven theorem names finds:
  - AffineMorseLefschetz as a consumer;
  - HeegaardFloer's semiclassical route to the inequalities (M.10), a different theorem;
  - MorseNovikov and DGFloer only in examples.
- **Name clashes.** No other `Suggested.lean` uses the namespace `TauCetiRoadmap.MorseTheory`. `bettiNumber` is declared nowhere else and is absent from both pins.

### Seeded sample: sources

Every sampled section's locators were read in the line-numbered texts. Printed page = PDF page − 13 for cohen-iga-norbury and − 10 for nicolaescu-invitation.

- **§1.3.** Theorem 5.3, cohen-iga-norbury line 1322 (p. 36); Corollary 5.4, line 1423 (p. 38: critical points of a Morse function are discrete).
- **§2.2.** nicolaescu-invitation Theorem 2.2.3, line 1950 (p. 38: one critical point, homeomorphic to the lower sublevel with a λ-handle); Remark 2.2.5, line 2177 (p. 42: several points, f exhaustive, as the README says).
- **§2.4.** Theorem 5.7, cohen-iga-norbury line 1519 (p. 40: closed M, one λ-cell per critical point of index λ).
- **§4.1.** Corollary 5.11, line 1569 (p. 42). Its proof (lines 1585–1596) writes c_k = d_(k+1) + b_k + d_k, the README's (1+t)Q with q_k = d_(k+1), over ℝ. The README's field generality rests on the pinned inequalities, not on this source.
- **§4.2.** weber-conley Theorem 1.1, line 65 (p. 2: C² f on a closed manifold has at least cat(M) critical points; cat is the least ℓ ≥ 1, lines 62–63). takens-1968 line 69 (p. 197: compact connected X), lines 79–81 (p. 198: F.(X)), lines 91–96 (the inequality F. ≥ L.S. and the definition of L.S.).
- **§4.3.** Application 5.13, cohen-iga-norbury line 1617 (p. 43).
- **§4.4.** milnor-1959 Theorem 1, lines 72–76 (p. 440; condition (3) is a union of two opens diffeomorphic to ℝⁿ); Corollary 1, line 117 (p. 442: homeomorphic to Sⁿ). brown-1960 Theorem 5, lines 101–103 (p. 76).
- **§5.1.** Theorem 15.1, cohen-iga-norbury line 4986 (p. 143); 15.4, line 5091 (p. 146: compact M, as the README says); 15.6, line 5142, and 15.7, line 5161 (p. 147, proof to p. 148).
- **§6.1.** Theorem 4.6, line 1022 (p. 27: closed M).
- **§1.1, §1.2, §2.1, §2.3, §3.1, §3.2.** Their statements are pinned declarations (opened above) or rest on uncertified texts; see Not verifiable.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ², f=x; half-line model | identity transport, df=(1,0) on both sides; range [0,∞) ≠ ℝ, excluded by `Boundaryless` | consistent | none |
| 2 | §1.2 counts and index identity | −x²+y²; constant on S¹; point; ∅; f=0 and x² on ℝ | Hessian diag(−2,2), index 1, count 1; count ∞ (not 0); count 1; count 0; indices 0+0=0≠1 and 0+1=1 | identity needs nondegeneracy, as stated | none |
| 3 | §1.3 seminorm comparison | τ(y)=y/2, K=[−2,2], g=x²; reverse y=2x | g∘τ=y²/4 sups (1,1,1/2), max 1; g on [−1,1] sups (1,2,2), max 2: C=1; reverse scales the m-th derivative by 2^m, so C=2^k | true; C depends on k | none |
| 4 | §2.1 levels and co-orientation | f=x on ℝ², c=0; x² at 0; dim 0; [a,b] with f=x; x²+y², a=1 | level ℝ, tangent span(e₂)=ker df; df=0, not regular; 0−1=0 in ℕ, model `Fin 0`; signs + at b, − at a; boundary model `Fin 1`, not `Fin 2` | consistent | none |
| 5 | §2.2 restriction to smaller bands | x², 0<a<a′<b′<b; abstract r, r′ | x∈[√a′,√b′] ↦ √a′ ↦ √a, equal to the one-step image; r∘i=id gives r∘(i∘r′)=r′ | true | none |
| 6 | §2.2 pseudo-gradient normalization | x², z=√2x; metric 2dx²; band [1,4] | z′=−z gives x′=−x, df(X)=−2x²; grad = 2x/2 = x; X=−1/(2x), from x=2 to x=1 in time 4−1=3 | consistent | none |
| 7 | §2.3 double well | (x²−1)², c=1, ε=1/2, y=x√(2−x²) | 1−y²=(x²−1)²; x²=1−1/√2, α±(1)=±0.541; {f≤1/2} is x²∈[0.293,1.707], two components | consistent | none |
| 8 | §2.3 RP² top cell | (y²+2z²)/(x²+y²+z²), chart z=1 | 2−f=(2a²+b²)/(1+a²+b²); coordinates (√2a,b)/√(1+a²+b²); attaching degree ±2 | consistent | none |
| 9 | `exists_cwComplex_homotopyEquiv` | S² height; x² on ℝ; ∅; ℕ with f(n)=n; f=x; eˣ; universe of X | cells (1,0,1) vs indices {0,2}; one 0-cell; empty; ℵ₀ 0-cells; f=x proper, unbounded below, no critical point: X=∅≄ℝ; eˣ bounded below, not proper: same; countably many cells, so X exists in every universe | true; both hypotheses needed | none |
| 10 | §3.1 restriction laws | δψ on ℝ restricted to (0,1); ℝ in ℝ⊔ℝ; tolerance e^(−x²) | at 0<x<δ with ψ=1: δ ≥ x, so \|g\|<x fails; clopen summand keeps local finiteness; constant c≠0 exceeds e^(−x²) for large x | strong continuity needs a proper inclusion | none |
| 11 | §3.2 proper Morse existence | x² on ℝ with error <1; ∅; discrete ℕ | lower bound −1, still proper; vacuous; f(n)=n proper, constants not | consistent with `Generic/Strong.lean:290` | none |
| 12 | `morse_inequalities` | S²; RP² over ℚ and 𝔽₂; T²; r points; ∅; j>dim M | (1,0,1)=(1,0,1), Q=0; (1,1,1)=(1,0,0)+coeff((1+t)t); B=C, Q=0; (1,2,1), Q=0; r=r; 0=0; c_j=b_j=0 forces q_j=−q_(j−1)=0 | true | none |
| 13 | §4.1 partial-sum route | c=(2,0,0,2), b=(1,0,0,1); RP² over ℚ | weak ok, alternating sums 0=0, S₁: −2 ≥ −1 false; ranks d₁=0, d₂=2 give Q=0+1·t | route correct; weak+Euler insufficient | none |
| 14 | `bettiNumber` | point; RP², j=1; discrete ℕ; S¹ vs ℝ²∖0; disc | (1,0,…); 0 over ℚ, 1 over 𝔽₂; finrank of ⊕_ℕ k is 0 (junk, as the API says); 1=1; 0 | matches API and Checks | none |
| 15 | §4.2 LS bound and cup length | S¹; T²; RP² over 𝔽₂ and ℚ; S¹⊔S¹; ∅; point; constant on S¹ | 2≥2≥1+1; 4≥3≥2+1; 3≥3≥2+1 and 3≥3≥0+1; 4=2+2, normalized 1+1≠3; 0≤0 but 0+1≤0 false; 1≥1≥0+1; ⊤≥2 | true; cup bound needs M nonempty, as stated | none |
| 16 | §4.3 count duality | S² with c=(2,1,1) | −f has (1,1,2); χ=2−1+1=2; (2,1,1) is not symmetric | relates f and −f, as stated | none |
| 17 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | m=0, two points; one point; S¹ height; h−h³/3; h²; S²⊔S² | U={x}, V={y} ≃ `Fin 0 → ℝ`; count 1≠2; η²=3/4, (b−a)/η²=8/3; f=2/3−r⁴/4+O(r⁶), Hessians 0, count 2; count 4 (m=1), ⊤ (m≥2); count ≥4 | true | none |
| 18 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | point with m=0; ℝ^m; S^m minus poles; S¹ by two arcs; X=V | 1 point ≠ S⁰, excluded by 0<m; not compact; caps glue to S^m; S⁰→S¹ has two complementary arcs (Jordan–Brouwer with dim E=1); V compact ≃ ℝ^m impossible, vacuous | true | none |
| 19 | two-open-cell route | b(θ,s)=(r+ηs/(1+\|s\|))θ | s/(1+\|s\|) maps ℝ onto (−1,1), image {r−η<\|u\|<r+η}; X∖D=∅ would make U compact; S^m∖Σ = (X∖D) ⊔ ((int D∩V)∪{∞}), two open nonempty sets, two components | route correct | none |
| 20 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | S^m height; m=0, M={x,y}; h−h³/3; k components | S^m; S⁰⊂ℝ¹; S^m; ≥2k critical points, so k=1 | true; the proof term composes rows 17 and 18 for m>0 | none |
| 21 | §5.1 Morse–Bott | y²; y⁴; Möbius line over S¹; RP² filtration | kernel span(e₁), ranks (0,1); kernel ℝ², not Morse–Bott; twisted H₀(S¹)=ℤ/2 vs constant ℤ; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | consistent; E¹ convention correct | none |
| 22 | `tendsto_of_isMIntegralCurveOn_neg_mgradient` | x²; f=x; metric x⁻²dx²; e^(−x) | x₀e^(−2t)→0∈K; x₀−t untrapped; x₀/(1+x₀t)→0, a regular point (needs smooth metric); untrapped | true | none |
| 23 | `exists_edist_le_exp_of_tendsto_neg_mgradient` | S^m height; x⁴; x²−y²; x² with 4dx²; equilibrium | u=2arctan(tan(u₀/2)e^(−t)), c=1; (x₀⁻²+8t)^(−1/2), not exponential, excluded by Morse; c=2; 2\|x₀\|e^(−t/2); C=0 | true | none |
| 24 | §6.1 constants | t≥T₁=t₁+T₀; t≤T₁ | Ce^(−μ(t−t₁))=Ce^(μt₁)e^(−μt); L+Ce^(−μT₀)=B ≤ Be^(μT₁)e^(−μt) | route correct | none |
| 25 | §6.1 endpoint | γ=x₀e^(−2t) for t≥0, x₀ for t<0 | right derivative −2x₀, left 0; Γ(s)=x₀e^(−2−2s)=γ(1+s) for s≥−1 | comparison at t₁>0 needed and correct | none |
| 26 | R01 | description vs README | "page numbers for … Hirsch, Lee"; seven README lines cite both by chapter, section and theorem only | description inaccurate | R01 |

## Not verifiable

- **lee-smooth-manifolds, milnor-1963, hirsch-differential-topology.** The manifest settles them as uncertified. They are cited by locator only and were not read. This covers Lee Corollary 5.14 and Proposition 5.38 (§2.1); Milnor 1963 Theorem 3.1, p. 12 (§2.2), Lemma 3.6, pp. 20–21 (§2.3), Theorem 3.5, p. 20 (§2.4) and Corollary 6.7, p. 36 (§3.2); and Hirsch Chapter 2 §1 and Chapter 6 Theorem 1.2 (§3.1).
- **ManifoldOptimization (#1506).** Listed as closest in vocabulary; the brief gives no files for it, so ownership against it was checked only by `roadmaps grep`.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i and b_i, in the statement and in the proof's last display; it should be c_k and b_k; affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.6, p. 147: the source says the page built from the relative homology of the filtration's subquotients is the E² term; it should be the E¹ term, E² being its homology; affects a stated result.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)`, while calling it the stable manifold; it should be `W^s(0)`; affects nothing.
