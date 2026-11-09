# Review of MorseTheory (pull request #1682 at 9506fc5)

**Verdict:** needs changes

This is a full review of the head that PRREVIEW-MorseTheory~19 read. The folder has 0 changed lines since then. There are two findings:

- **R01 (P1)** is the previous R01, and it re-raises H01. The branch still pins Tau Ceti a91d3aaf. At that pin, 76 of the 88 Tau Ceti names that the README and the `Suggested.lean` docstring call "pinned" do not exist. Among them are the inputs of this pull request's own §4.4 targets. Only a merge of `origin/main` repairs it, and that is a worker or human step.
- **R02 (P3)** is new. The reference list ends with a homework sheet that supports no statement and is not in the source manifest.

The mathematics checked out: all 8 declarations, every README Check I recomputed, the 15 sampled locators that are readable, every supplier section, the gate and the dependency check. Details are below.

## R01 (P1) — Branch not merged with main: most of the Tau Ceti library that the README and `Suggested.lean` consume is missing at this head's pin

Re-raised: H01

**Location.**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:22`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated".
- `README.md:38–39`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6".
- The same claim appears in the Tau Ceti contract (`README.md:136–400`) and in every *Needs:* line that cites a "pinned" declaration.

**Claim.** The README defers its Layer 1–4 and Layer 6 targets to Tau Ceti declarations. It also builds the proof routes of its own §4.4 targets on Tau Ceti inputs. At the pin that this head builds against, most of those declarations do not exist, so the deferred targets have no owner.

**Witness.** `lake-manifest.json` pins Tau Ceti a91d3aaf; main pins 2fd255d. `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf and 35 at 2fd255d. Of the README's 88 code-span `TauCeti.` names, 12 are declared at a91d3aaf and 88 at 2fd255d.

**Detail.**
- **Pins and merge state.**
  - This head pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3. `origin/main` (1bea835) pins 2fd255d, 1b1ccf4 and v4.36.0-rc2.
  - The merge base is still ffcc9d31. `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in `README.md` and `Suggested.lean`.
  - Since the previous review, main has one more commit touching the folder, 76ab5b3f, which regenerates `PROGRESS.md` and `STATUS.md`. Those two files do not conflict.
- **The docstring's 17 names.** I grepped the checked-out tree at a91d3aaf for each of the 17 names in `Suggested.lean:23–45` and found 0 of them. At 2fd255d all 17 are declared, for example:
  - `Morse/CriticalPoints.lean:274`;
  - `Morse/Deformation.lean:199`;
  - `Morse/RelCWComplex.lean:298`;
  - `Morse/Inequalities.lean:403` and `:414`;
  - `Morse/Reeb.lean:148`;
  - `Morse/ExponentialConvergence.lean:303`.
- **The 12 names that do exist at a91d3aaf.**
  - The bicollar API: `IsBicollar`, `IsBicollared`, `disjoint_image_Ioi_Iio` and `range_diff_range_eq_union`.
  - `brownBicollaring`.
  - The Jordan–Brouwer theorem `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`AlgebraicTopology/Singular/JordanBrouwer.lean:212`).
  - `boundaryChartedSpace`, `isManifold_boundary` and `sectionZeroChartedSpace`.
  - The two finite-CW homology lemmas.
  - `manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank`.
- **Owned §4.4 targets.** These are the ones this pull request adds. Their *Needs:* lines cite four "pinned" inputs that are absent at a91d3aaf:
  - `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall` (`README.md:1315`). The pin's `Analysis/InnerProductSpace/Hemisphere.lean` has only the hemisphere homeomorphism and the equator inclusion. The theorem is at 2fd255d, `Hemisphere.lean:377`.
  - `IsOpen.image_of_continuousOn_of_injOn` and `Homeomorph.coe_apply_mem_frontier_iff` (`README.md:1272`, `:1250`). The pin's `AlgebraicTopology/Singular/` has no `InvarianceOfDomain` file. The two are at 2fd255d, `InvarianceOfDomain.lean:160` and `:257`.
  - `IsLocalExtr.mem_criticalPoints` (`README.md:1170`), at 2fd255d `Morse/CriticalPoints.lean:92`.

  So at this head's pin, Brown's theorem, the two-open-cell lemma and the cover theorem rest on inputs no one supplies.
- **Why the gate passes.** The four modules that `Suggested.lean` imports exist at both pins: `LocallyFlat/Bicollar`, `Morse/Basic`, `Morse/Index` and `VectorBundle/Riemannian/Riesz`. The eight statements spell the critical set and the gradient by their bodies, `mvfderiv I f x = 0` and `rieszDual x (mvfderiv I f x)`, so they need nothing else.
- **Pull-request text.** The title is still "Add Palais–Smale compactness and nonproper gradient convergence". The description still announces `PalaisSmaleTargets.lean`. `README.md:74–79` puts Palais–Smale theory outside this roadmap, and the folder has no such file.

**Why H01's reason does not settle it.** The repair report answered H01: the finding is correct, and only a merge of `origin/main` repairs it, which a repair of the two roadmap files cannot do. That is right about who can act. But the merge has not happened: the pins, the merge base and the conflicts are exactly as they were. So the contract is still false at the pin that the build and the gate use.

**Exact repair (worker or human).**
1. Merge `origin/main` into the branch. Resolve `README.md` and `Suggested.lean` to this head's text, and take main's `PROGRESS.md` and `STATUS.md`. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. Apply the respelling that the repair report calls H05:
   - add the imports `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write the critical set as `TauCeti.criticalPoints I f`, the count hypothesis as `TauCeti.totalCriticalCount I f = 2` and the field as `-TauCeti.Manifold.mgradient I f x`;
   - delete `Suggested.lean:19–20`.

   Each replacement unfolds to the present spelling: `CriticalPoints.lean:87` and `:342`, and `Gradient/Basic.lean:73` at 2fd255d.
3. Re-elaborate the file and re-run the gate at the new pins.
4. Replace the pull-request title and description with ones that describe the roadmap as it stands.

**Tested on the refuting instance.** All 17 docstring names and all 88 README `TauCeti.` names are declared at 2fd255d. So is each §4.4 input named above, at the file and line given. I cannot elaborate at main's pins from this worktree.

## R02 (P3) — A homework sheet in the references supports no statement and is not in the source manifest

**Location.** `README.md:1553–1554`: "Thomas Mark, *Math240 Riemannian Geometry* (2001), Homework 11 (Morse–Bott examples). Bibliographic attribution only; the mathematical targets use the references above."

**Claim.** The README lists a work with no locator. It is cited at no target, Check or example, and it is not recorded in the roadmap's `sources.toml`. The sentence "Bibliographic attribution only" records where the material came from, which is a provenance note rather than mathematics. The §5.1 Morse–Bott checks already cite Cohen–Iga–Norbury, Theorems 15.1–15.7.

**Witness.**
- `grep -n "Math240\|Mark" README.md` matches only line 1553.
- The manifest's 8 entries are brown-1960, milnor-1959, cohen-iga-norbury, weber-conley, hirsch, lee, nicolaescu and milnor-1963.
- The bullet is new in this pull request: it is absent from main's README.

**Exact repair.** Delete lines 1553–1554 of `README.md`. If the author wants a Morse–Bott example from that sheet, state it as a §5.1 Check with a locator and record the sheet in the manifest.

**Tested.** After deleting the bullet, every remaining References entry has a manifest key. No target, Check or example loses a citation, because none cited this bullet.

## Previous findings

- **R01 (PRREVIEW-MorseTheory~19): not repaired.**
  - `lake-manifest.json` still pins Tau Ceti a91d3aafa8cd.
  - The merge base is still ffcc9d31.
  - `Suggested.lean:22` still reads "are proved at the pinned Tau Ceti and are consumed, not restated".
  - It is R01 above.
- **R02 (PRREVIEW-MorseTheory~18): stays repaired.** `Suggested.lean:167` reads "compare Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442". This matches milnor-1959 line 53 (running head 440), lines 72–76 (Théorème 1), line 109 (running head 442) and lines 117–118 (Corollaire 1).

## Verified sound

### Gate, dependencies, elaboration, signatures, padding

- **Gate.** I re-ran it on this head: every check is 0 and it prints `OK`. `scratch/gate.md` (the worker's run) also shows `build=0`. The worktree is clean after the run.
- **Dependency check:** `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` prints only seven `declaration uses sorry` warnings, at lines 78, 104, 119, 134, 155, 169 and 183.
- **Signatures.** I elaborated `#check @name` for all 8 declarations once, in a scratch file that imports the built module, with universes printed. Each type equals `scratch/signatures.md`. No section binder is lost: Brown's theorem and the two-open-cell lemma `omit` the manifold binders and use none of them.
  - In `exists_morseCWModel` the model X lives in a free universe `u_4`. That is true, since a second-countable M has a countable CW model, which can be lifted to any universe.
  - In `strong_morse_inequalities`, k shares M's universe `u_3`, as `README.md:83–84` says.
  - Each type matches its README statement: §2.4 at line 866, §4.1 at 966 and 992, §4.4 at 1158, 1199, 1231 and 1297, and §6.1 at 1455.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` by `first | rfl | simp | infer_instance | trivial | decide | aesop | exact ⟨_, rfl⟩ | omega | positivity | exact Classical.ofNonempty | tauto`. All 7 theorems fail: 3 with unsolved goals and 4 with "`tauto` failed". `bettiNumber` is the one definition that `strong_morse_inequalities` needs, with a real body. Nothing is padding.
- **Folder and policy.**
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
  - `PROGRESS.md`, `STATUS.md` and `metadata.toml` are on main and are unchanged by this pull request.
  - The README has no process words, LaTeX or pull-request numbers.
  - The README has 18 Checks blocks and an Examples and a Dependencies section in each of its 6 layers.
  - All 8 Lean names appear in the README.
- **Headline coverage.**
  - Of the README's headlines, five are stated: the CW model, the ℕ[t] identity, the degenerate sphere theorem with its three inputs, and compact-trapped convergence.
  - The proper Morse function bounded below is pinned at 2fd255d (subject to R01).
  - The docstring names the Morse–Bott attachment as not statable. No Morse–Bott predicate exists at a91d3aaf: `rg -i "morse.?bott"` over the pin's `TauCeti/` finds no definition.

### Sources (seeded sample: 15 targets)

Printed page numbers come from the running heads. For cohen-iga-norbury the printed page is the PDF page minus 13; for nicolaescu-invitation it is the PDF page minus 10.

- **§1.3.**
  - CIN Theorem 5.3, the Morse lemma, is at line 1322 on p. 36, with its proof running to p. 37.
  - CIN Corollary 5.4, that the critical set of a Morse function is discrete, is at line 1423 on p. 38.
  - Both are as cited.
- **§2.2.**
  - Nicolaescu Theorem 2.2.3 starts at line 1950 on p. 38, and its proof ends at line 2176 on p. 42.
  - Remark 2.2.5 is at line 2177 on p. 42: handles for several critical points on one level of an exhaustive f.
  - The proof uses a compact band {|f|≤ε} with no other critical point (line 1966), as the README says.
- **§2.4.** CIN Theorem 5.7 is at line 1519 on p. 40, with its proof ending on p. 41: a closed manifold with a Morse function is a CW complex up to homotopy, with one λ-cell per index-λ critical point.
- **§4.1.**
  - CIN Corollary 5.11 is at line 1569 on p. 42.
  - Its proof gives c_k=d_(k+1)+b_k+d_k, with d_k the rank of ∂_k. This is exactly the README's ranks-of-differentials description of Q.
- **§4.2.**
  - Weber, Theorem 1.1, is at line 65 on p. 2: for a C² function on a closed manifold, the number of critical points is at least cat(M).
  - cat(M) is defined at line 62 as the least ℓ≥1 with an open cover by ℓ sets that are nullhomotopic in M. That is the unnormalized count for nonempty M, as the README says.
  - The proof runs over pp. 2–3 (lines 73–106).
- **§4.3.** CIN Application 5.13 is at line 1617 on p. 43: Reeb's theorem for a Morse function on a closed manifold, homeomorphism only.
- **§4.4.**
  - Milnor 1959: Théorème 1(3) is at lines 72–76 under running head 440, and Corollaire 1 at lines 117–118 under 442.
  - Brown 1960: Theorems 0–1 are on p. 74 (lines 25–37), 2–3 on p. 75 (lines 60–71), and 4–5 on p. 76 (lines 84–103).
  - Theorem 5's hypothesis is an embedding of S^(n−1)×[0,1] with the middle sphere at 1/2, as `README.md:1238–1239` states.
- **§5.1.** In CIN, Theorem 15.1 is at line 4986 on p. 143, Theorem 15.4 at line 5091 on p. 146, Theorem 15.6 at line 5142 on p. 147, and Theorem 15.7 at line 5161 on pp. 147–148.
  - The README's two departures from the text are corrections of source errors (see Source issues). One is the E¹ convention at `README.md:1390–1391`. The other is the neighbourhood-of-the-zero-section caveat at `README.md:1372–1374`.
- **§6.1.**
  - CIN Theorem 4.6 is at line 1022 on p. 27, with its proof running to p. 29.
  - §4.3 (line 913) makes f a Morse function as a standing assumption, so "compact-M convergence case" is right.
- **§1.1, §1.2, §3.1 and §3.2** carry no readable locator. §2.1 cites only Lee, §3.1 Hirsch, and §2.2–§2.4 and §3.2 Milnor 1963. Those three are uncertified (see Not verifiable).

### Library declarations opened (at the pins)

- **At a91d3aaf:**
  - `TauCeti.IsBicollar` and `IsBicollared` (`LocallyFlat/Bicollar.lean:101`, `:108`);
  - `IsMorse` and `IsManifoldNondegenerateCriticalPoint` (`Morse/Basic.lean:178`, `:59`);
  - `manifoldMorseIndex` (`Morse/Index.lean:74`) and `manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank`, which requires a nondegenerate Hessian (`:140`);
  - `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`JordanBrouwer.lean:212`);
  - `Riemannian.Tensor.rieszDual` (`Riesz.lean:74`);
  - `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval` and `eqOn_maximalIntegralCurve` (`IntegralCurve/Maximal.lean:113`, `:249`).
- **Mathlib at 6b7abb3c:**
  - `onePointEquivSphereOfFinrankEq` needs finrank V + 1 = card ι, as the README says.
  - `Homeomorph.onePointCongr`.
  - `EuclideanSpace.instChartedSpaceSphere` needs finrank E = n+1.
  - `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless` needs `IsManifold I 1`, `T2Space`, `BoundarylessManifold` and an interior time t₀∈(a,b), as §6.1's route uses it.
  - `Manifold.riemannianEDist`.
- **At 2fd255d (git objects):** each of the 88 README `TauCeti.` names, with the files and lines listed under R01.
- **A lead for the next pin bump, not a finding.** These three are in Tau Ceti 7ca783d, which is past both pins:
  - `TauCeti.exists_twoEuclideanOpenCover_of_two_criticalPoints` (`Morse/TwoCriticalPoints.lean:111`);
  - `TauCeti.IsMorse.exists_sum_range_monomial_eq_add_mul` (`Morse/Inequalities.lean:657`);
  - `TauCeti.IsMorse.exists_edist_le_exp_of_tendsto_neg_mgradient` (`Morse/Trajectory.lean:185`).

  They are absent at a91d3aaf and at 2fd255d; for example, `TwoCriticalPoints.lean` does not exist at 2fd255d. I did not compare their statements with the declarations here. When main's pin passes 7ca783d, the matching declarations of `Suggested.lean` will become duplicates of Tau Ceti.

### Cross-roadmap citations (resolved on main 1bea835; all suppliers are on main)

- **DifferentialGeometry:**
  - Layer 3 at line 371, Layer 5 at 503 with §5.1 at 507, Layer 10 at 877 with §10.2 at 884, and Layer 12 at 910 with §12.2 at 918 and §12.3 at 920.
  - The open revision DifferentialGeometry #886 keeps all of these: Layer 3 at line 1015, Layer 5 at 1285 with §5.1 at 1289, and 12.2 at 409.
- **AlgebraicTopology:**
  - Stage 4 items 4 and 5 are the disc-over-sphere relative CW structure with coproducts (line 629) and the pushout, telescope and tower union. The latter says "MorseTheory M2 uses this union theorem" (line 715).
  - Item 6 is RP^n (line 789).
  - The categorical-cover supplement with `lsCupLength X R+1≤lsCategoryCount X X` is at lines 1117–1122.
  - The open revision AlgebraicTopology #1652 maps Stage k item m to §k.m (its lines 714–733) and names MorseTheory M4 as consumer of §6.2's `lsCupLength`. So no citation breaks.
- **Others:**
  - GeometricTopology Layer 1 (line 783).
  - CharacteristicClasses C2 (line 728).
  - ComplexKahlerGeometry K7.1–K7.2 (lines 1405–1407).
  - ComplexManifolds Milestone 1 (line 172).
  - DGFloer Layer 1 item 3, filtered `SpectralObject` (line 621).
  - Consumers: HeegaardFloer Lane M, ConvexityToric T2 (line 73), RiemannianGeometry R3 (line 369) and AffineMorseLefschetz (line 130).
- **Dropped anchors.** `#m2-…` and `#m5-…`, which HeegaardFloer cites at main lines 647 and 1064, are mapped old → new at `README.md:463` and `:467`. I recomputed the new slugs: the en dash in "Morse–Bott" drops, giving `layer-5-morsebott-…-m5`.
- **Ownership.**
  - I grepped the Lean files of all open heads with `roadmaps grep --lean-only` for `def bettiNumber` and the 7 theorem names. They are found only in this pull request and in main's MorseTheory.
  - MorseNovikov (#1161), RiemannianGeometry (#1683), AlgebraicTopology (#1652) and DifferentialGeometry (#886) each name MorseTheory as a supplier, and none claims the CW model, the ℕ[t] identity, §4.4 or §6.1.
  - DifferentialGeometry #886 declares its own `mgradient` in its `Suggested.lean`; this file uses the Riesz body instead.

### Adversarial table

Every row was recomputed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; `𝓡∂ 1` | df=(1,0)↦(1,0); range I=[0,∞)≠univ, so `Boundaryless` fails | Checks agree | R01 (names at pin) |
| 2 | §1.2 Hessian, counts, complementary index | −x²+y²; constant on S¹; a point; f=0 and x² on ℝ | diag(−2,2), λ=1; encard ⊤; count 1, λ=0; λ(f)+λ(−f)=0+0=0≠1 for f=0, and 0+1=1 for x² | nondegeneracy needed, and the pinned lemma requires it | none |
| 3 | §1.3 normal form and chart-change seminorms | x² vs y²/2; x³−tx; δx² on [−1,1]; τ(y)=y/2 and y=2x | Hessian 2, so f=y²; t=−1 gives 3x²+1>0, no root, t=3 gives x=±1; sup norms (δ,2δ,2δ); (1,1,½) on K vs (1,2,2); reverse scaling 2^m, so C=2^k | constant depends on k, as stated | none |
| 4 | §2.1 levels and faces | f=x on ℝ²; x² at 0; f=x on [a,b]; x²+y², a=1 | ker df=span e₂; df(0)=0, not regular; df(outward)=+1 at b and −1 at a; ∂M₁=S¹ with n=1 | signs agree | none |
| 5 | §2.2 restriction, rescaled field, handles | x² band [1,4]; z=√2x; −u²+v²; metric 2dx² | X=−1/(2x)=−∇f/‖∇f‖², time 3=4−1; adapted x′=−x vs Euclidean −2x; df(−z₁,−z₂)=z₁²−z₂²>0 at z₂=0; −∇f=−x | Checks agree | none |
| 6 | §2.3 chart change | (x²−1)², c=1, ε=½; RP² top chart; AᵀJA=J | y²=x²(2−x²), α(1)=±√(1−1/√2)=±0.5412, f=½; {f≤½}={x²∈[0.293,1.707]}, 2 components; 2−f=(2u²+v²)/(1+u²+v²) matches the normalized coordinates; A_uuᵀA_uu=I+A_vuᵀA_vu≥I, so P≥I and the level only drops | construction coherent | none |
| 7 | `exists_morseCWModel` (§2.4) | S² height; x² on ℝ; ∅; ℕ with f(n)=n; f=x on ℝ | cells (1,0,1); one 0-cell; none; ℵ₀ 0-cells; f=x has no critical points, so X would be ∅≄ℝ, and `BddBelow` excludes it | true; hypothesis needed | none |
| 8 | §3.1 strong topology | e^(−x²) vs constant 0.01; δψ restricted to (0,1); clopen summand | fails for \|x\|>√(ln 100)=2.146; δ>x for 0<x<δ; a locally finite family stays locally finite | Checks agree | none |
| 9 | §3.2 proper Morse function bounded below | x² with \|g−f\|<1; constant on ℕ | g≥−1, {g≤b}⊆{x²≤b+1} compact; constant fibre ℕ not compact | Checks agree | R01 (pinned at 2fd255d only) |
| 10 | `strong_morse_inequalities` (§4.1) | RP² over ℚ and 𝔽₂; S² with c=(2,1,1); T²; ∅; c=(2,0,0,2), b=(1,0,0,1) | Q=t; Q=0; 2+t+t²=1+t²+(1+t)·1, so Q=1; Q=0; 0=0; S₁(c)=−2 vs S₁(b)=−1, which fails | true; identity in ℕ[t] | none |
| 11 | `bettiNumber` | point; RP², j=1; ℕ discrete; S¹, ℝ²∖0, disc | (1,0,…); 0 over ℚ, 1 over 𝔽₂; junk 0 though H₀ has rank ℵ₀; 1, 1, 0 | junk documented | none |
| 12 | §4.2 LS bound and corollaries | S¹; T²; RP² over 𝔽₂ and ℚ; S¹⊔S¹; ∅; point | 2≥2≥1+1; 4≥3≥2+1; 3≥3≥2+1 and 3≥1; 4=2+2 vs normalized 1+1≠3; 0+1≤0 fails; 1≥1≥0+1 | nonemptiness stated | none |
| 13 | §4.3 applications | S² with c=(2,1,1); odd m; CP¹ | −f has (1,1,2), χ=2−1+1=2; χ=Σ(−1)^j c_(m−j)=−χ, so χ=0; values 0 and 1, indices 0 and 2 | Checks agree | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3 on S^m; h² on S^m; m=0, #M=2 and #M=1; x·e^(−x²) on ℝ | f(1−u)=2/3−u²+u³/3 with u≈r²/2, so f=2/3−r⁴/4+O(r⁶) and the Hessian is 0; count ⊤ (m≥2) or 4 (m=1); S⁰={±1}, 2=2; 1≠2; f′=(1−2x²)e^(−x²) has 2 zeros but ℝ≄S¹ | true; `CompactSpace` needed and present | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | h on S¹; m=0; S²⊔S²; T² | ‖∇h‖²=1−h²≥¾ on [−½,½], T>2/(¾)=8/3; U={x}, V={y}≃ℝ⁰; ≥4 critical points; LS count 3>2 | true; route checked step by step | R01 (Fermat input absent at pin) |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; m=1 with co-rotating collar arcs; equator | S^(−1)=∅, ‖0‖=0≠1, closures are points; arcs at angles (0,ε) and (π,π+ε); band \|h\|≤sin(π/4)=√2/2 | true for all m | R01 (invariance-of-domain inputs absent at pin) |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | two arcs; m=0 with a point; X=ℝ^m; U∩V=∅ at m=1 | ≃S¹; 1 vs #S⁰=2, so `0<m` needed; not compact; then U would be compact but ≃ℝ, impossible | true | R01 (two-disc gluing absent at pin) |
| 18 | §5.1 Morse–Bott | y² vs y⁴; negative Möbius line; RP² filtration | ker=span e₁, ranks (0,1) vs ker=ℝ²; H₀(S¹;ℤ^w)=ℤ/2 vs ℤ; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | E¹ convention correct | none |
| 19 | `exists_compactTrapped_gradient_limit` (§6.1) | x²; metric 4dx²; one-sided endpoint curve; e^(−x); dim 0 | \|x₀\|e^(−2t) with C=\|x₀\| (or 1); 2\|x₀\|e^(−t/2); Γ(−1)=x₀e^(−2)e²=x₀; x′=e^(−x)→∞, not trapped; γ constant, distance 0 | true | none |
| 20 | R01: pinned names | tree grep at a91d3aaf vs git objects at 2fd255d; `Morse/` listing; merge-tree | 12/88 vs 88/88; docstring 0/17 vs 17/17; 4 vs 35 entries; 2 conflicts | false at the head pin | R01 |
| 21 | R02: Math240 reference | README grep; manifest; main's README | 1 hit at line 1553; 0 of 8 manifest entries; 0 hits on main | unrecorded, unused | R02 |

## Not verifiable

- **milnor-1963, hirsch-differential-topology and lee-smooth-manifolds.** These are uncertified and settled, cited by locator only:
  - Milnor 1963: Theorem 3.1, p. 12; Theorem 3.5, p. 20; Lemma 3.6, pp. 20–21; Corollary 6.7, p. 36;
  - Hirsch: Chapter 2 §1 and Chapter 6, Theorem 1.2;
  - Lee: Corollary 5.14 and Proposition 5.38.

  I did not read them. For the noncompact CW model, Nicolaescu's Corollary 2.2.6 (line 2181, p. 42) is a readable statement for an exhaustive Morse function.
- **Thomas Mark, Math240 (R02).** It is not in the manifest, and I did not look for a copy.
- **Elaboration at main's pins.** I may run Lean only from this worktree, at the head's pins. I read the declarations at 2fd255d and 7ca783d from the Tau Ceti package's git objects.
- **Ownership against ManifoldOptimization (#1506).** `scratch/overlaps.md` lists it as close in vocabulary, but the brief gives it without files, so I did not check it.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k from 0 to i have summands with c_i and b_i; it should be c_k and b_k inside both sums (also in the proof); affects nothing.
- **Error** in cohen-iga-norbury at Theorem 15.6, p. 147, and Theorem 15.7, pp. 147–148: the source says the relative homology of the filtration quotients is the E² term; it should be E¹, with E² its homology, so RP² has E²=(ℤ,ℤ/2,0); affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.1, p. 143: the source says f is the fibre quadratic form on a diffeomorphic image of all of U×ℝ^λ×ℝ^(m−n−λ); it should be a neighbourhood of U×{0}, since a bounded f cannot match an unbounded form; affects a stated result.
- **Gap** in cohen-iga-norbury at Theorem 4.6, p. 28: the source says the derivative of f∘γ tends to 0 because f∘γ is bounded and decreasing; it should add uniform continuity of t↦‖∇f(γ(t))‖², true on compact M; affects the proof.
- **Misprint** in cohen-iga-norbury at Application 5.13, proof, p. 43: the source says D₋=f⁻¹[t₁,a] and calls the minimum P; it should be f⁻¹[t₀,a] and S; affects nothing.
- **Misprint** in brown-1960 at Theorem 2, p. 75: the source says the open complementary domain D is an n-cell; it should be the closure of D, as Theorem 5 states; affects nothing.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the stable manifold of 0 for f(u)=u³ is W^u(0)=[0,∞); it should be written W^s(0); affects nothing.
