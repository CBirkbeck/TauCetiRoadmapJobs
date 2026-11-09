# Review of MorseTheory (pull request #1682 at bcad0bc)

**Verdict:** needs changes

Full review. The folder's text now has one remaining defect, and it is not in the text: the branch is still not merged with main. R02, R03, R04 and step 3 of R01 of the previous review are repaired; the repairs are correct at main's pin and widen the gap at this head's pin.

## R01 (P1) — The branch is not merged with main: the Tau Ceti library that the README and `Suggested.lean` consume does not exist at this head's pin

Re-raised: H01

**Location.** `TauCetiRoadmap/MorseTheory/Suggested.lean:22`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated". `TauCetiRoadmap/MorseTheory/README.md:38–40`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6".

**Claim.** The README hands most of Layers 1–4 and 6 to Tau Ceti declarations, and the routes of §2.1, §2.3, §3.1, §4.4 and §6.1 rest on them. At the pin this head builds against, almost none of them exist, so those targets have no owner at the pin and the docstring sentence is false there.

**Witness.** `lake-manifest.json` pins Tau Ceti a91d3aaf (Lean v4.35.0-rc3); main (3090489) pins 2fd255d (v4.36.0-rc2). `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf, 35 at 2fd255d. 96 of the README's 165 backticked identifiers are declared at 2fd255d only.

**Detail.**
- **Docstring names.** None of the 17 consumed declarations named at `Suggested.lean:23–45`, nor `criticalPoints` (`:20`), occurs anywhere in the a91d3aaf tree. At 2fd255d they are at, among others, `Morse/CriticalPoints.lean:87`, `:274`; `Morse/Reeb.lean:148`; `Morse/LusternikSchnirelmann.lean:185`; `Morse/RelCWComplex.lean:298`; `Morse/Inequalities.lean:403`, `:414`, `:429`; `Morse/GradientFlow.lean:261`; `Morse/ExponentialConvergence.lean:303`.
- **Names added by this repair, all absent at a91d3aaf:**
  - `ChartedSpace.exists_diffeomorph_apply_eq_self` (2fd255d `Immersion/Diffeomorph.lean:79`);
  - `TauCeti.RegularFiber.exists_diffeomorph_apply_eq_self` and `TauCeti.exists_diffeomorph_regularFiber_regularLevel_apply_eq_self` (`RegularValue/Atlas.lean:53`, `:72`);
  - `PartialDiffeomorph.norm_sq_sub_fderiv_transition` and `PartialDiffeomorph.isInvertible_fst_fderiv_transition_inl` (`Morse/ChartTransition.lean:74`, `:83`);
  - `ContMDiffMap.manifoldStrongWhitneyTopology_le_manifoldWeakWhitneyTopology` (`ContMDiffMap/Chart/Strong.lean:303`).
- **§4.4's last step.** `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall` (`Analysis/InnerProductSpace/Hemisphere.lean:377`) and `TauCeti.Manifold.mgradient` (`Riemannian/Gradient/Basic.lean:73`) are absent at a91d3aaf.
- **Merge state.** The merge base is ffcc9d31. `git merge-tree --write-tree origin/main HEAD` reports a content conflict in `README.md` and in `Suggested.lean`. Main changed this folder in 53021f19 and 76ab5b3f.
- **Why the gate passes.** The three modules that `Suggested.lean` imports exist at a91d3aaf, and its statements spell the critical set and the gradient out by their bodies.
- **Pull-request text.** The title and description still announce Palais–Smale targets and a file `PalaisSmaleTargets.lean`. The folder has no such file, and `README.md:76–81` puts Palais–Smale theory outside the roadmap.

**Why H01's reason does not settle it.** "Only a merge of `origin/main` repairs this" says who must act; it does not make the contract true at the pin where the gate and the build check it. Each repair round since has moved more targets onto declarations that exist only at 2fd255d, so the head cannot be accepted as it stands, and it cannot merge either, because of the two conflicts. This is now the only finding. It needs the author or a human with push access, not another repair of the folder.

**Exact repair.**
1. Merge `origin/main` into the branch. Resolve `README.md` and `Suggested.lean` to this head's text, and take main's `PROGRESS.md` and `STATUS.md`. Main's own README still owns Brown's theorem (main `README.md:73`, `:668`); keep this head's deferral to GeometricTopology §2.2.
2. With Tau Ceti 2fd255d available, use the native names in `Suggested.lean`:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write `TauCeti.criticalPoints I f`, `TauCeti.totalCriticalCount I f = 2` and `-TauCeti.Manifold.mgradient I f x`;
   - delete the docstring sentence at `:18–20` about the inlined critical set.
3. Re-elaborate and re-run the gate at the new pins.
4. Replace the pull-request title and description with ones that describe the roadmap as it stands.

**Tested on the refuting instance.** Every one of the 165 backticked identifiers other than this roadmap's own 7 and AlgebraicTopology's `lsCupLength` is declared at 2fd255d (Tau Ceti) or at Mathlib 1b1ccf4. None of the six sorried headlines is proved there: `Morse/` at 2fd255d has no global CW model, no polynomial identity for a Morse function, no degenerate two-critical-point theorem and no forward-curve convergence theorem.

## Previous findings

- **R01 (re-raising H01): not repaired** as a whole. `lake-manifest.json` is unchanged. This is R01 above.
  - **Step 3 (atlas independence): repaired.** `README.md:642–648`: "any two atlases on a level for which the inclusion into M is an immersion … are diffeomorphic by the identity, by the pinned `ChartedSpace.exists_diffeomorph_apply_eq_self`". The owned-target list (`:61–74`) no longer lists it. The statement matches 2fd255d `Immersion/Diffeomorph.lean:79` (two atlases, one map an immersion for both, identity diffeomorphism).
- **R02 (Brown has two owners): repaired.**
  - `README.md:30–32`: "Its topological input, Brown's generalized Schoenflies theorem for a bicollared sphere, is GeometricTopology §2.2's and is consumed from there."
  - The owned target and its Checks are gone; `exists_closedBall_homeomorph_closure_of_bicollar` and the `Bicollar` import are deleted from `Suggested.lean`.
  - GeometricTopology §2.2 is in the supplier contract (`:446–452`), in the lemma's *Needs:* (`:1283`) and in the Layer 4 Dependencies (`:1308`).
  - It matches main `GeometricTopology/README.md:1357–1363` (n ≥ 1, bicollared, closure ≃ `Dⁿ` restricting to the parametrization) and `:8002–8003`.
- **R03 (undefined "compact-core"): repaired.** `README.md:939`: "Restriction from the strong topology of M to any open submanifold U is continuous into the weak topology of U (Hirsch, Chapter 2, §1 …)". The weak topology is the declared `ContMDiffMap.manifoldWeakWhitneyTopology` (2fd255d `ContMDiffMap/Chart/Topology.lean:72`).
- **R04 (partitions of unity): repaired.** `README.md:410–411` no longer attributes them to DifferentialGeometry; `:123–127` and `:986` cite Mathlib `SmoothPartitionOfUnity.exists_isSubordinate` (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:556`, with `[T2Space M] [SigmaCompactSpace M]`, closed s).

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** Re-run on this head: every check 0, `OK`; the worker's `scratch/gate.md` also has `build=0`. The worktree is clean afterwards. No file outside the folder is changed.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean` prints six `declaration uses sorry` warnings and nothing else.
- **Signatures.** `#check @` on all 7 declarations in one scratch file, compared with the README:
  - every manifold statement keeps `FiniteDimensional`, `Boundaryless`, `T2Space`, `IsManifold I ∞` and `SecondCountableTopology`;
  - `strong_morse_inequalities` takes k in M's universe, as the Conventions say;
  - `nonempty_homeomorph_sphere_of_two_euclidean_opens` carries only `T2Space X`, `CompactSpace X` and `0 < m`, as `README.md:1256–1258` states.
  Nothing changed.
- **Padding.** The probe `first | rfl | (simp; done) | infer_instance | exact ⟨_, rfl⟩ | exact fun _ => ⟨_, rfl⟩` fails on all 6 theorems.
- **Headlines.** Six stated (CW model, polynomial strong inequalities, the two-critical-point sphere theorem with its two inputs, compact-trapped convergence). The docstring names the handle homeomorphism and chart comparison (§2.2–§2.3) and Layer 5 as not stated, with the missing carriers.

### Library declarations opened

- **At a91d3aaf (this head's pin):** `TauCeti.IsMorse` (`Morse/Basic.lean:178`), `manifoldMorseIndex` (`Morse/Index.lean:74`), `Riemannian.Tensor.rieszDual` (`VectorBundle/Riemannian/Riesz.lean:74`), `TauCeti.IsBicollar`/`IsBicollared` (`LocallyFlat/Bicollar.lean:101`, `:108`), `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`Singular/JordanBrouwer.lean:212`).
- **At 2fd255d (main's pin):** the 11 declarations listed in R01 and under Previous findings, plus `IsMorse.exists_regular_sublevel_exhaustion` (`Morse/Exhaustion.lean:110`), `IsMorse.finite_singularHomology` (`Morse/Inequalities.lean:393`), `sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex` (`Cellular/EulerCharacteristic/MorseInequalities.lean:148`) and `IsMorse.criticalCount_neg` (`Morse/CriticalPoints.lean:426`).
- **Chart-transition hypotheses** (`Morse/ChartTransition.lean:40–44`): two `PartialDiffeomorph`s into `E × F`, C^n with 1 ≤ n, both centred at x, `f = f x − ‖·.1‖² + ‖·.2‖²` on each source; `[FiniteDimensional ℝ E]` only for the invertible block. This is `README.md:261–268`.

### Cross-roadmap citations, resolved on main 3090489

- **GeometricTopology:** Layer 1 (`:783`), §2.2 (`:1357`), consumer entry (`:8002`); its `:161–164` leaves boundaryless Morse theory to MorseTheory.
- **DifferentialGeometry:** Layers 3, 5, 10, 12 (`:371`, `:503`, `:877`, `:910`).
- **AlgebraicTopology:** Stage 4 (`:499`), Stage 6 (`:946`), `lsCupLength` with its bound (`:1117–1123`).
- **ComplexKahlerGeometry:** K1 (`:96`), K7.1 (`:1407`), K7.2 (`:1444`). **ComplexManifolds:** Milestone 1 (`:172`).
- **DGFloer:** Layer 1 item 3 (`:621`). **AffineMorseLefschetz:** consumes M1–M4 (`:130`).
- **Forbidden suppliers:** none is named.

### Overlaps and ownership

- **Dropped anchors.** `scratch/overlaps.md` lists `#m2-…` and `#m5-…`, cited at HeegaardFloer main lines 647 and 1064. `README.md:476–482` maps every old id to its new heading, so this is not a finding.
- **Other pull requests.** None changes this roadmap.
- **Second owners.** `roadmaps grep` over every open head and main for "two critical points", "strong Morse inequalit", "covered by two open", "one cell per critical point" and the two headline names: only examples in MorseNovikov, DGFloer, ImplicitAtlases and AlgebraicTopology, and AffineMorseLefschetz as a consumer. No other owner of any target.
- **Names dropped from main's `Suggested.lean`** (30 declarations there, 7 here): none is cited by another roadmap. `mgradient` in DifferentialGeometry and RiemannianGeometry/Surfaces is DifferentialGeometry's and Tau Ceti's.

### Seeded sample (15 targets)

- **Cohen–Iga–Norbury** (printed page = PDF page − 13, lines 994, 1310):
  - Theorem 4.6, p. 27 (line 1022): closed M. §6.1.
  - Theorem 5.3, p. 36 (line 1322); Corollary 5.4, p. 38 (line 1423). §1.3.
  - Theorem 5.7, p. 40 (line 1519): closed M, one λ-cell per index-λ critical point. §2.4.
  - Corollary 5.11 and proof, p. 42 (lines 1569–1596): `c_k = d_(k+1) + b_k + d_k`. §4.1.
  - Application 5.13, p. 43 (line 1617). §4.3.
  - Theorems 15.1, 15.4, 15.6–15.7, pp. 143, 146, 147–148 (lines 4986, 5091, 5142, 5161). §5.1.
- **Nicolaescu:** Theorem 2.2.3, p. 38 (nicolaescu-invitation line 1950, homeomorphism with a λ-handle); Remark 2.2.5, p. 42 (line 2177, exhaustive f). §2.2.
- **Weber:** Theorem 1.1, p. 2 (weber-conley line 65): C², closed M; category the least ℓ ≥ 1 (line 62). §4.2.
- **Milnor 1959:** Theorem 1(3), p. 440 (milnor-1959 lines 53, 72–76); Corollary 1, p. 442 (lines 109, 117). §4.4.
- **Brown 1960:** Theorem 5, p. 76 (brown-1960 lines 83, 101–103). §4.4, through GeometricTopology §2.2.
- **§1.1 and §1.2** carry no source locator; they consume pinned objects (R01).
- **§2.1, §2.2–§2.4 (Milnor 1963), §3.1, §3.2:** see Not verifiable.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line | df=(1,0) both sides; range [0,∞)≠ℝ | Checks hold; names only at 2fd255d | R01 |
| 2 | §1.2 Hessian, counts | −x²+y²; f=0 and x² on ℝ; point; ∅ | diag(−2,2), λ=1; 0+0=0≠1 vs 0+1=1; count 1; count 0 | consistent | R01 (names) |
| 3 | §1.3 Morse lemma | cohen-iga-norbury 1322, 1423 | source `f(p)−Σ_(i≤λ)x_i²+Σx_j²` = README form | verified | none |
| 4 | §1.3 seminorm comparison | τ(y)=y/2 on [−2,2], g=x² | y²/4: sups 1, 1, 1/2; g: 1, 2, 2; reverse scales 2^k | true | none |
| 5 | §2.1 atlas independence | 2fd255d `Diffeomorph.lean:79`, `Atlas.lean:53`, `:72` | identity diffeomorphism from two immersions; regular-fibre vs level atlas | matches contract | R01 (pin) |
| 6 | §2.1 co-orientation | f=x on [a,b]; x²+y², a=1 | df(+1)=+1 at b, df(−1)=−1 at a; inward coordinate 1−f=0 on the circle | consistent | none |
| 7 | §2.2 restriction, fields | x², band [1,4]; z=√2x; −u²+v² | x²=4−t reaches 1 at t=3=f(2)−1; x′=−x, df(X)=−2x²; (−z₁,−z₂) gives df=z₁²−z₂²>0 on the u-axis; r∘(i∘r′)=r′ | true | none |
| 8 | §2.3 chart change | (x²−1)², c=1, ε=1/2; RP² | 1−x²(2−x²)=(x²−1)²; α±(1)=±√(1−1/√2)=±0.5412; f=2−(2a²+b²)/(1+a²+b²) | consistent | none |
| 9 | §2.3 transition derivative | `ChartTransition.lean:74`, `:83` | ‖(Az).1‖²−‖(Az).2‖²=‖z.1‖²−‖z.2‖²; `fst∘A∘inl` invertible, E finite-dimensional | matches `README.md:779–783` | R01 (pin) |
| 10 | `exists_morseCWModel` | S² height; x on ℝ; ∅; ℕ with f(n)=n; universe 0 | cells (1,0,1); not `BddBelow`; empty complex; countably many 0-cells; cardinality ≤ continuum | true | none |
| 11 | §3.1 restriction laws | e^(−x²) tolerance; δψ on (0,1); U⊂M open | constant c fails for x²>ln(1/\|c\|); δψ(x)=δ>x for 0<x<δ; chart targets open, so derivatives within agree | consistent | none |
| 12 | `strong_morse_inequalities` | S²; RP² over ℚ, 𝔽₂; ∅; r points; (2,0,0,2) vs (1,0,0,1) | 1+t²; t+t²=(1+t)t, 𝔽₂: Q=0; 0=0; r=r; S₁: −2 vs −1 fails | true | none |
| 13 | §4.1 partial sums | q_n=S_n(c)−S_n(b) | c_j−b_j=q_j+q_(j−1); (1+t)Q adds q_m t^(m+1)=0 by Euler | true | none |
| 14 | `bettiNumber` | RP², j=1; ℕ discrete | 0 over ℚ, 1 over 𝔽₂; ⊕_ℕ k gives finrank 0 | matches API | none |
| 15 | §4.2 corollaries | T²; RP²; S¹⊔S¹; ∅ | 4≥3≥2+1; 3≥3 (𝔽₂), 3≥1 (ℚ); 2+2=4, normalized 1+1≠3; 0+1≤0 fails | consistent | none |
| 16 | `…sphere_of_two_criticalPoints` | m=0; h−h³/3; h²; k components | 2 points = S⁰; df=(1−h²)dh, poles only; count 4 (m=1) or ⊤; ≥2k forces k=1 | true | none |
| 17 | `exists_twoEuclideanOpenCover…` | h on S¹, ε=δ=1/2; a+ε>b−δ; m=0 | η²=3/4, T>2/(3/4)=8/3; f drop >b−a gives f<a−δ, impossible, so the band is left; T=0; two points | true | none |
| 18 | `…sphere_of_two_euclidean_opens` | m=0 point; ℝ^m; S^m minus poles; m=1 | 1≠2 points, needs `0<m`; not compact; caps; S⁰×ℝ onto two intervals; X∖D=∅ would give U=X compact | true | none |
| 19 | GeometricTopology §2.2 as used | n=m≥1; b(θ,s)=(r+ηs/(1+\|s\|))θ | radius in (r−η,r+η); C=(X∖D)∪Σ is the closure; Σ ↔ ∂D^m | contract suffices | none |
| 20 | §5.1 Morse–Bott | y² vs y⁴; RP² filtration; cohen-iga-norbury 5143 | kernel span(e₁) vs ℝ²; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0); source labels the relative groups E² | consistent; README says E¹ | none |
| 21 | `exists_compactTrapped_gradient_limit` | x² with dx², 4dx²; endpoint curve; x; e^(−x) | x₀e^(−2t); grad=x/2, distance 2\|x₀\|e^(−t/2); right derivative −2x₀, left 0; not trapped | true | none |
| 22 | §6.1 constants | Γ(s)=γ(t₁+s) | bound C e^(−μ(t−t₁))=C e^(μt₁) e^(−μt), T=t₁+T₀ | true | none |
| 23 | Supplier contract at the pin | manifest; merge-tree; name index | a91d3aaf vs 2fd255d; 2 conflicts; 96/165 names and 18/18 docstring names missing | open | R01 |

## Not verifiable

- **lee-smooth-manifolds** (Corollary 5.14, Proposition 5.38; §2.1), **milnor-1963** (Theorem 3.1 p. 12, Theorem 3.5 p. 20, Lemma 3.6 pp. 20–21, Corollary 6.7 p. 36; §2.2–§2.4, §3.2) and **hirsch-differential-topology** (Chapter 2 §1, Chapter 6 Theorem 1.2; §3.1): settled as uncertified, cited by locator only, not read.
- **Elaboration at main's pins.** Lean was run only in this worktree, at the head's pins. The 2fd255d declarations were read as source.
- **ManifoldOptimization (#1506).** `scratch/overlaps.md` lists it as closest in vocabulary; the brief gives no files for it. It was covered only by the `roadmaps grep` searches above.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the strong inequality sums over k but writes the summands as `c_i(f)` and `b_i(M)`; it should be `c_k(f)` and `b_k(M)`; affects nothing.
- **Error** in cohen-iga-norbury at Theorem 15.1, p. 143: the source says f∘φ is the quadratic normal form on all of `U × ℝ^λ × ℝ^(m−n−λ)`, impossible for bounded f with positive normal rank; it should hold on a neighbourhood of `U × {0}`; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorems 15.6–15.7, p. 147: the source says the page built from the relative homology of the filtration quotients is E²; it should be E¹, with E² its homology; affects nothing.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)` while calling it the stable manifold; it should be `W^s(0)`; affects nothing.
