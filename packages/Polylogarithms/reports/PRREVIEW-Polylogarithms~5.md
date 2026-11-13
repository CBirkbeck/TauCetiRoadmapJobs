# Review of Polylogarithms (pull request #1424 at 1cf0554)

**Verdict:** needs changes

Incremental re-review of the 92 lines changed since `fc00043` (README only). No P1 or P2 finding; five P3 findings, two of them carried from the previous report.

## R01 (P3) — `zagierExistence_totallyRealEven` is a boundary case that restates a supplier's headline

**Location:** `TauCetiRoadmap/Polylogarithms/Suggested.lean:246–251` (“theorem zagierExistence_totallyRealEven … (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ)”); `TauCetiRoadmap/Polylogarithms/README.md:655` and §4.7.

**Claim:** With `ι = Fin 0` the determinant is the empty one, so the statement is `π^(nN)/√|disc F| = q·ζ_F(n)`, `q ≠ 0`: the empty-determinant case of the Zagier predicate and, up to `q ↦ 1/q`, BorelRegulators' own headline. A boundary-case theorem is padding.

**Witness:** `TauCetiRoadmap/BorelRegulators/Suggested.lean:105–110` (open head): `exists_pos_rat_dedekindZeta_of_isTotallyReal`, same hypotheses, `√|disc F|·ζ_F(n) = q·π^(n·finrank ℚ F)`, `0 < q`. Over ℚ, `n = 2`: both read `π²/ζ(2) = 6`.

**Repair:** Delete it from `Suggested.lean` and drop “totally-real even-weight existence” from the module docstring. The README keeps the §4.7 target with its name unbackticked, citing BorelRegulators §5.1 as the input.

## R02 (P3) — Supplier names the suppliers do not declare, and a consumer that does not exist

**Location:** `TauCetiRoadmap/Polylogarithms/README.md:1529` (`hasFDerivAt_singleValued_three_one`), `:40` and `:1085` (`cubicalOrientationChange J_q`), `:122` (`complexSchemeAnalytification.map`, `complexSchemeAnalytification.fibreProduct`), `:967` (`proper-pushforward`), `:1343` (“§10.12's Milnor base-change identity”), `:1553` (“EllipticRegulators”).

**Claim:** Each backticked name is presented as the supplier's declaration, and none is one; §10.12 is not where the Galois-sum identity is; EllipticRegulators is no roadmap.

**Witness:** Searching main and every open head for each of the first four names returns only this README (and one other consumer for `.map`). SchemeAndStackFoundations names it `Chow.properPushforward` (its README line 8059). K2SymbolsBrauer §10.12 is “Base change of the simple transfer”; the splitting-field form is §10.23. “EllipticRegulators” occurs only in consumer lists; the merge order has no such line.

**Repair:** Cite the four facts by section and prose (PolylogarithmFunctions §4.8 “the zero real derivative of `L₃` at one”; MotivicEtaleKTheory §1.1's involution `Jₙ = (−1)ⁿ`; ComplexComparisonPartII §C−1.1 “on maps and fibre products”), write `Chow.properPushforward`, cite “K2SymbolsBrauer §§10.12 and 10.23”, and delete “EllipticRegulators and” from line 1553.

## R03 (P3) — §4.4's heading still counts three assertions

**Location:** `TauCetiRoadmap/Polylogarithms/README.md:646`, “### 4.4 Three Zagier assertions and their normalization”, followed at `:648` by “Define two propositions for a number field and integer `n≥2`”.

**Claim:** The change removed the third proposition (the regulator comparison is now unnamed motivation), so the heading contradicts its section.

**Witness:** The display at `:650–653` has two lines, “Rational existence” and “Every-family rationality”; `:657` says of the regulator forms “neither is named”. The summary (`:3`) and scope (`:7`) were already changed to two.

**Repair:** Rename the heading “### 4.4 The two Zagier assertions and their normalization”. No roadmap on main or at an open head cites the heading by its text (searched), so nothing else changes; the section number stays.

## R04 (P3) — [G95], Theorem 1.1 is attached to the weight-four sentence

**Location:** `TauCetiRoadmap/Polylogarithms/README.md:655`, “Polylogarithms, Part II treats `n=4` ([GR], Theorem 1.2, p.5; Goncharov [G95], Theorem 1.1, p.203).”

**Claim:** [G95], Theorem 1.1 is the weight-three statement for `ζ_F(3)`; the change moved it from a paragraph-wide locator onto the `n=4` sentence, and left the `n=3` sentence with no source.

**Witness:** G95 lines 77–81 and 245–258 (printed pp.198, 203): the theorem concerns `ζ_F(3)` and an `(r₁+r₂)`-determinant of trilogarithms. GR lines 196–200 (p.5): Theorem 1.2 is the `ζ_F(4)` statement.

**Repair:** “This roadmap proves them at `n=3` (§§3.8 and 4.6; Goncharov [G95], Theorem 1.1, p.203, for existence), and proves rational existence for totally real fields at even `n` (§4.7). Polylogarithms, Part II treats `n=4` ([GR], Theorem 1.2, p.5).”

## R05 (P3) — The pull request's description describes the previous head

**Location:** the description, block `roadmap-summary`: “Symbols live in rational vector spaces over arbitrary infinite fields” and “conjectural comparisons enter only as explicit hypotheses”; and the dependency paragraph: “In open pull requests of ours, direct suppliers: … #1320 (PolylogarithmFunctions)”.

**Claim:** The head contradicts all three sentences.

**Witness:** README `:312` “For every field `F`, define trilogGroup”, `:578` “for every field `F` and every `n≥3`”; `:612` “Conjectures about these complexes are motivation only: none is a target here, and no statement depends on one”; PolylogarithmFunctions is on main (`TauCetiRoadmap/PolylogarithmFunctions/README.md`).

**Repair:** “Symbol groups are rational vector spaces over every field; the weight-two stage is K3BlochGroups' rational pre-Bloch group, and residues into it need a residue field with at least four elements.” “Conjectural comparisons are recalled as motivation only; no statement assumes one.” Move PolylogarithmFunctions to the roadmaps on main.

## Previous findings

- R01 — not repaired: `Suggested.lean:246` still declares `zagierExistence_totallyRealEven` with `Fin 0` index types. Written again as R01.
- R02 — repaired: nothing changed here, but PadicHodgeRegulators' head (its README lines 7 and 1037) now says the Borel/Bloch–Wigner evaluation “is stated by Polylogarithms §§2.1 and 2.3 … and consumed in §4.7”. One owner; the direction agrees with the merge order.
- R03 — not repaired: lines 40, 122, 967, 1085, 1343, 1529 and 1553 are unchanged. Written again as R02.
- R04 — not repaired, and not carried: `hz : 0 < z.im` and `z ≠ 0`, `z ≠ 1` are the README's own hypotheses (`:266`, “for `Im z>0`”); the wider truth holds only through `arg 0 = 0` and `0⁻¹ = 0`. No change is asked.

## Verified sound

Rows for the statements the diff changes or a finding touches; values computed here.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §3.3 new Check (no descent at `k = 𝔽₃`) | five-term element at `(x,y) = (−1,4)` over ℚ, `v = v₃`, supplier's form `[x]−[y]+[y/x]−[(1−x⁻¹)/(1−y⁻¹)]+[(1−x)/(1−y)]` | arguments `−1, 4, −4, 8/3, −2/3`; valuations `0,0,0,−1,−1`; reductions `[−1] − [1] + [−1] − 0 + 0 = 2[−1]`; `P(𝔽₃) = ℤ[−1]` | matches; residue of (relation)⊗`u(3)` is `2[−1] ≠ 0` |
| §3.3 hypothesis “`k` has at least four elements” | K3BlochGroups §4.21 at its open head | supplier states preBloch_rationalSpecialization for a DVR with `|k| ≥ 4`, `[f] ↦ [f̄]` for units with `f̄ ≠ 1`, else `0` | same hypothesis and same map |
| §3.1 “for every field” (well-definedness of `δ₃`) | finite `F`; three-term element over infinite `F` | finite: `U(F) = ℚ⊗Fˣ = 0`, target zero. Infinite: `[1−x]₂ = −[x]₂`, `[1−x⁻¹]₂ = [x]₂`, so image `[x]₂⊗(u(x) − u(1−x) + u(1−x) − u(x)) = 0` | holds; uses supplier §3.6 (`2⟨x⟩ = 0`, `6c = 0`, `|F| ≥ 4`) |
| §4.1 new Check (weight-two recipe over `𝔽₃`) | `g = 1+t`; `s = 1/(1−t)` | `δ₂([g]+[g⁻¹]) = (1−g)∧g − (1−g)∧g = 0` rationally; `sp₁ − sp₀ = 2[−1] − 2[1]`. `δ₂([s]+[1−s]) = 0`; `sp₁ − sp₀ = 2[∞] − [1] − [0]`. With `[0] = [∞] = 0`: `[1] = 0`, then `[−1] = 0` | recipe gives `0`, supplier's group is ℚ: the Check is right |
| §4.1 `higherDelta_wellDefined` without infinite `F` | `F` finite; `F` infinite, `n = 3` | finite: target `Bₙ₋₁(F)⊗U(F) = 0`. Infinite: places `t`, `t−1` of `F(t)` have residue field `F`, `|F| ≥ 4` | supplier's hypothesis met in every case used |
| §4.1 `relationSpecialization_induction`, finite residue field | `K = ℚ`, `k = 𝔽₃`, `n = 3`, Gauss valuation on `ℚ(t)` | weight-two specialization is applied with residue field `𝔽₃(t)`, infinite; `sp δ₃[f] = [f̄]₂⊗u(unit part of f) = δ₃[f̄]` for units, both `0` otherwise | as stated; G95 lines 790–802 use the same reduction to a curve over the residue field |
| §4.2 inversion for `n ≥ 3`, every field | family `[tx] + (−1)ⁿ[(tx)⁻¹]`; `n = 2` over `𝔽₃` | `δₙ = ([tx]ₙ₋₁ + (−1)ⁿ⁻¹[(tx)⁻¹]ₙ₋₁)⊗u(tx) = 0`; `sp₁ = [x] + (−1)ⁿ[x⁻¹]`, `sp₀ = [0] + (−1)ⁿ[∞] = 0`. `𝔽₃`: `2[−1]₂ ≠ 0` | proved for every field; the weight-two failure is real |
| §4.2 `explicitToInductive_three` over a finite field | `𝔽₂`: explicit relation `R(1,1,1) = 7[1]` | family `[t²] − 4[t] − 4[−t]`: `δ₃ = 2([t²]₂ − 2[t]₂ − 2[−t]₂)⊗u(t) = 0`; `sp₁ − sp₀ = −7[1]` in characteristic 2 | `[1]₃ = 0` on both sides; consistent |
| §4.6 weight-three square with `q = id` | generator `[x]` | `q∘a[x] = [x]₂⊗u(x) = b∘p[x]`; `T = ker q = 0`, so `ω = 0` | every inductive cycle lifts; no weight-two comparison map needed |
| §4.7 new Check | `t∧2∧3∧5` on `ℚ(t)` | at `t = 0`: `u(2)∧u(3)∧u(5)`; at ∞ with uniformizer `1/t`, `u(t) = −u(1/t)`: `−u(2)∧u(3)∧u(5)`; all other places `0` | total `0`; finite-place map keeps `+u(2)∧u(3)∧u(5)` |
| `zagierExistence_totallyRealEven` (R01) | ℚ, `n = 2`, `ι = Fin 0` | `det = 1`, `N−d = 1`: `π²/√1 = q·ζ(2)` gives `q = 6`; supplier: `ζ(2) = q′π²`, `q′ = 1/6` | the same statement |

The rows for the untouched statements stand as in the previous review, of `fc00043`.

- Source locators opened for the changed passages: 9, all found as cited. G95 lines 82–84 (p.198, arbitrary field), 790–802 (Lemma 1.16, p.222), 813–814 (Conjecture A, p.222), 879–883 (p.224), 1446–1449 (Conjecture 1.39, p.240), 1452–1458 (p.241); GR lines 141–142 (p.4), 224–226 (p.6), 251 (p.7), 339 (p.9); Z90 lines 965–996 (pp.416–417).
- Seeded sample in the changed passages: §4.4 (Z90 lines 965–996, GR 196–200, G95 879–883; see R03, R04) and §4.6 (GR 325–339 and 196–200: as cited). The other sampled sections are untouched.
- Cross-roadmap citations resolved: K3BlochGroups at its open head, §3.3 (five-term form, `[1] = 0` over a field), §3.6, §3.7, §4.21, all as the new text states; BorelRegulators `Suggested.lean:105`; PadicHodgeRegulators lines 7, 1037.
- Names the change removed (zagierAssertion_implications, polylogMotivicComparisonConjecture, polylogHomotopyConjecture_four, HasPolylogReciprocityHomotopy, conditionalComplexTransfer, explicitToInductive_two_isomorphism): no occurrence left in the README, on main or at any open head.
- Gate at `1cf0554`: every check passes. Dependency check: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Outside-folder diff: empty.
- Elaboration of `TauCetiRoadmap/Polylogarithms/Suggested.lean`: exit 0, nine warnings, all `declaration uses sorry` (lines 118, 139, 145, 150, 162, 221, 232, 246, 274). The file is unchanged since `fc00043`, so its signatures and the one-tactic probe stand as recorded there.
- Remark, no change asked: the board package ZagierConjecturePolylogarithms (README line 80) still says “the three assertions” of §4.4.
- Overlap check: read K3BlochGroups, BorelRegulators, PadicHodgeRegulators; the rational pre-Bloch group is K3BlochGroups' (used here by reference), the totally-real even-weight rationality is BorelRegulators' (R01), the Bloch–Wigner/Borel scalar is this roadmap's §2.3. MotivicEtaleKTheory and PolylogarithmFunctions were not read again.
- Source independence: changed passages only; 9 passages compared with 3 sources (G95, GR, Z90), none shared; largest share G95, 35 bracketed citations (G04 34, GR 27); the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- The claim that every weight `n ≥ 3` relation specializes over a finite residue field (`relationSpecialization_induction`) is a proof obligation; the row above checks where the weight-two input enters, not the full induction with poles.
- The items of the previous report's list (the OCR-garbled 22-term display of G95, cycle lifting in G95 §9.2, the constant `−4/3` of §5.18, the Borel scalars) are untouched and stand as recorded there.

## Source issues

- none

## For the human reviewers

- **Licence.** [GR] (Goncharov–Rudenko) is read from its arXiv text, recorded in the manifest with year 2026; whether a refereed version with the same numbering exists was not checked.
