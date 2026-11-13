<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12999#issuecomment-6849424817 -->
Red team round 2 pass a (claude) of c4e8cd3

Verdict: needs_changes

1. **F01** (P3) §2.2: surjectivity of f_D uses §1.6, which the *Needs:* line omits

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:663–670`,
   "Surjectivity of f_D is a separate input: it uses Ding Lemma 3.5(2) … and dévissage over the
   constituents … *Needs:* §2.1; LocallyAnalyticRepresentationsOfLocalGroups §1.7 …, §8.4 and §8.9 (2)".

   **Claim:** Lemma 3.5(2) and dévissage give surjectivity of f_D.

   **Witness:** f_D is onto exactly when ∂ : 𝒦_D ⊗ Ext¹(A,A) → Ext²(A,V), k ⊗ a ↦ k ∪ a, is injective.
   For a line L = E·a ⊂ `𝔈_{g′}` in place of 𝒦_D, ∂(a ⊗ a) = a ∪ a = 0 (the deformation δ(1 + ψε) lifts
   to ε³ = 0), so f_L is not onto. Transversality 𝒦_D ∩ `𝔈_{g′}` = 0 (§1.6) is used.

   **Repair:** replace the sentence and the Needs line by:

   > Surjectivity of f_D is a separate input. By the long exact sequence it is equivalent to injectivity
   > of the connecting map 𝒦_D ⊗ Ext¹_G(A,A) → Ext²_G(A,V), k ⊗ a ↦ k ∪ a. Compose with
   > Ext²_G(A,V) → ⊕_C Ext²_G(A,C), C running over the `C(I,s_{i,σ})`: writing the image of k_j (a basis
   > of 𝒦_D) in the lines Ext¹_G(A,C) = E·c_C as x_{j,C}c_C, the element Σ_j k_j ⊗ a_j maps to
   > (c_C ∪ Σ_j x_{j,C}a_j)_C. By Ding Lemma 3.5(2), c_C ∪ a = 0 only for a = 0, so Σ_j x_{j,C}a_j = 0 for
   > every C; the vectors (x_{j,C})_C are linearly independent because 𝒦_D ∩ `𝔈_{g′}` = 0 (§1.6 and the
   > exact sequence of LocallyAnalyticRepresentationsOfLocalGroups §8.12 (1)), hence every a_j = 0.
   > *Needs:* §§1.6, 2.1; LocallyAnalyticRepresentationsOfLocalGroups §1.7 (both long exact sequences),
   > §8.9 (1)–(2), §8.12 (1); Mathlib `LinearMap.quotKerEquivOfSurjective`.

   and add the Check: "For a line L ⊂ `𝔈_{g′}` the analogous push-forward is not onto (a ∪ a = 0), so the
   transversality of §1.6 is used." Tested on the witness: with 𝒦_D ∩ `𝔈_{g′}` = 0 the x_j are independent
   and the argument closes; for L ⊂ `𝔈_{g′}` all x_{j,C} = 0 and it correctly gives no conclusion. The same
   edit applies to §3.7's "the same constituent surjectivity input" (add §1.6 to its Needs).

2. **F02** (P3) §5.1 and the LocalGaloisDeformationRings contract: §1.23 is cited for arbitrary continuous characters

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:296–297`,
   "its rank-one case gives, for a continuous character δ_i of K^×, the ring `R_{δ_i}`", and
   README:1169–1170, "For a continuous character δ = δ_1 ⊠ ⋯ ⊠ δ_n … the rank-one rings `R_{δ_i}` of
   LocalGaloisDeformationRings §1.23".

   **Claim:** §1.23 supplies `R_{δ_i}` for every continuous δ_i.

   **Witness:** LocalGaloisDeformationRings §1.23 (open head, section heading "Deformation rings of
   (φ, Γ)-modules …") assumes "noncritical crystabelline D". For K = ℚ_p and δ = x ↦ exp(a·log x) on
   1 + 2pℤ_p with a ∉ ℤ, `R(δ)` is not de Rham (PhiGammaModulesAndIwasawaCohomology §7.4), so §1.23 does
   not apply.

   **Repair:** in README:296–299 write "its rank-one case gives the ring `R_1` ≅ `E⟦x_1,…,x_{d_K+1}⟧` of
   deformations of the trivial module `R_{K,E}`; for a continuous character δ_i of K^×, §5.1 defines
   `R_{δ_i}` by transport along the twist by δ_i." In README:1169–1170 write "define `R_{δ_i}` as the ring
   `R_1` of the trivial character (LocalGaloisDeformationRings §1.23 in rank one, where the trivial module
   is crystalline), with universal character δ_i·χ^univ: twisting by δ_i (tensor law of
   PhiGammaModulesAndIwasawaCohomology §7.1) identifies the deformations of 1 with those of δ_i." Tested
   on the witness: the trivial character is crystalline, so §1.23 applies, and δ·χ^univ deforms the
   non-de Rham δ; tangent space Hom(K^×, E), dimension 1 + d_K, unchanged.

3. **F03** (P3) §4.1: "subextensions of π_{1,σ} by Ker ⊗ A" reverses sub and quotient

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:1035–1037`,
   "let π⁻ and π⁺ be the tautological subextensions of `π_{1,σ}(φ,h)` by `Ker(t_{D_σ,F})` ⊗ A and by
   `Ker(t_{D_σ,G})` ⊗ A".

   **Claim:** π^± has subobject Ker ⊗ A and quotient `π_{1,σ}`, in the README's own usage "extension of
   (quotient) by (subobject)" (README:847–848, "tautological extension of `𝒦_{D,F_P}` ⊗ A by V").

   **Witness:** DING25 lines 2505–2506 take the extension of the kernel tensor π_alg by `π_{1,σ}`; the
   reversed object would have class in Ext¹_G(`π_{1,σ}`, Ker ⊗ A), and README:1038–1040 pushes forward
   along `π_{1,σ}` ↪ π⁻, which needs `π_{1,σ}` as the subobject.

   **Repair:** "let π⁻ and π⁺ be the tautological extensions of `Ker(t_{D_σ,F})` ⊗ A and of
   `Ker(t_{D_σ,G})` ⊗ A by `π_{1,σ}(φ,h)`, subrepresentations of Π". Tested at n = 3: both kernels vanish,
   π^± = `π_{1,σ}`, as README:1087–1088 says.

4. **F04** (P3) Standing hypothesis (H): "E containing σ(K) for every embedding σ : K ↪ E" is vacuous

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:85–86`,
   "E/ℚ_p is a finite extension containing σ(K) for every embedding σ : K ↪ E, and Σ_K is the set of
   these embeddings, so #Σ_K = d_K."

   **Claim:** the stated condition gives #Σ_K = d_K.

   **Witness:** every E contains σ(K) for every σ : K → E. For K = ℚ_p(√p), E = ℚ_p there is no embedding,
   the condition holds vacuously and #Σ_K = 0 ≠ 2 = d_K.

   **Repair:** "E/ℚ_p is a finite extension that contains the image of each of the d_K embeddings of K
   into an algebraic closure of E (equivalently K ⊗_{ℚ_p} E ≅ E^{d_K}); Σ_K is the set of embeddings
   K ↪ E, so #Σ_K = d_K." Tested on the witness: K ⊗ E = ℚ_p(√p) is a field, not E², so E = ℚ_p is
   excluded; E = ℚ_p(√p) gives two embeddings.

Four new findings, all P3 (S01–S04). All twelve round-1 findings are repaired at this head and no
repair introduced an error. Files reviewed: `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md`
(1442 lines, read in full) and `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`
(59 lines, read in full).

## Round-1 findings at this head

| Round-1 id | Status | Witness at c4e8cd3 |
| --- | --- | --- |
| 1a/F01 block cutoff | repaired | README:953–966, "`M_{i,σ}` be the i-th graded piece of the saturated filtration of D_σ … It is not the modification of M_i with its own lowest weight"; Check README:988–992 recomputed: (3,1) → (0,0), own cutoff (1,1), twist exponent 0 − 1 = −1. Agrees with TriangulineVarietyAndItsLocalModel §10.5 Checks. Carried into §3.7 (README:1001), §4.1 (README:1041–1043), §4.2 (README:1108–1111). |
| 1a/F02 "canonically" | repaired | README:1319–1322, "≅ π_min(D) as extensions … unique only up to the automorphisms 1 + i ∘ f ∘ p"; Check README:1339–1341. Recomputed: (i∘j∘p)² = i∘j∘(p∘i)∘j∘p = 0; Hom_G(𝒦_D ⊗ A, V) = Hom_E(𝒦_D, E) has dimension 0, 0, 1 for n = 1, 2, 3 over ℚ_p. |
| 1a/F03 weight sign | repaired | README:90–98, "the cyclotomic character ε has weight +1 … negatives of the Hodge–Tate weights of that roadmap's standing convention". DING25 line 451 (weight of the cyclotomic character is 1); PhiGammaModulesAndIwasawaCohomology §7.2a Check (Tate character: Sen label +1). |
| 1a/F04 rank-one boundary | repaired | README:119–120 ("For n = 1 … F and G are not defined"), README:339–341, README:439–441 ("for n = 1 both kernels are zero"), README:985–987, README:1379–1380. Recomputed kernel dimensions (n, d_K) = (1, d): 0, 0; (2, d): 2 + d twice; (3, 1): 26, 27. |
| 1b/F01 character rings | repaired, with a residual locator defect (S02) | README:1169–1183 defines R_δ = ⊗̂ `R_{δ_i}` and `R_{δ,g}`; tangent dimensions n(1 + d_K) and n recomputed; `R_{δ_i,g}` ≅ E⟦y_i⟧ argument checked (finite subgroup of the torsion-free 1 + 𝔪_A is trivial). |
| 1b/F02 PhiGamma contract | repaired | README:274–280 names §7.2, §7.2a, §7.3, §7.4; all four headings exist at the PhiGammaModulesAndIwasawaCohomology head (§7.2 "Field cohomology and rank-one submodules", §7.2a "Sen modules and polynomials over affinoid coefficients"). |
| 1b/F03 Needs lines | repaired, one more instance found (S01) | README:593, 694–695, 1355–1358 carry the added sections. |
| 1b/F04 End_G(π(φ,h)) | repaired | README:623–633 and Check README:646–651. Supplier facts used exist: LocallyAnalyticRepresentationsOfLocalGroups §8.4 (1) (constituents C(w,u) pairwise non-isomorphic), §8.13 (socle A), §8.2 (End_G(A) = E). |
| 1b/F05 gap overlap | repaired | README:312–316, "this gap adds only the completion Ĥ_φ and the isomorphism of Ĥ_φ onto `R_{w(φ),g}`"; `design/plan.json` `gaps[0]` has the same slug, supplier and section. |
| 1b/F06 Layer 3 example | repaired | README:1020–1022, "π_min(M_1) ⊠ π_min(M_2), where π_min(M_2) is the character `ψz^{h_4}`". Recomputed θ^P = (0,0,0,−3), twist 1 ⊠ ε³. |
| 1b/F07 bare theorem numbers | repaired | README:156–159 (Citations convention); README:327 "Theorem 1.4 (DING25 Theorem 3.21)". |
| 1b/F08 "the source is" | repaired | README:17–19, "These results are located in … §3.2, pp. 47–59; each target gives its locator." Pages verified: (3.38) on p. 47, Corollary 3.37 on p. 59. |

## Adversarial pass: values computed

No Lean declaration exists (the namespace is empty), so the declaration table has no rows; the table
below is over the README targets. d = d_K.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| (H), Σ_K | K = ℚ_p(√p), E = ℚ_p | condition vacuous; #Σ_K = 0 vs d = 2 | S04 |
| ε, η, δ_w | K = ℚ_p, x = p | ε(p) = p·|p| = 1; η z^λ = z^h(ε⁻¹∘θ): t_2|t_2| t_1^{h_1}t_2^{h_2} both sides at n = 2 | agrees with supplier §8.3 Check |
| §0.1 families | n = 1, 2, 3, 4 | n = 1: both {id}; n = 3: (1 2 3)(3) = 1 ∈ S_start, (1 3 2)(3) = 2 neither; w = (2 3): w_1w = id, w_2w : 3 ↦ 1 | holds |
| §0.2 block tuples | j = 0, n; restriction to Z_j | constant b, constant a; (a,b) restricts to (j·a, (n−j)·b) | holds |
| §0.3 spanning | n = 1, 3; H_char = 0, ℤ | (a,b,c) = (c,c,c) + (a−b,0,0) + (b−c,b−c,0); dims 2+4+4 = 10 vs 6 at d = 1 | holds; directness only n = 1 or H_char = 0 |
| §0.4 kernels | (n,d) = (1,d), (2,d), (3,1) | 0, 0; 4(1+d) − (2+3d) = 2+d twice; 36 − 10 = 26, 36 − 9 = 27 | holds |
| dim Ext¹_0 | (2,1), (2,2), (3,1), (3,2) | (n−1)(nd−2)/2 = 0, 1, 1, 4; = (1+n²d) − (n + n(n+1)d/2) | holds; matches Trianguline §11.4, §12.7 Checks |
| §1.1 c_n | n = 0…5 | 0, 0, 0, 1, 5, 16; c_{n+1} − 2c_n = n(n−1)/2 verified algebraically | holds |
| §1.2 gluing | n = 2; sign (b, −b) vs (b, b) | S_end ∪ S_start = S_2; t_F(b) − t_G(b) = 0; agreement on `𝔈_{g′}` follows from κ_{w_2} = (w_2w_1⁻¹)κ_{w_1} on Ext¹_{g′} and ζ_{w_2}∘(w_2w_1⁻¹) = ζ_{w_1} | conventions of the two suppliers agree: both (uψ)_i = ψ_{u⁻¹(i)}; test (a_1,a_2,a_3) ↦ (a_3,a_1,a_2) for (1 2 3) on both sides |
| §1.3 | n = 3, w = (2 3) | block tuples in H_j are fixed by S_j × S_{n−j}, so ζ_w = ζ_{w_jw} and κ_w⁻¹ = κ_{w_jw}⁻¹ there modulo Ext¹_0 | holds |
| §1.5 | ℚ_p, n = 1…5; n = 3, d = 2 | (2,2,0), (5,5,0), (10,9,1), (19,14,5), (36,20,16); (17,15,2) | holds |
| §1.6 | n = 3, ℚ_p | 𝔈_w dim 6, kernel a line, injectivity from t_D|𝔈_w = a_wκ_w⁻¹ζ_w⁻¹ | holds |
| §2.1 class | 𝒦_D = 0; split extension | π_min = V; split class = zero map ≠ inclusion when 𝒦_D ≠ 0 | holds |
| §2.2 exactness | n ≤ 2; n = 3, ℚ_p; L ⊂ `𝔈_{g′}` control | Hom(A, π_min) = E maps to 0 in 𝒦_D; next term 𝒦_D ⊗ Ext¹(A,A) dim 1·4; control a ∪ a = 0 | S01 |
| §2.4 uniqueness | n = 2; n = 3 line L ≠ 𝒦_D; split | Ker f = image of the class map; (2) forces Ker f = Ker t_D; split socle `A^{⊕2}` | holds ((1) is implied by (2); not a defect) |
| §2.5 χ_D | n = 1, 2 (two embeddings), 3 | χ_D = φ_1z^{h_1}; exponent (2,6); |λ|_σ − N = Σ_i h_{i,σ} since Σ(i−1) = N | holds |
| §2.6 HC shift | n = 2, h = (3,1) | λ = (3,2), λ+ρ = (7/2,3/2), e = (5, 21/4); s·h = (0,4) ↦ e_2 = 9/4; s·(3,2) = (1,4), +θ = (1,3) | holds; matches supplier §4.1 Check s·(0,0) = (−1,1) |
| §3.1–3.2 | n = 3 (2,1); n = 4 (3,1), (2,2) | c_2 + c_1 = 0; c_3 = 1; 0; θ^P = (0,0,0,−3) | holds |
| §3.3 | n = 2, 3 | (n + 2^n − 1) − (n + n(n+1)/2) = 0, 1 | holds |
| §3.5 | n = 3, d = 2; lengths | 1 + d(2^n − 2) + c_n d on both sides; 𝔈_σ ∩ 𝔈_τ ⊃ 𝔈_g of dim n | holds |
| §3.6–3.7 | n = 3, d = 2, h_τ = (3,1,0) | Q_σ(D): 13 − 4 = 9; Q_σ(D_σ): 10 − 1 = 9; block (3,1) → (0,0) | holds |
| §4.1 dimensions | n = 3; general n | dim 𝔈_{σ,F} = n + 2^{n−1}; minus c_{n−1} = n + 1 + n(n−1)/2; 2(·) − (n + n(n+1)/2) = 2 + n(n−1)/2; n = 3: 7, 7, 9, 5; intersection n + 1 = 4 plus kernel line = 5 | holds; S03 on wording |
| §4.2 example | a = 2, 3 | normals (1,1,0)×(1,a,1) = (1,−1,a−1): (1,−1,1), (1,−1,2); diag(1,1,1/2)(1,2,1)·(1,−1,2) = 0; x = y forced, (x,2x,z) ∦ (1,3,1) | holds |
| §5.1 End(D), rings | n = 1; n = 3, d = 1 | cotangent of A_D = functionals on Ext¹(D,D) vanishing on Ker(κ_w|Ext¹_g) = Ext¹_0, dim 9; A_D 10, `A_{D,w}` 7, I_w 3, R_D/𝔪² 11 | holds; S02 on the supplier citation |
| §5.2–5.5 | n = 1; n = 3, ℚ_p | x̄∘κ_w⁻¹∘ζ_w⁻¹ = x∘t_D on 𝔈_w; ΣU_w = U so uniqueness; U[𝔪]/V = A vs U/V = A^{10}; 𝔪U = socle A | holds |

## Dependency check

```text
depcheck: 206 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Verified sound

- **Counts.** Lean declarations read: 0 (module docstring and empty namespace only; single
  `import Mathlib`; no `set_option`, `lemma`, sorry'd data or process text). README targets read: 30
  numbered sections, 16 bold theorems. Checks tested: all Check bullets, with the values above.
  Locators verified against the cached texts: about 40 (every DING25 page locator of §§0.1–5.5 and of the
  twelve Source corrections that name pp. 13–59, and CEGGPS16 Lemma 3.22, p. 47, source line 1921).
  Sibling citations checked: 6 suppliers, every cited section heading.
- **Headlines.** The eight headline groups of the Summary are each named in the `Suggested.lean`
  docstring with the missing carrier. At the pins there is no Robba ring and no locally analytic
  representation (only `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`, distributions
  on ℤ_p), so none is statable; nothing is padding because nothing is stated.
- **Pinned names.** `LinearMap.quotKerEquivOfSurjective`, `LinearMap.finrank_range_add_finrank_ker`
  (`Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:173`), `Submodule.finrank_sup_add_finrank_inf_eq`,
  `TrivSqZeroExt`, `DualNumber`, `CategoryTheory.Abelian.Ext` exist; `TauCeti.hcProjection` and
  `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` exist in
  `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean` under `[IsKilling K L]`, as
  the README says.
- **Suppliers.** LocallyAnalyticRepresentationsOfLocalGroups (the board package, earlier in the merge
  order): §§0.9, 1.5, 1.7–1.9, 4.1, 6.1–6.2, 7.1–7.3, 8.1–8.14, 9.1–9.7, 10.1–10.7 exist with the
  cited content, including §8.12 (2)–(3), §9.6 (3)–(4), §9.7 (first map b ↦ (b, −b)), §10.5 (1)–(3),
  §10.7. TriangulineVarietyAndItsLocalModel (open head): §§10.1–10.3, 10.5–10.8, 11.1–11.8, 12.1–12.2,
  12.4, 12.6–12.7, 13.8, 13.13–13.14, 13.16 exist with the cited content. PhiGammaModulesAndIwasawaCohomology
  §§1.0, 1.2, 3.4a, 3.6, 7.1–7.5, 7.2a; LocalGaloisDeformationRings §§0.4, 1.23 with the five
  `PhiGamma.*` names; PadicHodgeTheory §§4.5, 5.2; SmoothRepresentationsOfLocalGroups §SR.3.2 exist.
  The `roadmaps resolve` lead "LocallyAnalyticRepresentationsOfLocalGroups §4.1: no roadmap" is false
  (board package), and the four `PhiGamma.*` leads are names of LocalGaloisDeformationRings §1.23.
- **Gap.** `gap:principal-series-bernstein-completion` has the same slug, supplier and section in
  `design/plan.json` and README:305–316; one statement (the completion isomorphism); the reordering
  identity it relies on is the earlier roadmap's own request, not something already provided.
- **Ownership.** `roadmaps grep` for π_min, the comparison map and the roadmap's name over the open
  heads and main: no other roadmap states t_D, π_min(D), π_fs(D), A_D or the recovery theorem;
  LocallyAnalyticRepresentationsOfLocalGroups and TriangulineVarietyAndItsLocalModel both name this
  roadmap as the owner. No second copy on main.
- **Policy.** The pull request changes only this package folder (README, Suggested.lean,
  `design/plan.json`, three reports). No pull-request numbers, process narrative or machine paths in
  the README or docstring; every target has a locator; every definition section has at least three
  Checks.

## Not verifiable

- The analytic content of the imported statements (Ding Lemma 3.5(2), Proposition 3.12, Corollary
  2.38(1), the closed-induction injection of §3.2 (ii), which DING25 Remark 3.28 states without
  proof): checked only for consistency of hypotheses, dimensions and conventions.
- §3.7's "repeat §2.2 inside the `g_{Σ_K∖{σ}}`-algebraic extensions": Ext¹_σ is a subspace of Ext¹_G
  with no Ext² of its own in the supplier, so the S01 argument has to be run in Ext_G and intersected;
  not checked beyond the dimension count 3 + 7 − 1 = 9.
- Elaboration of `Suggested.lean` was not run (read-only pass; the file has no declaration).
- The four Source corrections about DING25 pp. 16, 19, 38–39, 43 and 46 that the README attributes to
  its suppliers were not recomputed here.

## Source issues

- **Error** in DING25 at (3.43), proof of Theorem 3.21, printed p. 49: the source says the character space of the torus is a direct sum of the maximal-Levi-centre spaces and the centre space; it should be only their sum, since dimensions are (2n−1)(1+d_K) against n(1+d_K); affects the proof.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, printed p. 58: the source says the radical operator ends in the w-indexed universal extension; it should be the full universal extension, no w being fixed; affects nothing.
- **Misprint** in DING25 at the proof of Theorem 3.34, first paragraph, printed p. 56: the source says Corollary 3.32(1) gives the "only if" direction and the induction the "if"; it should be the reverse; affects nothing.
- **Misprint** in DING25 at the proof of Theorem 3.34, after (3.54), printed p. 56: the source says the relation obtained after replacing the module is again that of D_σ; it should be that of D′_σ; affects nothing.
- **Error** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, printed p. 56: the source says the middle terms are the full σ-Ext groups into π^±; it should be the images of the parabolic σ-Ext groups, as in (3.52), dimensions 7 + 7 against 10 + 10 at n = 3; affects the proof.
- **Misprint** in DING25 at the definition before Corollary 2.38, printed pp. 31–32: the source says the relation has third argument an undefined second modified module; it should be the modified quotient C_{1,σ}; affects nothing.
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, printed p. 51: the source says the exponent is one sum over both i and σ; it should be the tuple indexed by σ of sums over i; affects a stated result.
- **Gap** in DING25 at the proof of Proposition 3.26, printed p. 51: the source says the invariant inclusion is bijective on tangent spaces because the invariants are polynomial; it should use regularity of h (non-vanishing Vandermonde); affects the proof.
- **Gap** in DING25 at Corollary 3.32(2) and (3.51)–(3.52), printed p. 55: the source says the graded blocks of the modified module are the modifications of the blocks; it should say with the ambient lowest weight, differing by an algebraic twist; affects the proof.
- **Gap** in DING25 at the sentence after (3.45), printed p. 50: the source says surjectivity follows from Lemma 3.5(2); it should also use that the kernel meets the self-extension subspace in zero (Lemma 3.23); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c4e8cd3b68fb011235bd875f4b61c10593d1857c", "job": "RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2a", "model": "fable", "worker": "chris-x11"} -->
