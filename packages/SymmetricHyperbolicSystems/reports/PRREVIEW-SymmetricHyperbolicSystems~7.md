# Review of SymmetricHyperbolicSystems (pull request #2246 at 5594d86)

**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and its one small correction (the clause in §2.3 on where `F = S.apply u` vanishes) is repaired at this head; the new sentence is true and no statement changed. There are no findings, no small corrections and no format notes. For the human reviewers: the texts of John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 could not be read, so their page and equation locators, and the arrangement against John, remain untested.

## Previous findings

The previous review, of `b986579`, had no finding (R); its one small correction is accounted for here.

- C01 of the previous review (§2.3, "vanishes where `u` does") — repaired: "on the open slab `F = S.apply u`, which is continuous and vanishes outside the same bounded set as `u` (the time derivative is taken at fixed `x`)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3, new sentence: `S.apply u` vanishes outside the bounded set of `u` | `n = N = 1`, `A⁰ = A¹ = 1`, `B = 0`, `u = xχ(x)`, `χ = 1` near `0`, `χ = 0` for `|x| > 2` | `S.apply u = χ + xχ′`: `0` for `|x| > 2`; `1` at `x = 0`, inside the set, as the wording now allows | true | none |
| §2.3, same sentence, general case | `u(t,x) = 0` for `t ∈ [0,T]`, `‖x‖ > R` | `{‖x‖ > R}` open: `∂ⱼu = 0` there; `∂ₜu = 0` at fixed `x`; so `A⁰∂ₜu + ΣAʲ∂ⱼu + Bu = 0` | true | none |
| §2.3 `integral_dotProduct_A0_sub_eq` (cited by the changed text; statement unchanged) | `A⁰ = 1`, `Aʲ = B = 0`, `u = tχ(x)`, `F = χ`; `T = 0` | left `t²∫χ²`; right `∫₀ᵗ 2s∫χ² ds = t²∫χ²`; `0 = 0` | holds; Lean has `hu`, `hsupp`, no hypothesis on `F`, as the README says | none |

The rows for the untouched statements stand as in the previous review, of `b986579`.

- Source locators checked against the text: 0 in this round; the changed passage cites no new locator, and the texts its section cites (John 1982, Lax 2006, Friedrichs 1954) could not be read (below).
- Library declarations opened at the pins: none new; the change names no library declaration.
- Cross-roadmap citations: none added or changed; none is a supplier.
- Automatic checks: all passed on this head when rerun. `lake env lean` on `Suggested.lean`: 0 errors, 14 `sorry` warnings, nothing else. `Suggested.lean` is unchanged since `b986579`; the two names the changed sentence cites, `integral_dotProduct_A0_sub_eq` and `integral_dotProduct_A0_le`, are declared there (lines 146 and 163).
- Dependency check: `depcheck: 124 roadmaps, 1404 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- The pull request's title and description agree with this head: a new roadmap of seven layers as listed, `Suggested.lean` imports only Mathlib; the change of this round alters nothing they describe.
- Overlap check: read CompressibleEulerEquations (open), PDE (main and its open revision), QuaternionicAnalysis (main), HankelFormsAndRealMomentProblems, OneStepMethodsForODEs and HamiltonJacobiAndConservationLaws; nothing shared. No other open pull request changes this roadmap, and none drops an id it cites.
- Source independence: changed passages only; 1 reworded passage compared with 0 sources, since the sources its section cites (John 1982, Lax 2006, Friedrichs 1954) could not be read; the sentence is commentary on this roadmap's own statement; largest share John 1982, 12 of 25 citations in the layers; no layer added, removed or reordered, so contents not compared again (John's table of contents could not be read).
- Research link: the linear theory of Friedrichs (1954) with the difference scheme of Courant–Friedrichs–Lewy (1928) and Lax; §1.2, §2.1–§2.3 and §7.3 are the linear inputs of the quasilinear theory (Kato, Majda) and are consumed by the open roadmap CompressibleEulerEquations. Rests on the README's references and that roadmap's text.

## Not verifiable

- John 1982, (3.6)–(3.8), p. 164 and (3.9)–(3.12a), p. 165 (the locators of §2.3, where the changed sentence stands): Springer, paywalled; no text among the sources held for this roadmap.
- Lax 2006, Theorem 4.3, pp. 41–42 and p. 45 (§2.3): no legal copy among the sources held for this roadmap.
- Friedrichs 1954, §7 Theorem 7, p. 361 (§2.3): paywalled; no text held.
- The remaining locators into these texts and into Rudin 1976, including those of the seeded sample outside the changed passage, are as in the previous reviews: not checked against a text in any round.

## Source issues

- none

## For the human reviewers

- **Not tested.** John 1982 has the largest share of the README's citations (12 of 25 in the layers); its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Not tested.** The page, theorem and equation locators into John 1982, Lax 2006, Friedrichs 1954 and Rudin 1976 were not checked against a text in any round.
