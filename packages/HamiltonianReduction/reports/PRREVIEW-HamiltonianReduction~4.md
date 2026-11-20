# Review of HamiltonianReduction (pull request #2690 at 6d61ae8)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted with no findings. The two heading anchors that roadmaps on main link to are back, so the earlier C01 is repaired. Every row of the new former-label table matches main's numbering, and every R-label citation on main or at an open head resolves through it or through the paragraph in "How to read the build". The three other earlier small corrections are untouched and are carried as C01–C03: §3.2 is limited to compact groups, §3.0e and Layer 5 lack locators, and the Heisenberg group has no Lie structure. C03 is restated because Tau Ceti's `Nil` already supplies the charts. There is one new small correction to the description and one format note, none blocking. The human reviewers have only the earlier licence note on Meinrenken's lecture notes.

## C01 — §3.2 states singular reduction only for compact groups at zero, while the theorems it cites cover proper actions of any Lie group

As written, an implementer builds only the compact case. Singular reduction for proper actions of noncompact groups then has no owner, although §3.1 supplies their local model. Line 1469 reads "For compact `G` and singular reduction at zero, construct the orbit-type pieces…". The parenthesis at the end of that sentence cites Bates–Lerman, Theorem 7, Corollary 14 and Theorem 15. These assume only a proper Hamiltonian action of a Lie group (BatesLerman1997 line 651) and a locally closed coadjoint orbit.

Two repairs would work. The section could state the orbit-type decomposition and strata at that generality, with compact `G` at zero as a special case. Or "Not claimed" could exclude the proper noncompact case and give the reason.

## C02 — The orbifold presentation and Layer 5's analytic results have no source locator

Without locators a reader cannot check these targets' hypotheses against the literature. Layer 5 has only two source locators: §5.1 (Meinrenken, Theorem 7.46, line 1591) and §5.8 (Huebschmann, line 1768). None of the following has a theorem or page locator:

- §3.0e (line 1329);
- §5.3 (regularity of weakly flat connections and gauges);
- §5.4 (the flat quotient as a component of `Hom(π₁Σ, K)/K`);
- §5.5 (the Euler formula for `dim H¹_A`);
- §§5.9–5.10.

For §3.0e, Cannas da Silva §24.5, pp. 150–151, treats the torus case and the weighted examples its Check uses. For Layer 5 I have opened no candidate source.

## C03 — §2.6 cites a Heisenberg carrier with no Lie group structure, and the pin already has the analytic charts

As written, an implementer cannot apply §2.1's homogeneous coadjoint orbit to the real Heisenberg group, because nothing supplies the `LieGroup` structure it needs. §2.6's *Needs* (line 888) names `TauCeti.HeisenbergGroup`, which at the pin is a group with the product topology only.

Tau Ceti's `TauCeti.Nil` (`Geometry/Manifold/Riemannian/Nil/Basic.lean`) already has the following:

- analytic charts of `ℝ × ℝ × ℝ` and `IsManifold 𝓘(ℝ, ℝ × ℝ × ℝ) ω` (lines 92–112);
- a `Group` instance (line 194);
- the group isomorphism `TauCeti.Nil.toHeisenberg : Nil ≃* HeisenbergGroup ℝ` (line 204).

No `LieGroup` instance exists for `Nil` or for `HeisenbergGroup` anywhere in Tau Ceti at the pin. This corrects the previous report, which said `Nil` had no charts.

The smallest repair is to cite `TauCeti.Nil` and `TauCeti.Nil.toHeisenberg` in §2.6's *Needs*, and to add as a step of §2.6 the analytic `LieGroup` structure on `Nil`. Its product `(a, b, c)(x, y, z) = (a + x, b + y, c + z + a y)` and its inversion are polynomial.

## C04 — The description leaves out the restored anchors and the second map of the former labels

A reader of the description cannot tell that main's links into this README survive the renaming. The paragraph on the former numbering says only that "A paragraph at the end of "How to read the build" states this map of the former numbering". It does not mention the two anchors before Layers 1 and 2 (lines 109 and 689), or the table at the end of "Scope and ownership" (lines 1939–1950).

It would be right to append: "The two heading anchors that roadmaps on main link to, `#r1-smooth-actions-moment-maps-and-equivariance` and `#r2-coadjoint-orbits-and-kks`, are kept before Layers 1 and 2, and a table at the end of Scope and ownership repeats the map of the block labels."

## N01 — The new label table repeats only part of the map in "How to read the build"

The table maps the block labels only. It leaves out R1a.k, R2a.k, R3.2 and R3's text before R3.1, which the paragraph at lines 66–69 maps. A reader who reaches the table looking for R2a.2 (cited six times on main) or R1a.2 (cited by DGFloer) finds no row for it. Either of two changes would help: add rows R1a.k → §1a.k, R2a.k → §2a.k, R3 before R3.1 → §§3.0–3.0e and R3.2 → §3.2, or add a sentence pointing to the paragraph.

## Previous findings

The previous report (of `1d8f3a7`) had no findings; its four small corrections are accounted for here.

- C01 — repaired: `<a id="r1-smooth-actions-moment-maps-and-equivariance"></a>` stands before Layer 1 (line 109) and `<a id="r2-coadjoint-orbits-and-kks"></a>` before Layer 2 (line 689); the three links on main resolve.
- C02 — not repaired: "For compact `G` and singular reduction at zero, construct the orbit-type pieces of the level and the strata of the quotient" (line 1469); carried as C01.
- C03 — not repaired: §3.0e (line 1329) and §§5.3–5.5, 5.9–5.10 still carry no source locator; carried as C02.
- C04 — not repaired: "*Needs:* §2.2, §2.5; Mathlib `Matrix.unitaryGroup`, … Tau Ceti `TauCeti.HeisenbergGroup`" (lines 887–888); carried as C03, with the repair corrected.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| Table "R2a → Layer 2a"; paragraph "R2a.k is §2a.k" | main R2a item 2; ConvexityToric #2578 "R2a.2–4" | main item 2: root planes `E_α`, `J_α² = −Id`; head §2a.2 "Root planes, the KKS form and the Hessian": same content | holds; N01 |
| Table "R3.1 → §3.1" | main heading line 262; head line 1367 | both "Proper-orbit symplectic slice"; ConvexityToric #2578's consumed slice model is §3.1's `G ×_H (𝔪* × V)` | holds |
| Anchor `#r1-…` (earlier C01) | CotangentLagrangian l. 741, IntegrableSystems l. 337 on main | id at line 109 lands on Layer 1, which states the cotangent-lift moment map both links consume | holds |
| Anchor `#r2-…` (earlier C01) | ConvexityToric l. 542 on main | id at line 689 lands on Layer 2; §2.5 builds `𝔨*/K ≃ 𝔷(𝔨)* × 𝔱*_(ss,+)`, the quotient consumed there | holds |
| §3.1 local normal form (headline, cited by the table) | trivial `H`, `ν = 0`; circle on `ℂ`; BL §2 pp. 11–13 | `−d⟨η,θ⟩ = b(ξ) − a(ζ)`; `−d⟨ν,θ⟩ = ν([ξ,ζ])`; `½ω(iz,z) = −½|z|²`; BL: any Lie group, proper action | holds |
| §3.2 singular reduction (earlier C02) | weights `(1,−1)` on `ℂ²`; BL Thm 15 p. 15 | level `|z₁| = |z₂|`, quotient `ℂ` via `z₁z₂`; text still compact `G` at zero; BL: proper action of any Lie group | holds, narrower; C01 |
| §2.6 Heisenberg orbits (earlier C04) | pin: `Nil/Basic.lean` 92–112, 169, 194, 204; both Heisenberg files | `Nil`: analytic charts, `Group`, `≃* HeisenbergGroup ℝ`; no `LieGroup` instance; product `c + z + a y` polynomial | gap; C03 |
| §3.0e, §§5.3–5.5, 5.9–5.10 (earlier C03) | lines 1329–1366 and 1594–1851 searched | no theorem or page locator; only §5.1 (line 1591) and §5.8 (line 1768) cite sources | not repaired; C02 |
| `Suggested.lean` (unchanged since `1d8f3a7`) | `#check @` both declarations | compact, connected, `T2Space`, finite-dimensional model binders present; types identical to the previous round | holds |

The rows of the previous review for untouched statements stand as in the previous review, of `1d8f3a7`.

- Source locators checked against the text: 2 (BatesLerman1997 §2, pp. 11–13, lines 448–582; Theorem 15, p. 15, line 651).
- Library declarations opened at the pin: Tau Ceti `Geometry/Manifold/Riemannian/Nil/Basic.lean` 92, 102–112, 169–204; `Nil/` folder and all Heisenberg files searched for `LieGroup` (none); `Algebra/Lie/Heisenberg.lean` 360.
- Cross-roadmap citations resolved: the three anchor links on main; the R-label citations on main (R1 14, R2 24, R2a 10, R2a.2 6, R3 16, R3.1 5, R4 3, R5 11) and at open heads (DGFloer R1a.0–R1a.4; ConvexityToric #2578 R3.1, R2a.2–4; GeometricQuantization #2578 R1, R2, R2a; QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups R1–R3; GaugeQuiltFieldTheory, ComplexKahlerGeometry, SurfaceGroupCharacterVarieties R5). Each maps through the table or the paragraph.
- Automatic checks: rerun, all passed. Dependency check: `depcheck: 182 roadmaps, 2075 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings. `#check @` of both declarations is unchanged, and nothing was changed.
- Changes outside the folder: none; the family index files are unchanged.
- Overlap check: read ConvexityToric (main and #2578), GeometricQuantization (main and #2578), IntegrableSystems (#2691), CotangentLagrangian (#2687) and the SymplecticGeometry index (main and #2696). Nothing is shared, and the change adds no owned object. CotangentLagrangian's §§4.1, 4.2 and 4.7 and its Layer 4 are defined only at #2687, which the description names as merging first. #2696 is ordered after this pull request.

Source independence: changed passages only. The two anchor lines and the label table (one sentence, eight rows) carry no source wording, so nothing is shared. No layer was added, removed or reordered, so the arrangement stands as in the previous review: largest share CannasDaSilva2001, 9 of 33 locators; contents independent.

Research link: Layer 1a is Banyaga's flux theorem (1978, after Calabi). Layer 3's local normal form and singular reduction are Bates–Lerman (1997, after Sjamaar–Lerman 1991). Layer 2a is Bott's Morse theory of orbits (1956). Layer 5's local model is Huebschmann (1995, after Atiyah–Bott 1983). This rests on the README's references and the texts read.

## Not verifiable

- Nothing in this round's scope. Banyaga1978's formulas (an OCR scan) remain unchecked for misprints, as the previous review recorded.

## Source issues

- **Misprint** in BatesLerman1997 at §2, pp. 11–12: twice the source writes the associated bundle with fibre `(𝔤_α/𝔤_x)*` as a quotient by the orbit `G·x`; it should be the quotient by the isotropy group `G_x`, as in the diagram just before; affects nothing.

## For the human reviewers

- Licence and status: Meinrenken2024 is unpublished lecture notes on the author's Toronto page (README line 2120). It carries 8 of the 33 locators, including the general-group statements of regular reduction and of the KKS theorem.
