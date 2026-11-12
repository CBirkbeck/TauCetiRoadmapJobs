# Review of AlgebraicCurves (pull request #1807 at a877716)

**Verdict:** needs changes

## R01 (P3) — The description does not state the AlgebraicCurves rewrite, and its summary sentence misstates main's theorem

**Location.** The pull request description, `<!-- roadmap-summary -->`: "AlgebraicCurves extends automorphism finiteness in genus at least two over exact constant fields to perfect fields in every characteristic and, with positive geometric genus, arbitrary fields". No other sentence describes the AlgebraicCurves revision.

**Claim.** The sentence says main's theorem held over exact constant fields, which are more general than perfect fields. The description also never says that this roadmap on main is rewritten throughout, or that its `Suggested.lean` drops two declarations.

**Witness.** Main's `Suggested.lean:88–90` assumes `[IsAlgClosed k] [CharZero k]`. The head drops `isDomain_tensorProduct_of_isSeparable` and `genus_le_genus_of_constantCompositum_eq_top`. The README changes by 4596 lines, removing 25 headings and adding 94.

**Repair.** Replace the sentence with: "AlgebraicCurves extends automorphism finiteness in genus at least two from algebraically closed fields of characteristic zero to perfect fields in every characteristic and, with positive geometric genus, to arbitrary fields." Then add this paragraph:

"**AlgebraicCurves** (on main) is rewritten throughout in the house shape: Layers 0–12 with numbered sections, Checks and exact supplier contracts. Its only roadmap suppliers are JacobianChallenge, FormalLaurentPuiseux and LocalFieldsRamification, and it cites by name the results proved at the Tau Ceti pin. Its Suggested.lean drops `isDomain_tensorProduct_of_isSeparable` and `genus_le_genus_of_constantCompositum_eq_top`, now Tau Ceti's `TauCeti.isDomain_tensorProduct_of_separating` and `TauCeti.genus_le_genus_of_constantCompositum_eq_top`. It restates `finite_algEquiv_of_two_le_genus` over perfect fields with exact constants and adds `finite_algEquiv_of_two_le_genus_of_genus_constantCompositum_pos`."

I tested the paragraph against the head and the pin:

- The head's supplier headings (README lines 164–291) name exactly those three roadmaps.
- EllipticCurves appears only as a consumer (lines 62, 1747, 2417).
- The two pinned replacements are `Separable/Regular.lean:142` and `ConstantExtension/Genus/Basic.lean:243`. Both are at least as general as the dropped statements: the first holds for any domain `A`, and the second needs no exactness.

## Previous findings

- R01 — repaired: README lines 74–86 now read "§4.15, which takes no input from this roadmap" and "AlgebraicVectorBundles also takes no input from this roadmap". The SchemeAndStackFoundations bullet is gone from `## Downstream consumers` (lines 2415–2432).

## Verified sound

| # | Statement (changed passage) | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| A1 | §6.4 Kummer Check, both characteristics (README 1061–1064) | `y² = x` at `P_{x−1}` over `ℚ` and over `𝔽₂` | `ℚ`: `T² − 1 = (T − 1)(T + 1)` with `1 ≠ −1`, two places, `Σ ef = 1 + 1 = 2`. `𝔽₂`: `x − 1 = (y − 1)²`, so `ord_{P_{y−1}}(x − 1) = 2`, `e·f = 2·1 = 2 = [k(y) : k(x)]` | holds | none |
| A2 | §9.3 chain rule, the pinned `weilDifferentialOfSeparating_eq_derivativeOfSeparating_smul` | `x`, `y = x²` on `k(x)` with char ≠ 2; char 2 | Chain rule: `(2x dx) = (P₀ − P∞) − 2P∞ = P₀ − 3P∞`. Hurwitz: `−2(2P∞) + P₀ + P∞ = P₀ − 3P∞`. In char 2, `dy/dx = 0` and `y` is not separating, so the hypothesis excludes it | holds | none |
| A3 | §9.3 local components as trace residues, for `F_P/k` separable | `x dx/(x² + 1)` on `ℚ(x)` with `t = x² + 1`; `P_{x^p − s}` on `𝔽_p(s)(x)` | `ω/dt = 1/(2t)`, so the residue is `1/2` and `Tr_{ℚ(i)/ℚ} = 1`, matching the Check. With `F_P = k(s^{1/p})` purely inseparable, `Tr ≡ 0` (`Tr 1 = p = 0`): the separability hypothesis is load-bearing | holds | none |
| A4 | §10.6 Kummer local data without (c) or (d) (README 1880–1885) | `y⁴ = x²` over `k(x)`, char ≠ 2; `y³ = x` over `ℚ` | `y² = ±x`, so the degree is `2 < 4`. At `P₀`: `r = gcd(4, 2) = 2`, so `e = 2` and `d + 1 = 2`, which is right for `y² = x`. At `P_{x−1}`: `r = 4`, `e = 1`, `d = 0`. Over `ℚ`, `y³ = x` at `P₀`: `e = 3`, `d = 2`, though (c) fails | holds | none |
| A5 | §11.2 rigidity Checks (seeded sample, README 1966–1974) | `x ↦ 1/x` over `ℚ` and `𝔽₂`; `y² = x⁵ − 1` over `𝔽₁₁` and over `ℚ` | `a² = 1` gives `±1` over `ℚ`, and only `1` over `𝔽₂` (`0 ↔ ∞`). Over `𝔽₁₁`, the fifth roots of unity are `1, 3, 4, 5, 9` (e.g. `3⁵ = 243 ≡ 1`), giving 6 rational fixed places with `6 = 2g + 2 < 7`. Over `ℚ`, the branch degrees are `1 + 4 + 1 = 6` | holds | none |
| A6 | §11.5 Check `y² = x⁶ − 1` (README 2162–2165) | over `ℚ(ζ₁₂)` and over `ℚ` | `(iy/x³)² = −(x⁶ − 1)/x⁶ = x⁻⁶ − 1`. The reduced group is `D₆` of order 12, and with the hyperelliptic involution it has order `24 ≤ 84`. Over `ℚ`, only `x ↦ ±x`, `y ↦ ±y` exist (order 4); `x ↦ ±1/x` would need `√−1` | holds | none |
| A7 | Scope bullets, README 73–86 (repair of the previous R01) | SchemeAndStackFoundations and AlgebraicVectorBundles on main `7740b1c` | SchemeAndStackFoundations, lines 139–143: "not an input here", and Layer 3 "restates nothing". §§3.1–3.3 (lines 5751, 5785, 5863) cover the dichotomy, genus base change, scheme Riemann–Hurwitz and bundle degrees. AlgebraicVectorBundles, line 157: "Curve-specific degree theory is AlgebraicCurves'" | holds | none |
| A8 | `finite_algEquiv_of_two_le_genus`, main against head (touched by R01) | `ℚ̄`; `𝔽̄₃` with the Hermitian curve; `𝔽₃(t)` | `IsAlgClosed` implies perfect and exact, so the head's version implies main's. Hermitian `g = 3`: only the head covers it, giving `|PGU₃(3)| = 6048`, finite. `𝔽₃(t)` is not perfect and falls under the general headline with `hK` | head is strictly more general | R01 |

The rows for the statements this diff does not touch stand as in the previous review, of `9eacb17`. Those are A1–A16 and the rows carried from review ~60, including both `Suggested.lean` headlines.

- **Gate.** My standalone rerun reports 0 on every scanner except `outside-folder=24`. Those 24 files are exactly the README and `Suggested.lean` of the 12 sibling folders that the brief names as this pull request's own. This is the same scope false positive as in reviews ~59–61. The worker's PR-aware gate passes every check, including `build=0`.
- **Dependency check.** It printed exactly `depcheck: 223 roadmaps, 1992 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives only `declaration uses 'sorry'`, at lines 80 and 104. The file is unchanged since `9eacb17`, and `signatures.md` shows every binder of review ~61 kept.
- **Pinned declarations opened (10).**
  - `Differential/Independence.lean:199, 253, 275, 386`;
  - `Different/Radical.lean:259, 269`;
  - `Place/Extension/Kummer.lean:414`;
  - `Automorphism/Rigidity.lean:78`;
  - `Automorphism/Finite.lean:99`;
  - `Separable/Regular.lean:142` and `ConstantExtension/Genus/Basic.lean:243`.

  The hypotheses of each match what the changed README text attributes to it.
- **Cross-roadmap citations resolved on main `7740b1c` (8 roadmaps).** SchemeAndStackFoundations (lines 139–143, 275, 5716–5863), AlgebraicVectorBundles 157, EtaleCohomologyFoundations 49/308/313, ModularCurves 594, AbhyankarLemma 97, BelyiMaps 578–579, EllipticCurves 118–619, and the consumer DiophantineApproximationAndTranscendence. The overlap facts are unchanged: #1808 and #1854 are ordered after this pull request, with no dropped ids.
- **Changes outside the folder.** The diff since `9eacb17` touches only the sibling folders this pull request owns.
- **Seeded sample.** Of the fifteen seeded targets, only §11.2 falls in the changed lines (row A5). Its locator is Stichtenoth Ex. 3.16–3.17.
- **Remark (untouched text, no change requested).** DiophantineApproximationAndTranscendence on main cites AlgebraicCurves Layer 9 as a supplier, but `## Downstream consumers` does not list it.

## Not verifiable

- `Stichtenoth2009` is settled as uncertified, so the changed passages' locators could not be read: Thm. 4.3.2(a), (d), Rem. 4.3.7(d), Prop. 3.7.3, Cor. 3.3.8 and Ex. 3.16–3.18. The pinned docstrings at `Independence.lean:195, 269` and `Radical.lean:255, 264` cite the same numbers.

## Source issues

- none
