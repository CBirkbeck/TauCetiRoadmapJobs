# Review of EllipticCurveModularityWild3Adic (pull request #1484 at 6fcc253)

**Verdict:** needs changes

Incremental re-review of 88 changed lines since e5a4533, plus the check of the pull request's title and description against this head. One finding (P3), in the description; the folder's changed passages have none.

## R01 (P3) — The description misstates the Conrad–Diamond–Taylor conductor condition

**Location:** pull request description, summary block, third paragraph: "The argument follows BCDT, with Conrad–Diamond–Taylor for conductors prime to 27 and for the switch at 5."

**Claim:** "Prime to 27" means prime to 3. The head's theorem covers every conductor not divisible by 27, including conductors divisible by 3 and by 9.

**Witness:** `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:1314` (§6.9): "the conductor of `E` is not divisible by 27". For `N = 99 = 3²·11`: `gcd(99, 27) = 9 ≠ 1`, yet `27 ∤ 99`, so §6.9 applies.

**Repair:** Replace the sentence by: "The argument follows BCDT, with Conrad–Diamond–Taylor for conductors not divisible by 27 and for the switch at 5."

## Previous findings

- none to carry: the previous report (at e5a4533) raised no finding. The four repairs it recorded from the first report are still in place (README:29,492,588 for §§A6.10–A6.12, A6.21; README:1316,1364 for §5.10; README:899,998 for residual membership; README:121,218 for `ψ(1/3) = ζ`).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §6.9 (touched by R01): conductor not divisible by 27 | `N = 11`, `99`, `27`, `243` | `gcd(N, 27) = 1, 9, 27, 27`; `27 ∣ N`: no, no, yes, yes. "Prime to 27" admits only `N = 11`; §6.9 admits `11` and `99` | README statement correct; description wrong (R01) |
| §1.5 (sampled; new heading and introduction) | `s² = 3`, `β² = s`, `α³ − 3α + 3 = 0`; norms to `ℚ₃(s)` | `v₃(α) = 1/3`, `v₃(β) = 1/4`, `v₃(α/β) = 1/12`; `e·f = 12·2 = 24`; `N(α) = (−3)⁴ = 81`, `N(β) = (−s)⁶ = 27`, `N(α/β) = 3`; `1 + α` is a root of `Y³ − 3Y² + 5`, `N(1 + α) = (−5)⁴ = 5⁴ ≡ 4 mod 9`; `γ₄²(β) = j²β = −β` | Pass; agrees with BCDT lines 2766–2826 |
| §1.3 and §1.5 introductions: which sections use the fields | `*Needs:*` lines of 2.5, 3.1, 3.5, 2.6, 2.7, 4.1, 5.1, 1.14 | 2.5: 1.3, 1.4; 3.1: 1.3, 1.4; 3.5: 1.4; 2.6: 1.5, 1.6; 2.7: 1.7; 4.1: 1.5–1.7; 5.1: 1.7; 1.14: 1.7 | Pass; every named consumer lists the field sections |
| §3.1 (sampled; new heading and introduction) | `e = 3`, `ℓ = 3`, `r ∈ {0,…,3}`; `δ = ±1` | Constant group: `r ≡ 3 mod 2`, so `r = 1, 3`; `μ₃`: `r = 0, 2`; morphism exponent `3(3 − 1)/2 = 3`; dual `r ↦ 3 − r` sends `1 ↦ 2`; `G(0) = −1` (§1.3), `−2 ≡ 1` (§1.4), so `c_π(0) = δ` | Pass; agrees with BCDT lines 2960–2965, 2095–2099, 2678–2684 |
| §3.1, §3.6, §3.8 introductions | `*Needs:*` of 3.6, 3.7, 3.8, 3.9, 6.8 | 3.6: 3.2, 3.4; 3.7: 3.3, 3.4, 3.5; 3.8: 3.4, 3.6, 3.7, 2.9; 3.9: 3.8, 2.10; 6.8: 3.9, 4.7, 5.12 | Pass |
| §4.1 introduction: five families; `[γ₄²] = −1` range | `F′₃`, `F′₋₃`, `F′_i` (`i = 0, 1, 2`); `r = 0, 2, …, 12` | `1 + 1 + 3 = 5` families; `(−j)^r = (−1)^{r/2}` is `+1, −1, +1, −1, +1, −1, +1`, so `−1` exactly at `r = 2, 6, 10`; `*Needs:*` of 4.3, 4.4, 4.5, 5.1, 5.3, 5.4, 5.5 each list 4.1 or 4.2 | Pass |
| §4.3, §4.6 introductions | `*Needs:*` of 4.6, 4.7 | 4.6: 4.3, 4.4, 4.5, 2.6, 2.9; 4.7: 4.6, 2.11 | Pass |
| §5.6 introduction: "at least one diagonal comparison map" | The four pairs `(r, s)` against §5.7 | `(2,6)`: `Θ₁ = 0`; `(6,10)`: `Θ_ω = 0`; `(2,10)`: both; `(6,6)`: `Θ_ω = 0`. Count of vanishing diagonal maps: 1, 1, 2, 1 | Pass |
| §5.9 (sampled; new heading and introduction) | `t = 2, 6, 8`; `N = 1, 2`; `(N, M) = (2, 1)` | `u¹²e′_ω` lies in the filtration iff `12 − r + t ≥ s`: `12 ≥ 6`, `12 ≥ 10`, `18 ≥ 10`; `#A_N = 3, 9`; at `N = 1`, `T = 0`; lengths `1 → 2 → 1`; `det = ε mod 3 = ω` | Pass; agrees with BCDT lines 1728–1737, 4236–4247 |
| §5.1, §5.9 introductions | `*Needs:*` of 5.6, 5.7, 5.9, 5.10, 5.11, 5.12 | 5.6: 5.2–5.4; 5.7: 5.2–5.4, 5.6; 5.9: 5.1, 5.2, 5.6; 5.10: 5.6, 5.8, 5.9; 5.11: 5.5, 5.6, 5.10; 5.12: 5.8, 5.11 | Pass |

The rows for all untouched statements stand as in the previous review, of `e5a4533`.

- Gate, run again on this head: every count 0, `OK`; the worker's record adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/EllipticCurveModularityWild3Adic/Suggested.lean`: exit 0, ten `declaration uses 'sorry'` warnings (lines 40, 57, 65, 73, 79, 85, 102, 112, 123, 142) and nothing else. The file is unchanged since `f6083a51`, so the `#check` comparison and the one-tactic probe of the earlier rounds stand.
- The diff changes `README.md` only: 11 group headings renamed, 22 numbered sections turned from `###` headings into bold run-in titles under them, 11 introductory paragraphs added. No statement, locator, `*Needs:*` line, Check or supplier citation changed; nothing changed outside the folder.
- Source locators checked against the text for the three sampled targets inside changed passages: 7 (BCDT §6.3 p. 900 at line 2766; §4.5 p. 876 at line 1628; §7.1 p. 904 at line 2960; Lemma 5.2.1 p. 886 at line 2095; Lemma 5.7.1 p. 898 at line 2678; Theorem 4.6.3 p. 878 at line 1728; §9.5 p. 932 at line 4236). The other twelve sampled targets lie outside the diff.
- Cross-roadmap citations: the citation service lists none unresolved; its one Lean-name lead, `BarsottiTate.extend_genericFibre` (README:90), is a target of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, as before. The only other roadmap that names this one (ModularCurvesPartII, README:4544) cites Layer W3.6, which the diff does not touch.
- Pull request text, the remaining sentences checked against the head: the title (adds a roadmap: 1563 insertions, 0 deletions); the folder's three files; "six normal forms" (§§1.9–1.10); "four wild types and three conductor-243 extended types" (§§0.3–0.8); "any characteristic-zero field" (§1.15); "matrix Hilbert 90 over any field" (`matrixHilbert90`, `[Field K]` only); "every odd prime and arbitrary ramification" (§2.1); "only that roadmap's conditional comparison layers" (R29.3–R29.6, README:19); the sixteen suppliers named under *From TauCetiRoadmap suppliers*; the validation line (gate and elaboration above).
- Remarks on untouched text, no change requested. README:15 says "conductor prime to 27" where §6.9 (README:1314) and README:3 say "not divisible by 27". After the regrouping a number such as 3.1 names both a group heading and its first item; every self-citation still resolves through the bold titles.
- Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2ModularityLifting, EllipticCurveModularityTotallyReal, PadicLocalLanglandsForGL2Qp, ClassicalSerreModularity, PadicExtensionFamilies, LocalFieldsRamification, RamificationOfCompleteDiscretelyValuedFields; the diff claims no new object. Remark on untouched text: EllipticCurveModularityTotallyReal §2.3 imports the twisted curve from EllipticCurveModularityImaginaryQuadratic §0.2 (`fixed_pairing_twist`, `fixed_pairing_twist_rational`: number fields, `p ∈ {3, 5}`), while §1.15 here states it for `p = 5` over every characteristic-zero field; the two coincide for `p = 5` over number fields.

Source independence: 22 passages compared with 1 source (changed passages only: the 11 new headings and 11 introductions against BCDT's contents, lines 363–384, and the openings of its §§6.3, 7.1, 9.5), none shared; largest share BCDT, 65 of about 90 locators; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- The description's "AI assistance" sentence (the counts of review and red-team rounds on the job board): the board's history is not among the materials of this review.
- Serre, Corps locaux, and BBM §4.2.14: settled as waived and uncertified; cited by untouched text only, not reread.

## Source issues

- none

## For the human reviewers

- none
