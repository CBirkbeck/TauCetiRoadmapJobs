# Review of MorseTheory (pull request #1682 at 9506fc5)

**Verdict:** needs changes

This is an incremental re-review of the 4 lines changed since e20127d. The only change is one docstring in `TauCetiRoadmap/MorseTheory/Suggested.lean`. It repairs R02 and introduces nothing new. One finding remains:

- **R01 (P1)** is the previous R01, and it re-raises H01. The branch still pins Tau Ceti a91d3aaf, so the Tau Ceti library that `Suggested.lean` and the README say they consume does not exist at the pin the build uses.

That finding is the only blocking one, and it re-raises a finding marked not actionable in this package. The repair is a merge of `origin/main` into the branch, which is a worker or human step.

## R01 (P1) — Branch not merged with main: the Tau Ceti library that `Suggested.lean` and the README consume is missing at this head's pin

Re-raised: H01

**Location.** `TauCetiRoadmap/MorseTheory/Suggested.lean:22–23`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated: compact finiteness of critical sets (`TauCeti.IsMorse.finite_criticalPoints_inter`), …". The same claim runs through the README's scope, its Tau Ceti contract (`README.md:136–400`) and every "pinned" sentence in Layers 1–4 and 6.

**Claim.** The README and the docstring describe a Tau Ceti that is not the one the build uses:

| | This head | main (47e423e0; the tools read 623f5d6, same pins) |
| --- | --- | --- |
| Tau Ceti | a91d3aaf | 2fd255d |
| Mathlib | 6b7abb3c | 1b1ccf4 |
| Lean | v4.35.0-rc3 | v4.36.0-rc2 |

The merge base is still ffcc9d31, and `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in `TauCetiRoadmap/MorseTheory/README.md` and `TauCetiRoadmap/MorseTheory/Suggested.lean`. So, at the pin the build and the gate use:

- the docstring's "proved at the pinned Tau Ceti" is false for every name it lists;
- the README's contract names declarations that do not exist;
- the targets the README defers to them have no owner;
- §3.2's headline `∃ f, IsMorse I f ∧ IsProperMap f ∧ BddBelow (range f)` is statable at a91d3aaf but is stated nowhere.

**Witness.** At this head's pins, a scratch `#check` of the 17 names the docstring lists, plus `TauCeti.criticalPoints` and `TauCeti.Manifold.mgradient`, gives 19 "Unknown" errors. All 19 are declared at 2fd255d, for example `Morse/CriticalPoints.lean:274` and `:87`.

**Detail.**
- Grepping the checked-out Tau Ceti tree (a91d3aaf) for a declaration of each of the 19 names finds 0 of them.
- `git grep` at 2fd255d finds all of them. Examples:
  - `Morse/NormalizedChart.lean:196`, `Morse/Deformation.lean:199`, `283` and `315`;
  - `Morse/RelCWComplex.lean:298`;
  - `ContMDiffMap/Chart/Strong.lean:240`, `Morse/Generic/Strong.lean:267` and `290`;
  - `Morse/Inequalities.lean:403`, `414` and `429`;
  - `Morse/LusternikSchnirelmann.lean:185`, `Morse/Reeb.lean:148`;
  - `Morse/GradientFlow.lean:261`, `Morse/ExponentialConvergence.lean:303`;
  - `Riemannian/Gradient/Basic.lean:73`.
- I extracted the 90 distinct names in the README that start a code span with `TauCeti.`. A declaration with the same final component exists for 8 of them at a91d3aaf and for all 90 at 2fd255d.
- `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf.
- The pull request's title and description still announce Palais–Smale theory and a file `PalaisSmaleTargets.lean`. The README puts Palais–Smale theory outside this roadmap, and the folder has no such file.

**Why H01's reason does not settle it.** H01 is right that a repair job cannot do the merge, because the merge touches `lake-manifest.json` and `lean-toolchain`. But the merge still has not been done. At the pin the build and the gate use, the contract is still false, and no edit to the two roadmap files can make it true. The gate passes only because the four imported modules exist at both pins: `LocallyFlat/Bicollar`, `Morse/Basic`, `Morse/Index` and `VectorBundle/Riemannian/Riesz`.

**Exact repair (for the worker or a human, not a repair job):**
1. Merge `origin/main` into the branch and resolve `README.md` and `Suggested.lean` to this head's text. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`:
   - Add the imports `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`.
   - Write the zero set as `x ∈ TauCeti.criticalPoints I f`; its body at 2fd255d, `Morse/CriticalPoints.lean:87`, is `{x | mvfderiv I f x = 0}`.
   - Write the two-point hypothesis as `TauCeti.totalCriticalCount I f = 2` (line 342).
   - Write the gradient field as `-TauCeti.Manifold.mgradient I f`; its body at `Gradient/Basic.lean:73` is `rieszDual x (mvfderiv I f x)`.
   - Delete the sentence at lines 19–20 that explains the zero-set spelling.
3. Re-elaborate the file and re-run the gate at the new pins.
4. Bring the pull request's title and description into line with the roadmap.

**Tested on the refuting instance.**
- The 19 names that fail at a91d3aaf all resolve at 2fd255d (Detail above).
- Each replacement is definitionally the head's spelling, so the substitution changes no statement.
- I cannot elaborate at main's pins from this worktree.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti a91d3aaf, the merge base is still ffcc9d31, and `Suggested.lean:22` still reads "are proved at the pinned Tau Ceti and are consumed, not restated". It is R01 above.
- R02 — repaired: `Suggested.lean:166–167` now reads "the two-open-cell recognition (compare Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442)". This matches milnor-1959 lines 53/72–76 and 109/117–118 and `README.md:1178`.

## Verified sound

### The changed passage (`Suggested.lean:164–168`)

**Locator.** milnor-1959 line 53 is the running head "440". Théorème 1 follows at lines 72–76: for a compact differentiable M, condition (3) is that M is the union of two open sets, each diffeomorphic to ℝⁿ. Line 109 is the running head "442", and Corollaire 1 at lines 117–118 concludes that M is homeomorphic to Sⁿ. The docstring's two pages are now each right. The same parenthesis appears at `README.md:1178`, and the manifest's `milnor-1959` locator reads "Theorem 1(3), p. 440, and Corollary 1, p. 442". The other Milnor 1959 citation in the file, `Suggested.lean:153` ("Corollary 1, p. 442"), is also right.

**Proof route stated in the docstring.** In a scratch file importing the built module, the m>0 route composes in Lean. The premises are `[CompactSpace M]`, `ContMDiff I 𝓘(ℝ) ∞ f`, `{x | mvfderiv I f x = 0}.encard = 2` and `0 < finrank ℝ E`. The proof is:
```lean
obtain ⟨U, V, hcov, hU, hV⟩ := exists_twoEuclideanOpenCover_of_two_criticalPoints (I := I) f hf hcrit
exact nonempty_homeomorph_sphere_of_two_euclidean_opens _ hm U V hcov hU hV
```
It elaborates with no error. The `Opens M`, the `Fin (finrank E) → ℝ` model and the `Fin (finrank E + 1)` sphere all match. For m=0, `S⁰ = {x ∈ ℝ¹ : ‖x‖ = 1} = {±1}` has two points, as the docstring says.

**Statement.** The type of `nonempty_homeomorph_sphere_of_two_criticalPoints` is unchanged. Its elaborated `#check @` matches `scratch/signatures.md`, with `CompactSpace M`, finite-dimensional E, `I.Boundaryless`, `T2Space M`, `IsManifold I ∞ M` and `SecondCountableTopology M`.

### Gate, dependencies, elaboration, signatures, padding

- **Gate.** I re-ran the gate on this head. Every check is 0 and it prints `OK`; my run printed no `build` field. `scratch/gate.md` (the worker's run) shows `build=0`.
- **Dependency check:** `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` takes 9 s and prints only 7 `declaration uses sorry` warnings, at lines 78, 104, 119, 134, 155, 169 and 183.
- **Signatures.** I put `#check @name` for all 8 declarations in one scratch file. Each elaborated type matches `scratch/signatures.md`, unchanged from the previous review. No section binder is lost: Brown's theorem and the two-open-cell lemma `omit` the manifold binders, and use none.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide | exact ⟨_, rfl⟩ | omega | positivity`. All 7 theorems fail: three with "unsolved goals" and four with "not a positivity goal". Nothing is padding.

### Folder, policy and overlaps

- **Folder and policy.**
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
  - The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
  - The changed docstring adds no process word, path or pull-request number.
- **Overlaps** (`scratch/overlaps.md`).
  - No other open pull request changes this roadmap.
  - No cited id is dropped elsewhere.
  - The two ids this pull request drops are mapped at `README.md:463` and `467`: `#m2-compact-band-deformation-handles-and-cells` and `#m5-morsebott-normal-bundles-and-attachments`. HeegaardFloer cites them on main, at lines 647 and 1064.
- **Ownership of the changed object** (sphere recognition from two critical points or two Euclidean opens). I grepped the open heads given with files for "two critical points", "Schoenflies", "two open sets", "homeomorph_sphere", "Milnor 1959" and "bicollar":
  - MorseNovikov's hits are circle-valued Novikov examples.
  - DifferentialGeometry has no hit.
  - AlgebraicTopology's "Milnor 1959" is the CW-homotopy-type paper (Theorem 3), and its two-open results are van Kampen pushouts.
  - RiemannianGeometry's Milnor citation concerns loop spaces.
  - None of them owns this object.

### Library declarations opened this round

- **At the head pin (a91d3aaf):**
  - `TauCeti.IsMorse` is at `Morse/Basic.lean:178`.
  - `TauCeti.manifoldMorseIndex` is at `Morse/Index.lean:74`.
  - `Morse/` has 4 entries.
- **At 2fd255d:** the 19 declarations listed under R01.

### Remarks on untouched text (no change requested)

The previous report listed MorseNovikov and DifferentialGeometry under "not checked". This brief gives both with files, so I checked them for the changed object, as above.

### Adversarial table

Rows 1–13 and 15–19 are carried from PRREVIEW-MorseTheory~18 for statements the diff leaves untouched, with that report's values. Rows 14, 20 and 21 were recomputed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport (carried, ~18) | self-model ℝ²; `𝓡∂ 1` | df=(1,0)↦(1,0); range {x₀≥0}≠ℝ | Checks agree | R01 (pin) |
| 2 | §1.2 Hessian and counts (carried, ~18) | −x²+y²; constant on S¹; a point; f=0 and x² on ℝ | diag(−2,2), λ=1; encard ⊤; count 1, λ=0; λ(f)+λ(−f)=0≠1 and 1 | nondegeneracy needed and stated | R01 (pin) |
| 3 | §1.3 seminorm comparison (carried, ~18) | τ(y)=y/2 on [−2,2]; y=2x; δx²; x³−tx | C=1; C=2^k; (δ,2δ,2δ); t=−1: no root, t=3: ±1 | constant depends on k, as stated | none |
| 4 | §2.1 levels and faces (carried, ~18) | f=x on ℝ²; x²; x on [a,b]; x²+y², a=1 | ker(1,0)=span e₂; singleton; df(±1)=±1; ∂M₁=S¹ of dimension 1 | signs agree | none |
| 5 | §2.2 bands and fields (carried, ~18) | x² on [1,4]; z=√2x; −u²+v² | time 3=f(2)−1; x′=−x vs −2z; df=z₁²−z₂²>0 at z₂=0 | Checks agree | none |
| 6 | §2.3 chart change (carried, ~18) | (x²−1)², c=1, ε=½; RP² quotient | α(1)=±0.5412, f=½; two intervals x²∈[0.293,1.707]; degree ±2 | Checks agree | none |
| 7 | `exists_morseCWModel` (carried, ~18) | S² height; x²; ∅; ℕ, f(n)=n; f=x on ℝ | cells (1,0,1); one 0-cell; none; ℵ₀ 0-cells; X=∅≄ℝ without `BddBelow` | true | none |
| 8 | §3.1 strong topology (carried, ~18) | e^(−x²) vs 0.01; δψ on (0,1) | fails for \|x\|>2.146; δ>x for x<δ | Checks agree | none |
| 9 | §3.2 exhaustion (carried, ~18) | x², \|g−f\|<1; constant on ℕ | {g≤b}⊆{x²<b+1} compact; ℕ fibre not compact | Checks agree | R01 (headline absent at the head pin) |
| 10 | `strong_morse_inequalities` (carried, ~18) | RP² over ℚ and 𝔽₂; T²; ∅; c=(2,0,0,2), b=(1,0,0,1) | Q=t; Q=0; C=B; 0=0; S₁: −2≥−1 fails | true | none |
| 11 | `bettiNumber` (carried, ~18) | point; RP², j=1; ℕ; S¹, ℝ²∖0, disc | (1,0,…); 0 over ℚ and 1 over 𝔽₂; junk 0; 1, 1, 0 | junk documented | none |
| 12 | §4.2 LS and cup length (carried, ~18) | S¹; T²; RP²; S¹⊔S¹; ∅; point | 2≥2≥2; 4≥3≥3; 3≥3≥3; 4=2+2; 0+1≤0 fails; 1≥1≥1 | nonemptiness stated | none |
| 13 | §4.3 applications (carried, ~18) | S² height; h−h³/3; −f; CP¹; odd m | indices (0,2); Hessians 0; χ=2; 0,2; χ=0 | Checks agree | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints`, changed docstring (recomputed) | h−h³/3 on S^m with u=1−h; S¹, h=cos θ; m=0 two points; one point; h² on S^m; route in Lean | f=1−u−(1−u)³/3=2/3−u²+u³/3, u≈r²/2 ⇒ 2/3−r⁴/4; f′=−sin³θ, f″(0)=−3sin²0·cos0=0, zeros {0,π}, count 2; S⁰={±1}, 2=2; 1≠2; count ⊤ (m≥2), 4 (m=1); composition elaborates with `0<finrank` | true, no nondegeneracy; route coherent | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` (carried, ~18) | h on S¹; m=0 | η²=¾, T>8/3; points ≃ℝ⁰ | true | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` (carried, ~18) | m=0; m=1 co-rotating arcs; equator | S^(−1)=∅, ‖0‖=0≠1; two closed arcs; \|h\|≤√2/2 | true for all m | none |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` (carried, ~18) | two arcs; m=0, a point; X=ℝ^m | ≃S¹; 1 vs #S⁰=2, so `0<m` needed; not compact | true | none |
| 18 | §5.1 Morse–Bott (carried, ~18) | y² vs y⁴; Möbius; RP² filtration | ker=TC vs ℝ²; ℤ/2 vs ℤ; E²=(ℤ,ℤ/2,0) | E¹ convention correct | none |
| 19 | `exists_compactTrapped_gradient_limit` (carried, ~18) | x²; 4dx²; endpoint curve; dim 0; e^(−x) | C=\|x₀\|, c=2; 2\|x₀\|e^(−t/2); \|x₀\|e^(−2t); 0; not trapped | true | none |
| 20 | R01: the docstring and README names (recomputed) | `#check` at a91d3aaf; tree grep at a91d3aaf vs `git grep` at 2fd255d; README code-span-initial `TauCeti.` names; merge-tree | 19 unknown; 0/19 vs 19/19; 8/90 vs 90/90; 2 conflicts | false at the head pin | R01 |
| 21 | R02: Milnor 1959 locator (recomputed) | running heads in milnor-1959 | Théorème 1 under "440" (lines 53, 72); Corollaire 1 under "442" (lines 109, 117); docstring now says p. 440 and p. 442 | correct | repaired |

## Not verifiable

- **`hirsch-differential-topology`, `lee-smooth-manifolds` and `milnor-1963`.** These are uncertified and settled, and cited by locator. They are untouched by this change.
- **Elaboration at main's pins.** I may run Lean only from this worktree, at the head's pins. I read the 2fd255d declarations from the Tau Ceti package's git objects.
- **Ownership against ManifoldOptimization (#1506).** `scratch/overlaps.md` lists it as close in vocabulary, but the brief gives it without files, so I did not check it.

## Source issues

- none
