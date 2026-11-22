# Review of HigherLocalClassFieldTheory (pull request #1813 at 26008d3)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding, carried from the previous review. The roadmap folder at this head is identical to the one read at `d1a62ff` (no line changed), so the finding stands as written: in mixed characteristic every statement from 2.7 on excludes residue characteristic `2`, including the classical local fields over `ℚ_2`, although the theorems are published for every `p`. The two small corrections and the format note of the previous review also stand, none blocking; two questions for the author and three points for the human reviewers remain.

## R01 (P2) — In mixed characteristic the theorems from 2.7 on are stated for odd `p` only, which removes true, published cases, the classical local fields over `ℚ_2` among them

The convention says: "For `F` of mixed characteristic, the statements of 2.7, 2.9 and 2.10 and of Layers 3–5 assume `p ≠ 2`" (Conventions, lines 62–66), and Scope and ownership lists "Higher local fields of mixed characteristic with `p = 2` beyond Layers 0–1, 2.1–2.4, 2.8 and the first step of 2.9" under what the roadmap does not own (line 1106), with no owner. A library built from this plan has no reciprocity map, no existence theorem and no injectivity for `ℚ_2{{t}}` or any field over it. The restriction comes from the route (Vostokov's formula, which Fesenko 2001, §3.2, gives for odd `p`), not from the mathematics: the sources the README cites state the results for every `p` (Fesenko 2001, §4.7, Theorem; Invitation §6.6, Theorem 3), and Fesenko 2001, §4.7, Remark 5 (author's copy, lines 614–623) attributes the existence theorem also to Kato's paper on it, a second published route. A plan restricted to the primes its chosen route handles is what a roadmap must not be, however carefully the gap is recorded.

The convention also cuts more than the gap it records. For `n = 1` every finite extension of `ℚ_2` is of mixed characteristic with `p = 2`, so by the convention 4.5–4.7 do not apply to it; but there `K_1^top(F) = Fˣ`, `Λ_1 = 1`, the `2^r`-torsion is `μ_{2^r} = {ζ}·K_0^top`, and no explicit pairing is needed. The Check of 4.7 still says "For `F` a finite extension of `ℚ_p` … `Ψ_F` is `artinMap F`" for every `p` (line 959), and the pinned `artinMap` has no such restriction. Likewise 2.9 for `n = 1`, `F = ℚ_2`: both assertions hold (`⋂ lℚ_2ˣ = 1`; `2`-torsion `{±1}`), and the text excludes it.

The smallest repair keeps the statements for every `p` and gives the case `p = 2` an owner. (1) Restrict the convention to `n ≥ 2`, and say that in dimension one the items hold for every `p` with the classical inputs. (2) For `n ≥ 2`, state 2.7, 2.9 and the existence theorem for every `p` again and name what proves them at `p = 2`, as targets of this roadmap or as a named roadmap that owns them: the nondegeneracy of `K_n^top(F)/2 × Fˣ/2 → ℤ/2` (the cup-product pairing of 2.9 at `r = 1`, which needs no formula to be defined), and the torsion statement. Kato's existence theorem and the 2-adic formula of Beliaeva and Vostokov are the two published candidates; I have read neither, so which carries the route is the author's choice. If the case goes to a separate roadmap, Scope and ownership names it, and the Summary says so.

## C01 — The description still announces a target on index-two subgroups at `p = 2` and says Fesenko's statements are targets for every `p`

"index-two subgroups at `p = 2`" (Layer 5) and "5.4 rests on Fesenko 1991a" describe a section the head does not have: 5.4 is the existence theorem and 5.5 injectivity. The point "`p = 2` in mixed characteristic" should say what the head does: from 2.7 on the mixed-characteristic statements assume `p` odd, the case `p = 2` is listed as not owned, (A4a) is claimed for prime degree and for `F_d` only. Rewrite after R01 is settled.

## C02 — 2.7 uses a topological basis of `VK_m^top(F)/p` in every degree `m` and does not say what it is

"[Fesenko 1991a, Proposition 3.2] gives the corresponding topological basis of `VK_m^top(F)/p`" (lines 535–537), and the torsion step of 2.9 reads a Cauchy sequence in it in degree `m − 1`. The symbols are listed only for `m = n`; for `m < n` the last entries run over `(m − 1)`-subsets and the conditions on the indices are not the ones displayed, so a reader without that paper cannot recover the statement. State the basis in degree `m`.

## N01 — The `*Needs:*` line of 3.1 omits 3.2(b), and "a proper divisor" should exclude `1`

(A3c) for prime `d` is taken from 3.2(b), while 3.2 needs 3.1 (line 779): naming the item in each direction shows there is no cycle. In the induction for composite `d` (line 731), `d' = 1` gives `M = F` and proves nothing; write `1 < d' < d`.

## Questions for the author

- 2.9, first step: "This step holds for every `p`, including `p = 2`: it uses only 2.8" (lines 622–623). Fesenko 2001, §4.7 (author's copy, lines 491–496) proves the same step from the description of `VK_m^top(F)/p` given by Vostokov's symbol compared with Bloch–Kato, not from Bloch–Kato alone. How is an open subgroup of a graded piece extended to `VK_m(F)` without a topological basis? I could not settle it from the texts.
- 2.7 and 5.4: do Propositions 3.2 and 3.3 of Fesenko 1991a state the basis in every degree `m` and the annihilator description for every `n`, and does its §3 say what the scope paragraph reports about `p = 2`? The paper is behind a paywall; Fesenko 2001, §3.2 (line 229) confirms only that the formulas are given for odd `p`.

## Previous findings

- R01 — not repaired: "For `F` of mixed characteristic, the statements of 2.7, 2.9 and 2.10 and of Layers 3–5 assume `p ≠ 2`" (lines 62–63, unchanged); the folder has no changed line. R01 above.

The small corrections C01, C02 and the format note N01 of the previous report are likewise unchanged and are written again above.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Convention "`p` odd from 2.7 on" | `n = 1`, `F = ℚ_2`; `ℚ_2{{t}}` | `ℚ_2`: mixed characteristic, `K_1^top = Fˣ`, `Λ_1 = ⋂ lℚ_2ˣ = 1`, 2-torsion `{±1} = {ζ_2}·K_0`; all true, all excluded | R01 |
| 4.7 Check against the convention | `F/ℚ_p` finite, `p = 2` | Check (line 959): `Ψ_F = artinMap F` for every `p`; convention: 4.7 assumes `p ≠ 2` | disagree; R01 |
| 2.9 first step, "uses only 2.8" | sources at `r = 1` | README: Bloch–Kato only; Fesenko 2001 lines 491–496: Vostokov's symbol and Bloch–Kato | question |
| 3.1 composite `d` | `d' = 1`; `d = 4`, `d' = 2` | `d' = 1`: `M = F`, the step assumes the claim for `L/F`; `d' = 2`: `[L:M] = 2 < 4`, induction applies | N01 |

The rows for the untouched statements stand as in the previous review, of `d1a62ff`.

- Source locators re-read this round: 4 (Fesenko 2001, author's copy: §3.2 at line 229; §4.7 at lines 486–496, 576–582; Remark 5 at lines 614–623). The others stand as in the previous review.
- Library declarations: `Suggested.lean` is unchanged; none newly cited.
- Cross-roadmap citations: none added or changed; the resolver finds none missing on main or at the open heads.
- Dependency check: `depcheck: 168 roadmaps, 1961 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not in the merge order yet and is checked as placed after its last supplier.
- Automatic checks: all passed on this head. No change outside the roadmap folder against the base.
- Elaboration of `Suggested.lean` under the defaults: three `sorry` warnings (lines 49, 54, 79) and nothing else. The five elaborated types agree with the README as before; none lost a binder.
- Seeded sample: no sampled target falls in a changed passage, since there is none.
- Overlap check: read FunctionFieldArithmetic, KTheoryFiniteLocalFields, ClassFieldTheory, LocalAnabelianGeometryPartII, LocalFieldsRamification (scopes as in the previous review; the change adds no object); nothing shared.

Source independence: changed passages only: 0 passages changed, so none compared anew (the previous review compared 5 passages with 3 sources, none shared); largest share Fesenko 2000a, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

Research link: Layers 3–5 are the explicit higher local class field theory of Fesenko (1991, 2000, 2001) for the reciprocity map of Parshin (1984) and Kato (1979–82), with Vostokov's (1985) formula and Bloch–Kato (1986); it rests on the README's references and on the seven texts read.

## Not verifiable

- Fesenko 1991a (2.7: Proposition 3.2, Lemmas 1.2 and 2.2; 5.4: Proposition 3.3; scope: §3): behind a paywall, no open copy found.
- Kurihara 1998 and Beliaeva–Vostokov 1998 (scope paragraph, including what the latter's Correction says): not read; the first only through Fesenko 2001, §4.7, Remark to the proof.
- Fesenko 1991b, Parshin 1984, Vostokov 1985, Kato 1980, Serre's *Local Fields*: as in the previous review.

## Source issues

- **Gap** in Fesenko 2000a (Invitation, Part I, section 6) at §6.8.3, Corollary, printed page 73: the source says the sequence (A4a) is exact for every cyclic extension, as a consequence of the prime-degree theorem and the torsion; it should give the passage to composite degree, which is not formal; affects nothing.
- **Gap** in Fesenko 2000a at §6.6, proof of Theorem 3, case `r = 1`, printed page 69: the source says the step follows from Bloch and Kato's graded pieces alone; it should say how open subgroups are produced, which Fesenko 2001, §4.7 does through Vostokov's symbol; affects the proof.

## For the human reviewers

- Scope: the only finding is that mixed characteristic with `p = 2` is excluded from 2.7 on (README lines 62–66, 1106–1115). Whether a roadmap may leave that case unowned is the decision the verdict rests on; the head has not changed since it was raised.
- Name: K2SymbolsBrauer and CrystallineCohomology on main name a consumer `HigherLocalFieldsAndHigherClassFieldTheory`; this folder is `HigherLocalClassFieldTheory`. Whether the names are aligned is yours to decide.
- Sources: the README cites fifteen works and four are recorded for it (Invitation sections 1, 7, 8, 10). Section 6, Fesenko 2001 and Bloch–Kato 1986 were read and are unrecorded; Fesenko 1991a, 1991b, Kurihara 1998, Beliaeva–Vostokov 1998 and Serre were not read.
