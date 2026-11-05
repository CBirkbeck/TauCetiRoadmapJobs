# Repair report: FuchsianOrbifoldsPartII, red-team round 1

The two reviews raise three distinct findings and none of them overlap. Each section is headed by the id its review gives it: the first F01 section is review a's F01; the second F01 section and the F02 section are review b's F01 and F02.

## F01 (P3) — applied
Review a, F01.

Verified: ConformalMapping README L4 covers Schwarz reflection and Painlevé removability across an arc. Its preamble assigns Riemann point-removability to Mathlib. At the pin, `Complex.differentiableOn_update_limUnder_of_bddAbove` (`Mathlib/Analysis/Complex/RemovableSingularity.lean:100`) takes `s ∈ 𝓝 c`, holomorphy on `s \ {c}` and a bounded norm.

Changes:
- **Supplier contract.** The L4 contract went from "reflection and removable extension in local discs" to reflection only. The Mathlib contract now lists the declaration with its hypotheses.
- **§3.2 route.** The route now names the bounded Cayley-disc coordinate and the open-mapping step that keeps the extended value inside the disc.
- **§3.2 Needs.** Added the Mathlib declaration. ConformalMapping L4 is kept for reflection.

Pattern search: "removab" occurs only at these two places.

## F01 (P2) — applied
Review b, F01.

Verified: the AutomorphicSpectralTheory §4.17a text at the open head (`roadmaps show`) states none of the three bundled deliverables:
- the complete invariant up to rotation;
- the Pell automorph with its attracting point;
- the identification with the native `NumberField.NarrowClassGroup`.

That §4.17a constructs its own `Cl⁺(K)`. Each item is therefore a real contract, and they have different consumers.

Changes:
- **Gaps.** `gap:primitive-minus-cycle-interface` → `gap:primitive-minus-cycle-invariant`, `gap:primitive-pell-word` and `gap:narrow-dictionary-compatibility`. Each `needs` sentence is in my own words. The change is made in both the README supplier contracts and `plan.json` `gaps`. `gap:oriented-quadratic-cycle-reversal` is unchanged.
- **Needs lines repointed.**
  - §1.1, §1.4, §3.4 → invariant.
  - §1.5 → Pell word.
  - §4.3 → invariant and dictionary.
  - §4.4 → reversal and dictionary.
  - §4.6 → Pell word and dictionary.
- **Pattern repair.** The informal "(primitive cycles, Pell word and orientation contracts)" appeared at §§1.5, 4.3, 4.4 and 4.6. It is replaced by slugs in all four places.

Pell witness for [3,6]:
- T³S·T⁶S = [[17,−3],[6,−1]], trace 16 = ε+ε⁻¹ with ε = 8+3√7.
- Fixed points satisfy 2z²−6z+1 = 0, so z = (3±√7)/2.
- At w = (3+√7)/2, cw+d = 8+3√7 > 1, so the derivative is 1/(8+3√7)² < 1 and w is attracting.

## F02 (P3) — applied
Review b, F02.

Verified against DIT16 lines 157–167 (pp.952–953) and lines 387–405 (p.959). Locators were added before the existing route sentences:
- **§3.1:** DIT16 line 164. The text says the source does not double.
- **§3.2:** DIT16 line 387. The lift replaces the source's nearest-boundary-point argument.
- **§3.3:** DIT16 line 393. The height normalization replaces the source's boundary ordering.

In §3.3 I used line 393, where the sentence begins, instead of the reviewer's 394. The Mathlib height formula was already cited in §3.3.

## Checks

- **Elaboration.** `lake env lean packages/FuchsianOrbifoldsPartII/Suggested.lean`: exit 0. There are only the five expected `declaration uses 'sorry'` warnings, at lines 56, 65, 81, 88 and 97.
- **Suggested.lean.** Unchanged. The elaborated signatures in the job's scratch still match the README: 8 declarations, no binder lost. A fresh `#check` pass was not needed because no declaration changed.
- **Dependency check:** `depcheck: 56 roadmaps, 634 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

## Adversarial pass on new text

| Statement | Instance | Values | Result |
|---|---|---|---|
| Point-removal use | order-2 chart, identity lift on a punctured unit disc | norm < 1; punctured limit 0; extension holomorphic, value 0 is in the open disc | holds |
| gap:primitive-pell-word | [3,6], D=28 | trace 16 = (8+3√7)+(8−3√7); derivative at w is (8+3√7)⁻² < 1 | holds |
| gap:primitive-pell-word, nonprimitive | [4,4] | word = ([4] word)², trace 194 = ε²+ε⁻² for ε = 2+√3 | excluded by "primitive" |
| gap:primitive-minus-cycle-invariant | D=12 | [4] ≠ [3,2] as rotations, matching I ≠ J | consistent with §4.6 |
| gap:narrow-dictionary-compatibility | D=12, (1+√3) | norm −2 < 0, so the class is J ≠ 1 in the native group | consistent with Conventions Check |

## Maintainer notes

- **Gap slugs.** `primitive-minus-cycle-interface` no longer exists. AutomorphicSpectralTheory §4.17a now owes three gaps under the new slugs, plus the unchanged reversal gap.
- **Other files.** No Lean names changed. `metadata.toml` and `sources.toml` are unchanged.
- **Untrusted text.** Neither review contained suspicious instructions.
