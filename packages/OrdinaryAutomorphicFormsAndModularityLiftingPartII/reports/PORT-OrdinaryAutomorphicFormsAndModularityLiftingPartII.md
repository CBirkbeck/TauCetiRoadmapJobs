# PORT-OrdinaryAutomorphicFormsAndModularityLiftingPartII

## Branch and commit

- Branch: `roadmap/ordinary-automorphic-forms-and-modularity-lifting-part-ii`, created from `45f58db`.
- Head commit: `7bc42939`, "OrdinaryAutomorphicFormsAndModularityLiftingPartII: roadmap (README, Suggested.lean, metadata)".
- Folder: `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder is changed.

## Build

`lake build TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII.Suggested`:

    Build completed successfully (18239 jobs).

Warning count: 0 Lean diagnostics in the module. There is no `sorry` warning because the file declares nothing. Lake prints one advisory twice, once for the build step and once for the `irArts` step: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". The 84 Suggested.lean files on main that open with plain `import Mathlib` get the same advisory. I left it alone because the brief and the gate fix the import line as `import Mathlib`.

## Gate

    gate OrdinaryAutomorphicFormsAndModularityLiftingPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency direction

    depcheck: 219 roadmaps, 1950 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

Adds the roadmap *Ordinary automorphic forms and ordinary modularity lifting, part II — dyadic unitary and symplectic ordinary lifting*. It continues OrdinaryAutomorphicFormsAndModularityLifting, which stops at rank-two ordinary theory at odd primes. This part builds the two higher-rank ordinary R = T theorems that Boxer–Calegari–Gee–Pilloni use to prove modularity of abelian surfaces.

The first is the dyadic unitary theorem (BCGP25 Theorem 5.7.14). For a residual ρ̄ : G_F → GL_n(𝔽̄₂) with nearly adequate image that comes from an ordinary RACSDC representation, the ordinary polarized deformation ring is finite over the torsion weight algebra Λ = O⟦T(l)⟧. Under the dimension bound of §3.2(b), its reduced quotient is the localized universal ordinary Hecke algebra of a definite unitary group.

The second is the symplectic theorem for p > 2 (BCGP25 Theorem 6.3.4). The deformation ring selected by an ordinary GSp₄ seed is finite over the GSp₄ weight algebra, and its map onto the Hida–Hecke algebra has nilpotent kernel.

To get there the roadmap develops:

- polarized deformation theory at p = 2 over a weight algebra: strict equivalence by the full kernel Ĝ_n, Thorne's complex with its one-dimensional H³, and the unavoidable scalar dual Selmer class;
- near adequacy and its identification with relaxed adequacy;
- Geraghty's Hida theory for definite unitary groups at l = 2;
- ring–module patching over a weight algebra with torsion;
- GSp₄-reasonable residual representations with Whitmore's Taylor–Wiles places at semisimple Frobenius, and the ordinary GSp₄ seed with its selected component.

The two theorems are proved separately because Sp₄(𝔽₃) ⊂ GL₄(𝔽₃) is not adequate. The source errors met on the way (an h³ omitted in BCGP25 §5.4, a dimension misprint and a proof gap in Lemma 5.7.7, a missing fixed-vector hypothesis in Proposition 5.7.9, and others) are corrected in a dedicated section. The remaining inputs of §3.2(b) are owned here as targets.

## Roadmaps this one depends on that are still pull requests

Every supplier is an open pull request and earlier in the merge order. None is on main.

- AutomorphicFormsOnReductiveGroups
- ArithmeticGaloisRepresentations
- LocalGaloisDeformationRings
- GlobalGaloisDeformations
- DeformationAndDerivedPatchingAlgebra
- AutomorphicGaloisRepresentationsPartII
- SmoothRepresentationsOfLocalGroups
- PotentialModularityAndCompatibleSystems
- PotentialAutomorphyInfrastructure
- ModularityAndLanglandsExtensions
- AutomorphicBundles
- PotentialAutomorphyInfrastructurePartII

The base roadmap OrdinaryAutomorphicFormsAndModularityLifting is also an open pull request. It is named in the Summary as the roadmap this Part II continues; none of its targets is consumed.

EndoscopicTransferAndUnitaryTraceComparison §13.2 is named only in Scope as the owner of a downstream result, not as a supplier. GSp4NonregularModularityLifting and AbelianSurfacesModularity are later in the order and are named only as downstream consumers.

Ids that only an open revision defines: none.

Every cited section was checked at its open head with `roadmaps show`:

- PotentialAutomorphyInfrastructurePartII §§0.2, 0.9, 1.3, 3.1, 3.2, 3.5, 3.6, 3.9, 3.11, 4.1, 4.2, 4.4, 4.6, 5.2, 5.4
- LocalGaloisDeformationRings §§F.2.6, 1.3, 1.4, 1.9, 1.17, 2.13, 2.17, 2.22, 2.23, 2.24, 2.29, 6.24, 6.27, 6.29, 6.35
- GlobalGaloisDeformations §§3.3, 4.2, 4.8–4.11, 8.1–8.4
- DeformationAndDerivedPatchingAlgebra §§1.12, 4.1, 4.2, 4.6, 5.2–5.5, 6.1, 6.3, 6.5, 6.7, 8.2–8.5, 9.6
- ArithmeticGaloisRepresentations §§7.4, 7.5, 7.9, 7.11
- AutomorphicFormsOnReductiveGroups §§7.4, 7.5
- PotentialAutomorphyInfrastructure §§2.5, 3.44, 3.47
- PotentialModularityAndCompatibleSystems §2.16
- SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.2, SR.3.4
- ModularityAndLanglandsExtensions §3.9
- AutomorphicBundles Layer 12, §§12.11–12.13
- AutomorphicGaloisRepresentationsPartII: Layers AG2.2, AG2.3 and AG2.5 with their named targets, and *GSp₄ construction and normalization*
- EndoscopicTransferAndUnitaryTraceComparison §13.2

`roadmaps resolve` on the ported README reports no citation and no Lean name found nowhere.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` declares nothing, and its module docstring explains why no headline is statable at the pins. I kept it unchanged. I re-checked that judgement at the pins:

- Neither Mathlib `1b1ccf4` nor Tau Ceti `2fd255d` has deformation rings, Galois groups unramified outside S with decomposition groups, local-condition Selmer groups, Hecke or Hida algebras of unitary or Hilbert–Siegel forms, RACSDC or GSp₄ automorphic carriers, or GSp₄ itself. Mathlib has only `Matrix.symplecticGroup`, which is Sp.
- Every headline (README 1.2(4), 3.2(b), 4.7, 4.8, 5.3, 6.3, 6.4) is therefore unstatable without a free `Prop` or an ad hoc encoding.
- Near adequacy (1.3) and reasonableness (5.2) are statable on finite matrix groups, but they are lemma-level targets, not headlines.

The `#check @name` binder audit has nothing to elaborate: there are 0 declarations. No signature changed.

## Supplier replacements and duplication removals

No target restated a supplier's result, so no target was deleted. Three in-layer sentences that restated ownership already recorded in Scope and ownership were removed or rewritten:

- **2.1 API.** Deleted the bullet "For an odd prime l in place of 2 the construction is that of PotentialAutomorphyInfrastructurePartII §3.9". It is not an API fact of the l = 2 object, and Scope and the Layer 2 introduction already record the l-odd owner.
- **2.3 fourth Check.** Deleted the sentence "PotentialAutomorphyInfrastructurePartII §3.6 states neither case at l = 2". The target statement already says in one clause how it differs.
- **1.3.** Replaced "… are ArithmeticGaloisRepresentations §7.9 and are not repeated" with one clause saying how the kept variant differs. The trace condition runs over simple submodules of the full ad ⊗ k̄, as relaxed adequacy needs, not of ad⁰ ⊗ k̄. Since U ⊂ ad⁰ ⊗ k̄, both forms are equivalent to U = 0, including when p | dim V.

Duplication sweep by object, over main, the open roadmap pull requests at their heads (`roadmaps grep` / `roadmaps show`) and the board packages:

| Object | Candidate owners searched | Verdict |
| --- | --- | --- |
| Polarized deformation over Λ at p = 2, strict equivalence by Ĝ_n | GlobalGaloisDeformations §§8.1–8.4: O-coefficients, p odd, GL_n-strict, n²\|T\| framings. PotentialAutomorphyInfrastructurePartII §4.4: O-coefficient presentation at p = 2. No other hit for Ĝ_n deformation theory. | Owned here, as the Λ-coefficient extension. Scope says how it differs. |
| Thorne complex h³ = 1, the unavoidable class ψ | GlobalGaloisDeformations §8.3 (general h³ formula), PotentialAutomorphyInfrastructurePartII §4.4 (uses h³ = 1); no hit for the least-m cyclotomic class | Owned here (1.4). |
| Near adequacy ⇔ relaxed adequacy | ArithmeticGaloisRepresentations §7.9 (ad⁰ trace ⇔ spanning), PotentialAutomorphyInfrastructurePartII §5.4 (relaxed adequacy, no BCGP comparison) | Owned here (1.3). AbelianSurfacesModularity, which is later, reads the same comparison off §7.9 and §5.4. |
| Hida theory for definite unitary groups at l = 2 | PotentialAutomorphyInfrastructurePartII §§3.2, 3.9, 3.11 (l odd); HigherHidaAndColemanTheory, a board package (Siegel varieties over ℚ, no unitary or Hilbert theory); PadicFamilies | Owned here (Layer 2). |
| Uniform local fixed vectors and sufficiently deep levels (BCGP25 Lemma 5.7.12, Definition 5.7.13) | No other hit | Owned here (3.4–3.5). |
| Patching over a weight algebra with torsion | DeformationAndDerivedPatchingAlgebra §5.5 and Layer 8 (regular, or power-series, Λ) | Owned here (4.2), with a reduction to Λ⁰. |
| GSp₄-reasonableness, Whitmore Taylor–Wiles places | ArithmeticGaloisRepresentations §7.11 (enormous, vast, tidy only; no reasonableness at its head). AbelianSurfacesModularity asks ArithmeticGaloisRepresentations for it through a gap contract (see Unresolved). | Owned here (5.2–5.3). |
| Hilbert–Siegel Hida module and its classicality | AutomorphicBundles Layer 12 (classical Hecke action only), AutomorphicBundlesPartII (no Hida module), HigherHidaAndColemanTheory (Siegel over ℚ only) | Stays a gap contract on AutomorphicBundles. |
| BCGP25 Theorems 5.7.14 and 6.3.4 | GSp4NonregularModularityLifting cites them from this roadmap; no other owner | Owned here. |

Ownership against open pull requests was checked with the `roadmaps` tools over every open head, not only the 187 checked-out directories.

## Fixes made as an upstream reviewer

1. **Process wording removed:**
   - "formerly B5.10–B5.12" in the AutomorphicBundles contract;
   - "was read at the pinned Mathlib/Tau Ceti of the content repository";
   - "declares the same slug", "the supplier's answer";
   - "defined nowhere else" (Scope);
   - "which it otherwise has no owner for" (Downstream consumers).
2. **2.2(1), a degenerate case.** The Hecke algebra was called a finite *faithful* O⟦T(l^{b₀})⟧-algebra unconditionally. That is false when S^{ord} = 0, because the zero ring is not faithful. Ger19 Corollary 2.5.4 (preprint p. 17, cached text line 749) omits the case r = 0 of its Proposition 2.5.3. I added the nonvanishing hypothesis, a negative-control Check (r = 0; constants are not ordinary for n ≥ 2 since U^j acts by q^{j(n−j)}), and a Corrections entry.
3. **1.3, a gap in the route.** The deduction "nearly adequate ⇔ relaxed-adequate" compared a condition over k̄ with relaxed adequacy's condition over k without an argument. I added the k-rational step: U_k ⊗ k̄ = U because the e_{g,α} are defined over k when k contains the eigenvalues.
4. **LocalGaloisDeformationRings §6.35 contract.** At the supplier's head, §6.35 opens with a finite-flatness hypothesis. The contract now says it consumes the second assertion, BCGP25 Lemma 6.2.6, which has no such hypothesis (checked in the cached BCGP25 text, lines 6596–6598).
5. **Tau Ceti contract.** It now records what `TauCeti.completedGroupAlgebra` assumes at the pin: `[CommRing R]`, `[Group Γ] [TopologicalSpace Γ]`, no topological-group axiom and no completeness. It also says those properties are supplied in each use.
6. **Source hypotheses named.** "Hypothesis 5.7.1", "Hypothesis 5.7.5" and "Theorem 5.7.14" are prefixed by BCGP25 where first used in a layer.
7. **Scope.** The double contract gap:two-adic-polarized-presentation (also requested by PotentialAutomorphyInfrastructurePartII) is now stated as one provision by GlobalGaloisDeformations covering both forms.

## Adversarial mathematics pass

The numerical values below were computed by a script in the job's scratch area, by matrix arithmetic over 𝔽₂, 𝔽₃, 𝔽₅ and ℤ/2^r, or by hand where noted.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: geometric Frobenius | p = 7, q_v = 2 | ε(Art(ϖ)) = 2⁻¹ ≡ 4 mod 7 (computed); arithmetic convention gives 2 | Pinned | none |
| Conventions: ad versus ad⁰ smoothness | ℚ₃, O = ℤ₂, n = 1 | ℚ₃×(2) = C₂ × ℤ₂; R = ℤ₂⟦u,X⟧/(u² + 2u); special fibre u² = 0, u ≠ 0; dim H⁰(ℚ₃, μ₂) = 1; ad⁰ = 0 | ad needed | none |
| Conventions: multiplier and dim Λ | n = 3, 4; n = 2 with F⁺ real quadratic, 2 split | ε^{−2}δ(c) = 1·(−1) = −1; ε^{−3}(c) = −1; T(l) = (ℤ₂×)⁴, rank 4, dim Λ = 5 = 1 + nd | Holds | none |
| 1.1 framing torsor | n = 4, #T = 3; T = ∅; A = 𝔽₂[ε] | (16+1)·3 − 1 = 50 versus GL count 47 (computed); centralizer {(µ, µ²)} of dimension 1; (x + yε)² = x², so 1 + ε is not a square; (1, a) conjugates (B,β)j to (a⁻¹B, β)j and (µ, 1) to (µ²B, β)j, so µ² = a⁻¹ | Holds | none |
| 1.2(1)/(5) real place | B = 1₂ and Ψ₂ over 𝔽₂; n = 3 | Y + ᵗY has zero diagonal, so 1₂ ∉ (1+c)ad; Y = diag(1,0) gives Y + ΨᵗYΨ = 1₂; 1₃ ∉ (1+c)ad | µ_v of dimension 1 / 0; surjective for n = 3 | none |
| 1.2(2)–(4) counts | n = d = 2, #T = 3, q = 5; h³ = 0 control | χ = −5, h¹ = 1 − 1 + 5 = 5 = g; with h³ = 0, h¹ = 6 = g + 1 | Holds | none |
| 1.2 Check, p = 3 dihedral h³ ≥ 1 | σ with R = [[0,−1],[1,0]], S = diag(1,−1), A = [[0,1],[1,0]] over 𝔽₃; F = ℚ(√−23, √−47) | RAR⁻¹ = SAS⁻¹ = −A (computed); J·(−ᵗJ⁻¹) = I so u² = 1; disc product 1168561 = 1081²; −23, −47, 1081 ≡ 1 mod 8 and ≡ 1 mod 3 | Holds | none |
| 1.3 equivalences | V = 0; H = {1} with n = 1, 2; GL₂(𝔽₂) | span/End dimensions 0/0, 1/1, 1/4; GL₂(𝔽₂): 6 elements, 3 semisimple, span dimension 2 (computed); U = {[[a,b],[a+b,a]]}, A has eigenvalues ω, ω² on U and the involution swaps the eigenlines, so U is simple | Both directions hold; ad and ad⁰ forms both equivalent to U = 0 | k-rational route step added; variant clause corrected |
| 1.4 surviving class | F⁺ = ℚ(√2), ℚ(√5), other F⁺ ∌ √2; n = 2 | least m = 4, 3, 3; ℚ(√5) ⊄ K⁺_m for every m; tr(1₂) = 0 in char 2, so the pairing on Δ_v vanishes; dihedral ρ̄ induced from G_{FL⁺}: ψ = ∂ diag(1,0) | Holds; nonvanishing hypothesis needed | none |
| 2.1 depth zero | n = 2, q = 2, λ = 0 | spherical index 96/32 = 3 mod 4 and 1536/512 = 3 mod 8; Iwahori index 32/16 = 2; depth 1 and 2 mod 8: 512/256 = 2, 256/128 = 2 (computed) | c ≥ 1 needed | none |
| 2.1 projector | X² − X + 2 | roots mod 32: 6 and 27 (computed); 27² − 27 + 2 = 704 = 22·32; difference 21, a unit; e = diag(1,0) | e ∉ T^T | none |
| 2.1 normalization | n = 2, λ = (1,0), j = 1, 2 | (w₀λ)(α^1) = ϖ⁰ = 1; (w₀λ)(α^2) = ϖ¹, a non-unit; twist for n = 1: exponent 0 | Holds | one redundant API bullet deleted |
| 2.2(1) faithfulness | r = 0; −1_n ∈ T(l) with b₀ = 1 | zero ring: kernel of O⟦T(l^{b₀})⟧ → 0 is everything; −1_n ∈ U(l^{1,1}) makes that level not sufficiently small, while −1 ∉ T(l^b) for b ≥ 2 (ℤ₂: −1 ≢ 1 mod 4); ε₀ exponent dn(n−1)/2 = 2 (n = d = 2) and 6 (n = 4, d = 1), both even | Nonvanishing hypothesis was missing | **fixed**, Check and Correction added |
| 2.2 components of Λ | two ℚ₂ places, n = 2 | O[C₂⁴]⟦w₁..w₄⟧: 16 components, each of dimension 5 | Holds | none |
| 2.3 sign (ii′) | n = 1, 2 | n = 1: symmetric form forces µ(c) = −1, i.e. δ; δ² = 1 is excluded; n = 2: ε⁻¹(c) = −1 and ε⁻¹δ(c) = +1, both ≡ 1 mod 2 | Holds | one redundant Check sentence deleted |
| 3.1 multiplier, residual conjugacy | n = 3, 4; k of characteristic 2 versus odd | values at c: −1, −1; k× = (k×)² in characteristic 2 | Holds | none |
| 3.2(a) | n = d = 2, #T = 3; n = 1, d = 3, #T = 2 | (local, framed, unframed) = (19, 18, 4) and (6, 6, 3) (computed); class field theory gives 1 + d = 4 > 3 in rank one | Count gives nd only | none |
| 3.2(b) determinant multiplier | x = (g,a)j | ν(det x) = −aⁿ = (−1)^{n+1}ν(x)ⁿ; value at c_v (−1)ⁿ(−1)^{n+1} = −1; det is a homomorphism (both sides (aⁿ det g⁻¹, aⁿ)); c ∈ (ℤ₂×)² root of unity, so c = 1 | Holds; (★) and (C) remain targets | none |
| 3.3 Hecke-valued representation | ramified ρ̄ at a hyperspecial v ∈ T ∖ (R ∪ S₂) | unramified lifts: 0, residual: ramified ⇒ no m | Fixed-vector hypothesis needed (kept) | none |
| 3.4–3.5 levels | ℚ₅, n = 1, order-4 tame character | 5 ≡ 1 mod 4; conductor 1 versus seed conductor 0; fixed dimensions under O× and 1 + ϖO: 0 and 1 | Holds | none |
| 3.6 Taylor–Wiles levels | n = 2, d_ṽ = 1; q_ṽ = 17, 3 | projection rank 1 versus Iwahori rank 2; Δ_ṽ = ℤ/16, ℤ/2 | Holds | none |
| 4.1 unipotence clause | ψ ⊕ 1 with ψ(σ) = −1 | (X+1)(X−1) = X² − 1 versus (X−1)² = X² − 2X + 1; equal mod 2 | Restricted to original lifts (kept) | none |
| 4.2 torsion patching | q = j = 0; Λ = O[C₂⁴]⟦w⟧; R = S⟦y⟧, H = S | rank over Λ⁰ 16; (1 − [−1])(1 + [−1]) = 0; depth = dim S < dim R | Holds; dimension hypothesis needed | none |
| 4.3 patched dimensions | n = 2, d = 8, two dyadic places of degree 4, #T = 3, q = 7, 8 | (dim R^loc, g, dim R_∞, dim S_∞) = (37, 1, 38, 38) and (37, 2, 39, 39) (computed) | Equal | none |
| 4.4 components | n = 2, one v ∈ R, s auxiliary components | S₁: 2s; S_χ: s | Holds | none |
| 4.5 Ihara support | the same prepared numbers | 38 − (7 + 14) = 17 = dim Λ | Holds | none |
| 4.6 auxiliary removal | R = ∅, two dyadic places | #T′ = 3; without S₂(L⁺): 1, no ordinary factor | Holds (correction kept) | none |
| 4.7 finiteness | Λ[u]/(u²) | rank 2, residual length 2 | Nilpotents allowed | none |
| 4.8 reduced R = T | a hypothetical component of dimension dim Λ − 1 = 4 | 4 < 5, no point above ℘_λ forced | Dimension hypothesis needed | none |
| 5.1 framing | #T = 0, 1, 3 | 0, 10, 32 (computed); GL₄ 47 | Holds | none |
| 5.2 reasonableness | swap example, p = 5; diagonal torus; p = 3 versus 2 | ord(2 mod 5) = 4, so h² = diag(2,3,2,3) has order 4 and h has order 8; squares mod 5 = {1,4}, so √2, √3 ∈ 𝔽₂₅ ∖ 𝔽₅; Cartan invariants of dimension 2; trace form 2(xx′+yy′) is nondegenerate for p = 3 and 0 for p = 2; vast ⇒ reasonable via (E1)–(E3) of ArithmeticGaloisRepresentations §7.11 at its head | Holds | none |
| 5.3 Taylor–Wiles places | h = I₄; q = 4, t ≤ 8 | N_v = 0, detection rank 0 | Holds | none |
| 5.4 seed, w₀ | p = 3, q_v = 7, 19; h = diag(U, U^{−t}) over 𝔽₃ | 19 ≡ 1 and 7 ≢ 1 mod 9; h³ = I, h·J·ᵗh = J, X ∈ 𝔰𝔭₄, [h,X] = 2E₁₂ + E₄₃, Z = h − h⁻¹ = 2E₁₂ + E₄₃ ∈ 𝔰𝔭₄ with [h,Z] = 0 (all computed) | Holds | none |
| 5.5 selection | B = O⟦x,y⟧/(xy) | seed (0,ϖ) ∈ V(x) ∖ V(y); (ϖ,0) ∉ V(x); x ↦ ε does not factor through B/(x) | Holds | none |
| 5.6 reducedness | Λ[N]/(N²) | N ≠ 0, N² = 0, acts on E² as a nonzero nilpotent | Contract needed | none |
| 6.1 dominance | F⁺_v = ℚ_p | 16 = 2 + 14 | Holds | none |
| 6.2 counts | (d, #S, t) = (1, 3, 7), (2, 4, 9) | (g, rel. dim R_{∞,π}, rel. dim S_∞) = (5, 39, 39) and (4, 52, 52) (computed); model O⟦x,y⟧/(ϖx, ϖy): depth 1, dim 2 | Holds | none |
| 6.3 nilpotents | T = Λ[z]/(z(z−u)) | T ⊗ B/(x) = Λ[z]/(z², uz), with z ≠ 0 and z² = 0 | Reduced-to-reduced form holds | none |
| 6.4 finiteness | F⁺ = ℚ | Λ = O⟦x,y⟧ | Holds | none |
| Suggested.lean | 0 declarations | — | Nothing to elaborate | none |

## Ownership and unresolved items

- **GSp₄-reasonableness has two would-be owners across roadmaps.** This roadmap owns it in 5.2 (GSp₄ case, with API and Checks), and GSp4NonregularModularityLifting consumes it from here. AbelianSurfacesModularity, which is later in the order (400 against 285), instead asks ArithmeticGaloisRepresentations for Whitmore's general reductive-G reasonableness through its contract gap:near-adequacy-reasonableness, and does not cite this roadmap. ArithmeticGaloisRepresentations defines no reasonableness at its head. The settlement belongs to those roadmaps: either AbelianSurfacesModularity cites this roadmap's 5.2, or ArithmeticGaloisRepresentations takes the general-G notion and 5.2 becomes its GSp₄ specialization by citation. I did not edit either.
- **Nine supplier contracts are acceptance conditions, not supplied results:**
  - GlobalGaloisDeformations: gap:two-adic-polarized-presentation;
  - LocalGaloisDeformationRings: gap:dyadic-flag-ring-dimension, gap:dyadic-flag-ring-special-fibre, gap:gsp4-semisimple-taylor-wiles-places;
  - SmoothRepresentationsOfLocalGroups: gap:inertial-types-and-block-levels;
  - AutomorphicGaloisRepresentationsPartII: gap:gsp4-galois-representations-totally-real;
  - AutomorphicBundles: gap:hilbert-siegel-hida-module-free, gap:hilbert-siegel-taylor-wiles-coinvariants, gap:hilbert-siegel-ordinary-classicality.

  None of the suppliers provides them at its head; the form matches main's use in FlagVarieties, IndexTheory and BelyiMaps.
- **3.2(b).** The inputs (★) and (C) are owned as targets and are in no source. 4.8 carries the dimension bound as a hypothesis.
- **The Lake module-system advisory** above, left as is.
- **Untrusted text.** No suspicious instruction was found in the package, the reviews, the supplier roadmaps or the cached sources.


Pull request: #2268 (roadmap/ordinary-automorphic-forms-and-modularity-lifting-part-ii at 7bc4293)
