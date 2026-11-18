# Review of EllipticCurves (pull request #2483 at 1fe14b8)

**Verdict:** needs changes

## R01 (P2) — The Tate uniformisation theorem is called proved at the pin; the pin proves neither additivity nor surjectivity, and the headline is statable but absent

**Location:** `TauCetiRoadmap/EllipticCurves/Suggested.lean` lines 21–26: "The other headline theorems of `README.md` (… the quadratic-twist and Tate-curve theorems, …) are proved in the pinned Tau Ceti"; `README.md` lines 256–258 and 1324–1326 ("a group isomorphism `L^× / q^ℤ ≅ E_q(L)`").
**Claim:** The pinned Tau Ceti has the uniformisation map, its injectivity, its Galois equivariance and the split reduction of `E_q` over a discrete valuation ring, but not that the map is a homomorphism or onto. The headline is statable against `TauCeti.tateUniformization` and is not in `Suggested.lean`.
**Witness:** Pinned `TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Uniformization.lean` lines 29–31: the module says its statements do not assert additivity or surjectivity and that the map is not bundled as a homomorphism; no `tateUniformization` lemma on `x * y` or `Surjective` exists in the pin.
**Repair:** Add `import TauCeti.AlgebraicGeometry.EllipticCurve.TateCurve.Uniformization` and, under `/-! ## Layer 4: … -/`, the statement below (it elaborates at the pins on a scratch copy, `sorry` the only warning). In the module docstring move "Tate-curve theorems" from the proved list to the stated ones ("four" headlines); in `README.md` lines 256–258 add "and, in §Layer 4, that the Tate uniformisation is a bijective homomorphism"; at line 1326 add "Tau Ceti has the map `TauCeti.tateUniformization`, `TauCeti.tateUniformization_injective` and the Galois equivariance; additivity and surjectivity are the open part (`tateUniformization_bijective_and_map_mul` in `Suggested.lean`)". The description's "three headline theorems" becomes four.

```lean
/-- **Tate's uniformisation** (ATAEC V.3.1 for a discretely valued field; Tate 1995 and Roquette
1970 in general). For `K` complete non-archimedean and `q : Kˣ` with `‖q‖ < 1`, the map
`Kˣ / q^ℤ → E_q(K)` is a bijective group homomorphism. -/
theorem tateUniformization_bijective_and_map_mul {K : Type*} [NormedField K] [CompleteSpace K]
    [IsUltrametricDist K] [DecidableEq K] (q : Kˣ) (hq : ‖(q : K)‖ < 1) :
    Function.Bijective (TauCeti.tateUniformization q hq) ∧
      ∀ x y : Kˣ ⧸ Subgroup.zpowers q,
        TauCeti.tateUniformization q hq (x * y) =
          TauCeti.tateUniformization q hq x + TauCeti.tateUniformization q hq y :=
  sorry
```

## R02 (P2) — The split reduction of `E_q` over a non-discrete field rests on reduction predicates that no layer owns

**Location:** `README.md` lines 368–371: "the target shape re-founds the reduction predicates over **an arbitrary ring with a valuation** … that refactor is an **upstream prerequisite** for Layer 4's Tate-curve strand"; lines 1336–1337: "consumes the rank-1 generalisation … flagged in the consume-section above"; lines 1369–1370.
**Claim:** "The split-multiplicative-reduction theorem for `E_q`" is a named output for every complete rank-1 `K`, `ℂ_p` included, but its predicate over a non-discrete valuation ring is left to a Mathlib refactor that no layer, supplier or pinned declaration provides. "The consume-section" is a heading this revision removed.
**Witness:** Pinned `TateCurve/Reduction.lean` line 68: `variable [IsDiscreteValuationRing 𝒪[K]]` precedes `hasSplitMultiplicativeReduction_tateCurveAt` (line 88); Mathlib's `HasSplitMultiplicativeReduction` (`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`) takes a DVR; `𝒪[ℂ_p]` is not one.
**Repair:** Scope the output to what is owned. Lines 365–371: "⚠ Mathlib states these only over a **DVR**, the base of Layer 4's Tate's-algorithm strand; over a non-discrete rank-1 field Layer 4 states the reduction of the Tate curve on its equation." Lines 1332–1337: "Named outputs: `Δ(q)` and `j(q) = 1/q + 744 + ⋯` with `|j(q)| = 1/|q|`; over every such `K`, `|a₄(q)|, |a₆(q)| < 1` and `|c₄(q)| = 1`, so the equation reduces to the nodal cubic `y² + xy = x³` with tangents `y = 0`, `y = −x`; and, when `𝒪[K]` is a discrete valuation ring, `v(Δ) = v(q)` and split multiplicative reduction (Tau Ceti's `TauCeti.hasSplitMultiplicativeReduction_tateCurveAt`)." Delete the sentence at 1336–1337 and the clause "and the Tate-curve strand consumes … §Exact supplier contracts" at 1369–1370. (Alternatively make the valuation-ring predicates a Layer 4 definition of this roadmap, with their agreement with Mathlib's over a DVR and three Checks.)

## R03 (P3) — Layer 4 is said to depend on Layer 5 through no named target, against "the layers are in dependency order"

**Location:** `README.md` lines 1368–1369: "Layer 5's split-reduction statement feeds back into the analytic strand, so the two land together, not in numeric order"; line 426: "The layers are in dependency order".
**Claim:** No target of Layer 4's Tate-curve bullet (lines 1319–1337) uses a quadratic twist, and Layer 5's Dependencies (lines 1802–1805) take only Mathlib's reduction predicates from below; the two sentences contradict each other and the consumer is unnamed.
**Witness:** Lines 1319–1337 list `E_q`, the uniformisation, `Δ(q)`, `j(q)`, `v(Δ) = v(q)` and split reduction of `E_q`: none mentions a twist. `exists_quadraticTwist_hasSplitMultiplicativeReduction` (pinned `QuadraticTwist/SplitMultiplicative.lean:163`) imports no Tate-curve file.
**Repair:** Delete "Layer 5's split-reduction statement feeds back into the analytic strand, so the two land together, not in numeric order, and". If a Layer 4 statement that needs the twist is intended (a curve with nonsplit multiplicative reduction is a Tate curve after a separable quadratic twist), state it in Layer 5, after the split-reduction headline, with its hypotheses and locator.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `sq_dvd_four_mul_cube_add_of_isOfFinAddOrder` (headline) | `(A,B) = (0,1)`, `(0,4)`, `(−43,166)`; node `(−3,−2)` | `4A³+27B²` = 27, 432, 425984 = 64·6656, 0; torsion `y²` = 1, 9; 4; 64; node: `(3,±4)`, `(11,±36)`, `(2,0)` integral | true, also on singular models | none |
| Same, one-tactic probe | `simpa using lutz_nagell A B hns htor` | library gives `y² ∣ −(64A³) − 432B²`; goal `4A³ + 27B²`: mismatch | not padding | none |
| `LFunction_eq_of_isogeny` (headline) | Mathlib `LFunction.lean:43–50, 79–81`; `simp [LFunction]`, `rfl` | factors `1 − aT + qT²`, `1 − T`, `1 + T`, `1` of the minimal model over `K_v`; each an isogeny invariant; probes leave the Euler products unequal | true; not padding | none |
| `bsdQuotient_eq_of_isogeny` (headline) | 11.a2 and 11.a3; `Quotient.lean:83–86`; `simp [bsdQuotient_def]`, `rfl` | `Ω·∏c_p/tors²` = 1.26921·5/25 = 0.253842 and 6.34605·1/25 = 0.253842; period-free parts 1/5, 1/25 | consistent with Cassels; not padding | none |
| Tate uniformisation (headline) | pinned `TateCurve/*.lean`; scratch statement | pin: map, `tateUniformization_injective`, `map_algEquiv_tateUniformizationBaseChange`; no additivity, no surjectivity; statement elaborates | statable, unproved, absent | R01 |
| Split reduction of `E_q` | `𝒪[K]` a DVR; `K = ℂ_p` | pin proves it under `[IsDiscreteValuationRing 𝒪[K]]`; no predicate over `𝒪[ℂ_p]` at the pins | README wider than any owner | R02 |
| Tate coefficients | `s₃ = q + 9q² + ⋯`, `s₅ = q + 33q² + ⋯` | `a₄ = −5q − 45q²`; numerators 12, 276; `a₆ = −q − 23q²` | Check correct | none |
| Weil pairing (sample), orientation | `y² + y = x³` over `𝔽₄`, `g_T` built in `E(𝔽₆₄)` (81 points), `g(X+S)/g(X)` at every admissible `X` | `e₃((0,0),(1,ω)) = ω`; with `T = (1,ω²)`: `ω²`; pin `WeilPairing/Basic.lean:223–236` is `τ_S g/g`, `τ_P : Q ↦ Q + P` | Check and convention agree with the pin | none |
| The function field is the foundation (sample) | pin `Isogeny/Basic.lean:139–143`; Mathlib `Projective/Basic.lean:404`; `y² = x³ + t` over `𝔽₃(t)` | fields `pullback`, `mapsInfinity` as displayed; `nonsingular_zero` needs only `[Nontrivial R]`; singular point `(−t^(1/3), 0)` | consistent | none |
| No schemes / Out of scope / Complex uniformisation (sample) | Siegel, BSD, `℘` | no `Finite` instance on `integralPoints`; `bsdQuotient` typed over `ℚ`; `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` exists; `r₁+r₂−1 = 0` with a real place gives `ℚ` | text agrees with layers and pins | none |
| Already in Tau Ceti (sample) | 355 backticked names and 101 backticked paths of the README looked up at the pins | every name of lines 186–254 and 399–409 declared; the 38 not found are provenance names, `Suggested.lean` names or prose | list correct | none |
| Translations, `[2]`, Vélu | `y² = x³ + 1`, `Q = (0,1)`, `P = (2,3)`; `y² = x³ − 2`; `y² = x³ − x` | `x(P+Q) = −1`, `x(P−Q) = 2`, `x(2P) = 0`; `t = 0`, `w = 18`, quotient `x³ − 128`; `X = x − 1/x`, `Y² = X³ + 4X` | Checks correct | none |
| Trace, Hasse, supersingularity | `x³−x/𝔽₃`, `x³+x/𝔽₅`, three singular cubics over `𝔽₅`, two curves over `𝔽₂`, `y²+xy = x³+t` | counts 4, 4; 5, 7, 6; 1, 5; traces 0, 2; 1, −1, 0; 2, −2; `j = 1/t`, 2-torsion `(0,√t)` | Checks correct | none |
| Zeta function | `y² = x³ − x` over `𝔽₃` | `t₂ = −6`, `#E(𝔽₉) = 16 = #E[4]`; numerator and denominator both scale by `1/(qT²)` | Checks correct | none |
| Reduction, minimal models | 37.a1, `[0,0,8,−16,0]`, 11.a2, `y² = x³ + p` | `5P = (1/4, −5/8)`, `7P = (−5/9, 8/27)`; `Δ = 37`, `2¹²·37`; node `(5,5)`, `v² = 3u² + u³`, `3 = 5²` in `𝔽₁₁`; `c₄ = 48`, `496`; `Δ = −432p²` | Checks correct | none |
| Kraus witnesses | `(c₄, c₆) = (48, −216)` | `W₀ = [0,0,0,−1,1/4]`; `(0,0,1/2)`-transform is `y² + y = x³ − x`; `a₂ = 3r − s² = (b₂ − a₁²)/4` | Checks correct | none |
| Twists | `x³ − 2` and `x³ + 2` at 7; `x³ + 2`, `x³ + 1458`; `x³ − x` by `ℚ(i)` | 7 and 9 points, traces 1, −1; `1458 = 2·3⁶`; twist returns `y² = x³ − x` | Checks correct | none |
| Canonical height | 37.a1, `P = (0,0)`; pin `CanonicalHeight/Basic.lean:119` | `h(2ⁿP)/4ⁿ` = 0.050295, 0.051101, 0.051111 at `n` = 3, 4, 8; `h(80P)/80²` = 0.051102; `5·(5,5) = O` on 11.a2 | Checks and normalisation correct | none |
| Layer 8 quantities | 37.a1; `y² = x³ − 6x + 8`; `(−16,16)` against `(−1,1/4)` | minimal pair `(−16,16)`, height 16384, `Δ = 2¹²·37`; `j = −1728`, quality 1; `log 64/log 222 = 0.7698`, unreduced 2.1496; `16384/2¹² = 4` | Checks correct | none |
| Frey curve | general `A, B` | `Δ = 16A²B²(A+B)²`, `c₄ = 16(A²+AB+B²)`; `a + c ≡ 0 (mod 4)` | identities correct | none |
| Supersingularity locators | Sutherland18783 lines 13–16, 48, 56–59 | definition by `E[p]`; Theorem 14.2 `tr π ≡ 0 mod p`; Corollary 14.3 for `p > 3`; Warning 14.4 for 2, 3 | README lines 1064–1067, 1101–1105 supported | none |
| Cassels and `L_S` locators | MilneADT lines 3624–3635, 3666–3668 | I.7.1(a) `L_S` equal, proof by `V_ℓ`; (b) `Ш` finiteness; I.7.3 BSD for one iff the other | README lines 1953, 1964, 2385–2388 supported | none |
| Minimal-pair height locators | BHKSSW lines 52–55, 226–234 | `H = max{4|a₄|³, 27a₆²}` called naive height in §1; the `p⁴ ∣ a₄`, `p⁶ ∣ a₆` condition in §2.1 | README lines 2095–2097, 2122–2123 supported | none |

| Previous finding | At this head | Status |
|---|---|---|
| R01 (pending sentences) | none of the five passages remains; Layer 3 Dependencies line 1190 | repaired |
| R02 (canonical height) | lines 1835–1843: "`limUnder` of the first sequence", both limits cited | repaired |
| R03 (undeclared names) | `HasCM`, `inducedPlace`, `szpiroRatio`, `krausLocalCondition_of_not_dvd_six`: no occurrence | repaired |
| R04 (`L`-function locator) | lines 1963–1969; `Suggested.lean` lines 55–61 | repaired |
| R05 (Checks, Examples, Dependencies) | 40 `**Checks.**` lists; 12 `#### Examples`, 12 `#### Dependencies`; orientation Check line 979 | repaired |
| R06 (description) | summary block names the three declarations and the reshaping | repaired |

- Source locators checked against a text: 11 (Sutherland18783 lines 13–16, 48, 56–57, 59; MilneADT lines 3624–3629, 3630–3631, 3632–3635, 3666–3668; BHKSSW lines 52–55, 227–228, 230–233).
- Library declarations opened at the pins: Tau Ceti `Isogeny/Basic.lean:139`, `DivisionPolynomial/ShortNagellLutz.lean:151`, `BirchSwinnertonDyer/Quotient.lean:83`, `Isogeny/MulByInt/WeilPairing/Basic.lean:225, 383`, `Affine/FunctionField/Translation/Basic.lean:274`, `TateCurve/Uniformization.lean:50`, `TateCurve/Injectivity.lean:201`, `TateCurve/Reduction.lean:68, 88`, `CanonicalHeight/Basic.lean:119`, `HasseBound.lean:44`, `MordellWeil/FinitelyGenerated.lean:145`, `Isogeny/MulByInt/Torsion/Structure.lean:133`, `GaloisCohomology/Selmer/Finite.lean:57`, `MinimalModel/GlobalExistence.lean:392`, `QuadraticTwist/SplitMultiplicative.lean:163`, `TateModule/GoodReduction.lean:222`, `TateModule/PotentialGoodReduction.lean:398`; Mathlib `LFunction.lean:43, 79`, `Projective/Basic.lean:404`, `Algebra/Module/Torsion/Basic.lean:975`, `LinearAlgebra/Dimension/StrongRankCondition.lean:666`.
- Cross-roadmap citations resolved on main: AlgebraicCurves Layer 0 (line 403), Layer 6 (line 712), Layer 10's early Weierstrass milestone (lines 54, 1803, 1909): 3 of 3; the 26 roadmaps of §Downstream consumers are on main and cite this roadmap; the three layer anchors other roadmaps link to (five links) are unchanged, the layer headings being identical to main's.
- Dependency check: `depcheck: 236 roadmaps, 2534 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Gate at this head: every check 0, `build=0`, OK. `lake env lean` on `Suggested.lean`: three `sorry` warnings, nothing else. `#check @name` types of the three declarations equal their README statements; no binder lost.
- One-tactic probes on a scratch copy (`simp`, `rfl`, `simpa using` the library lemma) close none of the three declarations.
- No file outside `TauCetiRoadmap/EllipticCurves/` changes; no roadmap on main or in an open pull request uses a `TauCetiRoadmap.EllipticCurves.*` name or declares one of the three.
- Pull-request text against the head: title, summary block and prose agree with the head (three declarations, shape, suppliers, anchors); only R01's "three" changes.

Overlap check: read AlgebraicCurves, ModularCurves, EllipticLegendreCharacterInterfaces (main), EllipticCurvePeriodsAndModularParametrizations, HyperellipticCurves, EffectiveDiophantineMethods (open); places and the fundamental identity: AlgebraicCurves owns, this roadmap consumes; the BSD quotient over `ℚ`, Cassels' theorem, Nagell–Lutz, the Tate uniformisation and quadratic twists: this roadmap owns, the others cite; nothing owned twice.

Source independence: 7 passages compared with 3 sources (Sutherland18783, MilneADT, BHKSSW), none shared; largest share AEC, about 61 of 77 locators; AEC's text could not be read, so its wording was not compared; contents compared by chapter number only (Layers 1–7 ↔ AEC II–IV, III.6–8, V, VII, VIII.8, X.2/X.5, VIII, X.4, not in the book's order; Layers 0, 0.5, 4.5b, 8 without counterpart): independent.

Research link: `Suggested.lean` states Cassels' isogeny invariance of the Birch–Swinnerton-Dyer quotient (Cassels 1965; Tate for abelian varieties, per Milne 2006) and the classical Nagell–Lutz bound; Layer 4.5b follows Kraus (1989), Layer 8 the height of Balakrishnan–Ho–Kaplan–Spicer–Stein–Weigandt (2016). Rests on MilneADT lines 3666–3668, BHKSSW lines 52–55 and the README's references.

## Not verifiable

- AEC (Silverman, 2nd ed.), every locator, including the sampled III.8.1 (Weil pairing) and II.2.4: not in the sources cache. Whether II.2.4, stated under AEC's standing hypotheses, covers the regular-curve dictionary over an imperfect field (`README.md` lines 28–30) was not checked.
- ATAEC IV.9, V.3.1, V.5.3; Tate 1995 and Roquette 1970 for surjectivity of the uniformisation over a general complete field (R01's statement rests on the README's own attribution, lines 1333–1336); Stichtenoth I.1, III.1.11; Katz–Mazur 2.6.2.2; Kraus 1989; Cassels 1965; Rubin I.§1–2: not fetched.
- No schemes (sample): the state and content of mathlib pull requests 25983, 35151, 25991 and 13782 were not looked up.
- Pinned sources (sample): the AINTLIB, FLT and Stoll revisions and their licences were not looked up; the Angdinata development has no public revision.
- LMFDB labels of the Tate's-algorithm list (`README.md` lines 1350–1360) other than 11.a1, 11.a2, 11.a3, 37.a1: not checked against the database.
- The `ℚ(√65)` curve of lines 1542–1551 (everywhere good reduction, nontrivial class): not recomputed; only `disc = 65` and `h = 2` were.
- The periods 5.24412, 5.98692, 1.26921, 6.34605 (lines 2014–2018, 2056): not integrated here; only their ratios and products were recomputed.

## Source issues

- none

## For the human reviewers

- Scope: the layer headings from Layer 1 to Layer 7, and the section comments of `Suggested.lean` lines 30 and 50, carry AEC chapter numbers; the titles name the mathematics, and roadmaps on main link to three of these anchors.
- Licence: `README.md` lines 61–67 and 2408–2412 take the `Isogeny` definition from D. Angdinata's unpublished shared files, with no public revision or stated licence; the same structure is in pinned Tau Ceti (`Isogeny/Basic.lean:139`).
- Not tested: AEC holds about 61 of 77 locators and could not be read; the wording and contents comparisons were not made against its text.
