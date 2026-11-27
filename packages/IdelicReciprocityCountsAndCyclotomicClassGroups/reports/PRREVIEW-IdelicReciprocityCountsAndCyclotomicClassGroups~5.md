# Review of IdelicReciprocityCountsAndCyclotomicClassGroups (pull request #3182 at 96d24f3)
Folder: `TauCetiRoadmap/ShortGRH/IdelicReciprocityCountsAndCyclotomicClassGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 16 lines changed since `958132c`: the folder is accepted. The previous review had no finding and three small corrections; all three are repaired at this head, each repair was checked against the *Absolute-value places* target of ArithmeticGaloisRepresentations §2.1 as it stands here, and none introduces a new problem. There is no finding, no small correction and no format note. One point is left for a human, as before: the pull request also carries the regenerated GRH umbrella files, which lie outside the roadmap folders.

## Previous findings

The previous report had no finding (no R-numbered remark). Its three small corrections:

- C01 — repaired: the Summary, the table of symbols and the introduction of Layer 1 now say "finite place(s) of `Ω`" for the valuation-subring description, and 1.2 (a) reads "Every finite place of `Ω` lies over some `v`".
- C02 — repaired: item 4 of §1.1 now ends "`A` is then `A_w` for exactly one finite place `w` of `Ω`, and items 2 and 3 are read at it".
- C03 — repaired: the comparison paragraph now says of the inertia group "normal in it, and closed when the group is topological and acts continuously on the discrete `Ω`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 item 4, new clause: `A = A_w` for exactly one finite place `w` | `Ω = ℚ̄_p`, `k = ℚ_p`; `Ω = ℚ̄`, `k` a decomposition field; `A = Ω` | `Ω/k` algebraic ⇒ rank one; residue characteristic `p` ⇒ `A ∩ ℚ = ℤ_(p)`; normalise `w(p) = 1/p`. Uniqueness: supplier states `w ↦ A_w` injective in characteristic 0. `A = Ω`: `A ∩ k = k`, no DVR | true; needs only characteristic 0, not `Ω` algebraic over `ℚ` | none |
| 1.2 (a), new sentence: every finite place of `Ω` lies over some `v` | `ℚ(i)`, places above 5; an infinite place; the former place `A = Ω` | `w|ℚ` `p`-adic ⇒ `𝒪_K ∩ 𝔪_A` a prime containing `p`: `(1+2i)` or `(1−2i)`. Infinite place: excluded by "finite". `Ω`: not `A_w` for any `w` | true | none |
| Comparison paragraph: inertia normal always, closed under a continuous action | `Γ` of §1.1 (open stabilisers); `G_ℚ` with the indiscrete topology | open stabilisers ⇒ action continuous on discrete `Ω` ⇒ closed; indiscrete: inertia above 5 is a proper nonempty subgroup, not closed, and the action is not continuous | matches the supplier's hypotheses `[DiscreteTopology L] [ContinuousSMul G L]` | none |
| Item 2 (untouched, cited by the changed clause): `I_A` closed normal in `D_A` for the `Γ` of §1.1 | same `Γ` | covered by the continuous case above | consistent with the reworded paragraph | none |
| Summary, table of symbols, Layer 1 introduction: "finite place … valuation subring" | 4.1 item 1 ("infinite places of `Ω`"); item 1 of §1.1 | finite places ↔ valuation subrings `≠ Ω` (item 1); infinite places are absolute values only; the three sentences now say exactly this | consistent | none |

The rows of the previous review for untouched statements stand as in that review, of `958132c`.

- Source locators checked against the text: 0 (the change adds none, and no target of the seeded sample falls in the changed passages or cites them beyond §1.4's use of item 4, covered by the first row; the manifest records no texts).
- Cross-roadmap citations resolved: 1 (ArithmeticGaloisRepresentations §2.1, *Absolute-value places*, reread at this head: places for a field of characteristic zero, injectivity of `w ↦ A_w`, bijection for `L` algebraic over `ℚ`, normality, closedness under a continuous action on discrete `L`).
- Library declarations opened at the pin: `AbsoluteValue.instMulActionAlgEquiv` in `TauCeti/Analysis/AbsoluteValue/Action.lean` line 41 (the only action instance at the pin, as the description's sentence on SubspaceTheorem §0.2 says).
- Record: 10 layers at the merge base, 10 at the head; no heading, layer or item removed or retitled; no Lean declaration changed.
- Dependency check output: `depcheck: 93 roadmaps, 1042 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: no error and no warning; the file is unchanged and states nothing (its docstring names the five headlines as not statable and what each lacks), so there is no declaration to probe or to compare with `#check`.
- The pull request's title and description read against this head: they state the "finite place" wording, the new sentence of 1.2 (a), the clause added to item 4, and the SubspaceTheorem §0.2 change; no sentence contradicted.
- Overlap check: read ClassFieldTheory (open, by the overlap list: it neither changes this roadmap nor drops an id cited here), GaloisRepresentationsOfUnitaryEigenforms, SelmerBoundsForAnticyclotomicTwists, CongruencesOfTwistedThetaLifts; the one shared object, the places of a characteristic-zero field with their decomposition and inertia groups, is owned by ArithmeticGaloisRepresentations §2.1 and cited from §1.1; nothing else shared.

Source independence: changed passages only; 3 passages (the clause of item 4, the closedness clause of the comparison paragraph, the sentence of 1.2 (a)) compared with 1 text, the supplier target ArithmeticGaloisRepresentations §2.1, which is this project's own and not a source; none shared with an external source; the change adds no source locator and no layer, so shares and arrangement were not recomputed. The text of `[ShortProof]` was not read.

Research link: the roadmap states the class field theory, cocycle counts, Hecke characters and cyclotomic class-group bounds used by the shorter formal proof of the Riemann hypothesis for Dirichlet `L`-functions (`[ShortProof]`, the `grh` folder of the cited repository); it rests on the README's Summary and References, not on a refereed text I read.

## Not verifiable

- `[ShortProof]`, `Lib/ClassField/Places/GaloisDefs`: that it "uses" the valuation-subring description (item 1) was not checked against the repository; the manifest records no text for it and the claim is untouched.
- Whether the two generated GRH umbrella files are in sync with the roadmaps was not recomputed in this round; they and the *Needs* lines of this folder are unchanged since the previous review, which found them in sync.

Automatic checks set aside as false positives: two reports of TeX-only syntax (`a^{h_K}` in 2.2 (a) and `N_{K/ℚ}(x)` in 2.2 (b)), both inside code spans that continue over a line break; and the report that the pull request changes files outside its roadmap folders, which names the two generated GRH umbrella files, regenerated as the description says.

## Source issues

- none

## For the human reviewers

- **Scope.** The pull request commits the regenerated `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml` (6 and 2 lines); a daily job regenerates them on `main`, so a conflict is possible.
- **Licence.** `[ShortProof]` is a public Lean repository cited by commit, not a refereed publication; its licence was not read in this review (the change adds nothing taken from it).
