# Review of EllipticModularityEffectiveComparisons (pull request #1810 at b26ab9f)

**Verdict:** rejected

This is an incremental re-review of the 26 lines changed since ba802e5: one commit, b26ab9f, touching README.md only (13 lines in, 13 out). `Suggested.lean` is byte-identical to ba802e5 and nothing changed outside the folder. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 17 `sorry` warnings.

All 13 rewritten lines are correct against ModularCurvesPartII §§9.5, 9.6 and 9.8 and against the two Bilu–Parent sources (table below). The only finding is R01, carried from the previous report. No edit inside this folder can repair it, so the verdict stays `rejected`.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~13; earlier GATE~5–~12; PRREVIEW~10–~13 R01).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5, and `Suggested.lean`, lines 53–302. README line 1707 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII, open at 504db2f (the head the open-PR index lists). Re-read at that head this round:
- `non_cm_prime_isogeny_degrees` (line 252 here) has the same body as the sibling's `noncm_prime_isogeny_degrees` (its `Suggested.lean` line 219). `GeometricallyNonCM` (line 215 here) and `CyclicIsogenyDegree` (line 158 here) are the sibling's `NonCM` (its line 198) and `HasCyclicIsogeny` (its line 206), token for token.
- `isogeny_j_tables_11_17_37` (line 286 here) has the same body as the sibling's `rational_isogeny_j_tables` (its line 257).
- The passages this commit rewrites are part of the overlap. §§5.4–5.7 here (the rational points of X₀⁺(p²), with the identification X_s⁺(p)≅X₀⁺(p²) from ModularCurvesPartII §9.5) are the sibling's §6.0f, "The split-Cartan rational-point theorem" (its README lines 140, 778 and 806), which states the same Bilu–Parent–Rebolledo Theorem 1.1 from the same §9.5 identification.

**Witness.** The sibling's README line 7 reads "this Part II owns the six comparison layers below". In the merge order the sibling is on line 275 and this folder on line 285. ErdosProgressionPowers (head 3e1048c) names the sibling on 17 README lines and this folder on none.

**Why the settled reason fails.** GATE~13 answers H01 with "The finding is correct, and no edit inside this folder can repair it." That concedes the finding; it gives no reason why it is wrong. What another roadmap plans is imported, never planned again, and the owner is the roadmap earlier in the order. The finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of the following.
1. **Close #1810.** Content found only here first moves into the sibling's pull request:
   - the §5.1 point counts and the j-values −96³, −960³, −5280³ and −640320³ (GATE~13 confirms 0 matches in the sibling);
   - the finer decompositions of Martin's bound (§§0.3–0.15), Mazur's theorem (§§4.1–4.6), Kenku's levels (§§4.8–4.15) and the split-Cartan chain (§§5.3b–5.7).

   Three consumer lists (ModularSymbolsPadicLFunctions, FaltingsFinitenessAndIsogenyTheorems, ImaginaryQuadraticClassNumber) then drop this folder's name.
2. **Close the sibling and keep this folder.** Then:
   - re-point the sibling's consumers to the counterparts listed at README line 1707;
   - give owners here to what only the sibling has: its §1.8 majorants, its §6.0e rank-zero theorem, the §6.0f minimal period subvariety, `norm_bound`/`removed_prime_bound`, and `FullRationalTwo`/`RationalTwo`.

**Tested on the instance.** The two degree-list statements give the same Finset {2,3,5,7,11,13,17,37} under definitionally identical hypotheses. The two j-table statements give the same seven values. Both split-Cartan statements exclude p=11 and p=13 and cover p=17.

## Previous findings

- R01 — not repaired: README line 1707 still says EllipticCurveModularityPartII "plans the same results". The sibling is open at 504db2f, earlier in the order (275 against 285), with identical theorems at its lines 219 and 257. Raised again above.

## Verified sound

**Gate, dependency check and Lean.**
- Hand run of the gate at b26ab9f; every check is 0:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's `gate.md` agrees and adds `build=0`.
- Dependency check (`--movable`, board order, content checkout), with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

  ModularCurvesPartII, the only supplier the new text cites, is on line 71 of the merge order.
- `lake env lean` on `Suggested.lean` prints exactly 17 "declaration uses `sorry`" warnings (lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286, 298) and nothing else.
- `git diff ba802e5 HEAD --stat` touches README.md only. So r10's `#check` pass (27 declarations, 0 lost binders, as `signatures.md` also says) and its one-tactic probe (none of the sorried theorems closes) carry over.
- The diff outside the folder is empty; the folder holds README.md, Suggested.lean and metadata.toml.

**The changed passages (13 lines), each read against its supplier or source.**
- **Line 78, supplier contract.** "§§9.5–9.8 … and the Atkin–Lehner quotients X₀⁺(N)=X₀(N)/⟨w_N⟩". ModularCurvesPartII (open head 07e21ad) §9.8 is "Atkin–Lehner quotient curves `X₀⁺(N)`" and defines exactly that quotient for N≥2.
- **Line 86.** "Y₀(p)=C−D is the complement of the two cusps". With C=X₀(p) and D=(0)+(∞), this is right: X₀(p) for prime p has exactly the two cusps 0 and ∞. Y₀(p²) at line 1305 and Y₀(p) at line 1309 read the same way.
- **Line 1261, §5.3b.** The gloss of X_s⁺(p) matches ModularCurvesPartII §9.6 (a level-C_s⁺(ℓ) structure is an unordered pair of distinct subgroups of order ℓ; X_s⁺ is the curve of the monomial subgroup, the split Cartan normalizer for odd ℓ). It also matches the source: bilu-parent-split lines 25–28 (diagonal and anti-diagonal matrices) and lines 445–446 (an unordered pair of independent p-isogenies). The statement is Theorem 6.1 at lines 432–433, p.8: p=11 or p≥17, every noncuspidal point, no non-CM hypothesis. The locator "pp.8–10, lines 430–443, 513–542" is exact (pages 8, 9, 10 begin at lines 398, 437, 505). The Needs line already carried §§9.5–9.6.
- **Line 1289, §5.4.** "X₀⁺(p²)=X₀(p²)/⟨w_(p²)⟩ … of ModularCurvesPartII §9.8, isomorphic over ℚ to X_s⁺(p) by ModularCurvesPartII §9.5". §9.5 states the isomorphism over ℚ for every prime ℓ, and §9.8 repeats it for N=ℓ². The source agrees: bilu-parent-rebolledo line 165 and (2.3) at line 305. The statement is Theorem 4.1(i) at lines 625–627, printed p.970; the proof ends on p.972.
- **Lines 1291, 1331, 1357, 1361.** Notation only (X₀⁺(p²), X_s⁺(p), 10⁷, spaced theorem numbers). Corollary 5.7 is at line 847, printed p.976; Theorem 1.1 at line 104, p.959; Proposition 5.9 at line 971. Line 1357 keeps the source's X_split(p) inside the locator, which is the source's own symbol.
- **Needs lines 1297, 1339, 1353, 1369 and Dependencies line 1703.** Each gained ModularCurvesPartII §9.8 (line 1297 also §9.5). Each of those sections names X₀⁺(p²), so the edge is used.
- The changes add no Lean name, no process word, no pull-request number and no path. No other passage of the README is made wrong by them: the convention at line 25 (the mixed quotient by w_(p²)) and §5.3c's Y_s⁺(p)(ℤ) use the same curve.

**Seeded sample, where it falls in the changed passages.**
- §5.3b and §5.4 are read in full above (theorem number, page, hypotheses, statement).
- §§0.12, 1.1, 1.5, 3.6, 3.7, 3.16, 4.1, 4.7, 4.14, 5.1, 5.3a, 5.10 and 5.12 neither changed nor depend on the changed text. Under the incremental brief they were not re-read.

**Cross-roadmap citations resolved this round (3 roadmaps).**
- ModularCurvesPartII at 07e21ad: §§9.5, 9.6, 9.7 and 9.8.
- EllipticCurveModularityPartII at 504db2f: README lines 7, 140, 559, 587, 778 and 806; `Suggested.lean` lines 198, 206, 219 and 257.
- ErdosProgressionPowers at 3e1048c.
- `citations.md` lists nothing found nowhere. `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no revision-only id.
- Ownership against the open pull requests was checked for the objects the diff touches. X_s⁺(ℓ), X₀⁺(N) and their identification are owned by ModularCurvesPartII and cited here, not restated. The rational-point theorems on them have a second owner only in the sibling of R01.

**Declared gaps.** Unchanged since r10: seven slugs in the README, none with supplier `none`.

**Remarks, not findings (untouched text or outside the folder).**
- Lines 955–995 still write `X0(d)`, `X0(39)`, `X0(65)` and `X0(91)` in ASCII outside code spans, where the changed §§5.4–5.7 now write X₀.
- The pull-request description still says "fourteen headline theorems" and "nine simple definitions"; the file has 17 theorems and 10 definitions.
- `design/plan.json` still lists `all-embedding-frobenius`, which the README does not declare.

**Adversarial pass.** The first six rows were computed this round. The rest are carried from the reports named in each row, for statements this diff leaves untouched.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.3b line 1261: X_s⁺(p) gloss (unordered pair of order-p subgroups) | p=11, 13, 17; ordered reading; p=2 | j-degree p(p+1)/2 = 66, 91, 153, equal to ModularCurvesPartII §9.6 (91 at 13); ordered pairs would give 132, 182, 306; p=2 is outside the theorem (p=11 or p≥17), so "normalizer" and "monomial" agree | sound; the ordered curve X_s(p) is excluded by "unordered" | none |
| §5.3b statement and its Check 3 | p=11, 13, 17; j=0 | cusps of X_s⁺(p): (p+1)/2 = 6, 7, 9, one rational and (p−1)/2 = 5, 6, 8 conjugate, so degree 5 at p=11 as the Check says; p=13 fails both alternatives; h(0)=log max(1,0)=0 | sound | none |
| §5.4 line 1289: X₀⁺(p²)=X₀(p²)/⟨w_(p²)⟩≅X_s⁺(p) over ℚ | p=11, 13; N=1 | X₀(p²) has j-degree p(p+1) = 132, 182 and p+1 = 12, 14 cusps; the quotient has degree 66, 91 and 1+(p−1)/2 = 6, 7 cusps, equal to the X_s⁺(p) values above; N=1 is outside §9.8 (N≥2) | sound; both sides agree | none |
| §5.4 threshold | p=1.4·10⁷ | 2π√p+6 log p+21(log p)²/√p = 23609.77, the value r13 carried; the strict inequality p>1.4·10⁷ matches source line 626 | sound | none |
| Line 86: Y₀(p)=X₀(p)−{0,∞} | p=23; p²  | X₀(p) has 2 cusps, so Y₀(p)=C−D exactly; X₀(p²) has p+1 cusps, and Y₀(p²) at line 1305 removes all of them, which is the same convention | sound | none |
| §5.7 route line 1361 | p=11, 13, 17, p>1.4·10⁷ | 11 and 13 are excluded by the hypotheses; 17 falls in §5.6's range 11<p≤1.4·10⁷; larger p in §5.4; the two ranges are disjoint and cover every prime p>11, p≠13 | sound | none |
| Sibling against the changed passages | sibling §6.0f (lines 140, 778, 806) at 504db2f | same theorem (rational points of X₀⁺(pᵐ) cuspidal or CM, p≥11, p≠13), same §9.5 identification | duplicate | R01 |
| Sibling against this folder (r12, re-read) | j-table and degree-list statements | identical bodies at sibling lines 219 and 257 against 252 and 286 here; definitions at 198/206 there against 215/158 here | duplicate | R01 |
| §5.1 line 1184: Y₀(r)(ℚ) (r13) | r=19, 43, 67, 163 | g=1, 3, 5, 13; v=1 each; #X₀(r)(ℚ)=3 against #Y₀(r)(ℚ)=1; 96³=884736, 960³=884736000, 5280³=147197952000, 640320³=262537412640768000 | sound | none |
| §5.3c line 1275: Y_s⁺(p)(ℤ) and the Runge bound (r13) | p=5, 17, 3; j=0, 1/2 | RHS(5)=48.0329, RHS(17)=83.7895; h(0)=0; j=1/2 outside the set; p=3 fails p>3 | sound | none |
| §5.25 Checks 1–3 (r11, r12) | five curves; t=−16 on X₀(2); y²+y=x³−x | j = −24729001, −32768, −121, −9317, −162677523113838677; (t+16)³/t=0; c₄=48, Δ=37, #E(𝔽₂)=5, #E(𝔽₃)=7 | sound | none |
| `exceptional_prime_isogeny_j`, `non_cm_prime_isogeny_degrees`, `isogeny_j_tables_11_17_37` (r10) | (19,96); 11a1; r=1; the seven values | j=−96³; 5 is in the list; r=19 is outside it, so `hCM` is needed; values = lemos-2017 lines 197–202 | sound | none |
| WeightsInEtaleCohomology §6.1 at k=2; §1.4, §3.4 (r10) | 11a at q=2; level 23, p=2 | roots −1±i of modulus √2≤2√2; norms 11, 5; N(b−a₂)≤33.97 | sound | none |
| §§4.19–4.20 (r10) | y²=x³−x at n=3, 2 | n=3 bijective (9=9), n=2 not | sound | none |
| `localTerms`, `martin_dimension_formula`, `martin_sharp_bound` (r9) | 1≤N≤4000 | 0 mismatches; 12g at 11, 23, 35, 37, 59 = 12, 24, 36, 24, 60; equality set {35} ∪ primes ≡11 mod 12 | sound | none |
| §§2.1–2.3, 3.1, 3.7a, 3.10, 3.13, 3.16, 4.8, 4.18 (r9) | N=1, 4, 11, 35; J=4ℤ; q=2 | F=1, 3+2√2, (1+√8)⁶; a₁=1∉4ℤ; #E(𝔽₃,𝔽₅,𝔽₇)=4, 8, 8; 17 levels | sound | none |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `full_two_uniform_irreducibility` (r9) | degrees 0, 1, 22, 20; ℓ=3 | 0 is not cyclic; 1 is allowed; 22 and 20 are absent; the cutoff 5 is needed | sound | none |
| `split_normalizer_exclusion`, `proper_image_nonsplit`, `cyclic_isogeny_integral_j`, `lemos_uniform_surjectivity` (r9) | p=11, 13, 17; p>37; y²=x³−x at 11 | the hypotheses exclude 11 and 13; PSL₂(𝔽₁₁) has order 660; j=1728∈ℤ; B(E₁₁)=2 | sound | none |

## Not verifiable

- The sources ModularCurvesPartII cites for §§9.5 and 9.8 (Balakrishnan–Dogra–Müller–Tuitman–Vonk §6) belong to that roadmap's review and were not read here; the identification was checked against bilu-parent-rebolledo line 165 and (2.3) instead.
- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified, and this diff does not touch them.

## Source issues

- **Misprint** in bilu-parent-rebolledo at §4, proof of Theorem 4.1, printed p.972 (line 686): the source says the height of the integer j-invariant is log|j|; it should be log max(1,|j|), which differs at j=0; affects nothing.
