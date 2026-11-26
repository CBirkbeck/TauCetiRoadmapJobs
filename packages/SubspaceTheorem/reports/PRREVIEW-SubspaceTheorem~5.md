# Review of SubspaceTheorem (pull request #3178 at 6c07fb0)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 6 changed lines since `0a7b524`. The change is one sentence of 0.2, which asks for the action on absolute values for any group acting by ring automorphisms and for its invariance of the restriction to a pointwise-fixed base; I checked it by computation and by proving it against the pinned libraries, and it is true as stated, owned by no other roadmap, and creates no upward or cyclic supply. Accepted; one small correction (the invariance is worded for "a subring", narrower than the lemma Tau Ceti already has and than what the consumer in the same pull request uses) and no format note. The previous review had no findings; its licence question and the unread Bombieri–Gubler remain for the human reviewers.

## C01 — The invariance of the restriction is asked "for a subring `R`", which covers neither Tau Ceti's existing lemma nor the base `ℚ` the consumer uses

In the sentence added to 0.2 (README lines 238–242) the target is "prove `(g • w).under R = w.under R` for a subring `R` with `SMulCommClass G R F`". Read as written, an implementer states it for `R : Subring F`. But `AbsoluteValue.under` takes any commutative semiring `R` with `[Algebra R F] [FaithfulSMul R F]` (Mathlib `Analysis/Normed/Ring/WithAbs.lean`, line 285), Tau Ceti's `AbsoluteValue.under_smul` (`Analysis/AbsoluteValue/Action.lean`, line 53), which the new instance is meant to subsume, is in that generality, and the consumer added in this pull request (ArithmeticGaloisRepresentations §2.1, *Absolute-value places*) applies it to `w.under ℚ` and to `w.under K` for a base field `K` with `SMulCommClass G K L`; neither `ℚ` nor such a `K` is a term of `Subring L`. The statement in the generality of `under` is true and no harder: `(g • w)(algebraMap R F r) = w (g⁻¹ • (r • 1)) = w (r • (g⁻¹ • 1)) = w (algebraMap R F r)`; I proved it in that form against the pins in three lines.

The smallest change: replace "for a subring `R` with `SMulCommClass G R F`" by "for a commutative semiring `R` with `Algebra R F`, `FaithfulSMul R F` and `SMulCommClass G R F` (a base that `G` fixes pointwise)".

## Previous findings

- The previous review (of another pull request's head) accepted the roadmap with no findings, small corrections or format notes; nothing to repair.
- Its carried-over question on the example of 9.5 (the value `κ = 100` needs `c(ℚ, ∅) = 2`) lies in untouched text that the change does not affect and stands as it was.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.2, `(g • w) x = w (g⁻¹ • x)` is an absolute value | `G` any group, `F` a semiring; `x = 0`; products and sums | `w(g⁻¹•(xy)) = w(g⁻¹•x) w(g⁻¹•y)`; `w(g⁻¹•x) = 0 ⇔ x = 0` since `g⁻¹ •` is injective; subadditive | sound |
| 0.2, it is a left action | non-abelian `G` (`S₃`), `g, h` not commuting; `g = 1` | `((gh)•w) x = w(h⁻¹•g⁻¹•x) = (g•(h•w)) x`; the variant `w(g • x)` gives `(hg)•w`, a right action; `1•w = w` | sound; convention pinned |
| 0.2, the `F ≃ₐ[K] F` case | Mathlib `AlgEquiv.applyMulSemiringAction` (`σ • x = σ x`, `σ⁻¹ = σ.symm`) | `(σ • w) x = w (σ.symm x)`, Tau Ceti's `AbsoluteValue.smul_apply`; holds by `rfl` for the existing instance | sound |
| 0.2, `(g • w).under R = w.under R` | `R` with `SMulCommClass G R F`; `F = ℚ(i)`, `G = Gal(F/ℚ)`, `R = ℚ`; negative control `R = F`, `w` the `(2+i)`-adic value | `g•(r•1) = r•(g•1) = r•1`, so both sides are `w(r)`; control: `w(2+i) < 1 = w(2−i)`, and `SMulCommClass` fails, as it must | sound (C01 on the carrier of `R`) |
| 0.2, `SMulCommClass` is the right hypothesis | `x = 1` in `g•(r•x) = r•(g•x)`; `R = ℚ`, `F` a field of characteristic zero | equivalent to `g • r = r` for all `r`; for `ℚ` it is automatic (Mathlib `SMulCommClass.rat`, instance found by elaboration) | sound |
| 0.2, transitivity and `exists_algEquiv_comp_eq` (untouched, depends on the action) | `w' = σ⁻¹ • w` under the new formula | `w' x = w(σ • x) = (w ∘ σ) x`, the form the target states; unchanged by the generalisation | sound |

- Source locators checked against the text: 0. The changed sentence carries none of its own (the paragraph's Bombieri–Gubler locator is unreadable, below), and no target of the seeded sample falls in changed or affected text.
- Library declarations opened at the pin: 6. Tau Ceti `AbsoluteValue.instMulActionAlgEquiv`, `AbsoluteValue.smul_apply`, `AbsoluteValue.under_smul` (`Analysis/AbsoluteValue/Action.lean`, lines 41, 47, 53); Mathlib `AlgEquiv.applyMulSemiringAction` (`Algebra/Algebra/Equiv.lean`, line 702), `AbsoluteValue.under` (`Analysis/Normed/Ring/WithAbs.lean`, line 285), `MulSemiringAction` (`Algebra/Ring/Action/Basic.lean`, line 51). Neither library has a `MulAction` on `AbsoluteValue` other than Tau Ceti's for `F ≃ₐ[R] F`, so the general instance is new.
- Lean probe: the instance `MulAction G (AbsoluteValue F S)` from `MulSemiringAction G F`, its `smul_apply` (by `rfl`) and the `under` lemma for a commutative semiring `R` with a faithful algebra elaborate and are proved against the pins with no error.
- Cross-roadmap citations resolved: 1. ArithmeticGaloisRepresentations §2.1 at this head names SubspaceTheorem §§0.1 and 0.2 in its *Needs:* line and uses the action and the invariance of the restriction as 0.2 states them; SubspaceTheorem does not cite that roadmap back.
- The record: no layer, section or item of the README at the merge base is removed, renumbered or retitled; the Tau Ceti declarations named in 0.2 and in the 0.2 row of Scope and ownership are still at the pin.
- Automatic checks: every check passed on this head. The dependency check prints `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`: no UPWARD or CYCLE line. Outside this folder the pull request changes only the two other roadmap folders it names as its own.
- Elaboration: `lake env lean` on `Suggested.lean` gives 38 `sorry` warnings and nothing else; the file is unchanged against `main`, so the signature comparison and the one-tactic probe of the previous review stand. The change adds no headline theorem.
- The pull request's text against the head: "SubspaceTheorem §0.2 asks for the action on absolute values as a single instance for any group acting by ring automorphisms, of which the action of `F ≃ₐ[K] F` is a case" and "No `Suggested.lean` changes" both agree with the head.

Overlap check: searched DiophantineApproximationAndTranscendence, HeightsAndUnits and AdelicHeightsAndSuccessiveMinima, with every roadmap on main and at the open heads, for an action of a group on absolute values; the only other occurrence is ArithmeticGaloisRepresentations §2.1 in this pull request, which restricts this action to its subtype of places and cites 0.2 for it. Owner of the action on `AbsoluteValue F ℝ`: SubspaceTheorem 0.2; nothing else shared.

Source independence: changed passages only: 1 passage compared with 1 text (the module docstring of Tau Ceti's `Analysis/AbsoluteValue/Action.lean`, the only readable text on the object), nothing shared beyond the formula `w ∘ σ⁻¹`; largest share Bombieri–Gubler, about 50 of 174 source mentions, whose text could not be read; the change adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: Layer 6 is the Schmidt–Schlickewei Subspace Theorem (1972, 1977) in the form of Evertse–Schlickewei (2002); Layer 9 is the elementary half of Evertse (2010); 7.3 is Adamczewski–Bugeaud (2007); 8.6 is Corvaja–Zannier and Bugeaud–Corvaja–Zannier (2003). Rests on the README's references and Evertse2010 §2.

## Not verifiable

- Bombieri–Gubler, Corollaries 1.3.2 and 1.3.5, the locator that opens the changed paragraph of 0.2: the book is behind the publisher's paywall and no copy is held locally; the added sentence was checked by computation and in Lean, not against the source.

## Source issues

- none

## For the human reviewers

- **Licence.** Tau Ceti's `Analysis/AbsoluteValue/Action.lean` and the README's Provenance section say the action is also defined in `rwst/Subspace-Theorems` at `09835cb` (Apache 2.0); `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of the locators (about 50 of 174 mentions), could not be read legally; the changed sentence cites nothing new from it.
