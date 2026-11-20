# Review of NewtonPolygons (pull request #2609 at 5007ca6)

**Verdict:** accepted

**Summary.** Accepted, with one format note that does not block. The radius formula now has the hypotheses of the library theorem in all three places: admissible coefficients and infinitely many nonzero coefficients, with a polynomial's radius `∞` stated beside it. The product sentence of the overview is now limited to polynomials and entire series. The new exact locators (Lazard Propositions 2 and 4 and p. 48; Kedlaya Corollary 3, Theorem 7 and §5) support the statements they are attached to. The format note is that two of these locators sit one bullet away from the claim they support. One licence question from the previous review is still open for the human reviewers.

## N01 — Two locators of the repair are not on the claim they support

In §5.2 (line 794), "Prove (Lazard §1, p. 48)" covers both bullets. Lazard p. 48 gives only the converse: a series converges at `x` exactly when its terms tend to zero. The point-radius bullet is not there. In §6.1 (line 872), the Eisenstein bullet lost its only source when Neukirch was dropped. One fix would put the Lazard locator on the Converse bullet. The Eisenstein bullet could then say "by direct computation from the Eisenstein conditions", as §6.5 does.

## Previous findings

- R01 — repaired: the overview (line 31) now reads "a series that has a Newton polygon and infinitely many nonzero coefficients … while a polynomial has infinite radius". The Lean docstring (line 21) and the Layer 5 introduction carry the same hypotheses.
- C01 — repaired: §4.1 cites Lazard Proposition 4, part 2. §4.2 cites Lazard Propositions 2 and 4 and Kedlaya Theorem 7 and §5. §5.2 cites Lazard §1, p. 48. §§6.1–6.2 cite Kedlaya Theorem 7, §5 and Corollary 3. §6.5 says "by direct computation".
- C02 — repaired: "No other statement changed its hypotheses or conclusion" is true again. The radius identification carries main's hypothesis of infinite support.
- N01 — repaired: line 217 reads "A polygon with bounded finite domain has finitely many vertices". The slope multiset is defined for "a nonempty bounded interval `[l, u]`".
- N02 — repaired: Convention 10 cites "Mathlib's Newton-polygon proposal (References)". The pull-request links and revisions now sit in a `[Mathlib proposals]` reference entry (line 1322).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| Radius headline (overview l. 31, Lean docstring l. 21, Layer 5 intro) | `1 − pX`; `Σ p^⌈n/2⌉ Xⁿ`; `Σ Xⁿ`; `b = p` | `1 − pX`: finite support, excluded, `R = ∞`. `⌈n/2⌉`: envelope `n/2`, sup `1/2`, `R = √p`. `Σ Xⁿ`: sup `0`, `R = 1` | true; hypotheses equal those of `radius_eq_exp_iSup_unitSlope_newtonPolygon` |
| Layer 5 intro, `R = b^λ` with polynomial clause | `1 − pX`; `0`; `Σ p^(−n²) Xⁿ` | `w(aₙ) = ∞` for `n ≥ 2`: `λ = ∞`, `R = ∞`. Zero: `λ = ∞`. Vertical: `λ = liminf(−n) = −∞`, `R = 0` | true |
| Overview product sentence | `(1 − X)·Σ Xⁿ = 1`; `(1 − X)(1 − pX)` | First: Minkowski sum is a ray, polygon of `1` a point; `Σ Xⁿ` not entire, so excluded. Second: `(0,0,1)` = `(0,0)` ⊕ `(0,1)` | true |
| §0.2 vertices, bounded domain | `(0,1,3)` on `[0,2]`; `n²` on ℕ; `⊤` | First: vertices `{0,1,2}`, interpolation exact. `n²`: every index a vertex, unbounded, excluded. `⊤`: no vertices | true |
| §0.2 slope multiset | `(0,1,3)`; singleton `[0,0]` | `{1,2}`: `2 = u − l` elements, sum `3 = h 2 − h 0`. Singleton: empty, sum `0` | true |
| §0.6 integer anchors | `n²` for `n ≥ −2` on ℤ; `|n|` on ℤ | First: start `−2`, slopes `−3, −1, 1, 3, …`. `|n|`: domain unbounded below, excluded | true |
| §4.1 constant-one form (Lazard Prop. 4(2), `m₂ = +∞`) | `1 − pX`, `r = 1`, `r = p²` | `m = −log_p r`. `r = 1`: `N(f,0) = 0`, pair `(1, f)`, `‖f − 1‖₁ = 1/p`. `r = p²`: `N(f,−2) = 1`, pair `(1 − pX, 1)` | true; degree `N(f,m) − n(f,+∞) = N(f,m)` |
| §4.2 vertices (Lazard Props. 2, 4) | `1 + pX + p³X²`, `σ = 1`, `r = p` | Weighted terms `1, 1, 1/p`: `u_r = 1 = j`. `P_r = 1 − X/α`, `v(α) = −1`, heights `(0,1)` agree on `[0,1]` | true |
| §4.2 slope factorisation (Kedlaya Th. 7) | `1 + pX + p³X²`; `X² + X + 2` over 2-adic `ℚ` | Root valuations `−1, −2`. `1/α₁ + 1/α₂ = −p`, `1/(α₁α₂) = p³`. Second: slopes `{−1, 0}` but irreducible over ℚ, so completeness is needed (present) | true |
| §4.2 irreducible ⇒ pure (Kedlaya §5) | `X² − p` over `ℚ_p`; `X² + X + 2` over `ℚ₂` | Heights `(1, ∞, 0)`, single slope `−1/2`. `−7` is a square in `ℚ₂`, so reducible with two slopes, as required | true |
| §5.2 converse (Lazard p. 48) | `Σ Xⁿ`, `Σ p^⌈√n⌉ Xⁿ` at `x = 1`; `Σ p^⌈n/2⌉ Xⁿ` over `ℚ_p` | Terms `1`: diverges, not restricted. Terms `p^(−⌈√n⌉) → 0`: converges, restricted. Point radius `1 < √p = R` | true |
| §6.1 slope by slope (Kedlaya Th. 7, §5) | `X² − 9`, `X² − 18` over `ℚ_3`; `X² − p` over `ℂ_p` | `d = 2`, `q = 1`: 2 and 1 factors, both `≤ 2`. Over `ℂ_p`: `q = 2` but factors are linear, so integer `w` is needed (Layer 6 assumes it) | true |
| §6.2 `q ∣ e` (Kedlaya Cor. 3) | `X^p − p`; `ξ₂` over `ℚ₂(i)` | Root valuation `1/p`, `q = p = e ≤ [L:K] = p`. `(i − 1)² = −2i`, `v(i − 1) = 1/2`, `q = 2 = e` | true |
| §6.5 `ξ₂` factorisation (direct computation) | roots `−1 ± i` | Sum `−2`, product `−(i² − 1) = 2`, so the product is `X² + 2X + 2` | true |

The rows for statements this change leaves untouched stand as in the previous review, of cfeb3c3.

- Source locators checked against the text: 7. These are Lazard p. 48 (Lazard line 73–81), Proposition 2 (pp. 53–54, Lazard line 288–298) and Proposition 4, parts 1–2 (pp. 55–56, Lazard line 358–380); Kedlaya Corollary 3 (p. 2, Kedlaya line 86), Theorem 7 (p. 4, Kedlaya line 144), with completeness from Proposition 6 (Kedlaya line 104), and §5 (p. 5, Kedlaya line 164–180).
- Library declarations opened at the pin: `TauCeti/NumberTheory/NewtonPolygon/Radius.lean:103,146,163`, `TauCeti/RingTheory/PowerSeries/Radius.lean:116`, `TauCeti/Algebra/Order/GroupWithZero/NegLog.lean:22,57,106`, `TauCeti/RingTheory/Valuation/ToAdditive.lean:27,59,96`. The two file headers credit the Mathlib proposals, as the new reference entry says.
- Cross-roadmap citations resolved: CompactOperators (open head) cites §§0.6, 3.3, 4.1, 4.3 and 5.3, all present here. PadicExtensionFamilies (main) cites the slope factorisation of Layer 4.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`.
- Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/NewtonPolygons/Suggested.lean`: six `sorry` warnings and nothing else. Only docstrings changed since cfeb3c3, so the previous `#check @` comparison and the one-tactic probe (none closes) still hold.
- Checks and examples: 18 and 28, the same counts as cfeb3c3 and as the description states.

Overlap check: read CompactOperators (open head) and PadicExtensionFamilies (main) again for the slope factorisation and the disc factor, the objects the changed passages touch. Both consume this roadmap's sections. No roadmap on main or at an open head states the radius–slope identification. The owners from the previous review stand: RestrictedPowerSeries (normed preparation), CompactOperators Layer 4 (lattice minors), Tau Ceti (coefficient polygons over `K((t))`), and this roadmap's §4.2 (slope factorisation).

Source independence: changed passages only. Seven passages compared with 2 sources (Lazard, Kedlaya), none shared and none translated. Largest share Lazard, 19 of 48 locator mentions. No layer was added, removed or reordered, so the contents were not compared again (previous result: independent of Lazard).

Research link: Layers 4–5 are Lazard's 1962 theory of zeros of analytic functions over complete valued fields (disc factors, zero counts, (4.13)). Layer 6 is the μ–λ Weierstrass preparation of Iwasawa theory (Washington §7.1) that PadicMeasuresIwasawaAlgebras uses. The Hodge–Newton comparison feeds Fredholm determinants (Kedlaya 2007, Theorem 16). This rests on the README and on the Lazard and Kedlaya texts.

## Not verifiable

- BGR §5.2 (still cited in §4.1 and the Layer 4 sources): Grundlehren 261, paywalled publisher page only. The Lazard locator added beside it was verified.
- Koblitz IV, Neukirch II, Washington §7.1 and NSW: the changed passages no longer cite them or do not depend on them, so they were not reopened. See the previous review.

Automatic checks set aside as false positives: the citation resolver reads the source key KedlayaNumerical §3 in the Layer 2 dependencies (line 596) as a citation of a roadmap; it is a reference key listed under References.

## Source issues

- none

## For the human reviewers

- Licence: the provenance section (README lines 988–1007) names a public repository (WilliamCoram/PhD at a fixed revision) as a source of candidate implementations for reuse with attribution. Its licence was not read, and its declarations were not compared with Suggested.lean.
