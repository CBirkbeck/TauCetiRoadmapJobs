# Review of SelmerIwasawaCohomology (pull request #3177 at 5a08539)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 2 changed lines since `7e8e228`. The change is one sentence added to §2.1, saying that the Galois cohomology groups entering Selmer data are Mathlib's `continuousCohomology` with its `R`-module structure, citing two ProfiniteCohomology conventions that this pull request adds; the sentence was checked against those conventions at this head, the pinned Mathlib and Tau Ceti, the rest of this README, the supplier ArithmeticGaloisDuality and the Mazur–Rubin definitions §2.1 cites. Accepted: no findings, no small corrections, no format notes; one licence question on untouched text is left for the human reviewers.

## Previous findings

The previous review (of the pull request that added the roadmap, at `8e1b4ae`) was an acceptance with no open finding; its R01–R03 were recorded there as repaired. Nothing to re-check.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §2.1 new sentence: the cohomology modules are `continuousCohomology` with an `R`-module structure | Type of the Mathlib object at the pin | `continuousCohomology (n : ℕ) (A : TopRep k G) : TopModuleCat k`: a `k`-module by type; `Suggested.lean` line 73 already uses it `≃ₗ[ℤ_[p]]`. | True; none. |
| Same, compact `T` and rational `V` | `T` finite free over `O`, `V = T ⊗ E` with p-adic topologies | `O × T → T` and `E × V → V` continuous, so `TopRep O G`, `TopRep E G` objects exist; cited convention covers `X : TopRep R G` (ProfiniteCohomology README line 94). | Citation supports the sentence; none. |
| Same, discrete `A = V/T` over `R = O` | `a ∈ A` with `λ^m a = 0` | `{r : r·a = b}` is a union of cosets of `λ^m O`, open: `ContinuousSMul O A` holds. Convention's counterexample (ℝ on discrete ℝ) does not arise. | `TopRep O G` form exists; instance form agrees; none. |
| Same, against the real-place modified groups of Conventions | `G_v = C₂`, `T = ℤ₂` trivial | Ordinary `H⁰ = ℤ₂`, Tate `Ĥ⁰ = ℤ₂/2`; `H¹ = Hom(C₂, ℤ₂) = 0 = Ĥ¹`. Degree-one Selmer data unaffected; sentence is conditional on "Galois cohomology groups". | No contradiction; none. |
| Same, against the supplier of §2.1's next line | ArithmeticGaloisDuality Conventions, *Cohomology* (README line 66) | Supplier: `Hⁱ(G, M)` is `continuousCohomology i M`, module structure an instance, no third theory. Head sentence: same object, no separate `R`-linear cohomology. | Agree; none. |
| Same, degenerate | `M = 0`; `G` trivial, `M = ℤ_p` | `Hⁱ = 0` for all `i`; trivial `G`: `H⁰ = ℤ_p`, `H¹ = 0`. `Sel = H = 0`, resp. `H¹`-level `Sel = 0`. | Consistent with §2.1 Checks; none. |
| §2.1 Selmer data and its Checks (cited by the changed text) | `ι = ∅`; all relaxed; all strict; `H = ℤ_p`, one place, `res = id` | Empty: `Sel = H`. Relaxed: `ker(H → 0) = H`. Strict: `⋂ ker res_v`; with `res = id`: strict `0 ≤` any `L ≤` relaxed `ℤ_p`. | Checks true; none. |
| §2.1 locators, Mazur–Rubin Definitions 1.1 and 2.1 | Text at the locators | Def. 1.1 at printed p. 4 (MazurRubin2013 line 156): local condition = `R`-submodule of `H¹`; Def. 2.1 at p. 6 (line 237). Cohomology by continuous cochains (lines 154–155). | Locators and carrier agree; none. |
| §2.2 (sampled; uses §2.1's data) | Mazur–Rubin Def. 2.1 | Selmer module as kernel into the sum of `H¹/H¹_F` over `Σ(F)` at p. 6 (lines 243–249); README's `ker(H → ∏ H_v/L_v)` same for finite `Σ`. | Agree; none. |
| §2.3 (sampled; uses §2.1's data) | Mazur–Rubin Def. 2.3 and (2.4); `L = L'` | Def. 2.3 at pp. 6–7 (lines 270–286), (2.4) at p. 7 (line 292), left exact only. `L = L'`: quotient `0`, `Sel_L = Sel_{L'}`. | Agree; none. |

- Source locators checked against the text: 4 (Mazur–Rubin Definitions 1.1, 2.1, 2.3 and display (2.4), arXiv v1).
- Library declarations opened at the pin: `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`); `TauCeti.ofDiscreteModule` (`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:223`); `restrictScalarsIntIso` and `ofDiscreteModuleRestrictScalarsIntEquiv` (`TauCeti/RepresentationTheory/Homological/ContCohomology/RestrictScalars.lean:304`, `:656`).
- Cross-roadmap citations resolved: 2 new (ProfiniteCohomology Conventions, *Cohomology objects* and *Coefficient rings*, at `TauCetiRoadmap/ProfiniteCohomology/README.md` lines 92 and 109 of this head, added by this pull request); EllipticCurves Layer 7 and ArithmeticGaloisDuality Layer R02.1, cited by the same paragraph, read on main and at this head.
- Record: the README at the merge base and the head have the same 5 layers and the same headings; 0 Lean declarations removed, added or restated; `Suggested.lean` is unchanged.
- Automatic checks at this head: all passed. Elaboration of `Suggested.lean` with `lake env lean`: 6 `sorry` warnings (lines 73, 102, 122, 196, 202, 223), nothing else. No one-tactic probe was run, the Lean file being unchanged.
- Dependency check: `depcheck: 100 roadmaps, 1130 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Files changed outside the folder: only the READMEs of ArithmeticGaloisDuality, ClassFieldTheory and ProfiniteCohomology, which are this pull request's own; nothing else.
- Pull request text: the title and the one sentence about this folder ("SelmerIwasawaCohomology 2.1 … gain one sentence citing the conventions", "No `Suggested.lean` changes") agree with the head; it states that it revises roadmaps on main; no supplier is added (ProfiniteCohomology was already one).

Overlap check: read ArithmeticGaloisDuality, EulerSystemsAndKolyvaginSystems, NoncommutativeAndEquivariantIwasawa (and ProfiniteCohomology and EllipticCurves Layer 7, which the changed paragraph cites); nothing new shared. The cohomology object is Mathlib's, its conventions are ProfiniteCohomology's, the discrete Selmer interface is EllipticCurves Layer 7's, and the compact and rational Selmer data stay this roadmap's §2.1. No other open pull request changes this roadmap, and no cited id is dropped.

Source independence: changed passages only; 1 passage compared with 1 source (Mazur–Rubin, arXiv v1, lines 154–158 and 237–252), none shared; no layer added, removed or reordered, so the arrangement was not compared.

Research link: the Selmer structures are those of Mazur–Rubin (2016); the structure theorems are Greenberg's (*On the structure of Selmer groups*); the parity theorem is the Selmer-complex half of Nekovář (2006); the Cassels–Tate pairing follows Poonen–Stoll (1999). Rests on the README's Summary and References.

## Not verifiable

- Rubin's draft, Chapter I, Definition 5.1 (second locator of §2.2): the References give no link, and the passage is untouched and unaffected by the change; not reopened.
- The other targets of the seeded sample (§§0.5, 0.10, 2.8, 2.9, 2.11, 2.18, 3.5, 3.11, 3.16, 4.16, 4.21, 4.23, 4.28) lie outside the changed and affected passages; not reopened in this review of the change.

## Source issues

- none

## For the human reviewers

- **Licence.** Untouched text: the References link Greenberg's *On the structure of Selmer groups* to a copy on another person's university page (`TauCetiRoadmap/SelmerIwasawaCohomology/README.md`, References, the Greenberg entry), not to an author's page or an open repository.
