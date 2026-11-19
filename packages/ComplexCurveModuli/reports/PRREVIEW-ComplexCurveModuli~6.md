# Review of ComplexCurveModuli (pull request #2548 at 539eb83)

**Verdict:** accepted

**Summary.** Accepted: the 22 changed lines repair the one small correction of the previous review, and the new bridge from `HasGeodesicBoundary` to the second fundamental form of RiemannianManifoldsWithConvexBoundary §1.4 is mathematically correct, with the sign and the compactness hypothesis checked on the disc and its exterior. The pull request's description agrees with this head. There is one small correction (the Dependencies list of Layer 0 does not name the new supplier) and one carried question about the cited version of Wendl's notes; neither blocks. Nothing is left for the human reviewers to decide.

## C01 — The Dependencies list of Layer 0 does not name RiemannianManifoldsWithConvexBoundary §1.4, which §0.4 now consumes

A reader who takes the suppliers of Layer 0 from its closing list misses one. The *Needs:* line of §0.4 (README lines 344–345), the list of imported theory under Scope and ownership (line 1805) and the supplier contracts (line 2028) all name RiemannianManifoldsWithConvexBoundary §1.4, but the `### Dependencies` paragraph that ends Layer 0 (lines 413–420) still lists "GeometricTopology §§1.1, 1.7; AlgebraicTopology §§7.1–7.3; … PDE §§1.1, 1.4, 1.7; DifferentialGeometry Layer 3" without it. Adding "RiemannianManifoldsWithConvexBoundary §1.4" to that paragraph makes the four places agree.

## Questions for the author

- The References cite Wendl's notes as "version 3.3", and §3.5 cites its §§4.2–4.3. The copy that can be read openly is arXiv:1011.1690v2, which is version 3.2; there the offset map `Diff^(k+1,p) × T → J^(k,p)` is in the proof of Theorem 4.30 (Wendl lines 5743–5761). Does version 3.3 keep this numbering? Version 3.3 could not be read; if it cannot be checked, citing version 3.2 (arXiv v2) would make the locator verifiable. (Carried from the previous review; the passage is unchanged.)

## Previous findings

- The previous review raised no finding. Its small correction C01 is repaired: "its component along the inward unit normal is `II(γ′, γ′)`, for the second fundamental form II of the boundary (RiemannianManifoldsWithConvexBoundary §1.4)", with §1.4 in the *Needs:* line and the supplier contracts.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4 boundary paragraph: acceleration of a unit-speed boundary curve is `II(γ′, γ′) ν_in` | closed unit disc, γ = (cos t, sin t); exterior of the unit disc | disc: γ″ = −γ = ν_in, normal component 1, supplier has II = h; exterior: ν_in = x, component −1, supplier has II = −h | true, sign agrees with the supplier's ball witness | none |
| §0.4: "`HasGeodesicBoundary g` holds exactly when II vanishes" on a compact surface | empty boundary; flat cylinder; a boundary arc of finite length on a non-compact surface | both sides vacuous; acceleration 0 and II = 0; no unit-speed curve ℝ → arc, so the predicate is vacuous while II may be nonzero: compactness is needed and is stated | true as stated, both directions | none |
| §0.4: tangential part of the acceleration vanishes | `⟨γ′, γ′⟩ = 1` differentiated | `2⟨∇_γ′ γ′, γ′⟩ = 0`; in dimension 2, `T_qM` is spanned by γ′ and ν_in, so the acceleration is `II(γ′, γ′) ν_in`, and II on a line is fixed by that value | true | none |
| Supplier contract for RiemannianManifoldsWithConvexBoundary §1.4 | n = 1 in the supplier's setting | supplier: `𝓡∂ (n+1)`, every n ≥ 0; third description `⟨∇_(dι u) W, ν_in(q)⟩` with W of class C¹, tangent along the boundary; bilinear and symmetric; ∇ Mathlib's Levi-Civita | contract equals what §1.4 states | none |
| `HasGeodesicBoundary` (statement the changed text cites) | flat disc; flat cylinder | acceleration −(cos t, sin t) ≠ 0, not geodesic; acceleration 0, geodesic | unchanged; agrees with the new prose | none |
| Layer 0 Dependencies (C01) | the four places that list the suppliers of §0.4 | three name RiemannianManifoldsWithConvexBoundary §1.4, the Dependencies paragraph does not | incomplete list | C01 |

The rows for the untouched statements stand as in the previous review, of `4b53f57`.

- Changed passages: four (the *Boundary* paragraph and *Needs:* line of §0.4, the imported-theory list under Scope and ownership, the new supplier subsection); `Suggested.lean` is unchanged. No source locator was added or changed, and none of the seeded sample's targets falls in the changed passages.
- Cross-roadmap citation resolved on main: RiemannianManifoldsWithConvexBoundary §1.4 (README line 563, with its Conventions at lines 141–165 and 179–185 and the surface identity `II = k_g ds²` at line 103). The roadmap is on main and earlier in the merge order; no open pull request revises it, and it defines no geodesic-boundary predicate, so nothing has two owners.
- Dependency check output: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)`. No UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/ComplexCurveModuli/`.
- Elaboration of `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`: seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166, 186) and nothing else.
- Pull-request description against the head and against main: 55 Check bullets counted ("about 55"); 50 numbered sections, each with a *Needs:* line; nine layers, each with Examples and Dependencies; the seventeen supplier subsections match the list, RiemannianManifoldsWithConvexBoundary included; main's file has the eight `#print axioms` lines, the `Degree` import, the namespace `TauCeti.ComplexCurveModuli` and `CircleSobolevCoefficients`, as the description says; seven theorems and one definition added, one declaration removed; the sentence on `HasGeodesicBoundary` and the second fundamental form agrees with §0.4; the broken ConformalMappingPartII fragment is stated. No sentence contradicts the head and no change is left unstated.
- Automatic checks: all passed; none set aside.

Overlap check: read AnalyticStableMaps, GromovWittenTheory and HeegaardFloer (main), TeichmullerGeometry and FuchsianOrbifoldsPartII (open heads), as in the previous review, and RiemannianManifoldsWithConvexBoundary (main) for the changed passages; nothing shared. The second fundamental form of the boundary is owned by RiemannianManifoldsWithConvexBoundary §1.4 and cited here; `HasGeodesicBoundary` is owned here and stated nowhere else.

Source independence: changed passages only; 4 passages compared with 1 source (RobbinSalamon2006 at 17.1–17.3, lines 3298–3325) and with RiemannianManifoldsWithConvexBoundary §1.4, none shared beyond the formula for II; largest share RobbinSalamon2006, 21 of 24 body locators, unchanged; no layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent. The corrigendum was not read.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold of Robbin and Salamon (2006, corrigendum 2007), extended in §4.5 to all restricted families; AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. Rests on the README's Downstream consumers and References and on RobbinSalamon2006 §§5–6, 17.

## Not verifiable

- Robbin–Salamon corrigendum (J. Eur. Math. Soc. 9 (2007), 901–905): behind a subscription, recorded as uncertified; not read. The changed passages do not cite it.
- Wendl, version 3.3: not read; version 3.2 (arXiv v2) was read in the previous review (see the question above).

## Source issues

- none

## For the human reviewers

- none
