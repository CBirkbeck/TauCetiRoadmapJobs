# Review of MorseTheory (pull request #1682 at e20127d)

**Verdict:** needs changes

This is a full review of the same head that PRREVIEW-MorseTheory~17 read: the folder has 0 changed lines since e20127d. There are two findings.

- R01 (P1) blocks. It is the previous review's R01, and it re-raises the repair report's H01. The branch still pins Tau Ceti a91d3aaf, so the Tau Ceti library that `Suggested.lean` and the README say they consume does not exist at the pin the build uses. The repair is a merge of `origin/main`, a worker or human step.
- R02 (P3) is a new locator slip in one docstring.

Everything else I checked holds:
- the mathematics of all 8 declarations and of the sampled Checks, recomputed below;
- the certified locators of the seeded sample;
- the supplier sections on main;
- the gate and the dependency check.

## R01 (P1) — Branch not merged with main: the Tau Ceti library that `Suggested.lean` and the README consume is missing at this head's pin

Re-raised: H01

**Location:**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:22–45`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated: compact finiteness of critical sets (`TauCeti.IsMorse.finite_criticalPoints_inter`), …".
- The same claim runs through `README.md:38–72` (scope), the Tau Ceti contract (`README.md:136–400`) and every "pinned" sentence in Layers 1–4 and 6.

**Claim.** The pins have not moved:
- this head's `lake-manifest.json` pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3;
- main (e8412cd; the content checkout is at 154c04a) pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2. Main moved to that pin in a891cd19 ("bump the Tau Ceti pin to 2fd255d99").

The merge base is still ffcc9d31. `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in `TauCetiRoadmap/MorseTheory/README.md` and `TauCetiRoadmap/MorseTheory/Suggested.lean`.

So at the pin that the build and the gate use:
- the docstring's "proved at the pinned Tau Ceti" is false for every name it lists;
- the README's contract names declarations that do not exist;
- the targets the README defers to them have no owner;
- §3.2's headline is statable at a91d3aaf but stated nowhere. That headline is a proper Morse function bounded below: `∃ f, IsMorse I f ∧ IsProperMap f ∧ BddBelow (range f)`.

The pull request's title and description also still announce Palais–Smale theory and a file `PalaisSmaleTargets.lean`. `README.md:74–79` puts Palais–Smale theory outside this roadmap, and the folder has no such file.

**Witness (two checks).**

1. `#check` at this head's pins, in a scratch file. These 19 names give "Unknown constant" or "Unknown identifier":
   - the 17 backticked names of the docstring list, for example `TauCeti.IsMorse.finite_criticalPoints_inter` and `ContMDiffMap.manifoldStrongWhitneyTopology`;
   - `TauCeti.criticalPoints`;
   - `TauCeti.Manifold.mgradient`.

2. A declaration-name index of both Tau Ceti trees, plus a grep of the pinned Mathlib:
   - Of the README's 88 distinct `TauCeti.` names, 12 exist at a91d3aaf and all 88 at 2fd255d.
   - The unprefixed names `IsLocalExtr.mem_criticalPoints`, `IsOpen.image_of_continuousOn_of_injOn`, `Homeomorph.coe_apply_mem_frontier_iff`, `Submodule.free_of_isPrincipalIdealRing`, `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval`, `ContMDiffMap.chartCkSeminorm` and `Homeomorph.radialExtension` are absent from the pinned Tau Ceti and Mathlib and present at 2fd255d.
   - `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf and 35 at 2fd255d.

**Why H01's reason does not settle it.** H01 is right that a repair job cannot do the merge, because the merge touches `lake-manifest.json` and `lean-toolchain`. But nobody has done the merge. At the pin used by the build and the gate the contract is still false, and no edit to the two roadmap files can make it true. The gate passes only because the four imported modules (`LocallyFlat/Bicollar`, `Morse/Basic`, `Morse/Index`, `VectorBundle/Riemannian/Riesz`) exist at both pins.

**Exact repair (for the worker or a human, not a repair job):**

1. Merge `origin/main` into the branch and resolve `README.md` and `Suggested.lean` to this head's text. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`:
   - Add the imports `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`. Both exist at 2fd255d.
   - Use the pinned definitions:

     | Where | Write |
     | --- | --- |
     | zero set | `x ∈ TauCeti.criticalPoints I f` (its body at 2fd255d, `Morse/CriticalPoints.lean:87`, is `{x \| mvfderiv I f x = 0}`) |
     | counts | `(TauCeti.criticalCount I f j).toNat` (line 348) |
     | two-point hypothesis | `TauCeti.totalCriticalCount I f = 2` (line 342) |
     | gradient field | `-TauCeti.Manifold.mgradient I f` (`Gradient/Basic.lean:73`, whose body is `rieszDual x (mvfderiv I f x)`) |

   - Delete the sentence at lines 18–20 that explains the zero-set spelling.
3. Re-elaborate the file and re-run the gate at the new pins.
4. Update the pull request's title and description to match the roadmap.

**Tested on the refuting instance.** I read these four definitions at 2fd255d. Each is definitionally the head's spelling: the zero set, the ℕ∞ `encard` counts and the Riesz-dual gradient. So the substitution changes no statement. The docstring's 18 names all exist at 2fd255d with the hypotheses the docstring describes (Verified sound). I cannot run Lean at main's pins from this worktree.

## R02 (P3) — Locator of Milnor 1959, Theorem 1(3), gives the page of Corollary 1

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:171–172`, docstring of `nonempty_homeomorph_sphere_of_two_criticalPoints`: "recognition (compare Milnor 1959, Theorem 1(3) and Corollary 1, p. 442)".

**Claim.** The single page number covers both items. Theorem 1 is stated on p. 440, and only Corollary 1 is on p. 442.

**Witness:**
- milnor-1959 line 53 is the running head "440", and Théorème 1 with condition (3), two open sets diffeomorphic to ℝⁿ, is at lines 72–76 on that page.
- Corollaire 1 is at lines 117–118, after the running head "442" at line 109.
- `README.md:1178` already has both pages right.

**Exact repair:** replace the parenthesis by "compare Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442". This now matches milnor-1959 lines 53/72 and 109/117, the lines that refuted the original. `README.md:1178` and the manifest locator for `milnor-1959` already say this.

## Previous findings

- **R01: not repaired.** The folder has 0 changed lines since e20127d. `lake-manifest.json` still pins Tau Ceti a91d3aaf, the merge base is still ffcc9d31, and `Suggested.lean:22` still reads "are proved at the pinned Tau Ceti and are consumed, not restated". It is R01 above.

## Verified sound

### Gate, dependencies, elaboration, signatures, padding

- **Gate.** I re-ran the gate on this head. Every check is 0 and it prints `OK`, matching `scratch/gate.md`.
- **Dependency check:** `depcheck: 236 roadmaps, 2307 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` takes 27 s and prints only 7 `declaration uses sorry` warnings, at lines 78, 104, 119, 134, 155, 169 and 183.
- **Signatures.** I put `#check @name` for all 8 declarations, with `pp.universes`, in one scratch file importing the built module. Each elaborated type matches `scratch/signatures.md` and its README statement:
  - the five manifold theorems carry finite-dimensional E, `I.Boundaryless`, `T2Space M`, `IsManifold I ∞ M` and `SecondCountableTopology M`;
  - `strong_morse_inequalities`, the cover theorem and the sphere theorem carry `CompactSpace M`;
  - Brown's theorem and the two-open-cell lemma take no manifold binders;
  - `bettiNumber` puts k and X in one universe, and `strong_morse_inequalities` puts k in M's universe;
  - `exists_morseCWModel` quantifies X over a free universe `u_4`. This is harmless: the model has countably many cells, so it exists in every universe.

  Nothing changed after the check.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide | exact ⟨_, rfl⟩ | omega | positivity`. All 7 theorems fail, so nothing is padding.

### Folder and policy

- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
- The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- No forbidden supplier (HomotopySpheres and the others) is named.
- There are no LaTeX delimiters and no pull-request numbers.

### Library declarations opened

**At the head pin (a91d3aaf and Mathlib 6b7abb3c):**
- `TauCeti.IsMorse`: `Morse/Basic.lean:178`. It is `IsMorseOn I f univ`, and that includes `ContMDiff … ∞`.
- `TauCeti.IsBicollared` and `TauCeti.IsBicollar` (`LocallyFlat/Bicollar`).
- `TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two`: `AlgebraicTopology/Singular/JordanBrouwer.lean:218`. It takes a continuous injection with `finrank F = finrank E + 1`.
- Mathlib `mvfderiv`: `MFDeriv/NormedSpace.lean:448`.
- Mathlib `RelCWComplex.cell`: `CWComplex/Classical/Basic.lean:101`. Here `cell n : Type u` is CW data, so the cell bijection is meaningful.
- Mathlib `norm_iteratedFDerivWithin_comp_le`: exists, and §1.3 consumes it.

**At main's pin (2fd255d):**
- `Morse/CriticalPoints.lean:87`, `342` and `348`: the zero set, `encard` and the index-j `encard`.
- `Riemannian/Gradient/Basic.lean:73`.
- `LocallyFlat/Bicollar.lean:101` and `108`: an open embedding with `b (x, 0) = f x`.
- `Morse/Basic.lean:110–114` and `212`.
- `IntegralCurve/Maximal.lean:116`: subset of the maximal interval, by definition.
- `IntegralCurve/Maximal.lean:252`: agreement on `Ioo a b`, under `T2Space`, `IsManifold I 1`, `BoundarylessManifold` and a C¹ field. These are exactly the hypotheses `README.md:329–331` and `1477–1479` state.
- `Analysis/InnerProductSpace/Hemisphere.lean:377`: closed A and B covering X, each ≃ₜ closedBall, and A∩B ↔ the unit sphere under both maps. This matches `README.md:378–385` and the use in the two-open-cell lemma.
- `Morse/Deformation.lean:199`: smooth f, `a ≤ b`, a compact band and no critical point in it; a retraction plus `HomotopyRel` rel `{f ≤ a}`; no compactness of M. This matches `README.md:217–222`.
- `Morse/LusternikSchnirelmann.lean:185`: `CompactSpace M`, a smooth f and `lsCategoryCount M univ ≤ totalCriticalCount I f`, with section binders finite-dimensional E, `T2Space`, boundaryless I and `IsManifold I ∞`. This matches `README.md:1027–1038`.

### Duplication at main's pin, by object

None of the owned headlines exists at 2fd255d:
- no Schoenflies or bicollar-closure theorem;
- no two-open-cell or degenerate two-critical-point sphere theorem (only Reeb, `Morse/Reeb.lean:148`, and the two-disc gluing);
- no global Morse CW model (only the relative stages, `Morse/RelCWComplex.lean:298`);
- no Morse ℕ[t] identity (only the CW identities, `Cellular/EulerCharacteristic/MorseInequalities.lean:95` and `148`);
- no theorem about an arbitrary `IsMIntegralCurveOn` curve on `[0,∞)` in `Morse/GradientFlow.lean` or `ExponentialConvergence.lean`;
- no Betti-number definition in Tau Ceti or the pinned Mathlib.

### Cross-roadmap citations resolved on main (154c04a)

Every supplier is on main: DifferentialGeometry, AlgebraicTopology, GeometricTopology, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds and DGFloer.

| Citation | Where it resolves on main |
| --- | --- |
| DG Layer 3 (flows) | README line 371 |
| DG §5.1 (boundary interface with `boundaryOrientation_spec`) | Layer 5, line 503 ff |
| DG §10.2 (Sard) | Layer 10, line 877 ff |
| DG §12.1–§12.3 (metrics, `mgradient`, Hessian) | line 910 ff |
| AT Stage 4, items 4–6 (disc pairs, towers and RP²) | line 499 ff; AT names MorseTheory M2 as the consumer of its tower union |
| AT Stage 6, item 1 (UCT) | |
| AT `lsCupLength` with `lsCupLength X R+1≤lsCategoryCount X X` | lines 1117–1123 |
| DGFloer Layer 1 `SpectralObject` | lines 624–630 |
| CKG K1 and K7 | lines 96 and 1405 |
| ComplexManifolds Milestone 1 | line 172 |
| CharacteristicClasses C2 (Thom) | |
| GT Layer 1 collars | lines 177 and 206 |

`scratch/citations.md` lists nothing unresolved.

### Overlaps

- `scratch/overlaps.md` lists two ids that this pull request drops, `#m2-…` and `#m5-…`. HeegaardFloer cites them on main (lines 647 and 1064), and `README.md:462–468` maps each old id to its new heading.
- Consumers cite the labels M1–M6, which the headings keep.
- The pull request drops 26 of the 30 Lean names of main's `Suggested.lean`, among them `exists_cwComplex_homotopyEquiv`, `morse_inequalities`, `mgradient` and `minimumCriticalCount`. A `roadmaps grep` for `MorseTheory.<name>` over all 26 finds no citation outside MorseTheory, on main or at any open head.
- No other open pull request changes this roadmap.
- I checked ownership in the closest open roadmaps that the brief gives with files:
  - AlgebraicTopology (#1652) owns a homology-sphere recognition `nonempty_homotopyEquiv_sphere_of_homologySphere`, which is a different object;
  - RiemannianGeometry (#1683) uses planar Schoenflies annuli and consumes MorseTheory M1–M6.

### Seeded sample of sources

Printed page = PDF page − 13 for cohen-iga-norbury; PDF page = printed page for weber-conley; printed page = PDF page − 10 for nicolaescu-invitation.

| Target | Locator | Lines read | Hypotheses and statement | Verdict |
| --- | --- | --- | --- | --- |
| 1.1 | none (pinned transport; Mathlib `Boundaryless`) | — | `range I = univ` from `[I.Boundaryless]` | sound; pinned only at 2fd255d (R01) |
| 1.2 | none (pinned; DG §12.3) | DG line 910 ff | Hessian independent of the metric at critical points | sound; R01 |
| 1.3 | CIN Thm 5.3, pp. 36–37; Cor 5.4, p. 38 | cohen-iga-norbury 1322–1332 (PDF 49), proof to 1415 (PDF 50); 1423–1430 (PDF 51) | Morse lemma at a nondegenerate point of index λ; discreteness of the Morse critical set | sound |
| 2.1 | Lee, Cor 5.14 and Prop 5.38 | — | uncertified | Not verifiable |
| 2.2 | Nicolaescu, Thm 2.2.3, pp. 38–42; Rem 2.2.5, p. 42; Milnor 1963, Thm 3.1, p. 12 | nicolaescu-invitation 1950–1959 (PDF 48–49), 2177–2180 (PDF 52) | a single critical point on the level gives a handle attachment; several points on one level give several handles; f exhaustive, as `README.md:701–704` says | sound (Milnor uncertified) |
| 2.3 | Milnor 1963, Lemma 3.6, pp. 20–21 | — | uncertified | Not verifiable |
| 2.4 | Milnor 1963, Thm 3.5, p. 20; CIN Thm 5.7, pp. 40–41 | cohen-iga-norbury 1519–1531 (PDF 53–54) | closed M, Morse f: CW type with one λ-cell per index-λ point; "for compact M" in the README | sound |
| 3.1 | Hirsch, Ch. 2 §1; Ch. 6, Thm 1.2 | — | uncertified | Not verifiable |
| 3.2 | Milnor 1963, Cor 6.7, p. 36 | — | uncertified | Not verifiable; the headline is pinned only at 2fd255d (R01) |
| 4.1 | CIN Cor 5.11 and proof, p. 42 | cohen-iga-norbury 1569–1596 (PDF 55) | ℝ coefficients; the proof's `c_k = d_(k+1) + b_k + d_k` gives `Q = Σ d_(k+1) t^k` after tensoring with any field | sound; "and its proof" carries the field generality |
| 4.2 | Weber, Thm 1.1, p. 2, proof pp. 2–3 | weber-conley 62–67, 95–106 | C² f on a closed M; cat = least ℓ ≥ 1 of an open nullhomotopic cover | sound; "for nonempty M" matches `ℓ ≥ 1` |
| 4.3 | CIN Application 5.13, p. 43 | cohen-iga-norbury 1617–1619 (PDF 56) | closed Mⁿ, Morse f with two critical points ⇒ homeomorphic to Sⁿ | sound |
| 4.4 | Milnor 1959, Thm 1(3), p. 440; Cor 1, p. 442; Brown 1960, Thm 5, p. 76; Thms 0–4, pp. 74–76 | milnor-1959 53, 72–76, 109, 117–118; brown-1960 25–37 (p. 74), 60–72 (p. 75), 84–113 (p. 76) | two open sets diffeomorphic to ℝⁿ ⇒ homeomorphic to Sⁿ; an embedding of S^(n−1)×I gives closures of the complementary domains of the middle sphere that are n-cells | sound in the README; R02 in the Lean docstring |
| 5.1 | CIN Thm 15.1, p. 143; 15.4, p. 146; 15.6–15.7, pp. 147–148 | cohen-iga-norbury 4986–5000 (PDF 156), 5091–5096 (PDF 159), 5142–5175 (PDF 160–161) | local normal form near a nondegenerate critical submanifold; compact M with c the only critical value in [c−ε,c+ε]; disc-bundle spectral sequence | sound; the README's E¹ convention corrects the source's indexing (Source issues) |
| 6.1 | CIN Thm 4.6, pp. 27–29 | cohen-iga-norbury 1022–1035 (PDF 40), proof to 1098 (PDF 42) | closed M: global flow lines whose limits are critical | sound; "for compact manifolds" |

### Adversarial table (values computed this round)

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-space model `𝓡∂ 1` | df=(1,0)↦(1,0); range {x₀≥0}≠ℝ, so not boundaryless | Checks agree | R01 (pin) |
| 2 | §1.2 Hessian and counts | −x²+y²; constant on S¹; a point; f=0 and x² on ℝ | diag(−2,2), λ=1, count 1; encard ⊤; count 1, λ=0; λ(f)+λ(−f): 0+0=0≠1 and 0+1=1 | nondegeneracy needed and stated | R01 (pin) |
| 3 | §1.3 owned seminorm comparison | τ(y)=y/2, K=[−2,2]; reverse y=2x; δx² on [−1,1]; x³−tx | sups (1,1,½) vs (1,2,2), so C=1; reverse 2^j, so C=2^k depends on k; (δ,2δ,2δ); t=−1: no root of 3x²+1, t=3: x=±1 | constant depends on k, as stated | none |
| 4 | §2.1 levels and faces | f=x on ℝ² at 0; f=x² at 0; f=x on [a,b]; x²+y², a=1 | inclusion v↦(0,v), range span e₂=ker(1,0); df=0 at the singleton; df(+1)=+1 at b, df(−1)=−1 at a; ∂M₁=S¹ with model dimension 1=2−1 | signs agree | none |
| 5 | §2.2 bands and adapted fields | x² on [1,4]; x², z=√2x; −u²+v² | X=−1/(2x): d(x²)/dt=−1, time 3=f(2)−1, equal to −grad f/\|grad f\|²=−2x/4x²; adapted z′=−z gives x′=−x, df(X)=−2x²; Euclidean −grad gives z′=−2z, metric 2dx² gives −x; (−z₁,−z₂): df=z₁²−z₂²>0 at z₂=0 | Checks agree | none |
| 6 | §2.3 chart change | (x²−1)², c=1, ε=½; RP² f=(y²+2z²)/\|v\|² | (x²−1)²=1−(x√(2−x²))²; α(1)=±√(1−1/√2)=±0.5412 with f=½; {f≤½}: x²∈[0.293,1.707], two intervals; at [0:0:1] f=2−(2u²+v²)/(1+u²+v²), attaching degree ±2 | Checks agree | none |
| 7 | `exists_morseCWModel` | S² height; x² on ℝ; ∅; ℕ discrete with f(n)=n; f=x on ℝ | cells (1,0,1); one 0-cell; empty cell types; ℵ₀ 0-cells; f=x is Morse and proper with no critical point, so X=∅≄ℝ: `BddBelow` needed | true; free universe u_4 harmless | none |
| 8 | §3.1 strong topology | tolerance e^(−x²) vs constant 0.01; δψ restricted to (0,1) | fails where \|x\|>√(ln 100)=2.146; tolerance x on (0,1): δψ(x)=δ>x for x<δ | Checks agree | none |
| 9 | §3.2 exhaustion | x² with \|g−f\|<1; constant on ℕ | g≥−1, {g≤b}⊆{x²<b+1} compact; fibre ℕ not compact | Checks agree | R01 (headline absent at the head pin) |
| 10 | `strong_morse_inequalities` | RP² over ℚ and 𝔽₂; T²; ∅; c=(2,0,0,2), b=(1,0,0,1) | ℚ: C−B=t+t²=(1+t)·t, Q=t, rank d₂=1; 𝔽₂: Q=0; T²: C=B=1+2t+t²; ∅: 0=0+0; degree 1: S₁(c)=−2 ≥ S₁(b)=−1 fails, so that candidate has no ℕ[t] Q | true; Q∈ℕ[t] needs the strong inequalities | none |
| 11 | `bettiNumber` | point; RP², j=1; ℕ discrete; S¹, ℝ²∖0, disc | (1,0,0,…); 0 over ℚ, 1 over 𝔽₂; H₀ of infinite dimension gives junk 0; 1, 1, 0 | junk value documented | none |
| 12 | §4.2 LS bound and cup length | S¹; T²; RP²; S¹⊔S¹; ∅; a point | 2≥2≥1+1; 4≥3≥2+1; 𝔽₂: 3≥3≥2+1, ℚ: 3≥0+1; 4=2+2, normalized 1+1≠3; 0+1≤0 fails; 1≥1≥0+1 | nonemptiness needed and stated | none |
| 13 | §4.3 applications | S² height; h−h³/3; S² with c=(2,1,1); CP¹; odd m | indices (0,2); Hessians 0; −f gives (1,1,2), χ=2−1+1=2; values 0,1, indices 0,2; χ=Σ(−1)^j c_(m−j)(−f)=(−1)^m χ gives 0 | Checks agree | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3 on S^m; h² on S^m; two points; one point; S²⊔S² | f=2/3−u²+u³/3 with u=1−h≈r²/2, so f=2/3−r⁴/4+O(r⁶); count ⊤ for m≥2, 4 for m=1; count 2 gives S⁰; 1≠2; ≥4 | true with no nondegeneracy | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | h on round S¹; m=0 | ‖grad h‖=√(1−h²), η=√3/2, η²=¾, T>2/¾=8/3; the two points ≃ℝ⁰ | true | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; m=1 with co-rotating arcs; equator, latitude bicollar | S^(−1)=∅, closures ≃{0}, ‖0‖=0≠1; S¹ minus 2 points is 2 arcs, each closure a closed arc; θ∈[−π/4,π/4] ↔ \|h\|≤√2/2 | true for all m | none |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | S¹ as two arcs; m=0 with X a point; X=ℝ^m | glued ≃S¹; 1 point vs #S⁰=2, so `0<m` needed; not compact | true | none |
| 18 | §5.1 Morse–Bott | y² vs y⁴; negative Möbius line; RP² cell filtration | ker Hess=span e₁=TC vs ℝ²; twisted H₀=ℤ/2 vs ℤ; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | E¹ convention correct | none |
| 19 | `exists_compactTrapped_gradient_limit` | x²; metric 4dx²; the endpoint curve with t₁=1; dim 0; e^(−x) | γ=x₀e^(−2t), C=\|x₀\|, c=2, T=0; 2\|x₀\|e^(−t/2); Γ(s)=x₀e^(−2−2s), so \|γ(t)\|≤\|x₀\|e^(−2)·e²·e^(−2t)=\|x₀\|e^(−2t); γ constant, distance 0; trajectory →∞, not trapped | true | none |
| 20 | R01 docstring and README names | the 18 docstring names and 88 README `TauCeti.` names at a91d3aaf vs 2fd255d; `#check` | 0 vs 18; 12 vs 88; 19 unknown; merge-tree: 2 conflicts | false at the head pin | R01 |
| 21 | R02 Milnor 1959 locator | running heads in milnor-1959 | Théorème 1 under "440" (line 53, 72); Corollaire 1 under "442" (line 109, 117) | docstring page wrong for Thm 1 | R02 |

## Not verifiable

- **`hirsch-differential-topology`, `lee-smooth-manifolds` and `milnor-1963`.** These are uncertified and settled, and cited by locator (§2.1, §2.2–§2.4, §3.1, §3.2).
- **Thomas Mark, Math240 Homework 11 (`README.md:1553`).** There is no legal text, and the work is not in the manifest. The README uses it only for bibliographic attribution, and no target rests on it.
- **Elaboration at main's pins.** I may run Lean only from this worktree, at the head's pins. I checked the 2fd255d declarations by reading their sources in the Tau Ceti package's git objects.
- **Ownership against open pull requests named without files.** I did not check ManifoldOptimization (#1506), MorseNovikov (#1161) or DifferentialGeometry (#886), which `scratch/overlaps.md` lists as close in vocabulary.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i(f) and b_i(M) with the fixed index i; it should be c_k(f) and b_k(M); affects nothing.
- **Misprint** in cohen-iga-norbury at Application 5.13, proof, p. 43: the source says the lower disc is the preimage of [t₁,a], around a minimum called P; it should be the preimage of [t₀,a], around the minimum S; affects nothing.
- **Misprint** in cohen-iga-norbury at Theorem 15.6, p. 147 (and Theorem 15.7, pp. 147–148): the source calls the sum of relative homologies of the disc bundles the E² term; for a filtration spectral sequence that is the E¹ page, with d¹ the Morse–Smale differential; affects nothing.
- **Gap** in brown-1960 at Theorem 5, proof, p. 76: the source takes the complementary domain of h(S^(n−1)×1) avoiding h(S^(n−1)×0); for n=1 with co-rotating collar arcs each domain meets h(S⁰×0); it should assume n≥2 or treat n=1 separately; affects the proof.
