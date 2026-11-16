<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18047#issuecomment-6909376787 -->
Review (claude) of f81605e

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 9.1: the fibre-square and gerbe statement has lost the hypothesis "†-cohesive with a cotangent complex"

   **Location.** `packages/RationalAnalyticPrismatization/README.md` line 1449 (9.1): "…and π_X is a principal homogeneous space for … (T_X[1]{1})^† of 4.8 …; and that π_X is the fibre of a derivation d̃_X: X × Q_p^HT → (T_X{1}[2])^†, so that for formally smooth X with tangent bundle T_X, π_X is an epimorphism and a gerbe".

   **Claim.** The sentence has three parallel clauses: "that for a Gelfand stack X …; that for †-cohesive X with a cotangent complex …; and that π_X is the fibre …". The third carries no hypothesis of its own, so it reads for every Gelfand stack X, and its gerbe consequence for every formally smooth X.

   **Witness.** ALRS Proposition 4.4.3(3), ALRS line 3496: the pullback square is stated for X †-cohesive with a cotangent complex, and the proof (ALRS line 3524) uses †-cohesiveness to evaluate X on the square of ALRS Lemma 4.4.2(3). Formal smoothness (4.6) presupposes a cotangent complex and not †-cohesiveness.

   **Repair.** Replace "; and that π_X is the fibre of a derivation d̃_X: X × Q_p^HT → (T_X{1}[2])^†, so that for formally smooth X with tangent bundle T_X," by "; and that, still for †-cohesive X with a cotangent complex, π_X is the fibre of a derivation d̃_X: X × Q_p^HT → (T_X{1}[2])^†, so that if X is moreover formally smooth with T_X a vector bundle,". Tested on the witness: the three hypotheses of ALRS line 3496–3504 (†-cohesive, cotangent complex, formally smooth with T_X a vector bundle) are then each in the sentence; the Checks are unaffected (GSpec(ℚ_p), A¹ and GSpec(C_p) are Berkovich spaces, †-cohesive by 4.4).

2. **F02** (P3) 9.7(3): the ideal pulled back from Div¹ is `I_{Div¹}`, not I_Δ

   **Location.** Line 1557 (9.7): "(3) along X_cyc → Q_p^Δ, I_BK pulls back to (log(q)/(q − 1)) and I_Δ along X_cyc → Div¹~ → Div¹ to (log q)".

   **Claim.** The pullback of I_Δ to X_cyc is the ideal (log q).

   **Witness.** I_Δ is the ideal of the Hodge–Tate locus of Q_p^Δ (8.4) and pulls back to X_cyc as ([p]_q) (8.1 first Check; ALRS line 4146). The ideal with zero set all of μ_{p^∞} is the one of Div¹, `I_{Div¹}` of 9.1: its pullback is `⊗_{n∈ℤ}` φ^n(I_Δ) (8.4 third Check, 9.8).

   **Repair.** Replace "and I_Δ along X_cyc → Div¹~ → Div¹ to (log q)" by "and the ideal `I_{Div¹}` of the Hodge–Tate divisor of Div¹ (9.1) pulls back along X_cyc → Div¹~ → Div¹ to (log q)". Tested: the translate n = −1 of {[p]_q = 0} is {`[p]_{q^{1/p}}` = 0}, the points with q = 1 and `q^{1/p}` ≠ 1, which lie in X_cyc and are zeros of log q and not of [p]_q; with n ≥ 0 they give all primitive p-power roots of unity, so the union over n ∈ ℤ is the zero set of log q, and ([p]_q) is a different ideal. The source has the same slip (Source issues).

3. **F03** (P3) 12.6: Spf(B⁺_pdR,X), `X^{pHT^}` and F̃ are used and never defined

   **Location.** Line 2112 (12.6): "Construct the maps Spf(B⁺_pdR,X) → `X^{pHT^} → X^{cone^}` (ALRS Construction 6.7.5, p. 171, ALRS line 9223) and prove that pullback along F̃: Spf(B⁺_pdR,X) → `X^{cone^}`, restricted to vector bundles, is the base change …".

   **Claim.** The statement of the Riemann–Hilbert comparison (a headline) determines its objects.

   **Witness.** `X^{pHT^}` occurs once in the README and Spf(B⁺_pdR,X) only in this sentence; neither is defined, and Spf(B⁺_dR,X) is not introduced either. In the source they are base changes along a point of BG_a^alg of a map built from a degree-one class (ALRS line 9222–9236); a reader of the README cannot recover this.

   **Repair.** Replace "Construct the maps Spf(B⁺_pdR,X) → `X^{pHT^} → X^{cone^}` (ALRS Construction 6.7.5, p. 171, ALRS line 9223) and prove that pullback along F̃: Spf(B⁺_pdR,X) → `X^{cone^}`," by:

   "Write Spf(B⁺_dR,X) for `FF^∧_{X^⋄}` of 9.5 (ALRS line 9222) and consider Spf(B⁺_dR,X) → `X^{HT^}` → `X^{cone^}` `×_{Â¹/G_m}` `Q_p^{HT^}` → `X^{cone^}`, the natural map, f̂ and the projection h. Prove that the three maps are 0-proper, that the first two have pushforward of the unit equal to the unit, and that h_*1 ≅ 1 ⊕ 1[−1], the second summand being the degree-one class of the Galois cohomology of the filtered ring B_dR (ALRS Example 6.1.7(3), p. 146, ALRS line 7896). Let BG_a^alg be the classifying stack of the algebraic additive group as an analytic stack (AnalyticStacks §3.8). The degree-one class gives a 0-proper map h′: `X^{cone^}` `×_{Â¹/G_m}` `Q_p^{HT^}` → `X^{cone^}` × BG_a^alg with h′_*1 = 1; define `X^{pHT^}` and Spf(B⁺_pdR,X) as the base changes of `X^{HT^}` and of Spf(B⁺_dR,X) along `X^{cone^}` → `X^{cone^}` × BG_a^alg, the map given by the point GSpec(ℚ_p) → BG_a^alg, and F̃: Spf(B⁺_pdR,X) → `X^{pHT^}` → `X^{cone^}` as the composite, both maps being 0-proper with pushforward of the unit equal to the unit (ALRS Construction 6.7.5, p. 171, ALRS line 9223). Prove that pullback along F̃,"

   Tested on X = GSpec(ℚ_p): h is the projection `Q_p^{HT^}` → Â¹/G_m, and over the Hodge–Tate point its pushforward of O is RΓ(Q_p^HT, O) = ℚ_p ⊕ ℚ_p[−1] (first Check of 11.2 with n = 0), a class in cohomological degree 1; so the shift is [−1], and the base change along the point of BG_a^alg removes exactly that summand, giving pushforward 1 as 12.6 uses. The source prints [1] (Source issues).

4. **F04** (P3) five subsections construct an object and have no API list

   **Location.** 8.5 (line 1393, "Construct the radius map κ"), 8.6 (line 1407, "Construct the factorization"), 10.2 (line 1643, "Construct a symmetric monoidal functor Φ"), 12.5 (line 2095, "Construct the first Chern class c^Δ_1"), 12.6 (line 2110, "Construct the maps").

   **Claim.** Every definition lists its API as bullets.

   **Witness.** Counted mechanically: 57 of the 93 subsections have "The API has the following laws."; of the 36 without, these five contain a "Construct" sentence (the other 31 have no "Define", "Construct" or "Call" sentence). Their laws are in the running statement, not in a list.

   **Repair.** Insert after the `*Needs:*` line of each, "The API has the following laws." and these bullets (each restates the subsection's own statement):

   - 8.5: "κ factors through X^Δ → `(D^×_{FF,X^⋄})^dR`, and a divisor D ⊆ 𝒳_T lying over `𝒳_{T,(r,s)}` gives a point of `X^Δ_{(1/s,1/r)}`." / "For †-cohesive X, X^Δ → `(D^×_{FF,X^⋄})^dR` is an isomorphism over (1, ∞) and `X^{Div¹~}` → X^Δ is an isomorphism over (0, p)." / "For †-cohesive X, φ induces `X^Δ_{(1,∞)} ≅ X^Δ_{(p,∞)}` with coequalizer X^HK and `X^Δ_{(0,1)} ≅ X^Δ_{(0,p)}` with coequalizer `X^{Div¹}`."
   - 8.6: "The composite `FF_{X^⋄} → X^{Div¹}` → X^HK is the map from `FF_{X^⋄}` to its de Rham stack." / "The square `X^{Div¹}` → X^HK over X^cone → (X^cone)^dR commutes, and is cartesian for †-cohesive X." / "`X^{Div¹}` → X^HK is an isomorphism over Div¹ ∖ Q_p^HT ≅ `Div^{1,dR}` ∖ GSpec(ℚ_p)."
   - 10.2: "For profinite Π, D(BΠ^cont) is the category of right C(Π, ℚ_p)-comodules in solid ℚ_p-vector spaces; it has a t-structure for which pullback to GSpec(ℚ_p) is t-exact and is the left-completed derived category of its heart." / "For profinite Π of finite p-cohomological dimension, GSpec(ℚ_p) → BΠ^cont is D-proper and descendable; BΠ^cont is !-able when Π has an open subgroup of finite p-cohomological dimension." / "Φ is symmetric monoidal, compatible with the forgetful functors to solid ℚ_p-vector spaces and natural in Π." / "If ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module for a compact open Π_0, Φ is fully faithful with D(BΠ^cont)-linear right adjoint Φ^R(M) = Γ(Π_0, M ⊗ C(Π_0, ℚ_p))."
   - 12.5: "c^Δ_1 is a map of animated abelian group stacks over Q_p^Δ and a weak theory of first Chern classes for X ↦ D(X^Δ) in the sense of Zav Definition 5.2.4." / "Over (0, p) it agrees with the pro-étale first Chern class and over (1, ∞) with the Hyodo–Kato one of 6.3." / "For f: P^d_X → X and d ≥ 1, `⊕_{k=0}^d` O{d − k}[2d − 2k] ≅ f^Δ_*O{d}[2d] through the powers of c_1."
   - 12.6: "f̂ is a T^dR_X{1}-torsor, suave with f̂_♮1 = 1, and f̂^* is fully faithful." / "The maps Spf(B⁺_pdR,X) → `X^{pHT^} → X^{cone^}` are 0-proper with pushforward of the unit equal to the unit." / "F̃^* on vector bundles is the base change along B⁺_dR,X → B⁺_pdR,X of Scholze's functor F."

   Tested: after the insertion the mechanical count gives no subsection with a "Construct" sentence and no API list.

Four findings: one P2 (a hypothesis of the source that the sentence structure of 9.1 leaves out of its third statement) and three P3 (an ideal named wrongly in 9.7(3); three objects of 12.6 that the README names and never defines; five constructing subsections without an API list). All three findings of the previous round are repaired. The dependency check and the elaboration pass, and every sampled locator agrees with its source.

## Previous findings

- **F01 (P2), 0.5 route for Gest Proposition 9.4: repaired.** Repaired passage, `packages/RationalAnalyticPrismatization/README.md` line 306: "let Σ_f: `C_{/Y} → C_{/X}` be composition with f. A correspondence from f^*U to V in `C_{/Y}` and a correspondence from U to Σ_f V in `C_{/X}` are the same datum". Compared with Gest line 3043–3059: the longest run shared with that proof is below nine words (shared-run search of the whole README against Gest). The two routes rewritten for the same pattern were read as well: 0.4 (ambidexterity, against Gest line 2232–2249) keeps the order of the argument, which the logic forces (unit, counit, criterion), in different sentences; 2.8 (left Kan extension, against ABLB line 2743–2746) agrees with the proof of ABLB Proposition 4.5.5.
- **F02 (P3), 10.5 against 10.11: repaired.** Repaired passage, line 1709: "for p-adic Lie groups G and H, not necessarily compact, and M ∈ D(B(G^cont × H^cont)), the pushforward of M along `s_{G×H}` … is computed one factor at a time". ALRS Remark 5.2.25 (ALRS line 5659–5662) is stated at this generality; the square is recomputed in the table below.
- **F03 (P3), 10.5 second Check: repaired.** Repaired passage, line 1722: "the identity functor in place of (−)^la would give all of C(ℤ_p, ℚ_p), the invariants would give ℚ_p and the smooth vectors the locally constant functions". The third Check now carries the control A = C^la(ℤ_p, ℚ_p) ⊂ B = C(ℤ_p, ℚ_p), recomputed below.

Pattern search. A route sentence that follows a source's proof: the whole README was compared again with ALRS, ABLB, Gest, RCSolid and HM for shared runs of nine words or more; what remains is listed under "Copyright". A statement narrower or wider than its source: found once more, R01. A Check that holds for every object: none found in the sections read this round.

## Verified sound

**Principles.** No route-specific shortcut (ℚ_p-coefficients are the source's restriction, ALRS Remark 1.27, declared in Scope and Conventions); no re-planned roadmap; no algorithm; no sorry'd data; no `set_option`; no process words, pull-request numbers, machine paths or LaTeX delimiters (searched).

**Dependency check** (output): `depcheck: 250 roadmaps, 2403 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. Merge order: AnalyticStacks line 355, MotivesAndAlgebraicCyclesPartII line 407, this roadmap line 408. None of the never-cite roadmaps is cited.

**Elaboration.** `lake env lean` on `packages/RationalAnalyticPrismatization/Suggested.lean` from the content checkout: exit 0, no output. The file is `module`, `import Mathlib`, one docstring and an empty namespace: 0 declarations, so no `sorry`, nothing for the one-tactic probe and no `#check @name` comparison.

**Headline theorems** (README Summary): comparison with the relative Fargues–Fontaine curve (11.6, 11.1, 11.4); pro-étale cohomology as twistor cohomology (11.7); Hodge–Tate stacks and Sen theory (11.2, 11.5, 11.8); decompletion (10.12, 11.9, 11.10); twistor duality (12.2–12.4); projective bundle formula (12.5); Riemann–Hilbert (12.6). All seven are named in the module docstring with the missing carriers. None is statable: `AnalyticRing`, `SixFunctor`, `GelfandRing`, `StefanichRing`, `Gestalt` occur nowhere in the pinned Mathlib and Tau Ceti. No stand-in, no padding.

**Library declarations at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, read from `lake-manifest.json`): 23 of 23 found at the cited file and line: `LightProfinite` (LightProfinite/Basic.lean:44), `LightCondensed` (Condensed/Light/Basic.lean:29), `MulRingSeminorm` (RingSeminorm.lean:61), `spectralNorm` (SpectralNorm.lean:381), `WittVector` (WittVector/Defs.lean:52), `WittVector.fontaineTheta` (FontaineTheta.lean:166), `BDeRhamPlus` (BDeRham.lean:75), `CondensedMod.IsSolid` (Solid.lean:83), `PadicComplex` (Complex.lean:137), `PadicInt.mahlerEquiv` (MahlerBasis.lean:353), `TauCeti.LocallyAnalytic` and `.eval` (LocallyAnalytic.lean:45, :85), `TauCeti.AnalyticStage.amiceMap` (Amice/Basis.lean:494), `spaY`, `frobeniusHomeomorph` (Y.lean:116, :220), `IsRadiusLowerBound`, `IsRadiusUpperBound`, `isRadiusLowerBound_comap_frobenius_iff`, `windowU`, `windowV` (Window.lean:102, :108, :149, :260, :267), `spaX`, `compactSpace_spaX`, `t0Space_spaX` (Quotient.lean:59, :259, :271). The README attributes no backticked Lean name to this roadmap.

**Cross-roadmap citations.** `roadmaps resolve` (index of 2026-11-16T06:21:33Z) leaves one lead, MotivesAndAlgebraicCyclesPartII Layer 0: it is a package on the board (its README line 100, "Layer 0: The Banach arc-site", with `Marc(A) ≃ Marc(A^u)` at line 138), earlier in the merge order. `Huber.GelfandSpectrum` is declared in `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` line 798 (§R3.9, README line 12470) and `Spectrum` in TropicalAndBerkovichArithmetic §0.1 at its open head. AnalyticStacks at its open head: the 35 consumed sections plus §2.1 exist as `###` headings (checked one by one); its Scope lines 22–23 hand Gelfand rings, Gelfand stacks, de Rham stacks and prismatization to this roadmap and put Gestalten outside its own scope. EnhancedDerivedSheaves has `isDescendable_colimit_of_uniformIndex` (its README line 1821); PadicFunctionalAnalysis §4.4 is "Amice's analytic basis" (its line 706). The overlap list reports no pull request that changes this roadmap, no dropped id and no id defined only by a revision.

**Declared gap.** `gap:proetale-v-comparison` (DiamondsAndVStacks §D6.5): same slug in the plan and at README line 160, named supplier, one sentence with its hypotheses; no roadmap on main or open states the comparison (`roadmaps grep`, no match). Sound as a contract. The other twenty plan entries are under "For the human reviewers".

**Sources: the seeded sample** (15 targets, each read beside the text; the author flagged no locator as unverified).

| Target | Locators read | Result |
|---|---|---|
| 1.1 | ABLB Definition 2.1.1 (609–621), Lemma 2.1.2 (622) | agree, p. 12 |
| 1.6 | ALRS line 590–596; ABLB Proposition 3.1.9 (1260–1275), Lemma 3.1.14 (1324), Definition 3.1.15 (1335–1344), Definition 3.2.8 (1658), Proposition 3.2.11 (1712) | agree |
| 2.3 | ABLB Lemma 4.2.11, Definition 4.2.12, Remark 4.2.13 (2235–2259); ALRS line 809–813, Lemmas 2.1.8–2.1.10 (820–878) | agree |
| 2.7 | ALRS Definition 2.2.3 (937), Remark 2.2.4 (941–963), Lemma 2.2.5 and proof (964–977) | agree |
| 3.6 | ALRS Lemma 2.5.2 (1178–1195), Proposition 2.5.3 (1197–1215) | agree |
| 6.2 | ALRS line 2352–2356, Remarks 3.2.4–3.2.5 (2357–2387), Definition 3.2.6, Example 3.2.7 (2394); ABLB Corollary 4.4.10 (2641–2650) | agree |
| 7.4 | ALRS Lemma 3.5.2 (2670), Proposition 3.5.3 (2685–2700), Definition 3.5.4, Remarks 3.5.6, 3.5.8, Lemma 3.5.7 (2735–2775) | agree |
| 7.5 | ALRS Definition 3.6.1 (2797), Proposition 3.6.3 and proof (2822–2837), Remark 3.6.4, Corollary 3.6.5, Example 3.6.6, Remark 3.6.7 (2838–2862) | agree |
| 8.7 | ALRS Theorem 4.7.1 and proof (4040–4060) | agree, p. 78 |
| 9.1 | ALRS Definition 4.4.1 (3413), Lemma 4.4.2 (3417–3477), Proposition 4.4.3 and proof (3481–3530) | hypothesis of (3): R01 |
| 9.9 | ALRS Lemma 4.10.2 (4348), Construction 4.10.3 (4355), Lemma 4.10.4 (4403), Construction 4.10.5 (4454–4473), Theorem 4.10.6 (4494–4507), Lemma 4.10.10 (4599–4612), Theorem 4.10.13 (4622–4660) | agree |
| 10.2 | ALRS Lemma 5.2.2 (4860–4880), Construction 5.2.3 (4906–4940), Remark 5.2.4, Lemma 5.2.5 (4957), Lemma 5.2.7 (5072); RJRC22 Theorem 5.7 (2227) | agree |
| 11.2 | ALRS Theorem 6.1.3 and proof (7798–7830), Example 6.1.4 (7868–7872) | agree |
| 11.6 | ALRS Theorem 6.3.1 (8082–8089), Theorem 1.15 (356–362) | agree |
| 11.9 | ALRS Theorem 6.4.1 and proof (8321–8348), Remarks 6.4.2–6.4.3 (8349–8360), Remark 1.22 (460–464) | agree |

Also read: Gest Proposition 4.4 (1081–1089), Proposition 6.21 and Lemma 6.22 (2225–2256), line 3041–3059; ABLB Lemma 4.4.3 (2414–2425), Lemma 4.5.1 (2690–2700), Proposition 4.5.5 (2737–2746), Lemma 3.1.17 (1428), Proposition 5.1.4, Theorem 5.1.7, Proposition 5.7.1, Definition 6.2.4, Lemma 6.2.5, Definition 6.2.8, Lemma 6.2.9, Theorem 6.3.1; ALBM Theorems 4.4.4, 4.4.6, 4.5.1, Corollary 4.5.2; ALRS Construction 2.1.2, Remarks 2.1.3–2.1.6, Definition 2.4.2, Proposition 2.4.5, Definition 2.6.12, Warning 2.6.13, Proposition 4.8.1, Construction 4.9.1, Remarks 4.9.2–4.9.3, Definition 5.2.23 to Lemma 5.2.28, the proof of Proposition 5.8.9 (7607–7622), Construction 6.7.5, Definition A.2.2; SixFF Proposition 5.16 (1554). All agree with the README except as in R01–R03.

**Adversarial table** (values computed in this round; the rows of round 2 for 0.2–0.5, 1.1–1.3, 1.7, 3.1, 3.4, 4.5–4.8, 6.1, 9.2, 9.4, 10.1, 10.3, 10.4, 10.10, 11.4, 12.6 carry computed values and were not redone).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.5 route (repaired) | f: {a, b} → ∗, U = ∗, V = (∗, ∗) | in C: Hom(f^*U, V) has 1 element, Hom(U, Σ_f V) has 2; on spans both sides are pairs (W_a, W_b) | two-sided only on Corr | none |
| 2.4(3), 2.8 (repaired) | A = C_p; C(S, C_p); non-perfectoid ℚ_p | totally disconnected and perfectoid; M = S; ℚ_p not in the basis | matches ABLB 4.4.3, 4.5.5 | none |
| 10.5 (repaired) | square for G, H; G = ℤ | B(G^c × H^c) `×_{B(G^la × H^c)}` BG^la = BG^c × (BH^c `×_{BH^c}` ∗) = BG^c; s_ℤ = id | cartesian; base change applies | none |
| 10.5 Check 3 (new) | A = C^la(ℤ_p), M = B = C(ℤ_p) | M^la `⊗_{A^la}` A = C^la ≠ C; M^la `⊗_{B^la}` B = C | control discriminates | none |
| 1.1 | ℚ_p[T] discrete; 0 | no p^n T extends (Σ p^k T^k leaves ⊕ ℚ_p T^k), A^b = ℚ_p; 0° = 0 | consistent | none |
| 1.6 | {|T| ≤ |p|} in ℚ_p⟨T⟩; f = 1, g = p | T = pU with U overconvergent: colim_{r>1/p} ℚ_p⟨T/r⟩; pU − 1 a unit for radius < p: zero ring | consistent | none |
| 1.8 | ℚ_p(μ_{p^∞}) uncompleted | Nil† = 0, †-reduction ≠ completion ℚ_p^cyc | uniformly perfectoid, not nilperfectoid | none |
| 2.3 | ℚ_p⟨T⟩; (∏ℤ_p)[1/p]; ⊕ ℚ_p[−n] | nuclear, eventually connective, not dualizable; compact, not nuclear; nuclear, π_{−n} ≠ 0 | three classes separated | none |
| 2.6 Check 4 | `K⟨T⟩_{≤0}` as quotient of `K⟨T_i⟩_{≤r}` | image converges on a fixed disc |T| < ρ, misses 1/(1 − T/c), |c| < ρ | not †-rigid, as stated | none |
| 3.6 | GSpec(ℚ_p); (O, T), (O, T²) on the disc | two classes (s = 0, s ≠ 0); zero loci ℚ_p, ℚ_p[T]/T² | consistent | none |
| 4.1, 4.3 | 0 → A¹ at C_p[ε]/ε²; two discs glued at 0 | fibre C_p·ε against a point; ℚ_p⟨S⟩ `×_{ℚ_p}` ℚ_p⟨T⟩ = ℚ_p⟨S, T⟩/(ST) | consistent | none |
| 5.1 | Y = ∅; G_a; weight | ∅(D) is a point iff D = ∅: G_m/G_m; `G_{a,A¹/G_m}`/V(I); I of weight −1 as in 3.6 | consistent | none |
| 6.3, Conventions | G_m; P¹; O(1) | O ⊕ O(−1)[−1], O(−1) = (ℚ_p, pφ); O ⊕ O(−1)[−2] with ω = O(1)[2]; (ℚ_p, p⁻¹φ) of isocrystal slope −1, bundle of slope one | twists agree in 6.3, 7.6, 9.8, 12.5 | none |
| 7.4 | Y = Marc(𝔽_p) | Marc(ℚ_p)^dR(A) = Marc(ℚ_p)(A^u) = point: GSpec(ℚ_p) | consistent with 6.3 | none |
| 7.5, 7.6 | A = C_p[ε]/ε²; λ = −1 | ℚ_p `×_{C_p}` A = ℚ_p ⊕ C_p·ε; π₀ = C_p/ℚ_p, π₁ = ker(A → C_p) = C_p·ε | square needs G_a^an, as stated | none |
| 9.1 | X = GSpec(ℚ_p); GSpec(K) | T_X = 0, π_X the identity; K^HT = GSpec(K) × Q_p^HT (used in 11.8) | holds for †-cohesive X | R01 |
| 9.7(3) | X_cyc; translate n = −1 | I_Δ ↦ ([p]_q); `I_{Div¹}` ↦ zeros at all of μ_{p^∞} = (log q) | wrong ideal named | R02 |
| 9.8, 9.9 | cyclotomic prism | φ(log q/(q − 1)) = p·[p]_q⁻¹·log q/(q − 1), φ(e⟨1⟩) = p⁻¹e⟨1⟩, so φ(e) = [p]_q⁻¹e; p⁻¹φ(log q) = log q | consistent with Conventions | none |
| 10.8 Check 1 | G = ℤ_p, A = Λ° | 1 = Δ(binom(x, 1)) needs r^{w(γ)} ≤ 1, false; ϖ^ϵ·1 lies in the image iff 2^{−ϵ} r^{w(γ)} ≤ 1 | π_{−1} ≠ 0 and ϖ^ϵ-torsion, as stated | none |
| 11.1, 11.7 | K = ℚ_{p²}; degree n | untwisted: 2, 4, 0; RΓ(Gal_K, ℚ_p): 1, 3, 0 (χ = −2); dim H¹ = n + 1 | twisted product required | none |
| 11.2 | C_p(n), n = 0 and n ≠ 0 | H⁰ = H¹ = K, H² = 0; all zero | Tate | none |
| 11.9 | X = GSpec(ℚ_p), G = ℤ_p | Hom(ℚ_p^×, ℤ_p) of rank 2 for every p | consistent | none |
| 12.1 | cusp R → k | k[1] → k²[1] is zero (df(0) = 0): `L_{k/R}` = k²[1] ⊕ k[2] | perfect, not of amplitude [−1, 0] | none |
| 12.2 | mirabolic, a = p; A¹/G_m | δ(p) = [pℤ_p : ℤ_p] = p⁻¹, as AnalyticStacks §4.2; ω = I[1] ⊗ O[−1] = I | consistent | none |
| 12.3–12.5 | P¹; G_m; d = 1 | f_*O = O ⊕ O{−1}[−2], dual O ⊕ O{1}[2] = f_*(O{1}[2]); O{1}[2] ⊗ O{1}[2] = O{2}[4] | consistent | none |
| 12.6 | X = GSpec(ℚ_p) | h_*O over the Hodge–Tate point = ℚ_p ⊕ ℚ_p[−1]; objects of the statement undefined | statement incomplete | R03 |

The statements and Checks of the subsections without a row in either round's table (0.1, 1.4, 1.5, 2.1, 2.2, 2.4, 2.5, 3.2, 3.3, 3.5, 4.2, 4.4, 5.2–5.4, 7.1–7.3, 8.1–8.6, 9.3, 9.5, 9.6, 10.6, 10.7, 10.9, 10.12, 11.3, 11.5, 11.8, 11.10) were read in full this round and each Check evaluated against its section; no contradiction was found, but only the values listed above were recomputed line by line.

**Shape.** 93 subsections in 13 layers; each has exactly one `*Needs:*` line and at least three Checks (counted); every layer ends with `### Examples` and `### Dependencies`; all seven top-level headings are present. API lists: R04. The manifest has 24 entries for the 24 works of the References, schema `tauceti-roadmap-sources/v1`, every entry certified, no local path; I fetched nothing and added no entry.

**Duplication by object.** `roadmaps grep` for Gelfand stack, Stefanich, twistor stack, analytic prismatization, Hodge–Tate stack and decompletion finds only AnalyticStacks' boundary sentences. Mahler's theorem and Amice's basis map are cited at the pins, not restated.

Overlap check: read AnalyticStacks (Scope and ownership, its 36 cited sections and its consumer note); for PrismaticCohomologyPartIII, AInfCohomology, PrismaticCohomologyPartIV, CohomologyComparisons, CrystallineCohomology, EnhancedDerivedSheaves and PerfectoidSpaces I relied on the object searches above, which find none of this roadmap's objects in them; nothing shared: AnalyticStacks owns analytic stacks, their six functors, Cartier duality and the two-level suave and prim maps and names this roadmap as owner of Gelfand rings, Gelfand stacks, de Rham stacks and prismatization; Gestalten are owned here (Layer 0) and by no other roadmap.

**Copyright.** Wording: the 15 sampled subsections and 9 further passages (routes of 0.4, 0.5, 2.8; statements of 2.4(3), 3.5, 4.6, 9.7, 9.8, 10.5) were read beside ALRS, ABLB and Gest, and the whole README was compared mechanically with ALRS, ABLB, Gest, RCSolid and HM. The longest shared runs in prose are 13 words (the five names of smoothness notions at ALRS line 1289; the equivalence of Gest Remark 9.6 at Gest line 3115) and 12 words (the definitions at ALRS line 1100, 1538 and 9569); each is a definition or a list of names that the statement forces, and the sentences around them differ. Longer runs are bibliographic titles and formulas. Arrangement: ALRS has the largest share. By number: Layer 0 ↔ Gest II–III, VI–IX; Layer 1 ↔ ABLB §§2–3; Layer 2 ↔ ALRS 2.1–2.2 with ABLB §4; Layer 3 ↔ 2.3–2.5; Layer 4 ↔ 2.6–2.7 and Appendix A; Layer 5 ↔ 2.8–2.9 and 3.1; Layer 6 ↔ 3.2 with ABLB §6; Layer 7 ↔ 3.3–3.7; Layer 8 ↔ 4.1–4.3, 4.7; Layer 9 ↔ 4.4–4.6, 4.7–4.10; Layer 10 ↔ §5 (5.1 last); Layer 11 ↔ 6.1–6.4 with 4.10; Layer 12 ↔ 6.5–6.7. Not one to one: 13 layers against five chapters and an appendix, with chapters 2–4 each cut across two or three layers, Appendix A merged into Layer 4, ALRS 4.7 split between 8.7 and 9.3, and 5.1 moved to the end of Layer 10. The `### Dependencies` lines force the order of the layers except for Layer 10, whose free position the README states. Reuse: no table, figure or list of exercises taken over.

Source independence: 24 passages compared with 3 sources by reading and the whole README with 5 sources by shared-run search, none shared beyond statement-forced definitions of at most 13 words; largest share ALRS, 844 of about 1311 locators; contents compared with ALRS: independent (order forced by the dependency lines, Layer 10 free).

## Not verifiable

- The statements of about 50 subsections outside the samples of the three rounds were read and their Checks evaluated, but not compared with their sources locator by locator.
- Laz65 Chapitre III (1.3.9): the OCR text is garbled (rounds 1 and 2); 10.4 rests on ALRS Theorem 5.2.14.
- ALRS line 4149 and line 9226: the extraction may lose exponents and signs; the two readings under "Source issues" were settled by the neighbouring lines (4147 for the exponent) and by the README's own computation (11.2 for the shift).
- Ownership against open pull requests was checked through the roadmap search tools at the heads they index, not by reading every open roadmap.

## Source issues

- **Misprint** in ALRS at Proposition 4.8.1(3), p. 80: the source says the ideal pulled back from the twistor stack of the point to the cyclotomic prism is the Hodge–Tate ideal of the prismatization; it should be the ideal of the Hodge–Tate divisor of that twistor stack, Definition 4.4.1; affects nothing.
- **Misprint** in ALRS at the proof of Proposition 4.8.1(3), p. 80: the source says the q-analogue of p evaluated at the n-th power of q has its zeros at primitive roots of order p^(n+1); it should be evaluated at the p^n-th power of q; affects nothing.
- **Misprint** in ALRS at Construction 6.7.5, p. 171: the source says the pushforward of the unit along the projection h has its second summand shifted by one in the homological direction; it should be shifted the other way, a class in cohomological degree one; affects nothing.
- **Error** in ALRS at Remark 6.1.5, p. 145: the source says that for unramified K the twistor stack of K is the plain product of the spectrum of K with the twistor stack of the point; it should be the Frobenius-twisted product, as global functions (ℚ_p, not K) show; affects a stated result.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (preprint 2026, author page), ABLB (arXiv 2025), Gest (lecture notes, author page), RCSolid (notes): 844 + 187 + 126 + 29 of about 1311 locators in `packages/RationalAnalyticPrismatization/README.md`.
- **Licence.** ALRS, Gest and Sch24 were read from author pages (`licence_class = "author-page"` in `packages/RationalAnalyticPrismatization/sources.toml`); no licence is stated for them.
- **Declared gaps.** `packages/RationalAnalyticPrismatization/design/plan.json` lists 21 gaps; the README declares one. Two have supplier `none` (`gestalten-affine-proper`, `gestalten-transmutation`), and the README states that content itself as Layer 0; eighteen name AnalyticStacks sections that exist at its open head.
- **Arrangement.** Inside Layers 7–12 the subsections run through ALRS §§3.3–6.7 mostly in the source's order (pairs under "Copyright"); I judged the order forced by the `*Needs:*` lines and the layers not one to one with the chapters.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f81605ef3ed06ff9425eefcd8ca69ab5de63b9ce", "job": "REV-PKG-RationalAnalyticPrismatization~3", "model": "fable", "worker": "chris-x89"} -->
