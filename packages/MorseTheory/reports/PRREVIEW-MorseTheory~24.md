# Review of MorseTheory (pull request #1682 at bcad0bc)

**Verdict:** needs changes

Full review of the same head as the previous review (bcad0bc; 0 changed lines in the folder, nothing changed outside it). The folder's text is mathematically sound on every check below. The one defect is not in the text: the branch was never merged with main. As a result, the Tau Ceti library that the README and `Suggested.lean` consume does not exist at this head's pin. Only a merge of `origin/main` by the author or a human repairs this. A further folder edit cannot.

## R01 (P1) — The branch is not merged with main: most of the Tau Ceti library the roadmap consumes is absent at this head's pin

Re-raised: H01

**Location.**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:22`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated".
- `TauCetiRoadmap/MorseTheory/README.md:38–40`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6".

**Claim.** The README hands most of Layers 1–4 and 6 to Tau Ceti declarations it calls pinned, and the proof routes of the owned targets rest on them. At the pins this head builds against, those declarations do not exist. So:
- the supplier contract is false where it is cited;
- the routes of all six sorried headlines have unowned inputs;
- the 17 headlines that the docstring says are "proved at the pinned Tau Ceti" are neither proved at that pin nor stated in `Suggested.lean`.

**Witness.**
- `lake-manifest.json` pins Tau Ceti a91d3aaf, Mathlib 6b7abb3 and Lean v4.35.0-rc3.
- Main (3090489) pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
- 94 of the README's 165 backticked identifiers occur nowhere at this head's pins, and all 94 are declared at main's pins.
- `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf and 35 at 2fd255d.

**Detail.**
- **Method.** Every backticked identifier was extracted from the README. A name counts as absent when the last component of its name does not appear as a word anywhere in the Tau Ceti a91d3aaf and Mathlib 6b7abb3 trees. One false negative of a declaration grep was removed by hand: `Manifold.riemannianEDist` is an `irreducible_def` at Mathlib 6b7abb3, `Geometry/Manifold/Riemannian/PathELength.lean:207`. Of the 165 names:
  - 63 are present at both pins;
  - 94 are present only at 2fd255d/1b1ccf4;
  - 8 are this roadmap's own 7 declarations plus AlgebraicTopology's `lsCupLength`.
- **Docstring names.** None of the 17 consumed declarations named at `Suggested.lean:23–45`, nor `TauCeti.criticalPoints` (`:20`), is at a91d3aaf. At 2fd255d they are declared at, among other places:
  - `Morse/CriticalPoints.lean:87`;
  - `Morse/GradientFlow.lean:261`;
  - `Morse/ExponentialConvergence.lean:303`;
  - `Morse/Reeb.lean:148`;
  - `Morse/LusternikSchnirelmann.lean:185`.
- **Routes of the owned headlines, inputs absent at a91d3aaf:**
  - §2.4 needs `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` and `TauCeti.IsMorse.exists_regular_sublevel_exhaustion`.
  - §4.1 needs `TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le`, its `_eq` form, `TauCeti.IsMorse.finite_singularHomology` and `TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex`.
  - §4.4 needs `IsLocalExtr.mem_criticalPoints`, `TauCeti.Manifold.mgradient` and `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.
  - §6.1 needs `TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`, `TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient` and `TauCeti.IsMorse.finite_criticalPoints_inter`.
  - What exists at a91d3aaf: `TauCeti.IsBicollar`, `TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two` and the `IntegralCurve/Maximal` lemmas.
- **Merge state.**
  - The merge base is ffcc9d31.
  - `git merge-tree --write-tree origin/main HEAD` reports content conflicts in `README.md` and `Suggested.lean`.
  - Main changed this folder in 53021f19 and 76ab5b3f.
- **Why the gate passes.** The three modules that `Suggested.lean` imports exist at a91d3aaf. Its statements also spell out the critical set (`{x | mvfderiv I f x = 0}`) and the gradient (`rieszDual x (mvfderiv I f x)`) by their bodies.
- **Pull-request text.** The title and description announce Palais–Smale targets and a file `PalaisSmaleTargets.lean`. The folder has no such file, and `README.md:76–81` places Palais–Smale theory outside this roadmap.

**Why H01's reason does not settle it.** H01's reason is that only a merge of `origin/main` repairs this, and a repair job cannot do that merge because it touches `lake-manifest.json` and `lean-toolchain`. That is right about who must act. It does not make the supplier contract true at the pin where the build and the gate check it. The head cannot merge as it stands either, because of the two conflicts. This is the only finding, and it needs the author or a human with push access.

**Exact repair.**
1. Merge `origin/main` into the branch.
   - Resolve `README.md` and `Suggested.lean` to this head's text. It supersedes main's: main's Brown statement (`brownBicollaring`, `IsLocallyFlat`, `AnnulusConjecture` in main's README) is now consumed from GeometricTopology §2.2, and main's own headline names (`exists_cwComplex_homotopyEquiv`, `tendsto_of_isMIntegralCurveOn_neg_mgradient`, `exists_edist_le_exp_of_tendsto_neg_mgradient`) are replaced by this head's.
   - Take main's `PROGRESS.md` and `STATUS.md`.
2. With Tau Ceti 2fd255d available, use the native names in `Suggested.lean`:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write `TauCeti.criticalPoints I f`, `TauCeti.totalCriticalCount I f = 2` and `-TauCeti.Manifold.mgradient I f x`;
   - delete the docstring sentence at `:18–20` about the inlined critical set.
3. Re-elaborate the file and re-run the gate at the new pins.
4. Replace the pull-request title and description with ones that describe the roadmap as it stands.

**Tested on the refuting instance.**
- The 94 absent names were each grepped at Tau Ceti 2fd255d and Mathlib 1b1ccf4 and found as declarations. The ones the routes above use were opened; see Verified sound.
- None of the six sorried headlines is proved at 2fd255d. `Morse/` there has no global CW model, no polynomial identity for a Morse function, no theorem on two critical points of arbitrary degeneracy and no forward-curve convergence theorem. So after the merge the file still states exactly the headlines that the pin does not prove.

## Previous findings

- **R01 (re-raising H01): not repaired.** The head is the same commit, and `lake-manifest.json` is unchanged. `Suggested.lean:22` still reads "proved at the pinned Tau Ceti and are consumed, not restated". This is R01 above. Recount: 94 absent names, previously reported as 96; this count excludes `Manifold.riemannianEDist`, an `irreducible_def` at Mathlib 6b7abb3. The 18 docstring names are absent as before.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.**
  - Re-run on this head: every check 0, `OK`. The worker's `gate.md` also records `build=0`.
  - The worktree is clean afterwards. No file outside the folder is changed.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Suppliers.** Every roadmap the README cites is on main: DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds, DGFloer, HeegaardFloer, RiemannianGeometry, SymplecticGeometry/ConvexityToric and AffineMorseLefschetz. None is on the forbidden list.
- **Elaboration.** `lake env lean` on `Suggested.lean` at this head's pins prints six `declaration uses sorry` warnings and nothing else.
- **Signatures.** `#check @` of all 7 declarations, elaborated in one scratch file:
  - Every manifold statement keeps `FiniteDimensional`, `Boundaryless`, `T2Space`, `IsManifold I ∞` and `SecondCountableTopology`.
  - `strong_morse_inequalities` takes `k : Type u_3`, the universe of M, as the Conventions say.
  - `nonempty_homeomorph_sphere_of_two_euclidean_opens` carries only `T2Space X`, `CompactSpace X` and `0 < m`, as `README.md:1256–1258` states.
  - `bettiNumber` carries no included section binder.
  - With `pp.universes`, `exists_morseCWModel` has a free universe `u_4` for X. This is true in every universe: the critical set of a proper Morse function on a second-countable manifold is countable, so the CW model has at most continuum many points.
  - Nothing changed.
- **Padding.** The probe `first | rfl | (simp; done) | infer_instance | trivial | exact ⟨_, rfl⟩ | exact fun _ => ⟨_, rfl⟩ | (aesop; done)`, on a scratch copy, leaves all 6 theorems using `sorry`.
- **Headlines.** Six are stated: the CW model, the polynomial strong inequalities, the two-critical-point sphere theorem with its two inputs, and compact-trapped convergence. The docstring names as not stated the handle homeomorphism and chart comparison (§2.2–§2.3) and Layer 5, with the missing carriers.

### Library declarations opened

- **Tau Ceti a91d3aaf (this head's pin).**
  - `TauCeti.IsMorse` (`Morse/Basic.lean:178`); smoothness is part of it by `isMorse_iff` (`:186–193`).
  - `manifoldMorseIndex` (`Morse/Index.lean:74`).
  - The complementary-index theorems (`Morse/Index.lean:140`, `:154`), which need a nondegenerate Hessian, as `README.md:151–153` says.
  - `Riemannian.Tensor.rieszDual` and `inner_rieszDual` (`VectorBundle/Riemannian/Riesz.lean:74`, `:82`).
  - `TauCeti.IsBicollar` and `IsBicollared` (`LocallyFlat/Bicollar.lean:101`, `:108`): an open embedding of N×ℝ with zero slice f.
  - `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`Singular/JordanBrouwer.lean:212`).
  - `TauCeti.brownBicollaring` (`LocallyFlat/Brown.lean:39`) proves locally flat ⇒ bicollared, not the generalized Schoenflies theorem. Neither pin has the Schoenflies theorem above dimension 2: 2fd255d has only `Analysis/Complex/Conformal/Jordan/Schoenflies.lean`. GeometricTopology §2.2 is therefore the right supplier.
- **Mathlib 6b7abb3 (this head's pin).**
  - `mvfderiv` (`Geometry/Manifold/MFDeriv/NormedSpace.lean:448`) is `mfderiv` composed with the tangent identification.
  - `IsMIntegralCurveOn` (`IntegralCurve/Basic.lean:65`) uses `HasMFDerivAt[s]`, a derivative within s. This matches the README's one-sided endpoint argument (`:1430–1433`).
  - `Manifold.riemannianEDist` (`Riemannian/PathELength.lean:207`).
- **Tau Ceti 2fd255d (main's pin).**
  - `TauCeti.Manifold.mgradient` (`Riemannian/Gradient/Basic.lean:73`) has body `rieszDual x (mvfderiv I f x)`, the headline's field.
  - `criticalPoints`, `totalCriticalCount` and `criticalCount` (`Morse/CriticalPoints.lean:87`, `:342`, `:348`) are the zero set of `mvfderiv` and `encard` counts.
  - `exists_tendsto_maximalIntegralCurve_neg_mgradient` (`Morse/GradientFlow.lean:261`): C² f, compact K with finitely many critical points.
  - `exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient` (`Morse/ExponentialConvergence.lean:303`).
  - Reeb's theorem (`Morse/Reeb.lean:148`, no connectedness hypothesis).
  - `lsCategoryCount_univ_le_totalCriticalCount` (`Morse/LusternikSchnirelmann.lean:185`, smooth f, compact M).
  - All match their README descriptions.

### Cross-roadmap citations, resolved on main 3090489

- **DifferentialGeometry:** Layers 3, 5, 10, 12 (`:371`, `:503`, `:877`, `:910`), with items 5.1, 10.2, 12.2 and 12.3 inside them.
- **AlgebraicTopology:**
  - Stage 4 (`:499`), with item 4 holding the disc pairs over boundary spheres and their coproducts (`:624–634`).
  - Item 5 holds `relativeCWPushout` (`:644`), the gluing comparison (`:658`), `cofibrationTowerHomotopyEquivalence` (`:683`) and `cwSubcomplexTowerUnion` (`:700`). Item 6 is RP^n (`:789`).
  - Stage 6.1's UCT (`:1041`); `lsCupLength` with its bound (`:1117–1123`).
- **GeometricTopology:** Layer 1 (`:783`); §2.2 (`:1357–1365`), for n≥1 and a bicollared sphere, closure ≃ Dⁿ restricting to the parametrization; consumer entry (`:8002`).
- **CharacteristicClasses:** C2 (`:728`).
- **ComplexKahlerGeometry:** K1 (`:96`), K7.1 (`:1407`), K7.2 (`:1444`).
- **ComplexManifolds:** Milestone 1 (`:172`); the README's anchor matches the heading.
- **DGFloer:** Layer 1 item 3 (`:621`).
- **Consumers:** HeegaardFloer Lane M (`:70`), RiemannianGeometry R3 (`:369`), ConvexityToric T2 (`:73`).

### Overlaps and ownership

- **Dropped anchors.** `scratch/overlaps.md` lists `#m2-compact-band-deformation-handles-and-cells` and `#m5-morsebott-normal-bundles-and-attachments`, cited at HeegaardFloer main lines 647 and 1064. `README.md:476–482` maps each old id to its new heading, so this is not a finding.
- **Other pull requests.** None changes this roadmap.
- **Second owners.** `roadmaps grep` was run over every open head and main for "exactly two critical points", "strong Morse inequalit", "one cell (of dimension|per critical)", "union of two open (sets|cells)", "two-open-cell", "compact-trapped" and the headline names. It found:
  - only an example in DGFloer, and AffineMorseLefschetz as a consumer;
  - AlgebraicTopology's revision (#1808), whose `Suggested.lean:242–253` states finite CW type of compact manifolds by the triangulation route. That is a different, weaker statement with no cell–critical-point correspondence, so it is not a second owner.
- **Closest roadmaps.** MorseNovikov (#1161) consumes MorseTheory M1–M6 by label (`:66`, `:183`). The DifferentialGeometry revision (#886) leaves the gradient to Tau Ceti (`:3099`).
- **Not read.** ManifoldOptimization (#1506) is listed as closest in vocabulary, but the brief gives no files for it; it was covered only by the greps above.
- **Name clashes.** No other `Suggested.lean` declares a name in `TauCetiRoadmap.MorseTheory`.
- **Betti numbers.** Neither pin defines a singular Betti number: Tau Ceti 2fd255d has only a dual-graph `firstBetti`. `bettiNumber` is therefore needed.

### Seeded sample (15 targets)

- **Cohen–Iga–Norbury** (printed page = PDF page − 13):
  - Theorem 4.6, pp. 27–29 (cohen-iga-norbury lines 1022, 1036–1098): closed M. Used in §6.1.
  - Theorem 5.3, pp. 36–37 (line 1322), with the README's normal form. Corollary 5.4, p. 38 (line 1423). Both used in §1.3.
  - Theorem 5.7, p. 40 (line 1519): closed M, one λ-cell per index-λ point. Used in §2.4.
  - Corollary 5.11 and its proof, p. 42 (lines 1569–1596): `c_k=d_(k+1)+b_k+d_k`. Used in §4.1.
  - Application 5.13, p. 43 (line 1617). Used in §4.3.
  - Theorems 15.1, 15.4, 15.6–15.7, pp. 143, 146, 147–148 (lines 4986, 5091, 5142, 5161). Used in §5.1.
  - The References entry Theorem 5.1, p. 33 (line 1202), was also checked.
- **Nicolaescu:** Theorem 2.2.3, p. 38 (nicolaescu-invitation line 1950: one critical point, λ-handle). Remark 2.2.5, p. 42 (line 2177: several points on one level). f is exhaustive throughout (line 1860). Used in §2.2.
- **Weber:** Theorem 1.1, p. 2 (weber-conley line 65: C², closed M). His category is the least ℓ≥1 (line 62). Used in §4.2.
- **Milnor 1959:** Theorem 1(3), p. 440 (milnor-1959 lines 53, 72–76). Corollary 1, p. 442 (lines 109, 117–118). Used in §4.4.
- **Brown 1960:** Theorem 5, p. 76 (brown-1960 lines 83, 101–103), used in §4.4 through GeometricTopology §2.2. The boundary-parametrization clause is GeometricTopology's statement; it follows from Theorem 5 by coning a homeomorphism of the boundary sphere.
- **§1.1 and §1.2** carry no source locator. They consume pinned objects (R01).
- **§2.1, §2.3, §3.1, §3.2 and the Milnor 1963 locators of §2.2 and §2.4:** see Not verifiable.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line model | df=(1,0)↦(1,0); range [0,∞)≠ℝ | Checks hold; `ModelTransport/` absent at a91d3aaf, present at 2fd255d | R01 |
| 2 | §1.2 Hessian, counts | −x²+y²; constant on S¹; point; ∅; f=0, x² on ℝ | diag(−2,2), λ=1, count 1; count ⊤; count 1; count 0; λ sums 0≠1 and 1=1 | consistent | none |
| 3 | §1.3 Morse lemma locator | cohen-iga-norbury 1322–1332 | source `f(p)−Σ_(i≤λ)x_i²+Σ_(j>λ)x_j²` = README `f(x)−Σ_(i<λ)y_i²+Σ_(i≥λ)y_i²` (0-indexed) | verified | none |
| 4 | §1.3 seminorm comparison | τ(y)=y/2, K=[−2,2], g=x²; reverse y=2x | g∘τ=y²/4 sups (1,1,1/2) vs g sups (1,2,2): C=1; reverse scales 2^m, C=2^k | true | none |
| 5 | §1.3 continuation scope | x³−tx | f′=3x²−t: none (t<0), one degenerate (t=0), ±√(t/3) (t>0) | consistent | none |
| 6 | §2.1 co-orientation | f=x on [a,b]; x²+y², a=1 | df(+1)=+1 at b, df(−1)=−1 at a; inward coordinate 1−f=0 on the circle | consistent | none |
| 7 | §2.2 restriction lemma | f=x², 0<a<a′<b′<b | x∈[√a′,√b′] ↦ √a′ ↦ √a, the image under the [a,b] retraction | true | none |
| 8 | §2.2 pseudo-gradient normalization | z=√2x; −u²+v², z=√2(u,v) | adapted x′=−x, df(X)=−2x²; Euclidean −2x not adapted; metric 2dx² gives −x; (−z₁,−z₂): df=z₁²−z₂²>0 on z₂=0 | consistent | none |
| 9 | §2.2 normalized field | f=x², band [1,4] | X=−1/(2x)=−2x/(2x)²; from 2 to 1 at t=3=f(2)−1 | true | none |
| 10 | §2.2 handle locator | nicolaescu 1950, 2177, 1860 | one point: λ-handle; k points: k handles; f exhaustive | supports the local statement | none |
| 11 | §2.3 double well | (x²−1)², c=1, ε=1/2 | 1−x²(2−x²)=(x²−1)²; x²=1−1/√2, α±(1)=±0.5412; f(α±(1))=1/2; two components of {f≤1/2} | consistent | none |
| 12 | §2.3 RP² top cell | f=(y²+2z²)/(x²+y²+z²), chart z=1 | 2−f=(2a²+b²)/(1+a²+b²); coordinates (√2a,b)/√(1+a²+b²); boundary degree ±2 | consistent | none |
| 13 | §2.3 transition derivative | `PartialDiffeomorph.norm_sq_sub_fderiv_transition`, `…isInvertible_fst_fderiv_transition_inl` | absent at a91d3aaf; 2fd255d `Morse/ChartTransition.lean` | contract false at pin | R01 |
| 14 | `exists_morseCWModel` | S² height; x² on ℝ; ∅; ℕ with f(n)=n; X in universe 0 | cells (1,0,1); one 0-cell; empty complex; ℵ₀ 0-cells; ≤𝔠 points; proper+BddBelow ⇔ every M_a compact | true | none (route inputs: R01) |
| 15 | §2.4 locator | cohen-iga-norbury 1519 | closed M, one λ-cell per index-λ point, p. 40 | verified | none |
| 16 | §3.1 restriction laws | δψ on (0,1); tolerance e^(−x²); clopen ℝ in ℝ⊔ℝ | δψ(x)=δ>x for 0<x<δ; constant c fails for x²>ln(1/\|c\|); locally finite families stay locally finite | consistent | none |
| 17 | `strong_morse_inequalities` | S²; RP² over ℚ, 𝔽₂; T²; 3 points (m=0); ∅ | 1+t²=1+t²; 1+t+t²=1+(1+t)t; 𝔽₂: Q=0; 1+2t+t², Q=0; 3=3; 0=0 | true | none |
| 18 | §4.1 partial sums | c=(2,0,0,2), b=(1,0,0,1); general q_n | weak and Euler hold, S₁: −2≥−1 fails; c_j−b_j=q_j+q_(j−1), q_m=0 | Check excludes the weak-only model | none |
| 19 | §4.1 locator | cohen-iga-norbury 1569–1596 | Σ(−1)^(i−k)c_k = d_(i+1)+Σ(−1)^(i−k)b_k with d_k≥0 | supports Q∈ℕ[t] | source issue |
| 20 | `bettiNumber` | ∅; point; RP², j=1; ℕ discrete | 0; (1,0,…); 0 over ℚ, 1 over 𝔽₂; finrank of ⊕_ℕ k is 0 | matches API | none |
| 21 | §4.1 integral consequences | RP², d=2 | H₂=ker∂₂=0 free; H³=Ext(H₂)=0; H²=Ext(ℤ/2,ℤ)=ℤ/2 | matches "do not infer torsion-free" | none |
| 22 | §4.2 corollaries | T²; RP²; S¹⊔S¹; ∅; point | 4≥3≥2+1; 3≥3 (𝔽₂), 3≥1 (ℚ); 2+2=4, normalized 1+1≠3; 0+1≤0 fails; 1≥1≥1 | consistent | none |
| 23 | `…sphere_of_two_criticalPoints` | m=0; h−h³/3; h²; k components | 2 points=S⁰; df=(1−h²)dh, f=2/3−r⁴/4+…; count 4 (m=1), ⊤ (m≥2); ≥2k forces k=1 | true | none |
| 24 | `exists_twoEuclideanOpenCover…` | h on S¹, ε=δ=1/2; a+ε>b−δ; m=0 | η²=3/4, T>2/(3/4)=8/3; T=0; two points | true | none |
| 25 | `…sphere_of_two_euclidean_opens` | point, m=0; ℝ^m; S¹⊔S¹; RP² | 1≠2 points (needs 0<m); not compact; a compact circle is not ≃ℝ; a cover by two open cells gives category ≤2, RP² has 3 | true | none |
| 26 | §4.4 Milnor 1959 locators | milnor-1959 53, 72–76, 109, 117–118 | Theorem 1(3), p. 440: two opens ≅ℝⁿ; Corollary 1, p. 442: homeomorphic to Sⁿ | verified | none |
| 27 | GeometricTopology §2.2 as used | brown-1960 101–103; GT `:1357–1365`; b(θ,s)=(r+ηs/(1+\|s\|))θ | each closure an n-cell; radius in (r−η,r+η); C=(X∖D)∪Σ | contract suffices | none |
| 28 | §5.1 Morse–Bott | y² vs y⁴; RP² filtration; cohen-iga-norbury 4995–4999, 5143 | kernel span(e₁) vs ℝ²; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0); source labels relative groups E² | consistent | source issue |
| 29 | `exists_compactTrapped_gradient_limit` | x² with dx², 4dx²; endpoint curve; equilibrium; K=∅ | x₀e^(−2t); grad x/2, distance 2\|x₀\|e^(−t/2); right derivative −2x₀, left 0; distance 0≤Ce^(−ct); 0∈Ici 0 forces γ0∈∅, so vacuous | true | none |
| 30 | §6.1 constants | Γ(s)=γ(t₁+s) | Ce^(−μ(t−t₁))=Ce^(μt₁)e^(−μt), T=t₁+T₀ | true | none |
| 31 | §6.1 locator | cohen-iga-norbury 1022, 1084–1098 | closed M, pp. 27–29 | verified | source issue |
| 32 | Supplier contract at the pin | manifest; name index; merge-tree | a91d3aaf vs 2fd255d; 94/165 names and 18/18 docstring names absent; 2 conflicts | open | R01 |

## Not verifiable

- **lee-smooth-manifolds** (Corollary 5.14, Proposition 5.38; §2.1), **milnor-1963** (Theorem 3.1, p. 12; Theorem 3.5, p. 20; Lemma 3.6, pp. 20–21; Corollary 6.7, p. 36; §2.2–§2.4, §3.2) and **hirsch-differential-topology** (Chapter 2, §1; Chapter 6, Theorem 1.2; §3.1). The manifest settles these as uncertified; they are cited by locator only and were not read.
- **Elaboration at main's pins.** Lean was run only in this worktree, at the head's pins. The 2fd255d declarations were read as source.
- **ManifoldOptimization (#1506).** The brief gives no files for it, so ownership against it was checked only by `roadmaps grep`.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the strong inequality sums over k but writes the summands as `c_i(f)` and `b_i(M)`; it should be `c_k(f)` and `b_k(M)`; affects nothing.
- **Error** in cohen-iga-norbury at Theorem 15.1, p. 143: the source says f∘φ is the quadratic normal form on all of `U × ℝ^λ × ℝ^(m−n−λ)`, impossible for bounded f with positive normal rank; it should hold on a neighbourhood of `U × {0}`; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorems 15.6–15.7, p. 147: the source says the page built from the relative homology of the filtration quotients is E²; it should be E¹, with E² its homology; affects nothing.
- **Gap** in cohen-iga-norbury at Theorem 4.6, p. 28: the source says a bounded integral of the negative function d/dt f(γ(t)) forces that function to tend to 0; it should add uniform continuity of ‖∇f(γ(t))‖², true on compact M since γ′ is bounded (Barbalat); affects the proof.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)` while calling it the stable manifold; it should be `W^s(0)`; affects nothing.
