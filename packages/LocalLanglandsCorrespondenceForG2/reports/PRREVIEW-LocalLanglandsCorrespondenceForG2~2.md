# Review of LocalLanglandsCorrespondenceForG2 (pull request #2458 at 10f3592)

**Verdict:** needs changes

## R01 (P3) — The new lower-tower Xu-packet contract is not declared in plan.json

**Location** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 79: "What ModularityAndLanglandsExtensions must provide (gap:pgsp6-lower-tower-xu-packets): let φ_τ : WD_F → SL₄(ℂ) be such that 1 ⊕ Λ²φ_τ is a discrete parameter of Sp₆".

**Claim** The README states the contract, but the intake reads the slug from `design/plan.json`, which does not declare it. So ModularityAndLanglandsExtensions is never told what §10.7 needs from it. Previous R01 asked for both places.

**Witness** The README has 28 distinct `gap:` slugs and `packages/LocalLanglandsCorrespondenceForG2/design/plan.json` `gaps` has 27. The only slug missing from the plan is `pgsp6-lower-tower-xu-packets`.

**Repair** Append to `plan.json` `gaps`: `{"slug": "pgsp6-lower-tower-xu-packets", "supplier": "ModularityAndLanglandsExtensions", "section": "Layer 3, §3.19", "needs": "For φ_τ : WD_F → SL4(C) with 1 ⊕ Λ²φ_τ a discrete parameter of Sp6, τ the discrete series of PGL4(F) with parameter φ_τ, the nonzero similitude theta lifts to PGSp6(F) of the irreducible representations of split PGO6(F) above τ and of PGO(5,1)(F) above JL(τ) on PGL2(D) form exactly one of Xu's packets over 1 ⊕ Λ²φ_τ (GS, Theorem 12.7(ii), p. 39).", "neededBy": ["LocalLanglandsCorrespondenceForG2:10.7"]}`.

## R02 (P3) — §10.7 concludes with an undefined τ′

**Location** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 1214: "hence X ⊂ Irr♠ ∪ Irr♣, and all σ ∈ X have the same φ_τ′ ⊕ φ_τ′∨ and the same L_w".

**Claim** §10.7 fixes τ (the discrete series with parameter φ_τ) and never defines τ′. Because of this, the middle conclusion does not say which datum of σ is being compared.

**Witness** §10.7 introduces only φ_τ, φ♭, τ and χ. Elsewhere the README defines τ′ where it is used: line 715 "with τ′ the PGL₃ datum", and line 93 "τ′ a constituent of τ on PGSO₆(F)".

**Repair** Replace it with: "hence X ⊂ Irr♠ ∪ Irr♣, and all σ ∈ X have the same φ_τ′ ⊕ φ_τ′∨, τ′ the PGL₄-datum of σ (§§9.1–9.2), namely (φ_τ ⊗ χ) ⊕ (φ_τ ⊗ χ)∨, and the same L_w". This is tested on X = X_τ ⊗ χ ∘ sim: the route gives τ′ = τ ⊗ χ ∘ det up to duality.

## Previous findings

- R01 — partly repaired: line 1214 now reads "*Route:* by the pgsp6-lower-tower-xu-packets contract the lifts above τ form one of Xu's packets X_τ over φ♭; every other is X_τ ⊗ χ ∘ sim", and the contract is at line 79. `plan.json` lacks the slug (R01 above).
- R02 — repaired: line 638 reads "*Needs:* §3.6, §3.7; ExceptionalThetaCorrespondencesForG2, Layer 1, §§1.1–1.6 (reducibility of the P-, Q- and Borel series); SmoothRepresentationsOfLocalGroups, SR.2." Line 759 lists "ExceptionalThetaCorrespondencesForG2, Layer 1".
- R03 — repaired: line 985 reads "S_φ is an elementary abelian 2-group … the fibre has 2^m ≤ 2^(k−1) members, and a three-member fibre … does not occur here". Line 971 reads "a power of two at most 2^(k−1)".

## Verified sound

| Statement | Instances tried | One side | Other side | Result |
| --- | --- | --- | --- | --- |
| Contract line 79: "discreteness forces φ_τ irreducible" | φ_τ = φ₁ ⊕ φ₂ (2 + 2); χ ⊕ φ₃; Sym³ | Λ² ⊃ det φ₁ ⊕ det φ₁⁻¹; Λ²(χ ⊕ φ₃) = χφ₃ ⊕ (χφ₃)∨: neither is discrete orthogonal | Sym³ is irreducible, but Λ² ∋ 1, so 1 ⊕ 1 ⊕ Sym⁴ is not discrete | "forces" is correct; irreducibility is necessary, not sufficient |
| §10.7 lower-tower constancy (changed) | φ_τ = ρ ⊠ S₂, ρ : W_F → SL₂ primitive (p = 2); χ quadratic, so ρχ ≇ ρ | φ♭ = 1 ⊕ Sym²ρ ⊕ S₃, k = 3, discrete; φ_τ ⊗ χ gives the same φ♭ | s-images 2(ρ ⊠ S₂) and 2(ρχ ⊠ S₂) differ, so X_τ and X_τ ⊗ χ ∘ sim are distinct packets, each with constant L_w | holds; agrees with §10.4 |
| §10.7 route, twist step | ModularityAndLanglandsExtensions §3.19 at ζ̃ = 1 | X = Hom(PGSp₆(F)/image Sp₆(F), ℂ×) = {χ ∘ sim, χ quadratic} | C = ⨆ over X/α(S_φ) of Π_φ̃ ⊗ ω; JL twists by χ ∘ Nrd ↔ χ ∘ det (§4.7a Check) | every packet over φ♭ is reached |
| §10.7, self-twisted τ | τ ⊗ χ ∘ det ≅ τ or τ∨ | χ · h∘φ_τ is Spin₇-conjugate to h∘φ_τ, so χ ∈ α(S_φ♭) | §3.19: α(S_φ♭) fixes every member; lifts above τ and above τ ⊗ χ ∘ det coincide | no member counted twice |
| §6.7 Check (changed) | φ = (ρ, id) into (SL₂ × SL₂)/μ₂ | v∘φ = (ρ ⊗ S₂) ⊕ S₃, dimensions 4 + 3, k = 2 | Z_SO₇ = {(ε₁, ε₂) : ε₁⁴ε₂³ = 1} = {(±1, 1)} ≅ ℤ/2, so the fibre has 2 members | holds |
| §§6.6–6.7 bound (changed) | principal; subregular | Sym⁶: k = 1, S_φ = 1, fibre {St} | subregular: fibre 3, not a power of two, and it lies in the A₂ image, not in Φ♦_ds | consistent |
| §3.8 (Needs changed) | φ into T[2] through three distinct nontrivial quadratic characters, p odd | S_φ = ℤ/2, fibre of size 2 | ExceptionalThetaCorrespondencesForG2 §1.6 (its README line 433): "generic⊕nongeneric" | the input is now cited |
| §3.7 (sample; cited by §3.8) | Steinberg; trivial representation | principal parameter is discrete; St is square-integrable | the trivial parameter factors through the torus; the trivial representation is not square-integrable | holds (GS line 106, p. 3) |
| §4.4 (sample; cited by lines 60, 985) | subregular, p = 3 | \|Irr(S₃)\| = 3, \|S₃\| = 6 | {π_gen[1], π_sc[1], π_deg[1]}; GS lines 606–608: bijective at p = 3 for subregular | holds; π_sc[1] is ExceptionalThetaCorrespondencesForG2 §1.8 |
| §10.1 (sample; cited by §10.7) | St_PGSp₆; lower tower with τ = St_PGL₄ | principal weak class | q-image 1 ⊕ 1 ⊕ Sym⁴ (dimension 7), s-image Sym³ ⊕ Sym³ (dimension 8) | holds (GS line 1598, Theorem 12.6, p. 38) |

The rows for untouched statements stand as in the previous review, of 8d99a61.

- Source locators checked against the text: 6. GS Theorem 12.7(ii) and its proof, p. 39 (lines 1631–1647); Theorem 12.6, p. 38 (line 1598); §3.4, p. 12 (lines 528–531); Proposition 3.2, p. 14 (lines 603–608); Main Theorem (i), p. 3 (line 106); HD Theorem 8.5, p. 27 (HD line 1017).
- Cross-roadmap citations resolved at the open heads: 6, none missing.
  - ExceptionalThetaCorrespondencesForG2 §§1.1–1.6 and §1.8 (its README lines 370–468).
  - ModularityAndLanglandsExtensions §3.19 (line 2089: twist decomposition, self-twists α(S_φ), bounded φ).
  - EndoscopicTransferAndUnitaryTraceComparison §4.7a (line 1873) and §10.30 (line 4209).
  - MetaplecticAutomorphicForms §3.42 (line 1117: the PGO₈ / PGO₅,₁ dichotomy).
- Contract ownership:
  - No roadmap on main or at an open head states the lower-tower Xu-packet statement or Prasad's conjecture (searched `lower.tower`, `Atobe|Prasad's conjecture`).
  - ModularityAndLanglandsExtensions (merge order line 210) comes after MetaplecticAutomorphicForms (162) and EndoscopicTransferAndUnitaryTraceComparison (160), whose sections the contract uses. It already consumes MetaplecticAutomorphicForms Layers 0–3 (its line 231).
- Gate at 10f3592: every check passes. Dependency check: `depcheck: 262 roadmaps, 2545 edges, 0 problem(s)`. Nothing is changed outside the folder.
- `Suggested.lean` is unchanged since 8d99a61. `lake env lean` gives three `declaration uses sorry` warnings (lines 124, 143, 158) and no error. The previous `#check @` comparison and one-tactic probe still stand.
- Pull request text checked against 10f3592: no sentence is contradicted. The change adds no supplier: ModularityAndLanglandsExtensions and ExceptionalThetaCorrespondencesForG2 are already in the description's dependency list.
- Wording: the 11 added lines were compared with GS, HD, CG, HKT and GF. The longest shared run is 6 words, a formula-bound phrase ("from PGSp₆ to PGSO₈ and the").
- Remark: the first Check of §10.7 (line 1218, an unramified φ_τ in general position) now lies outside the section's discrete hypothesis. The same point holds in scope; see the row φ_τ = ρ ⊠ S₂.

Overlap check: the scopes of ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups and SpinRepresentations were read in the previous review. This round re-read ModularityAndLanglandsExtensions §3.19 and ExceptionalThetaCorrespondencesForG2 Layer 1. The change adds one shared object, the lower-tower Xu packets of PGSp₆, owned by ModularityAndLanglandsExtensions §3.19 through the new contract. Everything else shared is as in the previous review.

Source independence: changed passages only. 7 passages (lines 12, 60, 79, 971, 985, 1214, and the note at 1278) were compared with 5 sources (GS, HD, CG, HKT, GF); nothing is shared beyond 6 words. The largest share is GS: 111 of 179 locators at 8d99a61, plus the GS locators the change adds at lines 79 and 1278. No layer was added, removed or reordered, so the contents comparison with GS stands: independent.

## Not verifiable

- Griess, Theorem 1 (§0.0 and `griess_conjugacy`): the manifest records it as uncertified (paywalled); the text was not read. Not touched by the change.
- SpV, Theorems 1.7.1, 1.8.1 and §1.5 (§1.1(i)–(iii)): the manifest records it as uncertified (Springer monograph); the text was not read. Not touched by the change.

## Source issues

- **Gap** in GS at proof of Theorem 12.7(ii), p. 39: the source leaves the case of fibres inside the lower-tower loci to the reader as similar to the PGSO₈ argument; it should be argued separately, because those members have zero lift to split PGSO₈; affects the proof.
- **Gap** in GS at proof of Proposition 3.2, pp. 14–15: the source says that every centralizer of a parameter in the discrete PGL₃ image has order three; it should treat self-dual φ_τ separately, where the centralizer is S₃; affects the proof.

## For the human reviewers

- Griess (Theorem 1) and SpV (Theorems 1.7.1, 1.8.1) are cited by locator only (manifest: uncertified). `griess_conjugacy` (`Suggested.lean` line 124) and §1.1(i) rest on texts this review did not read.
