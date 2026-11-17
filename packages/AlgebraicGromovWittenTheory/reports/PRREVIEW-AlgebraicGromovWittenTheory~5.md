# Review of AlgebraicGromovWittenTheory (pull request #1998 at cb8f1b1)

**Verdict:** needs changes

## R01 (P3) — The third Check of §1.2 became an instruction naming a Lean declaration

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:307`: "Use `NovikovSeries.rescaleContinuousAlgEquiv` for a positive rescaling of the ample degree."

**Claim:** The bullet under `**Checks.**` computes nothing and names a Lean counterpart; a Check is a computed test in prose. It replaced the former third Check, so §1.2 has two Checks. The supplier contract (lines 160–162) already cites the declaration.

**Witness:** `TauCeti/RingTheory/NovikovSeries/Equiv.lean:192` `rescaleContinuousAlgEquiv : NovikovSeries R H N ≃A[A] NovikovSeries R H (c • N)`; `:196` `coeff_rescaleContinuousAlgEquiv`: coefficients are unchanged.

**Repair:** Replace line 307 by: "On `ℙ¹`, passing from `A=𝒪(1)` to `A=𝒪(2)` doubles every period and keeps every coefficient: `Σ aₙQⁿ` goes to `Σ aₙQⁿ`, and the truncation at period `B` becomes the truncation at period `2B`. A comparison that rescaled exponents would send `Q` to `Q²`." (Computed: `ω_{𝒪(2)}(n) = 2n`; periods at most 3 for `𝒪(2)` are `n = 0, 1`, the periods at most `3/2` for `𝒪(1)`, as in the third Check of §1.1.)

## Previous findings

- R01 — repaired: line 252 "MotivesAndAlgebraicCycles §§0.5, 3.1 and VirtualFundamentalClass §§2.2, 2.5"; lines 538–539 and 555 name EnhancedDerivedSheaves, DerivedModuleAlgebra and AlgebraicVectorBundles; Layer 4 Dependencies at lines 623–624.
- R02 — repaired: lines 157–163 cite `NovikovSeries.mapRingHom`, `continuous_mapRingHom`, `rescaleContinuousAlgEquiv`, `gradeBy`, `gradeBy.gradedMonoid`; line 941 uses the ring map in §8.1. The repair turned a Check of §1.2 into an instruction (R01 above).
- R03 — repaired: §§1.1, 2.3, 3.4, 3.5, 4.1, 4.3, 5.4, 9.4 and 10.3 each list three Checks (lines 284–286, 404–406, 479–481, 504–506, 543–545, 581–583, 720–722, 1104–1106, 1187–1189).

## Verified sound

| Statement | Instances | Roadmap side | Independent value | Result |
|---|---|---|---|---|
| Contract: field-extension map (157–160), §8.1 | quadric over `ℚ`, `K = ℚ(√disc)` | `mapRingHom`, period scale one | `Functoriality.lean:184`: needs `φ : H →+ H'`, `N'(φ h) = c·N h`; `ω_A(res β) = A_K·β`, `c = 1`; `Q^(1,0), Q^(0,1) ↦ s` | true |
| Contract: rescaling (160–162), §1.2 Check 3 | `ℙ¹`, `𝒪(1)` to `𝒪(2)` | "Use … for a positive rescaling" | `Equiv.lean:192, 196`: target period `c • N`, coefficients fixed; `c = 2` | contract true; Check is not a test (R01) |
| Contract: grading (162–163), §8.4 | `ℙ¹`; `ℙ²` | degree `β ↦ 2c₁(T_X)·β` | `Grading.lean:92, 165`: `f : H →+ ι`, `ι = ℤ`; `Q ↦ 4` on `ℙ¹`, `6` on `ℙ²`; `Q^βQ^γ` has degree the sum | true |
| §1.1 Check 3 | `ℙ¹`, `A = 𝒪(2)` | classes `0, 1` have period at most three | `2β ≤ 3 ⇔ β ∈ {0, 1}` | true |
| §2.3 Checks 2, 3 | genus one with marked rational tail; chain `12 \| ∅ \| 34` | `(1,1)` marked at the node; point `12\|34` | tail has 2 special points, contracted; `2·1−2+0 = 0` unstable; middle has 2 nodes, contracted | true |
| §3.4 Checks 2, 3 | `β = 0`; `MbarMap 0 3 ℙ¹ 1` | projections; birational onto `(ℙ¹)³` | `vdim = (1)(1−3)+3+2 = 3`; three distinct targets fix the isomorphism and marks; `Mbar 0 3` is a point | true |
| §3.5 Checks 2, 3 | `12\|34`; two elliptic tails | degree one; degree two | `X ×_X X = X → Mbar 0 4 × X`; `Mbar 1 1 × Mbar 1 1 → Δ₁` is the quotient by the swap | true |
| §4.1 Check 3 | genus two, constant, target a curve | ranks 1, 2; virtual rank `−1` | `h⁰(𝒪) = 1`, `h¹(𝒪) = 2`; `d(1−g)+0 = 1·(−1)` | true |
| §4.3 Checks 2, 3 | `(0,0)`, `ℙ²`, line class; `c₁ = 0` threefold | 2, fundamental class; 0, stack of dimension 6 | `(1)(2−3)+0+3 = 2`, `H¹(𝒪(1)) = 0`; `(1−g)·0+0+0 = 0`; `3+3 = 6` | true |
| §5.4 Check 3 | elliptic target `(1,1,0)`, point | `−λ₁`, codimension 1, degree `−1/24` | pushforward of `ev^*pt ∩ (−λ₁ ∩ [Mbar 1 1 × E])`; `c+d(g−1) = 1`; `∫λ₁ = 1/24` | true |
| §9.4 Checks 2, 3 | `ℙ¹`; unit axis | `−z⁻¹[[0,Q],[1,0]]`; `exp(−t⁰/z)·id` | `z∂S+T⋆S = 0`, `S(0) = id`: linear term `−z⁻¹(H⋆)`; `H⋆1 = H`, `H⋆H = Q`; `T₀⋆ = id` | true |
| §10.3 Checks 2, 3 | `ℙ¹`; `ℙ¹×ℙ¹` | `z⁻¹Q·1`; both orders `z⁻²Q₁h₂` | `δ_H(H) = 0`, `H⋆H = Q`; `∇_{h₁}(z⁻¹h₁h₂) = z⁻²Q₁h₂`; `∇_{h₂}(z⁻¹Q₁) = 0+z⁻²Q₁h₂` | true |
| §4.1, §4.2 *Needs*; Layers 0, 4 Dependencies | suppliers against contracts | lines 538–539, 555, 252, 623–624 | every supplier of lines 176–187 used by Layers 0 and 4 is named in a *Needs:* or Dependencies line | true |

The rows for untouched statements stand as in the previous review, of `2457b2a`.

- Source locators: the diff adds or changes no source locator; the seeded sample's sections that the diff touches (§§1.2, 3.4, 4.3) changed only in their Checks, recomputed above.
- Library declarations opened at the pin: 6 — `TauCeti/RingTheory/NovikovSeries/Functoriality.lean:184` (`mapRingHom`), `:302` (`continuous_mapRingHom`), `Equiv.lean:192` (`rescaleContinuousAlgEquiv`), `:196`, `Grading.lean:92` (`gradeBy`), `:165` (`gradeBy.gradedMonoid`); all in namespace `TauCeti.NovikovSeries`.
- Cross-roadmap citations in the changed lines resolved: 6, all present — on main AlgebraicVectorBundles L1A–L2B (label table at its lines 346–369), DerivedModuleAlgebra §§0.4, 0.25, EnhancedDerivedSheaves §0.3, E1.8; at open heads MotivesAndAlgebraicCycles §§0.5, 3.1 and VirtualFundamentalClass §§2.2, 2.5, 7.3.
- Gate: the worker's gate at cb8f1b1 passes every check, the build included. Dependency check with the merge order: `depcheck: 250 roadmaps, 2584 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicGromovWittenTheory/Suggested.lean` exits 0 with no output; the file is unchanged and declares nothing, so the `#check` comparison and the one-tactic probe do not apply.
- Pull-request text: the title and description agree with this head; the change adds no supplier, section or declaration that they would have to state.
- Overlap check: read GromovWittenTheory, StableReduction, AnalyticStableMaps, VirtualFundamentalClass, VirtualFundamentalClassPartII, MotivicStructuresInModuliOfCurves, StableReductionPartII; nothing shared (as in the previous review; the diff adds no object).
- Source independence: changed passages only; 15 added Check bullets and the supplier paragraph compared with 3 sources (behrend-1997, fulton-pandharipande-1997, iritani-2008), none shared; largest share iritani-2008, 10 of 52 locators; no layer added, removed or reordered, so the arrangement was not compared again.
- Research link: the headline targets are the stable-map virtual class of Behrend 1997 and Behrend–Fantechi 1997, the axioms, splitting and WDVV of Kontsevich–Manin 1994 and 1998, and the quantum `D`-module of Iritani 2008 on which mirror-symmetry statements are built; rests on the README's Summary and References.

## Not verifiable

- Fulton, *Intersection Theory*: not open access; cited in References without a locator.
- Dubrovin 1996 and Behrend–Fantechi: cited in References without a locator, so nothing to check.

## Source issues

- none

## For the human reviewers

- **Licence.** `kock-psi-notes` is an unpublished set of notes read from the author's page (cited in README §§5.1, 6.1–6.2, 6.5); the general-target statements it supports are also cited to Kontsevich–Manin 1998.
- **Licence.** The description discloses that the roadmap and its text were drafted with OpenAI Codex under the author's direction.
