# Review of EllipticCurves (pull request #2483 at ccbf085)

**Verdict:** needs changes

## R01 (P3) — Sentences that describe as pending what §Scope and ownership lists as present at the pin

**Location:** `TauCetiRoadmap/EllipticCurves/README.md` line 1779: "the Hasse bound is the earliest PR, its existing proof self-contained"; line 2021: "**Selmer/Sha (Layer 7)** waits on the continuous-Galois-cohomology packaging"; lines 1494–1495; lines 1701–1702; lines 1594–1596.
**Claim:** Five passages contradict the README's own "Already in Tau Ceti" list (lines 183–254), and the first contradicts the description's "Sentences saying … that the Hasse bound lands first, are removed."
**Witness:** Pinned Tau Ceti, under `TauCeti/AlgebraicGeometry/EllipticCurve/`: `HasseBound.lean:44`; `GaloisCohomology/Selmer/NumberField.lean:65` (`sha`), `Selmer/Finite.lean:57`; `CanonicalHeight/Basic.lean:119`; `Szpiro.lean:94,155` (`algorithmicSzpiroRatio` over `algorithmicConductor`).
**Repair:** Line 1779: "Layer 3 (Hasse, zeta): the zeta strand needs Layer 1's Frobenius identities." Delete the bullet at lines 2021–2022 and the sentence "The layer is stated against that packaging once it exists." (1494–1495). Lines 1700–1702: "— a certificate independent of the canonical height;". Delete "⚠ **Ordering.** … inventing the denominator." (1594–1596).

## R02 (P3) — The canonical height is said not to be a bare `limUnder`; the cited declaration is one

**Location:** `README.md` lines 1347–1349: "Convergence of that limit is the content of the construction and is proved, never assumed: `ĥ` is not defined as a bare `limUnder` whose value would be unspecified exactly where the theorem is."
**Claim:** The declaration line 243 cites for this object, `WeierstrassCurve.Affine.Point.canonicalHeight`, is defined as a bare `limUnder`, along `2ⁿ` and not along all `n`.
**Witness:** `CanonicalHeight/Basic.lean:119–120`: `Point.canonicalHeight (P : W.Point) : ℝ := limUnder atTop fun n : ℕ ↦ ((2 ^ n) • P).naiveHeight / 4 ^ n`; convergence is the separate theorem `Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow` (same file, line 39).
**Repair:** Replace lines 1344–1349 from "`ĥ(P) = lim_n …`" by: "`ĥ(P) = lim_n h(2ⁿ • P)/4ⁿ` with `h` the logarithmic height of the `x`-coordinate (equal to `lim_n h(n • P)/n²`, and twice the normalisation some authors use); the regulator and the BSD quotient of §Layer 7 are stated against this one. Tau Ceti's definition is the `limUnder` of that sequence, and its convergence for an elliptic curve is the theorem `Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, so every statement about `ĥ` carries `[W.IsElliptic]`."

## R03 (P3) — Four backticked names that neither the pin nor `Suggested.lean` declares

**Location:** `README.md` line 1171: "prove `krausLocalCondition_of_not_dvd_six`"; lines 1580, 1595: "`szpiroRatio E = log |Δ_min| / log N`"; lines 627, 1706, 1708: "`HasCM`"; lines 418, 473: "`inducedPlace`".
**Claim:** Each is written as a declaration of this roadmap; none exists in `Suggested.lean` or in the pinned libraries, and `HasCM` is used without a definition (line 612 defines `CMAction` and `HasGeometricCM`).
**Witness:** Pin: `GlobalModels/Kraus.lean:161` is `krausLocalCondition_of_isUnit_six`; `Szpiro.lean:94` is `algorithmicSzpiroRatio`; `Isogeny/Hom/ComplexMultiplication.lean:100,143` are `HasGeometricCM`, `CMAction`; no `inducedPlace` in Tau Ceti or Mathlib.
**Repair:** Line 1171: "Tau Ceti's `TauCeti.krausLocalCondition_of_isUnit_six`". Lines 1580, 1595: "`algorithmicSzpiroRatio`" (Tau Ceti's, `Szpiro.lean`). Lines 627, 1706, 1708: "`HasGeometricCM`" (with "a `CMAction` of `ℤ[i]`" at 1706). Lines 418, 473: "the induced place", without backticks.

## R04 (P3) — The headline `LFunction_eq_of_isogeny` has no locator, and the cited Milne lemma covers only the good primes

**Location:** `README.md` lines 1423–1425: "isogenous curves have the **same local Euler factors**, hence the same `L`-function (`LFunction_eq_of_isogeny` in `Suggested.lean`, over any number field)"; `Suggested.lean` lines 52–64 (docstring, no source).
**Claim:** The statement is about Mathlib's full Euler product, bad primes included; the only source the README gives for it (line 1867, ADT I.7.1) proves equality of the partial function `L_S`.
**Witness:** MilneADT lines 3624–3629: `S` contains every prime of bad reduction and the conclusion is `L_S(s, A) = L_S(s, B)`; MilneADT lines 3632–3635 give the `V_ℓ` argument.
**Repair:** At line 1425 append: "(Milne, ADT I.7.1(a) and its proof, for the factors at the primes of good reduction; at a prime of bad reduction the factor is read off the reduction type of the minimal model — split multiplicative, nonsplit multiplicative, additive — and its invariance under isogeny is a milestone of this layer, extending `TauCeti.Isogeny.localPolynomial_eq_of_hasPotentialGoodReduction` to potentially multiplicative reduction)". Add "(Milne, ADT I.7.1(a), outside the bad primes)" to the docstring's first sentence.

## R05 (P3) — README shape: no `**Checks.**` lists and no per-layer Examples and Dependencies

**Location:** `README.md`, `### Layer 0` (line 444) through `### Layer 8` (line 1499); the examples are collected at lines 1662–1761 and the dependencies at lines 1763–1807.
**Claim:** The remaining half of the previous round's shape finding: definitions carry no `**Checks.**` list of at least three tests, and no layer ends with its examples and its dependencies.
**Witness:** `grep -c 'Checks\.\*\*' README.md` returns 0; `grep -n 'Examples\|Dependencies' README.md` finds no heading. The Weil pairing's orientation (`e_N` against `e_N⁻¹`) is fixed by no computed two-term instance anywhere in the text.
**Repair:** Under each definition add `**Checks.**` with three prose tests, taken from the ⚠ instances already in the text (for example, `IsSupersingular`: `y² = x³ − x` over `𝔽₃`, `a_q = 0`; `y² + xy = x³ + t` over `𝔽₂(t)`, ordinary; `IsOrdinary 2 W` over `ℚ` as the negative control). Move each bullet of §Worked examples under its layer as `#### Examples`, and each lane of §Ordering as `#### Dependencies`; the layer headings and their anchors stay.

## R06 (P3) — The description's summary block describes an earlier head

**Location:** Pull-request description, `<!-- roadmap-summary -->` block: "Its layers, its pinned headline statements and the long-model integrality `lutz_nagell_integrality_general` are unchanged, and the classical form is not yet given a Lean name."
**Claim:** The head removes 89 declarations of `Suggested.lean` and adds three, one of them the classical form; "What this revision changes" names only the Nagell–Lutz passages of a 1668-line change.
**Witness:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` line 44: `theorem sq_dvd_four_mul_cube_add_of_isOfFinAddOrder`; diffstat against the base: `Suggested.lean | 1222`, `README.md | 446`.
**Repair:** Regenerate the block. Its last sentence should read: "Its layers are unchanged; `Suggested.lean` now states only the three headlines the pinned Tau Ceti does not prove — the classical Nagell–Lutz bound `sq_dvd_four_mul_cube_add_of_isOfFinAddOrder`, `LFunction_eq_of_isogeny` and `bsdQuotient_eq_of_isogeny` — and the README cites Tau Ceti for the rest."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `sq_dvd_four_mul_cube_add_of_isOfFinAddOrder` (headline) | `y² = x³ + 1`; `y² = x³ + 4`; `y² = x³ − 43x + 166`, `(3, ±8)` | `4A³+27B²` = 27, 432, 425984 = 64·6656; `y²` = 9 and 1; 4; 64: each divides | true | none |
| Same, singular models (no `Δ ≠ 0`) | `A = −27, B = −54` (node, tangents over `ℚ(i)`); `A = −3, B = −2` (`ℚ(√−3)`); `A = B = 0` | `4A³+27B² = 0`; torsion `(15, 54)`, `(6, 0)`; `(3, 4)`, `(2, 0)`; cusp: only `O` | integrality holds, divisibility automatic | none |
| Docstring identity for `2P` | expand both products | `3x⁶ − 2Ax⁴ − 24Bx³ − 5A²x² − 32ABx + 4A³` minus the same with `−27B²`: `4A³ + 27B²` | identity correct | none |
| `LFunction_eq_of_isogeny` (headline) | Mathlib `LFunction.lean:43–50, 79–81`: good, split, nonsplit, additive | factors `1 − aT + qT²`, `1 − T`, `1 + T`, `1`; each is an isogeny invariant of the minimal model at `v` | true; pin proves only potential good reduction (`TateModule/Isogeny.lean:274`) | R04 |
| `bsdQuotient_eq_of_isogeny` (headline) | `Quotient.lean:83–86`; `RealPeriod.lean:119–129`; `Tamagawa/Local.lean:56–58`; `Selmer/NumberField.lean:65` | `Ω = 2∫_{Ψ₂Sq>0} dx/√Ψ₂Sq` (both real components); `c_p = [E(ℚ_p):E₀(ℚ_p)]` on completions; `Ш` over all places | Cassels' quotient as in ADT I.7.3; not proved at the pin | none |
| One-tactic probe of the three | `simp`, `rfl`, `exact lutz_nagell …`, `exact localPolynomial_eq_of_hasPotentialGoodReduction …`, `simp [bsdQuotient_def]` | none closes; `lutz_nagell` gives `y² ∣ −16(4A³+27B²)` only | no padding | none |
| Weil pairing (sample) | `N = 1`; pin `WeilPairing/Basic.lean:225, 383`, `Rational.lean:49` | `E[1] = 0`, `μ₁ = 1`; nondegeneracy excludes the zero pairing; nothing excludes `e_N⁻¹` | names and files as cited; orientation has no Check | R05 |
| The function field is the foundation (sample) | `y² = x³ + t` over `𝔽₃(t)`; `Isogeny/Basic.lean:139` | singular point `(−t^(1/3), 0)`, not rational; structure fields `pullback`, `mapsInfinity` as displayed | consistent with the pin | none |
| No schemes / Out of scope / Complex uniformisation (sample) | Siegel, BSD, general-`K` period | `integralPoints` (`Affine/Point/Integral.lean:99`) has no finiteness claim; `bsdQuotient` typed over `ℚ` only; unit rank `r₁+r₂−1 = 0` with a real place gives `K = ℚ` | text agrees with the layers | none |
| Already in Tau Ceti (sample) | all 79 names of lines 186–254 and 399–409, each grepped at the pin under its stated file or directory | 79 of 79 declared where cited (`ReductionSymbol` is an `inductive` in `TateAlgorithm/Reduction/Symbol.lean`) | list correct | none |
| `IsSupersingular` / `IsOrdinary` | `Supersingular.lean:86–92`; `y² + xy = x³ + t` over `𝔽₂(t)`; `K = ℚ, p = 2` | definition over `AlgebraicClosure K`; `Δ = t`, `j = 1/t`, `2`-torsion `(0, √t)`; `E[2](ℚ̄) ≅ (ℤ/2)²` | README lines 820–831 correct | none |
| Trace convention and Hasse | `y² = x³ − x` over `𝔽₃`; `y² = x³ + x` over `𝔽₅`; `𝔽₂`, `𝔽₃` | counts 4, 4; `a = 0`, `a = 2`; `2√2 > 2`, `2√3 > 3` so `a = ±p ≠ 0` occurs | examples and "not `a_q = 0`" correct | none |
| Canonical height | `CanonicalHeight/Basic.lean:119` | `limUnder` of `h(2ⁿP)/4ⁿ`; README says "not a bare `limUnder`" and `h(nP)/n²` | prose contradicts the cited declaration | R02 |
| Frey curve | general `A, B`; odd `a, c` with `aᵖ + cᵖ ≡ 0 (mod 32)` | `c₄ = 16(A²+AB+B²)`; `Δ = 16A²B²(A+B)²`; `a + c ≡ 0 (mod 4)` | identities and normalisation correct | none |
| Szpiro ⟹ abc with exponent 3/2 | `a + b = c` coprime | `(abc)² ≪ rad^(6+ε)`, `abc ≥ c(c−1)`: `c ≪ rad^(3/2+ε)` | correct; pin name is `algorithmicSzpiroRatio` | R03 |
| Néron–Ogg–Shafarevich counterexample | `[0, −1, 1, −10, −20]` at 11, `N = 5` | `Δ = −11⁵`, `v₁₁(Δ) = 5`, `5 ∣ 5`: `E[5]` unramified, reduction multiplicative | README line 973 correct | none |
| Cassels locator | MilneADT lines 3624–3631, 3666–3668, 3823 | I.7.1(a) `L_S` equal, (b) `Ш` finiteness; I.7.3 BSD for one iff the other; Notes credit Cassels 1965 for elliptic curves | README lines 1414, 1867–1870 correct | R04 |
| Minimal-pair height | BHKSSW lines 53–55, 230–233 | `Δ = −16(4a₄³+27a₆²)`, `H = max{4|a₄|³, 27a₆²}`, the `p⁴ ∣ a₄`, `p⁶ ∣ a₆` condition in §2.1 | README lines 1525–1527, 1543 correct | none |

| Previous finding | At this head | Status |
|---|---|---|
| R01, R10, R11, R12, R16 | `Suggested.lean` defines nothing; three theorems | repaired |
| R02 | lines 44 and 74 of `Suggested.lean` | repaired |
| R03 | README 827–831: "every elliptic curve over `ℚ` satisfies `IsOrdinary 2 W`" | repaired |
| R04 | lines 183–258 list the pin; line 1779 remains | partly (R01) |
| R05, R17 | lines 372–381, 387 | repaired |
| R06–R09, R13–R15 | gate `tex=0 prnum=0 residue=0`; lines 852, 1108, 1719, 320, 1525 | repaired |
| R18 | Summary, Scope, Conventions, supplier contracts present; no Checks | partly (R05) |

- Source locators checked against a text: 6 (MilneADT lines 3624–3631, 3666–3668, 3823; BHKSSW lines 53–55, 230–233).
- Library declarations opened at the pins: 79 in Tau Ceti for the §Scope list, 9 more read in full (`Quotient.lean:83`, `RealPeriod.lean:128`, `Supersingular.lean:86`, `ShortNagellLutz.lean:151`, `ShortWeierstrass.lean:109`, `Sha.lean:213`, `TateModule/Isogeny.lean:274`, `Tamagawa/Local.lean:56`, `CanonicalHeight/Basic.lean:119`); 21 in Mathlib (among them `LFunction.lean:43, 79`, `Height/EllipticCurve.lean:37, 70, 80, 111, 118`, `SelmerGroup.lean:39`, `ClassNumber.lean:219`).
- Cross-roadmap citations resolved on main: AlgebraicCurves Layer 0 (line 403), Layer 6 (lines 712, 742), Layer 10 early Weierstrass milestone (lines 54, 1260, 1909): 3 of 3; the 27 roadmaps of §Downstream consumers are all on main and all cite this roadmap.
- Dependency check: `depcheck: 236 roadmaps, 2534 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Gate at this head: every check 0, `build=0`, OK. `lake env lean` on `Suggested.lean`: three `sorry` warnings, nothing else.
- `#check @name` on all three declarations: the elaborated types equal the README statements; no binder lost.
- No file outside `TauCetiRoadmap/EllipticCurves/` changes; no name of `Suggested.lean` is declared by another roadmap's Lean file.
- Ownership against open pull requests: EllipticCurvePeriodsAndModularParametrizations (lines 88–90, 1021–1025) and EffectiveDiophantineMethods (line 221) cite this roadmap for Cassels, the `L`-function equality and Nagell–Lutz; none states them.

Overlap check: read AlgebraicCurves, ModularCurves, EllipticLegendreCharacterInterfaces (main), EllipticCurvePeriodsAndModularParametrizations, HyperellipticCurves, EffectiveDiophantineMethods (open); places and the fundamental identity: AlgebraicCurves owns, this roadmap consumes; Cassels' theorem, the BSD quotient over `ℚ` and Nagell–Lutz: this roadmap owns, the periods and Diophantine roadmaps cite; nothing owned twice.

Source independence: 5 passages compared with 2 sources (MilneADT, BHKSSW), none shared; largest share AEC, about 51 of 68 locators; AEC's text could not be read, so its wording was not compared; contents compared by chapter number only (Layers 1–7 ↔ AEC II–IV, III.6–8, V, VII, VIII.8, X.2/X.5, VIII, X.4, not in the book's order; Layers 0, 0.5, 4.5b, 8 without counterpart): independent.

Research link: `Suggested.lean` states Cassels' isogeny invariance of the Birch–Swinnerton-Dyer quotient (Cassels 1965; Tate 1965/66 for abelian varieties) and the classical Nagell–Lutz bound; Layer 4.5b follows Kraus (1989), Layer 8 the height of Balakrishnan–Ho–Kaplan–Spicer–Stein–Weigandt (2016). Rests on MilneADT lines 3666–3668, 3823, BHKSSW lines 51–55 and the README's references.

## Not verifiable

- AEC (Silverman, 2nd ed.), every locator, including the sampled III.8.1 (Weil pairing) and II.2.4 (function fields): not in the sources cache, and the sources service answers "no legal source found".
- AEC V.4.1 for `IsSupersingular ↔ p ∣ a_q` (`README.md` line 858) and "V.3.1(i)" (line 823): not readable; the author should confirm that V.4.1 is the trace criterion and not the Hasse-invariant criterion, and the item label of V.3.1.
- ATAEC IV.9, V.3.1, V.5.3; Stichtenoth I.1, III.1.11; Katz–Mazur 2.6.2.2; Kraus 1989; Cassels 1965; Tate 1975; Rubin I.§1–2: not fetched.
- Pinned sources (sample): the AINTLIB, FLT and Stoll revisions and the state of the four mathlib pull requests were not looked up again this round.
- The Angdinata development (`README.md` lines 1890–1894): no public revision to read.
- LMFDB labels of the Tate's-algorithm list (`README.md` lines 1684–1694) other than 11.a1, 11.a2, 11.a3, 37.a1: not checked against the database.
- The `ℚ(√65)` curve of lines 1729–1738 (everywhere good reduction, nontrivial Weierstrass class): not recomputed.

## Source issues

- none

## For the human reviewers

- Scope: every layer heading from Layer 1 to Layer 7 carries AEC chapter numbers in its title (`README.md` lines 523, 747, 784, 908, 1020, 1270, 1316, 1384); the titles themselves name the mathematics, and other roadmaps link to these anchors.
- Licence: `README.md` lines 1890–1894 and 1903–1913 take the `Isogeny` definition from D. Angdinata's unpublished shared files, with no public revision or stated licence; the same structure is in pinned Tau Ceti (`Isogeny/Basic.lean:139`).
- Not tested: AEC holds about 51 of 68 locators and could not be read; the wording and contents comparisons were not made against its text.
- R05 asks for a restructuring of a roadmap already on main (Checks lists, per-layer examples and dependencies); whether a revision whose mathematics is otherwise sound waits for it is yours to decide.
