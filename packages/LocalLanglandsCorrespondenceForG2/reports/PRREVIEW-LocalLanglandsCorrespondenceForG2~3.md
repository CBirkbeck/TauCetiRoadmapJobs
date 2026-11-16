# Review of LocalLanglandsCorrespondenceForG2 (pull request #2458 at 038ac84)

**Verdict:** accepted

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: line 1214 now reads "hence X ⊂ Irr♠ ∪ Irr♣, and all σ ∈ X have the same SpinLift parameter (φ_τ ⊗ χ) ⊕ (φ_τ ⊗ χ)∨ and the same L_w". SpinLift is defined on Irr♠ ∪ Irr♣ at line 1090 (§9.1).

## Verified sound

| Statement | Instances tried | One side | Other side | Result |
| --- | --- | --- | --- | --- |
| §10.7 conclusion (changed) | φ_τ = ρ ⊠ S₂ of the new Check; X = X_τ ⊗ χ ∘ sim | PGO₆ members: datum τ ⊗ χ ∘ det; PGO₅,₁ members: JL⁻¹(τ) ⊗ χ ∘ Nrd, which transfers to τ ⊗ χ ∘ det | §9.1 gives both 2(ρχ ⊠ S₂) = (φ_τ ⊗ χ) ⊕ (φ_τ ⊗ χ)∨ | holds |
| §10.7, χ not unique | χ and χχ_E (same packet: τ ⊗ χ_E ∘ det ≅ τ) | Ind θ ⊗ χ_E = Ind(θ · χ_E ∘ N) = Ind θ, so ρχ_E ≅ ρ | 2(ρχ ⊠ S₂) = 2(ρχχ_E ⊠ S₂) | the stated parameter does not depend on the choice of χ |
| New Check, Λ² | ρ = Ind θ, θθ^c = χ_E ∘ N = 1 | ρ ⊗ ρ = Ind θ² ⊕ Ind(θθ^c) = Ind θ² ⊕ 1 ⊕ χ_E; Λ²ρ = det ρ = χ_E · θ\|F× = 1 | Λ²(ρ ⊠ S₂) = S₃ ⊕ Sym²ρ = S₃ ⊕ χ_E ⊕ Ind θ², dimensions 3 + 1 + 2 = 6 | the Check's φ♭ is correct |
| New Check, discreteness | θ⁴ ≠ 1 | θ^c = θ⁻¹, so Ind θ² is irreducible iff θ⁴ ≠ 1; θ²\|F× = 1, so it is orthogonal with det χ_E | 1, χ_E, Ind θ², S₃ are pairwise distinct and orthogonal; det φ♭ = χ_E² = 1 | discrete in SO₇ |
| New Check, the hypothesis θ⁴ ≠ 1 (negative control) | θ⁴ = 1, θ² ≠ 1 | Ind θ² = μ ⊕ μχ_E with μ ∘ N = θ²; when μ² = 1, χ = μ ∉ {1, χ_E} | ρμ ≅ ρ, so φ_τ ⊗ μ ≅ φ_τ | the hypothesis is needed and stated |
| New Check, existence | p odd; p = 2 | \|F×/F×²\| = 4, resp. 8, so some quadratic χ ∉ {1, χ_E} exists | θ: extend χ_E to E× and multiply by a character of E×/F× ≅ E¹ of order > 4 | the example is in scope |
| New Check, separation | χ ∉ {1, χ_E} | Hom(ρχ, ρ) = Hom(χ, 1 ⊕ χ_E ⊕ Ind θ²) = 0 | 2(ρ ⊠ S₂) ≇ 2(ρχ ⊠ S₂), with equal Λ² since χ² = 1 | holds |
| §9.1 (sample; now cited by §10.7) | Irr♠ ∪ Irr♣ branch | GS §12.3(b), p. 35 (GS lines 1490–1500): isobaric sum with parameter φ_τ ⊕ φ_τ∨ | README line 1090: parameter φ_τ ⊕ φ_τ∨, τ up to duality | locator and statement agree |
| §10.8 (sample; cites §10.7) | the Siegel-Levi tempered induction | consumes "one weak class on each lower-tower discrete packet" from §10.7 | the change rewords that conclusion without changing its content | unaffected |

The rows for the untouched statements stand as they were in the previous review, of 10f3592.

- Source locators checked against the text: 2. GS Theorem 12.7(ii) and proof, p. 39 (lines 1631–1647; line 1647 leaves the lower-tower case to the reader), and GS §12.3(b), p. 35 (lines 1479–1500).
- Cross-roadmap citations of §10.7 resolved at the open heads: 6, none missing.
  - ModularityAndLanglandsExtensions §3.19 (line 2089) and §3.15 (line 2023).
  - EndoscopicTransferAndUnitaryTraceComparison §4.7a (line 1873) and §10.30 (line 4209).
  - MetaplecticAutomorphicForms §3.34 (line 1027) and §3.42 (line 1117).
- Gate at 038ac84: every check passes. Dependency check: `depcheck: 264 roadmaps, 2584 edges, 0 problem(s)`. Nothing is changed outside the folder.
- `Suggested.lean` has not changed since 8d99a61. `lake env lean` gives three `declaration uses sorry` warnings (lines 124, 143, 158) and no error. The previous `#check @` comparison and one-tactic probe still hold.
- Pull request text checked against 038ac84: no sentence is contradicted. The change adds or removes no section, headline, declaration, locator or supplier.
- D01: `design/plan.json` `gaps` still has 27 slugs and the README has 28. `pgsp6-lower-tower-xu-packets` is still the missing one.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups and SpinRepresentations (scopes as in the previous review). The change adds no shared object. The lower-tower Xu packets are still owned by ModularityAndLanglandsExtensions §3.19 through the contract. Nothing else is shared beyond what the previous review recorded.

Source independence: changed passages only. 2 passages (lines 1214 and 1218) were compared with 6 sources (GS, HD, CG, C, GF, HKT). The longest shared run is 3 words ("to the reader", GS line 1647). None of the sources contains the new dihedral example. The largest share is still GS, as in the previous review, and the change adds no locator. No layer was added, removed or reordered, so the contents comparison with GS stands: independent.

## Not verifiable

- Griess, Theorem 1 (§0.0 and `griess_conjugacy`): the manifest records it as uncertified (paywalled), so the text was not read. The change does not touch it.
- SpV, Theorems 1.7.1, 1.8.1 and §1.5 (§1.1(i)–(iii)): the manifest records it as uncertified (Springer monograph), so the text was not read. The change does not touch it.

## Source issues

- **Gap** in GS at proof of Theorem 12.7(ii), p. 39: the source says the case of fibres inside the lower-tower loci follows along similar lines and leaves it to the reader; it should be argued separately, since members of Irr♠ have zero lift to split PGSO₈; affects the proof.

## For the human reviewers

- Griess (Theorem 1) and SpV (Theorems 1.7.1, 1.8.1) are cited by locator only (manifest: uncertified). `griess_conjugacy` (`Suggested.lean` line 124) and §1.1(i) rest on texts this review did not read.
