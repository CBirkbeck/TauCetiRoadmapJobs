# Review of GaloisActionOnEtaleCohomology (pull request #2271 at 97717c2)

**Verdict:** accepted

No findings. This is an incremental re-review of the 8 lines added since `1947660`: the section `## Existing formalizations outside Tau Ceti` of `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md` (lines 574–580). No statement, layer, supplier or Lean declaration changed.

## Previous findings

- The previous review, of `1947660`, had no findings; nothing to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.3 (f) and its scheme form (§1.4), cited by the new text as `Stacks.EtaleCohomology.algebraClosureCohomologyIso`, "for `k̄₁ = k̄₂` the operator `ρ(σ)⁻¹`" | `σ : k̄₁ ≃ₐ[k] k̄₂`; `k̄₁ = k̄₂` | Declared type is `RΓ(Y_{k̄₂}) ≅ RΓ(Y_{k̄₁})`, transport along `e = id_Y × Spec σ : Y_{k̄₂} → Y_{k̄₁}`, so `(e⁻¹)^*`; (f) with `τ = σ` pulls back along `id × Spec(σ⁻¹)`: same map; equal closures give `(σ⁻¹)_X^* = ρ(σ)⁻¹` | agrees, direction included | none |
| §2.6 Frobenius normalisation, cited for `Weil.rationalFrobenius` | `X` proper over `𝔽_q`; `H²(ℙ¹)` | Weil's Frobenius is Stacks' `geometricFrobeniusBaseChange` = `π_X × id` (`pullback.lift (fst ≫ π_X) snd`), `frobeniusOver` = `geometricFrobenius`; §2.6 makes this `ρ(φ)⁻¹`; on `ℤ_ℓ(−1)`: `q` against `ρ(φ) = q⁻¹` | agrees with §2.6 and its Checks | none |
| Conventions, stalk rule (Tag 03QW), cited for `galoisTransport` and `galoisStalkAction` | `F = μ_n`; composition of two automorphisms | `galoisTransport`: germ at `(U, u)` to germ at `(U, u ∘ Spec σ)` (stacks03N1 line 3969); `galoisStalkAction_mul`: `(σ * τ) = τ ≫ σ`, i.e. `σ ∘ τ`, left; `F(σ|_L)` on `μ_n(L)` is `ζ ↦ σ(ζ)` | agrees with the Conventions witness | none |
| §§3.1, 3.3 (sampled), cited for `Weil.rationalCohomology` | constant system, level `n` | `ℚ_ℓ ⊗ lim_n` of a system identified with `n ↦ H^ν(X_k̄, ℤ/ℓ^{n+1})` (`geometricConstantLevelCohomologySystemIso`), a `ModuleCat ℚ_[ℓ]` with no topology: naive limit then algebraic localisation | as described | none |
| §§1.4, 2.5 first statement (sampled), cited for the field comparison and the change of separably closed field | `Spec K`; `k₁` separably closed, `k₂/k₁` algebraic | `etaleCohomologyAddEquivGaloisCohomology : H^q(K, 𝓕) ≃+ H^q(G, 𝓕(K̄))`, abelian sheaves; restriction map bijective for any `Y` over `k₁`, no equivariance stated | as described; suppliers §2.15, §0.23a, §F.0.4 exist on main | none |

Rows for untouched statements stand as in the previous review, of `1947660`.

- External declarations opened at the cited commits (AxiomMath/Weil `27cdb20`, AxiomMath/Stacks `012108f`), 11 files, all found where the README places them: `Weil/Definitions.lean` lines 107, 121; `Trace/RationalCohomologyLevels.lean`; `Trace/CanonicalFrobeniusIso.lean` line 57; `Defs/AlgebraicGeometry/Frobenius.lean` line 111; `Defs/…/GeometricPointStalkMap.lean` line 93; `Defs/…/Sites/GaloisActionOnStalk.lean` lines 173, 202; `Sites/GaloisActionOnStalk.lean` (`isOpen_stabilizer_galoisStalk`); `Sites/GaloisGlobalSectionsInvariants.lean`; `GaloisCohomology/EtaleGaloisCohomologyComparison.lean` line 98; `BaseChangePurelyInseparableField.lean` line 61; Stacks `Trace/AlgebraicClosureIndependence.lean` lines 256, 300.
- Repository facts: licence file is Apache 2.0; the README's line on AI authorship and no human review is at its line 112; Weil pins Lean `v4.34.0-rc2` and its own Mathlib and Stacks revisions; this repository's manifest names neither. A text search of Weil's 980 modules finds no spectral norm, no completion of an algebraic closure, no adic or rigid space, and no Galois action on the cohomology of a geometric fibre.
- Remark (no change asked): `algebraClosureCohomologyIso` carries `[Fintype k]` and takes bounded-below complexes; the bullet's standing "finite field `k`" covers the first.
- Cross-roadmap citations of the new text resolved on main: SchemeAndStackFoundations §0.23a (line 2204), §2.15 with `etale_galois_comparison` (lines 4913–4918); EtaleCohomologyFoundations §F.0.4 (line 467), §F.10.2 (line 1434). Internal references §0.3, §1.3 (f), §1.4, §2.5, §2.6, §3.1, §3.3 and Conventions exist and say what the new text attributes to them.
- Source locators: 1 re-read, stacks03N1 Tag 03QW (lines 3963–3969), supporting the rule as cited.
- Gate, run again at `97717c2`: every check 0, OK; the worker's record includes the targeted build (0). `lake env lean` on `Suggested.lean`: one `sorry` warning at line 120, nothing else; the 3 signatures are unchanged.
- Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: 0.
- Pull request text against the head: no sentence contradicted; the new section removes or renumbers nothing, adds no supplier and no declaration (42 headings and 3 declarations added, none removed), and the title and description still say the pull request adds the roadmap.

Overlap check: read ClassicalAdicEtaleCohomology, DiamondEtaleCohomology, AdicCoefficientsAndComparisons (open) and EtaleCohomologyFoundations, AdicSpacesPartIV, AdicEtaleGeometry (main); nothing shared. The new section plans no object: it names an outside repository and hands each overlapping statement to the supplier that already owns it (SchemeAndStackFoundations §§0.23a, 2.15; EtaleCohomologyFoundations §§F.0.4, F.10.2).

Source independence: changed passages only; 4 passages compared with 2 texts (stacks03N1 and the docstrings of the cited AxiomMath files), none shared beyond formulas; largest share stacks03N1, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- huber1996, huber1994, sga4half, serreGC1997: settled as uncertified, no readable text; the change adds no locator into them.
- The external declarations were read, not elaborated: their statements are taken from the source text at the cited commits.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md` line 576 allows adapting proofs from AxiomMath/Weil (Apache-2.0; its README line 112 says AI-written, not human-reviewed) with attribution, and porting files by agreement with its maintainers.
