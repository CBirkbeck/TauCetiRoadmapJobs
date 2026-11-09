# Review of AlgebraicKTheory (pull request #1142 at a668252)

**Verdict:** accepted

This is an incremental re-review of the 6 lines of `TauCetiRoadmap/AlgebraicKTheory/` that changed since 2dc9ef4, the head the previous review (PRREVIEW-AlgebraicKTheory~15) read. All six are in `README.md` (:511, :529, :770); `Suggested.lean` is unchanged. The pins are Mathlib 1b1ccf4 and Tau Ceti 2fd255d.

- The one previous finding is repaired, and the repair introduces no new problem.
- The gate passes, the dependency check reports 0 problems, and nothing outside the folder changes.
- There are no findings.

## Previous findings

- R01 — repaired: 4.4 (:511) now reads "the equality d(X)=d′(X) is part of Theorem 5, p. 20, where for nonempty X both are the stable rank of C(X,ℝ) minus one; for X=∅ both are ∞ … while C(∅,ℝ) is the zero ring".

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** Rerun at this head with `--base origin/main`; it exits 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Dependency check.** The required command printed exactly `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0 with 21 "declaration uses `sorry`" warnings and nothing else, the same as at 2dc9ef4.
- **Signatures and padding probe.** `git diff 2dc9ef4 a668252` touches only `README.md`, so the `#check @` audit of all 41 declarations and the one-tactic probe (21 of 21 not closed) of the previous report stand unchanged. No declaration, binder or docstring changed.

### The three changed passages

1. **4.4 (:511), the repaired clause.** It now asserts the equality with sr(C(X,ℝ))−1 only for nonempty X, and for X=∅ only d(∅)=d′(∅)=∞. Both parts are checked against the source's definitions:
   - vaserstein-1971 lines 114–119: 0 is an unstable value when a nearby map misses 0 (condition (a)). A map out of ∅ misses 0 itself, so 0 is a stable value for no d, including d=0.
   - lines 138–141: d(X)=∞ when no d qualifies.
   - lines 157–159 and 163–166: a map to Sᵈ is inessential when a map to the equator agrees with it on the preimage of the equator, and d′(X)=∞ when no essential map exists. Out of ∅ the empty map to Sᵈ⁻¹ always exists (for d=0 it is ∅→∅), so no map is essential.
   - The clause agrees with the untouched 4.4 Check at :523 (d(∅)=∞, formulas read for nonempty X) and the 4.5 Check at :538.
2. **4.5 (:529), a seeded-sample target.** The locator sentence now says Theorems 5 and 7 are "correct as stated for nonempty X only, since d(∅)=∞ while C(∅,𝕜) is the zero ring".
   - Theorem 5 (lines 167–170) is stated for any topological space and gives sr=d(X)+1=d′(X)+1 for the ring of real functions (and of bounded ones).
   - Theorem 7 (lines 179–186) is stated for any topological space and gives sr(C(X,ℂ))=[d(X)/2]+1.
   - At X=∅ each right side is ∞ and each ring is the zero ring, of finite stable rank. So the added qualification is accurate for both theorems, and the page (printed p. 20, cache page marker 4) is right.
   - The two equivalences `hasStableRangeLE_continuousMap_complex_iff` and `hasStableRangeLE_continuousMap_real_iff` are unchanged. They hold at X=∅ independently of Vaserstein, as the sentence and the last Check say.
3. **References (:770).** The Vaserstein entry gains "each correct for nonempty X (at X=∅, d(∅)=∞ while C(∅,𝕜) is the zero ring)", consistent with 1 and 2. Theorem numbers and pages are as before.

No changed passage names a supplier, a section number of another roadmap or a library declaration, so no cross-roadmap citation or pinned declaration needed re-resolving this round. Those resolved in the previous report (3 Mathlib declarations, 2 Tau Ceti declarations, 3 consumer roadmaps) are in untouched text. `roadmaps overlaps` lists no open pull request that changes this roadmap or drops an id it cites. The two module-path leads of `roadmaps resolve` (`Mathlib.LinearAlgebra.Matrix.ElementaryRowOperations`, `TauCeti.Algebra.Module.Projective.FreeComplement`) are false positives: both files exist at the pins, as the previous report recorded.

No README locator is flagged as unverified.

### Adversarial table: changed statements (computed this round)

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 4.4: d(X)=d′(X)=sr(C(X,ℝ))−1 for nonempty X | point; [0,1] | point: d=0 (the constant map to ℝ⁰ is stable, a map to ℝ¹ is perturbed off 0), d′=0 (S⁻¹=∅, no map from a point to ∅), sr(ℝ)−1=0. [0,1]: d=1 (x−½, IVT), d′=1 (the half-circle Check at :522), sr−1=2−1=1 | True |
| 4.4: for X=∅ both are ∞, C(∅,ℝ)=0 | X=∅, d=0 and d≥1 | d: the empty map misses 0, so no stable value for any d, giving ∞. d′: the empty map ∅→Sᵈ⁻¹ exists for every d≥0, so nothing is essential, giving ∞. The zero ring has every stable range (:538) | True; the clause no longer equates ∞ with a finite rank |
| 4.5: Theorems 5 and 7 correct for nonempty X only | X=∅; point; S² | ∅: d+1=∞ and [d/2]+1=∞ against the zero ring, so both theorems fail there. Point: 0+1=1=sr(ℝ), [0/2]+1=1=sr(ℂ). S²: [2/2]+1=2, matching the Check at :537 | True |
| 4.5: both equivalences at X=∅ | s=1 | left: the zero ring has stable range ≤1, true. Right: the empty space satisfies `HasCoveringDimensionLE ∅ 1` and `… 0`, true | True; unchanged statement |

### Adversarial table: untouched statements (rows carried from PRREVIEW-AlgebraicKTheory~15)

| Statement | Values (previous report) | Result |
|---|---|---|
| `steinbergRels`, perfectness, `stableTransvection` | St₂ free product; [x₀₂(a),x₂₁(1)]=x₀₁(a); [[1,a],[0,1]] stabilizes to 1+aE₀₁ in GL₃ | Correct |
| `steinberg_universalCentralExtension` | R=0: all groups trivial; ℤ: ψ=id, (φ,pr) excluded as St(ℤ)ᵃᵇ=0 | True |
| `kTwo_finiteField` | 𝔽₂, 𝔽₃, 𝔽₄: 0; control ℚ: {−1,−1}≠1 | True |
| `MatsumotoGroup`, `matsumoto` | 𝔽₅: 2+4=1 and 3+3=1 kill ℤ/4; ℝ: (−1)⊗(−1)≠0; det 1 so lifts exist | True |
| 4.4 bridge (both directions), compactness step, 3.2.E reading | [0,1], a=x−½: stable and essential; control [−1,1) misses only a boundary point | True |
| 7.1 clutching, Conventions on Mathlib proposal 44734 | D²∪D²=S²; D²/S¹ not an embedding; closed, unmerged | Correct |
| `kZero_divisionRing`, `kZero_int`, `kZeroMap`, `extendScalarsCompIso` | [D²]↦2; control ℤ[√−5]: ℤ⊕ℤ/2; [ℤⁿ]↦[ℚⁿ]; twist by 2 fails in 𝔽₅ | True |
| `tangentSections_stablyFree_not_free`, `mobiusSections`, `mobiusSections_order_two` | rank 2 on S²; ρ(0)=diag(1,−1); det B antiperiodic has a zero | True |
| `kOneMap`, `kOne_divisionRing`, `kOne_int`, `dieudonne_determinant` | [−1]↦[4]; ℍ: (i)↦1; e₁₂(5)↦1; 𝔽₃, n=2: 48/24=2 | True |
| `HasStableRangeLE`, `surjective_stability`, `injective_stability` | s=0 gives 1=0; GL₃(ℤ)=GL₂(ℤ)SL₃(ℤ); diag(i,1)∈E₂(ℍ) | True |
| `hasStableRangeLE_one_of_isSemisimpleRing`, `hasStableRangeLE_of_ringKrullDim_le` | 𝔽₂[x]/(x²); ℤ: ≤2, not ≤1 | True |
| `HasCoveringDimensionLE` | [0,1], d=0 fails; Hilbert cube | Correct |
| `hasStableRangeLE_continuousMap_complex_iff` / `_real_iff` | S², s=1,2: false/false, true/true; [0,1] real: false/false, true/true | True; `1≤s` needed |
| `milnor_patching`, `kZero_mayerVietoris_exact`, `kOne_mayerVietoris_exact` | control ℤ→ℚ←ℤ; ℤ→𝔽₅←ℤ: ker g₁={±(1,1)} | True |
| `kZero_arithmeticSquare`, `kZero_cuspSquare`; 3.2/3.3, 6.3 Checks | coker ≅ℤ/2; ≅ℤ/5; δ(4)=−δ(2) in ℤ/3 | True |

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*.** Both are settled as uncertified and were not read. No changed passage rests on them.

## Source issues

- **Error** in vaserstein-1971 at Theorem 5, printed p. 20: the source states sr=d(X)+1=d′(X)+1 for the real function ring of every space, but d(∅)=d′(∅)=∞ while C(∅,ℝ) is the zero ring; it should assume X nonempty; affects a stated result.
- **Error** in vaserstein-1971 at Theorem 7, printed p. 20: the source states sr(C(X,ℂ))=[d(X)/2]+1 for every space, but d(∅)=∞ while C(∅,ℂ) is the zero ring; it should assume X nonempty; affects a stated result.
