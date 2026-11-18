# Review of EllipticCurves (pull request #2483 at fe8e463)

**Verdict:** needs changes

## R01 (P2) — Eleven definitions with `sorry` bodies; five of them lose their section binders

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 220, 243, 276, 295, 347, 575, 610, 624, 640, 934, 954 (gate rule `sorry-data`); module docstring line 29: "objects with a genuine type are pinned as `def … := sorry`".
**Claim:** These are sorry'd data, and every theorem about them (`weilPairing_nondegenerate`, `globalMinimalityClass_eq_one_iff_exists_globalMinimalModel`, …) is a statement about an unspecified object.
**Witness:** Elaborated type: `globalMinimalityClass : (O) → [CommRing O] → [IsDedekindDomain O] → {K} → [Field K] → (E) → [E.IsElliptic] → ClassGroup O`; `[Algebra O K]`, `[IsFractionRing O K]` are gone. Same for `obstructionExponentAt`, `minimalDiscriminantIdeal`.
**Repair:** Delete the eleven and import the pinned Tau Ceti modules that define them with real bodies (`MinimalModel/Class.lean:94,125`, `MinimalModel/ObstructionExponent.lean:85`, `MinimalModel/DiscriminantIdeal.lean:170`, `Isogeny/MulByInt/WeilPairing/Basic.lean:225`, `Isogeny/PointHom/Basic.lean:89`, `Isogeny/Frobenius/Basic.lean:106`, `Isogeny/FunctionField.lean:278`, `QuadraticTwist/Basic.lean:469,824`); rewrite the docstring sentence.

## R02 (P2) — Two open headlines are statable at the pins and absent

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 997–1014: "Nothing is pinned here; the layer states its objects against that API once it exists"; `README.md` line 1253: "The classical form is the sharper target of this layer".
**Claim:** Cassels' isogeny invariance of the BSD quotient over `ℚ` (Layer 7) and the classical Nagell–Lutz bound `y² ∣ 4A³ + 27B²` (Layer 6, added by this pull request) have no Lean statement although both elaborate at the pins.
**Witness:** A scratch file importing `TauCeti.AlgebraicGeometry.EllipticCurve.BirchSwinnertonDyer.Quotient` and `…Isogeny.Basic` elaborates both statements below with `sorry` as the only warning. Pinned Tau Ceti proves neither (`ShortNagellLutz.lean:151` is the `y² ∣ Δ` form).
**Repair:** Add, with docstrings:
`theorem bsdQuotient_eq_of_isogeny (E₁ E₂ : WeierstrassCurve ℚ) [E₁.IsElliptic] [E₂.IsElliptic] [Finite E₁.sha] [Finite E₂.sha] (φ : TauCeti.Isogeny E₁.toAffine E₂.toAffine) : E₁.bsdQuotient = E₂.bsdQuotient := sorry`
and
`theorem sq_dvd_four_mul_cube_add_of_isOfFinAddOrder (A B : ℤ) {x y : ℚ} (h : (⟨0, 0, 0, (A : ℚ), (B : ℚ)⟩ : WeierstrassCurve ℚ).toAffine.Nonsingular x y) (htor : IsOfFinAddOrder (WeierstrassCurve.Affine.Point.some _ _ h)) : ∃ x₀ y₀ : ℤ, (x₀ : ℚ) = x ∧ (y₀ : ℚ) = y ∧ (y₀ = 0 ∨ y₀ ^ 2 ∣ 4 * A ^ 3 + 27 * B ^ 2) := sorry`.

## R03 (P2) — `IsSupersingular` and `IsOrdinary` are not restricted to the characteristic

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 445–461: `variable {K : Type*} [Field K] (p : ℕ) [Fact p.Prime] [CharP K p]` … `def IsSupersingular (W : WeierstrassCurve K) [W.IsElliptic] : Prop`.
**Claim:** The README defines both "over any field `K` of characteristic `p > 0`" (line 716); the Lean definitions accept any `p : ℕ` over any field.
**Witness:** Elaborated type: `IsSupersingular : {K} → [Field K] → ℕ → (W : WeierstrassCurve K) → [W.IsElliptic] → Prop`. With `K = ℚ`: `IsOrdinary 2 W` holds for every `W` (`E[2](ℚ̄) ≅ (ℤ/2)²`), and `IsSupersingular 1 W` holds for every `W`.
**Repair:** Put the binders in the signatures: `def IsSupersingular {K : Type*} [Field K] (p : ℕ) [Fact p.Prime] [CharP K p] (W : WeierstrassCurve K) [W.IsElliptic] : Prop`, likewise `IsOrdinary`, and add `[CharP L p]` to `isSupersingular_baseChange_iff`. Add the `K = ℚ`, `p = 2` instance to Layer 3 as a negative control.

## R04 (P2) — Targets restated that pinned Tau Ceti already proves

**Location:** `README.md` line 13: "None of that is upstream"; line 19: "The theorem we can land almost immediately is the **Hasse bound**"; lines 1873–1874: "to our knowledge, not yet formalised anywhere"; `Suggested.lean` lines 82, 334, 496, 842, 993.
**Claim:** The folder plans and restates as `sorry` targets results that exist, proved, in Tau Ceti at the pin.
**Witness:** Pinned Tau Ceti, under `TauCeti/AlgebraicGeometry/EllipticCurve/`: `MordellWeil/FinitelyGenerated.lean:145` `fg_point_of_numberField`; `HasseBound.lean:44`; `Isogeny/MulByInt/Torsion/Structure.lean:133` `torsion_addEquiv_prod`; `Affine/Point/ToClass.lean:482`; `MinimalModel/Reduced.lean:208`.
**Repair:** State once, in the opening scope text, which layers Tau Ceti holds, each with its declaration and file; delete the corresponding `sorry` theorems from `Suggested.lean`, keeping the headlines the pin does not prove (R02); delete the three quoted sentences.

## R05 (P2) — Layer 6 plans the point height that pinned Mathlib has

**Location:** `README.md` lines 287–293: "is **newer than this roadmap's Mathlib pin** `9caeba10` and so is not consumable"; lines 1216–1218: "carries it as a TODO (nothing is defined there yet), so this layer builds it".
**Claim:** The naïve height on points, its approximate parallelogram law and Northcott finiteness are stated as work of this roadmap; they are in Mathlib at the pin.
**Witness:** `lake-manifest.json` pins Mathlib at `1b1ccf4b`. There `Mathlib/NumberTheory/Height/EllipticCurve.lean` has `Point.naiveHeight` (line 37), `approx_parallelogram_law`, a `Northcott` instance (line 98) and `finite_torsion`.
**Repair:** Replace both passages by: "Mathlib's `WeierstrassCurve.Affine.Point.naiveHeight`, `approx_parallelogram_law`, `finite_naiveHeight_le` and `finite_torsion` (`Mathlib/NumberTheory/Height/EllipticCurve.lean`) are consumed; Layer 6 adds weak Mordell–Weil and the descent." Remove the pin id.

## R06 (P3) — TeX-only syntax (gate rule `tex`)

**Location:** `README.md` line 738: "`E_L supersingular ↔ V_{E_L} purely inseparable ↔ (V_E)_L purely inseparable ↔".
**Claim:** The code span is broken across two lines, so `V_{E_L}` is read outside a span.
**Witness:** Gate: `tex=1`, line 738.
**Repair:** Make it an indented code block on its own lines: `E_L supersingular ↔ V_(E_L) purely inseparable ↔ (V_E)_L purely inseparable ↔ V_E purely inseparable ↔ E supersingular`.

## R07 (P3) — Pull-request numbers in the README (gate rule `prnum`)

**Location:** `README.md` line 1189: "(FLT #1088)"; line 1739: "PR #1088, merged as `bc2fe8ff7396`".
**Claim:** The README cites a pull request by number.
**Witness:** Gate: `prnum=2`, lines 1189 and 1739.
**Repair:** Line 1188–1189: "the concrete `char`-free development in the FLT project (revision `bc2fe8ff7396`)"; line 1738–1739: "the quadratic-twist development at revision `bc2fe8ff7396`".

## R08 (P3) — Process residue (gate rule `residue`)

**Location:** `README.md` lines 292, 1211, 1217, 1847, each with "TODO".
**Claim:** Four sentences describe the state of another file's to-do list.
**Witness:** Gate: `residue=4`.
**Repair:** Lines 292 and 1217 go with R05. Line 1211: "and does not prove its finiteness, which is proved here". Line 1847: "proving the finiteness that file leaves open".

## R09 (P3) — A backticked name the Lean file does not declare (gate rule `readme-ids-missing`)

**Location:** `README.md` line 993: "(`weierstrassClass_eq_inv_weierstrassDefectClass`, a milestone)".
**Claim:** The name is presented as this roadmap's declaration; `Suggested.lean` has no such declaration.
**Witness:** Gate: `readme-ids-missing=1`.
**Repair:** "The two are inverse (a milestone), so triviality …", without the name.

## R10 (P3) — `torsion_addEquiv_prod` concludes `Nonempty (… ≃+ …)` (gate rule `statement-hygiene`)

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` line 336.
**Claim:** A theorem concluding `Nonempty` of an equivalence is not named `nonempty_*`.
**Witness:** Gate: `statement-hygiene`, line 336.
**Repair:** Under R04 the declaration is deleted (the pin proves it); otherwise rename it `nonempty_torsion_addEquiv_prod` here and in the README (lines 655, 1521, 1788).

## R11 (P3) — `minimalPairModel` is chosen by `Classical.choice` (gate rule `statement-hygiene`)

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 1078–1080.
**Claim:** A definition's body makes a choice.
**Witness:** Gate: `statement-hygiene`, line 1080.
**Repair:** Delete `minimalPairModel`, `naiveHeight`, `naiveHeight_eq` and `naiveHeight_variableChange`; the pin defines the height (`MinimalPairModel.lean:397`) and `exists_minimalPairModel` with `minimalPairModel_unique` already say that `MinimalPairModel.height` is an invariant. In `README.md` lines 1419–1422, name the three in prose and cite the pinned definition.

## R12 (P3) — Padding in `Suggested.lean`

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 266 (`degree_pos`), 598 (`IsSharpSemiGlobalMinimalAt.isSemiGlobalMinimal`), 906 (`Δ_quadraticTwistOf`), 915 (`isElliptic_quadraticTwistOf`), 1097 (`naiveHeight_eq`).
**Claim:** Each closes in one step from a definition or a neighbouring target.
**Witness:** On scratch copies: `Δ_quadraticTwistOf` by `simp only [quadraticTwistOf, WeierstrassCurve.Δ, b₂, b₄, b₆, b₈]; ring`; `degree_pos` by `Module.finrank_pos` after `finiteDimensional`; `naiveHeight_eq` by one `simp` with `minimalPairModel_unique`; line 598 is `exact Or.inr ⟨…⟩`.
**Repair:** Delete the five from `Suggested.lean`; the README keeps the statements.

## R13 (P3) — The equation named for 11.a1 is 11.a2 in the README's own table

**Location:** `README.md` line 1567: "`y² + y = x³ − x² − 10x − 20` for 11.a1".
**Claim:** Lines 1533–1534 give `I₁` at 11.a1 and `I₅` at 11.a2; this equation has `I₅` reduction.
**Witness:** `[0, −1, 1, −10, −20]`: `b₂ = −4`, `b₄ = −20`, `b₆ = −79`, `b₈ = −21`, `Δ = −161051 = −11⁵`, so `v₁₁(Δ) = 5` with `v₁₁(c₄) = 0`.
**Repair:** "`y² + y = x³ − x² − 10x − 20` for 11.a2"; line 858 names the same curve by its Cremona label "11a1", so write "11.a2 (Cremona 11a1)" there.

## R14 (P3) — Malformed locator for the quadratic-twist example

**Location:** `README.md` line 236: "(X.3 Example 2.4)"; line 1198: "Example X.3 2.4".
**Claim:** The locator names section 3 and an item numbered in section 2.
**Witness:** AEC numbers items by section, as the README's other locators do (X.4.2 in §X.4, X.5.4 in §X.5); Layer 5's heading cites "AEC X.2, X.5".
**Repair:** "AEC X, Example 2.4" in both places.

## R15 (P3) — "Minimal pair" is attributed to a source that does not use it

**Location:** `README.md` lines 1403–1404: "The name follows the literature's \"minimal pair\" for `(A, B)`"; `Suggested.lean` line 1039: "This is the BHKSSW/LMFDB convention (references), where such an `(A, B)` is a *minimal pair*".
**Claim:** The cited reference states the condition, not the term.
**Witness:** BHKSSW (arXiv:1602.01894v2) line 233 has the `p⁴ ∣ a₄`, `p⁶ ∣ a₆` condition; the string "minimal pair" occurs 0 times in its text.
**Repair:** "We call such an `(A, B)` a *minimal pair*; the condition is that of BHKSSW §2" in the README, and "the BHKSSW condition; the name is this roadmap's" in the docstring.

## R16 (P3) — Docstring of `subsingleton_singular` claims rationality over every field

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 403–404: "Being unique, that point is fixed by `Gal(Fˢᵉᵖ/F)` and so is `F`-rational."
**Claim:** False over an imperfect field; the theorem's signature is an arbitrary field.
**Witness:** README line 29's own curve `y² = x³ + t` over `𝔽₃(t)`: both partials vanish only at `(−t^{1/3}, 0)`, which is not in `𝔽₃(t)ˢᵉᵖ`.
**Repair:** "Being unique, it is fixed by every automorphism of `F̄/F`, hence `F`-rational when `F` is perfect; the count comparison below is stated over a finite field."

## R17 (P3) — Path of the continuous-cohomology supplier

**Location:** `README.md` line 299: "(`Mathlib/Algebra/Category/ContinuousCohomology/`, R. Hill and A. Yang)".
**Claim:** No such directory exists at the pin.
**Witness:** At Mathlib `1b1ccf4b` the files are `Mathlib/RepresentationTheory/Homological/ContCohomology/{Basic,LowDegree,Functoriality,Sha}.lean`.
**Repair:** "(`Mathlib/RepresentationTheory/Homological/ContCohomology/`)".

## R18 (P3) — README shape

**Location:** `README.md`, second-level headings at lines 178, 251, 309, 335, 1511, 1611, 1657, 1719.
**Claim:** The README has no `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`, no `**Checks.**` list and no `### Examples` / `### Dependencies` per layer; milestones are marked "stretch" (10 occurrences).
**Witness:** `grep -n '^## '` returns exactly the eight headings above; `grep -c 'Checks\.\*\*'` returns 0.
**Repair:** Move lines 135–174 under `## Scope and ownership` with R04's library list; turn lines 251–307 and the AlgebraicCurves citations (lines 357–377, 596–603, 619) into `## Exact supplier contracts`; give each layer `**Checks.**` (the worked examples of lines 1513–1609 distributed by layer) and `### Dependencies` (from lines 1616–1655); drop "stretch".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 6 text this pull request adds: `y² ∣ Δ` weaker by 16 than `y² ∣ 4A³+27B²` | `y² = x³ + 1` | `Δ = −432`, `4A³+27B² = 27`; `y² ∣ 432`: 1,2,3,4,6,12; `y² ∣ 27`: 1,3; torsion `(2,±3)`, `(0,±1)`, `(−1,0)` | true; admits ±2, ±4, ±6, ±12 as the description says | none |
| Classical Nagell–Lutz at a singular model | `A = −3`, `B = 2` | `4A³+27B² = 0`; nonsingular torsion is `(−2, 0)`, `y = 0` | holds with no `Δ ≠ 0` hypothesis | R02 |
| Weil pairing (sample; AEC III.8.1) | `N = 1`; zero pairing; `e⁻¹` | `E[1] = 0` trivial; zero map excluded by nondegeneracy; inverse pairing excluded by no stated law | sound; sign unpinned, object is sorry'd | R01 |
| Hasse bound (sample; AEC V.1.1–2) `hasse_bound` | `𝔽₂`: `y²+y = x³+x+1`, `y²+y = x³+x`; `𝔽₅`: `y² = x³+x` | counts 1, 5, 4; `(1−3)² = 4 ≤ 8`, `(5−3)² = 4 ≤ 8`, `(4−6)² = 4 ≤ 20` | true; proved at the pin | R04 |
| `frobeniusTrace` on `pointCount` | split, nonsplit, additive cubic over `𝔽_q` | projective counts `q`, `q+2`, `q+1`; traces `1`, `−1`, `0`; nonsingular-locus counts give `2`, `0`, `1` | README values confirmed | none |
| Function field is the foundation (sample; AEC II.2.4) | `y² = x³ + t` over `𝔽₃(t)`; identity pullback | singular point `(−t^{1/3}, 0)` irrational; `mapsInfinity_id` elaborates; `Projective.nonsingular_zero` at `Projective/Basic.lean:404` | consistent | R16 |
| No schemes (sample) | mathlib pull requests 25983, 35151, 25991, 13782 | first three open; 13782 closed, not merged | "in flight" holds for three | none |
| Out of scope / complex uniformisation (sample) | Siegel, BSD, `℘` | `integralPoints` has no `Finite` instance; BSD is statement-only in Layer 7; `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` exists | text agrees with the layers | none |
| Pinned sources (sample) | five revisions | AINTLIB `513e83879e2f`, `50d5f9d37387`, `9fec8eba7652`; FLT `bc2fe8ff7396` (merge of 1088); Stoll `66889eada51a`: all resolve; three repositories Apache-2.0 | confirmed | R07 |
| `IsSupersingular` / `IsOrdinary` | `K = ℚ`, `p = 2`; `p = 1`; `p = 0` | ordinary for all `W`; supersingular for all `W`; `torsionBy 0 = ⊤`, ordinary | junk truths outside characteristic `p` | R03 |
| `isSupersingular_iff_dvd_frobeniusTrace`; "not `a_q = 0`" | `𝔽₃`: `y² = x³ − x`; `𝔽₅`: `y² = x³ + x`; `𝔽₂` with `a = ±2` | `a = 0`, supersingular; `a = 2`, `5 ∤ 2`, ordinary; `2 ∣ ±2` | README examples confirmed | none |
| `ℤ[π] ⊊ End(E)` example | `y² = x³ + x` over `𝔽₅` | `#E = 4`, `a = 2`, `π = 1 ± 2i`, `ℤ[π] = ℤ[2i]`, index 2 | confirmed | none |
| `torsion_addEquiv_prod` | `N = 1`; `(N : K) = 0` | `0 ≃+ ZMod 1 × ZMod 1`; excluded by `hN` | true; proved at the pin | R04, R10 |
| `fg_point_of_numberField` | — | pin: `MordellWeil/FinitelyGenerated.lean:145`, same statement | proved at the pin | R04 |
| `globalMinimalityClass_eq_one_iff_exists_globalMinimalModel` | `K = ℚ`; a field as `O` | class group trivial, model exists; number-field section excludes the field case | consistent with AEC VIII.8.2 as cited | R01 |
| `IsSemiGlobalMinimal` | `O` a field | spectrum empty: `IsGlobalMinimal` true, bare existential false, disjunction true | definition survives | none |
| Kraus step 6 against Mathlib's action | source `a₁ = a₂ = a₃ = 0`, `u = 1` | `variableChange_a₁/a₂/a₃/b₂` (lines 177–191): `2s`, `3r − s²`, `2t`, `12r`; `a₂ = (b₂ − a₁²)/4`; step-2 triple gives `a₂ = 0` | README formulas confirmed | none |
| `KrausLocalCondition` | `v ∤ 6` | `[0,0,0,−c₄/48,−c₆/864]` integral, `Δ = (c₄³−c₆²)/1728 ≠ 0` | both sides hold from admissibility | none |
| `minimalPairModel_unique` | `u = m/n`, prime `ℓ ∣ m`; `a₄ = 0` | `ℓ⁴ ∣ a₄'`, `ℓ⁶ ∣ a₆'` contradict minimality, also when `a₄ = 0` | `u = ±1`, equation unique | R11 |
| `abcQuality` | `j = 0`, `j = 1728`, `j/1728 = −1` | `a = 0`; `b = 0`; `(a,b,c) = (−1,2,1)`, `rad = 2`, denominator `log 2 ≠ 0` | hypothesis exactly excludes `abc = 0` | none |
| `freyCurve` | general `A`, `B` | `a₂ = B − A`, `a₄ = −AB`; `c₄ = 16(A²+AB+B²)`; `Δ = 16A²B²(A+B)²`; `a ≡ aᵖ (mod 8)` for odd `a` | identities and normalisation confirmed | none |
| `exists_quadraticTwist_hasSplitMultiplicativeReduction` | residue characteristic 2 | node forces `a₁` a unit (`c₄ ≡ a₁⁴`), tangent quadratic separable | no missing hypothesis | none |
| Zeta closed form | `n = 0, 1` | `t₀ = 2`, `t₁ = a`, `#E(𝔽_q) = q + 1 − t₁` | consistent with the trace convention | none |
| Canonical height normalisation | pin `CanonicalHeight/Basic.lean:119,368` | `lim h(2ⁿP)/4ⁿ`; pairing is the halved polar form, `⟨P,P⟩ = ĥ(P)` | agrees with README line 1227 | none |
| Worked example labels | `[0,−1,1,−10,−20]` | `Δ = −11⁵` | README line 1567 contradicts lines 1533–1534 | R13 |
| BHKSSW convention (Layer 8) | BHKSSW lines 53–55, 233 | `Δ = −16(4a₄³+27a₆²)`, `H = max{4|a₄|³, 27a₆²}`, the `p⁴`, `p⁶` condition | confirmed; the term is not the source's | R15 |

- The 12 changed lines carry no finding; R01–R18 are on text identical to main, except that R02's second statement is the target this pull request adds.
- Source locators checked against a text: 3 (BHKSSW lines 53–55 and 233; arXiv v2); AEC, ATAEC and Stichtenoth locators not checked (see below).
- Library declarations opened at the pins: 27 in Mathlib `1b1ccf4b` (among them `Reduction.lean:275–360`, `VariableChange.lean:177–210`, `Height/EllipticCurve.lean:37–110`, `StrongRankCondition.lean:666`, `ClassNumber.lean:219`, `SelmerGroup.lean:34–39`), 24 in Tau Ceti.
- Cross-roadmap citations resolved on main: AlgebraicCurves Layer 0 (`k̃ = ⋂_P 𝒪_P`, line 444), Layer 6 (fundamental identity, line 742), Layer 10 early Weierstrass milestone (lines 1243–1270, 1794–1805): 3 of 3 found.
- Dependency check: `depcheck: 236 roadmaps, 2534 edges, 0 problem(s)`. AlgebraicCurves Layer 10 (iv) in turn uses this roadmap's `toClass_surjective`; the layers involved do not form a cycle.
- Gate at this head: FAIL (`tex=1 prnum=2 sorry-data=11 residue=4 statement-hygiene=2 readme-ids-missing=1`, all else 0, `build=0`). Elaboration of `Suggested.lean`: 50 `sorry` warnings, nothing else.
- `#check @name` types read for all 92 declarations; six definitions lost binders (R01, R03); `krausStandardModel` loses only `[NumberField K]`, which its body does not use.
- Pull-request title and description read against the diff: no sentence contradicted (`README.md` only, 9 insertions, 3 deletions; no heading or declaration removed).

Overlap check: read AlgebraicCurves, ModularCurves, EllipticLegendreCharacterInterfaces (main), EllipticCurvePeriodsAndModularParametrizations, HyperellipticCurves, EffectiveDiophantineMethods (open); places of a Weierstrass function field: AlgebraicCurves owns the general interface, this roadmap the instance; periods over a general number field: the periods roadmap, the real period over `ℚ` here; supersingularity of scheme curves: ModularCurves, on another carrier; nothing owned twice.

Source independence: 2 passages compared with 1 source (BHKSSW), none shared; largest share AEC, 50 of 59 chapter-numbered locators; AEC's text could not be read, so wording was not compared with it; contents compared by chapter number only (Layers 1–7 ↔ AEC II–IV, III, V, VII, VIII.8, X.2/X.5, VIII, X.4; Layers 0, 0.5, 4.5b, 8 have no counterpart; twists precede Mordell–Weil): not one to one.

Research link: The layers supply the BSD quotient and its isogeny invariance (Cassels 1965), global minimal models by Kraus's criterion (Kraus 1989), the height ordering of Balakrishnan–Ho–Kaplan–Spicer–Stein–Weigandt (2016) and the Frey curve of Darmon–Diamond–Taylor (1995); rests on the README's references and BHKSSW lines 51–55.

## Not verifiable

- AEC (Silverman, 2nd ed.), all 50 locators including the sampled III.8.1, V.1.1, V.1.2 and II.2.4: the sources service found no legal copy.
- AEC V.4.1 for `IsSupersingular E ↔ p ∣ a_q` (`README.md` line 741, `Suggested.lean` line 465): not readable; worth the author's check that this numbered result is the trace criterion and not the Hasse-invariant criterion.
- ATAEC IV.9, V.3.1, V.5.3; Stichtenoth I.1, III.1.11; Katz–Mazur 2.6.2.2; Kraus 1989; Cassels 1965; Tate 1975: not fetched.
- The Angdinata development (`README.md` lines 1733–1737): no public revision exists to read.
- "sorry-free (per its author)" for the Stoll repository and the axiom audit of AINTLIB `HasseWeil`: revisions resolve, contents not audited.
- LMFDB labels of the Tate's-algorithm list other than 11.a1/11.a2 (`README.md` lines 1532–1542): not checked against the database.

## Source issues

- none

## For the human reviewers

- The gate fails on text that is identical on main, and every finding but half of R02 predates this pull request, whose 12 changed lines are correct. Whether a small correction waits for those repairs is yours to decide.
- Licence: `README.md` lines 1733–1737 take the `Isogeny` definition from D. Angdinata's unpublished shared files, with no public revision or stated licence; `Suggested.lean` lines 123–192 state it "verbatim".
- Licence: `Suggested.lean` lines 892–901 say the body of `quadraticTwistOf` is copied from the FLT repository (`ImperialCollegeLondon/FLT`, revision `bc2fe8ff7396`, Apache-2.0 per the repository); `fg_point_of_numberField` takes its name from `MichaelStollBayreuth/EllipticCurves` (Apache-2.0).
- Not tested: AEC holds 50 of 59 locators and could not be read; the wording and contents comparisons were not made against its text.
