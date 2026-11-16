# Review of RelativisticQuantumFieldTheory (pull request #1772 at 3708620)

**Verdict:** needs changes

Incremental re-review of 9 changed lines since 4395f35: the new section `## Provenance: existing formalizations outside Tau Ceti` and its entry under References. Both findings are in one sentence group of `README.md` line 5575.

## R01 (P3) — the zero-diagonal carrier is cited at §7.2; §7.1 defines it

**Location:** `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md` line 5575: "Nothing there treats the zero-diagonal carrier and the E0′ growth condition (§7.2), the reconstruction maps (§7.5)".

**Claim:** The locator `(§7.2)` covers both objects, but the zero-diagonal carrier is defined, with its closedness, density and restriction statements, in §7.1; §7.2 defines only the seminorms and E0′ on it.

**Witness:** README line 4477 (§7.1): "Define that space as the closed complex submodule of `𝒮((ℝ⁴)^n,ℂ)` …"; README line 4537 (§7.2, *Needs:*): "§7.1 (zero-diagonal carrier)".

**Repair:** Replace by "Nothing there treats the zero-diagonal carrier (§7.1), the E0′ growth condition (§7.2), the reconstruction maps (§7.5), …".

## R02 (P3) — §0.5 is given as the reason no measure is constructed, and it is not one

**Location:** `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md` line 5575: "No layer here constructs a measure on a space of distributions: §0.5 proves that an infinite-dimensional separable real Banach space carries no nonzero locally finite translation-invariant Borel measure, and Layer 7 works with the Schwinger distributions themselves."

**Claim:** After the colon, the theorem of §0.5 reads as an obstruction to the measure just described. It is none: `muGFF m` is a probability measure, not translation-invariant, on a weak dual that is not a Banach space.

**Witness:** README line 193 (§0.5) says of its own theorem: "This rules out the stated Lebesgue-type carrier, not all random fields or probability measures." `LeanPool/OSforGFF/Measure/Construct.lean` line 141 constructs such a measure.

**Repair:** Replace the sentence by: "No layer here constructs a measure on a space of distributions; Layer 7 works with the Schwinger distributions themselves. The theorem of §0.5 excludes translation-invariant measures of Lebesgue type only and does not bear on the Gaussian measure above."

## Previous findings

- none: the previous report, of `4395f35`, had no finding (its R01 and R02 of the round before were repaired there; the description sentences they concern are unchanged and still agree with this head: 14 theorems, 30 definitions, 14 `sorry` warnings).

## Verified sound

| # | Statement (changed text, line 5575 or 5577) | Instances and computed values (each side) | Result |
|---|---|---|---|
| P1 | `QFT.RPProof.mixed_representation` is the case `f = g` of `reflectedCovariance_eq_inner` (§7.6 item 1) | LeanPool: prefactor `1/(2(2π)³)·1/ω`, exponent `−ω·abs(−x⁰−y⁰) = −ω(x⁰+y⁰)` for positive times. Here: `dμ_m = d³p/((2π)³2ω)`, `K_E` carries `exp(−ωt)` twice. Phases `∓ik·(x−y)` agree under `k ↦ −k`. | agrees |
| P2 | Bessel form `m K₁(m r)/(4π² r)` against the heat form, case `n = 4` of §7.1 | `∫₀^∞ (4πt)⁻² exp(−m²t − r²/(4t)) dt = (1/(16π²))·2·(2m/r)·K₁(mr) = m K₁(mr)/(4π² r)`; LeanPool `freeCovarianceBessel` (`Covariance/Momentum.lean` 443–446) has the same. | agrees |
| P3 | Regularity bound `norm Z[f] ≤ exp((‖f‖₁ + ‖f‖₂²)/(2m²))` | `f` real: `Z = exp(−C(f,f)/2) ≤ 1`. `f = i g`: `Z = exp(C(g,g)/2) ≤ exp(‖g‖₂²/(2m²))` since the multiplier is `≤ m⁻²` (§7.7: `∫G_m = m⁻²`). LeanPool: `c = 1/(2m²)`, `p = 2` (`OS/OS1Regularity.lean` 473–476). | agrees |
| P4 | `minlos_theorem`: separable, sequence of Hilbertian seminorms with Hilbert–Schmidt inclusions | `Minlos/Main.lean` 72–78: `[IsHilbertNuclear E] [SeparableSpace E] [Nonempty E]`, conclusion `∃! μ : ProbabilityMeasure (WeakDual ℝ E)`; class at `Minlos/NuclearSpace.lean` 87–92. Schwartz instance needs `[FiniteDimensional ℝ E] [Nontrivial E]` (`Measure/NuclearSpace.lean` 94–96). | agrees |
| P5 | Coproduct recursion `Δ(T) = T ⊗ 1 + (id ⊗ B)Δ(F)`, `T = B(F)` | `F = ∅`: `Δ(•) = •⊗1 + 1⊗•`. `F = •`: `Δ(B(•)) = B(•)⊗1 + •⊗• + 1⊗B(•)`. `coprodTree` (`ConnesKreimer/Core.lean` 39–41) returns the same lists of terms. | agrees |
| P6 | `CK.eulerian1_idem_ab` over a ℚ-algebra; `Ψₙ = id^{⋆n}`; quotient by commutators | `Core.lean` 1225 `[Algebra ℚ k]`; 2339–2340 `π (e (e x)) = π (e x)`; 1011–1012 `adams n` is the `n`-th convolution power of `id`; 1422–1426 `Hab = RingQuot (commRel k)`; `H = MonoidAlgebra k (FreeMonoid RTree)`, `[CommRing k]` (222–225). | agrees |
| P7 | "on Lean and Mathlib v4.35.0, earlier than the pins here"; "the two below are Apache-2.0" | LeanPool `lean-toolchain`: `v4.35.0`, Mathlib `inputRev` `v4.35.0`; this repository: `v4.36.0-rc2`. LeanPool `NOTICE` lists both projects under "originally licensed under the Apache License, Version 2.0"; file headers say the same. | agrees |
| P8 | What the passage says OSforGFF lacks | 87 files of `LeanPool/OSforGFF` searched: `Wightman` 0 files, `Fock` 0, `semigroup`/one-particle 0, reconstruction only in two docstrings and Hermite coefficients, no coincidence-diagonal carrier, no n-dependent Schwinger bound (`Schwinger/GaussianMoments.lean` proves integrability only). | agrees |

The rows for the roadmap's other statements stand as in the previous review, of `4395f35`.

- LeanPool declarations opened at commit `f8b9b72`: 9 named in the passage (`minlos_theorem`, `muGFF`, `OSforGFF.gaussianFreeField_satisfies_all_OS_axioms`, `QFT.RPProof.mixed_representation`, `QFT.freeCovariance_reflection_positive_bilinear`, `CK.instCKHopf`, `CK.instHabHopf`, `CK.eulerian1_idem_ab`, the Adams operators); all exist with the stated content. The six names `citations.md` lists as found nowhere are these LeanPool names, not this roadmap's.
- Section references in the passage resolved at this head: §0.5, §5.6, §6.18, §6.22, §7.1, §7.2, §7.5, §7.6 items 1–4, §7.7; all exist; one misplaced (R01). `reflectedCovariance_eq_inner` is declared in `Suggested.lean` line 309. "the Bessel form is not stated here": `K₁` occurs nowhere else in the README (only `K₀`, §7.3).
- Shape: a secondary provenance section is provided for by the repository `README.md` (line 342), and main's DerivedDeRhamCohomology has one under the same heading.
- Pull request text against this head: no sentence contradicted (three files, 14 theorems, 30 definitions, nothing outside the folder); no heading or declaration removed, no supplier added (LeanPool is declared not a supplier and nothing is imported).
- Gate rerun at 3708620: every check 0, `OK`, exit 0 (the worker's gate adds `build=0`). Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 14 `declaration uses sorry` warnings, no other line.
- Dependency check: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Overlap check: read NoncompactQuantumSymmetry, QuantumFoundations, LocalVariationalFieldTheory (as in the previous review) and ConstructiveFieldTheoryPhi4 (open; it leaves reconstruction and the free Schwinger distributions to this roadmap, cites §7.1, §7.3 and §7.6, all unchanged, and owns its own `C_c`-indexed probability law); nothing shared. `overlaps.md` lists no other pull request changing this folder and no dropped id.
- Remark on untouched text: "No roadmap consumes a target of this roadmap" (Downstream consumers) predates the open ConstructiveFieldTheoryPhi4, which cites §7.1 and §7.3.
- Source independence: changed passages only; 2 passages compared with 2 sources (the module docstrings of `LeanPool/OSforGFF.lean`, `LeanPool/OSforGFF/Minlos/Main.lean` and `LeanPool/ConnesKreimer.lean`, `LeanPool/ConnesKreimer/Core.lean`), none shared beyond formulas and standard names (longest common run 4 words); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "adaptation is agreed with its authors first" (line 5573): a statement of intent, nothing to check at the head.
- "AI assistance …" and "Closes #1770" in the description: as in the previous review.
- The uncertified and waived sources are cited by locator only, as before; no locator into them changed.

## Source issues

- none

## For the human reviewers

- Scope: two of the most cited sources are course notes: `borcherds-qft` (arXiv math-ph/0204014) and `unsw-qft` (unpublished UNSW notes, waived, cited by page).
- Licence: the description says "verified gpt-6-luna readers supplied Markdown from source images"; which sources were transcribed, and under what licence, is not recorded in the folder.
- Licence: the new section names two Apache-2.0 LeanPool projects. `reflectedCovariance_eq_inner` (`Suggested.lean` line 309) and `QFT.RPProof.mixed_representation` (`LeanPool/OSforGFF/OS/OS3CovarianceRP.lean` line 129) differ in name, binders and form of statement.
- Not tested: arrangement was not compared this round (no layer changed); `unsw-qft` has no text in the sources cache and has not been compared in any round.
