# Review of StablePeriodicCurved (pull request #2668 at 14176fa)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 24 lines changed since `041f6c6`, and of the description, and it found nothing false or unsupported. The three small corrections to the README (flatness in §7.5, "truncation" in §4.5 and its echoes, the Buchweitz locator in §2.6) and the one to the description are repaired, each checked against the source or by computation, and the description agrees with this head. Two format notes remain, neither blocking. Nothing is left for a human to decide.

## N01 — The existence and uniqueness of minimal free resolutions over a noetherian local ring (§4.5, lines 888–892) still carries no locator; a standard reference would let a reader check the hypotheses.

## N02 — Two lines of the repaired passages run past the README's line width (line 886 in §4.5 and line 1414 in §8.2, each over 100 characters), and line 1289 in §7.5 is left short; a reflow of the three paragraphs would restore the wrapping.

## Previous findings

The review of `041f6c6` had no findings (R). Its small corrections and its format note, each checked at this head:

- C01 — repaired: §7.5 now reads "Flatness of `W` is the standing hypothesis of Orlov's Theorem 3.9 (Orlov, §3.1)". Orlov2004 lines 717–718 (§3.1, p. 16) make flatness of `W : X → 𝔸¹` part of the data; no claim about non-zero-divisors remains.
- C02 — repaired: §4.5 says "the brutal (stupid) truncation in degrees at most `-p`"; the Examples of Layers 4 and 7 and §8.2 say "brutal truncation" and "brutally truncated". No other occurrence of the unqualified word refers to a complex.
- C03 — repaired: §2.6 closes with "(Buchweitz, §1.1 and §8.1)". Read in the 1986 manuscript: §1.1 (lines 248–249) has perfect ⇔ finite projective dimension for a module; §8.1 (lines 2782–2783) the quasi-Frobenius case.
- C04 — repaired: the description says "It is replaced by a 221-line file"; the file at this head has 221 lines.
- N01 — not repaired: §4.5 still states minimal free resolutions over a noetherian local ring with no locator. Carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (source or pin / roadmap) | Result | Change |
|---|---|---|---|---|
| §4.5 tail as brutal truncation | `k[x]/(x²)`, `M = k`, `p = 0`, `m = 1`; general `p`, `m` | brutal truncation of the unfolding in degrees ≤ 0: `⋯ → A → A`, the tail; degree `j ≤ −p` holds `P_(−j)` by `P_(i+m) = P_i`, `i ≥ p` | sound | none |
| Layer 4 Example, `A/(xⁱ)` | `(x^(n−i), xⁱ)`, `P_k` in degree `−k` | `P₁ → P₀` is parity 1 → 0, the second map `xⁱ`; cokernel `A/(xⁱ)`; next map `x^(n−i)`, kernel of `xⁱ` is `(x^(n−i))` | sound | none |
| Layer 7 Example | `(xⁱ, x^(n−i))`, `P_k` in degree `1 − k` | `P₁` in degree 0, `P₀` in degree 1; the map 0 → 1 is the first map `xⁱ`, as the resolution requires | sound | none |
| §8.2 minimal resolution (sample) | `n = 3`, `i = 1`; exponent `n − i` | maps `x`, `x²`, `x`, … all in `(x)`; parity 1 → 0 is `xⁱ = x`, parity 0 → 1 is `x²`; agrees with the Layer 4 Example | sound | none |
| §7.5 flatness sentence (sample) | `w = 0`; Orlov §3.1 | `k[t] → S`, `t ↦ 0`: `S` is `t`-torsion, not flat, so excluded; Orlov2004 lines 717–718 require `W` flat; Theorem 3.9 at line 986, p. 21 | sound | none |
| §2.6 locator | `k[x]/(x²)`; `ℤ` | §8.1: over a quasi-Frobenius ring every finitely generated module is maximal Cohen–Macaulay; §1.1: perfect module ⇔ finite projective dimension, so `D_sg(ℤ) = 0` | sound | none |

The rows for the untouched statements stand as in the previous review, of `041f6c6`.

- Source locators checked against the text: 3 (Orlov §3.1 and Theorem 3.9; Buchweitz §1.1; Buchweitz §8.1).
- Library declarations opened at the pins: none new; the diff changes no library name (`TauCeti.PeriodicComplex.unfoldFunctor` and `TauCeti.MatrixFactorization.powerXPeriodicComplex` are cited as before).
- Cross-roadmap citations: the diff changes none; the internal references of the changed passages (§§2.3, 2.5, 4.5, 7.4, 8.2, 8.3) resolve to headings at this head.
- Automatic checks: all passed, and a rerun of the gate is clean. Dependency check output: `depcheck: 185 roadmaps, 2084 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings and nothing else; the file is unchanged since `041f6c6`, so the signature comparison and the one-tactic probes of the previous review stand.
- Description against the head: 48 Check bullets in 35 Checks blocks; sections §0.1–§8.4; a 221-line `Suggested.lean` with nine theorems and three definitions; four headlines named as not statable in the module docstring; suppliers GrothendieckEulerForms §§0.2, 0.4 and DGAInfinity Layers 0, 1, 5; the `HasFiniteGlobalDimension` remark at README line 1574. All as the description says. It states that the pull request revises the roadmap on main, which old sections moved where, and that the old Lean catalogue is replaced.
- The pull request changes no file outside the folder.

Overlap check: not reread this round, since the 24 changed lines touch no ownership statement and the overlap listing reports no shared roadmap, dropped id or second copy; as read for the review of `041f6c6`: HopfologicalAlgebra, DGAInfinity, McKaySkewGroup, GrothendieckEulerForms, ArtinAlgebras and the open GorensteinHomologicalAlgebra. Morphism-ideal quotients, Frobenius exact and stable categories, periodic complexes, curved modules, totally acyclic complexes and Gorenstein-projective modules: owner this roadmap. Exact structures: owner GrothendieckEulerForms. DG conventions and pretriangulated envelopes: owner DGAInfinity.

Source independence: changed passages only; 3 passages compared with 2 sources (Orlov, Buchweitz), none shared; largest share Stai, about 10 of 55 locators, as in the previous review; the diff adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 2 and 7 state Buchweitz's (1986) and Orlov's (2004) singularity-category equivalences and Eisenbud's (1980) matrix-factorization theorem; Layer 4 states Stai's (2018) identification of Keller's (2005) triangulated hull; Layer 6 states Positselski's second-kind theorems (survey 2023). Rests on the README's References and the sources read.

## Not verifiable

- Nothing in the changed passages. The three items of the previous review stand unchanged (Happel, Chapter I §2 and Theorem I.2.6, behind a paywall; Keller–Vossieck, Example 2.3, read only through OCR; Keller, *Chain complexes and stable categories*, §§1–4, section headings not extracted).

## Source issues

- none

## For the human reviewers

- none
