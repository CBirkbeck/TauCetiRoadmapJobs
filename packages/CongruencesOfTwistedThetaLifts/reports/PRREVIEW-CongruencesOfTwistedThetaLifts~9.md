# Review of CongruencesOfTwistedThetaLifts (pull request #3182 at 96d24f3)
Folder: `TauCetiRoadmap/ShortGRH/CongruencesOfTwistedThetaLifts/`
**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the head the previous review read (`958132c`), and the title and description, read against this head, state this folder's change correctly (one sentence of the Conventions, 3 insertions and 2 deletions against `main`, no heading, layer or Lean declaration touched). The two commits since `958132c` change IdelicReciprocityCountsAndCyclotomicClassGroups §1 and SubspaceTheorem §0.2; §1.1, which the Conventions cite, still defines the places this README uses. One small correction (two changes to other folders that the description does not state) and two format notes carried from the previous review, none blocking; one fact about the regenerated umbrella files is left for the human reviewers.

## C01 — The description leaves two changes of statement unstated

The description says of ArithmeticGaloisRepresentations §2.1 only that `Valuation.toAbsoluteValue` is now named as Tau Ceti's. The head also changes the hypothesis of that comparison: the homomorphism from the value group is now "strictly monotone, zero-reflecting monoid-with-zero" where `main` has "strictly monotone" (the pinned declaration, `TauCeti/RingTheory/Valuation/AbsoluteValue.lean` line 32, takes `f : Γ₀ →*₀ S` with `hf_zero : ∀ a, f a = 0 ↔ a = 0`, so the new wording is the right one). Likewise the comparison paragraph of IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 now says the inertia group of the *Absolute-value places* target is normal, "and closed when the group is topological and acts continuously on the discrete `Ω`"; the description's account of that paragraph does not mention the condition.

A clause for each would do, for example: "the comparison with a valuation in §2.1 now asks the homomorphism from the value group to be a zero-reflecting monoid-with-zero homomorphism, as the Tau Ceti declaration does", and "the comparison paragraph states closedness of inertia for a topological group acting continuously on the discrete `Ω`". Neither touches this folder.

## N01 — The citation of IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 is recorded in no *Needs* line and no supplier contract

Carried from the previous review, the text being unchanged. The Conventions (line 88) take the places of `Ω` from that section, but the *Needs* line of 1.1 (line 245) names only §9.1 of that roadmap and "From other roadmaps" (line 1705) names none of its sections. Adding "IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 (places of `Ω`, decomposition and inertia groups)" to the *Needs* of 1.1 and to the contracts would record it.

## N02 — Untouched text: "From other roadmaps" omits two roadmaps the *Needs* lines cite

Carried from the previous review. The *Needs* lines cite IdelicReciprocityCountsAndCyclotomicClassGroups §§4.5, 4.6, 9.1, 10.1, 10.6 (b), 10.7 and GaloisRepresentationsOfUnitaryEigenforms §§1.2, 1.5, 6.4 (e), 7.3, 9.2, 9.3, and the contracts (line 1705–1712) list neither roadmap. This is for a separate pull request.

## Previous findings

- none: the previous report (of `958132c`) had no finding. Its two format notes are not acted on at this head (the folder is unchanged) and are written again as N01 and N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, line 87–89 (cites §1.1): inertia `I_A` at a place `A` over a finite `w` of `E`, against §1.1 item 2 and its changed comparison paragraph at this head | `Γ = G_E`, open stabilisers; finite `A`; infinite `w` | `I_A = ⋂_{x∈A} {σ ∈ D_A : σx − x ∈ 𝔪_A}`, each set a union of cosets of the open stabiliser of `x`: closed. `D_w = ⋂_x {σ : w(σ⁻¹x) = w(x)}`: closed. New clause (continuous action on discrete `Ω`) holds for `G_E`. | item 2's "closed normal" stands for the `Γ` used here | none |
| Same sentence against §1.1 item 4 (changed since `958132c`): `A = A_w` for exactly one finite `w` | `Ω` algebraic over `k`, `A ∩ k` a DVR with finite residue field; `A = Ω` | `A ≠ Ω` (`A ∩ k ≠ k`); `A ∩ ℚ = ℤ_(p)`; value group inside `ℚ ⊗` that of `A ∩ k`, rank 1; one absolute value with `w(p) = 1/p`. | consistent with item 1's bijection; this README's `A` over finite `w` of `E` unaffected | none |
| Frobenius datum (line 90): `w` of prime norm, `A` over it | `w` finite; `w` infinite | "prime norm" forces `w` finite, so `A` is a valuation subring by §1.1 item 1 as it stands at this head ("a finite place is written as its valuation subring `A`"). | agree | none |

The rows for the untouched statements stand as in the previous review, of `958132c`.

- Folder diff since `958132c`: empty (0 lines); against `main`: `README.md` 3 insertions, 2 deletions, one sentence of the Conventions. 7 layers at the merge base, 7 at the head; no heading, layer, item or Lean declaration removed or retitled.
- Seeded sample (1.3, 1.4, 1.5, 2.3, 2.4, 3.1, 3.2, 3.4, 4.3, 4.4, 6.1, 6.4, 6.5, 7.2, 7.3): all in untouched text that no changed passage cites; not reread against their sources in this incremental round.
- Library declarations opened at the pin: `Valuation.toAbsoluteValue` (`TauCeti/RingTheory/Valuation/AbsoluteValue.lean` line 32, hypotheses `hf`, `hf_zero`, `hv_zero`); `AbsoluteValue.instMulActionAlgEquiv` and `AbsoluteValue.under_smul` for `F ≃ₐ[R] F` only (`TauCeti/Analysis/AbsoluteValue/Action.lean` lines 41, 54), and no `AbsoluteValue.instMulAction` at the pin, as the description's SubspaceTheorem sentence says.
- Cross-roadmap citations resolved: IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 at this head (items 1, 2, 4 and the comparison paragraph, lines 137–180); it keeps its id and title.
- Pull request text: every sentence of the description compared with the diff against `main` of the four folders and the two umbrella files; all agree with the head; the omissions are in C01. The title names the main change.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no message (the file declares nothing; its docstring names the headlines as not statable, unchanged), so no one-tactic probe and no signature comparison applied. The head merges with `main` without conflict.
- Umbrella generator at this head: "Umbrellas in sync: GRH (131 members, 3796 items)."

Overlap check: read SelmerBoundsForAnticyclotomicTwists, GaloisRepresentationsOfUnitaryEigenforms, NormsOfThetaLiftsAndExchangeIdentities; nothing shared. The places of `Ω` are owned by IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 (over ArithmeticGaloisRepresentations §2.1) and cited here. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: changed passages only; the folder has no passage changed since `958132c`, so 0 passages compared in this round (the previous round compared the one changed sentence with 3 texts, none shared); largest share `[ShortProof]`, 53 of about 100 locators; arrangement not compared (no layer added, removed or reordered).

Research link: The roadmap formalises the congruence step of a formal proof of the Riemann hypothesis for Dirichlet `L`-functions (`[ShortProof]`), by Ribet's method to first order and Taylor–Wiles places (Taylor–Wiles 1995; Bellaïche–Chenevier 2009; Urban 2001; Dasgupta–Kakde–Silliman–Wang 2023); rests on the README's Summary and References.

## Not verifiable

- none

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folders flagged `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml`; these are generated files, the repository's generator reports them in sync with the roadmaps at this head, and the description states the regeneration.

## Source issues

- none

## For the human reviewers

- **Scope of the change.** The pull request carries regenerated `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml` (6 and 2 lines), which `main` otherwise regenerates daily; they match the generator at this head and merge with `main` without conflict.
