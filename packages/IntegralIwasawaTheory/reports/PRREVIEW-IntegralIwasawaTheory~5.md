# Review of IntegralIwasawaTheory (pull request #1306 at 3acabe2)

**Verdict:** accepted

This is an incremental re-review of the 10 README lines that changed since 539ca66. `Suggested.lean` is unchanged. Both findings of the previous review are repaired, and the repairs introduce no new problem. The three conditions added in §8.3, the five in §8.4, and both new Checks agree with Dasgupta–Kakde. I recomputed every number in the two Checks. The Sharifi edition marker identifies the pagination that the README's locators use. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only `sorry` warnings.

No findings.

## Previous findings

- R01 — repaired: line 1053 now reads "The construction uses a finite auxiliary set S′ of places of F with S′⊇S, S′ disjoint from T, `S′∪T⊇S_ram`, `Cl^T_{S′}(H)=1`, and the decomposition groups `G_w⊂G` at the fixed places w above S′ having union G". The Check at line 1068 tests S′={∞,13} and S′={∞,2}.
- R02 — repaired: line 1772 now reads "Locators use the printed pages of the 189-page version in which Corollary 3.2.16 (p. 83) is the pseudo-isomorphism of `A_∞^∨` with `X_∞^ι` and §3.4 begins on p. 90".

## Verified sound

**Gate, elaboration, dependency check.**
- I re-ran the gate command from the brief at 3acabe2. Every check is 0 and it ends with `OK`, exit 0. The worker's gate.md also shows `build=0`.
- `lake env lean TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean` exits 0. It gives exactly five `declaration uses sorry` warnings, at lines 83, 95, 114, 123 and 136, and nothing else.
- The dependency check (`--movable`) prints `depcheck: 243 roadmaps, 2463 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty. `git diff --stat 539ca66 3acabe2` touches only README.md (6+/4−). The folder holds README.md, Suggested.lean and metadata.toml.
- Signatures: I elaborated a scratch copy of `Suggested.lean` with `#check @name` for all 11 declarations. Its prefix is byte-identical to the file at this head, and the run exits 0. The 11 elaborated types match signatures.md, and no binder was lost.
- `git diff 539ca66 3acabe2 -- …/Suggested.lean` is empty. The previous reviews' headline list (five theorems stated on native carriers, the rest named in the docstring) and their one-tactic probe therefore still apply.

**Changed passages, checked against the texts.**
- §8.3, line 1032:
  - dk (31) is at lines 703–709, p. 19. It takes S′ finite, containing Σ, disjoint from Σ′, with `Cl^{Σ′}_{S′}(H)` trivial, and quotients `Hom(O^×_{H,S′,Σ′},ℤ)` by the product over `S′_H−Σ_H`. Line 712 (p. 20) says the map is as in (29).
  - The README's three conditions and its formula are exactly these.
  - The section's locator is also correct: (29) is at lines 685–687, Lemma 3.1 at line 693 and (30) at line 699, all on pp. 19–20.
  - kurihara §2.6 starts on p. 12 (line 442) and Proposition 2.11 is on p. 13 (line 464). Lines 444–460 define the Selmer module and its exact sequence for any finite extension K/k, with no CM hypothesis. So the line 1049 Check over H=F=ℚ lies inside the domain of §8.3's definition, even though Layer 8 mostly works in the CM case.
- §8.4, line 1053:
  - dk §A.1 (lines 2970–2976, p. 78) lists the four bullets S′⊃Σ with S′∩Σ′=∅, `S′∪Σ′⊃S_ram`, `Cl^{Σ′}_{S′}(H)=1`, and `∪_{w∈S′_H}G_w=G`. The README's five conditions are these, with S,T in place of Σ,Σ′.
  - §8.1 (line 965) takes H/F abelian, so the decomposition groups at all places above v coincide. The README's "fixed places" union is therefore DK's union.
  - Lemma A.1 is at line 3049, on p. 80. Its proof (lines 3050–3072) gets surjectivity of `θ_{J′}` from the vanishing of the class group, and surjectivity of `θ_{W′}` from the remaining condition. This supports "the last two conditions make θ surjective". dksw Lemma 4.9 (line 1427, p. 40) names the same two conditions.
  - Lemma A.3 (line 3166, p. 83) is the independence step. It adds an unramified v. Under the new condition every addable v is unramified, because a ramified v∉S′ lies in T.
- §8.4, line 1055:
  - dk line 3108 defines `S′_ram=S_ram∖(Σ∪Σ′)` and notes that it lies in S′.
  - (145), the rank `#S′+#S′_ram−1`, is at line 3146, on p. 82.
  - Lemma A.4, constant rank `#S′−1` under (A2), is at lines 3205–3256, pp. 84–85.
  - The added clause is set logic: if v∈S_ram∖(S∪T), then v∉T, so v∈S′.
- Line 1772, Sharifi:
  - I compared four copies of the notes fetched from the author's address (2026-10-22, 10-28, 11-03, 11-07).
  - In the newest copy, Corollary 3.2.16 is at line 2483, on p. 83; that page starts at line 2480 with the running head "3.2. Limits of class groups 83". The §3.4 heading is at line 2684, on p. 90, and Proposition 3.4.2 is at line 2719, on p. 91.
  - In the earliest copy the same corollary is numbered 3.2.15 (line 2454), and §3.4 begins on p. 89 (line 2658).
  - Across the three later copies I compared the printed page of each of 467 numbered statements and section headings. There are 0 differences, so the marker fixes the pagination of every Sharifi locator in the README.

**Passages that depend on the change.**
- Grepping for `S′` and "auxiliary" finds the auxiliary set only in §§8.3–8.4. The other hits are unrelated auxiliary primes and levels in §§5 and 9.
- §8.3's API sentence (line 1041), "the finite auxiliary presentation and its independence", agrees with the new hypotheses.
- Three passages use the ranks from line 1055, which now hold for every admissible S′:
  - the line 1066 Check about enlarging S′;
  - line 1057 (s=0, equal ranks, `TauCeti.IsQuadraticallyPresented`);
  - §8.5's `R^r→R^{r+s}` form.

**Seeded sample, where it falls in the changed passages.**
- 8.3 and 8.4: the locators are as above.
- The other sampled sections are untouched by this diff: 0.2, 0.5, 1.2, 1.5, 2.4, 5.1, 5.2, 5.3, 8.6, 9.6, 10.0, 10.2 and 11.1. This incremental review does not re-read them.

**Ownership and overlaps.**
- `roadmaps grep -i 'ritter.?weiss|arithmeticSelmerModule'` hits only this roadmap (12 lines) and NoncommutativeAndEquivariantIwasawa (67 lines).
- The NoncommutativeAndEquivariantIwasawa hits are about Ritter–Weiss's noncommutative congruence papers (its README lines 1794, 3139, 3234). None of them is the ∇ module or the finite Selmer module.
- overlaps.md lists no pull request that changes this roadmap and no dropped id. The changed passages cite no other roadmap.

**Adversarial pass.** The rows for the changed statements were computed for this review. The last row carries forward the previous review's table (at 539ca66) for the statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §8.3 presentation (31), with S′⊇Σ | H=F=ℚ, Σ={∞,3}, Σ′={7}; S′=Σ and S′={∞,2,3} | `Cl^{7}(ℚ)=(ℤ/7)^×/±1≅ℤ/3`; 3³=27≡−1, so 3 has order 3. S′=Σ: units ±3^k≡1 mod 7 form ⟨−27⟩ and the product is empty, giving ℤ. S′={∞,2,3}: the unit lattice has basis −6, −27; `ord_2`↦(1,0) is primitive; the quotient is ℤ. From the definition: f=(ord_3+Σc_ℓ ord_ℓ)/3, with c_ℓ lifting log₃ℓ, is integral on `ℚ^×_7` and has f(−27)=1, so Sel surjects onto ℤ | both choices give ℤ; holds |
| §8.3 Check (line 1049), S′ not containing Σ | S′={∞,2} | Powers of 2 mod 7 are 2,4,1 (never 6), so 2 has order 3 in `(ℤ/7)^×/±1` and kills the class group. Units ±2^k≡1 mod 7 form ⟨8⟩; ord₂(8)=3, so the formula gives ℤ/3 | finite, not ℤ; the Check is correct |
| §8.4 conditions vs DK | DK §A.1, four bullets; abelian G | S′⊇S and S′∩T=∅; `S′∪T⊇S_ram`; `Cl^T_{S′}=1`; union of G_w over the fixed w equals the union over `S′_H` | identical |
| §8.4 "last two conditions make θ surjective" | H=ℚ(i), S={∞}, T={5}; S′={∞,13} and {∞,2} | `Cl^T≅(𝔽₅^×)²/μ₄`, i↦(3,2); with logs base 2, φ(a,b)=a−3b gives `Cl^T≅ℤ/4`. 3+2i↦(4,2), logs (2,1), φ=3. 1+i↦(4,3), logs (2,3), φ≡1. Both generate. `θ_{W′}` has image Σℤ[G](g−1) over g∈∪G_w; G_∞=G | both S′ kill `Cl^T`; θ is surjective for both |
| §8.4 new condition `S′∪T⊇S_ram` (Check line 1068) | S′={∞,13} | 2∉S′∪T. `[ℤ₂^×:N(ℤ₂[i]^×)]=2`: −1 is not a 2-adic sum of two squares, and unit norms are ≡1 mod 4. So V is not cohomologically trivial. B=ℤ[G]², so B^θ has rank 1, while the formula gives #S′+s−1=2 | the new condition excludes it; the Check is correct |
| §8.4 ranks for admissible S′ | S′={∞,2} and {∞,2,13}, s=1 | {∞,2}: V^θ rank 1, B^θ rank 2; with `O^×=1` and `∇⊗ℚ`=trivial⊕sign, the alternating sum is 0−1+2−1=0 on each χ. {∞,2,13}: Lemma A.3 adds ℤ[G] to each, giving 2=#S′−1 and 3=#S′+s−1 | holds; consistent with independence |
| §8.4 "puts all of them in S′" | v∈S_ram∖(S∪T) | v∉T and `S′∪T⊇S_ram` give v∈S′; ℚ(i), S={∞}, T={5}: S_ram∖(S∪T)={2}⊂{∞,2} | holds |
| Sharifi edition marker | four copies from the author's address | later copies: Cor. 3.2.16 on p. 83, §3.4 on p. 90, 0 of 467 statement pages differ; earlier copy: Cor. 3.2.15, §3.4 on p. 89 | identifies the pagination used |
| Untouched statements (§8.4 under (A) with s=0, Q-padding, G=1 with T={7}, §8.5 transpose with excess s, s against §12.5, `ritterWeiss_mapOfCocycle` hypotheses, and the headline rows `primePowerHasseUnitIndex_one`, `primePowerCircularUnitIndex`, `classNumberGrowth`, `ferreroWashington`, `vandiver_propagation`) | as in the r4 and r3 reviews | e.g. ℚ, T={7}: ∇=ℤ/3 and `ζ_{S,T}(0)=(1−7)ζ(0)=3`; `Fitt¹((2,T)ᵗ)=(2,T)`; Hasse index 1 for ℚ(i), ℚ(ζ₈) | carried forward from the r4 review; untouched by this diff |

## Not verifiable

- Katz, *p-adic properties of modular schemes and modular forms*, Corollary 4.4.2, p. 152: behind a paywall (DOI 10.1007/978-3-540-37802-0_3). It is cited by its locator and is not touched by this diff.
- Burns–Kurihara–Sano, Proposition 2.2 and equation (12): not in the sources cache, and not re-read. §8.3 cites them through Dasgupta–Kakde (31) and Kurihara §2.6, both of which were read.
- Texts and sampled sections outside the changed passages were not re-read for this incremental review.

## Source issues

- none
