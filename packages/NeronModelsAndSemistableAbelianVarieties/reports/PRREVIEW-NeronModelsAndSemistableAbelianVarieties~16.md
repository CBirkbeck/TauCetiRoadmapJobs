# Review of NeronModelsAndSemistableAbelianVarieties (pull request #2708 at a62a075)

**Verdict:** accepted

**Summary.** Accepted: no findings. This is an incremental re-review of the 8 lines changed since `ac35abe`: the three small corrections of the previous review are repaired (the Conrad locator in 5.2 and in the `GoodIsogeny` docstring, the perfect-residue-field hypothesis in the description, and the unsupported locator for Ogg's formula in 5.3e), and the repairs introduce no new problem. The title and description agree with the head. One format note is carried over (a Fontaine page range); two questions for the author and two licence facts for the human reviewers stand as before.

## N01 — One Fontaine range starts a page early

In 5.3 (README line 3355) "Exposé VIII, … §§2.3.2–2.3.7, pp. 335–339": §2.3.2 begins on p. 336, and p. 335 carries §2.3.1. The References entry already gives 336. (Carried from the previous review; the line is unchanged.)

## Questions for the author

- Which step of the converse route in 3.9a uses that `k` is perfect? The text says the hypothesis is the one under which the sources state the converse; each input the route names is stated for an arbitrary discrete valuation ring. I did not check each supplier at that generality, so this stays a question.
- In 5.3e Saito's formula is stated for a *complete* discrete valuation ring with perfect residue field, while Liu's introduction sets it up for any discrete valuation ring with perfect residue field. Is completeness in Saito's Theorem 1, or added here? Saito 1988 is paywalled and I could not read it.

## Previous findings

The previous review (of `ac35abe`) had no findings (no R-numbered remark). Its other remarks:

- C01 — repaired: 5.2 (README line 3270) now reads "Conrad, Proposition 4.1(1), pp. 8–9, stated for an arbitrary discrete valuation ring, with 3.2 and `good` and `toric_zero` of 3.1"; the docstring (Suggested.lean lines 108–111) agrees.
- C02 — repaired: the description now reads "over the fraction field of a discrete valuation ring with perfect residue field".
- C03 — repaired: the separate `p ≥ 5` sentence with the Darmon–Diamond–Taylor remark is gone; 5.3e (README lines 3724–3732) derives Ogg's formula from Saito's theorem with the Liu locators.
- N01 — not repaired: README line 3355 still reads "pp. 335–339"; written again above as a format note.

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result |
|---|---|---|---|---|
| 5.2 / `GoodIsogeny`, with its new locator chain | `[p]` on good `E/ℚ_p`; `E_q → E_{q³}`; additive `E → E/C`; `[0]` | good ⇒ `t = 0`, `M_{A,k}⁰` proper of dimension `g`; 4.1(1): `f_k⁰` isogeny, so `M_{B,k}⁰` proper, `t_B = 0` | Tate pair: `t = 1` both, neither good; additive pair: neither semistable, neither good; `[0]` not an isogeny for `g > 0` | True for every DVR. Conrad Prop. 4.1(1) at conrad-semistable lines 322–335 (p. 8 into p. 9), `R` any DVR at line 321: match |
| 3.1 `good`, `toric_zero`; 3.2 equal ranks (cited by the new locator) | good; split Tate; additive | `(t,a) = (0,g)` ⇔ good among semistable; Tate `(1,0)` | 3.2: isogeny of semi-abelian varieties has finite kernel on torus and abelian quotient: ranks equal | The chain good ⇒ semistable ⇒ `B` semistable ⇒ `t_B = t_A = 0` ⇒ `B` good closes; README lines 1553–1560, 1582–1594 |
| 5.3e after the deletion | good; `I₀*`, `p ≥ 5`; `y² = x³ − x` over `ℚ₂` | `0 = 0 + 1 − 1`; `v(Δ) = 6` | `2 + 5 − 1 = 6`; `Δ = 64`, `f = 5`, `m = 2` (type III): `5 + 2 − 1 = 6` | True; the remaining sentence states the formula in every residue characteristic, so nothing is lost; line 4340 still points to 5.3e correctly |
| Pull request text against the head | each "Other places changed" bullet; the `Suggested.lean` sentence; "Left for StableReduction" | diff against main: 1 heading added (3.9a), 0 removed, 0 Lean statements changed, only the `GoodIsogeny` docstring | description: same; StableReduction on main lines 655–657 and 951 say what the description quotes | Agree; no sentence contradicted, no change unstated |

The rows for all other statements stand as in the previous review, of `ac35abe`; the diff changes no statement.

- Source locators checked against the text this round: 1 (conrad-semistable, Proposition 4.1(1), lines 321–335), plus pp. 9–10 (lines 343–372) read to confirm that the dropped locator carried no good-reduction statement.
- Library declarations: none newly opened; the elaborated type of `GoodIsogeny` is unchanged (six instance binders, `IsIsogeny f → (HasGoodModel R K A ↔ HasGoodModel R K B)`).
- Cross-roadmap citations resolved this round: StableReduction on main (the criterion is not its target; it lists this roadmap as consuming Layers 0–7), as the description says.
- Automatic checks: all passed; none set aside.
- Elaboration: `lake env lean` on Suggested.lean gives four `sorry` warnings (lines 68, 83, 112, 124) and nothing else.
- Changes outside the folder: none.
- The other open pull request that changes this README conflicts with it; the description states the order (that one first).

Dependency check output:

```text
depcheck: 182 roadmaps, 2080 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read StableReduction (main) again this round; RelativeJacobiansAndIntegralCurveModels, AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations (main) and FaltingsFinitenessAndIsogenyTheorems (open) stand as read at `ac35abe`, and the change touches no ownership. Néron models, semistable reduction, isogeny invariance of good reduction and the curve–Jacobian criterion are owned here; nothing shared.

Source independence: changed passages only: 2 passages (the locator sentence of 5.2 and the `GoodIsogeny` docstring) compared with 1 source (conrad-semistable), none shared; largest share conrad-semistable, about 40 of about 340 locators, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: 3.9a is Deligne–Mumford (1969), Theorem 2.4; 4.6 is Werner (1997) on Grothendieck's pairing; 5.3 rests on Coleman–Iovita (1999) and Fontaine (1994); 6.10–6.13 feed Boxer–Calegari–Gee–Pilloni (2021, 2025). Rests on the README and on the sources read in the previous review.

## Not verifiable

- Nothing new this round. The items of the previous review stand (Bosch–Lütkebohmert–Raynaud, SGA 7 I Exposé IX, Faltings–Chai, Serre–Tate 1968, Saito 1988, the Yuan–Zhang erratum: not readable legally); none bears on the changed passages.

## Source issues

- **Misprint** in conrad-semistable at Theorem 4.2, p. 9: the source says the integral closure of `R` in `K`; it should be in `K'`; affects nothing.
- **Misprint** in conrad-semistable at Proposition 4.1(2), p. 8: the source prints the conclusion that `f` is an isogeny twice; it should print it once; affects nothing.

## For the human reviewers

- Licence: the References link Tate's *Algorithm* (Lecture Notes in Mathematics 476) to a scan on a site that is not the author's (README, the Tate entry of References). Whether that link may stand is yours to decide.
- Licence: the Provenance section of the README names two Apache-2.0 Lean repositories as prior art for 1.8, 1.9, 5.0a, 2.8, 6.5 and 6.6 and says `HasGoodModel` differs from their good-reduction predicate. I did not open those repositories.
