# Review of NewtonPolygons (pull request #2609 at 6235623)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 86 lines changed since `5007ca6`, and the one finding of the previous review is repaired — the Eisenstein target of §6.1 now assumes degree `d ≥ 1`, with the constant `1` recorded as a negative-control Check. The four small corrections and the format note of that review are repaired as well, and no repair introduced a new problem; the description matches this head. There are no small corrections and no format notes; two points remain for the human reviewers (a licence and the pin), unchanged from the previous review.

## Previous findings

- R01 — repaired: §6.1 (lines 877–882) now reads "a monic `f ∈ O[X]` of degree `d ≥ 1` satisfying Mathlib's `Polynomial.IsEisensteinAt`"; the Check (line 892) has `d ≥ 1` and a new Check records `f = 1` as the excluded case.
- C01 — repaired: §5.3 (lines 827–832) opens "Over a complete algebraically closed field, with the *zero divisor* of a nonzero entire series the multiset of its zeros counted with multiplicity (Convention 8)".
- C02 — repaired: §2.4 (lines 555–557) reads "the line through the first and last coefficient points has slope `m` and every coefficient point lies on or above it", which is the statement of `Polynomial.forall_mem_newtonSlopes_eq_iff`.
- C03 — repaired: the Check of §2.3 (line 539) reads "the secant slopes `⌈√n⌉ / n` are positive and tend to `0`".
- C04 — repaired: §4.3 cites Lazard Propositions 2 and 4 with (2.7′) and calls the multiplicity the roadmap's own definition; §0.6 says its constructions have no source; in §5.2 the locator stands on the Converse bullet; §6.1 names its route.
- N01 — repaired: the three citations read "RestrictedPowerSeries §§7.1–7.2", which are that roadmap's "7.1 Series on an open disc" and "7.2 Entire series and polynomial division".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §6.1 Mathlib's Eisenstein, `d ≥ 1` | `X + p`; `X² + 2X + 2` over `ℚ₂`; general `d` | Heights `(1,0)`: slope `−1`. Heights `(1,1,0)`: slope `−1/2` twice. Chord at `n`: `1 − n/d < 1 ≤ v(aₙ)`; `v(a₀) = 1`, `v(a_d) = 0` | true |
| §6.1 route through `Polynomial.irreducible_of_eisenstein` | hypotheses at the pin | Needs integer values, `v(lead) = 0`, `v(coeff 0) = 1`, `1 ≤ v(coeff n)` for `0 < n < d`; all hold for monic Eisenstein at `𝔪`, `d ≥ 1` | true |
| §6.1 Check, the constant `1` | `f = 1`, `d = 0` | `leadingCoeff = 1 ∉ 𝔪`; no `n < 0`; `coeff 0 = 1 ∉ 𝔪²`: Eisenstein. Polygon `{(0,0)}`; `1` a unit | true, tests the bound |
| §2.4 purity sentence | `1 + pX`; `X² + pX + p²`; `1 + X + pX²` | Chord slope `1`: `m = 1` both sides true, `m = 2` both false. Heights `(2,1,0)`: pure `−1`. Heights `(0,0,1)`: `(1,0)` below chord, slopes `{0,1}`, both false | true in both directions |
| §2.3 Check, secant slopes | `n = 1,…,5`; `n → ∞` | `1, 1, 2/3, 1/2, 3/5`; `0 < ⌈√n⌉/n ≤ (√n + 1)/n → 0`; infimum `0` not attained | true |
| §5.3 converse and uniqueness | `1 − X²/p` over `ℂ_p`; trivial norm; finite family | Divisor `{±√p}`; `(1 − X/√p)(1 + X/√p) = 1 − X²/p`. Trivial norm: entire means polynomial, units constants. Finite family gives a polynomial | true |
| §5.2 Converse (locator moved) | `x` of norm `r > 0` | Convergence at `x` means `‖aₙ‖ rⁿ → 0`, which is restrictedness at `r`; Lazard p. 48 gives `v(aₙ) + n·v(x) → ∞` | true |
| §4.3 locators; docstring of `exists_zeros_card_eq` | `X − α` with `‖α‖ <, =, > r` | (2.7′): dominant ⇔ all roots `v ≥ μ`, extremal ⇔ all `v = μ`. `l = 1, 0, 0`; `u = 1, 1, 0` | true; locators support the reading |

The rows for the statements the change does not touch stand as in the previous review, of `5007ca6`.

- Source locators checked against the text: 4. Lazard (2.7′) (Lazard line 209–210), Proposition 2 (Lazard line 288–292), Proposition 4 (Lazard line 358–362), p. 48 convergence criterion (Lazard line 73–81).
- Library declarations opened at the pin: 4. `TauCeti/NumberTheory/NewtonPolygon/Slopes.lean:432` (`Polynomial.forall_mem_newtonSlopes_eq_iff`), `TauCeti/NumberTheory/NewtonPolygon/Irreducible.lean:142` (`Polynomial.irreducible_of_eisenstein`), `Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean:57` (`Polynomial.IsEisensteinAt`) and `:232` (`Polynomial.IsEisensteinAt.irreducible`, with `0 < f.natDegree`).
- Cross-roadmap citations resolved on main: RestrictedPowerSeries §§2.1–2.3 (evaluation; substitution and translation; derivatives and Hasse derivatives) and §§7.1–7.2.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No change outside the folder.
- Automatic checks: all passed, rerun on this head.
- Elaboration of `TauCetiRoadmap/NewtonPolygons/Suggested.lean`: six `sorry` warnings and nothing else. The change touches one docstring and no statement, so the signature comparison and the one-tactic probe of the previous review stand.
- Pull request text: 19 Checks and 28 example bullets counted at this head, as the description says; its notes on §2.4, §5.3 and §6.1 and the citation "§§7.1–7.2" agree with the head.
- Sample: of the seeded targets, §§0.6, 2.4, 4.3, 5.3 and 6.1 fall in changed passages and were checked; the others are untouched.

Overlap check: read CompactOperators, PadicExtensionFamilies, FormalLaurentPuiseux and RestrictedPowerSeries; nothing shared — the change moves no object, and the owners stand as in the previous review (restricted series and preparation: RestrictedPowerSeries; Fredholm determinants: CompactOperators; Laurent and Puiseux fields: FormalLaurentPuiseux; ramification polygons: PadicExtensionFamilies; convex sequences, coefficient polygons, slope factorisation and zero counts: this roadmap).

Source independence: changed passages only — 3 passages compared with 1 source (Lazard: the §4.3 sentence against (2.7′), the Converse bullet of §5.2 against p. 48, the docstring of `exists_zeros_card_eq` against Propositions 2 and 4), none shared and none translated; largest share Lazard, as in the previous review (19 of 48 locators there; the change drops one Lazard and one Koblitz locator in §0.6); the change adds, removes and reorders no layer, so the contents were not compared again: independent as before.

Research link: Layers 4–5 state Lazard's 1962 theory of zeros of analytic functions over complete valued fields (Propositions 2 and 4, (4.13)); §4.2 is Kedlaya's 2007 slope factorisation (Theorem 7); the Hodge comparison is "Newton above Hodge" (KedlayaNumerical Theorem 16), used for Fredholm determinants; Layer 6 serves Iwasawa-theoretic preparation. Rests on the README and the three texts read.

## Not verifiable

- Koblitz IV §§3–4 (the first-break definition of §2.4, in a changed paragraph): a Springer book, not in the sources cache; the purity sentence beside it was checked against the Tau Ceti declaration and by computation.
- BGR §5.2 (§4.3 and the docstring of `exists_zeros_card_eq`): a Springer book, not in the cache; the Lazard locators beside it were read.
- The public repository named in the provenance section was not opened, so its declarations were not compared with `Suggested.lean`.

Automatic checks set aside as false positives: the citation resolver reads the source key KedlayaNumerical §3 in the Layer 2 dependencies as a citation of a roadmap; it is a reference key listed under References.

## Source issues

- none

## For the human reviewers

- Licence: the provenance section of the README names a public repository (WilliamCoram/PhD at a fixed revision) as a source of candidate implementations for reuse with attribution. Its licence was not read, and its declarations were not compared with `Suggested.lean`.
- Scope of the pin: the folder's generated `STATUS.md` lists a pure slope factorisation and a normalised disc preparation as landed in Tau Ceti; neither is at the pinned revision, where §§4.1–4.2 are still targets. A newer pin would turn them into supplier contracts.
