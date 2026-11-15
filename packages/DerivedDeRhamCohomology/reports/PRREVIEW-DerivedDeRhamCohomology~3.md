# Review of DerivedDeRhamCohomology (pull request #868 at 38e20bf)

**Verdict:** needs changes

## R01 (P3) — Restore the correct Roby page numbers

**Location:** `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:2053`: “Proposition IV.8, pp.271, 283”.
**Claim:** The revised pages locate Theorem IV.2 and Proposition IV.8. The previous review requested this change incorrectly.
**Witness:** Roby line 2222 follows the page break at line 2190; line 2648 follows the break at line 2626. PDF pages 61 and 73 visibly print 272 and 284, respectively.
**Repair:** Restore “Theorem IV.2 and Proposition IV.8, pp.272, 284”. The statements themselves support the descent argument.

## R02 (P3) — The description claims work owned by other roadmaps

**Location:** PR description, first paragraph after `<!-- /roadmap-summary -->`: “the cotangent complex of a ring map from simplicial polynomial resolutions”; “the derived de Rham to crystalline comparison”; “derived de Rham–Witt theory with the Nygaard filtration”.
**Claim:** This paragraph presents supplier-owned module theory and downstream crystalline/Witt results as constructions of this PR.
**Witness:** `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:104` assigns cotangent, powers, limits and completion to DerivedModuleAlgebra; line 108 assigns crystalline/Witt/logarithmic applications to CrystallineCohomology. The latter's #857 README, §CR.DDR.4.1 at line 2235, owns the comparison map.
**Repair:** Replace that scope paragraph with: “This PR adds the DerivedDeRhamCohomology roadmap: André–Quillen criteria, filtered derived categories, PD foundations, ordinary and derived de Rham cohomology, Cartier theory, quasisyntomic descent, proper smooth control, period descriptions and shared logarithmic constructors. It imports cotangent complexes, integral derived powers, module limits, completion and complete flatness from DerivedModuleAlgebra. CrystallineCohomology consumes these constructions for crystalline comparisons, derived de Rham–Witt theory and general logarithmic applications.”

## R03 (P3) — The description points readers to a consumer list that is absent

**Location:** PR description, Dependencies paragraph: “consumers of this roadmap are listed in the merge-order block, not here.”
**Claim:** The merge-order block lists downstream consumers.
**Witness:** The `merge-order` block contains only #816 → #940 → #868. The README's downstream consumer CrystallineCohomology (#857) appears in the final Dependency contract paragraph, outside that block.
**Repair:** Replace the sentence with: “The merge-order block lists the open supplier chain; downstream consumers are described in the final dependency contract and the README's Downstream consumers section.”

## Previous findings

- R01 — not repaired: README:2053 follows the requested “pp.271, 283”, but the previous review misread page breaks; the scanned statements are on pp.272, 284. This report corrects that review's erroneous request.
- R02 — repaired: README:32 cites CrystallineCohomology's “Crystalline cup products” by title; the three stale declaration names have been deleted.
- R03 — repaired: README:383 gives StacksCt pp.29–30; README:4235 gives Bhatt12 pp.32–33; README:5435 locates Remark 8.7 on p.33.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Summary: derived cup product | Point site over ℤ, degree-zero inputs 2, 3 | Cup product = 2·3 = 6; reversed product = 3·2 = 6. | Holds | Consumer name repaired |
| 0.20: lci amplitude | k → k[t]; k → k[ε]/ε², char k = 2 | Smooth: L = B·dt in degree 0; dual numbers: L = [B →₀ B], degrees −1,0; both perfect and lci. | Holds | Page range repaired |
| PD.5: base compatibility | ℤ_(2) → ℤ/4, I = J = (2); zero base ideal | Canonical powers: γ₂(2) = δ₂(2) = 2; square-zero powers: 2 ≠ 0, incompatible. I = 0: γ̄ = δ. | Holds | Equivalent wording |
| PD.5: augmentation powers and Roby descent | Free rank two over ℤ; M = ℤ/2 | Γ²(ℤ²) = ℤ³; Γ²(ℤ/2) = ℤ/4, with dp₁(1)² = 2dp₂(1) ≠ 0. | Mathematics holds | R01: restore pages |
| PD.5: second-order thickening | A = ℤ, q(z,z′) = zz′; A = 𝔽₂, q((a,b),(c,d)) = ad | ℤ: ε² = 2η = 2δ₂(ε). 𝔽₂: δ₂(e₁+e₂) = η = δ₂(e₁)+e₁e₂+δ₂(e₂). δ₁ = identity. | Holds | Equivalent wording |
| PD.6: PD pushouts | Opposing PD structures on ℤ/4 over (ℤ,0); zero-ideal legs | Underlying tensor = ℤ/4; PD pushout = 𝔽₂; residue tensor = 𝔽₂; image ideal = 0. Zero-ideal case: pushout = ordinary tensor. | Holds | Equivalent wording |
| PD.6: exact base change (1) | B = ℤ_(p)[t], I = (p), J = (p,t), B′ = B[y] | Tor₁ = 0; both envelopes after base change = ℤ_(p)⟨t⟩[y]; comparison sends t^[n] to t^[n]. | Holds | Hypotheses preserved |
| PD.6: exact base change (2) | (B,I) = (ℤ/4,(2)), canonical powers; (B′,I′) = (𝔽₂,0); J = I | Residue map = id_𝔽₂, flat; J′ = 0; left side = ℤ/4 ⊗ 𝔽₂ = 𝔽₂ = right side. | Holds | Hypotheses preserved |
| 4.6 and References: completed torsion sum | n = 2m; coordinates p^m versus p^(2m−1) in ℤ_p/p^(2m) | First coordinates have orders p^m, unbounded; second coordinates satisfy p·p^(2m−1) = 0. First sequence tends to zero p-adically. | Holds | Page repaired |

Untouched mathematical rows and padding checks stand as in the previous review of e0b83c0.

- Sources: 16 distinct locators checked across six texts; seeded target 0.20 is the only seeded target changed, at StacksCt line 1303, printed p.29.
- PD locators: Roby lines 2222, 2648 and both page images; StacksCryst lines 167, 213, 292, 325; StacksPD lines 242, 254, 270.
- Remaining changed citations: StacksSites lines 3451, 3517, 3529; Bhatt12 lines 1548, 1571, 1598; corrected torsion example recomputed.
- Five pinned declarations opened: Mathlib/RingTheory/DividedPowers/DPMorphism.lean:62,246; Basic.lean:241; SubDPIdeal.lean:152; Mathlib/RingTheory/Flat/EquationalCriterion.lean:177.
- Two affected cross-roadmap targets resolved: DerivedModuleAlgebra §0.DP.3 on main and CrystallineCohomology “Crystalline cup products” (#857, README:3000); changed PD objects remain owned here.
- Gate: all scanners pass; targeted build and direct `lake env lean` pass, each with eight `sorry` warnings only; no changes outside the roadmap folder.
- Dependency output: `depcheck: 245 roadmaps, 2211 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- All 11 `#check @name` signatures elaborated and compared with the README; no dropped hypotheses or signature changes; eight headline theorems remain.

Overlap check: read CrystallineCohomology, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIV, AInfCohomology, DerivedModuleAlgebra, EnhancedDerivedSheaves and PerfectoidSpaces; changed PD compatibility, thickenings, pushouts and envelope base change belong here; augmentation belongs to DerivedModuleAlgebra; crystalline cup products belong to CrystallineCohomology; the other scopes add no competing owner of the changed PD objects.

Source independence: changed passages only; nine passages compared with six sources, no copied expression or reused material identified; largest share among the 16 rechecked locators: StacksCryst, 4/16. No layer was added, removed or reordered, so arrangement was not re-reviewed.

## Not verifiable

- none in the changed passages.

## Source issues

- **Misprint** in Bhatt12 at Corollary 8.6, printed page 32: the source names W(A) as the Witt summand for perfect A₀; it should be W(A₀), as its proof states; affects a stated result.
- **Error** in Bhatt12 at Remark 8.7, printed page 33: the source calls the coordinates p^(n−1) a non-torsion element; it should use p^⌊n/2⌋, since multiplication by p kills the printed element; affects a stated result.
- **Misprint** in StacksCryst at Lemma 60.2.7, printed page 5: the proof attributes generation of J′/I′ by the images of f_t to assumption (1); it should cite assumption (2), J′ = JB′ + I′; affects the proof.

## For the human reviewers

- none.
