# Review of DGFloer (pull request #1798 at 46cd96a)

**Verdict:** accepted

This is an incremental re-review of the 11 lines changed since 2d41b2a. All of them are in `TauCetiRoadmap/DGFloer/README.md`: one sentence added to the numbering note under Scope and ownership (`:180–183`) and a reworded last bullet of `## Downstream consumers` (`:4483–4486`). Nothing outside the folder changed. There are no findings. The gate passes, the dependency check reports no problem, and `Suggested.lean` (unchanged) elaborates with only its seven `sorry` warnings.

## Previous findings

- R01 — repaired: the description now reads "This pull request depends on #1807 (AlgebraicTopology)" and "#1807 merges before this pull request"; the worker's parser `overlaps.declared_items` returns `[(1807, None)]` on it.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** Rerun on 46cd96a: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also records `build=0`.
- **Dependency check.** `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty (main 4820485). `git diff 2d41b2a..HEAD` touches only `README.md` (8 insertions, 3 deletions).
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244) and nothing else.
- **Suggested.lean.** Unchanged since 334507b. The `#check @name` comparison, the padding probe and the headline list stand from PRREVIEW-DGFloer~27:
  - stated: 1.4, Theorems 5.10/A, 5.15/C and 11.3;
  - named in the module docstring as not statable: Theorems J, K, L and M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion.
- **Citations.** The worker's resolver lists no cross-roadmap citation and no Lean name of the README that is found nowhere.

### The changed passages

**The new sentence of the numbering note** (`:180–183`) sends a citation of Layer 1 item 3 for the filtered-complex spectral sequence itself, its first page, naturality, comparison theorem, or convergence for a finite or an exhaustive filtration, to Tau Ceti's `CochainComplex.spectralSequence` "and the API listed with it (From Tau Ceti)".

- The From Tau Ceti bullet (`:769–784`) lists each of the five objects by name, and each exists at the pinned Tau Ceti under `Algebra/Homology/SpectralSequence/Filtered/`:
  - `CochainComplex.spectralSequence`: `SpectralObject.lean:409`;
  - first page: `spectralSequenceFirstPageXIsoCokernel` (`SpectralObject.lean:425`) and `spectralSequence_first_page_d_eq` (`FirstPage.lean:89`);
  - naturality: `filtrationFunctorMap` (`Naturality.lean:83`);
  - comparison: `isIso_homologyMap_of_isIso_spectralSequence_page` (`Comparison.lean:70`), with hypotheses `F a = G a = ⊥`, `F b = G b = ⊤`, `2 ≤ r`;
  - finite convergence: `filtrationSpectralSequencePageXIsoGradedOfFinite` (`Convergence.lean:118`);
  - exhaustive convergence over `ModuleCat R`: `filtrationSpectralSequencePageXIsoGradedOfExhaustive` (`Exhaustive.lean:177`).
- "which Layer 1 item 3 consumes": 1.3 (`:1137–1146`) consumes exactly these, and its `*Needs:*` line (`:1162–1164`) names them.
- The new sentence does not collide with the note's Stage 5.0 entry (`:172–173`), which covers the homological regrading and the classical and complete convergence theorems. The From Tau Ceti bullet says that decreasing complete filtrations are not at the pin and are Stage 5.0's (`:783–784`). AlgebraicTopology at #1807 agrees: its Stage 5.0 inventory (`:1334–1338`, `:1372`) consumes the same Tau Ceti declarations.

**The reworded Downstream bullet** (`:4483–4486`) excepts MorseTheory M5 from the citations that resolve to AlgebraicTopology.

- MorseTheory on main (`:885`) and at #1682 (`:1411`) cites Layer 1 item 3 for the "generic filtered-complex `SpectralObject`", then its spectral sequence, naturality and finite convergence. All four are in the Tau Ceti list above, so the bullet's example is correct.
- This is MorseTheory's only DGFloer citation on main, so dropping it from the list of citers that resolve to AlgebraicTopology is correct.
- The other citers of Layer 1 item 3 found by `roadmaps grep` resolve through the note as it now stands:

| Citation | Object cited | Resolves to |
| --- | --- | --- |
| AlgebraicTopology on main `:922` | filtered-complex API | Tau Ceti |
| DeformationAndDerivedPatchingAlgebraPartII `:681` | convergence and the filtration on total cohomology | Tau Ceti (`filtrationAbutmentIso`, abutment filtration) |
| ArithmeticStatisticsPartVIII `:27`, `:901` | the spectral sequence; convergence for an exhaustive filtration bounded below in each degree | Tau Ceti; Stage 5.0 classical convergence |
| StableHomotopyKTheory `:913` | first-quadrant double-complex sequence | Tau Ceti; Stage 5.0 adapters |
| DGFloerPartII `:1132` | Layer 1 item 3 | 1.3, which keeps its number |

**The description** was updated to match: "a citation of Layer 1 item 3 for the spectral sequence of a filtered complex itself reaches Tau Ceti's `CochainComplex.spectralSequence`, which Layer 1 item 3 consumes." This agrees with the head.

**Remarks** (no change requested).
- The generated `merge-order` block still reads "No open pull request must merge before this one", and the pull request's labels are `awaiting-review` and `roadmap-worker`. The block and the label are computed by the tooling from the description, which now declares #1807 in a form the parser reads; they change when the tooling next regenerates them. Until then, an approver should read the author's **Merge order.** paragraph, not the block.
- The generated `roadmap-summary` block still says that AlgebraicTopology and others "consume its fibrations, spectral sequences, homology comparisons and Serre classes". It is unchanged text that earlier reviews passed.

### Adversarial table

Rows computed this round, for the changed statements:

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Note: Layer 1 item 3's filtered spectral sequence, first page, naturality, comparison, finite and exhaustive convergence resolve to Tau Ceti | the 5 named objects against the pin | 7 declarations found, 0 missing (files and lines above); the exhaustive form is over `ModuleCat R`, as `:778–779` says | holds |
| Note: Tau Ceti entry against the Stage 5.0 entry | two-step filtration `0 ⊆ F₀ ⊆ F₁ = K`; complete decreasing filtration | two-step: `F₋₁ = ⊥`, `F₁ = ⊤`, so the finite theorem applies and `E^∞_{(p,q)} = F_{q+1}H/F_qH` for `q = −1, 0`; complete decreasing: no pinned declaration, Stage 5.0 only | entries disjoint |
| First-page convention quoted with the entry | page 2 at `(p, q)` | object `H^{p+q}(F_{q+1}/F_q)`, differential to `(p + 2, q − 1)`: total degree `p + q + 1`, filtration index down by 1; agrees with `FirstPage.lean:93` | holds |
| Downstream bullet: MorseTheory M5's citation resolves to Tau Ceti | MorseTheory `:885` on main, `:1411` at #1682 | 4 objects cited (spectral object, sequence, naturality, finite convergence); 4 of 4 in the Tau Ceti list; 0 need Stage 5.0 | holds |
| Downstream bullet: remaining citers of Layer 1 item 3 | 5 contexts (table above) | 5 of 5 reach a note entry | holds |

Rows for every untouched statement are carried from PRREVIEW-DGFloer~30, which records the computed values for the sampled targets 1.6, 4.1, 5.2, 5.6, 6.0, 6.1, 6.3, 7.1, 8.2, 8.6 and 11.3, the Lean headlines 1.4, 10.5 and 11.3, and the rows it carried from ~22, ~23 and ~26–~29. A selection, each citing that report:

| Statement | Instances | Values computed (PRREVIEW-DGFloer~30 and the reports it cites) | Result |
| --- | --- | --- | --- |
| 1.3 regradings | `(p, q)`; `G_t = F^{−t}` | `(a, b) = (1 − 2p − q, p − 1)`; `a + b = −(p + q)` | holds |
| 1.3 negative control | `F_p C = C` for all `p` | every `E^r = 0`, `H(C) ≠ 0` | holds |
| 1.4 mod-2 vanishing (Lean) | `pt`; `M(ℤ/3, 2)`; `S³` | trivial; `2·2 ≡ 1 (3)`; `H₃(S³; 𝔽₂) ≠ 0` excluded | holds |
| 1.6 local sections | two points; `S¹ ⊔ S²` | `O = M`, `H = {id}`; `O = S¹`, empty fibre over `S²` | holds |
| 4.1 Brown resolution | `S¹`; zero cocycle | `H₀ = A`, `H₁ = 0`; `H₀ = A[t^{±1}] ≠ A` | holds |
| 5.2 cocycle on `S¹` | height function | `d = 1 − t` gives `H₀ = ℤ`, `H₁ = 0` | holds |
| 5.6 cut | `Q = S¹`, `r = 1` | `𝓛¹ = S¹`; duration `1` gives `0 ≠ 1` | holds |
| 6.0 conventions | `(ℝ², dq ∧ dp)` | `X_q = −∂_p`, `X_p = ∂_q`, `{q, p} = 1` | holds |
| 6.1 Checks | `p²/2`; `(|q|² + |p|²)/2` | `ι_{p∂_q}(dq ∧ dp) = p dp`; eigenvalues `e^{±i} ≠ 1` | holds |
| 6.3 magnetic translation | `σ = x dy` | `Ψ'^*λ_can = λ_can − π^*σ` | holds |
| 6.4, 6.5 rescaling and Corollary E Check | `α = ½α₀`; `S*Q`, `α = fα₀` | `f = 2`; `|P| = f`, `K = 1` | holds |
| 7.1 CZ normalization | `ε(q² + p²)/2` | `CZ = +1 = n − ind` | holds |
| 8.2 Check | small Morse `H` | Morse cocycle of `−H` | holds |
| 8.3, 8.4, 8.7 | `𝓕 = L[0]`; `⊕ ℤ[k]` on `D²ⁿ` | `E²_{p,q} = 0` for `q ≠ 0`; Künneth gives `0` | holds |
| 8.6 grading | `T²`, `n = 1` | `CZ = 1, 0, 0, −1` to `H₂`, `H₁` (rank 2), `H₀` | holds |
| 9.2 Viterbo with local coefficients | `ℝP²` | `η₀ = σ`; `H₂(ℝP²; o) = ℤ`, `H₂(ℝP²; ℤ) = 0` | holds |
| 10.5 Thms 5.10, 5.15, A, C (Lean) | `π₃ = ℤ/3`; `ℝP⁴` | `a² = a⁻¹ ≠ 1`; `H₃(ΩS⁴; 𝔽₂) = 𝔽₂` | holds |
| 11.3 torus criterion (Lean) | `T^r`; `SO(3)`; `∏_ℕ S¹` | both sides true; `π₃ = ℤ`; excluded by `LieGroup` | holds |

### Sources

- The changed passages have no source locator, and the README flags none as unverified.
- None of the seeded targets falls in the changed passages; their rows and locators stand from PRREVIEW-DGFloer~30 and the reports it cites.

### Overlaps and ownership

- **Overlap check.** It lists #963 as the only other open pull request changing this roadmap; the description orders it after this one. It lists no id this README cites that an open pull request drops, none that only an open revision defines, and no dropped id that others cite.
- **Ownership against open pull requests.** Not searched again: the change adds no construction, only a resolution of existing citations to a pinned declaration.

## Not verifiable

- Nothing new in the changed passages.
- Carried from the previous reports:
  - Weibel 5.5.1(2) and 5.5.10 (1.3);
  - Serre 1951 and 1953 (1.2, 1.4);
  - the texts settled as uncertified: Palais 1960 (1.6), Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead and Hofer–Salamon.

## Source issues

- none
