<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13074#issuecomment-6794386431 -->
Red team round 2 pass b (claude) of 13242d4

Verdict: needs_changes

1. **F01** (P2) `gap:hilbert-siegel-ordinary-classicality` does not give the reducedness of `T_{S_1}` that 5.6 uses

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:660` (5.6, route): "`T_{S_1}` is reduced, O-flat and embeds in `∏_π O_{E_π}`, so `R^□_v → T_{S_1}` factors through R^△_v once every composite `R^□_v → O_{E_π}` does"; also `:713` ("although `T_{S_1}` is reduced") and the gap at `:140`.

   **Claim.** The three Hilbert–Siegel gaps supply that `T_{S_1}` is reduced and embeds in the product of the `O_{E_π}` over classical π.

   **Witness.** The gap only says every ℚ̄_p-point above dense weights is classical. Model: Λ = O⟦x⟧, M = Λ², T = Λ[N]/(N²), N = [[0,1],[0,0]]: M free, T faithful, every point of T is a point of Λ, T not reduced; `O⟦x,n⟧ → T`, n ↦ N, does not factor through the reduced flat quotient n = 0 although every O-point does. BCGP21 lines 10317–10331 use the control isomorphism and the automorphic decomposition (Theorems 6.6.5, 3.10.1), not point-classicality.

   **Repair.** Replace the `needs` of `gap:hilbert-siegel-ordinary-classicality` (README contract under AutomorphicBundles and the same slug in the plan's `gaps`) by:

   "in the same setting, for a Zariski-dense set of arithmetic weights κ of `Λ_{GSp₄,F⁺}` (large regular weight), the specialization `M¹ ⊗_{Λ,κ} E` is Hecke-equivariantly dual to the space of ordinary classical cuspidal forms of weight κ and the given level (control; BCGP21 Lemma 7.8.5 and Theorem 6.6.5), and that space is a direct sum of finite parts of ordinary cuspidal automorphic representations π of `GSp₄(𝔸_{F⁺})` of weight κ, on each of which the Hecke algebra acts through a character Θ_π (BCGP21 Theorem 3.10.1 and the proof of Theorem 7.9.4, pp. 417–418); consequently the Hecke algebra acting on M¹ is reduced and embeds in `∏_π O_{E_π}`, and each of its ℚ̄_p-points above such κ is some Θ_π."

   In 5.6 route replace "but `T_{S_1}` is reduced, O-flat and embeds in `∏_π O_{E_π}`" by "but `T_{S_1}` is O-flat (it acts faithfully on the free module M¹) and, by gap:hilbert-siegel-ordinary-classicality, reduced and embedded in `∏_π O_{E_π}`". Tested on the model: T = Λ[N]/(N²) fails the repaired contract (the action of N on M/℘_κ = E² is not semisimple), so the model is excluded.

2. **F02** (P2) 3.3 asserts multiplier `ε^{1−n}δ^n` for r_m at p = 2 without the sign theorem

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:363` (3.3, route): "The 𝒢_n-valued extension of the residual representation uses Tho17 Lemma 2.2 …, and its lift and uniqueness up to strict equivalence use Tho17 Lemma 2.4"; `:291` (2.3 (ii)): "`r_2(π)^c ≅ r_2(π)^∨ε^{1−n}`".

   **Claim.** r_m is of type S_χ, i.e. `ν ∘ r_m = ε^{1−n}δ^n_{F/F⁺}` in characteristic 0, from 2.3 (i)–(iv), Tho17 Lemmas 2.2 and 2.4.

   **Witness.** Tho17 Lemma 2.2 (Tho17 line 208) extends ρ only "after possibly replacing µ by its multiple by the non-trivial character". Modulo 2 both `ε^{1−n}δ^n` and `ε^{1−n}δ^{n+1}` are trivial; for n = 2 their values at c_v are −1 and +1, and 1.1 requires −1. Tho17 Theorem 4.1 gets the sign from its Theorem 3.2 (Bellaïche–Chenevier; Tho17 lines 853–867). 2.3 (ii) does not contain it and no *Needs* line cites it.

   **Repair.** In 2.3 add after (ii): "(ii′) when the base change of π is cuspidal, the pair (r_2(π), `ε^{1−n}δ^n_{F/F⁺}`) is polarized: the pairing realizing (ii) has the sign for which the extension of r_2(π) to `G_{F⁺}` of Tho17 Lemma 2.2 has multiplier `ε^{1−n}δ^n_{F/F⁺}` and not `ε^{1−n}δ^{n+1}_{F/F⁺}` (AutomorphicGaloisRepresentationsPartII AG2.3, *The polarization sign of the constructed system*; Tho17 Theorem 3.2)". In the 3.3 route insert before "The condition at v | 2": "The characteristic-zero multiplier `ε^{1−n}δ^n_{F/F⁺}` of each constituent's extension is 2.3 (ii′); at p = 2 it is not determined by r̄, both candidates being trivial modulo 2." Add "AG2.3 (*The polarization sign of the constructed system*)" to the *Needs* of 2.3 and to the AutomorphicGaloisRepresentationsPartII contract. Add a Check to 3.3: "For n = 2 the two candidate multipliers `ε^{−1}` and `ε^{−1}δ_{F/F⁺}` take the values −1 and +1 at c_v and agree modulo 2; only the first is the multiplier of S_χ." Tested on the witness: with (ii′) the value at c_v is −1.

3. **F03** (P3) the seed datum of 5.4 does not record the absolute irreducibility that 5.1 assumes

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:563` (5.1): "ρ̄ : `G_{F⁺} → GSp₄(k)` continuous and absolutely irreducible"; `:583` (5.2) assumes only "absolutely GSp₄-irreducible"; `:619` (5.4) lists (1)–(6) with no irreducibility clause; 5.5 applies 5.1 to the seed.

   **Claim.** The problems S_1, `S_{1,π}` of 5.5 are instances of 5.1.

   **Witness.** BCGP25 lines 6629–6630 (Hypothesis 6.3.1 (1)) adds "in particular ρ̄ is absolutely irreducible"; WHI22 line 3451 says the image must be absolutely GL₄-irreducible to be reasonable. The README states this implication nowhere, and GSp₄-irreducible images that are GL₄-reducible exist (SL₂(k) × SL₂(k) on V₁ ⊕ V₂).

   **Repair.** Add to the API of 5.2: "A GSp₄-reasonable ρ̄ is absolutely irreducible as a four-dimensional representation (BCGP25 Hypothesis 6.3.1 (1)): a k̄-reducible image outside every proper parabolic preserves an orthogonal decomposition V₁ ⊕ V₂ into non-degenerate planes over k̄, so lies in `GL₂ ×_{det} GL₂`, which contains a maximal torus of GSp₄ through each semisimple h; then 𝔷_h lies in 𝔤𝔩₂ ⊕ 𝔤𝔩₂, which is orthogonal to the H-stable summand V₁ ⊗ V₂ of 𝔰𝔭₄, and (b) fails for a simple submodule of the dual of that summand." Add the Check: "H = SL₂(k) × SL₂(k) on V₁ ⊕ V₂ lies in no proper parabolic and has H⁰(H, 𝔰𝔭₄^∨) = 0, but (b) fails for V₁ ⊗ V₂; it is not reasonable." In 5.4 (1) write "ρ̄ is GSp₄-reasonable (5.2), hence absolutely irreducible". Tested on the witness: (b) fails there, so the repaired implication holds.

Round 2. All fourteen round-1 findings are repaired at this head (section "Round-1 findings" below). The fresh pass has three new findings: S01 (P2), S02 (P2), S03 (P3).

## Round-1 findings

| Id | Status | Repaired passage (README line) and witness |
|---|---|---|
| 1a/F01 | repaired | `:591` "if moreover ζ_p ∈ LF′ only when ζ_p ∈ L"; Check `:595` recomputed: h² = (g, g), eigenvalues ±√2, ±√3, H¹(H, A) = 𝔽₅ |
| 1a/F02 | repaired | `:473` "two dyadic places of degree 4 (d = 8 …) and q = 7"; 17 + 17 + 5 − 2 = 37, g = 1, 38 = 17 + 7 + 14 |
| 1a/F03, 1b/F01 | repaired | `:211` "if `ρ̄|G_{F·L⁺}` is absolutely irreducible, then ψ ≠ 0"; dihedral Check `:219`; Correction `:764` |
| 1a/F04 | repaired | `:619` "regular algebraic … or of weight 2 in the sense of BCGP25 Definition 1.8.16"; contract `:115`; plan gap has the same text |
| 1a/F05 | repaired | `:713` "`(R_{S_{1,π}})_red ≅ (T_{S_{1,π}})_red`"; Check `:722`: T/(z²) = Λ[z]/(z², uz) |
| 1a/F06 | repaired | `:698` "Nothing is claimed about the dimension of R^·_∞ itself"; 10#S + 4d + g = t + 11#S − 1 recomputed (39 = 39) |
| 1a/F07 | repaired | `:106` "allows every prime p, including 2"; supplier §5.5 says "for any prime `p` and in either characteristic" |
| 1a/F08 | repaired | `:650–652` three Checks on B = O⟦x, y⟧/(xy) |
| 1a/F09 | repaired | `:191` "vanishes when `Hom_{G_F}(ρ̄, ρ̄ ⊗ ε̄) = 0`"; RAR⁻¹ = −A recomputed |
| 1b/F02 | repaired | new 3.6 (`:406–423`); supplier §4.2 item 3 has the same freeness hypothesis in weaker form |
| 1b/F03 | repaired | `:99` gap:two-adic-polarized-presentation, same slug in the plan, supplier §8.4 exists |
| 1b/F04 | repaired | `:92–93` two gaps, both in the plan |
| 1b/F05 | repaired | `:344`, `:469` cite §2.13, whose text is "reduced, flat and a local complete intersection of pure relative dimension `d²`" |

No repair introduced an error that I could find; the repairs' new statements are rows 5.2, 1.4, 3.6, 6.2, 6.3 of the table below.

## The pass: table of targets

`Suggested.lean` has no declaration (module docstring and an empty namespace), so the declaration table is empty; the `#check` audit has nothing to elaborate and nothing changed. README targets:

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, Frobenius | p = 7, q = 2 | 2⁻¹ ≡ 4 mod 7 | ok |
| Conventions, ℚ₃ characters | O = ℤ₂ | ℚ₃×(2) = C₂ × ℤ₂; ℤ₂[C₂] = ℤ₂[u]/(u² + 2u); h² = 1 | ok |
| dim Λ | n = 2, d = 2 split | (ℤ₂×)⁴, 1 + 4 = 5 | ok |
| 1.1 torsor | n = 4, #T = 3; T = ∅ | 17·3 − 1 = 50; trivial | ok |
| 1.1 conjugation by (1, a) | γ = (B, b)j | (1,a)γ(1,a)⁻¹ = (a⁻¹B, b)j; (µ,1): (µ²B, b)j | ok |
| 1.1 Check 4 | global kernel k → H¹(ad r̄) | H⁰(𝔤_n) = {(x, 0)}, so the kernel is one-dimensional for every n | true; "n even" not needed (note) |
| 1.2(1) µ_v | B = 1₂, Ψ₂ | X·B + ᵗ(XB) = B solvable iff B alternating | ok |
| 1.2(2) h³ | p = 2 | j: X ↦ −ᵗX, scalars fixed, ρ̄ irreducible: 1 | ok |
| 1.2(3)–(4) | n = d = 2, #T = 3, q = 5 | χ = −5, h¹ = 0 + 1 − 1 + 5 = 5 = g | ok; Tho17 Corollary 2.14 read |
| 1.3 (1)⇔(3)⇔(U) | H = 1; S₃ ⊂ GL₂(𝔽₂) | U = ad⁰; span 𝔽₂[A] of dimension 2, U ≅ V simple (no trivial submodule since tr A = 1) | ok |
| 1.3 A₅ | Steinberg, 𝔽₂ | ad projective, H¹(ad/k) ≅ H²(k) = 𝔽₂ | ok |
| 1.3 versus relaxed adequacy | k ⊇ eigenvalues | U_k ⊗ k̄ = U | ok |
| 1.4 membership | n even, n odd, v | 2, v ∤ 2 | pairing = n·(Hilbert symbol); both extensions unramified off 2; µ_v = 0 at split v | ok |
| 1.4 m | F⁺ ∌ √2; ℚ(√2); ℚ(√5) | m = 3; m = 4, degree 4; m = 3 | ok |
| 2.1 Check 1 | K, I ⊂ GL₂(ℤ₂) | 96/32 = 3, 32/16 = 2; disc of F = 105² so F/F⁺ unramified | ok |
| 2.1 Check 2 | X² − X + 2 | 27² − 27 + 2 = 704 = 22·32, 6² − 6 + 2 = 32 | ok |
| 2.1 twist | n = 1, 2 | (w₀ν)⁻¹(u) = ∏u_i^{1−i}: 1; u₂⁻¹ | ok |
| 2.2(1) versus last Check | b₀ = 1 | −1 ∈ U(l^{1,1}) ∩ G(F⁺) if U_v ∋ −1 off 2, so b₀ = 1 is then not small; no contradiction | ok |
| 2.2 hypothesis | b₀ large | (−2)^n ≢ 0 mod ṽ^{b₀} for b₀ > ne: Iw(ṽ^{b₀,b₀}) torsion-free | hypothesis always satisfiable |
| 2.2(3) | F_ṽ ∋ µ₄ | ζ ↦ τ(ζ)^a reaches every torsion character | ok |
| 2.3 constants | λ = 0 | ∏_{i<n}(X − q^i): characters ε^{−i} | ok |
| 3.1 multiplier | n = 3, 4 | (−1)^{1−n}(−1)^n = −1 | ok |
| 3.2(a) | n = d = 2, #T = 3 | 19; h¹ − h² = −1; 18 − 14 = 4 | ok |
| 3.2(b) rank one | n = 1 | count d; class field theory 1 + d | consistent; (★), (C) not verified |
| 3.3 | sign of ν ∘ r_m | −1 versus +1 at c_v, equal mod 2 | S02 |
| 3.5 Check 2 | n = 1, q ≡ 1 mod 4 | lifts through k×(2) | ok |
| 3.6 | Q = ∅; n = 2, d_ṽ = 1; q_ṽ = 17, 3 | identity; rank 1; ℤ/16, ℤ/2 | ok |
| 4.1 | F′ = F′⁺(√−1) | i ∈ F′⁺_v, degrees even; nd still ≡ 0 mod 4 | ok |
| 4.2 | q = j = 0; dim R_∞ = dim S_∞ + 1 | H free over Λ; depth ≤ dim S_∞ | ok; supplier §5.5 hypothesis "local map S → A" holds for S⁰_∞ |
| 4.3 | n = d = 2; degree 4 | 24 = 24; 38 = 38; q = 6: 25 = 25 | ok |
| 4.5 | Spec R_X | Spec R_{S_1} ∩ C_X ⊂ V(a_∞) ∩ C_X ⊂ Supp H_1 ⊂ Spec R_{S_1}: equality, not circular | ok |
| 4.7 | restriction to L | unramified at v′₁, unipotent at R′, ordinary above 2; finiteness is insensitive to nilpotents | ok |
| 4.8 | no smallness assumed | inverse limit of reduced rings reduced; classical points map to T(U(l^∞)) through S_λ(U, O) ⊗ O/ϖ^r ↪ S_λ(U, O/ϖ^r) | ok |
| 5.1 | #T = 1, 3; p = 2 | 10; 32; conjugacy criterion valid for every p | ok |
| 5.2 | SL₂(𝔽₅) ≀ C₂; torus; SL₂ × SL₂ | reasonable over F, not over F(ζ₅); (a) fails; (b) fails | ok; S03 |
| 5.2 vast ⇒ reasonable | h with four eigenvalues | W^h ≠ 0 and w kills (h − 1)𝔰𝔭₄, so w ≠ 0 on 𝔷_h | ok |
| 5.3 | q larger than the dual Selmer rank | L_v^⊥ ⊂ unramified classes, padding cannot enlarge | ok; WHI22 Proposition 3.18 read |
| 5.4 (6) | q ≡ 1; unipotent h over 𝔽₃ | ratio 1 = q; Z = 2E₁₂ + E₄₃ invariant | ok |
| 5.6 | T = Λ[N]/(N²) | not reduced, all points "classical" | S01 |
| 6.1 | dimensions | 1 + 10 + 6 = 17; 14 over Λ_v | ok |
| 6.2 | F⁺ = ℚ, #S = 3, t = 7; p = 3 | g = 5, 39 = 39; χ₁ ≠ χ₂^{±1} impossible in µ₃, possible in µ₉ | ok |
| 6.3 (iii)–(iv) | component through Z | the p-factors of a component containing Z are `R^{△,π}_v`; dimensions equal | ok |
| 6.4 | — | follows from 6.3 and supplier §4.1 | ok |

## Dependency check

Output of the `gate --depcheck … --movable` command of the brief: `depcheck: 236 roadmaps, 2150 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` changes only files under the package folder (README.md, design/plan.json, four reports).

## Verified sound

- Declarations read: 0 (the Lean file states none; its docstring names seven non-statable headlines, each with the missing carrier; none is statable at the pins, which have no deformation rings, automorphic representations or Hida modules). No padding, no `set_option`, single `import Mathlib`.
- Targets read: 31 (1.1–1.4, 2.1–2.3, 3.1–3.6, 4.1–4.8, 5.1–5.6, 6.1–6.4), every line of the README.
- Checks and formulas tested by computation: the 43 rows of the table above, each with its values.
- Sibling citations checked at the open heads: 83 section or target headings in twelve suppliers, all present (LocalGaloisDeformationRings §§1.3, 1.4, 1.9, 1.17, 2.13, 2.17, 2.22, 2.23, 2.24, 2.29, F.2.6, 6.24, 6.27, 6.29, 6.35; GlobalGaloisDeformations §§3.3, 4.2, 4.8–4.11, 8.1–8.4; DeformationAndDerivedPatchingAlgebra §§1.12, 4.1, 4.2, 4.6, 5.2–5.5, 6.1, 6.3, 6.5, 6.7, 8.2–8.5, 9.6; PotentialAutomorphyInfrastructurePartII §§0.2, 0.9, 1.3, 3.1, 3.2, 3.5, 3.6, 3.9, 3.11, 4.1, 4.2, 4.4, 4.6, 5.2, 5.4; AutomorphicFormsOnReductiveGroups §§7.4, 7.5; ArithmeticGaloisRepresentations §§7.4, 7.5, 7.9, 7.11; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.3, AG2.5 and the four named targets; PotentialAutomorphyInfrastructure §§2.5, 3.44, 3.47; PotentialModularityAndCompatibleSystems §2.16; SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.2, SR.3.4; ModularityAndLanglandsExtensions §3.9; AutomorphicBundles Layer 12, §§12.11–12.13). Statements compared with the README's contract for §§2.13, 2.22, 2.24, 2.29, 6.24, 6.35, 5.4, 4.1, 4.2, 4.4, 5.5 (first part), 4.1, 6.5 and §7.11.
- Declared gaps: nine slugs, identical in the README and the plan's `gaps`, each with a named supplier and an existing section; none asks for what its supplier already states (§2.17 covers only four distinct eigenvalues; §6.24 only trivial residual representation). S01 concerns the precision of one `needs`.
- Pinned declarations: `Matrix.trace`, `Matrix.trace_one`, `Module.End.IsSemisimple`, `Submodule.span`, `Matrix.symplecticGroup` (carrier `A * J l R * Aᵀ = J l R`), `LieAlgebra.Symplectic.sp`, `groupCohomology`, `TauCeti.completedGroupAlgebra`: all present in the cited files.
- Locators verified in the cached texts: 59 (BCGP25 Lemma 5.3.1, Definitions 5.3.2–5.3.3, Remark 5.3.4, Definition 5.5.2, Lemma 5.5.3, Proposition 5.5.6, Hypotheses 5.7.1 and 5.7.5, Lemma 5.7.12, Definition 5.7.13, Theorem 5.7.14, Remark 5.7.15, Lemma 6.2.6, Hypothesis 6.3.1, Remarks 6.3.2–6.3.3, Theorem 6.3.4; WHI22 Lemma 3.14, Definitions 3.15 and 3.19, Lemmas 3.16 and 3.20, Proposition 3.18, Propositions 7.5–7.6, Theorems 7.7–7.8, Lemma 7.10; Tho17 Lemmas 2.2, 2.4, 2.11, 2.12, 2.13, 2.15–2.17, Corollary 2.14, Definition 2.20, Proposition 2.21, proof of Theorem 4.2; Ger19 Definitions 2.3.1, 2.3.2, 2.3.4, 2.4.1–2.4.2, Lemmas 2.3.3, 2.4.4, Corollary 2.5.4, Propositions 2.7.2–2.7.4, Corollary 3.1.4; Tho12 Propositions 5.9, 5.12, Lemmas 5.10–5.11 with pages 24–30; KT17 Proposition 3.1; BCGP21 Theorem 7.9.4).
- Ownership against the open pull requests: GSp₄-reasonableness, the dyadic ordinary Hecke algebra and the ordinary problem S_χ are stated by no other open roadmap; GSp4NonregularModularityLifting cites §§1, 4, 5 and 6.3–6.4 of this roadmap, all of which exist. The overlaps list reports no pull request changing this roadmap and no dropped id.
- Policy: no pull-request number, no process narrative, no `lemma`, every target has a locator.

## Not verifiable

- 3.2(b): the inputs (★) and (C) at an unprepared place of T ∖ (R ∪ S_2) are declared part of the target and are not in any source; neither proved nor refuted here. 4.8 depends on them; 4.5 and 4.7 do not.
- The mathematical content of the nine declared gaps (accepted as contracts).
- 5.4, last API bullet: preservation of seed condition (4) (unique component) under solvable base change was not checked beyond the image and reasonableness clauses.
- 3.6 at l = 2: the statements of Tho12 Propositions 5.9 and 5.12 were located and their hypotheses read; the proofs were not rechecked for the residue characteristic 2.
- BLGHT11 Lemma 3.3, Tay08 Lemma 2.3, BLGGT14 Lemma 1.2.3, CHT08 Lemmas 2.2.11–2.3.5, Sho18 Theorems 2.5 and 4.6, KW09 Lemma 9.4 and BCGNT25 Lemma 3.2.4 were not opened.
- No Lean was elaborated (read-only pass; the file has no declaration).

## Source issues

- **Gap** in BCGP25 at Theorem 6.3.4, printed p. 148: the source says a nilpotent kernel identifies the reduced deformation ring with the selected Hecke quotient; it should identify the two reduced rings, the tensor-product quotient not being shown reduced; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.5.3, printed p. 125: the source says the scalar class bounds the dual Selmer group below for every global problem; it should assume the residual representation stays absolutely irreducible over the quadratic extension; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.5.3, proof, printed p. 125: the source says one may assume the totally real field lies between two consecutive real 2-power cyclotomic fields; it should take the least level not contained in it; affects the proof.
- **Misprint** in BCGP25 at Proposition 5.5.6 (i), printed p. 126: the source says the sign condition is on µ; it should be on the multiplier χ of the problem (the same slip is in Tho17 Proposition 2.21 (i), p. 14); affects nothing.
- **Misprint** in BCGP25 at §6.3, paragraph before the definition of S_1, printed p. 147: the source says the unramified characters take the values α_p, β_p at Frobenius at v; it should be α_v, β_v; affects nothing.
- **Gap** in BCGP25 at §6.3, paragraph before Hypothesis 6.3.1, printed p. 146: the source says the Galois representation of the seed, allowed to have regular weight, comes from Theorem 1.8.17; it should cite Theorem 1.8.13 for regular weight; affects nothing.
- **Gap** in WHI22 at Proposition 3.18, printed p. 22 (arXiv v3): the source says condition 2 of Definition 3.15 and the conditional H¹ vanishing suffice; it should also assume the H⁰ vanishing required by Lemma 3.16, used in the proof; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "13242d494db4a8d31330fe687585b1a3d0706219", "job": "RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2b", "model": "fable", "worker": "chris-x8"} -->
