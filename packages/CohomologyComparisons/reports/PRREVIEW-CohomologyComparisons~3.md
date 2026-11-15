# Review of CohomologyComparisons (pull request #1064 at fff3df0)

**Verdict:** needs changes

Incremental re-review of the 84 lines changed since bee1248 (`README.md` only: the supplier contract line 63, the regrouping of §§2.1–2.17 under five headings with five new opening paragraphs, the rewording of §2.18's weak-finality passage, §2.24 and its locator line, Layer 2 Dependencies), and the first check of the pull request's title and description against the head. Four P3 findings, none blocking.

## R01 (P3) — `Suggested.lean` docstring still says the file states theorems and states none

**Location:** `TauCetiRoadmap/CohomologyComparisons/Suggested.lean` lines 6–8: "it states the headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; it states no theorem because none is statable at the pins."

**Claim:** Finding R03 of the review of bee1248, not repaired: the two clauses contradict each other, and line 8 is 127 characters wide in a file otherwise wrapped at 100.

**Witness:** `git diff bee1248 fff3df0 -- TauCetiRoadmap/CohomologyComparisons/Suggested.lean` is empty; the namespace at lines 40–42 is empty.

**Repair:** "This file is the roadmap's acceptance test, meant to state the headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. It states none, because none is statable at the pins; the list below says what each lacks.", wrapped at 100 characters.

## R02 (P3) — The `AInf.*` and `Semistable.*` names cited from AInfCohomology no longer exist at its head

**Location:** `README.md` lines 63, 566, 583 ("AInfCohomology §AI.2.2 (`AInf.fargues_full_faithfulness`)", added by the repair of the previous R01); the same in the regrouped lines 340, 394, 400, 406, 416, 422, 452, 458, and line 27 ("Supplier names (`AInf.*`, …) are declared where the cited roadmap or library says").

**Claim:** At its open head AInfCohomology names its targets by bold titles and carries no `AInf.` or `Semistable.` identifier at all; the sections cited all still exist and state what is used, so only the names are stale.

**Witness:** AInfCohomology `README.md` at its open head: 0 occurrences of `AInf.` and of `Semistable.`; line 1770, in §AI.2.2, reads "**Full faithfulness of Fargues realization**. The functor from finite free BKF modules to pairs `(T,Ξ)` is fully faithful."

**Repair:** Cite section and target title instead of the name, in every place (16 `AInf.*` and 2 `Semistable.*` names; lines 53, 55, 57, 93–119, 340–458, 566, 583, 750, 756, 788, 812, 814), and delete `AInf.*`, `Semistable.*` from the sentence of line 27. The titles at the head:

| Name cited here | AInfCohomology section and target title |
|---|---|
| `AInf.fargues_full_faithfulness` | §AI.2.2, *Full faithfulness of Fargues realization* |
| `AInf.cyclotomic`, `_factorization`, `_kernel` | §AI.0.1, *Cyclotomic period elements* |
| `AInf.tildeTheta`, `_apply`, `_ker` | §AI.0.1, *Frobenius-shifted Fontaine map* |
| `AInf.residue`, `AInf.residue_periods` | §AI.0:integral.1, *Witt residue specialization* |
| `AInf.bdr_infinitesimal_envelope` | §AI.6.5, *Infinitesimal envelope of a very small affinoid* |
| `AInf.canonical_deformation_free` | §AI.6.5, *Finite freeness of the canonical deformation* |
| `AInf.canonical_bdr_etale_map` | §AI.6.5, *Canonical deformation-to-étale map* |
| `AInf.canonical_rational_comparison` | §AI.6.5, *Canonical rational comparison and descended map agreement* |
| `AInf.integral_deformation_agreement` | §AI.6.5, *Smooth integral and canonical deformation agreement* |
| `Semistable.pNormalizedMonodromy` | §AI.6.4, *Rational normalization of Hyodo–Kato monodromy* |
| `Semistable.hyodoKatoInterface` | §AI.6.4, *Arithmetic Hyodo–Kato interface* |
| `AInf.Trace.THH`, `AInf.Trace.bokstedt_periodicity` (line 55) | the titles of the §AI.7.2 targets that line cites |

For §2.24: "AInfCohomology §AI.2.2 (*Full faithfulness of Fargues realization*)". The `Prismatic.*` names are unaffected (see Verified sound).

## R03 (P3) — `*Needs:*` lines quote section titles the regrouping replaced

**Location:** `README.md` line 438 ("Layer 2.7 (Spreading out proper smooth rigid spaces)"); lines 645, 784, 1040 ("Layer 2.12 (Descended de Rham lattice)"); lines 623, 974 ("Layer 2.16 (The canonical `B_dR⁺` lattice in good reduction)"); lines 446, 919 ("Layer 2.14 (Hodge–de Rham degeneration)").

**Claim:** The change renamed the headings of §§2.7, 2.12, 2.14 and 2.16; these eight citations still give the former titles, which now occur nowhere else in the README.

**Witness:** Headings at this head, lines 378, 412, 428, 448: "2.7 Proper spreading, canonical `B_dR⁺` cohomology and its period comparison over `C`", "2.12 Descended de Rham lattice and filtered comparison over `K`", "2.14 Hodge–de Rham and Hodge–Tate degeneration", "2.16 The canonical `B_dR⁺` lattice in good reduction and agreement of period maps".

**Repair:** Replace each parenthesis by the heading as it now reads; in lines 446 and 919, where the first theorem of §2.14 is meant, write "Layer 2.14 (Hodge–de Rham and Hodge–Tate degeneration: the Hodge–de Rham theorem)".

## R04 (P3) — The description describes a `Suggested.lean` with definitions, theorems and `sorry`; the head's file declares nothing

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; "the targeted Lake build succeeds with `sorry` as the only warning; README identifiers absent from Lean … are all zero".

**Claim:** The head contradicts all three: the file has no declaration, the build has no warning, and every identifier of the README's own is absent from the Lean by design. The description also never says that the pull request adds a new roadmap.

**Witness:** `Suggested.lean` lines 40–42 are an empty namespace; `lake env lean` on it exits 0 with no output; `README.md` line 27: "None of them is declared in `Suggested.lean`".

**Repair:** "Adds the new roadmap folder `TauCetiRoadmap/CohomologyComparisons` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring says what each lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning; the README's own backticked names are interface labels that the Lean does not declare (Conventions); Check labels and round labels are zero; no `set_option`; the dependency gate shows no upward edge for this roadmap."

## Previous findings

- R01 — repaired: lines 63, 566 and 583 read "AInfCohomology §AI.2.2 (`AInf.fargues_full_faithfulness`)"; no "AI.2.3" remains; §AI.2.2 states the theorem at the supplier's head. The name the repair adds is R02 above.
- R02 — repaired: line 581 reads "Construction 3.9, p.31; Theorem 3.12, p.32" (gr line 1488 on the page opened at line 1473; line 1525 on the page opened at line 1518).
- R03 — not repaired: `Suggested.lean` lines 6–8 are unchanged, "it states the headline theorems … each with `sorry`; it states no theorem because none is statable at the pins"; raised again as R01.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §2.18 `envelope` (weak finality, reworded) | `Z=X_K`-type case with zero ideal, `T=U[ε]`; relative dimension 0 and ≥1 | `Z_{m,e}=X_e` for all `m`; lifts `T→X_e` over `U` form a torsor under `Der(O_U,εO_U)`: one lift in dimension 0, many in dimension ≥1 | weakly final, not final; "not claimed to be unique" correct; agrees with gr Lemma 10.3(i) | none |
| §2.18 `envelope_selfProduct` | `n=0`, `n=1` | `n=0`: `Z⁰=Z`, one map, identity statement; `n=1`: map to a neighbourhood of the diagonal in `Z×_{Y_K}Z` = two maps agreeing on `U` | `n+1` maps for `Z^n`, as gr Lemma 10.3(ii) | none |
| §2.18 factorisation through `Z_{m,e}` | ideal `J` of `U` in `T` with `J^N=0` | the ideal of `X_C` maps into `J`, its `N`-th power to 0: factors through `Z_{N−1,e}` | holds for every lift, existence is the separate local smoothness step | none |
| §2.14 opening paragraph: inputs "§§2.7, 2.9, 2.11 and 2.13, the second from the first" | Needs of §2.14 and §2.15 | §2.14: 2.7, 2.13; §2.15: 2.14, 2.9, 2.11; union `{2.7, 2.9, 2.11, 2.13}` | equal | none |
| §2.15 twist sign after regrouping | `P¹`, degree 2 | `E₂^{1,1}=H¹(Ω¹)(−1)`, dimension 1; `H²_ét=ℚ_p(−1)`; `h^{1,1}=1=dim H²_dR` | consistent with §2.14 and §0.4 | none |
| §2.7 opening paragraph: consumers | Needs lines 438, 446, 558, 909 | §§2.14–2.15 use 2.7, 2.9, 2.11; §2.23 uses 2.8; §4.11 uses 2.8, 2.11 | equal | none |
| §2.12 opening paragraph: consumers | Needs lines 438, 645, 784, 899, 1040, 1242 | 2.12 or 2.13 cited by §§2.14, 3.4, 4.4, 4.10, 5.9, 6.4 and by no other section | equal | none |
| §2.16 opening paragraph: consumers | Needs lines 623, 974, 1242 | §3.3: 2.16; §5.3: 2.16 and 2.17; §6.4: 2.17 | equal | none |
| §2.1 opening paragraph: consumers | Needs lines 500, 518, 558 | §§2.18, 2.19 cite 2.2; §2.23 cites 2.8 and 2.19, and 2.6 only through §2.6's own sentence | consistent with §2.6 | none |
| §2.24 full faithfulness input | finite free BKF modules over `A_inf` | AInfCohomology §AI.2.2 states full faithfulness of `M↦(T,Ξ)`; §AI.2.3 the classification | §AI.2.2 is the right owner | R02 (name only) |

Rows for statements the diff leaves untouched stand as in the previous review, of bee1248.

- Remark, no change asked: HodgeTateAndCanonicalSubgroups (open) cites `CohomologyComparisons` §2.15 at its lines 128 and 707; the id survives as the numbered run-in target "**2.15 Hodge–Tate degeneration.**" at line 440.
- Source locators read at the text: 5 (gr Remark 10.2 line 4762, Lemma 10.3 lines 4767–4773 and its proof lines 4776–4786, all on the page opened at line 4746, p.94; Construction 3.9 line 1488, p.31; Theorem 3.12 line 1525, p.32).
- Library declarations opened at the pin: `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165`), `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`), both named in the description's summary.
- Cross-roadmap citations resolved at the heads: AInfCohomology §§AI.0.1, AI.0:integral.1, AI.2.2, AI.2.3, AI.6.4, AI.6.5 (sections present, names absent: R02); PrismaticCohomologyPartIII §§6.8, 6.9, 7.0, 7.1, 7.5, 7.8, 7.9, 7.10, 7.13, 7.22 present, with `Prismatic.FCrystal.PrismaticFCrystal`, `etaleRealization`, `crystallineRealization`, `Prismatic.Syntomic.syntomicComplex`, `syntomicCup`, `syntomicToFil`, `Prismatic.Trace.rationalBeilinson`, `Prismatic.Beilinson.chi` and its listed `square`, `cofibre`, `chi_boundedDenominator`.
- Seeded sample: none of the fifteen targets (0.1, 0.4, 2.19, 3.1, 3.6, 4.3, 4.10, 5.6, 5.8, 5.9, 6.3, 6.4a, 6.8, 6.13, 6.14) lies in a changed passage; §2.19's citation of §2.2 still resolves.
- Description against the head: the summary block's consumers (HabiroCohomologyFoundations, RefinedTraceMethods, PerfectoidShimuraVarieties) match Downstream consumers; "the Lean imports none of them" holds (`import Mathlib` only); no section number is quoted, so the regrouping makes no other sentence wrong.
- Gate at fff3df0, run again: every scanner 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2248 edges, 0 problem(s)`; CohomologyComparisons is at merge-order line 183, AInfCohomology 83, PrismaticCohomologyPartIV 136. No file changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so the binder check and the one-tactic probe have nothing to test.

Overlap check: read AInfCohomology, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV; nothing shared (AInfCohomology leaves the filtered enhancement over `C` to this roadmap, PartIV names §§4.6 and 6.1 here as consumers, PartIII names this roadmap as a consumer of its realizations).

Source independence: changed passages only; 3 passages compared with 1 source (gr lines 4762–4786), none shared (longest common run 5 words, a forced phrase); the five opening paragraphs cite no source; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- none
