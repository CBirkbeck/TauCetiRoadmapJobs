# Review of IntegralIwasawaTheory (pull request #1306 at 539ca66)

**Verdict:** needs changes

This is an incremental re-review of the 21 README lines that changed since 78ec69e. `Suggested.lean` is unchanged. All three findings of the previous review are repaired. The repaired §8.4 states ranks in terms of the auxiliary set S′, but the README's description of S′ admits sets for which those ranks are false (P2). The corrected Sharifi pages hold in only one of two 189-page editions of the notes, and the reference does not say which edition it means (P3). The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only `sorry` warnings.

## R01 (P2) — §8.4: the new rank formulas need the source's conditions on the auxiliary set S′

Location: `TauCetiRoadmap/IntegralIwasawaTheory/README.md` line 1052: "Choose auxiliary S′ large enough to kill the ray class obstruction and prove canonical independence of S′." Line 1054: "Then `V^θ` has constant rank `#S′−1` and `B^θ` is free of rank `#S′+s−1`."

Claim: the rank formulas, and the projectivity of `V^θ`, hold for the auxiliary sets that Dasgupta–Kakde allow, and DK impose five conditions:
- S′ ⊇ S;
- S′ is disjoint from T;
- `S′∪T⊇S_ram`;
- `Cl^T_{S′}(H)=1`;
- the decomposition groups at S′ cover G.

The README asks only that S′ kill the ray class group. The formula `#S′+s−1` counts a `ℤ[G]²` factor of B at each place of `S_ram∖(S∪T)`. That count is only possible when S′ contains those places, which is DK's condition `S′_ram ⊂ S′`.

Witness: take H=ℚ(i), S={∞}, T={5}, S′={∞,13}. The class of 3+2i maps to (4,2) in `(𝔽₅^×)²`, which generates `Cl^T(H)≅ℤ/4`. But 2∉S′∪T. So V contains the factor `O*_w` at w|2, with `Ĥ⁰` of order e=2, and B^θ has rank 1, not 2 (dk lines 2971–2976, 3108).

Repair: in line 1052, replace "Choose auxiliary S′ large enough to kill the ray class obstruction" with: "Choose a finite auxiliary S′⊇S, disjoint from T, with `S′∪T⊇S_ram`, `Cl^T_{S′}(H)=1` and the decomposition groups at S′ covering G (Dasgupta–Kakde, §A.1, p. 78)". Tested on the instance above:
- S′={∞,13} is now excluded.
- S′={∞,2} is admissible, because the class of 1+i, which is (4,3), also generates `Cl^T(H)`.
- With S′={∞,2}, `#S′=2` and s=1, so V^θ has rank 1 and B^θ has rank 2. This agrees with the alternating sum 0−1+2−1=0 on each character, computed from `O^×=1` and `∇⊗ℚ` = trivial ⊕ sign.

## R02 (P3) — the Sharifi reference does not identify the edition that the corrected pages assume

Location: README line 1770: "Romyar Sharifi, *Iwasawa theory*, undated author lecture notes, 189-page edition; locators use its printed pages." Lines 414 and 906 now read "Propositions 3.4.1–3.4.2, pp. 90–91" and "Proposition 3.4.1, pp. 90–91".

Claim: the author's address has served two different 189-page versions of these notes, both undated, with different numbering and pagination. The new pages are right for the current version, and the replaced "pp. 89–91" was right for the earlier one. "189-page edition" does not tell a reader which version to open.

Witness:
- Current version: Proposition 3.4.1 is on p. 90 (sharifi lines 2682, 2690), Proposition 3.4.2 on p. 91 (lines 2712, 2719), and the pseudo-isomorphism is Corollary 3.2.16 (line 2483).
- Earlier 189-page copy of the same notes, fetched in October 2026: Proposition 3.4.1 is on p. 89 (lines 2638, 2664), and the pseudo-isomorphism is Corollary 3.2.15 (line 2454).

Repair: in line 1770, identify the edition by a marker inside the notes. For example: "the 189-page edition in which Corollary 3.2.16 (p. 83) is the pseudo-isomorphism of `A_∞^∨` with `X_∞^ι` and §3.4 begins on p. 90". This marker separates the two copies: the earlier one numbers that statement Corollary 3.2.15 and starts §3.4 on p. 89. All of the README's Sharifi locators (3.2.13–3.2.21, 3.3.9, 3.4.1–3.4.2, 4.2.17–4.2.19) already follow the current version.

## Previous findings

- R01 — repaired: line 1054 now says "Let `s=#(S_ram∖(S∪T))` … the presentation therefore has s excess generators". Line 1056 says "Assume in addition `S∪T⊇S_ram`, so that s=0 … quadratically presented". The rank statement this repair added needs the conditions on S′; that is R01 here.
- R02 — repaired: line 669 reads "(Washington 1975, Lemma 4 and proof, p. 184; Ferrero 1978, …)".
- R03 — repaired: (a) line 174 reads "(RJW, proof of Lemma 12.18, pp. 185–186.)"; (b) line 347 reads "Proposition 3.2.15 and Corollary 3.2.16, pp. 82–83"; (c) line 782 reads "AWS notes, §2.5, pp. 21–22."

## Verified sound

**Gate, elaboration, dependency check.**
- I re-ran the gate command from the brief at 539ca66. Every check is 0 and it ends with `OK`, exit 0. The worker's gate.md also shows `build=0`.
- `lake env lean TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean` gives exactly five `declaration uses sorry` warnings (lines 83, 95, 114, 123, 136) and nothing else, exit 0.
- Dependency check (`--movable`): `depcheck: 240 roadmaps, 2439 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty. `git diff 78ec69e 539ca66` touches only README.md (12+/9−). The folder holds README.md, Suggested.lean and metadata.toml.
- Signatures: I elaborated a scratch copy of `Suggested.lean` with `#check @name` for all 11 declarations. Its prefix is byte-identical to the file at the head, and the run exits 0. The types match signatures.md and the previous review; no binder was lost. Because `Suggested.lean` did not change, the previous review's one-tactic probe and its headline list (five stated on native carriers, the rest named in the docstring) still apply.

**Changed locators, checked against the texts.**
- Line 174: RJW Lemma 12.18 is at rjw line 3659, under the p. 185 head (line 3626). Its proof crosses to p. 186 (line 3669), where the total-exponent and phase step is (lines 3674–3694). Corollary 12.19 is at line 3695, on p. 186, which also confirms line 185.
- Line 347: sharifi Proposition 3.2.15 is at line 2470 (p. 82 starts at line 2456). Corollary 3.2.16 is at line 2483 (p. 83 starts at line 2480).
- Line 414: in the current version, sharifi Proposition 3.4.1 is at line 2690 (p. 90 starts at line 2682) and its proof runs to line 2717, on p. 91. Proposition 3.4.2 is at line 2719, on p. 91. The edition question is R02.
- Line 669: washington1975 has the "184" running head at line 350, Lemma 4 at line 358, and its proof ending at line 365, all before p. 185.
- Line 782: sharifi-aws has `f_k` at line 671 (p. 21) and `g_k(T)=f_k(υ(1+T)⁻¹−1)` at line 704 (p. 22 starts at line 679).
- Line 906: as for line 414.
- Line 1054:
  - dk equation (145), `B^θ` free of rank `#S′+#S′_ram−1`, is at line 3146, on p. 82.
  - `S′_ram=S_ram∖(Σ∪Σ′)⊂S′` is at line 3108.
  - Lemma A.4, constant rank `#S′−1` under tameness, is at lines 3205–3256, pp. 84–85.
  - Each `Ind W*_w` has rank one on every character (line 3254).
  - dksw Lemma 4.5 is at lines 1296–1323, pp. 36–37; the factors `W*_w` drop out under (A).
- Line 1056: dk Lemma A.5 (line 3258, p. 85) needs (A1) and (A2). DK (P1)–(P4) are at lines 1442–1466, pp. 39–40. dksw Theorem 2.2 (lines 251–262, pp. 7–8) is a quadratic presentation only "if we additionally assume (A)".
- Line 1070:
  - dk §A.4 (line 3277) assumes (A2) but not (A1), which supports "needs only the tame hypothesis".
  - Lemma 6.1 and Corollary 6.2 are at lines 1488–1497, p. 40.
  - In dksw §2.2, the index s is at lines 299–300, p. 9. There `Σ={w}∪{ramified v|2}` and s counts the ramified v∤2, which is `#(S_ram∖(Σ∪T))` for unramified T, as the README defines it.
  - kurihara §2.6 starts on p. 12 (line 442). Its square-presentation and transpose statements are on pp. 13–14 (lines 484–511), as cited.
- Line 1072: dksw Theorem 2.3 (lines 266–274, p. 8) assumes (A), (B) or (Bp), and S≠∅. These are exactly the hypotheses added to `ritterWeiss_mapOfCocycle`.

**Passages that depend on the change.**
- §9.7 `finiteCM_keystoneFitting` (line 1284) already assumes that Σ∪Σ′ contains every ramified place.
- §9.7 `finiteModifiedSelmer_fitting` (line 1292) takes `S⊇S_∞∪S_ram`.
- §12.5 (line 1677) uses "the higher Fitting formula for the transpose with its excess-generator index s" with `Σ=S_∞∪{ramified v|p}` and T unramified. That is the non-square case of the new §8.5, and its s agrees with dk Lemma B.4 (line 3509, s=#S_ram for Σ=S_∞).
- dk Theorems 3.5 and 3.7, Corollary 3.8 and Lemma 3.9 are at lines 782, 815, 819 and 927 (pp. 21–25). Lemmas B.4–B.7 and Theorem B.8 are at lines 3509–3646 (pp. 93–96). kurihara Theorem 2.8 and Corollary 2.9 are at lines 393 and 398 (p. 11). These are §12.5's locators.

**Seeded sample, where it falls in the changed passages.**
- 1.4: line 185's "RJW, Corollary 12.19, p. 186" is correct (rjw line 3695).
- 5.6: it consumes §5.5's `dyadicNormMinus_mu_zero`, whose statement is unchanged; only its Washington page moved, and that page is correct.
- 8.1: its lattice pairing is what §8.5's transpose names; §8.1 itself did not change.
- 12.5: its locators are listed above.
- The other sampled sections (0.4, 0.5, 1.5, 1.6, 2.0, 5.1, 6.5, 7.3, 9.0, 10.0, 10.1) lie outside the diff. The previous reviews' verification of them stands.

**Ownership and overlaps.**
- `roadmaps grep -i 'ritter.?weiss'` finds the ∇ module only in this roadmap. In NoncommutativeAndEquivariantIwasawa the Ritter–Weiss hits are the authors' noncommutative papers, not this module.
- overlaps.md lists no pull request that changes this roadmap and no dropped id.
- The changed passages cite no other roadmap.

**Adversarial pass.** These rows were computed for this review, for the statements the diff changes. The last row carries forward the previous review's table (at 78ec69e) for untouched statements.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §8.4 rank formulas, s>0 | H=ℚ(i), S={∞}, T={5}, S′={∞,2} | `ℤ[i]/(2+i)`: i≡3, so μ₄↦{1,3,4,2} and `O^×_{H,S,T}=1`. `Cl^T≅(𝔽₅^×)²/μ₄≅ℤ/4`, generated by 1+i↦(4,3). s=1, #S′=2: rank V^θ=1, rank B^θ=2. `∇⊗ℚ`=trivial⊕sign. Alternating sum 0−1+2−1=0 on each χ | holds; not square, as stated |
| §8.4 auxiliary set | same H,S,T; S′={∞,13} | 3+2i↦(4,2), with logs (2,1) to base 2, and φ(a,b)=a−3b gives 3, a generator, so S′ kills `Cl^T`. 2∉S′∪T, and `[ℤ₂^×:N ℤ₂[i]^×]=2`, so V is not cohomologically trivial; B^θ rank 1≠2 | fails: R01 |
| §8.4 under (A), s=0 | H=ℚ(i), S={∞,2}, T={5} | `O^×_{H,S,T}` has finite index in `μ₄×(1+i)^ℤ`, torsion-free, rank 1 on the trivial χ (1−i=−i(1+i)). `X_{H,S}`: two places with `G_w=G`, rank 1, trivial. V^θ and B^θ both have rank 1. Trivial χ: 1−1+1−1=0; sign: 0−1+1−0=0 | holds |
| §8.4 degenerate G=1 | H=F=ℚ, S={∞}, T={7}, S′={∞,3} | `O^×=1`, `Cl^T=(ℤ/7)^×/±1` of order 3, generated by 3. X=0. V^θ=B^θ=ℤ, ∇=ℤ/3. Fitting ideal (3); `ζ_{S,T}(0)=(1−7)ζ(0)=3` | square, injective; consistent with §8.6's class-number check |
| §8.4 Q-padding | V^θ of constant rank r; Q with V⊕Q≅Rⁿ | `rank(B^θ⊕Q)_𝔪=r+(n−r)=n` at every 𝔪; `coker(f⊕id_Q)=coker f=∇` | correct now that s=0 is assumed |
| §8.5 transpose with excess s | general (r+s)×r matrix A; R=ℤ₂[[T]], A=(2,T)ᵗ | `Fitt^s(coker A)=I_r(A)`; `Fitt⁰(coker A^{t#})=I_r(A)^#`. Example: `Fitt⁰(M)=I₂=0`, `Fitt¹(M)=(2,T)`, transpose `R/(2,T)` with `Fitt⁰=(2,T)` | formula and Check correct |
| §8.5 index s vs §12.5 | DK App. B (Σ=S_∞, T unramified); DKSW p. 9 | `S_ram∖(Σ∪T)=S_ram`, so s=#S_ram, as dk line 3509; DKSW: s=#{v∈S_ram, v∤2}=`#(S_ram∖(Σ∪T))` | consistent |
| `ritterWeiss_mapOfCocycle` hypotheses | DKSW Thm 2.3 | (A) ✓, tame or p-tame ✓, S≠∅ ✓, v₀ with κ(G_{F_{v₀}})=0 ✓, x_v for v∈S∖{v₀} ✓ | matches |
| New §8.4 Check (ℚ(i)) | as in rows 1 and 3 | every number in the Check reproduced: smoothed units trivial, s=1, dimension one per character, B^θ one larger; with 2∈S, both ranks one on the trivial character | Check correct |
| Untouched statements (`primePowerHasseUnitIndex_one`, `primePowerCircularUnitIndex`, `zpExtensionLayer`, `HasIwasawaGrowth`, `classNumberGrowth`, `ferreroWashington`, `VandiverCondition`/`vandiver_propagation`, §1.5 `F(12)`, §4.2 decomposition and disc bound, §8.10 consumption, the Tau Ceti character-ring contract, §3.2 n=m) | as in the r3 review | e.g. index 1 for ℚ, ℚ(i), ℚ(ζ₃), ℚ(ζ₈); `−ζ₁₂=ζ₁₂⁷` with Q=2; `(p−1)i>e` ⇔ `p^{−i/e}<p^{−1/(p−1)}`; `ℤ₂[C₂]→ℤ₂²` with cokernel ℤ/2 | carried forward from the r3 review; untouched by this diff |

## Not verifiable

- Katz, *p-adic properties of modular schemes and modular forms*, Corollary 4.4.2, p. 152: still behind a paywall (DOI 10.1007/978-3-540-37802-0_3). It is cited by its locator and is unchanged in this diff.
- Texts outside the changed passages (NSW, Burns–Kurihara–Sano, Kolster 1989, Greenberg, Yamashita, Ribes–Zalesskii, Sinnott 1980, Taylor, Wiles, Washington 1978) were not re-read for this incremental review.

## Source issues

- none
