# Review of HigherLocalClassFieldTheory (pull request #1813 at d1a62ff)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding. The previous finding (no route at `p = 2` in mixed characteristic) was answered by removing that case from the roadmap, so every statement from 2.7 on now excludes residue characteristic `2`, including the dimension-one comparison for `ℚ_2`, where nothing is missing; the theorems are published for every `p`, and a roadmap plans the general case. The other repairs (the kernel of `v_F` in 3.1 and 4.1, the composite case of (A3c), prime degree in 3.2(b), `{t_1, …, t_n}` in 2.7) are correct. There are two small corrections and one format note, none blocking, two questions for the author, and three points for the human reviewers.

## R01 (P2) — In mixed characteristic the theorems from 2.7 on are now stated for odd `p` only, which removes true, published cases, the classical local fields over `ℚ_2` among them

The new convention says: "For `F` of mixed characteristic, the statements of 2.7, 2.9 and 2.10 and of Layers 3–5 assume `p ≠ 2`" (Conventions, lines 62–66), and Scope and ownership lists "Higher local fields of mixed characteristic with `p = 2` beyond Layers 0–1, 2.1–2.4, 2.8 and the first step of 2.9" under what the roadmap does not own (line 1106), with no owner. A library built from this plan has no reciprocity map, no existence theorem and no injectivity for `ℚ_2{{t}}` or any field over it. The restriction comes from the route (Vostokov's formula), not from the mathematics: the sources the README cites state the results for every `p` (Fesenko 2001, §4.7, Theorem; Invitation §6.6, Theorem 3, and §10.5), and Fesenko 2001, §4.7, Remark 5 (author's copy, lines 614–623) attributes the existence theorem also to Kato's paper on it, a second published route. A plan restricted to the primes its chosen route handles is what a roadmap must not be, however carefully the gap is recorded.

The convention also cuts more than the gap it records. For `n = 1` every finite extension of `ℚ_2` is of mixed characteristic with `p = 2`, so by the convention 4.5–4.7 do not apply to it; but there `K_1^top(F) = Fˣ`, `Λ_1 = 1`, the `2^r`-torsion is `μ_{2^r} = {ζ}·K_0^top`, the basis of `Fˣ/2` is classical, and no explicit pairing is needed. The Check of 4.7 still says "For `F` a finite extension of `ℚ_p` … `Ψ_F` is `artinMap F`" for every `p` (line 959), and the pinned `artinMap` has no such restriction. Likewise 2.9 for `n = 1`, `F = ℚ_2`: both sides of each assertion hold (`⋂ lℚ_2ˣ = 1`; `2`-torsion `{±1}`), and the text now excludes it.

The smallest repair keeps the statements for every `p` and gives the case `p = 2` an owner. (1) Restrict the convention to `n ≥ 2`, and say that in dimension one the items hold for every `p` with the classical inputs. (2) For `n ≥ 2`, state 2.7, 2.9 and the existence theorem for every `p` again and name what proves them at `p = 2`, as targets of this roadmap or as a named roadmap that owns them: the nondegeneracy of `K_n^top(F)/2 × Fˣ/2 → ℤ/2` (the cup-product pairing of 2.9 at `r = 1`, which needs no formula to be defined), and the torsion statement. Kato's existence theorem and the 2-adic formula of Beliaeva and Vostokov are the two published candidates; I have read neither, so which carries the route is the author's choice. If the case goes to a separate roadmap, Scope and ownership names it, and the Summary says so.

## C01 — The description still announces a target on index-two subgroups at `p = 2` and says Fesenko's statements are targets for every `p`

"index-two subgroups at `p = 2`" (Layer 5) and "5.4 rests on Fesenko 1991a" describe a section the head no longer has: 5.4 is now the existence theorem and 5.5 injectivity. The point "`p = 2` in mixed characteristic" should say what the head does: from 2.7 on the mixed-characteristic statements assume `p` odd, the case `p = 2` is listed as not owned, 5.5–5.6 became 5.4–5.5, (A4a) is claimed for prime degree and for `F_d` only, and two references (Kurihara 1998, Beliaeva–Vostokov 1998) were added. Rewrite after R01 is settled.

## C02 — 2.7 uses a topological basis of `VK_m^top(F)/p` in every degree `m` and does not say what it is

"[Fesenko 1991a, Proposition 3.2] gives the corresponding topological basis of `VK_m^top(F)/p`" (lines 535–537), and the torsion step of 2.9 reads a Cauchy sequence in it in degree `m − 1`. The symbols are listed only for `m = n`; for `m < n` the last entries run over `(m − 1)`-subsets `J` and the conditions on `(𝐢, J)` are not the ones displayed. Fesenko 2001, §4.3 (author's copy, lines 349–356) gives the generators and refers to the same paper for the relations, so a reader without that paper cannot recover the statement. State the basis in degree `m`.

## N01 — The `*Needs:*` line of 3.1 omits 3.2(b), and "a proper divisor" should exclude `1`

(A3c) for prime `d` is now taken from 3.2(b), while 3.2(c) uses the norm group of 3.1: naming the item in each direction shows there is no cycle. In the induction for composite `d`, `d' = 1` gives `M = F` and proves nothing; write `1 < d' < d`.

## Questions for the author

- 2.9, first step: "This step holds for every `p`, including `p = 2`: it uses only 2.8" (lines 622–623). The Invitation's proof (§6.6, Theorem 3, case `r = 1`) names Bloch and Kato's graded pieces only, but Fesenko 2001, §4.7 (author's copy, lines 491–496) proves the same step from "the description of `VK_m^top(F)/p` provided by the Vostokov symbol" compared with Bloch–Kato. Which is it? To separate a class from `pVK_m(F)` by an open subgroup one must extend an open subgroup of a graded piece to `VK_m(F)`, and I do not see how without a topological basis. I could not settle it from the two texts.
- 2.7 and 5.4: do Propositions 3.2 and 3.3 of Fesenko 1991a state the basis in every degree `m` and the annihilator description for every `n`, and does its §3 say what the scope paragraph reports about `p = 2`? The paper is behind a paywall; Fesenko 2001, §3.2 (line 229) confirms only that the formulas are given for odd `p`.

## Previous findings

- R01 — partly repaired: "the statements of 2.7, 2.9 and 2.10 and of Layers 3–5 assume `p ≠ 2`"; nothing is stated without a route any more, but the case is cut, not owned. R01 above.

The small corrections and format notes of the previous report are all repaired: 3.1 and 4.1 now use the full kernel of `v_F`; 3.2(b) claims (A4a) for prime degree and 3.1 proves the composite case for `F_d`; 2.9 names the bullet of 2.3 by its title; 2.7 includes `{t_1, …, t_n}` in mixed characteristic; 2.6 needs 2.3; the former 5.4 is gone and Fesenko 1991a is cited by proposition. The first question of the previous report is answered by the induction in 3.1, which I checked (table).

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Convention "`p` odd from 2.7 on" | `n = 1`, `F = ℚ_2`; `ℚ_2{{t}}` | `ℚ_2`: mixed characteristic, `K_1^top = Fˣ`, `Λ_1 = 1`, 2-torsion `{±1} = {ζ_2}·ℤ`, `artinMap` defined: all true, excluded | R01 |
| 2.7 bases | `v_F` mod `p`; `(ℤ/(q−1))^n` mod `p` | listed symbols in `VK`, `v_F` onto `ℤ/p`: `{t_1..t_n}` needed; `p ∤ q−1`: torsion part dies | agrees for `m = n`; C02 for `m < n` |
| 2.9 statement and first step | `n = 1`, `p = 2`; sources at `r = 1` | true at `ℚ_2`; Invitation lines 321–328: Bloch–Kato only; Fesenko 2001 lines 491–496: Vostokov and Bloch–Kato | R01; question |
| 3.1 norm group | `q = 3`, `d = 2`, `θ = −1` | `θ' ∈ μ_8` primitive: `N θ' = θ'^{(q^d−1)/(q−1)} = θ'^4 = −1`; `N{θ', t_J} = {−1, t_J}`; kernel `VK ⊕ (ℤ/2)^n` | agrees |
| 3.1 (A3c), composite `d` | `d = 4`, `d' = 2`; `d = 6`, `d' = 2, 3`; `d' = 1` | `N_{L/M}(x − (1−σ)z) = (1−σ)y − (1−σ)N_{L/M}z = 0`; `1 − σ^{d'} = (1−σ)(1 + … + σ^{d'−1})`; `v_M(i{t}) = 1` since `e = 1`; `d' = 1` circular | sound for `1 < d' < d`; N01 |
| 3.2(b) (A4a) | axiom (A4); (A3c) | fesenko2000explicit lines 54–58: prime degree only; lines 48–52: (A3) for every finite `L ⊂ F^pur`, covered by 3.1 | agrees |
| 4.1 independence of `Π_Σ` | two prime elements | difference in `ker v_Σ = VK ⊕ (ℤ/(q−1))^n`, inside `N_{ΣL/Σ}K_n^top(ΣL)` by 3.1 | agrees |
| 5.4 existence, 5.5 injectivity (renumbered) | `μ_p ⊄ F`; kernel chain | `[F':F]` prime to `p`, preimage of index `p`; `ker Ψ = ⋂` norm groups `= ⋂` open of finite index `= 0` | agrees for odd `p`; Proposition 3.3 not read |
| Scope paragraph on `p = 2` | Fesenko 2001 | line 229: odd `p`, formulas at `2` "much more complicated"; lines 576–582: Kurihara's route for the induction on `r` only | agrees where readable |

The rows for the untouched statements stand as in the previous review, of `7d2ecd9`.

- Source locators checked against the text: 9 (fesenko2000explicit §10.1 at lines 37, 46–47, 48–52, 54–58; Invitation §6.6 at 314–328 and §6.7.2 at 381–407; Fesenko 2001 §3.2 at 229, §4.3 at 349–366, §4.7 at 486–496, 551–582 and Remark 5 at 614–623).
- Library declarations: `Suggested.lean` is unchanged since `7d2ecd9`; none newly cited.
- Cross-roadmap citations: none added or changed; no other roadmap, on main or open, cites a section of this one, so the renumbering of 5.5–5.6 breaks nothing.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. No change outside the roadmap folder.
- Elaboration of `Suggested.lean` under the defaults: three `sorry` warnings (lines 49, 54, 79) and nothing else. The five elaborated types agree with the README as before; none lost a binder.
- Seeded sample: of the sampled targets only 3.1 falls in the changed passages; checked above.
- Overlap check: read FunctionFieldArithmetic, KTheoryFiniteLocalFields, ClassFieldTheory, LocalAnabelianGeometryPartII, LocalFieldsRamificationPartII (as in the previous review; the change adds no object); nothing shared.

Source independence: changed passages only: 5 passages compared with 3 sources (fesenko2000explicit, Invitation section 6, Fesenko 2001), none shared; largest share Fesenko 2000a, as in the previous review; the change adds, removes or reorders no layer, so the contents were not compared again.

Research link: Layers 3–5 are the explicit higher local class field theory of Fesenko (1991, 2000, 2001) for the reciprocity map of Parshin (1984) and Kato (1979–82), with Vostokov's (1985) formula and Bloch–Kato (1986); it rests on the README's references and on the seven texts read.

## Not verifiable

- Fesenko 1991a (2.7: Proposition 3.2, Lemmas 1.2 and 2.2; 5.4: Proposition 3.3; scope: §3): behind a paywall, no open copy found.
- Kurihara 1998 and Beliaeva–Vostokov 1998 (scope paragraph, including what the latter's Correction says): not read; the first only through Fesenko 2001, §4.7, Remark to the proof.
- Fesenko 1991b, Parshin 1984, Vostokov 1985, Kato 1980, Serre's *Local Fields*: as in the previous review.

## Source issues

- **Gap** in Fesenko 2000a (Invitation, Part I, section 6) at §6.8.3, Corollary, printed page 73: the source says the sequence (A4a) is exact for every cyclic extension, as a consequence of the prime-degree theorem and the torsion; it should give the passage to composite degree, which is not formal; affects nothing.
- **Gap** in Fesenko 2000a at §6.6, proof of Theorem 3, case `r = 1`, printed page 69 (lines 321–328 of its text): the source says the step follows from Bloch and Kato's graded pieces alone; it should say how open subgroups are produced, which Fesenko 2001, §4.7 does through Vostokov's symbol; affects the proof.

## For the human reviewers

- Scope: the only finding is that mixed characteristic with `p = 2` is excluded from 2.7 on (README lines 62–66, 1106–1115). Whether a roadmap may leave that case unowned is the decision the verdict rests on.
- Name: K2SymbolsBrauer (README line 3403) and CrystallineCohomology (line 11538) on main name a consumer `HigherLocalFieldsAndHigherClassFieldTheory`; this folder is `HigherLocalClassFieldTheory`. Whether the names are aligned is yours to decide.
- Sources: the README cites fifteen works and four are recorded for it (Invitation sections 1, 7, 8, 10). Section 6, Fesenko 2001 and Bloch–Kato 1986 were read and are unrecorded; Fesenko 1991a, 1991b, Kurihara 1998, Beliaeva–Vostokov 1998 and Serre were not read.
