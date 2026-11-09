# Review of MorseTheory (pull request #1682 at 431f9d5)

**Verdict:** needs changes

This is an incremental re-review. Since 9506fc5, 5 lines of the folder have changed, all in the References list of `README.md`:

- a Lee bullet is added (Corollary 5.14 and Proposition 5.38, for §2.1);
- the Math240 homework bullet is deleted.

`Suggested.lean` is unchanged, and nothing outside the folder changed.

One finding remains. R01 (P1) carries over from the previous report, which re-raised H01: the branch still pins Tau Ceti a91d3aaf, where most of the library the README consumes does not exist. The new Lee bullet is correct as a reference. However, the theorem it supports, `TauCeti.exists_regularFiber_smoothEmbedding`, is one of the names missing at that pin, so the new bullet is one more instance of R01. The previous R02 is repaired.

## R01 (P1) — Branch not merged with main: the Tau Ceti library that the README and `Suggested.lean` consume is missing at this head's pin

Re-raised: H01

**Location.**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:22`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated".
- `README.md:38–39`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6".
- The changed bullet at `README.md:1550–1552`: "Corollary 5.14 and Proposition 5.38, for the regular-fibre atlas consumed in §2.1".

**Claim.** The README defers its Layer 1–4 and Layer 6 targets to Tau Ceti declarations, and it builds the proof routes of its own §4.4 targets on Tau Ceti inputs. At the pin that this head builds against, most of those declarations do not exist, so the deferred targets have no owner. The new reference bullet adds one more such case. The regular-fibre atlas it attributes to Lee, `TauCeti.exists_regularFiber_smoothEmbedding` (cited at `README.md:199` and `:593`), is absent at the pin: there is no `Geometry/Manifold/RegularValue/` directory at a91d3aaf.

**Witness.** `lake-manifest.json` pins Tau Ceti a91d3aaf, while main (1bea835) pins 2fd255d. `git ls-tree a91d3aaf TauCeti/Geometry/Manifold/RegularValue` is empty. At 2fd255d the theorem is `RegularValue/ManifoldLevel.lean:257`, which cites Lee Corollary 5.14 and Proposition 5.38 at `:42–43`.

**Detail.**
- **Pins and merge state.** These are unchanged since the previous report:
  - this head pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3;
  - `origin/main` 1bea835 pins Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2;
  - the merge base is still ffcc9d31;
  - `git merge-tree --write-tree origin/main HEAD` still reports CONFLICT in `TauCetiRoadmap/MorseTheory/README.md` and `TauCetiRoadmap/MorseTheory/Suggested.lean`.
- **Name counts.**
  - My regex extracts 90 distinct `TauCeti.`-prefixed spans from the README this round. This includes a few module paths, against 88 declaration names the previous report counted.
  - Of these, 14 have a declaration with that final component at a91d3aaf and 90 at 2fd255d (`git grep` over the Tau Ceti package's objects).
  - `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf: `Basic.lean`, `Index.lean`, `Prod.lean` and `Sphere`.
  - Every finding of the previous R01 about the 17 docstring names and the four §4.4 inputs still holds, since `Suggested.lean` and those *Needs:* lines are untouched.
- **Why the gate passes.** The four modules that `Suggested.lean` imports exist at both pins. Its eight statements spell the critical set and the gradient by their bodies, so they need nothing else.
- **Pull-request text.** The title is still "Add Palais–Smale compactness and nonproper gradient convergence". The description still announces `PalaisSmaleTargets.lean`, which the folder does not contain, and `README.md:74–79` excludes Palais–Smale theory.

**Why H01's reason does not settle it.** The repair report's reason is that only a merge of `origin/main` repairs this, and a repair of the two roadmap files cannot do that. That is right about who must act. But the merge still has not happened: the pins, the merge base and the conflicts are as they were. So the supplier contract is still false at the pin that the build and the gate use. The repairs in this round, a References bullet citing a theorem absent at the pin, cannot change that.

**Exact repair (worker or human).**
1. Merge `origin/main` into the branch. Resolve `README.md` and `Suggested.lean` to this head's text, and take main's `PROGRESS.md` and `STATUS.md`. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. Apply the respelling that the repair report calls H05:
   - add the imports `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write `TauCeti.criticalPoints I f`, `TauCeti.totalCriticalCount I f = 2` and `-TauCeti.Manifold.mgradient I f x`;
   - delete `Suggested.lean:19–20`.
3. Re-elaborate the file and re-run the gate at the new pins.
4. Replace the pull-request title and description with ones that describe the roadmap as it stands.

**Tested on the refuting instance.** At 2fd255d, `exists_regularFiber_smoothEmbedding` is declared at `ManifoldLevel.lean:257`. Its hypotheses match `README.md:199–205`:
- `1 ≤ m`, a `ContMDiff I J m f`, an interior value and `IsRegularValue`;
- the conclusion gives an atlas modelled on `Fin (finrank E − finrank F) → ℝ`, a smooth-embedding inclusion and tangent range equal to `ker (mfderiv I J f z)`;
- there is no separation hypothesis.

The other names are as counted under Detail. I cannot elaborate at main's pins from this worktree.

## Previous findings

- **R01 — not repaired.** `lake-manifest.json` still pins TauCeti `a91d3aafa8cd`, and the merge base is still ffcc9d31. `Suggested.lean:22` still reads "are proved at the pinned Tau Ceti and are consumed, not restated". This is R01 above.
- **R02 — repaired.** The Thomas Mark Math240 bullet is gone: `grep -n "Math240\|Mark,\|Homework"` over the folder finds nothing. The References list now has 8 entries, one per manifest key. The repair introduced no new problem: no target, Check or example cited the deleted bullet.

## Verified sound

### The changed passage (`README.md:1550–1552`)

- **The bullet against the manifest.** The new bullet reads: Lee, *Introduction to Smooth Manifolds*, 2nd ed. (2012), Corollary 5.14 and Proposition 5.38, DOI 10.1007/978-1-4419-9982-5. The manifest entry `lee-smooth-manifolds` agrees on every field:
  - `doi = "10.1007/978-1-4419-9982-5"`;
  - `locator = "Corollary 5.14 and Proposition 5.38"`;
  - `year = 2012`;
  - `cited_for = ["2.1"]`;
  - `status = "uncertified"`.
- **The bullet against the README.** The locator is the same one the README already gives at the claim: `README.md:199–200` in the Tau Ceti contract and `README.md:593–594` in §2.1, under `### 2.1 Scalar levels and regular boundary faces` at line 579. So the bullet adds no new claim. Saying "consumed in §2.1" is accurate, since §2.1 consumes the theorem rather than owning it.
- **The bullet against Tau Ceti.** Tau Ceti's own docstring at 2fd255d (`RegularValue/ManifoldLevel.lean:42–43`) gives the same Lee locator for the same theorem.
- **References versus manifest.** The 8 References entries are Milnor 1963, Cohen–Iga–Norbury, Milnor 1959, Brown, Nicolaescu, Hirsch, Lee and Weber. They are exactly the 8 manifest ids:
  - `milnor-1963`, `cohen-iga-norbury`, `milnor-1959`, `brown-1960`;
  - `nicolaescu-invitation`, `hirsch-differential-topology`, `lee-smooth-manifolds`, `weber-conley`.
- **Anchor mapping.** The dropped anchors that `scratch/overlaps.md` lists are still mapped old → new at `README.md:463` (`#m2-…`) and `:467` (`#m5-…`), so HeegaardFloer's main lines 647 and 1064 keep resolving. `scratch/overlaps.md` reports no other open pull request changing this roadmap and no cited id dropped elsewhere. `scratch/citations.md` reports no cross-roadmap citation and no Lean name found nowhere.

### Gate, dependency check, elaboration

- **Gate.** I re-ran it on this head: all checks are 0 and it prints `OK`. `scratch/gate.md` (the worker's run) also shows `build=0`. The worktree is clean afterwards.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` prints only seven `declaration uses sorry` warnings, at lines 78, 104, 119, 134, 155, 169 and 183.
- **Unchanged checks.** `git diff --stat 9506fc5 HEAD` touches only `README.md`. So the previous report's `#check @name` signature comparison (8 declarations, no lost binder) still applies, and so does its one-tactic probe (all 7 theorems fail it, so there is no padding).
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.

### Seeded sample

The change falls only on §2.1's reference, and the locator there is Lee, which is uncertified (see Not verifiable). The other 14 sampled targets are untouched. The previous report verified them against cohen-iga-norbury, nicolaescu-invitation, weber-conley, milnor-1959 and brown-1960, and this report carries them forward.

### Adversarial table

Rows 1–19 cover statements the diff leaves untouched. They are carried forward from the previous report (PRREVIEW-MorseTheory~20, rows 1–19), with the values shown there. Rows 20–22 were computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; `𝓡∂ 1` | df=(1,0)↦(1,0); range I=[0,∞)≠univ, so not boundaryless | carried (r20 row 1) | R01 |
| 2 | §1.2 Hessian, counts, complementary index | −x²+y²; f=0 and x² on ℝ | diag(−2,2), λ=1; 0+0≠1 for f=0, 0+1=1 for x² | carried (r20 row 2) | none |
| 3 | §1.3 normal form and chart-change seminorms | x³−tx; τ(y)=y/2 | t=−1 gives no root, t=3 gives x=±1; C=2^k | carried (r20 row 3) | none |
| 4 | §2.1 levels and faces | f=x on ℝ²; x² at 0; f=x on [a,b] | ker df=span e₂; df(0)=0, not regular; df(outward)=+1 at b and −1 at a | carried (r20 row 4) | none |
| 5 | §2.2 restriction, rescaled field, handles | x² band [1,4]; metric 2dx² | X=−1/(2x), time 3; −∇f=−x | carried (r20 row 5) | none |
| 6 | §2.3 chart change | (x²−1)², c=1, ε=½ | α(1)=±0.5412; {f≤½} has 2 components | carried (r20 row 6) | none |
| 7 | `exists_morseCWModel` | S² height; f=x on ℝ | cells (1,0,1); X=∅≄ℝ, excluded by `BddBelow` | carried (r20 row 7) | none |
| 8 | §3.1 strong topology | e^(−x²) vs 0.01 | fails for \|x\|>2.146 | carried (r20 row 8) | none |
| 9 | §3.2 proper Morse bounded below | x² with \|g−f\|<1; constant on ℕ | {g≤b}⊆{x²≤b+1}; fibre ℕ not compact | carried (r20 row 9) | R01 |
| 10 | `strong_morse_inequalities` | S², c=(2,1,1); c=(2,0,0,2), b=(1,0,0,1) | Q=1; S₁: −2 vs −1, which fails | carried (r20 row 10) | none |
| 11 | `bettiNumber` | RP², j=1; ℕ discrete | 0 over ℚ, 1 over 𝔽₂; junk 0 | carried (r20 row 11) | none |
| 12 | §4.2 LS bound | T²; S¹⊔S¹; ∅ | 4≥3≥2+1; 4=2+2; 0+1≤0 fails | carried (r20 row 12) | none |
| 13 | §4.3 applications | odd m; CP¹ | χ=−χ, so 0; indices 0 and 2 | carried (r20 row 13) | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3; x·e^(−x²) on ℝ | Hessian 0; 2 zeros, ℝ≄S¹ | carried (r20 row 14) | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | h on S¹; T² | T>8/3; LS 3>2 | carried (r20 row 15) | R01 |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; equator | S^(−1)=∅; band \|h\|≤√2/2 | carried (r20 row 16) | R01 |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | m=0; X=ℝ^m | 1 vs 2, so `0<m` needed; not compact | carried (r20 row 17) | R01 |
| 18 | §5.1 Morse–Bott | y² vs y⁴; RP² filtration | ranks (0,1) vs ker ℝ²; E²=(ℤ,ℤ/2,0) | carried (r20 row 18) | none |
| 19 | `exists_compactTrapped_gradient_limit` | x²; e^(−x) | \|x₀\|e^(−2t); not trapped | carried (r20 row 19) | none |
| 20 | New Lee bullet (`README.md:1550–1552`) vs manifest and §2.1 | manifest fields; README lines 199 and 593; Tau Ceti docstring at 2fd255d | DOI equal, 5.14/5.38 = 5.14/5.38 (×3), cited_for [2.1] = "§2.1", year 2012 = 2012 | consistent | none |
| 21 | Regular-fibre theorem the bullet supports, at both pins | `ls-tree` of `RegularValue/`; `git grep` | a91d3aaf: 0 files, 0 declarations; 2fd255d: `ManifoldLevel.lean:257`, hypotheses m≥1, interior c, regular c, model `Fin (dim E − dim F) → ℝ` | absent at head pin | R01 |
| 22 | R01 and R02 status | `lake-manifest.json`; merge-base; merge-tree; grep "Math240"; 8 references vs 8 manifest ids | a91d3aaf vs 2fd255d; ffcc9d31; 2 conflicts; 0 hits; 8=8 | R01 open, R02 repaired | R01 |

### Remarks on untouched text

None.

## Not verifiable

- **lee-smooth-manifolds** (Corollary 5.14 and Proposition 5.38). It is uncertified and settled, cited by locator only, so I did not read it. That is the only locator of the changed passage and of sampled §2.1.
- **milnor-1963 and hirsch-differential-topology.** Both are uncertified and settled, and neither is touched by the change.
- **Elaboration at main's pins.** I may run Lean only from this worktree, at the head's pins. I read the Tau Ceti declarations at 2fd255d from the package's git objects.
- **Ownership against ManifoldOptimization (#1506).** `scratch/overlaps.md` lists it as close in vocabulary, but the brief gives it without files, so I did not check it. The change does not touch ownership.

## Source issues

- none
