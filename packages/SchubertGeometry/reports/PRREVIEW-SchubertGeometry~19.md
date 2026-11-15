# Review of SchubertGeometry (pull request #1224 at a9b73a3)

**Verdict:** needs changes

## R01 (P3) — Two added suppliers are not stated

**Location:** PR description, third prose paragraph: “AlgebraicModuliForArithmeticGeometry, ShimuraData and ComplexComparisonPartII cease to be suppliers. S1.0–S1.1 construct … and S9.0 coherent analytification and proper GAGA.”
**Claim:** The description names the suppliers dropped but not the two this revision adds: S9.0 now consumes ComplexKahlerGeometry K3–K4 and RealAnalyticGeometry R3.2 directly.
**Witness:** `TauCetiRoadmap/SchubertGeometry/README.md:550` and `:554` are new `### From TauCetiRoadmap.ComplexKahlerGeometry` / `.RealAnalyticGeometry` contracts; the base README names neither (0 occurrences; only “CK/RAG” as inputs of ComplexComparisonPartII, base line 26).
**Repair:** Add after that sentence: “ComplexKahlerGeometry K3–K4 (holomorphic germs, Weierstrass division, local analytic sets) and RealAnalyticGeometry R3.2 (coherent module sheaves, Cartan A/B on Stein manifolds) become direct suppliers of S9.0; they were formerly reached only through ComplexComparisonPartII.”

## R02 (P3) — Two comparisons removed from S9 are not stated

**Location:** PR description, first prose paragraph: “S9.2–S9.4's holomorphic Lefschetz and word-character comparisons leave this roadmap's scope … IndexTheory ceases to be a supplier here.”
**Claim:** S9.2–S9.4 are not the only S9 content removed: the smooth-carrier comparison with FormalConnectionsOpers F2.4 is gone, and S9.5's comparison with the type-A `RationalPath`/tableau carriers is now owned by TensorProductCombinatorics §8.3.
**Witness:** Base README line 111 (“Construct the downstream smooth-carrier comparison with FormalConnectionsOpers F2.4”) and line 117 (“construct the comparison with TPC H8's `RationalPath`”); head README has 0 occurrences of FormalConnectionsOpers, and `README.md:2060` assigns the comparison to TensorProductCombinatorics §8.3.
**Repair:** Add to that paragraph: “The S9.1 smooth-carrier comparison with FormalConnectionsOpers F2.4 is removed, and FormalConnectionsOpers is no longer named; S9.0 keeps only the holomorphic charts of smooth schemes. S9.5 keeps the type-A specialization of S4.1–5; its comparison with the coordinate-path and tableau carriers is owned by TensorProductCombinatorics §8.3.”

## Previous findings

- R01 — repaired: “S3.1 constructs algebraic equivariant lines … S9.8 analytifies those lines. GeometricQuantization §§3.3–3.4 owns the ordinary holomorphic Picard and compact forgetful-map calculations and consumes S9.1/S9.7; it supplies no premise to this roadmap.”
- R02 — repaired: “This revises the existing SchubertGeometry roadmap, expanding and restructuring all nine layers … 2237 insertions and 179 deletions”; the eight removed declarations are named; S9.2–S9.4 stated as leaving for Part II.
- R03 — repaired for the three dropped suppliers: “AlgebraicModuliForArithmeticGeometry, ShimuraData and ComplexComparisonPartII cease to be suppliers … Sheaf operations formerly cited through AlgebraicVectorBundles are consumed directly from pinned Tau Ceti.” The added suppliers are R01 of this report.
- R04 — repaired: “S3.6 gives the worked A₂ character calculation for highest weight 2ω₁+5ω₂: word 121 has stage dimensions 1, 6, 33, 81 and word 212 has 1, 3, 21, 81”.
- R05 — repaired: “S4.4 retains the characteristic-zero adjoint SL₃ comparison”; no fifteen-dimensional contraction-kernel claim remains.
- R06 — repaired: “LieGroups Layer 8 supplies compact full and partial flags. The orbit calculation here classifies fixed-plane stabilizer orbits on a Grassmannian by intersection dimension”; no thirteen-orbit claim remains.

## Verified sound

| Statement or claim | Instance | Computed on one side | Computed on the other / head value | Result; change |
|---|---|---|---|---|
| Description, S3.6 stage dimensions | GL₃ lift (7,5,0), χ₀=e^(0,5,7), Δ_i strings | Δ₁: m=−5, 6 terms; then Δ₂ at (j,5−j,7): j+3 terms, Σ=33; dim V(2,5)=3·6·9/2=81 | Other word: Δ₂: m=−2, 3 terms; then Δ₁: 6+7+8=21; README:1118 states 1,6,33,81 and 1,3,21,81 | Equal; description correct |
| Description, word ii image | Rank one, Q=(i,i) | Ordinary product s·s=e, length 0 | Demazure product s, image ℙ¹=X(s_i), dimension 1; README:866 | Equal; description correct |
| Description, S4.4 adjoint comparison | sl₃, characteristic 0 | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂; [E₁₂,H₂]=E₁₂ | Three lines kH₁, kH₂, k(H₁+H₂) in a 2-dimensional space; README:1250–1263 | Holds; description correct |
| Description, orbit example | n=3, k₀=1 | Admissible d: max(0,−1)=0 … 1, so 2 orbits | min(k₀,n−k₀)+1=2; README:1940–1958 | Equal; description correct |
| Description, line counts | Base → head | README +/− and Suggested.lean +/− sum to 2237/179 | Description: “2237 insertions and 179 deletions” | Equal |
| Supplier set; R01 | Base vs head “From” contracts | Base: 0 mentions of ComplexKahlerGeometry, RealAnalyticGeometry | Head: 2 new contract sections (lines 550, 554) | Unstated; R01 |
| S9 removals; R02 | Base S9 items 1 and 5 | Base: 2 mentions of FormalConnectionsOpers; `RationalPath` comparison in S9.5 | Head: 0 mentions; §8.3 of TensorProductCombinatorics on main owns the comparison (its README:2277) | Unstated; R02 |
| Removed/added declarations | `Suggested.lean` | 8 removed names in description | 8 removed, 5 added at head; 5 `sorry` warnings | Equal |

Rows for the folder's untouched statements stand as in the previous review, of `a9b73a3`.

- 0 changed folder lines since `a9b73a3`; none of the 15 seeded source targets falls in a changed passage; 0 source locators reopened.
- Title and every sentence of the description's prose and `roadmap-summary` block read against the head: 2 omissions (R01, R02), 0 sentences contradicted.
- 5 elaborated signatures compared with README S4.2–S4.4: 0 lost binders, 0 changed types.
- 3 cross-roadmap facts resolved on main: ComplexKahlerGeometry K3–K4, RealAnalyticGeometry R3.2 (its README:728), TensorProductCombinatorics §8.3 (its README:2277, 2580).
- Gate: every check 0, `OK`. Elaboration of `Suggested.lean`: exit 0, exactly 5 `sorry` warnings.
- Dependency check output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- 0 files changed outside the folder; overlap data lists 0 conflicting heads and 0 dropped cited ids.
- Remark (generated block, outside the text check): the `depends-on` block lists GeometricQuantization as an open supplier, while the prose and README:2062 make it a consumer only.

Overlap check: read KacMoody, TensorProductCombinatorics, RootSystems; the finite-root-datum path crystal is owned here (S4) and consumed by KacMoody; the type-A coordinate-path comparison is owned by TensorProductCombinatorics §8.3; root-system foundations by RootSystems and the pins.

Source independence: changed passages only; 0 roadmap passages changed, so 0 passages compared with 0 sources; shares and arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are settled as uncertified and cited by locator only; no changed passage cites them.

## Source issues

- **Error** in KnutsonBottSamelson at §4, proof of the subword result, p. 4 (lines 141–148): the source says the image-growth letters have the original word's product; it should be the Demazure product, which for ii is s rather than e; affects the proof.

## For the human reviewers

- none
