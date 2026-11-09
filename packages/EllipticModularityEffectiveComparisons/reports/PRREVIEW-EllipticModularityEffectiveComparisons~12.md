# Review of EllipticModularityEffectiveComparisons (pull request #1810 at c001b88)

**Verdict:** rejected

This is an incremental re-review of the 3 lines changed since b3472ae, one commit, c001b889, all in `README.md`: line 1197 (§5.1, one word dropped) and a new Check at line 1643 (§5.25). Nothing changed outside the folder and `Suggested.lean` is untouched. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 17 `sorry` warnings and exit 0.

The changed passages are correct: every value in the new Check was recomputed and the Lemos locator it names was read (table below). The remark of the previous review about the redundant word is addressed. R01 is not repaired and cannot be repaired by an edit inside this folder: EllipticCurveModularityPartII is still open, still earlier in the merge order, and still states the same two theorems with definitionally identical hypotheses. It is the only finding, so the verdict stays `rejected`.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~9; earlier GATE~5–~8; PRREVIEW~10 R01, PRREVIEW~11 R01).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5; `Suggested.lean`, lines 53–302. README line 1707 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII (the r9 report gives the section-by-section list; it still holds). At the sibling's current head:
- `isogeny_j_tables_11_17_37` (line 286 here) has the same body as the sibling's `rational_isogeny_j_tables` (its `Suggested.lean` line 257), with `CyclicIsogenyDegree` (line 158 here) in place of the sibling's `HasCyclicIsogeny` (its line 206), whose bodies are identical token for token;
- `non_cm_prime_isogeny_degrees` (line 252 here) has the same body as the sibling's `noncm_prime_isogeny_degrees` (its line 219), with `GeometricallyNonCM` (line 215 here) in place of the identically defined `NonCM` (its line 198).

**Witness.** EllipticCurveModularityPartII is open as a draft pull request; the checkout this review read is at ac022ff9, and its README line 7 still reads "this Part II owns the six comparison layers below". In `ORDER.txt` it is on line 275 and this folder on line 285. ErdosProgressionPowers (head 3e1048c) still names EllipticCurveModularityPartII 17 times as the supplier of EC.0–EC.6 and this folder not at all.

**Why the settled reason fails.** GATE~9 answers "The finding is correct and not disputed … No edit inside this folder repairs it." That concedes the finding and gives no reason that it is wrong. The binding rule is that what another roadmap plans is imported and never planned again, with one owner earlier in the order. The finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of these:
1. Close #1810. The consumers and the merge order already point at the sibling.
2. Close the sibling and keep this folder. Then re-point the sibling's consumers to the counterparts listed at README line 1707, and give owners here to the sibling's §1.8 majorants, §6.0e rank-zero theorem, the §6.0f minimal period subvariety and ErdosProgressionPowers's `FullRationalTwo`.

**Tested on the instance.** The two j-table statements give the same seven values, recomputed here: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677 and −9317. The two degree-list statements have the same Finset {2,3,5,7,11,13,17,37} under definitionally identical hypotheses.

## Previous findings

- R01 — not repaired: the folder's scope is unchanged; the sibling is open at ac022ff9 (the index lists cd7c37d), order 275 against 285, and still states the same two theorems (its lines 219 and 257). Raised again above.

## Verified sound

**Gate, dependency check and Lean.**
- Hand run of the gate at c001b88: every check is 0 and the line ends `OK`, as in the worker's `gate.md`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only README.md, Suggested.lean and metadata.toml.
- Dependency check (`--movable`, board order, content checkout at 1bea835). It prints no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

- `lake env lean` on `Suggested.lean` exits 0 with 17 "declaration uses `sorry`" warnings, at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298, and nothing else. The file is byte-identical to the one r10 and r11 read, so r10's `#check` pass (27 declarations, 0 lost binders; `signatures.md` agrees: 27 declarations, 0 dropped binders) and one-tactic probe (15 sorried theorems, none closes) carry over unchanged.

**The changed passages, each resolved.**
- README line 1197 (§5.1): "noncuspidal rational point of Y₀(r)" became "rational point of Y₀(r)". Y₀(r) is the open curve, so the dropped word was redundant and the sentence's content is unchanged; ModularCurvesPartII §9.7's first assertion produces a K-point of Y_H, which is what the sentence now says. Line 1184 (untouched) still says "noncuspidal rational point set Y₀(r)(ℚ)": harmless, see the remarks.
- README line 1643 (§5.25, new Check). Each claim recomputed. For [a₁,a₂,a₃,a₄,a₆]=[0,0,1,−1,0]: b₂=0, b₄=−2, b₆=1, b₈=−1, c₄=48, c₆=−216, Δ=−b₂²b₈−8b₄³−27b₆²+9b₂b₄b₆=64−27=37, and c₄³−c₆²=1728·37 checks. |Δ|=37 is below every twelfth power, so the model is minimal; 37∤c₄=48, so reduction at 37 is multiplicative and the conductor is 37. Point counts by enumeration: #E(𝔽₂)=5, #E(𝔽₃)=7 (also #E(𝔽₅)=8, #E(𝔽₇)=9). Torsion: at the good prime 3 the ramification index 1 is below p−1=2, so the whole rational torsion injects into E(𝔽₃), order 7; at the good prime 2 the prime-to-2 torsion injects into E(𝔽₂), order 5; a torsion group of order 7 would have odd part 7 not dividing 5, so the torsion is trivial. (0,0) satisfies 0+0=0−0, is not the origin, hence has infinite order, so E(ℚ) has positive rank. The modular parametrization X₀(37)→E of a conductor-37 curve makes E an isogeny factor of J₀(37), so J₀(37)(ℚ) has positive rank. The Check is consistent with the route text of §5.25, which uses a rank-zero new quotient A₃₇ and says explicitly that no rank-zero assertion for the whole Jacobian is used, and with the r11 source issue on lemos-2017.
- lemos-2017 lines 193–194 (p.5) are the sentence saying X₀(37) is a genus-two curve whose Jacobian has rank 0; the locator is right, and the Check's statement that this sentence is not used is consistent with the proof route.
- The Check names no Lean counterpart, contains no process word, pull-request number or path, and its *Needs:* line is unchanged (a Check's inputs are tests, not targets).

**Seeded sample, where it falls in the changed passages.** §4.7 and §4.0 are cited by both changed sections' routes and were read in r11 (mazur-1978 line 35 Theorem 1, p.129; line 57; banwait-najman-padurariu line 72 Theorem 1.1). §5.28 (Lemos's theorem) depends on §5.25, whose only change is the new Check: lemos-2017 lines 187–215 were re-read this round; the theorem's reduction to r∈{2,3,5,7,11,13,17,37} (lines 187–189), the sets S₁₁, S₁₇, S₃₇ (lines 197–202) and the CM observation (line 212) match the README. The other seeded targets (0.1, 0.2, 3.2, 4.4, 4.8, 4.11, 4.19, 4.21, 5.2, 5.8, 5.16, 5.16a, 5.21, 5.27) neither changed nor depend on the changed text; under the incremental brief they were not re-read (r9–r11 read them).

**Cross-roadmap citations resolved this round.** EllipticCurveModularityPartII (checkout ac022ff9: README line 7; `Suggested.lean` lines 198, 206, 219, 257); ErdosProgressionPowers unchanged at 3e1048c; ModularCurvesPartII §9.7 was resolved in r11 and the line-1197 edit does not change what it is cited for. `roadmaps resolve` lists no citation and no Lean name found nowhere; `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no revision-only id. Ownership against the open pull requests was checked only for the objects the diff touches (the j-tables, the degree list and the level-37 route): the sole other owner is the sibling of R01.

**Remarks, not findings (untouched text).**
- The pull-request description still says "fourteen headline theorems" and "nine simple definitions"; the file has 17 theorems and 10 definitions.
- `design/plan.json` on the board still lists `all-embedding-frobenius`; the README declares seven gaps (chen-winding-comparison, mixed-cusp-charts, modular-rank-zero, optimized-elliptic-weight-two, positive-characteristic-support, quantitative-abelian-periods, weight-two-local-reduction) and not that one, so the intake withdraws it.
- Line 1184 still says "noncuspidal rational point set Y₀(r)(ℚ)"; redundant as at line 1197 before this commit, harmless.

**Declared gaps.** Unchanged since r10: seven slugs, with suppliers and sections equal to `plan.json`'s and none with supplier `none`. The r9 point that two of them ask for what the sibling owns is part of R01.

**Adversarial pass.** Rows for the changed statements were computed in this review. Rows marked (r11), (r10) or (r9) are carried from those reports for statements this diff leaves untouched, with their values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.25 Check 3 (new): J₀(37) has positive rank | y²+y=x³−x; primes 2, 3, 37 | b₂,b₄,b₆,b₈ = 0,−2,1,−1; c₄=48, c₆=−216, Δ=37, c₄³−c₆²=1728·37; 37∤48 so multiplicative, conductor 37; #E(𝔽₂)=5, #E(𝔽₃)=7; torsion order divides 7 and its odd part divides 5, so 1; (0,0)∈E(ℚ), ≠O, infinite order | sound | none |
| §5.25 Check 3: consistency with the route | the route's level-37 step | route uses a rank-zero new quotient A₃₇ and finite fibres, not J₀(37)(ℚ) finite; lemos-2017 lines 193–194 assert rank 0 for J₀(37), contradicted by the Check | sound; the Check records the source error | none |
| §5.1 line 1197: Y₀(r) point from §9.7 | r=19, E with a rational 19-isogeny | §9.7 first assertion gives a K-point of Y_H=Y₀(19) over j(E); Y₀(19)(ℚ)={P₁₉}; "noncuspidal" adds nothing on the open curve | sound | none |
| §5.25 Check 1: the five curves (r11) | [1,1,1,−30,−76], [0,−1,1,−7,10], [1,1,0,−2,−7], [1,1,1,−8,6], [1,1,1,−208083,−36621194] | (c₄, Δ, c₄³/Δ) = (1441, −121, −24729001), (352, −1331, −32768), (121, −14641, −121), (385, −6125, −9317), (9987985, −6125, −162677523113838677) | sound | none |
| §5.25 Check 2: negative control at j=0 (r11) | t=−16 on X₀(2); y²=x³+2 | (t+16)³/t = 0; c₄=0, Δ=−1728, j=0; x³+2 has no root among ±1, ±2, so no rational 2-isogeny; y²=x³+1 at the same j has the rational 2-point (−1,0) | sound | none |
| §5.25 inclusions ⊇ and ⊆ via §9.7 (r11) | the seven values against {0,1728}; r prime | none of the seven is 0 or 1728; −I∈B(r); a cyclic kernel of order r is a line in E[r]≅(ℤ/r)² | sound | none |
| §5.1 CM corollary route (r11) | r=19 on y²+y=x³−38x+90; arbitrary E with a rational 19-isogeny | Y₀(19)(ℚ)={P₁₉}, j(P₁₉)=−96³; j(E)=−96³, so E≅_ℚ̄ the CM curve, End_ℚ̄(E) the order of discriminant −19 | sound | none |
| Line 40 contract: `j_eq`, `ofJ`, `ofJ_j` (r11) | j=−121 and j=0 over ℚ | `j_eq` gives Δ⁻¹c₄³; `ofJ (−121)` is `ofJNe0Or1728`, `ofJ 0` is `ofJ0 ℚ`, both `IsElliptic`, j by `ofJ_j` | sound | none |
| `exceptional_prime_isogeny_j` §5.1 (r10) | (19,96) on y²+y=x³−38x+90; the four γ; (19,960); r=11 | c₄=1824=19·96, Δ=−19³, j=−96³; −960³, −5280³, −640320³ among the 13 rational CM j-values; (19,960) and r=11 outside the Finset | sound | none |
| `non_cm_prime_isogeny_degrees` §5.1 (r10) | 11a1; the CM curve above; r=1 | 11a1: j=−122023936/161051∉ℤ, non-CM, rational 5-isogeny, 5∈list; CM curve has r=19∉list, so `hCM` needed; r=1∉list, so `hr` needed | sound | none |
| `isogeny_j_tables_11_17_37` §5.25 (r10) | the seven values; 121a1, 121b1, 121c1 | = lemos-2017 lines 197–202; only −32768 is CM; the three level-11 curves give −24729001, −32768, −121 | sound | none |
| WeightsInEtaleCohomology §6.1 at k=2, χ=1 (r10) | 11a at q=2; level 23 at q=2 | X²−a_qX+q; roots −1±i of modulus √2 ≤ 2√2; level 23: 0.618, 1.618 ≤ 2.828 | sound | none |
| §1.4, §3.4 (r10) | level 23, p=2, s=±1; b∈{−3,…,3} | norms 11, 5; N(b−a₂) = 1, −1, −1, 1, 5, 5, 11, all ≤ 33.97; 4√q ≤ (√q+1)² at q=2,3,5 | sound | none |
| Line 66 coprime-degree bijection; §4.19; §4.20 (r10) | y²=x³−x, n=3 and 2; T,T′; y²=x(x+5)(x+32), ℓ=3 | n=3 bijective (9=9), n=2 not; φ̂(E′[2])=T≠T′; 3P=O with full 2-torsion, 12 in the list | sound | none |
| §§3.14–3.15 locators; §4.0 Checks; docstring statability (r10) | kraus-1997 lines 437–439; y²=x³+2 at n=3; X₀(r) at the pins | [25]=Serre; ψ₃=3x(x³+8); discs 81, −23; no modular-curve carrier | sound | none |
| `localTerms` §0.1; `martin_dimension_formula` §0.5; `martin_sharp_bound` §0.16; §§0.6–0.15 (r9) | 1≤N≤4000; 11,250 tuples | 0 mismatches; 12g at 11, 23, 35, 37, 59 = 12, 24, 36, 24, 60; equality set {35} ∪ primes ≡11 mod 12 | sound | none |
| §§2.1–2.3; §3.1; §3.7a; §3.10; §3.13; §3.16; §4.8; §4.18 (r9) | N=1,4,11,35; N=11,23; J=4ℤ; q=2; y²=x³−x | F=1, 3+2√2, (1+√8)⁶; a₂=−2 and (−1±√5)/2; a₁=1∉4ℤ; `hbad` excludes 2; #E(𝔽₃,𝔽₅,𝔽₇)=4,8,8; 17 levels; ℤ/6, ℤ/22 | sound | none |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `full_two_uniform_irreducibility` (r9) | degrees 0, 1, 22, 20; ℓ=3, (4,36) | 0 noncyclic; 1 allowed; 22, 20 absent; 3P=0 so cutoff 5 needed | sound | none |
| `split_normalizer_exclusion`, `proper_image_nonsplit`, `cyclic_isogeny_integral_j`, §§5.19–5.23, §§5.3a, 5.3c, 5.25a, `lemos_uniform_surjectivity`, Conventions (r9) | p=11,13,17; p>37; y²=x³−x at 11; r=2,3,5,7,13; d=1,2; n=1; q+2q² | hypotheses exclude 11, 13; PSL₂(𝔽₁₁) order 660; j=1728∈ℤ; 25, 13, 8, 6, 4 values; 6.247·10⁶<6.895·10⁶; B(E₁₁)=2; n=1 excluded; L(1)=2, W=i/π | sound | none |
| Sibling against this folder | the j-table and degree-list statements at the sibling's checkout ac022ff9 | identical bodies, lines 219 and 257 there against 252 and 286 here; identical definition bodies at 198/206 there against 215/158 here; the same seven values | duplicate | R01 |

## Not verifiable

- The table that lemos-2017 cites for S₁₁, S₁₇ and S₃₇ ([6, p.98]) is not in the manifest and was not read; the values were checked against lemos-2017 lines 197–202 and, at r=11 and r=37, against the five curves of Check 1.
- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified and untouched by this diff.

## Source issues

- **Error** in lemos-2017 at §2, proof of Theorem 1.1, printed page 5 (lines 193–194): the source says the Jacobian of X₀(37) has rank zero; it has rank one, as the isogeny factor y²+y=x³−x has the non-torsion rational point (0,0), so the point determination needs a rank-zero quotient; affects the proof.
