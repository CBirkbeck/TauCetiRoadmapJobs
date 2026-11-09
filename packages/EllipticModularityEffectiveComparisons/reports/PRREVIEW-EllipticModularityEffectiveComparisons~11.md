# Review of EllipticModularityEffectiveComparisons (pull request #1810 at b3472ae)

**Verdict:** rejected

This is an incremental re-review of the 17 lines changed since 4a7a185, which is one commit, b3472ae, all in `README.md` (lines 40, 1197, 1211, 1631, 1635–1644). Nothing changed outside the folder and `Suggested.lean` is untouched. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 17 `sorry` warnings and exit 0.

The previous review's R02 is repaired, and the repair introduced no new problem: every value, locator and library name it added was recomputed or opened at the pin (table and `## Verified sound` below). R01 is not repaired and cannot be repaired by an edit inside this folder: the folder still plans what EllipticCurveModularityPartII plans, and that roadmap is open and earlier in the merge order. The verdict therefore stays `rejected`, and R01 is raised again as the re-raise of H01. It is the only finding.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~9; earlier GATE~5–~8; PRREVIEW~10 R01).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5; `Suggested.lean`, lines 53–302. README line 1706 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII (the r9 report gives the section-by-section list; it still holds). In particular, at the sibling's current head:
- `isogeny_j_tables_11_17_37` (line 286 here) has the same body as the sibling's `rational_isogeny_j_tables` (its `Suggested.lean` line 230), with `CyclicIsogenyDegree` (line 158 here) in place of the sibling's identically defined `HasCyclicIsogeny` (its line 152);
- `non_cm_prime_isogeny_degrees` (line 252 here) has the same body as the sibling's `noncm_prime_isogeny_degrees` (its line 165), with `GeometricallyNonCM` (line 215 here) in place of the identically defined `NonCM` (its line 144).

**Witness.** EllipticCurveModularityPartII is open as #1491, marked draft, at head 1604bab (index of 2026-11-09T12:09:06Z); its change since the head r10 read is 65 README lines, and its README line 7 still reads "this Part II owns the six comparison layers below". In `ORDER.txt` it is on line 273 and this folder on line 283. ErdosProgressionPowers (head 3e1048c) still gives the sibling as the supplier of EC.0–EC.6.

**Why the settled reason fails.** GATE~9 answers "The finding is correct and not disputed … No edit inside this folder repairs it." That concedes the finding and gives no reason that it is wrong. The binding rule is that what another roadmap plans is imported and never planned again, with one owner earlier in the order. The finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of these:
1. Close #1810. The consumers and the merge order already point at the sibling.
2. Close #1491 and keep this folder. Then re-point the sibling's consumers to the counterparts listed at README line 1706, and give owners here to the sibling's §1.8 majorants, §6.0e rank-zero theorem, the §6.0f minimal period subvariety and ErdosProgressionPowers's `FullRationalTwo`.

**Tested on the instance.** The two j-table statements give the same seven values, recomputed here: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677 and −9317. The two degree-list statements have the same Finset {2,3,5,7,11,13,17,37} under definitionally identical hypotheses.

## Previous findings

- R01 — not repaired: the folder's scope is unchanged; the sibling is open at 1604bab, order 273 against 283, and still states the same two theorems (its lines 165 and 230). Raised again above.
- R02 — repaired: §5.25 now says "the passage to curves is a separate step in each direction … For ⊇, none of the seven values is 0 or 1728, so the converse of ModularCurvesPartII §9.7 applies"; the *Needs:* line cites "ModularCurvesPartII §9.7 for both directions … the converse at j∉{0,1728}"; the locator reads "lemos-2017 lines 191–202 and 212". §5.1 gained the matching ⊆ step via §4.0 and §9.7's first assertion. No new problem: see the rows below.

## Verified sound

**Gate, dependency check and Lean.**
- Hand run of the gate at b3472ae: every check is 0 and the line ends `OK`, the same as the worker's `gate.md`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only README.md, Suggested.lean and metadata.toml.
- Dependency check (`--movable`, board order, content checkout at 01daf25). It prints no UPWARD, CYCLE or `moved:` line:

      depcheck: 237 roadmaps, 2310 edges, 0 problem(s)

- `lake env lean` on `Suggested.lean` exits 0 with 17 "declaration uses `sorry`" warnings, at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298, and nothing else. The file is byte-identical to the one r10 read, so r10's `#check` pass (27 declarations, 0 lost binders; `signatures.md` agrees) and one-tactic probe (15 sorried theorems, none closes) carry over unchanged.

**The changed passages, each resolved.**
- README line 40 (new supplier-contract sentences). At the Mathlib pin f6090c70: `WeierstrassCurve.j` is `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388`, `WeierstrassCurve.j_eq` at :401 states `W.j = W.Δ⁻¹ * W.c₄ ^ 3` for `[Field K] [W.IsElliptic]`, as the README says. `WeierstrassCurve.ofJ` is `Mathlib/AlgebraicGeometry/EllipticCurve/ModelsWithJ.lean:134`, defined over any field by cases on j=0, j=1728 and the characteristic; its `IsElliptic` instance is at :164 with no extra hypothesis, and `WeierstrassCurve.ofJ_j : (ofJ j).j = j` at :183. The README's caveat that it is one model only is correct.
- README line 1197 (§5.1, the CM corollary route) and line 1211 (its *Needs:*). §4.0 (line 812) defines `CyclicIsogenyDegree` with cyclic geometric kernel and states, as API, that in characteristic zero it is equivalent to a Galois-stable cyclic geometric subgroup; for prime r that is a line in E[r]. ModularCurvesPartII §9.7 at #913's head (07e21ad), "Rational points of `X_H` and Galois images": first assertion, for H with −I∈H̄ and char K∤n, an image conjugate into H̄ gives a K-point of Y_H over j(E); the Borel subgroup contains −I. With Y₀(r)(ℚ)={P_r} from the four exhaustions, j(E)=j(P_r), and geometric CM passes along a ℚ̄-isomorphism. The route and its *Needs:* line (Layer 4.0, §9.7 first assertion, 4.7, EllipticCurves Layer 1) agree.
- README lines 1631–1644 (§5.25). Both directions are now named with their hypotheses. §9.7's converse: for x∈Y_H(K) with j(x)∉{0,1728} and −I∈H̄, every E/K with j(E)=j(x) has image conjugate into H̄; it warns that at j=0 or 1728 a K-point need not come from such a curve, which is exactly the caveat the README states. The seven values are not 0 or 1728 (table). The two new Checks are recomputed in the table. The *Needs:* line's new items (Layer 4.0, §9.7 both directions, `WeierstrassCurve.ofJ`, `WeierstrassCurve.ofJ_j`) all resolve.
- lemos-2017 line 191 defines S_r as the j-values of Y₀(r)(ℚ); lines 197–202 give S₁₁, S₁₇, S₃₇; line 212 (p.6) says −2¹⁵ is the only CM value; line 187–189 (p.5) the non-CM reduction to Mazur's list. The locators "lines 191–202 and 212" and "line 187" are right.
- §5.20 (line 1555, cited by the negative control): lemosNumerator(2)=(X+16)³ at line 1530, matching lemos-2017 line 237 (the table at line 231 ff.), with j=f(t)/t on t∈ℚ×.

**Seeded sample, where it falls in the changed passages.** §4.7 is cited by both changed *Needs:* lines: mazur-1978 line 35 is Theorem 1 (p.129), the prime-degree statement, as cited. §4.0 is newly cited by both: mazur-1978 line 57 (p.130) is the classification-of-isogenies framing and banwait-najman-padurariu line 72 is Theorem 1.1 (p.2). The other seeded targets (0.7, 0.13, 1.2, 3.2, 3.5, 4.6, 4.11, 4.13, 4.19, 5.0, 5.3, 5.8, 5.9, 5.16) neither changed nor depend on changed text; under the incremental brief they were not re-read (r9 and r10 read them).

**Cross-roadmap citations resolved this round.** ModularCurvesPartII §9.7 (#913 head 07e21ad, statement, hypotheses and both Checks read); EllipticCurveModularityPartII (#1491 head 1604bab, README line 7 and `Suggested.lean` lines 144, 152, 165, 230); ErdosProgressionPowers unchanged at 3e1048c. `roadmaps resolve` lists no citation and no Lean name found nowhere; `overlaps.md` lists no open pull request changing this roadmap and no dropped id. Ownership against the open pull requests was checked only for the objects the diff touches (the j-tables and degree lists): the sole other owner is the sibling of R01.

**Remarks, not findings (untouched text).**
- The pull-request description still says "fourteen headline theorems" and "nine simple definitions"; the file has 17 theorems and 10 definitions.
- `design/plan.json` on the board still lists `all-embedding-frobenius`; the README no longer declares it (r9 R02's repair), so the intake withdraws it.
- "noncuspidal rational point of Y₀(r)" (lines 1197, 1635) is redundant, since Y₀ is the open curve; harmless.

**Declared gaps.** Unchanged since r10: the seven slugs optimized-elliptic-weight-two, weight-two-local-reduction, mixed-cusp-charts, chen-winding-comparison, positive-characteristic-support, modular-rank-zero and quantitative-abelian-periods, with suppliers and sections equal to `plan.json`'s and none with supplier `none`. The r9 point that two of them ask for what the sibling owns is part of R01.

**Adversarial pass.** Rows for the changed statements were computed in this review. Rows marked (r10) or (r9) are carried from those reports for statements this diff leaves untouched, with their values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.25 Check 1: the five curves | [1,1,1,−30,−76], [0,−1,1,−7,10], [1,1,0,−2,−7], [1,1,1,−8,6], [1,1,1,−208083,−36621194] | (c₄, Δ, c₄³/Δ) = (1441, −121, −24729001), (352, −1331, −32768), (121, −14641, −121), (385, −6125, −9317), (9987985, −6125, −162677523113838677); −11·131³ = −24729001, −7·11³ = −9317, −7·137³·2083³ = −162677523113838677 | sound | none |
| §5.25 Check 2: negative control at j=0 | t=−16 on X₀(2); y²=x³+2 | (t+16)³/t = 0/(−16) = 0; c₄ = 0, Δ = −1728, j = 0; x³+2 has no root among ±1, ±2, so no rational 2-torsion point and no rational 2-isogeny; y²=x³+1 at the same j has the rational 2-point (−1,0) | sound: the converse fails at j=0 and the hypothesis is needed | none |
| §5.25 inclusion ⊇ via §9.7's converse | the seven values against {0,1728}; H=Γ₀(r) | none of −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677, −9317 is 0 or 1728; −I∈B(r); char ℚ ∤ r | sound | none |
| §5.25 inclusion ⊆ via §4.0 and §9.7's first assertion | r prime, a rational cyclic r-isogeny | kernel is cyclic of order r inside E[r]≅(ℤ/r)², so a Galois-stable line; image in a Borel | sound | none |
| §5.1 CM corollary route (line 1197) | r=19 on y²+y=x³−38x+90; r=19 on an arbitrary E with a rational 19-isogeny | Y₀(19)(ℚ)={P₁₉} with j(P₁₉)=−96³ (the point exhaustion, r10); any such E has j(E)=−96³ by §9.7's first assertion, hence E≅_ℚ̄ the CM curve, so End_ℚ̄(E) is the order of discriminant −19 | sound | none |
| Line 40 contract: `j_eq`, `ofJ`, `ofJ_j` | j=−121 over ℚ; j=0 over ℚ | `j_eq` gives Δ⁻¹c₄³, the normalization used in the Checks; `ofJ (−121)` is `ofJNe0Or1728`, `ofJ 0` is `ofJ0 ℚ` (3≠0), both `IsElliptic` at :164, j by `ofJ_j` | sound | none |
| `exceptional_prime_isogeny_j` §5.1 (r10) | (19,96) on y²+y=x³−38x+90; the four γ; (19,960); r=11 | c₄=1824=19·96, Δ=−19³, j=−96³; −960³, −5280³, −640320³ among the 13 rational CM j-values; (19,960) and r=11 outside the Finset | sound | none |
| `non_cm_prime_isogeny_degrees` §5.1 (r10) | 11a1; the CM curve above; r=1 | 11a1: j=−122023936/161051∉ℤ, non-CM, rational 5-isogeny, 5∈list; CM curve has r=19∉list, so `hCM` needed; r=1∉list, so `hr` needed | sound | none |
| `isogeny_j_tables_11_17_37` §5.25 (r10 values) | the seven values; 121a1, 121b1, 121c1 | = lemos-2017 lines 197–202; only −32768 is CM; the three level-11 curves give −24729001, −32768, −121 | sound; route now complete | none |
| WeightsInEtaleCohomology §6.1 at k=2, χ=1 (r10) | 11a at q=2; level 23 at q=2 | X²−a_qX+q; roots −1±i of modulus √2 ≤ 2√2; level 23: 0.618, 1.618 ≤ 2.828 | sound | none |
| §1.4, §3.4 (r10) | level 23, p=2, s=±1; b∈{−3,…,3} | norms 11, 5; N(b−a₂) = 1, −1, −1, 1, 5, 5, 11, all ≤ 33.97; 4√q ≤ (√q+1)² at q=2,3,5 | sound | none |
| Line 66 coprime-degree bijection; §4.19; §4.20 (r10) | y²=x³−x, n=3 and 2; T,T′; y²=x(x+5)(x+32), ℓ=3 | n=3 bijective (9=9), n=2 not; φ̂(E′[2])=T≠T′; 3P=O with full 2-torsion, 12 in the list | sound | none |
| §§3.14–3.15 locators; §4.0 Checks; docstring statability (r10) | kraus-1997 lines 437–439; y²=x³+2 at n=3 etc.; X₀(r) at the pins | [25]=Serre; ψ₃=3x(x³+8); discs 81, −23; no modular-curve carrier | sound | none |
| `localTerms` §0.1; `martin_dimension_formula` §0.5; `martin_sharp_bound` §0.16; §§0.6–0.15 (r9) | 1≤N≤4000; 11,250 tuples | 0 mismatches; 12g at 11, 23, 35, 37, 59 = 12, 24, 36, 24, 60; equality set {35} ∪ primes ≡11 mod 12 | sound | none |
| §§2.1–2.3; §3.1; §3.7a; §3.10; §3.13; §3.16; §4.8; §4.18 (r9) | N=1,4,11,35; N=11,23; J=4ℤ; q=2; y²=x³−x | F=1, 3+2√2, (1+√8)⁶; a₂=−2 and (−1±√5)/2; a₁=1∉4ℤ; `hbad` excludes 2; #E(𝔽₃,𝔽₅,𝔽₇)=4,8,8; 17 levels; ℤ/6, ℤ/22 | sound | none |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `full_two_uniform_irreducibility` (r9) | degrees 0, 1, 22, 20; ℓ=3, (4,36) | 0 noncyclic; 1 allowed; 22, 20 absent; 3P=0 so cutoff 5 needed | sound | none |
| `split_normalizer_exclusion`, `proper_image_nonsplit`, `cyclic_isogeny_integral_j`, §§5.19–5.23, §§5.3a, 5.3c, 5.25a, `lemos_uniform_surjectivity`, Conventions (r9) | p=11,13,17; p>37; y²=x³−x at 11; r=2,3,5,7,13; d=1,2; n=1; q+2q² | hypotheses exclude 11, 13; PSL₂(𝔽₁₁) order 660; j=1728∈ℤ; 25, 13, 8, 6, 4 values; 6.247·10⁶<6.895·10⁶; B(E₁₁)=2; n=1 excluded; L(1)=2, W=i/π | sound | none |
| Sibling against this folder | the j-table and degree-list statements at #1491 head 1604bab | identical bodies, lines 165 and 230 there against 252 and 286 here; the same seven values | duplicate | R01 |

## Not verifiable

- The table that lemos-2017 cites for S₁₁, S₁₇ and S₃₇ ([6, p.98]) is not in the manifest and was not read; the values were checked against lemos-2017 lines 197–202 and, at r=11 and r=37, against the five curves in the new Check.
- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified and untouched by this diff.

## Source issues

- **Error** in lemos-2017 at §2, proof of Theorem 1.1, printed page 5: the source says the Jacobian of X₀(37) has rank zero; it has rank one, so the point determination needs a rank-zero quotient instead; affects the proof.
