# Review of K2SymbolsBrauer (pull request #1302 at 607bfa8)

**Verdict:** accepted

No finding.

## Previous findings

- R01 — repaired: the description now reads "for a global function field `F`, a prime `ℓ ≠ char F` and a primitive `ℓ`th root of unity `ζ ∈ F`", which is the hypothesis of `TauCetiRoadmap/K2SymbolsBrauer/README.md:2435`; no new problem.

## Verified sound

| Statement (changed or touched) | Instances tried | Values on one side | Values on the other side | Result |
|---|---|---|---|---|
| Description, Brauer sentence against §10.32b (previous R01) | `F=𝔽₇(t)`, `ℓ=3`, `ζ=2` (`2³=8≡1`); then `ℓ=7` | at `0`: `2^v(t)=2`, `2^((7−1)/3)=4=ζ²`, invariant `2/3`; at `∞`: `2⁻¹=4`, `4²≡2=ζ`, invariant `1/3`; sum `1≡0` | `README.md:2447`: `2/3` at zero, `1/3` at infinity. `ℓ=7`: the description now asserts nothing; `README.md:2450` excludes it | agrees |
| Description, "only Brauer-group targets are §§10.32a–10.32b" | every line of the README naming `Br` or a cyclic algebra | targets at lines 2418–2462 (§§10.32a–10.32b) | elsewhere only supplier contracts (lines 17, 48, 56) and the consumer line 3447 | agrees |
| Description, AlgebraicKTheory "A1–A3 and A5, Layers 1–3 and 5" | main `8ad4192` | main `README.md:235, 316, 379, 550` are Layers 1, 2, 3, 5 (A1, A2, A3, A5) | this README cites §§1.1–1.4, 2.1–2.3, 3.1, 5.1–5.2 | agrees |
| Description, the three open suppliers and their layers | sections cited here, resolved at the open heads; main `8ad4192` has none of the three | GeneralAlgebraicKTheory §§3.2, 3.12–3.14, 4.6, 4.8, 4.14, 7.2–7.4, 7.7, 7.8, 8.1, 8.11–8.13, 10.12; KTheoryLowDegrees §§6.1–6.2, 8.1, 9.1, Layers 10–11, §§13.1–13.5; SchemeKTheoryOperations §3.6: all headings present | "Layers 3, 4, 7 and 8, and §10.12"; "Layers 6, 8–11 and 13"; "§3.6" | agrees |
| Description, StableHomotopyKTheory "Layers 1–4" | sections cited here | §§1.30, 1.32, 2.4–2.8, 3.12, 3.15, 3.26–3.31, 4.14 | highest layer cited is 4; main has Layers 1–7 | agrees |
| Description, "the other roadmaps the README cites as suppliers are on main" | `README.md:72` and the supplier subsections, on main `8ad4192` | QuadraticFormInvariants, ClassFieldTheory, ClassicalArithmeticCompletion, AlgebraicCurves, EllipticCurves, ReductiveGroups, RepresentationTheory/RootSystems, AlgebraicTopology, GeneralizedCohomology present | LocalFieldsRamification is under `Completed/` | agrees |
| Description, summary block and "ten headline theorems" | `Suggested.lean` and `README.md:3–5` at the head | `Steinberg.centralExtension_splits` (line 74, `5 ≤ n`), `MilnorK` (line 111); 10 `sorry` theorems; no `set_option`; imports `Mathlib` and two `TauCeti` modules | "n ≥ 5"; "ten headline theorems"; "the Lean imports none of them"; `K₂(ℤ)≅ℤ/2`, "curves over any field" as in the Summary | agrees |
| Description, "adds the folder (README, `Suggested.lean`, `metadata.toml`)" | the worker's diff against the base | 3 files, 3752 insertions, 0 deletions; 0 headings and 0 declarations removed; the roadmap is not on main | the description presents a new roadmap and names the three files | agrees |
| Description, "Why Tau Ceti wants it" | `README.md:3444–3453` | PartII, EllipticCurves (§10.31), KTheoryFiniteLocalFields, MotivicEtaleKTheory, HigherLocalFieldsAndHigherClassFieldTheory, ArithmeticKTheory, SpecialValuesBirchTate, RefinedTraceMethods (§13.13 without Maazen–Stienstra) | the same consumers with the same objects | agrees |

The rows for untouched statements, including the ten sorried headline theorems, stand as in the previous review, of `607bfa8`.

- **Gate:** re-run at this head: every count 0 and `OK`; the worker's run adds `build=0`. Nothing is changed outside the folder.
- **Dependency check:** `depcheck: 247 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives ten `declaration uses sorry` warnings (lines 74, 131, 137, 150, 160, 190, 199, 212, 220, 256) and nothing else.
- **Citations resolved:** 23 section headings at the open heads of GeneralAlgebraicKTheory, KTheoryLowDegrees and SchemeKTheoryOperations; AlgebraicKTheory Layers 1–3 and 5, StableHomotopyKTheory Layers 1–4, ReductiveGroups Layer 7 and RootSystems Layer 3 on main. The resolver's 13 name leads are all declarations of `Suggested.lean`.
- Overlap check: read K2SymbolsBrauerPartII, EllipticKTheory, KTheoryFiniteLocalFields, K3BlochGroups, HomologicalStabilityOfGeneralLinearGroups (open), AlgebraicKTheory, StableHomotopyKTheory, ClassicalArithmeticCompletion (main); no id dropped, no other open pull request changes this roadmap; K2SymbolsBrauerPartII (head `e96bc52`) consumes §10.32b, so this roadmap owns the prime-to-characteristic function-field equivalence; other owners as in the earlier reviews.
- Source independence: 0 passages compared with 0 sources (changed passages only: the folder is unchanged since `607bfa8`); largest share `weibel`, 171 of 246 locators, as counted at `902ff2b`; contents not compared again, since no layer was added, removed or reordered.
- **Seeded sample:** with 0 changed lines, no sampled target falls in a changed passage; none was checked again.

## Not verifiable

- `weibel`: not fetched this round, because no changed passage cites it.

## Source issues

- none

## For the human reviewers

- Not tested: `weibel` has the largest share of the locators (171 of 246) and was not read this round or the previous two. The review of `902ff2b` compared it, and no locator has changed since.
