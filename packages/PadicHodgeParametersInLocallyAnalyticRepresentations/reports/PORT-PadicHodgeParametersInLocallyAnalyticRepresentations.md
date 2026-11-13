# PORT-PadicHodgeParametersInLocallyAnalyticRepresentations

- Branch: `roadmap/padic-hodge-parameters-in-locally-analytic-representations`, created from `42813dd`.
- Head commit: `c1ff1677b1822024faac916b0a3d98ff798c7f85`, with the message
  `PadicHodgeParametersInLocallyAnalyticRepresentations: roadmap (README, Suggested.lean, metadata)`.
  It changes three files, all inside the folder: `TauCetiRoadmap/PadicHodgeParametersInLocallyAnalyticRepresentations/{README.md,Suggested.lean,metadata.toml}`.
  Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.PadicHodgeParametersInLocallyAnalyticRepresentations.Suggested`:

    Build completed successfully (18239 jobs).

- Warnings: **0**. The file has no declarations, so there are no `sorry` warnings either.
- The first build was green but printed one warning that was not a `sorry` warning: "imports `Mathlib` from
  package `mathlib`, which is designed for use with the module system; consider adding `module`".
- I added a `module` line before `import Mathlib`, as in `TauCetiRoadmap/DiagrammaticCoherence/Suggested.lean` on main.
  The rebuild then gave the line above with no warnings.
- `Suggested.lean` has not changed since that build.

## Gate

    gate PadicHodgeParametersInLocallyAnalyticRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

    depcheck: 208 roadmaps, 1902 edges, 0 problem(s)

The check printed no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap builds Ding's comparison between locally analytic representation theory and the Galois side, for
crystabelline representations of GL_n(K).

- **What it constructs.** Take a generic noncritical crystabelline (φ,Γ)-module D of rank n over the Robba
  ring. The roadmap constructs the unique surjection
  t_D : Ext¹_{GL_n(K)}(π_alg(φ,h), π_1(φ,h)) ↠ Ext¹(D,D)/Ext¹_0(D,D). Refinement by refinement, t_D matches
  the locally analytic principal-series extensions with the trianguline first-order deformations of D.
- **The kernel.** Its dimension is (2^n − n(n+1)/2 − 1)·[K:ℚ_p], and the representation π_min(D) is built
  from it.
- **The end theorems about π_min(D):**
  - its intrinsic characterisation by two socle layers and its Ext¹;
  - its central and infinitesimal characters;
  - compatibility with parabolic induction and with the embeddings of K;
  - the recovery theorem: π_min(D) determines the modified modules D_σ, and hence D when K = ℚ_p;
  - its realisation as the annihilator of the maximal ideal of a first-order Artinian algebra A_D acting on
    the universal extension.
- **What it owns.** The two theories being compared are imported: the representation side from
  LocallyAnalyticRepresentationsOfLocalGroups (Ding §3.1), the deformation side from
  TriangulineVarietyAndItsLocalModel (Ding §2). This roadmap owns exactly the comparison layer, Ding §3.2.
- **Why it matters.** This is where locally analytic representations start to see the Hodge filtration that
  the locally algebraic representation π_alg(φ,h) forgets.
- **`Suggested.lean` states nothing.** No headline is statable at the pins, which have:
  - no admissible locally analytic representations of GL_n(K) or their Ext groups;
  - no (φ,Γ)-modules over the Robba ring;
  - no deformation rings of such modules.

  Its docstring names the missing carrier for each headline theorem.

## Roadmaps this one depends on that are still pull requests

- TriangulineVarietyAndItsLocalModel
- PhiGammaModulesAndIwasawaCohomology
- PadicHodgeTheory
- LocalGaloisDeformationRings
- SmoothRepresentationsOfLocalGroups
- PadicLocalLanglandsForGL2Qp: named only in Scope and ownership, as the owner of the compact distribution
  algebras that this roadmap reaches through LocallyAnalyticRepresentationsOfLocalGroups.

The main supplier is not on main and not in a pull request:

- **LocallyAnalyticRepresentationsOfLocalGroups** exists only as a board package. Its last review is
  `needs_changes`, with 11 blocking findings. It comes before this roadmap in the merge order, and the brief
  allows it as a supplier.
- I checked every section cited here against `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`:
  §§0.9, 1.5, 1.7–1.9, 4.1, 6.1–6.2, 7.1–7.3, 8.1–8.14, 9.1–9.7 and 10.1–10.7.
- The citation resolver lists this roadmap as "found nowhere", which is expected for a board package.

On main, only RepresentationTheory/LieHighestWeight is cited (Layers 3, 4, 5, 7, 9, which exist), and only
inside the contract for LocallyAnalyticRepresentationsOfLocalGroups §4.1.

No cited id is defined only by an open revision. The overlap scan lists no dropped ids and no conflicting pull
requests for this roadmap.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already had no declarations, only a module docstring and the
namespace.

- **The file is still correct as it is.** I confirmed that no headline is statable at the pins:
  - pinned Mathlib (`1b1ccf4`) and Tau Ceti (`2fd255d`) contain no Robba ring, no (φ,Γ)-module and no locally
    analytic representation of a p-adic group;
  - Tau Ceti's only locally analytic object is `TauCeti.LocallyAnalytic`, the locally analytic functions on
    ℤ_p, in `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`.
- **The only Lean change** is the `module` header described under Build.
- **The `#check @name` comparison was empty.** There are zero declarations, so the scratch file would contain
  nothing and no section binders can have been lost; nothing changed. For the same reason, no declaration name
  can collide with one in another roadmap.

## Supplier replacements and duplication removals

**Duplication removals: none.** I swept main and the open roadmap pull requests (`roadmaps grep` over 438 open
heads and main) by object:
- `π_min`, `pi_min` and `π_fs`: no match anywhere else.
- DING25 and "Hodge parameter": only the suppliers named above, plus reference-list entries in
  AutomorphicFormsOnReductiveGroups, OverconvergentAutomorphicForms and
  CompletedCohomologyAndLocalGlobalCompatibility. None of them states t_D, π_min(D) or the A_D-action.
- Robba rings, trianguline modules or (φ,Γ)-modules on main: only scope exclusions or references, in
  NewtonPolygons, PadicFunctionalAnalysis, AdicSpacesPartIV and RestrictedPowerSeries.

**Ownership.** This roadmap owns Ding §3.2.
- The Scope and ownership of LocallyAnalyticRepresentationsOfLocalGroups explicitly leaves "the comparison of
  these extension groups with Galois deformations and the p-adic Hodge parameters themselves" to this roadmap.
- TriangulineVarietyAndItsLocalModel owns only the deformation side (its Layers 10–13).
- Ownership against open pull requests was checked through the heads listed in the brief and through
  `roadmaps grep` over all open heads.

**Supplier replacements.** The package restates nothing that the pins supply. Changes to the supplier
contracts:
- **LocalGaloisDeformationRings §1.23.** The backticked names `PhiGamma.defRing`, `PhiGamma.triangulineDefRing`,
  `PhiGamma.deRhamDefRing`, `PhiGamma.tangent_defRing` and `PhiGamma.formallySmooth` exist only in that
  roadmap's README at its open head. They are not at the pins and not on main. I replaced them with prose:
  - the rings R_D, R_{D,w}, R_{D,g};
  - their tangent spaces;
  - formal smoothness, with the supplier's dimensions 1 + n²d_K, 1 + n(n+1)d_K/2 and 1 + n(n−1)d_K/2;
  - the forgetful maps and the Cartesian comparison.

  The section citation is unchanged.
- **Tau Ceti.** `TauCeti.hcProjection` (HarishChandra.lean:437) and
  `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` (line 403) exist at the pin.
  - They require a Killing Lie algebra: the file's variables include `(IsKilling.rootSystem H).Base`.
  - The contract listed them as if they were consumed. It now says that no Tau Ceti declaration is consumed,
    and why: gl_n's Killing form is degenerate, so §2.6 takes LocallyAnalyticRepresentationsOfLocalGroups §4.1
    instead.
- **Mathlib names, verified at the pin:**
  - `LinearMap.quotKerEquivOfSurjective` (`LinearAlgebra/Isomorphisms.lean:47`)
  - `LinearMap.finrank_range_add_finrank_ker` (`LinearAlgebra/FiniteDimensional/Lemmas.lean:173`)
  - `Submodule.finrank_sup_add_finrank_inf_eq` (same file, line 53)
  - `CategoryTheory.ShortComplex.ShortExact.extClass` (`Algebra/Homology/DerivedCategory/Ext/ExtClass.lean:76`)
  - `CategoryTheory.Abelian.Ext.covariantSequence` (`…/Ext/ExactSequences.lean:141`); its connecting map is
    `hS.extClass.postcomp`, a Yoneda product, as the README says.
  - `CategoryTheory.Abelian.Ext.comp` (`…/Ext/Basic.lean:128`)
  - `TrivSqZeroExt`, `DualNumber`, `Module.Dual`, `IsLocalRing`, `Equiv.Perm`, `LinearMap.prod`

## Supplier sections checked at their heads

| Supplier | Where read | Sections cited here | Result |
| --- | --- | --- | --- |
| LocallyAnalyticRepresentationsOfLocalGroups | board package | §§0.9, 1.5, 1.7–1.9, 4.1 (iv), 6.1–6.2, 7.1–7.3 (iv), 8.1–8.14, 9.1–9.7, 10.1–10.7 | every cited sub-item is present with the stated content: 8.8 (1)–(2), 8.9 (1)–(2), 8.12 (1)–(3), 8.13, 9.6 (3)–(4), 9.7, 10.5 (2)–(3) |
| TriangulineVarietyAndItsLocalModel | open head | §§10.1–10.3, 10.5, 10.7, 10.8, 11.1–11.8, 12.1, 12.2, 12.4, 12.6, 12.7, 13.8, 13.13, 13.14, 13.16 | present; Layer 10 assumes n ≥ 2 and §10.1 allows weakly decreasing weights, as the contract says; the dimension of Ext¹_0 in §11.4 (1 − n + dn(n−1)/2) equals the README's (n − 1)(nd_K − 2)/2 |
| PhiGammaModulesAndIwasawaCohomology | open head | §§1.0, 1.2, 7.1, 7.2, 7.2a, 7.3, 7.4 | present; the de Rham criterion for characters is in §7.4; D_rig and the étale equivalence over finite local E-algebras are in §1.2 (fixed, see below); ε = N_{K/ℚ_p}\|N_{K/ℚ_p}\| matches the Conventions |
| PadicHodgeTheory | open head | §4.5, and §5.2 through the trianguline roadmap | present |
| LocalGaloisDeformationRings | open head | §§0.4, 1.23 | present |
| SmoothRepresentationsOfLocalGroups | open head | §SR.3.2 | present, but over ℂ only (see Unresolved) |
| PadicLocalLanglandsForGL2Qp | open head | §0.1 | present; it includes the Fréchet–Stein and coadmissibility statements attributed to it |

## Fixes a mathematician would flag (from the read-through as an upstream reviewer)

1. **Summary.**
   - **What was wrong:** it said that π_alg(φ,h) forgets the Hodge filtration "from rank three on". That is
     false for n = 2 with K ≠ ℚ_p.
   - **Why:** for n = 2, an isomorphism of modules is a diagonal torus element acting on the Hodge lines of
     every embedding at once. The configurations of noncritical Hodge lines, one point of ℙ¹ ∖ {0, ∞} per
     embedding, therefore form 𝔾_m^{d_K−1} up to isomorphism. For d_K = 2 the invariant is t_σ/t_τ, so
     ΦΓ_nc(φ,h) has more than one isomorphism class.
   - **Agreement with the roadmap:** the README's own Check in §4.2 already says "for d_K > 1 the modules D
     themselves need not be isomorphic".
   - **New wording:** the class set has more than one element as soon as n ≥ 3, or n = 2 and K ≠ ℚ_p; the
     kernel is nonzero from rank three on.
2. **Scope and ownership, and Downstream consumers.**
   - **What was wrong:** they assigned the local–global part of DING25 §4 to "the completed-cohomology
     local–global compatibility roadmaps".
   - **Why that has no owner:** CompletedCohomologyAndLocalGlobalCompatibility (read at its head) works with
     GL₂ over ℚ and states no part of Ding §4. No roadmap owns patched eigenvarieties for GL_n with π_min.
   - **New wording:** §4 is outside this roadmap and consumes Layers 2 and 5.
3. **Contract with PhiGammaModulesAndIwasawaCohomology.**
   - **What was wrong:** it cited §1.0 for the étale realisation of E-representations as étale Robba modules.
   - **Correct sections:** at the head, §1.0 is the field realisation with coefficient algebras, and the Robba
     realisation D_rig(V) with the étale equivalence over finite local E-algebras (A = E included) is §1.2.
   - **Fix:** it now cites §§1.0 and 1.2, in the contract, the Scope, §4.2's proof and Needs line, and the
     Layer 4 Dependencies.
4. **§2.1.**
   - **What was missing:** the claim that either π_min(D) or π_fs(D) determines 𝒦_D lacked the step that an
     abstract G-isomorphism π_min(D) ≅ π_min(D′) carries V onto V.
   - **Fix:** I added the argument.
     - Hom_G(V, A) = 0 for n ≥ 2, because A occurs once in V, as its socle; the same holds for π(φ,h). So the
       isomorphism maps V onto V.
     - On V it is a scalar ν, and it induces g : 𝒦_D ≅ 𝒦_{D′}.
     - Comparing classes gives ι′ ∘ g = ν·ι, hence 𝒦_{D′} = 𝒦_D.
   - **Source:** DING25 p. 50 asserts the conclusion from the endomorphism isomorphisms (checked in the PDF).
5. **§5.1, the map A_0 ↪ R_{D,g}/𝔪².**
   - **What was wrong:**
     - "the twist by z^{−h}" did not say which way it goes;
     - the injectivity of R_{w(φ)z^h,g}/𝔪² → R_{D,g}/𝔪² was not stated;
     - the argument that the map is independent of w did not mention the reordering identity
       𝒥_{w_2} ∘ p_{w_2w_1^{−1}} = 𝒥_{w_1}, which the SmoothRepresentationsOfLocalGroups contract supplies.
   - **Fix:**
     - the ring isomorphism is now described by its deformation correspondence φ̃ ↦ φ̃z^h;
     - injectivity is derived from the surjectivity of κ_w on Ext¹_g;
     - independence is attributed to DING25 p. 57 ("by Lemma 2.11 and Proposition 3.3 (2)", read in the PDF),
       with the reordering identity as the input of the proof of Proposition 3.3(2).
6. **Tau Ceti contract.** It listed declarations that are not used. It now says that nothing from Tau Ceti is
   consumed (see Supplier replacements).

## Source locators

I spot-checked against the certified source. The fetched PDF has sha256
`741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba`, the same as `sources.toml`. I extracted
its text and confirmed each printed page:

| Result | Page |
| --- | --- |
| Proposition 2.5 | 13 |
| Example 2.9 | 14 |
| Proposition 2.12 | 18 |
| Corollary 2.38 | 32 |
| Theorem 3.21 | 48 |
| Remark 3.22, Lemma 3.23, Corollary 3.24 | 50 |
| Corollary 3.25, Proposition 3.26 | 51 |
| Proposition 3.27 | 52 |
| Remark 3.28, Corollary 3.29 | 53 |
| Corollary 3.31 | 54 |
| Corollaries 3.32 and 3.33 | 55 |
| Theorem 3.34 | 56 |
| Lemma 3.35, Theorem 3.36 | 58 |
| Corollary 3.37 | 59 |

All match the README. Remark 3.22(1) gives dim Ker(t_D) = (2^n − n(n+1)/2 − 1)d_K.

## Adversarial mathematics pass

The values were computed with a short script, `scratch/calc/witness.py` in the job directory, and by hand
where noted. d = d_K.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| (H): E contains every σ(K) | K = ℚ_p(√p) | E = ℚ_p: Σ_K = ∅, #Σ_K = 0 ≠ 2 = d_K; E = ℚ_p(√p): two embeddings | holds as stated | none |
| Weight normalisation | n = 1, K = ℚ_p, φ_1 = \|·\|, h_1 = 1 | D = R(x\|x\|) = R(ε): Sen weight +1, Hodge–Tate weight −1 under the supplier's convention | consistent with PhiGamma §7.2a (Tate character has Sen label +1) | none |
| ε = N(·)\|·\|_K | K = ℚ_p | ε(p) = p·p⁻¹ = 1, ε(u) = u; PhiGamma uses N\|N\| with \|N(x)\|_p = \|x\|_K | same character | none |
| w(φ)_i = φ_{w⁻¹(i)}; S_end, S_start | n = 1..4; w = (1 2 3), (1 3 2) | \|S_end\| = \|S_start\| = 1, 1, 2, 6; disjoint for n ≥ 2, equal for n = 1; (1 2 3): w(3) = 1, w⁻¹(3) = 2; (1 3 2) sends 3 to 2 | holds | none |
| §0.1 block permutation w_j | n = 4, i = 2; n = 3, w = (2 3) | j = 1 → (2 4); j = 3 → (1 2); (1 2)(2 3) sends 3 to 1 ∈ S_start; (2 3)(2 3) = id ∈ S_end | holds | none |
| §0.3 telescoping identity | (a,b,c) = (5,7,11) | (11,11,11) + (−2,0,0) + (−4,−4,0) = (5,7,11) | holds | none |
| §0.3 not a direct sum (n ≥ 2, H_char ≠ 0) | n = 1..4, d = 1 | external sum dimensions 2, 6, 10, 14 against H_T 2, 4, 6, 8; n = 1 equal; H_char = 0 gives a direct sum | holds, both boundary cases checked | none |
| §0.4 dim Ker R_D, Ker s_D | (n,d) = (1,1), (2,1), (2,2), (3,1) | (0,0), (3,3) = 2 + d, (4,4), (26,27) | holds | none |
| §0.4 dim Ext¹_0 = (n − 1)(nd − 2)/2 | (1,1), (2,1), (2,2), (3,1), (3,2), (4,1) | 0, 0, 1, 1, 4, 3; equal to (1 + n²d) − dim Q in every case and to the supplier's 1 − n + dn(n−1)/2 | holds | none |
| §1.1 c_n, the bound and the recursion | n = 0..6 | c = 0, 0, 0, 1, 5, 16, 42; the bound holds with equality at n = 0, 1, 2; c_{n+1} − 2c_n − n(n−1)/2 = 0 for n = 1..7 | holds | none |
| §1.4–1.5 dimensions of 𝔈, Q and the kernel | d = 1, n = 1..5; d = 2, n = 1..5 | (2,2,0), (5,5,0), (10,9,1), (19,14,5), (36,20,16); d = 2: (3,3,0), (8,8,0), (17,15,2), (34,24,10), (67,35,32) = c_n·d | holds | none |
| §1.2 descent sign (b, −b) | n = 3, b ∈ 𝔈_{g′} | t_F(b) − t_G(b) = 0, against 2t_F(b) for (b, b) | holds | none |
| §1.6 transversality | n = 3, d = 1 | a line meeting six 6-dimensional 𝔈_w inside a 10-dimensional space; dimensions alone do not decide | stated as a theorem with a source, not derived from dimensions | none |
| §2.1 𝒦_D determined by π_min(D) | n = 1; n ≥ 2 | n = 1: 𝒦 = 0; n ≥ 2: Hom_G(V, A) = 0 by multiplicity one, so V is preserved | the step was missing | added (fix 4) |
| §2.1 End_G(π(φ,h)) = E needs multiplicity one | nonsplit self-extension Ã of A | Ã ↠ A ↪ Ã is nonzero with square zero, so End(Ã) ⊇ E[ε]/ε² | Check correct | none |
| §2.2 surjectivity of f_D needs §1.6 | n = 1, K = ℚ_p, L = Eψ | push-forward rank 2 − 1 = 1; the E[ε]/ε³ character χ(1 + ψε + ψ²ε²/2) is multiplicative (checked on 6 pairs (ψ(x), ψ(y))) and maps to ψ ≠ 0 | holds | none |
| §2.2 Ext¹(A,A) term | n = 3, K = ℚ_p | 𝒦 ⊗ Ext¹(A,A) has dimension 1·(n + d) = 4 | holds | none |
| §2.3 de Rham dimensions against Q_g | (1,1), (2,1), (2,2), (3,1) | 1 + n(n−1)d/2 = 1, 2, 3, 4 against n = 1, 2, 2, 3 | holds | none |
| §2.4 split extension violates (1) | n = 3, K = ℚ_p; n ≤ 2 | socle A^{⊕2}; for n ≤ 2 the split extension is V = π_min | holds, boundary qualified | none |
| §2.5 χ_D exponent | λ_σ = (2,0), λ_τ = (5,1); n = 3, h = (4,2,−1) | \|λ\| = (2,6); \|λ\| − N = 8 − 3 = 5 = Σh | holds | none |
| §2.6 Harish-Chandra normalisation | n = 2, h = (3,1) | λ = (3,2); λ + ρ = (7/2, 3/2); e(h) = (4,3); e(λ+ρ) = (5, 21/4); dot action in h gives s·h = (0,4) with e₂(λ′+ρ) = 9/4 ≠ 21/4; dot partner of λ is (1,4), and (1,4) + θ = (1,3) = s(h) | holds | none |
| §2.6 regularity (Vandermonde) | n = 2, x₁ = x₂ | Jacobian determinant x₁ − x₂ = 0 | holds | none |
| §2.6 log_p∘det has nonzero d_inf | K = ℚ_p | on scalars x, z^λ(1 + n·log_p(x)ε): ε-part n ≠ 0 | holds | none |
| §3.1 parabolic kernels | n = 3, ranks (2,1); n = 4, ranks (3,1) and (2,2) | c₂ + c₁ = 0; c₃ + c₁ = 1 (so d); c₂ + c₂ = 0 | holds | none |
| §3.3 σ-kernel | n = 1..5 | dim 𝔈_σ − dim Q_σ = 0, 0, 1, 5, 16 = c_n; dim Q_σ is also the supplier's dim Ext¹_σ − dim Ext¹_0 for d = 1, 2, 3 | holds, independent of d | none |
| §3.5 sum over embeddings | n = 3, d = 2; d = 1 | two lines spanning the 2-dimensional kernel; d = 1 gives the identity | holds | none |
| §3.6 cutoff twist | n = 3, d = 2, h_τ = (3,1,0) | ambient cutoff (0,0) against own cutoff (1,1), k_τ = −1; second block needs no twist | holds | none |
| §3.7 dimension | n = 3 | 3 + 7 − 1 = 9 = 3 + 6 | holds | none |
| §4.1 dimensions of E^±, ℒ | n = 3, 4, 5 | dim 𝔈_{σ,F} = 7, 12, 21, minus c_{n−1} = 0, 1, 5 gives 7, 11, 16 = n + 1 + n(n−1)/2; dim ℒ = 5, 8, 12 = 2 + n(n−1)/2 | holds, including when the block kernel is nonzero | none |
| §4.1 negative control | n = 3 | unrestricted 10 + 10 = 20, kernel 11 against 5 | holds | none |
| §4.2 rank-three example | a = 2, 3 | lines (1,2,1), (1,3,1); normals (1,−1,1), (1,−1,2); dot products 0, 0; diag(1,1,1/2) sends (1,2,1) to (1,2,1/2), orthogonal to (1,−1,2) | holds; non-isomorphic, planes equivalent | none |
| §4.2 rank two | n = 2, d = 1 and d = 2 | the torus is transitive on one line at σ; d = 2: moduli 𝔾_m^{d−1} for D itself | the theorem holds; the Summary contradicted it | fixed the Summary (fix 1) |
| §5.1 End(D) = E | n = 3, generic φ | φ_i/φ_j smooth and nontrivial, so not algebraic, so Hom = 0 after inverting t; a Hodge line with no zero coordinate fixed by diag(a) forces a₁ = a₂ = a₃ | holds | none |
| §5.1 Artinian dimensions | n = 3, d = 1 | A_D 10, A_{D,w} 7, I_w 3, R_D/𝔪² 11 | holds | none |
| §5.1 A_D ≅ TrivSqZeroExt E Q^∨ | cotangent of the fibre product | Ext¹ ⊔_{Ext¹_g} Q_g = Ext¹/Ext¹_0 = Q | holds | none |
| §5.1 A_0 ↪ R_{D,g}/𝔪² | direction and injectivity | tangent map κ_w : Ext¹_g ↠ Hom_sm is surjective, so the map on cotangents is injective; Ding p. 57 uses the twist by z^{−h} on rings | wording was ambiguous | clarified (fix 5) |
| §5.1 non-de Rham character | p = 2 and odd p, δ = exp(a·log x) on 1 + 2pℤ_p | \|a·log x\| ≤ \|2p\| = p⁻¹ < p^{−1/(p−1)} (p odd); 1/4 < 1/2 (p = 2); weight a ∉ ℤ | holds | none |
| §5.3 full against closed induction | n = 1, d = 1, 2; n = 2, K = ℚ_p | 2A = 2A; 3A = 3A; 4A + 4C(w,s) against 4A | holds | none |
| §5.5 annihilator | n = 3, K = ℚ_p | U[𝔪]/V = A against U/V = A^{⊕10} | holds | none |
| Constituent labels (I nonempty proper) | n = 2, 3, 4 | Σ binom(n,i) = 2, 6, 14 = 2^n − 2 | consistent with LocallyAnalyticRepresentationsOfLocalGroups §8.5 | none |

- **Context and generality.** `Suggested.lean` has no declarations, so it has no `variable` or `include`
  context to check.
- **Vacuity.** No statement is quantified over data unrelated to D. Each theorem fixes D ∈ ΦΓ_nc(φ,h) under (H).

## Unresolved

- **The gap `principal-series-bernstein-completion` is still not supplied.** This was the condition of the
  review's acceptance.
  - At its open head, SmoothRepresentationsOfLocalGroups §SR.3.2 works only with complex coefficients: it
    identifies the block centre Z_s with ℂ[D_s]^{W_s}.
  - It has no Bernstein centre over a finite extension E of ℚ_p, no completion Ĥ_φ, and no isomorphism
    𝒥_w : Ĥ_φ ≅ R_{w(φ),g}.
  - The README keeps the contract in the form "What SmoothRepresentationsOfLocalGroups must provide
    (gap:…)", the form FlagVarieties and BelyiMaps use on main.
  - Layer 5 (§§5.1–5.5) depends on it.
- **LocallyAnalyticRepresentationsOfLocalGroups is only a board package.** Its last review is `needs_changes`.
  If that package is revised, the cited section numbers can change.
  - Its own gap contracts toward SmoothRepresentationsOfLocalGroups are inherited here through its
    Layers 8–10: generic principal series and Jacquet modules with finite coefficients, finite length, and the
    ordered-character maps.
- **Suspicious text:** none found in the supplier READMEs, reviews or the source.


Pull request: #2257 (roadmap/padic-hodge-parameters-in-locally-analytic-representations at c1ff167)
