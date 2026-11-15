# Review of NonordinaryCMSpecialValues (pull request #2290 at 401e631)

**Verdict:** needs changes

## R01 (P3) — §2.7 takes the smoothing ideal prime to `6pf`, not to the level

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:466`: “`σ_b ↦ N(b)/φ(b)` modulo the maximal ideal of `R` for `b` prime to `pf`, a character of `Gal(K(ap^∞)/K)`” and “for `ε ≠ ρ̄` choose `b` prime to `6pf` with `ε(σ_b) ≠ ρ̄(σ_b)`”.
**Claim:** The moduli `a` are supported on `f`, `p` and `l`, so an ideal prime to `6pf` may be divisible by a prime above `l`; then `σ_b` is not defined in `Gal(K(ap^∞)/K)` and Kato's (15.6.3) does not apply. Here `f` is the conductor of `φ`; in Kato it is the level.
**Witness:** `K = Q(√−7)`, `p = 5`, `a = f·23²`, `b` a prime above `23`: prime to `6·5·f`, ramified in `K(a5^∞)`. KATO04 line 5332: (15.6.3) is for ideals prime to `6p` times the level of the tower.
**Repair:** Write “for `b` prime to `pa`” and “choose `b` prime to `6pa`”. On the witness the prime above `23` is excluded; the ideal of the local-unit component, `α ≡ 1 mod 6 f l^{m+1}`, `α ≡ 2 mod p`, is prime to `6pa` and its factor is still `2(2 − 1) = 2`.

## R02 (P3) — The summary block of the description still calls the BKO class integral

**Location:** Pull-request description, `<!-- roadmap-summary -->` block: “It constructs Kato’s CM elliptic units, zeta elements and reciprocity law, and the integral Burungale–Kobayashi–Ota class.”
**Claim:** At this head the class is constructed in `H¹(K(a), T_φ^∨(1)[1/p])` and integrality is proved only away from the component of the residual character; the fourth paragraph of the same description says so.
**Witness:** `README.md:466`: “On the component of `ρ̄` every smoothing factor lies in the maximal ideal … and no integrality is asserted there”; `README.md:464` heading “2.7 The normalised class and its integrality”.
**Repair:** “… and the Néron-normalised Burungale–Kobayashi–Ota class, integral on every component other than that of the residual character.”

## Previous findings

- R01 — repaired: line 466 “`z_a ∈ H¹(K(a), T_φ^∨(1)[1/p])` … Prove integrality away from `ρ̄` … On the component of `ρ̄` … no integrality is asserted there”; §2.8 “the class of §2.7”. The repair introduced R01 of this report.
- R02 — repaired: line 125 “it uses Layers 0–4.”
- R03 — repaired: line 586 “Layer 0; ComplexMultiplicationAndExplicitReciprocity §§3.2, 4.1; ClassFieldTheory Layer 13; …”.
- R04 — repaired: description “Layer 3 (§§3.1–3.6, ending with the semilocal character factors) … Layer 4 (§§4.1–4.8) … Section 4.7 imports the ordinary periods and measure”.

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
| --- | --- | --- | --- | --- |
| §2.7 residue of the factor on the component of `ε` | `Q(√−7)`, `p = 5`, `α ≡ 1 mod f`, `α ≡ 2 mod 5`; `ε = ρ̄`, `ε` trivial on `Δ` | `N(b) − φ(b)ε(σ_b)`: `4 − 2·2 = 0`; `4 − 2·1 = 2` | `φ(b)(ρ̄(σ_b) − ε(σ_b))`: `2(2 − 2) = 0`; `2(2 − 1) = 2` | Formula and both Checks agree |
| §2.7 `ρ̄` as the residual character of `T_φ^∨(1)` | `σ_b` on `T_φ`, dual, twist | `φ(b)`, `φ(b)⁻¹`, `N(b)/φ(b) = ᾱ` for `b = (α)`, `α ≡ 1 mod f` | zero of `N(b) − φ(b)σ_b`: `σ_b = N(b)/φ(b)` | Same character; order divides `p² − 1`, prime to `p` |
| §2.7 levels prime to `p` | `a` prime to `5`, `α ≡ 1 mod a`; level `a·5` | `σ_b = 1` on `K(a)`, `ρ̄(σ_b) = ᾱ` fills `F_25^×`: component of `ρ̄` is zero | `Gal(K(a5^∞)/K(a5))` is pro-`5`: component survives | Claim made only for `a` prime to `p`, as it must be |
| §2.7 choice of `b` | `a = f·23²`, `b` above `23`; `α ≡ 1 mod 6f·23^{m+1}` | prime to `6·5·f`, not to `a` | prime to `6·5·a` | R01 |
| §2.8 (cites §2.7) | `χ = 1`, `p = 5`, `φ((5)) = −5` | deleted factor `1 + 1/5 = 6/5` | identity in the line after `⊗ Q` | Needs no integrality; “class of §2.7” right |
| How to read the build, Layer 5 | *Needs:* of §§5.3, 5.6, 5.7 | cite §§3.3–3.6 | line 125: Layers 0–4; Layer 5 Dependencies: Layers 0, 1, 2, 3, 4 | Agree |
| Layer 3 Dependencies | *Needs:* of §§3.1–3.6 | internal: §§0.1, 0.6, 3.1–3.5 | line 586: Layer 0 | Agree |
| Description, summary block | BKO class | “the integral Burungale–Kobayashi–Ota class” | head: integral away from `ρ̄` only | R02 |

The rows for the statements this change does not touch stand as in the previous review, of `26e27c6`.

- Source locators checked against the text: 4 in the changed passages — KATO04 lines 5326–5336 ((15.6.3), (15.6.4), printed pp.254–255), KATO04 line 5536 ((15.9.2), p.259), BKO21 lines 414–416 (§3.0.2). Seeded sample: of the 15 targets only §2.9 and §2.5 border the change and neither was altered.
- Cross-roadmap citations resolved: ClassFieldTheory Layer 13 (added to the *Needs:* of §2.7) on main; SelmerIwasawaCohomology §§0.9, 0.11 unchanged. No roadmap on main or at an open head cites this roadmap's §2.7 by an “integral class” wording.
- Gate: every worker check passes at `401e631`, including the targeted build; rerun here with the same result. `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changes.
- Lean: `lake env lean` on `Suggested.lean` gives exactly 3 `sorry` warnings (lines 142, 152, 178). The change to the file is the module docstring only; no signature changed.
- Description: “seven supporting definitions and one primality instance” matches the file (7 `def`, `factPrime`, 3 theorems); no layer was added, removed or reordered.

Overlap check: read ModularIwasawaMainConjecturesPartII, KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, ModularIwasawaMainConjectures, LFunctions and GlobalNumberFields; ownership as in the previous review (Kato's CM constructions: this roadmap; canonical Gross characters and CM periods: ComplexMultiplicationAndExplicitReciprocity; the `ξ_ν` projection: AnticyclotomicLocalUnits; Hecke's functional equation: AnalyticNumberTheoryPartI §2.3a); the change moves no object.

Source independence: changed passages only — 3 passages (§2.7 statement, its new Check, the Downstream sentence) compared with 2 sources (KATO04, BKO21), none shared beyond formulas; largest share FINIS06, 29 of about 85 locators, contents not compared again (no layer added, removed or reordered).

## Not verifiable

- KATO99, Theorem 4.3.1 (§2.5): recorded as uncertified; not in the changed passages.
- BOXALL92, Théorème 1 (§4.5): recorded as waived; not in the changed passages.

## Source issues

- **Gap** in BKO21 at §3.0.2, pp.951–952: the source says Kato's Proposition 15.9 yields a norm-compatible family with integral coefficients; it should say Kato's element is integral only after a smoothing factor, which is a unit on the projection used; affects the proof.

## For the human reviewers

- Licence / not read: KATO99 (uncertified) and BOXALL92 (waived) were not read; `README.md:433` and `README.md:684` cite them by locator only.
- Scope: JIA24, the source of §§6.2–6.4, was read as arXiv:2412.05867v1; `README.md:924` gives its publication as Acta Arithmetica 224 (2026), which was not checked.
- §2.7 now asserts less than BKO21 lines 414–416 print (an integral family obtained from Kato's rational statement): no integrality on the residual component. Whether to keep the stronger statement as a separately proved target is a design choice.
