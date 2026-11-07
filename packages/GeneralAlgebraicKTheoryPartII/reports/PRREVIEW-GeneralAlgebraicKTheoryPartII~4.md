# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 010a850)

**Verdict:** needs changes

There are two findings, both P3; neither blocks. R01: §8.1 defines the ε-notions only for small categories, but §8.2, §8.3 and §8.1's own Check use them in large ones. R02: the plan still announces the old units-gap sentence. The previous review's R01–R03 and R05–R08 are repaired. Its R04 is repaired in the README; the plan's copy of that gap lags, which is R02 here.

## Status of the previous review's findings

- **R01 (James construction re-planned): repaired.**
  - README line 13 now reads "HomotopySpheres §§3B.1–3B.6 own the James reduced product … and the stable James splitting".
  - Line 190 consumes §§3B.1–3B.2, 3B.4, 3B.6 and §3B's CW approximation.
  - §§4.30b–4.30c are deleted. §4.32 (line 1263), §4.33 (line 1280) and §7.7 (line 1930) cite HomotopySpheres instead.
  - `Suggested.lean` has no James block. The `hatcher`, `james` and `lurie-ha` references are gone.
- **R02 (TC/p gaps): repaired.**
  - Line 59 consumes "§4.17 (TC modulo p and colimits), items (i)–(ii)".
  - §10.2 (line 2342) and §10.4 (line 2387) cite that section. Both slugs are withdrawn from the plan.
- **R03 (spherical lifts): repaired.**
  - Line 15 reads "RefinedTraceMethods §6.1 (Spherical lifts of perfect δ-rings) owns the spherical lifts".
  - The contract (line 61), the §6.1a route (line 1675), its Needs (line 1690) and the Layer 6 Dependencies (line 1799) all cite RefinedTraceMethods §6.1.
- **R04 (units contract): partly repaired.**
  - Line 200 now asks only to "identify BGL₁R=Ω∞bgl₁(R) … with the path component of R in the Picard space". Line 216 consumes E5's gl₁(R).
  - The plan's `needs` for this slug is still the old sentence; see R02 below.
- **R05 (James padding in Lean): repaired.** `Suggested.lean` declares nothing.
- **R06 (Dependencies omissions): repaired.** A mechanical comparison of each layer's Needs suppliers with its Dependencies line finds no omission in Layers 0–10.
- **R07 (plan gap list): repaired.** The plan's 21 slugs equal the README's 21 slugs.
- **R08 (THH assembly locator): repaired.** Line 2377 cites lrrv line 394 (Theorem 1.19(i), p.7), line 1396 (Theorem 6.1, p.25) and line 1082. I read all three, and `lrrv` is in the manifest.

## R01 (P3) — §8.1 confines the ε-notions to small categories, but §§8.2–8.3 and its own Check use large ones

Location: `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` line 1964: "Throughout this target, C is small stable idempotent-complete and T is thick." Line 1962 says the same.

Claim: T_F, T_ε, nilpotent and quickly converging towers, and ε-nilpotent limits are defined only for small C.

Witness: §8.2 (line 2016) uses them "In a presentable stable target"; §8.3 (line 2048) in the presentable Mot_κ(A); the Check at line 1981 in Sp. cmnn20 lines 300, 489 and 501 (Definitions 2.1, 2.15–2.16) take any C∈Ĉat^perf_∞.

Repair:
1. State the definitions and the first two API bullets of §8.1 for stable idempotent-complete C that need not be small.
2. Keep smallness only for the Verdier-quotient bullet "X∈T_ε exactly when its image in Idem(C/T) is an ε-object". The source restricts only that statement: cmnn20 line 339, Proposition 2.5, is for C∈Cat^perf_∞.
3. In §8.2, require ⊗ to be exact in each variable (cmnn20 line 481).
4. In §8.2's proof route, first pass to a small symmetric monoidal subcategory containing M, R and A, as cmnn20 line 801 does, and only then form C/J.

Tested on H(ℚ/ℤ)∈Sp, under the widened definition:
- N·id≠0 on ℚ/ℤ for every N≥1, so H(ℚ/ℤ) is not an ε-object (cmnn20 line 438, Example 2.10(6)).
- L_n^f H(ℚ/ℤ)=0, because Hℚ and every positive telescope kill it.

So the Check holds as written. In Mot_κ(A), §8.3's rational K′₀ hypothesis then becomes §8.2's hypothesis inside §8.2's stated scope.

## R02 (P3) — the plan still announces the pre-repair units gap

Location: `design/plan.json`, gap `spectral-units-and-lines`: "Supply GL₁R as the multiplicative unit components of Ω∞R and BGL₁R as the classifier of R-lines equivalent to R, for every E∞ ring R."

Claim: the intake posts this sentence on EllipticCohomology's job. It differs from the README's contract at line 200.

Witness: EllipticCohomology on main, README lines 1533–1536 and 1555–1556: E5 already builds gl₁(R) for every commutative ring spectrum R, with π₀ the units of π₀R, positive homotopy that of R, and bgl₁=Σgl₁.

Repair: replace the plan's `needs` for this slug with the sentence of README line 200. While there, drop "already" from `suslin-algebraically-closed-comparison`, so that every plan sentence matches its README contract.

Tested: I compared the 21 plan sentences with the README contracts, ignoring section prefixes. Exactly these two differ, and after the edit none would.

## Verified sound

**Gate, dependencies and build**
- My run of the gate on this head prints every check at 0 and ends `OK`, exit 0.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check output, verbatim: `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` exits 0 with no warning.

**Lean file**
- `Suggested.lean` has one module docstring, `import Mathlib` only, and an empty `namespace TauCetiRoadmap.GeneralAlgebraicKTheoryPartII`.
- There is no declaration, so the `#check @name` signature pass had nothing to elaborate, and there was no padding to probe.
- 26 of the 141 `Suggested.lean` files on main also open with `module`.

**Headline theorems** (README): Theorem A (§4.46), CMNN vanishing (§5.4), purity (§5.5), Theorem B (§6.1), redshift (§6.5), optimality (§6.6), A-theory purity (§7.7), Galois descent (§8.3) and the supersingular description (§8.8), the height-one theorems (§§9.1–9.6), sifted continuity (§10.2) and Farrell–Jones assembly (§10.5).
- Each needs spectra, ring-spectral K or TC, or telescopic localization, and none of these is at the pins.
- The docstring names each one with its missing carrier. No headline is statable at the pins, so an empty file is correct.

**Sampled locators** (15/15, read at the cited lines of the cached texts):
- 1.2: lmmt lines 590–607 (Kadd and hom, p.1023); hs line 3711 (Corollary 8.1.3, p.70).
- 2.2: lt line 1197 (Theorem 3.3) and line 1204 (Corollary 3.5), p.29.
- 4.9: lmmt lines 377–381 (consequence (ii) of Lemma 2.8, p.1018).
- 4.14 and 4.16: lmmt line 409 (Proposition 2.11(ii)–(iii), p.1019; proof at lines 423–430).
- 4.17 and 4.21: ravenel line 401 (Theorem 2.1(b),(d),(e),(f), p.361; proofs pp.362–363); lmmt line 903 (Corollary 4.12 and Remark 4.13, p.1030).
- 4.26: hahn line 62 (Theorem 1.6, p.2), line 172 (Definition 2.6), line 198 (Theorem 3.3, p.5) and line 337 (Definition 4.1, p.8).
  - g_(k+1) exists only for k+1≤h, which matches the README's range 1≤k<h.
- 4.37: weibel line 236 (Corollary 3.3, p.475) and line 469 (Corollary 5.4, p.485).
  - The OCR loses item (a), so I rendered the cached scan of p.475. It reads "If Λ is an S⁻¹ℤ-algebra, NK_*(Λ) is an S⁻¹ℤ-module".
  - The same page has the symbol formula α(t)*{γ,1−νy}={γ,α(νy)}, which matches §4.36.
- 5.2: lmmt line 1132 (Corollary 4.30, p.1035).
- 7.7: lmmt line 919 (Corollary 4.14, p.1030).
- 8.2: cmnn20 line 798 (Theorems 4.2–4.4, p.19), line 574 and line 580 (Propositions 2.22–2.23, pp.13–14), and lines 473 and 531 (Propositions 2.13 and 2.19).
- 8.3: cmnn20 line 975 (Theorem 5.6, p.22) and line 416 (Remark 2.9, p.9).
- 8.8: lmmt line 1002 (Corollary 4.21(iv), proof to line 1044, pp.1032–1033); goerss line 688 (Theorem 3.6, p.239).
- 9.3: lmmt line 1068 (Corollary 4.25) and line 1083 (Remark 4.26), pp.1033–1034.

Also read this round:
- lmmt lines 491–560 (Proposition 3.1, Lemmas 3.2–3.3), lines 765–799 (Proposition 3.12), lines 819–870 (Corollaries 4.4–4.7, Example 4.8) and lines 1056–1177.
- lt line 689 (Lemma 2.4).
- bsy lines 700–830 (Lemmas 2.35–2.37, Theorem 2.38).
- cmnn20 lines 300–316 and 430–440.

No README locator is flagged as unverified.

**Library declarations opened at the pins** (11):
- Mathlib:
  - `SSet.Quasicategory`: `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` line 41.
  - `CategoryTheory.Idempotents.Karoubi`: `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` line 43.
  - `CategoryTheory.Triangulated.TStructure`: `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` line 54.
  - `TStructure.bounded`: same file, line 262. It is `plus ⊓ minus`, each with its own existential bound, which matches line 33's remark on object-dependent amplitudes.
- Tau Ceti:
  - `ExactStructure`: `ExactStructure.lean` line 241.
  - `finiteProjectiveModulesExactStructure` and `…_eq_split`: `CartanMap/Basic.lean` lines 232 and 241.
  - `SplitK0`: `Split.lean` line 128.
  - `AbelianK0`: `Abelian.lean` line 79.
  - `TriangulatedK0`: `Triangulated.lean` line 152.
  - `SplitK0.finrankEquiv`: `FiniteDimensionalVectorSpace.lean` line 153, with its `[Small.{v} k]` hypothesis.

**Cross-roadmap citations resolved** (21):
- HomotopySpheres at head 0932a8a: §3B preamble with the CW approximation and derived models (lines 985–1010), §3B.1 (1012), §3B.2 (1022), §3B.4 (1040), §3B.6 with the natural stable and unreduced splittings (1062–1101), and the downstream note naming §§4.32, 4.33 and 7.7 here (3138).
- RefinedTraceMethods at head b0ad346: §4.17 DGM (2228), TC modulo p items (i)–(ii) (2240), henselian rigidity (2262), §4.15 "Stable K-theory is THH" with ΣTHH (2122), and §6.1 spherical lifts with the universal property for p-complete connective R (2553).
- EllipticCohomology E5 on main (1527–1571).
- ChromaticHomotopyTheory at head b049bb3, lines 7–13: it consumes §§4.2–4.33 from here and sends the James splitting to HomotopySpheres, so no object has two owners.
- KTheoryLowDegrees at head 4d2f327: §§1.1–1.3 (164–212) and §13.1 (1559). It has no nilpotent K₀ theorem, so `gap:nilpotent-kzero` stands.
- BordismFormalGroups F6.1–F6.5 on main (lines 555, 586, 760, 1248, 1526). No roadmap on main or at an open head states ⟨BP⟨n⟩⟩ or ⟨k(n)⟩, so §4.17 is owned here.
- No roadmap cites the deleted §§4.30b–4.30c (`roadmaps grep`).

**Declared gaps.**
- The README states 21 slugs, each once as "What X must provide (gap:…)", and the plan has the same 21.
- Apart from R02's wording, each is precise and minimal.
  - `relative-thom-colimit` stands because E5 forms Thom spectra only over bgl₁(S), while §4.31 needs R=S_p^∧.
  - `spectral-units-and-lines` now asks only for the Picard-component identification, which E5 does not state.

**Adversarial table** (values computed on both sides)

| Statement | Instances | Values | Result |
|---|---|---|---|
| Convention T(0)=S[1/p] | p=2, H𝔽₃ | T(0)⊗H𝔽₃=H𝔽₃≠0; Hℚ⊗H𝔽₃=0 | sound |
| §1.2 Kadd | finite-dim k-spaces; Perf(k) additively; X=ΣHk, Y=Hk | π₀Kadd=ℤ, not ℕ; additive K₀=⊕_jℤ maps e_j↦(−1)^j onto ℤ; π₋₁Hom=k, π₋₁hom=0 | sound |
| §2.2 restricted excision | identity square on Hk⊕ΣHk; k[ε]→k with F=0 | π₀ tensor k⊗_k k=k, correction algebra = A; both square errors 0 | sound |
| §4.9 | p=2: H𝔽₃, Hℤ, S/2 | L₁^(p,f)H𝔽₃=H𝔽₃=H𝔽₃[1/2]; L₁^(p,f)Hℤ=Hℤ[1/2]; S/2 is not T(1)-acyclic, so excluded | sound |
| §4.14 | ∅→*; K(ℤ/p,1)→* with E=Hℚ; S¹→* with E=Hℚ | 0→E fails unless E=0; H̃_*(BC_p;ℚ)=0 gives Hℚ⊗Σ∞_+BC_p≃Hℚ; for S¹ the augmentation Hℚ⊕ΣHℚ→Hℚ is not an equivalence, so the hypothesis fails | sound |
| §§4.15–4.16 | Σ^nHℤ/p→0; K(ℤ/p,n) | n-connective L_n^(p,f)-equivalence; reduced K(n)-rank of Σ∞K(ℤ/p,n) is p−1≥1, so not a T(n)-equivalence; m≥n+1, consistent with lmmt Remark 2.12 | sound |
| §4.17 | n=0 with H𝔽_p, Hℚ, S/q; n=1 with H𝔽_p | Hℤ_(p)⊗H𝔽_p≠0=Hℚ⊗H𝔽_p while H𝔽_p⊗H𝔽_p≠0; S/q: 0 on both sides; k(1)⊗H𝔽_p≠0=K(1)⊗H𝔽_p | H𝔽_p summand needed and stated |
| §4.21 | n=1, i=2; rational degree −2 | T(2)⊗BP⟨1⟩=0; π₋₂BP⟨1⟩⊗ℚ=0 versus π₋₂E(1)⊗ℚ=ℚ | sound |
| §4.26 | p=2, P(2); h=1, 2 | res P(2)=4 versus res(P(1)+P(1))=2, difference 2=res tr(1); c(2)=2·1≠0 in a free E₀-module of rank 2^(h+1)−1 with 1 a basis element; h=1 gives an empty range | sound |
| §4.37 | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε²; ℤ/9→𝔽₃ | 2 invertible on NK (Corollary 3.3(a)); 2·[1+εx]=[1+2εx]=0; K₁(ℤ/9,(3))={1,4,7}, of order 3 | sound |
| §4.46 Theorem A | H𝔽_p at n=1; Hℤ in part (ii) at n=1 | L₁^(p,f)H𝔽_p=0 gives L_T(1)K(𝔽_p)=0, consistent with Hℤ_p; at n=1, L_T(1)Hℤ=0 would force L_T(1)K(ℤ)=0, which is false | n≥2 needed and stated |
| §5.2 | A=KU, n=2; ℤ[1/p], n=1 | middle term is ku; at n=1, L_T(1)K(ℤ[1/p])≠0 while TC(ℤ[1/p])^∧p=0 | n≥2 needed and stated |
| §5.4 CMNN | n=2, 3 | L_T(2)K(S[1/p])=0 by Mitchell; L₁^(p,f)S has height 1 and Theorem B gives L_T(3)K=0 | consistent |
| §5.5 purity | Hℤ, n=1 | L_(T(0)∨T(1))Hℤ=Hℤ[1/p]; L_T(1)K(ℤ)≃L_T(1)K(ℤ[1/p]) with fiber K(𝔽_p) | consistent |
| §6.1 Theorem B | H𝔽_p, Hℚ, E_n, 0 | heights −1, 0, n, −1; K bounds 0, 1, n+1, −1; K(𝔽_p)[1/p]=Hℤ[1/p]≠0 attains 0 | sound |
| §6.1a with RefinedTraceMethods §6.1 | A=𝔽_p; E(k)♭ | 𝕎(𝔽_p)=S_p^∧ with π₁=ℤ/2 at p=2; p^∞-th powers in k[[u]] are k, so (π₀/p)♭=(π₀/𝔪)♭=k (bsy Lemma 2.36) | sound |
| §6.5 redshift | Hℚ; (H𝔽₂)^tC₂ at odd p and at p=2 | 0→1; at odd p: height 0, R⊗Hℚ=0, 2=0 on K so L_T(1)K=0, excluded by the rational hypothesis; at p=2: R[1/2]=0, height −1, excluded | sound |
| §6.6 optimality | E₀(L); M=ku/p, n=1 | L_T(1)E₀(L)=0 but L_T(1)K(E₀(L))≠0; T(0)M=0, T(1)M≠0; stable K is ΣTHH(S;M)=ΣM | sound |
| §7.7 | W=S²; W with a type-2 suspension spectrum, n=1 | Σ∞S²[1/p]≠0, so the hypothesis fails; for type 2, T(0) and T(1) kill every W^∧r | sound |
| HomotopySpheres contract (§4.32 input) | W=S², r=1, 2 | relative cells of dimension ≥2r+2 give (2r+1)-connective, and 2r after looping; J₂S² has one 2-cell, S²×S² has two | matches §3B.2 |
| §4.33 | W=S², E=Hℚ; M(ℤ/3,1) at p=2 | summands S^(2r) have rational homology ℚ in positive even degrees, so the hypothesis fails; ΣS/3[1/2]≠0 | sound |
| §8.1 (R01) | H(ℚ/ℤ)∈Sp; Σ=∅ | N·id≠0 for all N, so not ε; L_n^f kills it; T_(ε,∅)=T because F=0 is allowed | true, but Sp is outside the stated scope |
| §8.2 | Perf(ℚ), R=ℚ×ℚ; A=ℚ×ℚ | coordinatewise product, while E₁₂E₂₁=E₁₁≠E₂₂; 1⊗e₁≠e₁⊗1 | sound |
| §8.3 | G=1; KO→KU | identity; [KU]=[KO]−[ΣKO]=2[KO], so ½[KU] maps to 1 rationally; perfectness is automatic (cmnn20 line 989) | sound |
| §8.8 | p=2, 3 | GL₂(𝔽₃) has 8·6=48 elements; G₂₄ has 12·2 elements; TMF(3) at p=3 is K(2)-acyclic | sound |
| §9.1 | Hℤ at p=2 | fiber K(𝔽₂) is K(1)-acyclic; L₁Hℤ=Hℚ≠Hℤ, so §4.19 cannot replace purity | sound |
| §9.3 | A=S, d=0, 1, 2 | smooth pieces S, S, Σ∞_+BΣ₂ versus flat S, S, S; π₀ is ℤ[x] for both | sound |
| §9.6 | p=2 | THH(ℤ[1/2])/2=0; K/2≃TC/2 for ℤ₂ in degrees ≥0; π₋₁TC(𝔽₂)=ℤ₂ versus K₋₁=0, a bounded difference | sound |
| §10.2 with RefinedTraceMethods §4.17(ii) | S⊔S=S | fold-map fibers L_T(n)K(S)≠0 and TC(S)/p≠0 | sifted needed and stated |
| §10.4 with lrrv | G=C₂×C₂, R=S | 4 summands Σ∞_+BG; omitting a C₂ loses one, so all cyclic subgroups are needed (Theorem 1.19(i)) | sound |
| §10.5 | G=ℤ, S₃; R=KU | ℤ has a terminal orbit, so assembly is the identity; S₃ has none and the T(2) claim rests on the theorem | consistent |
| §4.31 with the units gap | Hℤ; S_p^∧ | π₀GL₁(Hℤ)={±1}=π₁BGL₁ and the Picard component is connected; π₁BGL₁(S_p^∧)=ℤ_p^×∋1−p (lmmt line 934) | consistent with E5 |
| §4.31 sign map at p=3 | Ω²S³⟨4⟩→BO | π₂=ℤ/2 maps to π₂BO_(3)=0, so the map is null; π₃S_(3)=ℤ/3≠0=π₃Hℤ_(3) | sound |
| §4.32 slopes | p=3, m=2, i=1; p=5 | 1/16 versus 1/4, difference 3/16; 1/48 versus 1/8, difference 5/48 | sound |

## Not verifiable

- The second HomotopySpheres pull request (#284) and the BordismFormalGroups revisions (#1807, #1808, #1854) were not given with their files.
  - I did not read them. Ownership against them was checked only through `roadmaps overlaps`, which reports no dropped id and no conflicting head.
  - The James citation is resolved against HomotopySpheres at the head of #1287 only.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed page 1026: the source identifies colim_r Ω^r fib(K(S⊕Σ^rM)→K(S)) with ΩM; it should be ΣM, since stable K-theory is ΣTHH(S;M); affects nothing.
- **Gap** in barwick-lawson at proof of Corollary 4.2, manuscript page 7: the source localizes at the multiplicative set generated by Δ in π_*tmf, but Δ is not a class of π_*tmf; it should use a surviving power such as Δ²⁴; affects the proof.
