# Review of ClassicalAdicEtaleCohomology (pull request #875 at fc1c03a)

**Verdict:** needs changes

## R01 (P3) — The description's prose paragraph claims the sites and stops at Layer 5

**Location:** pull request description, the paragraph after the summary block: "This roadmap builds the classical étale cohomology of analytic adic spaces … : the analytic étale and pro-étale sites; Huber's henselian comparison … and the comparison with trait vanishing cycles."

**Claim:** The head does not build the analytic étale and pro-étale sites; it takes them from `AdicEtaleGeometry`. The list also ends at Layer 5, so it leaves out Layers 6–11: invariance, field extensions, proper supports, traces and duality, radial regions and boundary duality.

**Witness:** README line 9: "`AdicEtaleGeometry`, layers A1, A2 and A4, owns the analytic étale and pro-étale sites … Their geometric constructions are supplier interfaces, not additional targets here."

**Repair:** Replace the paragraph with: "This pull request adds the roadmap. On the analytic étale and pro-étale sites of `AdicEtaleGeometry` (A1, A2, A4) it builds module sheaves, pseudo-adic supports and strict-local cohomology (Layer 1); Huber's henselian comparison with the noetherian approximation of perfectoid affinoids it needs (Layer 2); overconvergent and Berkovich sheaves, `ℤ_p`, isogeny and `ℚ_p` local systems and de Jong's analytic covering spaces with their monodromy (Layer 3); formal specialisation, the adic generic-fibre comparison of nearby cycles and the Bloch–Kato–Hyodo filtrations on semistable formal schemes (Layer 4); nearby cycles over valuation rings of arbitrary rank with base change, tame quotients, Gauss extensions and the trait comparison, and their invariance and finiteness (Layers 5–6); geometric-field extension invariance (Layer 7); proper supports and the all-torsion calculus (Layer 8); normalized traces and Poincaré duality (Layer 9); radial regions and constructibility in smooth families (Layer 10); and the nonproper algebraic comparison, affine-space exhaustion and curve-boundary duality (Layer 11)."

## R02 (P3) — The supplier paragraph omits suppliers the README consumes

**Location:** pull request description, last paragraph: "Section-level suppliers: AdicSpacesPartII (R0–R1), … LefschetzPencilsAndVanishingCycles (LPV.0 §§0.2–0.8 and 0.8a, LPV.1–LPV.2), … DerivedModuleAlgebra (§§1.T.1 and 1.1–1.5, towers and completion)."

**Claim:** The list leaves out eight supplier roadmaps that the README cites, and it leaves out LPV.6. Six of the eight (AdicSpaces, AlgebraicCurves, JacobianChallenge, EllipticCurves, StableReduction, ProfiniteCohomology) appear nowhere in the description.

**Witness:** README 2565 `CrystallineCohomology` CR.5.1; 5674 `ResolutionOfSingularitiesCharacteristicZero` §5.6; 4128 `AlgebraicCurves` layer 12, `JacobianChallenge` layer B; 1828 `EllipticCurves` layer 4, `StableReduction` layers 1–3; 4804 `ProfiniteCohomology` Layer 9; 9 `AdicSpaces`; 2519 LPV §6.2.

**Repair:** Write "LefschetzPencilsAndVanishingCycles (LPV.0 §§0.2–0.8 and 0.8a, LPV.1–LPV.2, LPV.6 §6.2)", and append to the list: "CrystallineCohomology (CR.5.1 and CR.6.1, logarithmic differentials and log de Rham–Witt complexes), ResolutionOfSingularitiesCharacteristicZero (§5.6, embedded resolution for Section 11.1), and, on main, AdicSpaces, AlgebraicCurves (layer 12), JacobianChallenge (layer B), EllipticCurves (layer 4), StableReduction (layers 1–3) and ProfiniteCohomology (Layer 9)."

## R03 (P3) — The description says the README cites two roadmaps it never names

**Location:** pull request description, last sentence: "EtaleDualityAndPerverseSheaves (EDC.0–EDC.3), AdicCoefficientsAndComparisons (L2) and DiamondEtaleCohomology (C0–C1) are cited by name as consumers or later roadmaps, not as prerequisites."

**Claim:** The README does not name `EtaleDualityAndPerverseSheaves` or `AdicCoefficientsAndComparisons` anywhere. The sentence also leaves out the consumers the README does name.

**Witness:** README at fc1c03a has 0 occurrences of either name. `DiamondEtaleCohomology` appears at 3939 (C1) and 3969 (C0). Lines 5831–5833 name `DiamondSixOperations`, `GeneralBasesFourierAndCorrespondences` and `TropicalAndBerkovichArithmetic` as consumers.

**Repair:** "`DiamondEtaleCohomology` (C0–C1), `DiamondSixOperations`, `GeneralBasesFourierAndCorrespondences` and `TropicalAndBerkovichArithmetic` are cited by name as consumers, not as prerequisites."

## Previous findings

- none: the review of fc1c03a raised no finding of its own. The R01 and R02 it accounted for were findings of the review of bc065d8, repaired at fc1c03a, and the folder has not changed since (0 lines).

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Summary: rank-one stalks miss sheaves (README 1.1, Conventions) | closed disc over `K`, `U = {\|T\| ≤ \|ϖ\|}`, `Q = j_*Λ/j_!Λ`, `Λ ≠ 0` | `Q_y = 0` at every rank-one `y` (in `U` or off `Ū`); `Q_{x′} = Λ` at the rank-two frontier point | claim holds |
| Summary: plus-ring unit vs `O_C` unit (Conventions) | `C` with residue field `k = ℚ̄_ℓ`, `C⁺` = preimage of `O_k` | `\|ℓ\| = 1`, so `ℓ ∈ O_C^×`; `ℓ̄ ∈ 𝔪_k`, so `ℓ ∉ (C⁺)^×`; rank-one exponent `p = 1` | "unit in `O⁺`" strictly stronger, as stated |
| 3.2 overconvergence (description: overconvergent sheaves) | constant `Λ`; `j_!Λ`, `U` as above; `X = Spa(K, O_K)` | `Λ → Λ` identity; `(j_!Λ)_{x′} = 0 → Λ`, not iso; one point, every specialisation iso | Checks discriminate |
| 5.5 variation (description: trait comparison) | scalars `2, 3` on `ℚ`; `u = [[1,1],[0,1]]`, `v = [[1,0],[1,1]]` | `Var(6) = 5 = 1+2+1·2`, additive form gives `3`; `uv−1 = [[1,1],[1,0]]`, product term `[[1,0],[0,0]]`, reversed `[[0,0],[0,1]]` | formula and order correct |
| 9.6 top trace, every rank (summary: Poincaré duality) | `S = Spa(C, C⁺)` rank two, `X = B_S`; `X = B_S ⊔ B_S`; `n` a unit in `C⁺` | fibres `H²_c = ℤ/n`, specialisations iso, trace iso; disjoint union `(ℤ/n)² → ℤ/n` sum map, not iso | connectedness needed and stated |
| 11.3 frontier (summary: frontier contributions) | `U = X`; annulus `\|a\| ≤ \|T\| ≤ \|b\|`, `0 < \|a\| ≤ \|b\| < 1`; `\|b\| = 1` | frontier `∅`, `α_X` iso; `{η(a), η(b)′}`, 2 points; `{η(a)}`, 1 point | agrees with its Checks |
| `zariskiRiemannLocus` (description: real-bodied definitions) | `E = F = ∅`; `E = K`; `1 ∈ F` | all of `Spv K`; `{trivial valuation}`, one point; `vlt 1 1` false, `∅` | real body, determines the locus |
| `field_cohomological_dimension_transcendence` (summary: cd bound) | `K = 𝔽_q, L = 𝔽_q(t), ℓ ≠ p`; `K = 𝔽̄_p, L = K(t), ℓ = p`; `K = ℝ, ℓ = 2` | `2 ≤ 1+1`; `1 ≤ 0+1`; right side `⊤` | holds, sharp in the first two |

The rows for statements the description does not touch stand as in the review of fc1c03a.

- **Gate and direction.** Gate at fc1c03a: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run, which includes the build, has `build=0`. `--movable` depcheck: `depcheck: 245 roadmaps, 2218 edges, 0 problem(s)`, with no UPWARD or CYCLE line. No change outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean` (6 s) gives exactly four `sorry` warnings, at lines 78, 96, 114 and 125. `#check @` on all 5 declarations, in a scratch copy: every binder is kept (`IsSepClosed`, `IsAddTorsion G`, `0 < n`, `IsNontrivial`, `IsAlgClosed (FractionRing V)`, `Module.Flat`, `Nat.Prime ℓ`). Nothing changed.
- **Pull request text.** Checked against the head: the title, the 3 summary paragraphs, the 2 prose paragraphs and the supplier paragraph (16 sentences). The README cites every section in the 14 supplier entries (A0 at 3919, 3971 and 5723; P4 is cited nowhere and the description leaves it out); 3 sentences are wrong (R01–R03). The seeded sample (1.5 … 10.1) falls in no changed passage.
- **Overlap check:** read GaloisActionOnEtaleCohomology, EtaleCohomologyFoundations and DiamondEtaleCohomology (open) and AdicEtaleGeometry (main). The analytic sites belong to AdicEtaleGeometry A1 and are cited here; scheme constructible sheaves belong to EtaleCohomologyFoundations; the cover action belongs to GaloisActionOnEtaleCohomology §1.1, which cites §§1.1 and 1.3 here. Nothing is owned twice.
- **Source independence:** changed passages only. 0 folder lines changed, so 0 passages were compared with 0 sources. Largest share: Huber (1996), about 178 of 1052 parenthesised locators. The contents were not re-compared, because no layer was added, removed or reordered.
- **Citations resolved.** The suppliers are on main (AdicSpaces, LocalFieldsRamification and LocalGaloisGroups under `Completed/`), or earlier in the merge order: CrystallineCohomology 25, ArithmeticGaloisRepresentations 58, ArithmeticGaloisDuality 62, LefschetzPencilsAndVanishingCycles 70, this roadmap 76.
- **Remark (untouched text).** README 5831, and the summary's "Why Tau Ceti wants it", name `DiamondsAndVStacks` as a consumer. On main it is a supplier here (D0–D1, merge order 21) and cites this roadmap only in a cross-reference at its line 8149.
- **Remark (untouched text).** README 38 and 2519 give LPV §0.8a as "Nearby-cycle and inertia comparison" and §2.8 as "complex Milnor fibres". At LPV's head they are "Nearby-cycle and Betti comparison" (its line 694) and "The Picard–Lefschetz formula for a proper family" (its line 2197).

## Not verifiable

- Huber (1996), the book: paywalled, and no local text. Its locators (including Theorem 5.4.3 at 4350 and 4370) are cited by locator alone, as in the previous review.
- Berkovich 1990 (Section 3.7) and Prestel 1986 (Section 9.2): no legal text.

## Source issues

- none

## For the human reviewers

- **Not tested:** Huber (1996), the source with the largest share of locators (about 178 of 1052), is paywalled with no local text. The roadmap's wording and its arrangement were not compared against it in this round (0 changed passages).
