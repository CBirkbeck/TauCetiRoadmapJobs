# Review of NonordinaryCMSpecialValues (pull request #2290 at 36742e6)

**Verdict:** accepted

No finding. Incremental re-review of the 2 changed lines since `401e631` (`TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:466`), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: `README.md:466` “`σ_b ↦ N(b)/φ(b)` modulo the maximal ideal of `R` for `b` prime to `pa`” and “for `ε ≠ ρ̄` choose `b` prime to `6pa` with `ε(σ_b) ≠ ρ̄(σ_b)`”. No new problem: see the table.
- R02 — repaired: description, summary block: “the Néron-normalised Burungale–Kobayashi–Ota class, integral on every component other than that of the residual character”.

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
| --- | --- | --- | --- | --- |
| §2.7 domain of `ρ̄` (`b` prime to `pa`) | `K = Q(√−7)`, `p = 5`, `a = f·23²`; `b` above `23`; `b = (α)`, `α ≡ 1 mod a`, `α ≡ 2 mod 5` | `b` above `23`: prime to `5f`, divides `a`, ramified in `K(a5^∞)`: excluded by “prime to `pa`” | `(α)`: prime to `5a`; `f ∣ a` so `φ(b) = α` defined; `ρ̄(σ_b) = N(b)/φ(b) = ᾱ ≡ 2` | Sound; R01's witness is now excluded |
| §2.7 choice of `b` prime to `6pa` | same `a`; `ε` trivial on the prime-to-`p` part; `ε = ρ̄` | residue `φ(b)(ρ̄(σ_b) − ε(σ_b))`: `2(2 − 1) = 2`, a unit; `2(2 − 2) = 0` | `N(b) − φ(b)ε(σ_b)`: `4 − 2·1 = 2`; `4 − 2·2 = 0` | Agree; unit exactly off `ρ̄` |
| §2.7 hypothesis of Kato's (15.6.3) | level `a` in place of Kato's `f` | head: ideals prime to `6pa` | KATO04 line 5332: ideals prime to `6p` times the level of the tower | Same hypothesis |
| §2.7 local-unit ideal against the new condition | `α ≡ 1 mod 6·f·23^{m+1}`, `α ≡ 2 mod 5`, `a` supported on `f`, `5`, `23` | prime to `6`, to `f`, to `23`, to `5`: prime to `6pa` | factor `N(b) − φ(b) = α(ᾱ − 1) ≡ 2(2 − 1) = 2 mod 5` | Admissible and a unit, as the first Check says |
| §2.7 second Check (cites the same `b`) | `α ≡ 1 mod f`, `α ≡ 2 mod 5`, level `a` prime to `5`, `α ≡ 1 mod a` | `φ(b) ≡ 2`, `N(b) ≡ 4`, `4 − 2·2 = 0` on `ρ̄` | `σ_b = 1` on `K(a)`, `ρ̄(σ_b) = ᾱ`, filling `F_25^×` | Consistent with “prime to `pa`” |
| Description: “seven supporting definitions and one primality instance” | `Suggested.lean` declarations | 7 `def` (`conductorModulus` … `rohrlichCount`), `local instance factPrime`, 3 theorems | description: parity dichotomy, two Rohrlich bounds, 7 definitions, 1 instance | Agree |
| Description: Kronecker limit formula “carries the factor 2” | `K = Q(i)`, `f = (3)`, `a = (5)`, `χ = 1` (`README.md:368`) | `2·(−6 log 3) = −12 log 3` | `24·(−(log 3)/2) = −12 log 3` | Agree with §2.2 |

The rows for the statements this change does not touch stand as in the previous review, of `401e631`.

- Description against the head, sentence by sentence: new roadmap, three files (`README.md`, `Suggested.lean`, `metadata.toml` with `math.NT`); §2.9 placed between §2.4 and §2.5; Layer 3 = §§3.1–3.6 ending with the semilocal character factors; Layer 4 = §§4.1–4.8; §4.7 suppliers AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2, 8.5 and PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5 (`README.md:105–108`, `:707`); §2.5 good reduction above `p`, §2.6 enlarged prime-to-`p` level; §2.7 integrality away from the residual component; end theorems §5.4 and §6.5; consumers as in `## Downstream consumers`; summary block: `2` split, `p ≥ 5`, `p ∤ h_K` (`README.md:31`, `:266`). No sentence contradicts the head; the head removes nothing (0 headings, 0 declarations removed against the base).
- Source locators checked against the text: 2 in the changed passage — KATO04 lines 5326–5336 ((15.6.3), (15.6.4)), BKO21 lines 409–416 (§3.0.2). The seeded sample's target §2.7 is the changed passage; the other 14 targets are untouched.
- Cross-roadmap citations: the changed line's *Needs:* (SelmerIwasawaCohomology §§0.9, 0.11; ClassFieldTheory Layer 13) is unchanged; the worker's resolver lists no citation or Lean name found nowhere.
- Gate: rerun at `36742e6`, every check passes (the worker's run includes the targeted build). Dependency check: `depcheck: 240 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changes.
- Lean: `lake env lean` on `Suggested.lean` gives exactly 3 `sorry` warnings (lines 142, 152, 178) and nothing else; the file is unchanged since `401e631`, so no signature changed.

Overlap check: read ModularIwasawaMainConjecturesPartII, KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, ModularIwasawaMainConjectures, LFunctions and GlobalNumberFields as listed by the overlap tool; the two-word change moves no object, ownership as in the review of `401e631`; the tool reports no dropped id, no second copy and no other pull request changing this folder.

Source independence: changed passages only — 1 passage (the two changed phrases of §2.7) compared with 2 sources (KATO04, BKO21), none shared; largest share FINIS06, 29 of about 85 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- KATO99, Theorem 4.3.1 (§2.5): recorded as uncertified; not in the changed passage.
- BOXALL92, Théorème 1 (§4.5): recorded as waived; not in the changed passage.

## Source issues

- **Gap** in BKO21 at §3.0.2, pp.951–952: the source says Kato's Proposition 15.9 yields a norm-compatible family with integral coefficients; it should say Kato's element is integral only after a smoothing factor, which is a unit on the projection used; affects the proof.

## For the human reviewers

- Licence / not read: KATO99 (uncertified) and BOXALL92 (waived) were not read; `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:433` and `:684` cite them by locator only.
- Scope: JIA24, the source of §§6.2–6.4, was read as arXiv:2412.05867v1; the References give its publication as Acta Arithmetica 224 (2026), which was not checked.
- §2.7 asserts less than BKO21 lines 414–416 print (an integral family obtained from Kato's rational statement): no integrality on the residual component. Whether to keep the stronger statement as a separately proved target is a design choice.
