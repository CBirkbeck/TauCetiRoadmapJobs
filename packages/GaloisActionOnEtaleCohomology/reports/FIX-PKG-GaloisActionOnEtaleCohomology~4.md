# FIX-PKG-GaloisActionOnEtaleCohomology~4

One review (`REV-PKG-GaloisActionOnEtaleCohomology~3`, three P3 findings). All three were checked against the cited roadmap or source and found correct. All three are applied, in `packages/GaloisActionOnEtaleCohomology/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Verified: SchemeAndStackFoundations on main has `Sheaf.derivedPushforward` and `derivedPushforward_comp` (`R(g∘f)_* ≅ Rg_* Rf_*`) in §2.1. Its §2.2 has only `leray_spectral_sequence` and `cech_to_cohomology`.

The changes:
- §2.4 statement: "that of SchemeAndStackFoundations §2.2" → "§2.1 (`derivedPushforward_comp`)".
- §2.4 *Needs:* "§§2.1, 2.2 (composition of direct images), 2.15" → "§§2.1 (`higherDirectImage_iso_sheafify`, `derivedPushforward_comp`), 2.15".
- Pattern: the §2.1 contract line under Exact supplier contracts now lists `Sheaf.derivedPushforward` and `derivedPushforward_comp`.

Adversarial addition: `derivedPushforward_comp` is stated for abelian `D⁺`, but §2.4 is about `D⁺(X_ét, Λ)`. So §2.4 *Needs* and the Layer 2 Dependencies now also list EnhancedDerivedSheaves §0.4 (`ClassicalDerived.functorCoherence`, composition and the coefficient-forgetting comparison).

The rigid counterpart in §2.3 cites ClassicalAdicEtaleCohomology §1.3. Its (a) states `R(h ∘ g)_* ≅ Rh_* ∘ Rg_*` for a fixed `Λ`, so it is correct and unchanged.

## F02 (P3) — applied

Verified: AdicSpacesPartII §R1.1 (*rigid-analytic-space*) is the category `Rig_K` of Tate's rigid spaces, supplied by RigidAnalyticGeometry, and it has no functor to adic spaces. Huber's functor `r_K` with `r_K(Sp A) = Spa(A, A°)` is §R1.7 (*rigid-adic-comparison-functor*).

The changes:
- Conventions: "Tate's rigid spaces correspond by §R1.1" → "Tate's rigid spaces, AdicSpacesPartII §R1.1 (*rigid-analytic-space*), are carried to these by Huber's functor `r_K` of §R1.7 (*rigid-adic-comparison-functor*), with `r_K(Sp A) = Spa(A, A°)`".
- §R1.7 is added to the AdicSpacesPartII lists in Scope and in Exact supplier contracts.

Same supplier, on main, so there is no new edge. No layer cited §R1.1, so nothing else changed.

## F03 (P3) — applied

Verified: dejongvanderput1996 line 1596 states Corollary 3.7.5 for any abelian sheaf. Lines 1601–1603 of its proof identify `H^q(X_K, α*S)` with `(R^q p_* S)_e` "if S is overconvergent". Lines 1604–1605 derive discreteness from that identification. Non-overconvergent sheaves exist on dJvdP's rigid étale site (dejongvanderput1996 lines 56–57).

The changes:
- §2.1 locator: overconvergence noted (line 1602); for every abelian sheaf on the adic étale site the citation is huber1996 Corollary 2.4.6 and the route.
- §2.5 locator: "whose proof treats overconvergent sheaves" added.
- Pattern: §3.2 cites the same corollary for discreteness, so it now says "for overconvergent sheaves, lines 1602–1605; for every sheaf it is §2.1".

The §2.5 citation of Lemma 3.3.1 (2) and Corollary 3.3.2 for `Sp(K)` is left alone: Corollary 3.3.2 (lines 1201–1204) assumes no overconvergence. No statement changed. The routes through ClassicalAdicEtaleCohomology §§1.5 and 1.3 and AdicEtaleGeometry A1.14 assume no overconvergence.

## Checks

- **Elaboration.** `lake env lean packages/GaloisActionOnEtaleCohomology/Suggested.lean`, run from the content checkout: exit 0, one message, `Suggested.lean:119:8: warning: declaration uses 'sorry'`. No error. No `TauCeti.*` import, so nothing needed building. The file is unchanged this round.
- **Signatures.** I put `#check @name` for all three declarations in one scratch copy and elaborated it once:
  - `SpectralAlgClosure : (K : Type u_1) → [Field K] → Type u_1`
  - `CompletedAlgClosure : (K : Type u_1) → [NontriviallyNormedField K] → [CompleteSpace K] → [IsUltrametricDist K] → Type u_1`
  - `exists_galois_continuousAut_equiv` with the same three instance binders, and conclusion: extension of `σ`, the composition law `e (σ * τ) = e σ ∘ e τ`, bijectivity, joint continuity.

  Each matches its README statement (Conventions, §0.2). Nothing lost a binder and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`): exit 0, output `depcheck: 206 roadmaps, 1901 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve`): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." That covers the new `derivedPushforward_comp`, `ClassicalDerived.functorCoherence` and *rigid-adic-comparison-functor*.
- **Overlaps** (`roadmaps overlaps`): no other pull request changes this roadmap, no dropped ids, no ids defined only by an open revision. Nothing to act on.
- **Library near-matches.** `Suggested.lean` is unchanged, and no new declarations, so there is nothing new to compare.
- **Ownership.** No new object or construction is introduced. The edits only re-point citations to the owning sections of suppliers that were already cited (SchemeAndStackFoundations §2.1, AdicSpacesPartII §R1.7, EnhancedDerivedSheaves §0.4). There are no new supplier edges, because EnhancedDerivedSheaves was already a Layer 1 dependency.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: `r_K` carries Tate's rigid spaces to adic spaces lft over `Spa(K, 𝒪_K)`, `r_K(Sp A) = Spa(A, A°)` | `A = K`; `A = K⟨T⟩`; wrong plus-ring `A⁺ = 𝒪_K + A°°`; essential image | `r_K(Sp K) = Spa(K, 𝒪_K)`, one point. The Gauss norm on `K⟨T⟩` is multiplicative, so `K⟨T⟩° = {‖f‖ ≤ 1} = 𝒪_K⟨T⟩` and the image is the adic closed disc used in §§3.1, 4.3, 4.4. With `A⁺ = 𝒪_K + A°°`, the rank-two point with `|T| = 1⁺` has `|a_n T^n| < 1` for every `f = Σ a_n T^n ∈ A°°`, so it lies in `Spa(A, A⁺)`. It does not lie in `Spa(A, A°)`, because `T ∈ A°`; the stated formula rules this model out. The sentence says "carried to", not "equivalent", which is correct: §R1.7 gives an equivalence only on quasi-separated objects (*rigid-adic-quasi-separated-equivalence*). | true | citation re-pointed (F02) |
| §2.4: the third consequence uses the composition isomorphism `Rf′_* ≅ Rf_* ∘ Rg_*` of SchemeAndStackFoundations §2.1 | `k = ℝ`, `X = Spec ℝ`, `X′ = Spec ℂ`, `M = ℤ/2` (as a `ℤ/2`-module and as an abelian sheaf); `X′ = ∅`; degree 1 | `f = id`, `f′ = g`, so `derivedPushforward_comp` for `id ∘ g` is the identity of `Rg_*`. The stalk of the unit `ℤ/2 → g_*ℤ/2` at `Spec ℂ → Spec ℝ` is `ℤ/2 → (ℤ/2)^{Hom_ℝ(ℂ,ℂ)} = (ℤ/2)²`, the diagonal. `g_C^* : H⁰(Spec ℂ, ℤ/2) → H⁰(Spec(ℂ ⊗_ℝ ℂ), ℤ/2) = (ℤ/2)²` is also the diagonal. Module and abelian pushforwards agree (`g` finite, `g_*` exact). Degree 1: `R¹g_*ℤ/2 = 0` and `H¹(Spec ℂ ⊔ Spec ℂ, ℤ/2) = 0`. `X′ = ∅`: both sides 0. | true | citation re-pointed; EnhancedDerivedSheaves §0.4 added for `Λ`-coefficients (F01) |
| §2.1: `colim_L H^i(X_L, M_L) ≅ H^i(X_C, M_C)` for every `M ∈ D⁺`, locator now qualified | `ℱ = 𝒪_{X_ét}` on `Spa(K, 𝒪_K)`; `ℱ = μ_4`, `K = ℚ_3` | Colimit `colim_L L = K^sep`, not `C = H⁰(X_C, 𝒪)` (third Check of §2.1, unchanged). `μ_4(K^sep)` has order 4, with `G_{ℚ_3}` acting through `Gal(ℚ_3(i)/ℚ_3)` of order 2. Its invariants have order 2, matching `H⁰(Spa(ℚ_3, ℤ_3), μ_4) = {±1}` (§2.5 Check). Neither uses overconvergence; the route is ClassicalAdicEtaleCohomology §1.5 with AdicEtaleGeometry A1.14. | true | locator only (F03) |
| §2.5: `E_2` term and edge map, locator now qualified | `K = ℚ_2`, `ℱ = μ_5`; `X = Spa(K, 𝒪_K)` | `H²(ℚ_2, μ_5) = Br(ℚ_2)[5] = ℤ/5` and `E_2^{2,0} = H²(G_{ℚ_2}, μ_5(C)) = ℤ/5`, against `H²(G_{ℚ_2}, ℤ/5(−1)) = H⁰(ℤ/5(2))^∨ = 0` because `2² = 4 ≢ 1 (mod 5)` (Check unchanged). For `f = id` the sequence collapses to the first statement. | true | locator only (F03) |
| §3.2: joint continuity from the discreteness of the finite levels, locator now qualified | `X = Spa(K, 𝒪_K)`, `j = 1`; `X = ⊔_m Spa(K, 𝒪_K)` (not qc) | The finite levels are `μ_{ℓ^n}(C)` with open stabilisers `G_{K(μ_{ℓ^n})}`, and the limit is `ℤ_ℓ(1)` via the cyclotomic character. In the non-qc case the stabiliser `ker χ_ℓ` is not open, which is why the bullet needs `X` qcqs, through §2.1. | true | locator only (F03) |

## Notes for the maintainer

- No Lean name changed, so other roadmaps citing this one are unaffected. No section, layer or target id moved.
- The review's "Source issues" (the overconvergence gap and the "Lemma 3.3.2" misprint in dejongvanderput1996 page 39; the Stacks Tag 03QV misprint) are notes about the sources, not findings. The overconvergence gap is what F03 records in the locators.
- Ownership against open pull requests: checked through `roadmaps resolve` and the `roadmaps overlaps` listing (computed from every open head). This round added no object that another roadmap could own.
- Nothing suspicious was found in the review text.
