<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1780#issuecomment-6400530709 -->
Review (claude) of 7925ead

Verdict: needs_changes

1. **F01** (P2) gap:ordinary-wan-fitting requests what AutomorphicCongruences §2.22 already states

   Location: `packages/RankOneConverse/README.md` line 108, "What AutomorphicCongruences must provide (gap:ordinary-wan-fitting): Supply the published ordinary Wan fixed-weight imprimitive two-variable Fitting bound after inverting p …"; also line 307 (`*Needs:*` of §2.2) and `design/plan.json` gaps entry with section "Layer 2: ordinary Rankin–Selberg reverse divisibility (required interface)".

   Claim: the ordinary Wan two-variable bound is a missing supplier interface.

   Witness: AutomorphicCongruences at board head b9d6195, `packages/AutomorphicCongruences/README.md` §2.22 "Wan's ordinary GU(3,1) Rankin–Selberg divisibility" (line 1163) states Wan Theorem 1.2 (p≥5, Γ_K-factoring avatar, κ≡0 mod 2(p−1), residual irreducibility over G_K, nonsplit q∥N, p-inverted fractional-ideal containment over Ô^ur_L[[Γ_K]]⊗L, "with the exceptional-prime and normality arguments of Wan20 §9") and names RankOneConverse as the importer. AutomorphicCongruences is at merge-order position 249, before this roadmap (252), so the citation is downward. Every clause of the gap's `needs` sentence is in that target (compared clause by clause against wan-2020 lines 125–132).

   Repair: replace the gap by the citation. In the AutomorphicCongruences contract write that §2.22 supplies Wan Theorem 1.2 in the stated form; in §2.2's `*Needs:*` replace `gap:ordinary-wan-fitting` by "AutomorphicCongruences §2.22"; delete the slug from the README's gap statement and from the package-stage `gaps` list in `design/plan.json` (its `section` label names a layer title that does not exist there). Tested: §2.2's route uses exactly Theorem 1.2 after inverting p plus Fitting base change and divisorial closure, which §2.22 plus pinned `TauCeti.fittingIdeal_baseChange` and PadicMeasuresIwasawaAlgebras §4.6 supply.

2. **F02** (P2) gap:gl2-full-forward is compound and its rank-zero clause duplicates EllipticCurveModularityPartII §6.0e

   Location: `packages/RankOneConverse/README.md` line 142, "prove that analytic order r ∈ {0,1} for a conjugate newform gives Mordell–Weil rank d r and finite entire Sha, and bridge the maximal-endomorphism-order and non-CM realization hypotheses …".

   Claim: HeegnerPointEulerSystems must supply the whole r∈{0,1} forward theorem for A_f and its quadratic twists.

   Witness: EllipticCurveModularityPartII (open head 46ba4f1, merge-order position 188) §6.0e "Unconditional rank zero for modular abelian factors" proves, for every weight-two trivial-character newform of any positive level and coefficient degree, L(f,1)≠0 ⇒ A_f(ℚ) finite; its contract table (line 138) restates it. The r=0 Mordell–Weil clause of the gap is therefore already provided, including for nonsquarefree twists. The sentence also bundles four distinct requests (r=0 Sha, r=1 rank, r=1 Sha, realization bridge), which the brief classes as a compound `needs`.

   Repair: cite EllipticCurveModularityPartII §6.0e in the HeegnerPointEulerSystems contract for rank-zero Mordell–Weil finiteness of A_f and of every quadratic twist, and narrow the gap to (i) finite entire Sha(A_f/ℚ) when L(f,1)≠0 and (ii) for ord₁L(f)=1: rank d and finite entire Sha, for A_f and for its nonsquarefree quadratic twists, with the realization bridge named as the hypothesis transfer for (ii). Update the same `needs` in `design/plan.json`. Tested on §4.3: the twist step needs only "L(f⊗χ_D,1)≠0 ⇒ A_f^D(ℚ) finite and Sha(A_f^D) finite"; the first conjunct is §6.0e, the second is clause (i).

3. **F03** (P3) ArithmeticStatisticsPartVI owns the elliptic coprime instances and is misdescribed as a consumer

   Location: `packages/RankOneConverse/README.md` lines 19–21 (Scope), 556 ("The general conclusions B and C supply the natural converse interface for the elliptic families of TauCetiRoadmap.ArithmeticStatisticsPartVI"), and the bodies of §§2.2, 2.4, 3.1, 5.1, 5.3.

   Claim: ArithmeticStatisticsPartVI consumes B and C; its ownership is confined to "coprime-discriminant comparisons and its marked CM image".

   Witness: ArithmeticStatisticsPartVI (open head 88461f2, merge-order position 156, earlier than this roadmap) states as targets "Anticyclotomic main-conjecture implication" (line 2262: char(X_∞)⊆(L_p^S) and L_p^S(1)=0 ⇒ H¹_𝔭≠0 for E/ℚ, (D,N)=1, inert residually ramified prime), "Heegner logarithm and low rank" (line 2278: squared-logarithm and height formulas, rank one and finite Sha over K), "Rank one selmer criterion" (line 1748: Theorem C for ≥2 odd prime factors via Bhargava–Skinner Lemma 8) and "Twisted rank one selmer criterion" (line 1764). It cites no section of this roadmap. An earlier roadmap cannot consume a later one.

   Repair: in §§2.2, 2.4, 3.1, 5.1 and 5.3 add one clause each: "the elliptic (D,N)=1 inert instance is ArithmeticStatisticsPartVI, ‘<target>’; the GL₂-type coefficients, ramified Case I and single odd nonsplit alternative are proved here". Rewrite line 21 and line 556 so that ArithmeticStatisticsPartVI is described as the owner of those instances, not as a consumer; name no earlier roadmap under Downstream consumers.

4. **F04** (P3) Scope omits ModularIwasawaMainConjectures §5.4 as owner of the main-conjecture rank-zero converses

   Location: `packages/RankOneConverse/README.md` line 23, "Broader CM, Eisenstein, supersingular and main-conjecture converses retain their own mathematical scopes; none changes the hypotheses of A–E here."

   Claim: the rank-zero converses elsewhere are out of scope and need no citation.

   Witness: ModularIwasawaMainConjectures (open head, position 250, earlier) §5.4 "The rank-zero p-converse" (line 1700) states (1) Skinner–Urban for E/ℚ, (2) Fouquet–Wan: finite discrete Bloch–Kato Selmer group of a weight-k newform iff L(f,k/2)≠0, and (3) for E/ℚ of arbitrary conductor, rank 0 and finite Sha[p^∞] ⇒ L(E,1)≠0, "the sufficiently-large-ordinary-prime consequence recorded by Skinner 2020 §1". Theorem E (§6.2) for d=1 is a special case of (3); skinner-2020 line 910 itself calls Theorem E an alternate proof of a special case of Skinner–Urban.

   Repair: name ModularIwasawaMainConjectures §5.4 in Scope as the owner of the main-conjecture rank-zero converses, and state in one clause how §6.2 differs (Skinner's route through Theorem B, GL₂-type coefficient degree d with the squarefree local alternatives, conclusion for the conjugate product L(A_f,s)).

5. **F05** (P3) three gap clauses request what declared or existing suppliers already give

   Location: `packages/RankOneConverse/README.md` lines 66, 72, 74.

   Claim: the sign table, the point-logarithm compatibility and isogeny invariance of Sha finiteness are missing everywhere earlier.

   Witness: (a) line 66: GrossZagierAndArithmeticHeights §8.3 (ε=(−1)^{#Σ(A,χ)} with the JSW (H) and ramified-Steinberg 11a1 examples), §4.2 (Saito–Tunnell) and §0.7 (base-change versus Rankin signs) give the sign dichotomy; AutomorphicGaloisRepresentations §6.4 gives the multiplicative a_p-dictionary and §7.7 the non-CM exclusion. (b) line 72: GrossZagierAndArithmeticHeights §9.20 already declares gap:point-kummer-logarithm to PadicHodgeRegulators L1 for the abelian point Kummer map and its logarithm; the clause "compatibility at p with point logarithms" requests it a second time from SelmerIwasawaCohomology. (c) line 74: invariance of entire Sha finiteness under an isogeny follows in two lines from SelmerIwasawaCohomology §2.12a (`abelianDescent_exact` and `abelianSelmerGroup_finite` for every isogeny, both directions via the dual isogeny).

   Repair: (a) cite GrossZagierAndArithmeticHeights §§0.7, 4.2, 8.3 and AutomorphicGaloisRepresentations §§6.4, 7.7 and keep only the explicit St/St⊗ξ inert-ramified table if the fix worker judges it not derivable there; (b) replace the logarithm clause by a citation of GrossZagierAndArithmeticHeights §9.20 and its declared supplier; (c) replace the invariance clause by a citation of §2.12a and keep the Weil-restriction isogeny and ± decompositions as the request. Mirror each change in `design/plan.json`.

6. **F06** (P3) dual-action convention differs from the source without the witness that makes it harmless

   Location: `packages/RankOneConverse/README.md` line 283, "Pontryagin duality uses (γ·φ)(x)=φ(γ⁻¹x), hence the inversion involution on the completed algebra."

   Claim: X_∞ is the Pontryagin dual with inverted Γ-action.

   Witness: skinner-2020 line 637 defines X_∞ as Hom_Λ(Sel_∞,Λ*), whose Λ-action is (λφ)(s)=φ(λs) with no inversion; the README's X_∞ is its ι-twist, so its characteristic ideal is ι(Ch_Λ). The containment of §2.2 survives because ι(L^S_𝔭(f)) is a unit multiple of L^S_𝔭(f): the interpolation data at ψ and ψ^c=ψ⁻¹ agree (L^S(f,ψ_alg,1)=L^S(f,ψ_alg^c,1), e_p is symmetric in 𝔭↔𝔭̄, Ω_p and e_∞ depend on n only, w(f,ψ) is a unit; skinner-2020 lines 560–576), and measures agreeing on a dense set of characters coincide. Computed: for ψ(γ)=a the two conventions evaluate L at a and a⁻¹, equal up to the unit W.

   Repair: add that clause and witness to §2.1's API bullet, or adopt the source's un-inverted Hom_Λ(Sel,Λ*) convention.

7. **F07** (P3) locators into the private text extraction and a backticked file name

   Location: `packages/RankOneConverse/README.md` line 569, "recorded in `sources.toml`. Line locators refer to the numbered legal-source extractions"; 31 occurrences of "lines N–M" in locators (for instance line 3, "pp.330–332, lines 66–153").

   Claim: extraction line numbers are source locators.

   Witness: the line numbers index the worker's cache extraction, not the published text; no supplier README on main or at the open heads used here (GrossZagierAndArithmeticHeights, HeegnerPointEulerSystems, SelmerIwasawaCohomology, ArithmeticStatisticsPartVI) carries them. The citation tool reports the backticked `sources.toml` as a Lean name declared nowhere.

   Repair: delete the "lines N–M" clauses and the sentence about numbered extractions, keeping theorem, section and printed page; write "the sources manifest" without backticks.

Files reviewed: `packages/RankOneConverse/README.md`, `packages/RankOneConverse/Suggested.lean`, `packages/RankOneConverse/metadata.toml`, `packages/RankOneConverse/sources.toml`. No previous review. The seven sources were read at the cited locators in the worker's cache; every supplier citation was resolved on main or at the open head named in the brief, and AutomorphicCongruences at its board head. Two findings are blocking (P2): two declared gaps request what earlier roadmaps already state. The mathematics of the seven layers is sound; no P1 was found.

## Verified sound

Principles. No route-specific shortcut: A–E are stated with Skinner's full hypotheses and GL₂-type coefficients (README §§3.1, 4.3, 4.4, 5.3, 6.2 against skinner-2020 lines 66–75, 78–83, 104–116, 145–153, 913–917). No re-planned roadmap: the five Heegner/height/logarithm constructions, Kummer/Sha carriers and level lowering are contracts, not targets. No upward citation or cycle: depcheck output

    depcheck: 53 roadmaps, 603 edges, 0 problem(s)

No copied passages (every locator checked reads as paraphrase), no algorithm, no `set_option`, no sorry'd data, no `lemma`, no LaTeX delimiters, no process words or pull-request numbers (grep). Suggested.lean elaborates with `lake env lean` from the content checkout: exit 0, no output, 2.9 s; it has no declarations, so the `#check @name` binder audit and the one-tactic padding probe have nothing to run on, and there is no padding.

Headline theorems. Listed from the README: residual restriction (0.1); rank-one localization at every λ (1.2); semilocal image and strict kernels (1.3–1.4); reverse divisibility, augmentation control and obstruction (2.2–2.4); Theorem B (3.1); BFH local-prescription nonvanishing (4.1); Theorems A, A′ (4.3–4.4); Theorem C (5.3); Theorem E (6.2). Statability at the pins was checked by object: Tau Ceti has `HeckeRing.GL2.Newform`, `ModularForm.L`, `analyticRank`, the Fricke sign (`NumberTheory/ModularForms/LFunction/Sign.lean` lines 148–172), `fundamentalDiscriminantChar`, `HasSplitMultiplicativeReduction`, `selmerGroup₂`, `AbelianVariety`, Mathlib `ContinuousCohomology.tateShafarevich`; it has no twist of a cusp form by a Dirichlet character (only Hecke "twisted slash" operators and Eisenstein `twistedDivisorSum`), no odd-p Selmer group, no Hasse–Weil L-function of an elliptic curve and no attached A_f. So A, A′, B, C, E and §4.1 are not statable with a few simple definitions, and the module docstring names each with its missing carrier. The docstring's reason for §4.1 could be sharpened to "no twist of a cusp form by a Dirichlet character as a cusp form", but the conclusion stands.

Sources, seeded sample (all 15 targets plus the conventions; no locator was flagged unverified). Each row: locator read, theorem number and page confirmed, hypotheses compared.

| Target | Source passage | Result |
|---|---|---|
| 0.1 | skinner-2020 lines 746–759, Lemma 2.8.1, printed p.347 | Statement and Borel/unipotent proof match; README's fixed-line argument is a correct rewrite |
| 1.1 | skinner-2020 line 113 (B(e)), lines 417–431 (Lemma 2.3.2, p.339) | Matches |
| 1.2 | skinner-2020 lines 381–392 (Lemma 2.2.2, pp.337–338); bsw-2026 lines 113–118 (Thm 1.1, p.3), 206–215 (Thm 2.3, Rem 2.4, pp.4–5) | Hypotheses dim A=[F:ℚ], real embedding, non-torsion point match; README repairs the source gap (below) |
| 2.1 | skinner-2020 lines 623–660 (§2.7, pp.344–345) | M, Sel_∞, X_∞, Panchishkin weights match; convention difference recorded in R06 |
| 2.3 | skinner-2020 lines 707–739 ((2.7.1), pp.346–347) | Matches; finiteness step is a source gap (below) |
| 2.4 | skinner-2020 lines 730–742 ((2.7.2), Prop 2.7.3, p.347) | Matches |
| 3.1 | skinner-2020 lines 104–120 (Thm B, p.331), 762–782 (§2.9, p.348) | Hypotheses (a)–(e) and three conclusions match |
| 4.1 | bfh-1990 lines 76–86 (Theorem (i)–(ii), printed pp.543–544; OCR prints (i) twice), 72–75 (sign rule), 3090–3224 (§9) | Even weight, trivial character, any level, S ⊇ primes of M; sign rule εD<0 simple zero, εD>0 nonvanishing match |
| 4.2 | skinner-2020 lines 874–891 (§3 (i)–(iv), pp.350–351) | Matches, including the two sign computations |
| 4.3 | skinner-2020 lines 66–75 (Thm A, p.330), 848–901 (§3) | Matches |
| 4.4 | skinner-2020 lines 78–83 (Thm A′, pp.330–331) | Matches |
| 5.1 | skinner-2020 lines 902–907; poonen-stoll lines 60–68 (Cassels alternating, p.1), 421–490 (Thm 5, Cors 6–9, pp.10–12) | Matches; Theorem 8 is on p.11 as cited |
| 5.2 | skinner-2020 lines 904–905 | Matches (Ribet lowering named) |
| 5.3 | skinner-2020 lines 145–153 (Thm C, p.332) | Matches |
| 6.1 | skinner-2020 lines 909–926 (§4, Thm E, pp.351–352); bfh-1990 lines 82–84 | Matches |
| Conventions | skinner-2020 lines 245–326, 328–337, 432–498 | Dual, geometric Frobenius, sign table, Cases I/II match |
| wan-2020 | lines 125–132 (Thm 1.2, pp.385–386), 394–427 (§2B, p.392), 3302–3446 (§7E, Prop 7.7, (7-2)–(7-6), pp.445–448), 4961–4981 (proof, pp.479–480) | Pages match the printed numbering (PDF page n = printed 380+n) |
| skinner-urban-author | lines 733–767 (§3.1.6, pp.19–20), 869–908 (Prop 3.2.8, Cor 3.2.9, pp.23–24) | Matches |
| brooks-2015 | lines 2106–2115 (Props 8.12–8.13, pullback rule, p.4239) | Matches; the square in Theorem 8.11 is retained by GrossZagierAndArithmeticHeights §9.16 |

Adversarial pass. Values computed on each side.

| Statement | Instances; values | Result | Change |
|---|---|---|---|
| Sign table (Conventions) | ε(f,K)=−∏ε_ℓ: two inert St: −(−1)(−1)=−1; one inert: −(−1)=+1; ramified St⊗ξ: −(+1)=−1; ramified St: −(−1)=+1 | Pass (skinner-2020 lines 296–311) | none |
| Euler polynomials | q=5,a=1: on V* 1−T+5T²; on V roots α/5,β/5 with α+β=1, αβ=5 give 1−T/5+T²/5 | Pass | none |
| Hodge–Tate weights | χ_cyc weight −1; V (0,−1); V*=V(−1) (0,+1); V⊗ψ⁻¹ at 𝔭 (n,n−1), at 𝔭̄ (−n,−n−1); n=2 gives (2,1),(−2,−3), two negative | Pass (lines 645–651) | none |
| Logarithmic Euler factor | (1+p−a_p)/p at p=5: a_p=1 → 1; a_p=0 → 6/5; zero needs a_p=6>2√5≈4.47; 2√p<1+p ⇔ (√p−1)²>0 | Pass | none |
| Heegner denominator | a_ℓ−1−ℓ at ℓ=2,a₂=0: −3; u=3 → −1; |a_ℓ|≤2√ℓ<1+ℓ for all ℓ | Pass (line 461) | none |
| 2πi normalization | q=e^{2πiz}: dq/q=2πi dz; f=q+… gives f dq/q=dq+O(q)dq; without 2πi leading 1/(2πi) | Pass | none |
| Scaling | [2]φ: log 1→2, log² 1→4, height ×4; ω→2ω with L fixed: c→c/4 | Pass | none |
| Idempotent at d=2 | M⊗M≅M×M, ε_f component (1,0), orbit projector (1,1) | Pass | none |
| 0.1 unipotent | 𝔽₅: U=(1 1;0 1), U²=(1 2;0 1), fixed line ⟨(1,0)⟩; 𝔽₂: U²=1; S₃ 2-dim rep restricted to C₃ splits, transposition eigenvalues 1,−1 | Pass | none |
| 0.1 argument | invariant line of ρ̄|G_K is the unique fixed line of the unipotent u (two invariant lines would diagonalize u); gℓ for g∈G_ℚ is again G_K-invariant | Pass | none |
| 1.1 predicate | id_ℚ: dim 1, ker 0 (yes); 0_ℚ: dim 1, ker ℚ (no); 0→P: dim 0 (no); ℚ²↪ℚ²: dim 2 (no); transport (3x/2,3x), h(loc 1)=(3,6)=loc′(e 1) | Pass | none |
| 1.2 | rank d=2: (A(K)⊗ℚ_p)⊗_{M_p}L has dim 2/2=1; (x,y)↦(x,0) has nonzero image and zero second component; BSW gives log_ω(x)≠0 at every σ hence each λ-component nonzero | Pass | none |
| 1.3 dimensions | local Euler characteristic at K_v=ℚ_p: 0−h¹+0=−2 ⇒ h¹=2; finite subspace = number of negative weights = 1; global: 0−h¹+h²=2−4 ⇒ h¹−h²=2; strict kernel dual to H² via Ш²(V*(1)=V) with all local H²=0 | Pass | none |
| 1.4 | diagonal image in L²⊕L², finite lines Le₁: intersection {(ae₁,ae₁)} dim 1, projections injective; axis image: intersection dim 2; axes on Le₂: dim 0; X∩F=loc(H¹_f) since H¹_f=loc⁻¹(F), so dim∈{0,2} refutes dim 1 | Pass | none |
| 2.1 dual | u-action: u⁻¹φ(ux)=φ(x); without inverse u²; Λ/(p) infinite, killed by p, char (p), zero after inverting p | Pass | R06 adds the ι-witness |
| 2.2 | (t²)⊆(t) forces t-divisor; reverse allows char=(1); p=5,n₀=8: κ=16, 8∣16, n₀>6; γ↦a⁻¹γ then γ↦a gives 1, γ↦aγ gives a²; (t)Λ^ur[1/p]∩Λ=(t)Λ since g(0)=0 | Pass | none |
| 2.3 | ℤ/p²: V_p=0; ℚ_p/ℤ_p: V_p dim 1; cokernel ℤ/p changes no corank, ℚ_p/ℤ_p adds 1; unramified kernel V^I/(a−1)V^I=0 for a≠1 | Pass | none |
| 2.3 finiteness (own check) | (M⁺)^{I_𝔭}=0 because Teichmüller inertia acts on T⁺⊗Λ* by ζ−1, a unit (p odd); M^I⊂T⁻⊗(Λ/(γ^{p^m}−1))*, N/(γ−1)N≅T⁻⊗ℚ_p/ℤ_p with Frobenius α; invariants (ℚ_p/ℤ_p)[α−1] finite since |α|=√p≠1; snake term Q[γ−1][α−1] finite | Pass; gap in the source recorded below | none in README (covered by gap:strict-anticyclotomic-control) |
| 2.4 | Λ/(t²): char (t²)⊆(t), coinvariants O rank 1; Λ/(t−p): t−p∉(t)Λ[1/p], coinvariants O/(p) rank 0; Λ/(p,t): char (1), rank 0; Λ: char 0, rank 1; pseudo-isomorphism changes coinvariant rank by 0 (finite kernel/cokernel) | Pass | none |
| 3.1 | orders (0,1),(1,0) sum 1; (1,1) sum 2 excluded; ℤ/5⊕ℚ₇/ℤ₇ finite 5-part, infinite; rank bound d·1 via Kummer injection into a line | Pass (lines 770–781) | none |
| 4.1 | BFH signs: ε(g)=+1,δ>0 → sign +1 value branch; ε(g)=−1,δ>0 → sign −1 derivative branch; D₀=−7,δ=17: −119≡1 mod 8, squarefree ≡1 mod 4 fundamental; 13≡1 mod 3 square in ℚ₃, 2 nonsquare; (s−1)³ odd of order 3; infinitude by adding a ramified prime of each excluded field to S₀ | Pass | none |
| 4.1 product discriminant | D₀ odd fundamental, δ≡1 mod 8 coprime (its primes lie in S₀ and split): D₀δ squarefree ≡1 mod 4, negative, same local characters at S₀ since δ is a local square | Pass | none |
| 4.2 | St⊗ξ ramified +1 → −1 global; two inert (St or St⊗ξ) each −1 → −1 global; one inert +1; q′ exists under both alternatives (second St prime, or the odd St⊗ξ prime made inert) | Pass | none |
| 4.3/4.4 | d=2: 1+1=2; a_q=+1 ↔ St (split), a_q=−1 ↔ St⊗ξ (nonsplit) agrees with Tau Ceti `frobeniusTrace_reduction_eq_one`; conductor 2q split at both fails both alternatives (lines 86–88) | Pass | none |
| 5.1 | #E(𝔽₅)≤5+1+2√5<11 ≤ 25; p=3: ≤7<9; ℤ/25 alternating pairing b(ng,mg)=nm·b(g,g)=0; ℤ_p⊕ℤ/p: (1,0) outside torsion image with rational part ≠0, (0,1) inside; kernel of H¹(ℚ_p,E[p])→H¹(ℚ_p,E[p^∞]) is E(ℚ_p)[p^∞]/p=E(ℚ_p)[p] under E(ℚ_p)[p^∞]=E(ℚ_p)[p] | Pass | none |
| 5.2 | genus 1+1/12−1/4−1/3−1/2=0; 1+3/12−1/4−0−1=0; 11a1 has rational 5-torsion so E[5] reducible, a₅=1 ordinary | Pass | none |
| 5.3 | Selmer over K: 1+0=1; (1,1) would give 2; K_𝔭=ℚ_p so restriction of the ℚ-line is the ℚ_p-restriction, injective | Pass | none |
| 6.1/6.2 | ε(f)=+1, ε(f,K)=−1 ⇒ ε(f⊗χ_D)=−1; δ>0 in the derivative branch; ranks 0+d=d; orders 1−1=0; (2,1) would give 3 ≠ 1 | Pass | none |
| Gaps: minimality | PadicMeasuresIwasawaAlgebras fixes O with finite residue field (README lines 214, 2346–2347), so gap:unramified-augmentation-divisor is genuine; SelmerIwasawaCohomology §4.28 proves only family parity (lines 2488–2502), so gap:ordinary-root-number-parity is genuine; §2.12 gives Sel_{p^∞} as a direct limit but not the Lemma-8 comparison, so gap:good-local-torsion-comparison is genuine | Pass | R01, R02, R05 for the rest |

Supplier resolution (every cited section opened at the head named in the brief): GrossZagierAndArithmeticHeights §§0a.3–0a.4, 3.2–3.4, 8.13, 8.17, 9.6, 9.7, 9.10, 9.13, 9.16–9.22 (8.13 and 8.17 give P_K(f)≠0 ⇒ ord L(A_f/K)=d with all real embeddings; 9.13 states the BSW theorem; 9.17 the ramified Case I formula; 9.22 the Skinner dictionary); SelmerIwasawaCohomology §§2.1–2.12a, 2.16–2.20, 2.24, 3.0, 3.8–3.16, 4.9, 4.24, 4.26, 4.28, 4.29 (4.29 proves the elliptic alternating pairing with divisible radicals and T×T reduced group); HeegnerPointEulerSystems §§1.4–1.6, 7.11–7.12; AutomorphicGaloisRepresentations §§1.4–1.5, 4.1, 6.1–6.4, 7.2, 7.5–7.7; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3.2, R16.3.5–R16.3.6, R16.4.6, R17.3.1, R17.3.8, R17.4; ArithmeticGaloisDuality R02.1.3, R02.3.1, R02.4.2–R02.4.4, R02.5.1; MetaplecticAutomorphicForms §§8.85–8.87 (8.85 assigns the final BFH deduction to the nonexistent RankZeroOneBSD, so §4.1 is correctly the owner here); SerreWeightAndLevelOptimisation §§2.10, 4.7–4.8; EllipticCurveModularity R29.5–R29.6; ArithmeticStatisticsPartI §0.6 contains the target "Squarefree integers in residue classes" with main term (6/π²)q⁻¹∏(1−p⁻²)⁻¹X and √X error; ModularCurvesPartII §7.2; PadicMeasuresIwasawaAlgebras §§1.1–1.4, 4.1–4.6, 5.1–5.2, 6.5 and ModularForms 10B–10C on main; EllipticCurves Layers 1–7 on main. Pinned declarations opened: `continuousCohomology` (ContCohomology/Basic.lean:131), `ContinuousCohomology.tateShafarevich` (Sha.lean:71), `ModularForm.L` (LFunction.lean:134), `AbelianVariety` (Basic.lean:95), `TangentSpace` (TangentSpace.lean:85), `Newform` (Newform.lean:104), `analyticRank` (AnalyticInvariants.lean:80), `selmerGroup₂` (SelmerGroup.lean:104), `fittingIdeal` (Basic.lean:343), `fittingIdeal_baseChange` (BaseChange.lean:134), all as the README describes. Ownership sweep by `roadmaps grep` for Skinner's converse, p-converse, Theorems B/C, parity conjecture, Kolyvagin–Logachev and Bump–Friedberg–Hoffstein over main and the indexed open heads: owners found are those in R03–R05; the board packages index was read (AutomorphicCongruences, KatoEulerSystems). Gaps: eleven slugs in `design/plan.json` match the eleven README contracts verbatim; none has supplier `none`.

Shape: Summary, Scope, Conventions, supplier contracts, How to read, Layers 0–6 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Definitions §§1.1, 1.4, 2.1 and the §4.1 selection API have ≥3 discriminating Checks; every theorem has hypotheses and a locator.

## Not verifiable

- bsw-2026 is an arXiv preprint (v2); its numbering is cited as read, no published version exists to compare.
- The constants in BDP/Brooks interpolation formulas (GrossZagierAndArithmeticHeights §9.22's claim that one Skinner archimedean identity is misprinted) were not re-derived; the README consumes them only as a contract.
- Wan's §7E and §9 internals were read only at the cited pages, not re-proved; they enter only through R01's supplier.
- Ownership against open pull requests whose files the brief did not provide was not checked.

## Source issues

- **Gap** in skinner-2020 at §2.7, printed pp.346–347 (lines 716–729): the finite-index claim for Sel_p inside Sel_∞[γ−1] rests on finiteness of the G_{K_𝔭}-invariants of the inertia-invariant coinvariants, asserted from the diagram without computation; it should be shown from the ordinary filtration (Teichmüller inertia kills the T⁺ part, unit root α≠1 on the T⁻ part); affects the proof.
- **Gap** in skinner-2020 at Lemma 2.2.2, printed p.338 (lines 388–392): freeness of A_f(K)⊗ℚ_p over M_{f,p} does not give injectivity of the restriction at each λ-component; it should use nonvanishing of the eigenlogarithm at every embedding (bsw-2026, Theorem 1.1); affects the proof.
- **Misprint** in skinner-2020 at §2.7, printed p.346 (line 705): the source says the two Iwasawa algebras are unique factorization ideals; it should be unique factorization domains; affects nothing.
- **Misprint** in skinner-2020 at §2.6, printed p.341 (line 523): the source writes the Heegner point with field and form exchanged; it should be the point P_K(f) defined in §2.4; affects nothing.
- **Misprint** in skinner-2020 at Lemma 2.8.1, printed p.347 (line 749): the tame inertia generator is said to be at q while the prime is ℓ; it should be ℓ throughout; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7925eadd4333fd9a93bddd6a07b463f22c64982a", "job": "REV-PKG-RankOneConverse", "model": "fable", "worker": "chris-i"} -->
