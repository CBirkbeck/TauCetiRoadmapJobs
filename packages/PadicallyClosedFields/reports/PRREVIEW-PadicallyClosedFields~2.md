# Review of PadicallyClosedFields (pull request #2905 at 98fa4dc)

**Verdict:** accepted

**Summary.** Accepted: the three findings of the previous review are repaired and no finding remains. The two Kochen statements now carry `0 < f`, the second step of Lem. 3.5 is true as restated, and the uniqueness of the p-adic closure is stated in `Suggested.lean` in a form I checked in both directions. There are two small corrections and one format note, none blocking. No cited source could be read legally, so the locators and the comparison of wording and arrangement with Prestel–Roquette remain for the human reviewers.

## C01 — "An Eisenstein polynomial for `L` with coefficients in `K`" has a false reading

In the second step of Lem. 3.5 (1.3, line 185) the polynomial is Eisenstein for the valuation of `K`, not of `L`. Read with the valuation of `L`, the constant term would be an element of `K` whose value is that of a prime element of `L`, and for `K = ℚ_p ⊆ L = ℚ_p(√p)` there is none; read with the valuation of `K` the step is true there (`X² − p`, root `√p`) and in general: the completions of the core fields form a totally ramified extension of degree `e_L/e_K`, Krasner's lemma moves the coefficients of an Eisenstein polynomial into the core field of `K`, and a root lifts to `L` by Hensel's lemma for the coarse valuation. Writing "an Eisenstein polynomial over `K`, for the valuation of `K`, of degree `e_L/e_K`" removes the doubt.

## C02 — The second Check of 1.5 asserts that the p-rank hypothesis of Cor. 3.11 is needed, and gives no instance where the conclusion fails

For `ℚ_p(√p)` and `ℚ_p(√(up))` (line 222) the equivalence of Cor. 3.11 holds anyway: `p` is an `n`-th power for `n = 2` in the first only, and the fields are not isomorphic. So the pair shows that the corollary is silent, not that the hypothesis is needed. An instance where the equivalence fails: `K = L = ℚ_3`, `L' = ℚ_27`, the unramified cubic extension, of p-rank `3`. For `a = 3^k·ζ·w` in `ℚ_3` (`ζ = ±1`, `w ∈ 1 + 3ℤ_3`), `a` is an `n`-th power in `ℚ_27` exactly when `n ∣ k`, `ζ` is an `n`-th power in `μ_26` (for `ζ = −1`: `n` odd, as in `μ_2`), and `log w ∈ 3·3^{v_3(n)}·O ∩ ℤ_3 = 3^{v_3(n)+1}ℤ_3`, which are the conditions in `ℚ_3`. So `K ∩ Lⁿ = K ∩ L'ⁿ` for all `n`, and `L`, `L'` are not isomorphic.

## N01 — "The p-adic closure of `L'`" in Layer 2 means that `L'` is p-adically closed

In the paragraph on Rem. 4.12 (line 250), `L'` is the p-adically closed target of Thm. 4.3; "the proof uses that `L'` is p-adically closed only through its value group" says what is meant, since a p-adic closure is another object (1.2).

## Previous findings

- R01 — repaired: `isPValuationOfType_iff` and `range_kochen_eq` take `(hf : 0 < f)`; Conventions and 0.1 say "for natural numbers `e, f ≥ 1`".
- R02 — repaired: "some prime element of `L` is a root of an Eisenstein polynomial … with coefficients in `K`, so that `K` contains a prime element of `L` when `K` is algebraically closed in `L`" (wording: C01).
- R03 — repaired: `isPresburgerGroup_iff_padicClosure_unique` states `IsPresburgerGroup (valueGroup V) ↔` any two p-adically closed algebraic extensions of p-rank `d` over `(K, V)` are `K`-isomorphic as valued fields.
- C01 — repaired: the Check uses `ℚ_p((t))`, `K(√t)`, `K(√(ut))` of p-rank `1`; the added second bullet is C02 of this report.
- C02 — repaired: squares contain `p^(2k)` and miss `p^(2k+1)`; each condition `|g(x)| ≤ |h(x)|` is decided near `0` by the lowest-order terms.
- C03 — repaired: "the fraction field of every substructure … with the induced valuation, is again p-valued of p-rank `d`"; "a substructure is a subring".
- C04 — repaired: the docstring names only the five copies the file declares; the unused Tau Ceti import and the README's "From Tau Ceti" contract are gone; the file elaborates with `import Mathlib` alone.
- C05 — repaired: the scope sentence owns "the parameter-free quantifier elimination in `pcLang d`", and gives the elimination over a fixed `F` to LogicAndDefinabilityInNumberTheory §2.2.
- C06 — repaired: the description now says that the other roadmap's scope paragraph excludes arbitrary p-adically closed fields and that this README names it.
- N01 — repaired: the docstring names, for 0.2–0.3, 2, 3.4 and 6, the carrier each lacks.
- N02 — repaired: `IsFormallyPadic` is no longer declared; 0.1 defines "formally p-adic of p-rank `d`" in prose.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `isPValuationOfType_iff` with `0 < e`, `0 < f` | `ℚ_2`, `ℚ_3`, `e = f = 1`; `π` with `e·v(π) < v(p)`; residue `x̄^q ≠ x̄` | no pole (disc `5`, `−3` non-squares in `ℚ_2`); `v(γ(π)) = e·v(π) − v(p) < 0`; `v(γ) ≤ −v(p)` | both directions hold | none |
| `range_kochen_eq` with `0 < f` | `ℚ_p`, `f = 1`; `ℚ_p`, `f = 2`; `a = 0` | `p·a·y² − y − p·a = 0` has root `y ≡ −pa`, then `x^q − x = y` by Hensel; `γ(0) = 0` | range is `ℤ_p` | none |
| `isPresburgerGroup_iff_padicClosure_unique` | `ℚ` with `ℤ_(p)`; `ℚ_p((t))`; `K` not henselian | `Γ = ℤ`, closure `Kʰ` unique; `ℤ ×ₗ ℤ`, closures with `√t`, `√(ut)` not isomorphic; `Kʰ` embeds uniquely, `L = Kʰ` | both directions agree with Thm. 3.2 | none |
| 1.3, Lem. 3.5 second step | `ℚ_p ⊆ ℚ_p(√p)`; `ℚ ⊆ ℚ_p`; `K` algebraically closed in `L` | `X² − p`, root `√p ∉ K`; `X − p`; root algebraic over `K`, so in `K` | true for the valuation of `K` | C01 |
| 1.5 Check, first bullet | `K = ℚ_p((t))`, `L = K(√t)`, `L' = K(√(ut))` | p-ranks `1, 1, 1`; `t ∈ L²`, `t ∉ L'²` since `√u` gives residue degree `2` | inside Cor. 3.11, not isomorphic | none |
| 1.5 Check, second bullet | `ℚ_p(√p)`, `ℚ_p(√(up))`; `ℚ_3`, `ℚ_27` | powers differ at `n = 2`, not isomorphic; same `n`-th powers from `ℚ_3` for all `n`, not isomorphic | claim true, instance does not show it | C02 |
| Layer 4, substructures | `∅` in `ℚ_p(√p)` with `u = (1, √p)` | subring `ℤ[√p]`, fraction field `ℚ(√p)`, `O/p` of dimension `2` | true for the fraction field | none |
| Layer 4 Check on `Pₙ` | `g = a·x^i(1+…)`, `h = b·x^j(1+…)`; squares in `ℚ_p` | near `0`: `|g| = |a||x|^i`, `|h| = |b||x|^j`, decided by `i, j, |a|, |b|`; `p^(2k)` in, `p^(2k+1)` out | squares not quantifier-free in `valLang` | none |
| Layer 5, Thm. 6.15 "of any type and p-rank" | `w` of type `(e', f')` beside henselian `v` of type `(e, f)` | both of type `(max(e, e'), lcm(f, f'))`; uniqueness within one type gives `w = v` | follows from the statement for one type | none |
| Scope sentence on Macintyre | LogicAndDefinabilityInNumberTheory §2.2 at its open head | heading "2.2 Cell decomposition and preparation"; scope: fixed finite extension, "not over arbitrary p-adically closed fields" | owners distinct | none |

The rows of the previous review for untouched statements stand as in the previous review, of `c07ebef`.

- Source locators checked against the text: 0 (Prestel–Roquette resolves only to a paywalled page; nothing else was readable).
- Library declarations opened at the pin: `ValuationSubring.ofPrime`, `idealOfLE`, `primeSpectrumEquiv` (`Mathlib/RingTheory/Valuation/ValuationSubring.lean` lines 298, 284, 374); no `IsSaturated` in either pinned library.
- Cross-roadmap citations resolved: SaturationAndQuantifierElimination Layer 0, §§2.5, 3.3, 4.3 at its open head; LogicAndDefinabilityInNumberTheory §2.2 at its open head; LocalFieldsRamificationPartII §§1.3, 5.1 on main.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: exit 0, thirteen `sorry` warnings, nothing else. No file changed outside the folder.
- One-tactic probe (`rfl`, `simp`, `constructor <;> simp`, `infer_instance`) on the new theorem: does not close. Elaborated types of the three changed theorems compared with the README: `0 < f` present, no binder lost.

Overlap check: read AxKochenErshov, SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheory, LogicAndDefinabilityInNumberTheoryPartII, LocalFieldsRamificationPartII; shared: Macintyre's elimination (over a fixed `F` with coefficients: LogicAndDefinabilityInNumberTheory §2.2; parameter-free over all models: this roadmap, now stated so in the scope); `valLang`, `valueGroup`, coarsening: AxKochenErshov; `IsPresburgerGroup`: SaturationAndQuantifierElimination.

Source independence: changed passages only; 0 passages compared with 0 sources (none readable); largest share Prestel–Roquette, about 66 of about 72 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again, and the contents page could not be read.

Research link: Layers 1–5 are Prestel–Roquette 1984 and Macintyre 1976; Layer 7 is the direction that Efrat 1995 and the Galois characterization of p-adically closed fields reverse; Layer 6 is Jarden–Roquette 1980 and Kochen 1969. Rests on the README's references, not on a text read.

## Not verifiable

- Prestel–Roquette, *Formally p-adic fields* (LNM 1050): every locator, among them the changed passages on Lem. 3.5 (pp.39–44), Rem. 4.12 (p.82), p.84 and Thm. 6.15 (p.115); the publisher's page is paywalled.
- The expanded account of Rem. 4.12 (a saturated henselian `L'` with `ℚ ⊗ Γ = ℚ + Γ` and no condition on the residue field) could not be compared with the print.
- Macintyre 1976, Efrat 1995, Jarden–Ritter 1979: as in the previous review.

## Source issues

- none

## For the human reviewers

- Not tested: Prestel–Roquette carries about 66 of about 72 locators and could not be read; wording and arrangement were not compared with it.
- Arrangement: by the README's own theorem numbers, Layers 0, 1, 2 cite only results 2.x, 3.x, 4.x, Layers 3–4 only 5.x, Layer 5 only 6.x, Layer 6 only 7.x, in the book's order; the layer scopes were not compared with its contents page.
- Licence: the description says the texts of Prestel–Roquette and Macintyre were read through institutional access on the publishers' sites, and Thm. 6.15 from a scan; the reviewer could not confirm the copies.
