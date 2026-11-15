<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6888156820 -->
Red team round 1 pass b (claude) of c2ba00f

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §6.5: the locally analytic BGG theorem has no proof route, a locator into a text that only quotes it, and an unowned algebraic input

   **Location.** `packages/HigherHidaAndColemanTheory/README.md:1126` — "prove exactness of 0→Vκ⊗V_sm,1→V_lan,κ(w0Mκ)→⊕_(ℓ(v)=1)V_lan,v·κ(…)→⋯→0 … (BP-Coleman, Theorem 6.2.16, Corollary 6.2.18 and §6.2.20, pp. 151–153)"; `README.md:1128` (*Needs*); `README.md:284`.

   **Claim.** §6.5 is a target for a general split reductive Levi M (Layers 5–7 are for every quasi-split abelian-type datum), supplied by "LieHighestWeight Layer 3" for its differentials.

   **Witness.**
   - BP-Coleman line 6995 states Theorem 6.2.16 with the attribution "[Jon11], thm. 26, [Urb11], sect. 3.3.9" and gives no proof (the next item, line 7008, is Definition 6.2.17). The README's only locator is therefore to a quotation.
   - §6.5 is one of three of the 69 numbered sections with no "A proof route" paragraph (the others, §2.1 and §5.1, carry their route in the statement or state no target).
   - Every proof of this theorem dualizes the algebraic Bernstein–Gelfand–Gelfand resolution of the finite-dimensional module by Verma modules. No owner states that resolution: `LieHighestWeight` on main mentions BGG only in its reference list (its README lines 3328–3329); AutomorphicBundles §9.1 is type C₂ only (README.md:20 says so); the pinned Tau Ceti has `VermaModule` but no resolution (`grep -ri bgg` in `TauCeti/Algebra/Lie/HighestWeight` returns docstring book titles only); `roadmaps grep 'BGG resolution'` finds no other statement.

   **Repair.** In §6.5:

   1. Replace the locator by: "(O. T. R. Jones, An analogue of the BGG resolution for locally analytic principal series, J. Number Theory 131 (2011), 1616–1640, Theorem 26; É. Urban, Eigenvarieties for reductive groups, Ann. of Math. 174 (2011), 1685–1784, §3.3.9; statement and normalization as in BP-Coleman, Lemma 6.2.13, Remarks 6.2.14–6.2.15, Theorem 6.2.16, Corollary 6.2.18 and §6.2.20, pp. 150–153)", and record both works in `sources.toml` through the sources service (uncertified if paywalled).
   2. Add the algebraic input as part (0) of the target: "(0) For the split reductive Lie algebra 𝔪=Lie M over F, its Borel 𝔟_M and an M-dominant integral κ, prove the Bernstein–Gelfand–Gelfand resolution 0→M(w0M·κ)→⋯→⊕_(v∈W_M,ℓ(v)=i)M(v·κ)→⋯→M(κ)→Vκ→0 by the pinned Verma modules `TauCeti.VermaModule`, each differential being a sum of U(𝔪)-maps between Verma modules given by right multiplication by elements of U(𝔫⁻_M); for W_M={1} it is M(κ)=Vκ." with a textbook locator (Humphreys, *Representations of Semisimple Lie Algebras in the BGG Category O*, Chapter 6; the section number to be fixed against the text). Alternatively declare it as a supplier gap on `LieHighestWeight` Layer 3 with the same sentence as `needs`.
   3. Add: "A proof route is as follows: Apply to (0) the contravariant functor taking a U(𝔪)-module to its analytic germs on the neighbourhoods of M₁, under which M(λ) goes to V_lan,λ with the twist of Remark 6.2.14 and right multiplication by X∈U(𝔫⁻_M) to the operator X∗ of Lemma 6.2.13; this gives the complex and d²=0. Exactness on germs is the convergence statement of Jones's Theorem 26: a formal primitive of a convergent section converges on a smaller neighbourhood, which is why germs are used. The kernel of the first differential is the U(𝔪)-finite vectors of type κ, that is Vκ⊗V_sm,1."

   Tested on the instance: for SL₂, κ=1, (0) is 0→M(−3)→M(1)→V₁→0 with differential right multiplication by f²; the functor turns it into d²/dz² on analytic germs, whose kernel is spanned by 1, z locally, as the Check at README.md:1139 computes.

2. **F02** (P3) "LieHighestWeight Layer 3" is cited for objects its owner says are pinned declarations

   **Location.** `README.md:20` — "LieHighestWeight Layer 3 the Verma modules and enveloping-algebra maps"; `README.md:284`; `README.md:53` — "No other Tau Ceti declaration is used".

   **Witness.** `LieHighestWeight` on main, Scope and ownership (its README lines 13–25, the sentence at line 15): PBW and Verma modules are `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `TauCeti.VermaModule`, "so a consumer cites the declaration, not a layer of this roadmap". Pin: `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195` (`def VermaModule`), `:305` (`existsUnique_lieModuleHom_apply_vermaGenerator`). Its Layer 3 (§§3.1–3.2) is Rees algebras and ordered products.

   **Repair.** Delete the subsection "From TauCetiRoadmap.LieHighestWeight" and the edge "LieHighestWeight Layer 3" in §6.5's *Needs* and in Layer 6's Dependencies. In "From Tau Ceti" replace the last sentence's opening by: "`VermaModule` in TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195, with its universal property `existsUnique_lieModuleHom_apply_vermaGenerator` (line 305), supplies the Verma modules of §6.5(0). No other Tau Ceti declaration is used;". In README.md:20 write "and the pinned Tau Ceti `VermaModule` the Verma modules". §6.5 *Needs* becomes "OverconvergentAutomorphicForms §0.4; OverconvergentAutomorphicForms §8.7; Tau Ceti `VermaModule`."

3. **F03** (P3) ten analytic targets name the scheme-level contract `gap:coherent-correspondences` in their *Needs*

   **Location.** *Needs* lines of §5.4 (`README.md:912`), §5.4a (929), §5.5 (946), §5.7 (986), §6.1 (1034), §6.6b (1195), §6.10 (1267), §7.1 (1302), §9.6 (1616), §9.7 (1635); four of them (§5.4a, §5.5, §6.1, §6.6b) also list "AutomorphicBundlesPartII §3.2".

   **Claim.** These targets act by Hecke correspondences on supported cohomology RΓ_(U∩Z)(U,·) of rigid spaces with Banach coefficients.

   **Witness.** The gap's `needs` (README.md:120) is for "two closed subschemes D+,D− of a proper Xbar" on the solid enhancement of §3.0a; AutomorphicBundlesPartII §3.1 (its README line 497) is "For separated finite-type S-schemes". None of the ten targets uses K+− or K−+. The analytic operator has an owner: AdicSpacesPartIII §R3.8, *pull-identify-trace* (`Correspondence.pullIdentifyTrace`, `pullIdentifyTrace_comp`), which §5.3's route already uses.

   **Repair.** In those ten *Needs* lines delete "gap:coherent-correspondences", and in §5.4a, §5.5, §6.1 and §6.6b also "AutomorphicBundlesPartII §3.2". Add "AdicSpacesPartIII §R3.8" to the five targets that form the analytic operator themselves and do not list it: §5.4, §5.7, §6.1, §6.10 and §9.6. §7.1 needs no replacement (its action is §6.10). In §9.7 the integral continuation acts on unsupported cohomology of the proper integral model modulo p^m, which is AutomorphicBundlesPartII §3.2 on the spans of its §3.0b: write that edge in place of the gap. "AutomorphicBundlesPartII §3.3" stays in §5.4 and §6.10, where the composite is formed on the algebraic open Shimura variety, and §3.13 stays where the individual algebraic operators are compared. Update the Dependencies paragraphs of Layers 5, 6, 7 and 9 accordingly. Tested on §5.4a: its adjointness statement uses the trace of the finite flat p1 on an adic correspondence (R3.8) and the pairing of AdicSpacesPartIV §F1.10, and nothing of BP-Hida Definition 2.2.4.

4. **F04** (P3) §3.7 states two different operator conventions for the rational comparison

   **Location.** `README.md:644` — "≃RΓ(Stor_Qp(ζ),ωκ(χ)(−εD))^ord, where the right-hand operator convention is the classical normalized action"; `README.md:650` — "twisting by −ν_id(κ) … multiplies by p, recovering U_naive on the rational side".

   **Witness.** GL₂, k=2, p=3, t=diag(1,3): t acts on C_w by t_κ=p⁻¹U_naive; ν_id(κ)(t)=1/3; after the twist (−ν_id(κ)) it acts by 3·(1/3)U_naive=U_naive. So T(ℚ_p) acts on the right-hand side through the unnormalized operators, and only the superscript ord refers to t_κ: an eigenvalue 3 of U_naive is ordinary, an eigenvalue 1 is not (slope −1 for t_κ).

   **Repair.** Replace the clause by: "where T(ℚ_p) acts on the right-hand side through the unnormalized operators t_naive, with units acting by χ, and the superscript ord is the direct factor on which the normalized operator t_κ=ν_w(κ)(t)t_naive is invertible with unit eigenvalues". The example at line 650 then agrees with the statement.

5. **F05** (P3) §9.5: the Klingen eigenvalue computation is cited to a quotation and has no route

   **Location.** `README.md:1581` — "Prove that π_p^Kli(p) is four-dimensional with U_Kli,1 characteristic polynomial ∏(X−p⁻¹z)"; `README.md:1585` — "Use the four-dimensional unramified Klingen Hecke module and its Weyl-orbit characteristic polynomial from Proposition 5.1.5.1".

   **Witness.** Pilloni-Singular line 949: the proof of Proposition 5.1.5.1 is "This is [24], coro. 3.2.2"; lines 959 and 967 likewise for Proposition 5.1.5.2 and Lemma 5.1.5.2. The route's first step is thus the target itself, read from a text that quotes it. SmoothRepresentationsOfLocalGroups (README.md:297) assigns this computation to §9.5.

   **Repair.** Replace the route's first sentence by: "Compute the Klingen module through the Iwahori invariants: for an irreducible unramified principal series i_Bχ, the Iwahori invariants have dimension 8 and the positive torus elements act on their semisimplification through the eight Weyl translates of χ (SmoothRepresentationsOfLocalGroups §SR.2.3, *borel-casselman-invariants*); the Kli(p)-invariants are the invariants of the finite Hecke algebra of the simple reflection of the Klingen Levi, of dimension |W|/2=4, and under the positive Klingen homomorphism of §SR.1.4 the operator U_Kli,1 has there the four eigenvalues p⁻¹αβ, p⁻¹αγ, p⁻¹βδ, p⁻¹γδ with multiplicity." Add "SmoothRepresentationsOfLocalGroups §SR.2.3" to the *Needs*, and add the primary locator that Pilloni-Singular quotes (its "[24], coro. 3.2.2 and prop. 3.2.3"), fetched through the sources service. Tested on (α,β,γ,δ)=(1,1,9,9), p=3: eigenvalues 1/3, 3, 3, 27, as in the Check at README.md:1598.

One blocking finding (R01) and four P3 findings. `Suggested.lean` declares nothing (empty namespace, by design), so there is no declaration table and no `#check` file to elaborate; the module docstring was compared with the README's headline list instead (all ten headlines named, each with its missing carrier). The whole README (1713 lines) and the whole `Suggested.lean` (41 lines) were read.

Dependency check, run as the brief gives it:

```text
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

Adversarial table (values computed on both sides; "=" means the README's value was reproduced):

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| §1.1 κ∨∨=κ, κ∨=(3−κ₂,3−κ₁) | C₂, ρ=(−1,−2), 2ρ_nc=(−3,−3); κ=(5,3),(5,1) | (0,−2),(2,−2); twice returns κ since W_M fixes ρ_nc | = |
| §1.1 ν_w∘κ_w=id | ν=(0,−2), four w | κ=(5,3),(5,1),(2,−2),(0,−2); κ+ρ=(4,1),(4,−1),(1,−4),(−1,−4) are the images of −w0M·w(−1,−4) | = |
| §1.1 torus Check | norm-one torus of ℚ(∛2) | S₃ acts irreducibly on X*⊗ℚ, real rank 1, unit rank 1: Z_s=1, Zᵣ=T | = |
| §1.2/§9.2 GL₂ thresholds | κ=(k,0), ρ=(−½,½), t=diag(1,p) | A_id(t)=1, A_long(t)=k; C(κ)+={id} iff k≥2, both iff k=1 | = |
| §2.2 strictness | Frobenius on ℙ¹, D−=V(t) | (t^p)¹⊂(t)^p, s=1/p; int V(t^p)=∅ | = |
| §2.7 degree witness | ℙ¹ over 𝔽₂ | RΓ(Ω¹[1]) = 𝔽₂ in degree 0; dual 𝔽₂[0] | = |
| §2.8(c) negative control | three points, σ(a)=a, σ(b)=a, σ(c)=b | σ⁻¹{b,c}={c}, σ⁻¹{c}=∅; T²f constant; both ordinary objects 𝔽₂ | = |
| §3.2 c_w′(t) | GL₂, k=2, p=3, t=diag(2,3), diag(2,6) | ν_id(t)=1/6, ν_long(t)=1/9, c=3/2; 1/12, 1/36, c=3 | = |
| §3.2 general k | κ=(k,0) | ν_id=(1−k,−1), ν_long=(0,−k); n_id=1−k for k≤0 | = |
| §3.8 Hecke relation | GL₂, ℓ=3 | degrees 4²=12+4·1; Iwahori ωs=diag(1,ℓ), sω=diag(ℓ,1) | = |
| §3.8 End bijection | C perfect over O finite over ℤ_p | Milnor sequence, H⁻¹ terms finite, lim¹=0 | holds |
| §4.8 characters | w*=w0M·w·w0 | ν_(w*)(κ∨)=−w0ν_w(κ) using κ∨+ρ=−w0M(κ+ρ) | consistent with "w0χ⁻¹", "w0(t⁻¹)" |
| §4.9 against §4.8 | ℓ(w*)=d−ℓ(w) | dual of [0,ℓ(w*)] shifted by d is [ℓ(w),d] | = |
| §5.2 E13 | standard pair depth s, general C | printed bounds force m≥s and Cm≤s, so C=1 or s=0 | README's relative bound needed |
| §5.5 transposed bounds | general | −w⁻¹κ∨=w⁻¹w0Mκ+w⁻¹2ρ_nc; −w⁻¹w0Mκ∨=w⁻¹κ+w⁻¹2ρ_nc | = |
| §5.5 Check | GSp₄, κ=(5,3;−8), t₂ | 0, 3; κ∨=(0,−2;8) pairs with v(t₂⁻¹) to 3 | = |
| §6.6b identities | general | a_an+w⁻¹2ρ_nc=w⁻¹ρ−ρ=−b_an; b_an+w⁻¹2ρ_nc=−a_an | = |
| §6.6b against §5.5 | twists ∓ν_alg | a_an−ν=w⁻¹w0Mκ; b_an+ν=w⁻¹κ∨ | = |
| §6.6b/§6.7 Checks | κ=(5,3;−8), v=s0 | ν_alg=(0,−2), ν_v=(−3,1;8), κ_w(ν_v)=(2,6); pairings −3, −3, 3 | = |
| §7.6, §9.3 A_w(t₂), A_w(t₁) | κ=(k₁,k₂;−k₁−k₂) | 3, k₂+1, k₂+1, k₁+k₂; k₂+3, k₂+3, k₁+2k₂, k₁+2k₂ (6,6,11,11 and 3,4,4,8 at (5,3)) | = |
| §9.1 κ_r | ν+ρ=(a,b) | (3−ν₂,3−ν₁), (3−ν₂,ν₁+1), (2−ν₁,ν₂), (ν₁,ν₂) | = |
| §9.5 criterion | GSp₄ parameters σ, σχ₁, σχ₂, σχ₁χ₂ | six ratios cover χ₁, χ₂, χ₁χ₂, χ₁/χ₂ and inverses | = |
| §9.6 E10 | bounds −3, 0 and thresholds k−2, k+1 | need p^(k+1)U on the last term | = |
| §9.8 Check | (1,1,9,9), p=3 | 20; 2, 10, 10, 18 with valuations 0,0,0,2 | = |
| §9.9 | n=2, ν=(4,2,0), ρ=(1,0,−1) | (−3,−5,2), (0,−5,−1), (0,−2,−4); lengths 0,1,2 | = |

Counts: declarations read 0 (none exist); numbered sections read 69 of 69 (66 with a proof route); Check bullets read 159 of 159, of which about 95 carry a numerical or set-theoretic value that was recomputed (the table lists the main ones) and the rest are qualitative and were read against their section's statement; source locators verified against the cached texts 47 (BP-Hida 21, BP-Coleman 15, Pilloni-Singular 10, BP-GL2 1); sibling section citations resolved at current heads 125 of 125 distinct (every heading exists on main or at the open head; content compared for 24); pinned declarations checked 11 of 11 with their line numbers; declared gaps compared with `design/plan.json` 10 of 10 (same slug, supplier and section).

Further points checked and found correct: the two support orders and the direction K−+→K+− against BP-Hida Definition 2.2.4 and Corollary 2.3.11; hypotheses of §§2.4–2.7 against Theorems 2.5.1, 2.6.8, 2.6.10, 2.7.4 and Propositions 2.6.2, 2.6.13; §2.8 against Propositions 2.10.3–2.10.4 and Theorem 2.11.4; §3.1 against Proposition 4.1.13 and §4.1.16; §3.6–3.7 against Theorem 4.5.2 and Corollaries 4.5.4–4.5.5; §4.8–4.9, §8.4 against Theorems 5.5.1–5.5.2, Proposition 5.6.3, Corollary 6.2.17; §1.2, §5.5–5.8, §6.6, §6.6b, §7.5–7.6 against BP-Coleman Definitions 5.11.2, 5.11.14, Theorems 5.5.1, 5.6.1, 5.7.2, 5.9.6, 5.12.3, 5.12.5, 6.5.5, 6.8.3, 6.9.7, 6.10.1–6.10.3; §§9.4–9.8 against Pilloni-Singular Theorems 1.1, 11.3.1, 14.7.1, 14.8.1, Propositions 13.3.1.1, 13.3.2.1, Corollaries 13.3.3.1, 14.7.1, 14.9.1; §9.2 against BP-GL2 Theorems 1.1–1.3.

Ownership: `roadmaps grep` for the locally analytic BGG resolution, GSp₄ principal-series irreducibility, Klingen refinements, restricted tensor products of spherical Hecke rings and higher Hida theory found no second owner on main or at the open heads. PadicFamiliesPartII (later in the merge order) cites §§5.5, 5.6, 5.8 of this roadmap, so the former-numbering table of Layer 5 serves a consumer and is kept. Policy: the pull request changes only the package folder; no `lemma`, `set_option`, pull-request number or machine path in README, Lean file or manifest; `Suggested.lean` has the single import and the required docstring form. Padding: none (no declaration). Statable headlines: none; every headline needs Shimura varieties or their coherent cohomology, absent from both pins.

Source independence: 16 passages compared with 4 sources, none shared (longest common run under 8 words, on forced formulas only); largest share BP-Coleman, 58 of 119 parenthetical locators; contents compared with BP-Coleman: independent (its chapters 2–4 have no layer, chapter 5 maps to Layer 5 with sections in a different order, chapter 6 is split between Layers 6 and 7 and reordered). Layers 2, 3, 4, 8 meet BP-Hida §§2, 4, 5, 6 in that order; the order is forced by the *Needs* lines (§3.3←§2.2, §3.4←§2.3, §4.1←§3.5 and §2.6, §8.1←§3.2 and §2.8, §8.3←§4.5), and the sections inside each layer are not in the source's order (§2.1↔2.2–2.3 before §2.2↔2.1; §3.8↔4.2 last; §4.6↔5.3 after §4.5↔5.4), so no finding is raised.

## Not verifiable

- Jones (2011) Theorem 26 and Urban (2011) §3.3.9: not in the sources cache; their numbering is taken from BP-Coleman line 6995.
- The reference "[24]" behind Pilloni-Singular Propositions 5.1.5.1–5.1.5.2: the bibliography lists [24] as Gan–Takeda and [25] as Genestier–Tilouine; which paper contains "coro. 3.2.2" was not checked.
- Humphreys' section number for the BGG resolution: the book is not in the cache.
- The proofs behind source issues E1–E4, E6–E8, E11, E14, E18 were not re-derived; only their printed statements were located.
- Sibling content was compared for 24 of the 125 cited sections; for the rest only the heading was resolved.

## Source issues

- **Misprint** in BP-Coleman at Definition 6.4.7, p. 158: the source says the first negative-support inclusion uses the coefficient radius n as second depth; it should be the free depth l, as in the positive case; affects nothing.
- **Error** in BP-Coleman at Definition 5.4.10 and Example 5.4.11, pp. 111–112: the source says standard pairs of every depth satisfy the absolute lower inclusion; it should be the inclusion intersected with U, since otherwise max(t)=1 or depth 0 is forced; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), p. 167: the source says the second upper bound is −w⁻¹ρ+w⁻¹2ρ_nc; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc, the transpose of the first lower bound; affects a stated result.
- **Misprint** in BP-Hida at §2.11, standing assumptions, p. 31: the source says the first-projection pullback of D′+ lies in the second-projection pullback of D″+; it should be the second-projection pullback of D′+ inside the first-projection pullback of D″+, as in Proposition 2.10.4; affects nothing.
- **Error** in BP-Hida at Remark 4.3.12, p. 48: the source says the global operator restricts to a pure power of p times the local one; it should be the value at t of the character difference, a power of p times a unit; affects nothing.
- **Misprint** in Pilloni-Singular at §5.1.5, p. 22, paragraph before Proposition 5.1.5.2: the source says the Klingen parameters satisfy αβ=γδ; it should be αδ=βγ, as on p. 21; affects nothing.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, p. 90: the source says the lower arrow is p^(−k−1)U; it should be p^(k+1)U, which the thresholds k−2 and k+1 of Corollary 13.3.3.1 require; affects the proof.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, p. 102: the source says the eigenvalues have positive valuation; it should be nonnegative, since parameters of valuations (0,0,k+1,k+1) give unit eigenvalues α+β; affects nothing.

## For the human reviewers

- Layers 2, 3, 4, 8 correspond in order to BP-Hida sections 2, 4, 5, 6 (contents, author PDF p. 1); the *Needs* lines force that order. No finding was raised.
- **Licence.** BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`sources.toml`, `licence_class = "author-page"`); the BP-Coleman locators use a revised author PDF whose numbering differs from arXiv:2110.10251v1.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c2ba00f58cbf1f5f64ee9bf11bba99b695475a65", "job": "RT-HigherHidaAndColemanTheory~1b", "model": "fable", "worker": "chris-x30"} -->
