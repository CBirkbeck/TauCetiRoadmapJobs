<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1152#issuecomment-6404808931 -->
Review (claude) of 6c3c8b8

Verdict: accepted
Conditional on the announced gaps: `function-field-globalization`, `elliptic-pseudo-coefficients`, `discrete-series-number-field-model`, `reductive-central-reduction`, `spherical-adjoint-transfer`, `parameter-square-root-transport`, `stack-integer-weights`, `satake-constant-realization`, `exceptional-named-orbit-profiles`, `rigid-middle-extension-specialization`, `pure-isocrystal-geometric-semisimplicity`, `formal-to-differential-maximal-slope`

1. **F01** (P3) Localization target omits the zhu-fg §4 locators it relies on

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:624`, locator list ending “zhu-fg, Theorem 8 and Corollary 9, pp. 9–10, Lemmas 17–21 and Remark 5.1, pp. 20–23”; same list in `sources.toml:285`.

   **Claim:** The target states “Prove that the local central supports of the level vacua impose the stated singularity bounds” and “its composite with U(V)^T → Fun(Op_H) equals the infinitesimal V-action restricted to T-invariants”. The first is the identification Spec Z_{p(2)} = Op(D)_{p(2)} with its explicit description; the second is Lemma 21, which the source proves by combining a local statement with Lemma 19. Both local inputs live in zhu-fg §§3.4–4.2, which no locator names.

   **Witness:** zhu-fg line 748 (Proposition 14, p. 17), line 789 (Proposition 15, p. 18: Z_{p(2)} ∩ U(V_P) = U(V_P)^{L_P}), line 823 and line 838 (Spec Z_{p(2)} =: Op(D)_{p(2)}, Lemma 16, pp. 18–19); line 1005 says Lemma 21 is Proposition 15 plus Lemma 19.

   **Exact repair:** In the line-624 locator add “zhu-fg, §§3.4–4.2, Propositions 14–15 and Lemma 16, pp. 17–19, zhu-fg line 748, zhu-fg line 789, zhu-fg line 838”, and extend the zhu-fg `locator` field in `sources.toml` with “Propositions 14–15 and Lemma 16, pp. 17–19”. Test: with the addition every step of the localization target names a stated result of the source; without it the two quoted steps cite only the global lemmas that consume them.

2. **F02** (P3) ASCII “varpi” in a Unicode formula

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:610`: “the regular-singular oper subscheme with nilpotent oper residue varpi(0)”.

   **Claim:** House style is Unicode outside code spans; the README writes ϖ elsewhere (line 534, “χ(ϖ_E)”), so “varpi(0)” is a leftover macro name, not the symbol.

   **Witness:** `grep -n varpi README.md` returns only line 610; zhu-fg line 958 writes the residue as ϖ(0).

   **Exact repair:** Replace “varpi(0)” by “ϖ(0)” at line 610. Test: the grep then returns nothing and the symbol agrees with line 958 of the source.

3. **F03** (P3) xz manifest locator starts §4.3.4 one page late

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/sources.toml:233` and `README.md:1436`: “§§4.3.4–4.3.6, pp. 48–49”.

   **Claim:** §4.3.4 begins on printed page 47; the §4.0 text itself says “§4.3.4, pp. 47–48” (line 596), so the manifest and the References entry disagree with the target.

   **Witness:** xz line 2207 opens “4.3.4. We first explain the isomorphism (4.3.3.1)”; the page-48 marker is xz line 2213.

   **Exact repair:** Change both occurrences to “§§4.3.4–4.3.6, pp. 47–49”. Test: the three locators of the same sections (line 596, line 1436, manifest) then agree, and the range covers xz lines 2207–2289 (pp. 47–49).

4. **F04** (P3) Scope records the two-owner situation with the KB design on one side only

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:13`: “These specialized inputs lie here before the further monodromy, functoriality and Newton-polygon applications of KloostermanSheavesAndBesselIsocrystals §§KB.6–KB.11.”

   **Claim:** The board design `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md` plans in KB.1–KB.4 the same objects §4.0 now owns (Kloosterman eigenobject; Frenkel–Gross connection, invariant parameter, oper slice, quantized Hitchin identification, Zhu identification with central descent; de Rham–rigid comparison; Bessel F-isocrystal) and cites this roadmap nowhere. This roadmap is the owner (merge position 243 against 259 for the design; §4.2 consumes §4.0), so Scope should say that KB.1–KB.4, not only KB.6–KB.11, import §4.0.

   **Witness:** KB design lines 299–437 (KB.2 targets fg-connection, invariant-parameter, oper-slice, quantized-hitchin, zhu-identification) and lines 164–600 (KB.1, KB.3, KB.4); `grep -c GlobalShtukasAndFunctionFieldLanglandsPartII` on that file returns 0; merge order lines 243–244 and 259.

   **Exact repair:** Extend the line-13 sentence to “…lie here; KloostermanSheavesAndBesselIsocrystals §§KB.1–KB.4 import them from §4.0, and its §§KB.6–KB.11 monodromy, functoriality and Newton-polygon applications build on them.” The repointing of the design itself belongs to that design's review. Test: Scope then names every KB layer that overlaps §4.0, and the dependency check (below) is unchanged because no supplier edge is added.

Reviewed at the pull request's current head 6c3c8b8 (confirmed against the board remote before reading). The four round-3 findings are repaired; the adversarial pass over every changed passage, the seeded sample, the dependency check and the elaboration found no P1 or P2. Four P3 notes follow; acceptance is conditional on the twelve declared supplier gaps listed at the end of Verified sound.

## Verified sound

### Round-3 findings, repair by repair

| Round-3 finding | Disposition | Repaired passage and verification at head 6c3c8b8 |
| --- | --- | --- |
| F01 (P1), de Rham Bessel identification inputs unowned | Repaired | README lines 596–608 (“Invariant parameters”: V*//T → Lie(H)_aff(1)//T_H, P_dual(ξ)=λ^h P(φ̃), λ=−π, three Checks), 610–622 (“Oper singularities and quantization”: Op_H as fibre product with the ϖ(0) and DS pole-bound subschemes, U(V)^T → Fun(Op_H) with associated graded the inverse quotient pullback, three Checks), 624–639 (“Parahoric localization and the de Rham eigenvalue”: opposite-Iwahori/I(2) levels, goodness, half-canonical line, moment-map and U(V)-flatness, full-character specialization, clean extension, Hecke identity, central descent, six Checks), 641 (“identified with the de Rham eigenvalue by the parameter, quantization and localization theorems above”), 647 (route order), 652 (API), 668 (*Needs:* FormalConnectionsOpers §§F4–F5, F8.4; AffineLieAlgebras §§A7–A8). Scope line 13, contracts lines 107–113, Layer 4 dependencies line 820, Suggested.lean lines 24–29, manifest lines 278–293 (zhu-fg, certified arXiv v2). Each item of the round-3 repair list is present; sources check out at xz lines 2201–2289 and zhu-fg lines 377–443, 888–921, 950–1038 (values below). |
| F02 (P2), residue-degree Frobenius iterate | Repaired | README line 426 (“compatible with local partial Frobenius and the residue-degree iterate of global partial Frobenius, between the truncations specified below”), line 428 (r=deg(v), κ(V) from lh line 1682, τ^j-twisted discs, bounds s → s+rκ(V), deg N enlarged, “Θ_(n,s+rκ(V)) ∘ Fr_local = (Fr_global^[r])^diamond ∘ Θ_(n,s)”), line 432 (route), line 440 (API) and line 448 (degree-two Check). Matches lh lines 1870–1876 and 1682–1684; page 36 for line 1682 confirmed (marker at lh line 1674). |
| F03 (P3), ghs page | Repaired | README line 474 and `sources.toml:31` now read “Theorem 2.1(iii), p. 6”; ghs line 249 is the page-6 marker and clause (iii) is ghs lines 266–269. The pp. 6–7 locator for Theorem 2.3(iv)–(vi)/Corollary 2.4(ii) is kept and is right (ghs lines 284–327, page-7 marker at line 291). |
| F04 (P3), repeated dependency citations | Repaired | A script split all 62 `*Needs:*` and layer-dependency lists on “;”, stripped parenthetical annotations and compared items: no list contains a repeated citation. Spot checks: line 548 “§3.3 (normal-image and coefficient transport); §3.4”; line 229 one MotivesAndAlgebraicCycles §6.3; line 732 one SR.3.3; line 1304 and 1383 merged §8.0 annotations. |

No round-3 finding was marked “not actionable in this package”; nothing is re-raised.

### Source sample (the fifteen seeded targets, plus every locator the repairs added)

No author-flagged unverified locator exists in the manifest (all sixteen entries `certified`). Printed pages were read off the `=== page N ===` markers of the cached texts.

| Target | Text checked at its locator | Outcome |
| --- | --- | --- |
| 0.4 | ghs Lemma 3.5(a)–(b), p. 9, ghs line 384–398; ty Lemma 1.4(3)–(6), p. 6 (marker at ty line 196), ty line 215–235 | “At most one way” and the Arthur-style centralizer argument are as restated; existence is correctly not claimed. |
| 1.1 | laf02 Corollaire VII.8, pp. 201–202, laf02 line 11609–11623, with the equivalence χ⁻¹χ′ pure of integer weight at line 11606; ch26 (5.5), p. 14, ch26 line 643 | Absolute (all-conjugates) decomposition, unique, almost all summands zero: matches. |
| 1.2 | ch26 Proposition 2.7, p. 8, ch26 line 353–369 | Hypothesis geometric ρ_u; conclusions (a)–(c) match, including purity of weight i of the graded local WD representation. |
| 3.3 | ch26 Theorem 3.8(1)–(3), p. 10, ch26 line 473–484; ghs Theorem 2.1(iii), p. 6, line 266; Theorem 2.3(iv)–(vi), pp. 6–7, line 284–307; Corollary 2.4(ii), p. 7, line 320; fs Theorem I.9.6(ii), (vi)–(vii), p. 36, fs line 1331, 1337 | Normal-image compatibility, pro-p Iwahori torus parameter, irreducible-implies-supercuspidal, products and Weil restriction all present. |
| 3.6 | ch26 Proposition 3.10(2) and proof, pp. 10–11, line 492 and 504–506 | Source states the q_F-valued criterion for every torus; package restricts it (see Source issues) and the unramified-quadratic counterexample below refutes the source's form. |
| 3.7 | ch26 Proposition 3.10(3), pp. 10–11, line 494 and 506 | Induction, Jacquet, products, twists listed; source proof is one line, package supplies the finite-Hecke-image route. |
| 4.0 (anchor) | hny Theorem 1 and 2, p. 17, hny line 950–979 (p>2 for B,C; p>3 for F₄,G₂); xz Corollary 4.5.7, pp. 53–54, line 2478–2502; Remark 4.5.8(i), (iv), p. 54, line 2503, 2512; ghs Proposition 3.9/Remark 3.10, pp. 10–11, line 450–492; xz §4.3.1, p. 47, line 2175–2178; Lemma 4.5.5 and (4.5.5.1), pp. 52–53, line 2425–2437; §4.4.2 and Theorem 4.4.4, p. 50, line 2314–2331; andre-bessel Proposition 3.2, line 393–399 | All as restated; the small-prime lifting is Remark 4.5.8(i); the A₄ image at p=2 is 4.5.8(iv). |
| 4.0 (new blocks) | xz Theorem 4.3.3, p. 47, line 2201–2205; §4.3.4 and (4.3.4.1)–(4.3.4.2), pp. 47–48, line 2207–2242; §4.3.5 and (4.3.5.1), pp. 48–49, line 2243–2276; §4.3.6, p. 49, line 2277–2289; §4.4.1 and (4.4.1.2), pp. 49–50, line 2292–2299; zhu-fg Theorem 8, p. 9, line 377–382; Corollary 9, p. 10, line 435–443; Lemma 17 and Remark 5.1, p. 20, line 888–906; Lemma 18, p. 20, line 918–921; (5.1) and the ∞ pole bounds, pp. 21–22, line 950–991; Lemma 21 and the clean-extension argument, p. 23, line 1008–1038 | Every statement of the three new blocks is a stated result or displayed formula of these passages; the two omitted local inputs are R01. |
| 5.1 | ch26 table (i)–(v) after Theorem 5.4, p. 13, line 619–634; Proposition 6.31, p. 24, line 1172–1179; Corollary 6.32, p. 25, line 1192–1198; Theorem 7.4, Corollary 7.5, Remark 7.6, pp. 26–27, line 1265–1295; (6.4)–(6.5) and Lemma 6.7, pp. 17–18, line 814–825, 858–862 | Test list, pairings 1/4 and 3/4, generic-unitary criterion and deformation argument match; the odd-unitary exception is Remark 7.6. |
| 5.3 | ch26 proof of Theorem 5.4, pp. 14–15, line 639–696 | Discrete-series and tempered-anchor cases; the Weil-number step for exponents at u is line 690–696. |
| 6.2 | st Lemma 11.4 and 11.5, p. 83, st line 4018–4041 | Filtration-stabilizer parabolic argument and semisimplicity step as restated. |
| 7.1 | ch26 (1.1)–(1.7), pp. 3–4, line 145–186 | N_ψ = dψ(e); j(Frob_w)=diag(q_w^{1/2},q_w^{−1/2}). |
| 7.2 | ch26 Conjecture 1.3, 1.8(a)–(c), Expectation 1.9, p. 4, line 167–205 | Conditions (a)–(c) are the package's (a)–(c); conjectural status retained. |
| 7.4 | ch26 Conjecture 9.1, (9.3), Definition 9.4, Conjecture 9.5, pp. 30–31, line 1468–1520 | Finiteness/base change, excursion decomposition, algebraic Satake classes. |
| 7.6 | xue Proposition 1 and Theorem 2, pp. 2–3, line 74, 88; Definition 3.6.5, Lemma 3.6.6, Theorem 3.6.7, Remarks 3.6.3 and 3.6.8, pp. 30–31, line 1389–1424; lh 6.10, 6.11, 6.13, pp. 46–48, lh line 2074, 2099, 2123 | Weil-group parameters, generalized eigenspaces, Satake compatibility, non-diagonalizability. |
| 8.6 | ch26 Theorem 10.3 and proof, pp. 33–34, line 1592–1615; Remark 10.7, p. 35, line 1681 | AZ(σ) hypothesis, split-place conclusion, vanishing N_i. |

### Computed adversarial record

Rows cover the sampled targets, the headline families and every passage the round-4 repair changed. q=4 unless stated; weights are geometric-Frobenius weights 2 log_q|λ|.

| Statement | Instances tried | Values computed on both sides | Result |
| --- | --- | --- | --- |
| Conventions | Tate line and inverse; degree-two place; rank 0 | 1/4 ↦ −2, 4 ↦ 2; eigenvalue 2 at q=4 and 4 at q=16 both give weight 1; empty multiset at rank 0 | Pass |
| 0.4 uniqueness | GL₂ diag(2,1/2); diag(1,16) | Ratio 4=q: N may join the eigenspaces, weights ±1, one Sp(2) up to conjugacy. Ratio 16≠q: N=0 forced, adjoint eigenvalue 16 unbounded, no completion | One versus none; pass |
| 1.1 twist classes | Over 𝔽₂, ℓ=7: 1+i, 1+2i; constant 3 over 𝔽₄ | (1+i)(1−i)=2=2¹: weight 1, trivial class; (1+2i)(1−2i)=5, 5≠2^w: nontrivial class; both are 7-adic units (7 inert in ℤ[i]); 3 has weight log₂3=1.585… | Pass |
| 1.2 propagation | Constant 2; constant 3; Kl_n | Weight 1 at u and at the degree-two place (4 over 16); 3 fails at every place; Kl_n has one graded piece of weight n−1 | Pass; anchor hypothesis necessary |
| 3.1 Frobenius iterate | 𝔽₁₆=𝔽₂(α), α⁴+α+1=0; s=3, κ=2, r=2; r=1 | α⁴=α+1≠α; (α+1)⁴=α⁴+1=α; α¹⁶=α; bounds 3→5→7; r=1 gives 3→5 and one operation | Pass; matches lh line 1876 |
| 3.3 operations | GL₂ St and trivial; product of unit parameters; twist by −1 | Both pairs (2,1/2), N-ranks 1 and 0; 1·1=1; 2 ↦ −2 | Pass |
| 3.6 tori | Unramified quadratic, q_F=4, q_E=16: χ(ϖ_E)=4, 2; E=F(t^{1/p}) | λ²=4 ⇒ λ=±2, weight 2log₄2=1=2log₁₆4; λ²=2 ⇒ weight 1/2, not geometric although 2 is a Weil 4-number of weight 1; (F̄[u]/u^p)^× = G_m × unipotent of dimension p−1 | Pass; refutes the source's q_F criterion |
| 3.7 stability | Principal series with support (2,1/2) | Constituents trivial and St, same pair, both geometric | Pass |
| 4.0 invariant quotient (new) | A₁ coordinates (1,1), (1,0); scaling by λ | ab=1 and 0; λ²·1, λ²·0; (a,b)~(−a,−b) under t=−1∈T, so λ and −λ give one orbit in A₁ | Pass; sign invisible in A₁ as stated |
| 4.0 parameter equation (new) | A₁, p=5, P(φ̃)=1; candidate 2π² | c=(−π)²=π²; 2π²−π²=π²≠0 while both have residue N and slope 1/2 | Pass; the equation does the work residue and slope cannot |
| 4.0 sign (new) | A₂, h=3 | c=(−π)³=−π³; +π³ differs by 2π³≠0 in characteristic 0 (p=2: π=−2, c=8 versus −8) | Pass; fixes λ=−π |
| 4.0 oper space (new) | A₁: c=0, c≠0, x²E | Slopes 0, 1/2, 1 against bound 1/h=1/2; residue N in all three | Pass; zero parameter inside, x²E outside |
| 4.0 DS pole bounds (new) | A₁, d₁=h=2 | Source bound t^{−d_ℓ−1}=t^{−3} for the top coefficient (zhu-fg line 986); d+(N+cxE)dx/x at t=1/x becomes ∂_t−N/t−cE/t², and the ρ̌-gauge to the form ∂_t+N+v(t) raises the E term to order 3 | Pass; “at most h+1 for degree h” is the source's bound |
| 4.0 quantization normalization (new) | A₁ generators a,b | ab has PBW degree 2, symbol ab; at (1,1) value 1, doubled map gives 2 | Pass; gr map pinned |
| 4.0 localization sign (new) | η(t)=λt on E_η=(O,d−dη) | ∇_{∂_t}1=−λ; −∂_t acts by λ; λ=−π gives +π and −π | Pass; internally consistent with the parameter equation |
| 4.0 moment map (new) | A₁ chart V≅A² | dim V=2, dim T*V=4, fibre of T*V→V* is V, dimension 2; fixing only ab leaves one free coordinate | Pass |
| 4.0 full character (new) | (a,b)=(1,c), (2,c/2) | Same invariant c, different exponential modules on the chart | Pass; U(V) versus U(V)^T distinction is real |
| 4.0 Hecke unit (new) | W=1, two unit factors | Be_{H,1}=d; 1·1=1 | Pass |
| 4.0 central descent (new) | SL₂→PGL₂, μ₂ | Kummer x^{1/2}: monodromy −1 at 0, not unipotent; a μ₂-system on A¹ is trivial since π₁(A¹)=1 in characteristic 0 | Pass; uniqueness needs the unipotence condition |
| 4.0 slope/rigidity | A₁; G₂ at p=2,3 | r(h+1)/h=3/2 and 14/6; Irr≤1, ≤2; boundary at 0 of dimension r forces Irr=r and (Lie H)^{I_∞}=0 | Pass |
| 4.0 inertia at p=2 | SO₃ image A₄ | (3·1+3·(−1)+8·0)/12=0 | Pass |
| 4.0 trace transfer | Pure weight 0, q=4 | H¹_c eigenvalues of modulus ≤2, H²_c of modulus 4; A₁: L(T)=1−T/4 | Pass; no cancellation |
| 4.2 globalization | G_m, ξ=1; nontrivial derived group | Exactly Π=1, adjoint space 0; anchor with Swan r and no invariants | Pass |
| 4.5 pure completion | PGL₂ St | Weights (−1,1), N rank 1 | Pass |
| 5.1 separators | Dual SL₂ ν=(1/4,−1/4) at q=16; dual B₂ ν=(1/2,0); E₇ | Adjoint pairings 1/2,0,−1/2 (half-integral), standard ±1/4, eigenvalues 2,1/2 of weight ±1/2; vector pairings ±1/2,0,0,0 versus spin ±1/4 twice; ⟨ω∨₇,½ω₇⟩=3/4 | Pass; each listed separator is needed |
| 5.3 integrality | St anchor; hyperspecial compact anchor; constant 3 with no anchor | ±1; 0,0; log₂3∉ℤ | Pass |
| 5.4 generic Ramanujan | PGL₂ complementary pair (√2,1/√2); G₂ compact involution with ν=½ω₂ | Weights ±1/2 excluded; coroot values −1,2,−2,2,−2,−4 contain neither 4 nor 1/4, removing s_c gives 4 | Pass; central compactness essential |
| 6.2 elliptic temperedness | Elliptic PGL₂; GL₂ irreducible σ⊗|·|^{1/2} | Standard weights 0; the GL₂ twist has weights 1,1 and real part ≠0 | Pass; semisimple hypothesis needed |
| 7.1 Arthur data | ψ=1⊠std at q_w=4; trivial SL₂ with Frobenius diag(4,1/4) | Evaluation (2,1/2), N rank 1; weights ±2, unbounded | Pass |
| 7.2 prediction | Residual trivial PGL₂; diag(q^{1/4},q^{−1/4}) | Weights ±1 = eigenvalues of h on std; ±1/2 fails (a) | Pass |
| 7.4 discrete hypotheses | PGL₂ residual χ∘det; anisotropic G | Centre a acts by χ(a)², so χ²=1; A_disc=A finite-dimensional | Pass |
| 7.6 Xue quotient | ℚ̄_ℓ[T]/(T−a), a transcendental; ℚ̄_ℓ[T]/(T−a)² | Dimension 1, eigenvalue a, no number-field model; dimension 2 with nilpotent T−a: generalized eigenspace, not diagonalizable | Pass |
| 8.6 elimination | Dual Sp₆ (2,2,2); degree-two restriction | Central profile 3δ₁+3δ₋₁; extraneous δ₂+δ₁+2δ₀+δ₋₁+δ₋₂; at i₀=2 row 1 > column 0 contradicts c(i₀)>r(i₀); 2→4 with 4→16 keeps weight 1 | Pass |

Definitions determine their objects: for each of the three new §4.0 constructions the most plausible wrong model (λ=+π; invariant rescaled by 2; residue-and-slope only; specialization over U(V)^T; a central Kummer twist; one global Frobenius operation) is excluded by a stated equation or Check, as the rows record. The trivial semisimple group has no Coxeter-factor division (quotient and oper spaces are points, U(V)^T is the coefficient field).

### Library and ownership audit

Pins read from the content manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; content main `27c3e7d`.

| Pinned declaration opened | What it provides and does not |
| --- | --- |
| Mathlib/Data/Finsupp/Defs.lean:88 `Finsupp`; Mathlib/Data/Finsupp/Basic.lean:267 `Finsupp.mapDomain`; Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:355 `prod_eq_single` (additive `sum_eq_single`) | The carriers for §8.4 as the README's Mathlib contract says; nonnegativity comes from ℕ, the absent-index hypothesis stays. |
| Mathlib/RepresentationTheory/Basic.lean:48 `Representation` (abbrev) | Monoid homomorphism to linear maps; no topology, inertia or L-group. |
| Mathlib/RingTheory/WittVector/Isocrystal.lean:113 `class Isocrystal` | Module over K(p,k) with a Frobenius-semilinear equivalence at a point; no curve, connection or overconvergence. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:22,43 `TauCeti.IsSmoothDiscrete`; TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:47 `HeckeRing.GL2.Newform.satakeParameters` | As the Tau Ceti contract states: smooth discrete objects, and a classical newform Satake pair, not a reductive local Satake class. |

Greps of the pinned Tau Ceti and Mathlib trees for Weil–Deligne, lisse, shtuka, oper, Kloosterman and L-parameter carriers found only the Fargues–Fontaine, Witt-vector and triangle-group files above, none a carrier for a headline; the headlines are not statable at the pins, as the module docstring says.

Ownership by object: the roadmap service (main and 367 open heads) returns, for “Hecke eigensheaf”, “critical-level localization”, “Frenkel–Gross connection” and “quantized Hitchin”, only the parent GlobalShtukasAndFunctionFieldLanglands (open new-roadmap pull request, head 95c8832), whose README line 1872 states a cuspidality property of eigensheaves and line 2214 names KloostermanSheavesAndBesselIsocrystals as a consumer; the parent does not build the Kloosterman eigenobject. The KB design on the board plans the §4.0 objects in KB.1–KB.4 (R04); it is later in the merge order (line 259 against 243–244), so this roadmap is the owner, exactly as rounds 2–3 ruled. The resolver's single lead, KloostermanSheavesAndBesselIsocrystals §§KB.6, is that board design, cited only in Scope as a later consumer; not a supplier. No declaration of `Suggested.lean` exists, so no fully qualified name can collide.

### Cross-roadmap citations, suppliers and the merge order

New supplier citations added in round 4 were resolved: FormalConnectionsOpers is open new-roadmap pull request 1056 at head 9b62023; its README has `## F4. Intrinsic opers and the DS/Kostant slice` (item 4: Op_G(D) and Op_G(D×) as coefficient functors, closed immersion into every pole-bound stage), `## F5. Coordinates, functions and worked operators` (item 1: Aut(O) action and gluing over the torsor of formal coordinates on a smooth curve; item 2: Fun Op(D×)=lim A_N, Fun Op(D)=A_0, eval_q), and F8 item 4 “Export exact contracts: regular polynomial and punctured completed oper function algebras, evaluation characters, their topologies and coordinate action”, which also assigns the completed enveloping algebra and Feigin–Frenkel isomorphism to AffineLieAlgebras. AffineLieAlgebras is on main (its pull request 1201 is a revision and is not cited): `## A7. Vacuum center and proof prerequisites` (line 428: Z(V_κc) free on ℓ Segal–Sugawara states, identified with Fun Op_{G∨}(D)) and `## A8. Completed center and exact compatibilities` (line 491: completed modes identified with Fun Op_{G∨}(D×), PBW-symbol comparison). Both supply what the contracts at README lines 107–113 ask and nothing the §4.0 targets claim to own (the global fibre product Op_H, the level-vacuum supports, the localization and its Hecke identity stay here). The remaining citations were re-resolved against main or the listed open heads as in round 3; none moved.

The required dependency command exited 0 with this complete output:

```text
moved: GlobalShtukasAndFunctionFieldLanglandsPartII moved in the merge order from #27 to #243, right after its last supplier HeckeStacksAndLocalShtukas (ArithmeticGaloisRepresentations, LanglandsParameterStacks, MotivesAndAlgebraicCycles, DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurity, PadicDifferentialEquationsAndRigidCohomology, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 648 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the `moved:` line is the permitted one. The twelve gap slugs in `design/plan.json` (function-field-globalization; elliptic-pseudo-coefficients; discrete-series-number-field-model; reductive-central-reduction; spherical-adjoint-transfer; parameter-square-root-transport; stack-integer-weights; satake-constant-realization; exceptional-named-orbit-profiles; rigid-middle-extension-specialization; pure-isocrystal-geometric-semisimplicity; formal-to-differential-maximal-slope) each appear under Exact supplier contracts with the same `needs` sentence and a named supplier; none asks for what FormalConnectionsOpers, AffineLieAlgebras, the pins or an earlier roadmap already provide, and round 4 added no gap. The F01 repair needed none: its new prerequisites are owned targets.

### Lean, shape and policy

`lake env lean` on `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean` from the pinned content checkout: exit 0, no output, 3.6 s. The file is `import Mathlib`, one module docstring, an empty namespace: zero definitions, instances, theorems or examples, so the one-tactic padding probe and the binder comparison have nothing to apply to. A scratch file with `#check @` for the nine pinned names the README's Mathlib contract cites (Finsupp, Finsupp.sum, Finsupp.mapDomain, Finset.sum_comm, Finset.sum_eq_single, Representation, LinearMap, AlgebraicGeometry.Scheme, WittVector.Isocrystal) elaborated with exit 0; the elaborated types agree with the README's descriptions (ℕ-valued finitely supported functions and their margins; `Isocrystal` a class on a module over K(p,k)). No Lean process remains. The docstring names every headline family with its missing carrier, including the round-4 additions (singular oper spaces, critical-level localization, de Rham Hecke eigenobjects); Property A is correctly called auxiliary.

README: nine layers, each ending with Examples and Dependencies; Scope, Conventions, Exact supplier contracts, How to read the build, Downstream consumers, Worked examples, References present; the three new constructions each carry an API list and three or more discriminating Checks. Greps for LaTeX delimiters, process words, pull-request numbers, `set_option`, `lemma`, machine paths: none (R02 is the only ASCII macro leftover). Manifest: sixteen entries, unique keys, zhu-fg recorded once as certified arXiv v2 with `version_note`; no local path.

Acceptance is conditional on the twelve declared supplier gaps named above (listed in review.json).

## Not verifiable

- The exceptional neutral-orbit identifications of §8.5 remain the declared `exceptional-named-orbit-profiles` contract; the real-point root multiplicities were not recomputed this round (round 3 computed them; nothing in round 4 touched §8.5 beyond the dependency dedup).
- Beilinson–Drinfeld's level-structure localization theorem is cited through zhu-fg Theorem 8 (line 377, “summarizes the main result of [BD2]”); the unpublished [BD2] text itself is not in the manifest and was not opened. The package owns the specialized statement as a target, so no locator into [BD2] is required.

## Source issues

- **Error** in ch26 at Proposition 3.10(2), printed pp. 10–11: the source says a torus representation is geometric exactly when its values are Weil q_F-numbers; it should use q_E for induced tori and the L-parameter in general; affects a stated result.
- **Error** in ghs at Remark 3.10, printed p. 11: the source says the cited local monodromy makes the adjoint composite irreducible; it should say the adjoint inertia invariants vanish and the Swan conductor is the rank; affects a stated result.
- **Gap** in ch26 at the sketch after Theorem 4.3, step (1), printed p. 11: the source says the appendix realizes any discrete series as a local component of a cuspidal representation; it should say only common cuspidal support is obtained there; affects the proof.
- No mistake was found in the zhu-fg, xz, lh or xue passages opened this round.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6c3c8b8", "job": "REV-PKG-GlobalShtukasAndFunctionFieldLanglandsPartII~4", "model": "fable", "worker": "fable-rev160"} -->
