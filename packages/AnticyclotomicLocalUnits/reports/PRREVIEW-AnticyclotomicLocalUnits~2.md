# Review of AnticyclotomicLocalUnits (pull request #1692 at edf0493)

**Verdict:** needs changes

🤖 Independent AI review. Incremental re-review of the 14 lines changed since `b30520a`, plus the pull request's title and description. One P3 finding, raised by the push gate; no P1 or P2.

## R01 (P3) — `letI` in the signature of the headline theorem (gate: `statement-hygiene`)

**Location:** `TauCetiRoadmap/AnticyclotomicLocalUnits/Suggested.lean:63–66`, “∃ (K : Type) (hK : Field K), letI := hK ∃ hNF : NumberField K, letI := hNF”.

**Claim:** The statement is in the form the gate accepts.

**Witness:** The gate at this head fails: `statement-hygiene=2`, “line 64: P3 `letI` in the signature of theorem `exists_auxiliaryQuadraticField`” and the same at line 66.

**Repair:** Replace lines 63–66 by the single line below and dedent nothing else; the rest of the statement and the docstring stay.

```lean
    ∃ (K : Type) (_ : Field K) (_ : NumberField K),
```

Tested on a scratch copy with the prescribed `lake env lean`: exit 0, `sorry` the only warning; `#check` gives `∃ K x, ∃ (x_1 : NumberField K), Module.finrank ℚ K = 2 ∧ NumberField.IsTotallyComplex K ∧ ∃ P Q, P.IsPrime ∧ Q.IsPrime ∧ P ≠ Q ∧ Ideal.span {2} = P * Q ∧ (Ideal.span {↑p}).IsPrime ∧ ¬p ∣ NumberField.classNumber K`, the same proposition as at the head with the two `letI` gone (the existential binders are picked up as local instances).

## Previous findings

- R01 — repaired: `README.md:76` now reads “specified there under “Coordinates”, “Augmentation regular sequence” and “Involution and twists””; all three bold labels are in SelmerIwasawaCohomology §3.0, and the three obsolete identifiers occur nowhere in the folder.
- R02 — repaired: `README.md:17, 118, 754, 882, 951, 987` cite ModularCurvesPartII §16.5, “Trivial character: the quotient of `J₀(N)`”; no “16.6” remains in the folder.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_auxiliaryQuadraticField` (§4.1; touched by R01) | p=3, 5, 7, 23; p=2; head signature against repaired signature | p=3,5: D=−7≡1 mod 8, (−7/3)=(−7/5)=−1, h=1. p=7: D=−15, (−15/7)=−1, h=2. p=23: (−7/23)=(−15/23)=+1, (−31/23)=−1, h=3. p=2: (2)=PQ, P≠Q, contradicts (2) prime, so `hp2` is needed. | true on all; both signatures elaborate to the same proposition | R01: form only |
| README worked example, auxiliary fields (line 1154; cites the same theorem) | D=−7 at p=13,17,19,31,41,47; D=−15 at p=11,29,37,43 | p mod 7 = 6,3,5,3,6,5, all non-residues; (−3/p)(5/p) = (−1)(+1), (−1)(+1), (+1)(−1), (+1)(−1); class numbers 1, 2 prime to each p | agrees | none |
| ModularCurvesPartII §16.5 citation (lines 17, 118, 754, 882, 951, 987) | §16.5 against §16.6 at the supplier's open head | §16.5: quotient of J₀(N), trivial character. §16.6: oldform copies of A_f in J₁(M), multiplicity τ(M/N); at N=11, M=22 that is 2 copies, not the quotient used in §§5.2, 6.3 | §16.5 is the right owner | none |
| SelmerIwasawaCohomology §3.0 citation (line 76) | O a DVR, Γ=ℤ_p²; twist on σ−κ(σ) | “Coordinates”: O[[X₁,X₂]], dimension 3; “Augmentation regular sequence”: quotient by γ₊−1 gives O[[T]], dimension 2; “Involution and twists”: Tw_κ(σ−κ(σ))=κ(σ)(σ−1) | the three labels carry what the sentence uses | none |

The rows of the previous review, of `b30520a`, stand for every untouched statement.

- Gate at this head: FAIL, `statement-hygiene=2` (R01); every other counter 0, including `depcheck=0`, `outside-folder=0`, `readme-ids-missing=0`, `build=0`.
- Dependency check, run as prescribed: `depcheck: 238 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/AnticyclotomicLocalUnits/Suggested.lean` at the head: exit 0, `sorry` the only warning. `#check @exists_auxiliaryQuadraticField` on the repaired scratch copy compared with README line 633: clause for clause, binders `p`, `hp`, `hp2` kept.
- Cross-roadmap citations resolved for the changed passages: 2 (ModularCurvesPartII §16.5 at its open head, heading present with §§3.2, 3.9, 5.2–5.3, 9.9–9.11, 12.1, 13.2, 13.7; SelmerIwasawaCohomology §3.0 at its open head). The scanner's one lead, `TauCeti.Iwasawa.exists_completedCoordinate` (line 70), is untouched text and a planned supplier target, as the previous review recorded.
- Seeded sample: none of the 15 targets lies in a changed passage; source locators checked this round: 0 (the diff changes none).
- Pull request text against the head: title and description read sentence by sentence; nothing contradicted. Checked: a new roadmap of three files (1253 added lines, 0 removed headings or declarations); p≥5 with exceptional fibres at p=5, 7, 11 (line 726); rank two over Λ=O[[Γ⁻]] (§0.5); rank-p² interpolation (line 279); norm control for ℤ_p^r towers is the supplier contract of line 88; the consumer's imports (line 1150); 0 paths outside the folder; build and dependency claims as above.
- Overlap check: read LubinTateFormalModulesAndQuasiCanonicalLifts, ModularIwasawaMainConjecturesPartII, NonordinaryCMSpecialValues, EulerSystemsCyclotomicMainConjecture, HeegnerPointEulerSystems (the two other lists are empty); nothing shared — the first and third are cited suppliers (LT.0–LT.9, NCM.0–NCM.5), the others are global consumers; the overlap tool lists no dropped id, no second copy and no other pull request changing this folder.
- Source independence: changed passages only; 7 changed passages compared with 2 sources (BKO21, Rubin87), none shared (they are supplier section numbers and three supplier heading labels, absent from the sources); largest share BKO21, 107 of 181 source mentions; contents not compared again: the diff adds, removes or reorders no layer.
- Remark (no change asked): the board's `design/plan.json` still records `gap:good-model-hecke-comparison` with section “9.11; 13.2; 16.6”; the README's contract and *Needs:* lines now say §9.11 and §16.5. The slug agrees in both.

## Not verifiable

- Wiles78, pp. 235–254: settled as uncertified; not requested again, not touched by this change.
- Kato93, Chapter II, Theorem 2.1.7: settled as uncertified; not requested again, not touched by this change.
- The nine declared supplier gaps are contracts, not library results; nothing in this round certifies them.

## Source issues

- none

## For the human reviewers

- none
