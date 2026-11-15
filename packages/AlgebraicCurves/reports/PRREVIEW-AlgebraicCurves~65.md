# Review of AlgebraicCurves (pull request #1807 at 89357f3)

**Verdict:** accepted

Incremental re-review of the 130 lines changed since `c8821a4`. No findings.

## Previous findings

- The previous review, of `c8821a4`, raised no finding; there is none to account for. Its one remark on untouched text (the first Check of §6.4 in characteristic 2) is repaired at `TauCetiRoadmap/AlgebraicCurves/README.md:1061–1064`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.4 first Check (README 1061–1064) | `y² = x` at `x = a = b² ≠ 0`, char ≠ 2 and char 2 | Char ≠ 2: `b ≠ −b`, two factors, two places, `e = f = 1`, `2·1·1 = 2`. Char 2: `x − a = (y − b)²`, one place, `e·f = 2·1 = 2 = [k(y) : k(x)]` | holds | none |
| §9.3 chain rule (README 1655–1658) | `k(x)`, `y = x²`, char ≠ 2; char 2 | `(dy) = −4P∞ + (P₀ + P∞) = P₀ − 3P∞`; `div(2x) + (dx) = (P₀ − P∞) − 2P∞ = P₀ − 3P∞`. Char 2: `x²` is not separating, excluded by hypothesis | holds | none |
| §9.3 trace-residue local component (README 1660–1664) | `ℚ(x)`, `P = P_{x²+1}`, `t = x² + 1`, `ω = x dx/t`; `𝔽_p(a)(x)`, `t = x^p − a` | `ω/dt = 1/(2t)`, residue `1/2`, trace over `ℚ(i)/ℚ` is `1`; with `−1` at `P∞` the sum is `0`. Second: `dt = 0` and `F_P/k` inseparable, both excluded | holds | none |
| §9.3 "every prime element separating" over perfect `k` (README 1666) | `t` with `ord_P t = 1`, `k` perfect of characteristic `p` | A non-separating `t` lies in `F^p`, so `p ∣ ord_P t`; `p ∤ 1` | holds | none |
| §10.6 pinned Kummer local data without (c), (d) (README 1880–1884) | `y² = x`; `y⁶ = x²` on `k(x)`, char ∤ 6 (fails (d)); `n = 1` | `y² = x`: at `P₀` `r = 1`, `e = 2`, `d + 1 = 2`; at `P_{x−1}` `r = gcd(2, 0) = 2`, `e = 1`, `d = 0`. `y⁶ = x²`: `F′ = k(y)`, `x = ±y³`, `e = 3 = 6/2` at `0`, `∞`; Hurwitz `3·(−2) + 2 + 2 = −2`. `n = 1`: `e = 1` | holds | none |
| §11.2 Check on `x ↦ 1/x` (README 1967–1969) | char ≠ 2; char 2 | `a = 1/a ⇔ a² = 1`: `a = ±1`, two places, `0 ↔ ∞`. Char 2: `(a − 1)² = 0`, the one rational fixed place `x = 1` | holds | none |
| §11.2 Check on `y² = x⁵ − 1` (README 1970–1974) | `𝔽₁₁`, `ℚ(ζ₅)`, `ℚ` | `3⁵ = 243 = 22·11 + 1`, so `ζ = 3`; five roots and `∞` give `6 = 2·2 + 2` rational branch places. Over `ℚ`: `x⁵ − 1 = (x − 1)·Φ₅`, places of degree `1` and `4`, plus `∞` | holds | none |
| §11.5 Check on `y² = x⁶ − 1` (README 2162–2165) | `ℚ(ζ₁₂)`, `ℚ` | `i = ζ₁₂³`, `ζ₆ = ζ₁₂²`. `(iy/x³)² = x⁻⁶ − 1`; its square is `y ↦ −y`; reduced group `D₆` of order `12`, total `24 ≤ 84`. Over `ℚ`: `−1` is not a square in `F` | holds | none |
| Scope bullets on SchemeAndStackFoundations and AlgebraicVectorBundles (README 73–86) | their READMEs on main | SchemeAndStackFoundations 140–143: "not an input here", "restates nothing"; §§3.1–3.3 at 5751, 5785, 5863; §4.15 at 7054. AlgebraicVectorBundles 156–157 names AlgebraicCurves only as owner of curve degree theory | agrees | none |
| Consumer line for DiophantineApproximationAndTranscendence (README 2425–2427) | its README on main | Line 96 takes Layer 9's comparison with Weil differentials; line 3920 lists it in Layer 5's dependencies (Layer 5 starts at 2939) | agrees | none |

The rows of the previous review for untouched statements stand as in that review, of `c8821a4`.

- Gate: the worker's gate at `89357f3` passes every check (`build=0`, `depcheck=0`, `stray-files=0`). A rerun without the pull request's folder list reports only `outside-folder=24`, all 24 files in the twelve sibling folders this pull request owns; the diff against main outside the thirteen folders is empty.
- Dependency check output: `depcheck: 245 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`: only `declaration uses sorry` at lines 80 and 104. The file, `lake-manifest.json` and `lean-toolchain` are unchanged since `c8821a4`; both elaborated signatures keep every binder and match README §11.4.
- Library declarations opened at the Tau Ceti pin `2fd255d`, 5 new citations: `FieldTheory/FunctionField/Differential/Independence.lean:199` (chain rule: exact constants, two separating elements, no rational place), `:253` (independence of the comparison), `:275` (trace residues: separable residue field, separating prime element, no condition on `k`), `:386` (residue theorem, in the section with `[PerfectField k]` at 317); `FieldTheory/FunctionField/Different/Radical.lean:259` and `:269` (`F⟮y⟯ = ⊤`, `(n : k) ≠ 0`, `u ≠ 0`, with `FiniteDimensional F F′` and separability at line 72; no root of unity, no irreducibility; the second as `d + 1 = n / gcd`).
- Cross-roadmap citations resolved against main `1a19c9f`, 5: SchemeAndStackFoundations §4.15 and Layer 3 (§§3.1–3.3), AlgebraicVectorBundles, DiophantineApproximationAndTranscendence Layer 5, and the internal references 12B.0d (README 2252), §8.2 with 12B.0b (1312, 2232), 12D (2353), §§0.4 and 3.1. The worker's resolver lists none unresolved.
- Seeded sample: §§6.4, 10.6, 11.2 and 11.5 fall in changed passages; the change in each is a Check or a pinned citation, computed in the table. The other eleven targets are untouched.
- Pull request text against this head: the summary sentence on AlgebraicCurves, "rewritten in the house shape", "drops two declarations now proved in Tau Ceti" (pinned as `TauCeti.isDomain_tensorProduct_of_separating`, `FieldTheory/Separable/Regular.lean:142`, and `TauCeti.genus_le_genus_of_constantCompositum_eq_top`, `ConstantExtension/Genus/Basic.lean:243`), "Consumer sentences rewritten" and the merge-order line `AlgebraicCurves: this pull request → #1808` all hold.
- Remark on untouched text: README line 35 says the route is "function-field-first, following Stichtenoth"; no change is asked here.

Overlap check: read CanonicalModelsAndGonality (lines 23, 29, 116), FunctionFieldArithmetic (5, 29, 38) and JacobianChallenge (open), and RamificationOfCompleteDiscretelyValuedFields, NumberFieldArithmetic and EllipticCurves (118, 357, 367) (main); nothing shared: the two open roadmaps and EllipticCurves cite AlgebraicCurves for places, divisors, constant extensions and the regular model, JacobianChallenge is its supplier, the other two do not mention it. #1808 also changes this folder; the description's merge-order block puts this pull request first.

Source independence: changed passages only; 7 passages compared with 0 readable sources (their only cited source is `Stichtenoth2009`, uncertified), none shared; largest share `Stichtenoth2009`, about 170 of about 400 locators; contents not compared again (the diff adds, removes and reorders no layer), and `Stichtenoth2009`'s text and table of contents could not be read.

## Not verifiable

- `Stichtenoth2009` Thm. 4.3.2(a), (d) and Rem. 4.3.7(d) (§9.3), Prop. 3.7.3 (§10.6), Thm. 3.3.7 and Cor. 3.3.8 (§6.4), Ex. 3.16–3.18 (§§11.2, 11.5): settled as uncertified, text not read. The docstrings at `Independence.lean:29–30, 60–62` and `Radical.lean:19–20` of the Tau Ceti pin give the same numbers for 4.3.2(a), 4.3.2(d), 4.3.7(d) and 3.7.3(b).

## Source issues

- none

## For the human reviewers

- **Not tested.** `Stichtenoth2009` has the largest share of the locators and its text is not readable here: wording and arrangement were not compared with it. README lines 35 and 2438 say the route follows it and map its chapters to layers.
