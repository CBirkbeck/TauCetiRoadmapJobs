# Review of CongruencesOfTwistedThetaLifts (pull request #3182 at 958132c)
Folder: `TauCetiRoadmap/ShortGRH/CongruencesOfTwistedThetaLifts/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 5 changed lines since `5c8f654`. The one changed sentence (Conventions, "Representations": a place of `Ω` is now an absolute-value place in the sense of IdelicReciprocityCountsAndCyclotomicClassGroups §1.1, with finite places written as valuation subrings) was checked against that section and ArithmeticGaloisRepresentations §2.1 at this head, against every passage of the README that quantifies over places of `Ω`, and against the formal proof at its cited commit; no finding. Two format notes, neither blocking; one fact about the regenerated umbrella files is left for the human reviewers.

## N01 — The new citation of IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 is recorded in no *Needs* line and no supplier contract

The Conventions (line 88) now take the places of `Ω` from that section, and 1.1 fixes "places of `Ω` with their inertia groups" as stated in the Conventions, but the *Needs* line of 1.1 names only §9.1 of that roadmap, and "From other roadmaps" names none of its sections. A reader of the dependency lines of 1.1 does not learn that the notion of place comes from there. Adding "IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 (places of `Ω`, decomposition and inertia groups)" to the *Needs* of 1.1 and to the contracts would record it.

## N02 — Untouched text: `README.md`, "Exact supplier contracts", "From other roadmaps" omits two roadmaps the *Needs* lines cite

The *Needs* lines cite IdelicReciprocityCountsAndCyclotomicClassGroups §§4.5, 4.6, 9.1, 10.1, 10.6 (b), 10.7 (in 1.1 and in Layer 4) and GaloisRepresentationsOfUnitaryEigenforms §§1.2, 1.5, 6.4 (e), 7.3, 9.2, 9.3, and the contracts list neither roadmap. This is for a separate pull request.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, line 87–89: a place of `Ω` is an absolute-value place; finite ones are written as valuation subrings | `Ω = ℚ̄`; trivial subring `A = Ω`; a subring over `p = 2`; an archimedean place | Valuation subring `A ≠ Ω` meets `ℚ` in `ℤ_(p)` (else `A ⊇ ℚ`, integrally closed, so `A = Ω`); value group in `ℚ`, rank 1; one absolute value with `w(p) = 1/p`. Trivial `A = Ω` ↔ trivial absolute value: excluded on both sides. | bijection holds for `Ω` algebraic over `ℚ`, the hypothesis of ArithmeticGaloisRepresentations §2.1 (line 1173–1175) | none |
| Same sentence against the supplier: IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 item 1 at this head | finite and infinite place | Item 1: place = absolute value restricting to the real or a `p`-adic one; finite place written as `A`, "lies over `v`" iff `𝒪_K ∩ 𝔪_A = v`. This README: `A` over a finite `w` of `E`. | same object, same notation | none |
| 1.1 (sampled, affected): finite type, good, jumps, killing at a place `A` of `Ω` | `A ∤ ℓ`, `A ∣ ℓ`; infinite place; trivial `A` | Formal proof `IsFiniteTypeAt`, `IsGoodAt`, `PolyKillsAt`, `HasJumpsAt` take `A : ValuationSubring Ω`; branch on `A.valuation ℓ = 1`. README uses them only at `A` over finite `v`, so neither the infinite places nor `A = Ω` occurs. | meaning unchanged by the new definition | none |
| 1.2 (2), (3) (affected): level `S` and types | `v` infinite; `v` finite outside `S` | Line 280–281 reads "every finite place `v` … every place `A` of `Ω` over `v`": the quantifier is over finite `v`, so the infinite places now admitted do not enter. | unchanged | none |
| Frobenius datum (line 90) and inertia `I_A`, `τ_A` (line 89) | `w` of prime norm; `A` over `w` | Supplier item 2: `I_A` = Frobenius elements for `q = 1` at `A`; formal proof `inertiaGroup` has carrier `IsFrob A 1`. `w` finite, so `A` is a valuation subring. | agree | none |
| 2.1 (c), 2.5 (sampled) and Layer 5 line 1186 (mention places `A` of `Ω`) | each quantifier over `A` | Lines 430, 550, 1186: `A` over a finite place of `E` (conjugate place of a finite `A`; "a place not above `ℓ`", `w ≠ w̄`). | unaffected by the change | none |

- Source locators checked: the eight `[ShortProof]` names of 1.1 (`New.GaloisRep.IsFiniteTypeAt`, `IsGoodAt`, `HasJumpsAt`, `PolyKillsAt` in `Lib/GaloisRep/Main/LocalConditions.lean`; `New.Selmer.badPlaces`, `normalizingAvatar`, `normalisedRep`, `New.Data.TameChar.invAvatar` in `New/Congruences/GaloisRepresentations/SelmerHypotheses.lean`) exist at commit `72fead1`; places there are `ValuationSubring Ω` with `Ω = AlgebraicClosure ℚ` (`Lib/ClassField/Places/GaloisDefs.lean` lines 40–46, 113–118, 228).
- The other targets of the seeded sample (1.4, 2.3, 3.1, 3.4, 3.5, 4.4, 6.2, 6.4, 6.9, 7.2) lie in untouched text the change does not affect and were not reread against their sources.
- Library declarations opened: `Valuation.toAbsoluteValue` at `TauCeti/RingTheory/Valuation/AbsoluteValue.lean` line 32 (pinned Tau Ceti), named by the supplier's target.
- Cross-roadmap citations resolved: IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 (this head, items 1–2), ArithmeticGaloisRepresentations §2.1 *Absolute-value places* (this head, lines 1156–1182). §1.1 keeps its id and subject on `main`.
- Record: 7 layers at the merge base, 7 at the head; no heading, layer, item or Lean declaration removed or retitled.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line. The supplier is on `main` and is already cited in 1.1 and in Layer 4.
- Elaboration of `Suggested.lean`: exit 0, no message (the file declares nothing; its docstring names the five headlines 7.3, 6.9, 6.5, 4.3, 2.8 as not statable, unchanged). No declaration, so no one-tactic probe and no signature comparison applied. The head merges with `main` without conflict.
- Pull request text: the last sentence of the description states this folder's change as the head has it; nothing omitted for this folder.

Overlap check: read SelmerBoundsForAnticyclotomicTwists, GaloisRepresentationsOfUnitaryEigenforms, NormsOfThetaLiftsAndExchangeIdentities; nothing shared. The places of `Ω` are owned by IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 (over ArithmeticGaloisRepresentations §2.1) and cited here; GaloisRepresentationsOfUnitaryEigenforms (table of symbols, line 82) also cites a place as a valuation subring over a finite `w`, consistent with the head. No other open pull request changes this roadmap.

Source independence: changed passages only; 1 passage compared with 3 texts (`[ShortProof]` `Lib/ClassField/Places/GaloisDefs.lean`, IdelicReciprocityCountsAndCyclotomicClassGroups §1.1, ArithmeticGaloisRepresentations §2.1), none shared; largest share `[ShortProof]`, 53 of about 100 locators; arrangement not compared (the diff adds, removes and reorders no layer).

Research link: The roadmap formalises the congruence step of a formal proof of the Riemann hypothesis for Dirichlet `L`-functions (`[ShortProof]`), by Ribet's method to first order and Taylor–Wiles places (Taylor–Wiles 1995; Bellaïche–Chenevier 2009; Urban 2001; Dasgupta–Kakde–Silliman–Wang 2023); rests on the README's Summary and References.

## Not verifiable

- none

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folders flagged `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml`; these are generated files, the repository's generator reports them in sync with the roadmaps at this head ("Umbrellas in sync: GRH (131 members, 3796 items)"), and the description states the regeneration.

## Source issues

- none

## For the human reviewers

- **Scope of the change.** The pull request carries regenerated `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml` (6 and 2 lines), which `main` otherwise regenerates daily; they match the generator at this head and merge with `main` without conflict.
