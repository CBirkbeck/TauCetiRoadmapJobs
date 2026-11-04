# Design repair: OrdinaryAutomorphicFormsAndModularityLiftingPartII, round 2

Files changed: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` (rewritten in package form, Layers 1–6 = OL.0–OL.5), `design/plan.json` (nodes resynchronised with the README, gaps, source issues, baseline, sources), `sources.toml` (new; 13 certified entries).

## F01 (P1) — applied

GAP-1 (no supplier; "Geraghty states for odd l … not read") → deleted from `gaps`, the README and OL.1 coverage. Option (a): Layer 2 owns l = 2 Hida theory, citing Ger19 preprint numbers (published equivalents in `version_note`). Ger19 fixes an arbitrary prime l (Ger19 line 144); the only l > 2 inputs are the CHT08 lemmas in §2.7 (Ger19 lines 1003, 1113, 1146), which 3.3 replaces by Tho17 Lemmas 2.2 and 2.4.

## F02 (P1) — applied differently

Every `AbelianSurfacesPotentialModularity` citation is gone. Nobody owns higher Hida theory on Hilbert–Siegel varieties, so it can't be planned here without a large widening. The Galois/patching statements stay as targets here (5.6, 6.2, citing WHI22 §7). The geometric inputs become supplier gaps: `hilbert-siegel-ordinary-hida-module` (AutomorphicBundles Layer B5) and `gsp4-galois-representations-totally-real` (AutomorphicGaloisRepresentationsPartII; this also covers the regular-weight point about Hypothesis 6.3.1).

## F03 (P1) — applied

The three "requests" → `gaps` with supplier, section and `needs`, each listed under its supplier in "Exact supplier contracts": `dyadic-flag-ring-dimension` (LocalGaloisDeformationRings §6.24; lower bound only, with Ger19 Lemma 3.2.3 as the route, Ger19 lines 1582–1587); `gsp4-semisimple-taylor-wiles-places` (§2.17; L_v^⊥ = H¹_ur(F_v, M_v^∨(1)), WHI22 line 936); `inertial-types-and-block-levels` (§SR.3.2; monodromy forgotten in (i), block levels in (ii)).

## F04 (P1) — applied

"h^i vanish for i ≠ 1, 2" → h⁰ = 0, h^i = 0 for i ≥ 4, h² = h¹_{𝒮^⊥,T}, h³ = h⁰(ad r̄(1)) = 1 (Tho17 line 433, line 390) in 1.2(2). Added the Euler-count Check (n = 2, d = 2, #T = 3, q = 5 gives h¹ = 5 = g; with h³ = 0 it would be 6). Source issue added. Knock-on effect: see "Consequences" below (Lemma 5.7.7).

## F05 (P1) — applied

"every lift of ρ̄|G_{F′_ṽ} is unipotently ramified" → every lift of ρ̄|G_{F_u} (original field) becomes unipotently ramified on G_{F′_w} (BCGP25 line 5794), in 4.1. The ψ ⊕ 1^{n−1} witness is now a Check. The same correction is made in the source-issue entry (plan E10) and in the 4.7 route.

## F06 (P2) — applied

5.3 now assumes (a) H⁰(H, 𝔰𝔭₄^∨) = 0 together with "ζ_p ∉ L or H¹(H, 𝔰𝔭₄^∨) = 0". WHI22 Lemma 3.16 is now a step of the target (WHI22 lines 1001–1005), replacing the narrower ArithmeticGaloisRepresentations §7.11 citation. Added a Check for the case "reasonable, ζ_p ∈ L, not enormous", and a source issue for WHI22 Proposition 3.18.

## F07 (P2) — applied

New target 4.2: ring–module patching with Λ finite free over Λ⁰ = O⟦w⟧, using DeformationAndDerivedPatchingAlgebra §§5.2–5.4 and the depth part of §5.5. 1.2(4) now states BCGP25 Proposition 5.5.6 over Λ. 6.2 uses DeformationAndDerivedPatchingAlgebra Layer 8 (Λ_{GSp₄,F⁺} is a power series ring since p > 2 splits completely). Check: Λ = O[{±1}]⟦w⟧ is not O⟦w⟧.

## F08 (P2) — applied

OL.1 no longer restates S_{λ,{χ_v}}(U, A), Hecke operators or sufficient smallness. It imports AutomorphicFormsOnReductiveGroups §7.4 (with J = U and M = M_{λ,{χ_v}}) and §7.5 (smallness, base change, automorphic realization; also used in 2.3). It keeps only the Iwahori levels at 2, U^j, ⟨u⟩, the twisted Λ-structure and the universal algebra. The restructure note is corrected.

## F09 (P3) — applied

- `unnormalized_U`: the counterexample is now j = n, where the scalar is ϖ^{Σλ}; for j = 1 with λ = (1, 0) it is 1.
- `weightAlgebra_components`: now two places with F⁺_v = ℚ₂, giving 16 components of dimension 5.
- F⁺ = ℚ Check: replaced by "√2 ∉ F⁺ ⇒ m = 3".
- `not_unique_gl_conj`: replaced by the characteristic-2 coincidence (BCGP25 proof of Lemma 5.2.3, p. 118).
- `unramified_case`: rewritten.
- A₅ Check: now cites BCGP25 Lemma 8.2.2 and Remark 8.2.3 (p. 182). `surjective_F3` is replaced by an Sp₄(𝔽₃) ⊂ image Check, because Table 6.4.4's columns could not be verified.
- Added a Frobenius witness: 2^{−1} ≡ 4 mod 7.

## F10 (P3) — applied differently

- Atlas labels → section numbers throughout the README and plan.
- `GlobalGaloisDeformations:R04.2/framed-unframed-comparison` → LocalGaloisDeformationRings §F.2.6.
- PotentialAutomorphyInfrastructurePartII: its board status is recorded here, not in the README (house style is timeless). It is a board design package at position 86 of board `origin/main`'s merge order, and it is absent from this brief's ORDER.txt. The gate doesn't flag it.

## F11 (P3) — applied

- 1.3 keeps only the full-adjoint form of weak adequacy and the identification with relaxed adequacy; ArithmeticGaloisRepresentations §7.9 is imported.
- µ_v and H¹_{𝒮^⊥,T} are imported from the PL.3 section and kept consistent with it.
- Added `TauCeti.completedGroupAlgebra` and `LieAlgebra.Symplectic.sp`.
- Pins updated to 6b7abb3c / a91d3aaf, and every declaration was re-read there.
- GSp₄-reasonable is stated as owned here.

## F12 (P3) — applied

- 1.2(5): surjectivity needs B to be non-alternating, which is strong residual oddness for n even (Tho17 Definition 3.3 gives SRO ⇔ r̄(c_v) ~ (1_n, 1)).
- 6.2: #Q_N = q, with t the number of cyclic factors (WHI22 line 3302).
- Geraghty is cited in one scheme (preprint) everywhere.
- 6.3 step (iii) now uses the seed component C_π and the special-fibre component Z from 6.1 to select R^{△,π}_v.

## F13 (P3) — applied differently

- The README is rewritten in package form: `# Roadmap:`, Exact supplier contracts with gap lines, numbered sections, `*Needs:*`, prose Checks, and Examples/Dependencies per layer. All process vocabulary is removed.
- There is no Suggested.lean at the design stage, so the README carries no Lean names of its own. In plan.json, `leanName` now uses the `TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII` prefix.
- The padding prototype items are dropped. `prototypeCoverage` records the headlines (4.7, 4.8, 6.3, 6.4, 1.4) as not statable, with the missing carriers.
- The manifest records 13 sources. Labesse and Balaji could not be read legally, so they are no longer cited directly: base change goes through PL.2, and the presentation through CHT08.

## Checks run

- Gate: `candidate: … not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions` / `depcheck: 56 roadmaps, 637 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.
- `roadmaps resolve` on the new README: no cross-roadmap citations found nowhere, and no Lean names found nowhere.
- `sources check sources.toml`: 0 problems.
- Suggested.lean `#check` pass: not applicable (there is no Suggested.lean at the design stage). The headlines are not statable at the pins, since Tau Ceti has no deformation, Hecke or Galois-cohomology carriers.

## Adversarial pass (selected rows; every changed statement)

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| 1.1 framing dimension | n=4, #T=3; T=∅ | 17·3−1=50 vs 47; torsor trivial | OK |
| 1.1 Ĝ_n vs GL_n | A=k[ε], a=1+ε | (x+yε)²=x², not a square | OK, Check kept |
| 1.2(2) h³ | p=2 scalars; p odd ζ_p∉F | j·1_n=ᵗ1_n ⇒ h³=1; h³=0 | corrected (F04) |
| 1.2(3)-(4) Euler/g | n=2,d=2,#T=3,q=5 | χ=−5, h¹=5=g (6 if h³=0) | OK |
| 1.2(5) surjectivity | B=1_2; B=Ψ_2 | 1_2∉{Y+ᵗY}; Ψ_2 alternating ⇒ map 0 | SRO hypothesis added (F12) |
| 1.3 | H={1}⊂GL₂; S₃⊂GL₂(𝔽₂); A₅ | U=ad⁰ (dim 3); span dim 2<4; H¹(ad/k)=k | OK |
| 1.4 | √2∉F⁺; F⁺=ℚ(√2); ℚ(√5) | m=3; m=4, L⁺=ℚ(ζ16)⁺; in no K⁺_m | Check fixed (F09) |
| 2.1 normalization | n=2,λ=(1,0),j=1 vs j=n | ϖ⁰=1 vs ϖ^{Σλ} | Check fixed (F09) |
| 2.1 Λ components | n=2, two ℚ₂ places | ({±1}×ℤ₂)⁴: 16 comps, dim 5 | Check fixed |
| 2.2(2) | λ=0; λ_τ=(1,0) | twist 1; twist τ(u_2) | OK |
| 3.1 classes | k finite char 2 | k^×=(k^×)² | Check replaced (F09) |
| 3.2 dimension | n=2,d=2,#T=3 | dim R^loc=19; s=14 ⇒ 5; with h³=1, s=15 ⇒ 4 | **printed proof is one relation short**; recorded as source gap, step kept in target |
| 3.4 | n=1, q_w≡1 mod 4 | order-4 tame chars ≡1 mod ϖ, conductor 1 | OK |
| 3.5 | all lifts unramified | GL_n(O) deep | Check rewritten (F09) |
| 4.1 unipotence | ψ⊕1^{n−1} over F′ | char poly (X−ψ(σ))(X−1)^{n−1} ≠ (X−1)^n | clause corrected (F05) |
| 4.2 | Λ=O[{±1}]⟦w⟧; dim R_∞=dim S_∞+1 | rank 2 over O⟦w⟧; depth fails | new target (F07) |
| 4.3 dims | n=2,d=2,#T=3,q=5 | 24=24 | OK |
| 4.5 R_X dim | patched support | dim S_∞ − (dim S_∞ − dim Λ) = dim Λ | proved without 3.2 |
| 5.1 | #T=1,3 | 10; 32 vs 47 | OK |
| 5.2 | torus image; Sp₄(𝔽₃); p=2 | (a) fails; enormous+perfect; trace form 0 | OK |
| 5.3 | Frob=1; torus image | N_v=0; H⁰≠0 breaks Lemma 3.16 | hypothesis (a) added (F06) |
| 5.4 | p=3: 19, 7; q_{w₀}≡1 | 19≡1, 7≢1 mod 9; 𝔱 invariant | OK |
| 6.2 | F⁺=ℚ,#S=3,t=7 | g=5; 39=39; #Q_N=q, t≤2q | step fixed (F12) |
| 6.3 | nonzero M^χ_∞ only | could pick another component above p | seed + Z added (F12) |
| Conventions | p=7, q_v=2 | 2^{−1}≡4 vs 2 | witness added |

## Consequences and notes for the maintainer

- **New finding from the h³ correction (BCGP25 Lemma 5.7.7).** CHT08 Corollaries 2.2.12 and 2.3.5 bound the relations by h², and that count carries an h⁰(ad r̄(1)) term. With h³ = 1 at p = 2, BCGP's printed count proves only dim ≥ dim Λ − 1. 3.2 keeps BCGP's statement and says explicitly that one more relation-saving argument is part of the target. 4.5 no longer depends on 3.2 (its bound now comes from the patched module). 4.8 still needs 3.2 in full. This is a mathematical point, not a citation fix, and needs a human decision: accept it as an obligation of the target, or find the argument.
- **Supplier status.** PotentialAutomorphyInfrastructurePartII (PL.0–PL.4) is a supplier that is not in the brief's ORDER.txt; it is at position 86 on board `origin/main`. The gate passed because it ignores roadmaps it doesn't know. Its placement ahead of this roadmap should be confirmed.
- **New gaps for other roadmaps.**
  - AutomorphicBundles: Hilbert–Siegel Hida module. A Part II of AutomorphicBundles is the natural owner.
  - AutomorphicGaloisRepresentationsPartII: GSp₄ Galois representations over totally real F⁺, including weight 2.
  - LocalGaloisDeformationRings: §6.24 lower bound and §2.17 semisimple places.
  - SmoothRepresentationsOfLocalGroups: §SR.3.2.
- **Renamed or new plan ids.**
  - OL.0/dyadic-dual-selmer-group keeps its id but now covers Thorne's complex and the Λ-presentation.
  - New node: OL.3/lambda-module-patching.
  - The planned Lean prefix is now `TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII`.
  - Consumers (GSp4NonregularModularityLifting, AbelianSurfacesModularity) cite node ids, and these ids are unchanged.
- **Ownership against open work** was checked with `roadmaps grep` over main and the open heads (higher Hida theory, Hilbert–Siegel, algebraic modular forms, GSp₄ Galois representations, inertial types). No other owner was found apart from those cited.
- **Sources.** No source text was copied into these files, and no `needs-references.toml` request remains. Labesse 2011 and Balaji 2012 could not be read legally and are not cited directly.
- **Untrusted input.** The review contained no instructions outside its mathematical claims.
