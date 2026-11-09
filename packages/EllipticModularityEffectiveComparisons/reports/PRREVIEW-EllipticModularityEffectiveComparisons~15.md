# Review of EllipticModularityEffectiveComparisons (pull request #1810 at c90f56d)

**Verdict:** rejected

This is an incremental re-review of the 142 lines changed since b26ab9f: one commit, c90f56d, touching README.md only (71 lines in, 71 out). `Suggested.lean` is byte-identical to b26ab9f and nothing changed outside the folder. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 17 `sorry` warnings.

All 71 rewritten lines are notation only (ASCII mathematics outside code spans replaced by Unicode) and each keeps its meaning; none introduces a new problem. The only finding is R01, carried from the previous report. No edit inside this folder can repair it, so the verdict stays `rejected`.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~14; earlier GATE~5–~13; PRREVIEW~10–~14 R01).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5, and `Suggested.lean`, lines 53–302. README line 1707 still concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII, open at 504db2f (unmoved since the previous round; re-read this round):
- `non_cm_prime_isogeny_degrees` (line 252 here) has the same body as the sibling's `noncm_prime_isogeny_degrees` (its `Suggested.lean` line 219). `GeometricallyNonCM` (line 215) and `CyclicIsogenyDegree` (line 158) are the sibling's `NonCM` (its line 198) and `HasCyclicIsogeny` (its line 206).
- `isogeny_j_tables_11_17_37` (line 286 here) has the same body as the sibling's `rational_isogeny_j_tables` (its line 257).
- The passages this commit rewrites are part of the overlap: §§4.9–4.16 (Kenku's levels), §§5.9–5.17 (the nonsplit-Cartan winding-quotient chain) and §§5.19–5.25 are steps of results the sibling owns.

**Witness.** The sibling's README line 7 reads "this Part II owns the six comparison layers below". In the merge order the sibling is on line 275 and this folder on line 285.

**Why the settled reason fails.** GATE~14 answers H01 with "The finding is not disputed" and names closing one of the two pull requests as the human decision. That concedes the finding; it gives no reason why it is wrong. What another roadmap plans is imported, never planned again, and the owner is the roadmap earlier in the order. The finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of the following.
1. **Close #1810.** Content found only here first moves into the sibling's pull request: the §5.1 point counts and the j-values −96³, −960³, −5280³, −640320³; the finer decompositions of Martin's bound (§§0.3–0.15), Mazur's theorem (§§4.1–4.6), Kenku's levels (§§4.8–4.15) and the split-Cartan chain (§§5.3b–5.7). Three consumer lists (ModularSymbolsPadicLFunctions, FaltingsFinitenessAndIsogenyTheorems, ImaginaryQuadraticClassNumber) then drop this folder's name.
2. **Close the sibling and keep this folder.** Then re-point the sibling's consumers to the counterparts listed at README line 1707, and give owners here to what only the sibling has: its §1.8 majorants, its §6.0e rank-zero theorem, the §6.0f minimal period subvariety, `norm_bound`/`removed_prime_bound`, and `FullRationalTwo`/`RationalTwo`. GATE~14's prepared `removed_prime_exponent_bound` (statable only at main's Tau Ceti pin, see the remark below) belongs to this option.

**Tested on the instance.** The two degree-list statements give the same Finset {2,3,5,7,11,13,17,37} under identical hypotheses; the two j-table statements give the same seven values.

## Previous findings

- R01 — not repaired: README line 1707 still says EllipticCurveModularityPartII "plans the same results". The sibling is open at 504db2f, earlier in the order (275 against 285), with identical theorems at its lines 219 and 257. Raised again above.

## Verified sound

**Gate, dependency check and Lean.**
- Hand run of the gate at c90f56d; every check is 0:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's `gate.md` agrees and adds `build=0`.
- Dependency check (`--movable`, board order, content checkout), with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

- `lake env lean` on `Suggested.lean` prints exactly 17 "declaration uses `sorry`" warnings (lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286, 298) and nothing else.
- `git diff b26ab9f HEAD --stat` touches README.md only. So r10's `#check` pass (27 declarations, 0 lost binders, as `signatures.md` also says) and its one-tactic probe (no sorried theorem closes) carry over.
- The diff outside the folder is empty; the folder holds README.md, Suggested.lean and metadata.toml.

**The changed passages (71 lines).** Every removed/added pair of the diff was read; each differs only in notation:
- sqrt(x) → √x (lines 240, 385, 389, 409, 413, 445, 470, 494, 502): §§0.6, 1.1, 1.4, 1.6, 2.1, 2.2. The identities are unchanged: p+1−2√p=(√p−1)², p+1+2√p=(√p+1)², exponent (M₀+1)/6, krausF and krausG with the same parenthesisation (√(I/6)+1).
- F_q, F₂, F3, F5, F_(q^n), F_p → 𝔽 forms (lines 594, 705–767, 869–887, 1373–1389, 1447, 1623, 1687), matching 𝔽_ℓ in the Conventions (line 23).
- X0(d) → X₀(d) (lines 955–1043, 1397–1411, 1557–1559, 1607–1609, 1633); X0,ns^+(r,p) → X_(0,ns)⁺(r,p) (lines 1397, 1435, 1447, 1471, 1473), the same curve as before, and consistent with X_ns⁺(p) in §5.16a; Nsp, Nns, B+, B− → N_sp, N_ns, B⁺, B⁻.
- Qbar → ℚ̄, End_Q → End_ℚ, Q_q → ℚ_q, 2Z → 2ℤ, (ℤ/2Z)² → (ℤ/2ℤ)², SL2 → SL₂, P1_Q → ℙ¹_ℚ, ℚ(ζ_p)^+ → ℚ(ζ_p)⁺.
- The cusp "infinity" → ∞ (lines 1459–1485, 1557, 1559); line 1415 "from 0 to infinity" → "from 0 to i∞", which is the winding path the Conventions fix at line 25.
- Residue search after the change: `sqrt(`, `X0(`, `F_q`, `Qbar`, `2Z`, `SL2`, `Nns`, `P1_Q` occur 0 times outside code spans; the one remaining `X0(r*p^2)/w_(p^2)` (line 25) is inside a code span, where ASCII is the house style. The word "infinity" remains only in prose (lines 657, 675, 1322, the §5.16a heading and line 1514).
- No Lean name, locator, hypothesis, Needs line, process word or path is added or changed.

**Seeded sample, where it falls in the changed passages (6 of 15 targets).**
- §3.4 (line 594): kraus-1997 lines 342–363, printed p.1145 (page 5 of the extraction begins at line 198, p.1143 being page 3): the norm of a_ℓ−a_ℓ(E) or a_ℓ∓(ℓ+1), nonzero because a_ℓ∉ℤ, bounded by (√ℓ+1)^(2g). Supports the statement.
- §4.9 (line 955): banwait-najman-padurariu lines 61–70, Table 1.1, p.2: ν=2, 4, 4, 1 at N=14, 15, 21, 27; the levels 20, 24, 32, 36, 49 are absent from the table, hence 0.
- §4.10 (lines 969–975): banwait-najman-padurariu lines 56–59, p.2: X₀(N)(ℚ) is only cusps for N=39, 65, 91, 125, 169.
- §4.18: its own text is unchanged; the changed line 1081 is §4.19's route. Read; cyclic kernel of order four against (ℤ/2ℤ)², unchanged in meaning.
- §5.1 (line 1201): mazur-1978 lines 13–28, p.129 (ν=1 at 19, 43, 67, 163; the class-number-one explanation); lemos-2017 lines 187–189, p.5 (non-CM list {2,3,5,7,11,13,17,37}).
- §5.9 (line 1389): lemos-2017 Proposition 2.2 at line 141, p.4, p≥5, nonsplit normalizer; proof lines 145–150 (quadratic twist of a Tate curve).
- §§0.11, 0.12, 1.5, 2.3, 3.7, 3.9, 4.1, 5.16a, 5.17 neither changed nor depend on changed text; under the incremental brief they were not re-read.

**Cross-roadmap citations resolved this round (2 roadmaps).** EllipticCurveModularityPartII at 504db2f (README line 7; `Suggested.lean` lines 198, 206, 219, 257); the merge order (lines 275, 285). `citations.md` lists nothing found nowhere. `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no revision-only id; the closest roadmap in vocabulary is the sibling of R01 (0.49). The diff adds no object, so no new ownership question arises.

**Declared gaps.** Unchanged: seven slugs in the README (chen-winding-comparison, mixed-cusp-charts, modular-rank-zero, optimized-elliptic-weight-two, positive-characteristic-support, quantitative-abelian-periods, weight-two-local-reduction), none with supplier `none`.

**Remarks, not findings (untouched text or outside the folder).**
- The module docstring of `Suggested.lean` says the removed-prime exponent bound is not statable because the arithmetic conductor is missing. That holds at this branch's Tau Ceti pin (358314d; no `TateAlgorithm/Reduction` directory under the pinned `EllipticCurve`), and main pins 2fd255d; GATE~14 reports the conductor there. The statement is correct at the pins this review is held to.
- The pull-request description still says "fourteen headline theorems" and "nine simple definitions"; the file has 17 theorems and 10 definitions.
- `design/plan.json` still lists `all-embedding-frobenius`, which the README does not declare.

**Adversarial pass.** The first seven rows were computed this round, for the changed statements. The rest are carried from the reports named in each row, for statements this diff leaves untouched.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 line 389: p+1−2√p=(√p−1)²>0 | p=2, 3, 5, 7 | 0.1716, 0.5359, 1.5279, 2.7085, all >0; p=1 would give 0 but p≥2 | sound | none |
| §1.4 line 413: p+1+2√p=(√p+1)² | p=2, 3, 5, 7 | difference 0.0 in each case; at p=2 the good-case bound 4√2=5.657≤(√2+1)²=5.828 (§3.4) | sound | none |
| §2.2 lines 494, 502: krausG(N)=(√(I(lcm(N,4))/6)+1)² | N=1, 4, 11, 12 | I(lcm)=6, 6, 72, 24 against I(4N)=6, 24, 72, 96; G=4, 4, 19.93, 9; at 4∣N lcm(N,4)=N, so the Check at line 502 holds, and 4N would give a different value at N=4, 12 | sound; "lcm essential" confirmed | none |
| §4.3 lines 881–887: traces over 𝔽_(3^12) | a∈{−3,…,3} at q=3; a∈{−4,…,4} at q=5; recurrence A₀=2, A₁=a | q=3: A₁₂=1458 (a=0, ±3), 658 (a=±2), −1358 (a=±1), the set {658, −1358, 1458}; q=5: {−28334, −25774, 23506, 31250} | sound | none |
| §4.19 line 1081: cyclic kernel, not (ℤ/2ℤ)² | y²=x³−x | carried value: degree-four kernel cyclic; composing with the own dual gives [2], kernel (ℤ/2ℤ)² | sound | none |
| §5.11 line 1415: integral from 0 to i∞ | f=q+2q² formally | ∫_(0 to i∞)2πi f dz=−(1+2/2)=−2=−L(f,1), the Conventions' sign at line 25; a real path 0→∞ leaves the upper half-plane | sound; now agrees with line 25 | none |
| §§5.10, 5.13–5.16: X_(0,ns)⁺(r,p), ℚ(ζ_p)⁺, N_ns B⁺=GL₂(𝔽_p) | p=11, 17 | [ℚ(ζ_p)⁺:ℚ]=(p−1)/2=5, 8; \|N_ns\|·\|B\|/\|N_ns∩B\| = 2(p²−1)·p(p−1)²/(2(p−1)) = p(p−1)²(p+1) = \|GL₂(𝔽_p)\| (13200 at p=11) | sound | none |
| Sibling against this folder (r12, r14, re-read) | j-table and degree-list statements | identical bodies at sibling lines 219 and 257 against 252 and 286 here; definitions at 198/206 there against 215/158 here | duplicate | R01 |
| §5.3b, §5.4, line 86, §5.7 route (r14) | p=11, 13, 17; p=1.4·10⁷ | j-degrees 66, 91, 153; cusps 6, 7, 9; threshold 23609.77; ranges disjoint and covering | sound | none |
| §5.1 line 1184: Y₀(r)(ℚ) (r13) | r=19, 43, 67, 163 | g=1, 3, 5, 13; ν=1 each; 96³=884736, 960³=884736000, 5280³=147197952000, 640320³=262537412640768000 | sound | none |
| §5.3c: Y_s⁺(p)(ℤ) and the Runge bound (r13) | p=5, 17, 3; j=0, 1/2 | RHS(5)=48.0329, RHS(17)=83.7895; h(0)=0; p=3 fails p>3 | sound | none |
| §5.25 Checks 1–3 (r11, r12) | five curves; t=−16 on X₀(2); y²+y=x³−x | j = −24729001, −32768, −121, −9317, −162677523113838677; (t+16)³/t=0; c₄=48, Δ=37 | sound | none |
| `exceptional_prime_isogeny_j`, `non_cm_prime_isogeny_degrees`, `isogeny_j_tables_11_17_37` (r10) | (19,96); 11a1; r=1 | j=−96³; 5 in the list; r=19 outside it, so `hCM` is needed | sound | none |
| WeightsInEtaleCohomology §6.1 at k=2; §1.4, §3.4 (r10) | 11a at q=2; level 23, p=2 | roots −1±i of modulus √2≤2√2; norms 11, 5; N(b−a₂)≤33.97 | sound | none |
| `localTerms`, `martin_dimension_formula`, `martin_sharp_bound` (r9) | 1≤N≤4000 | 0 mismatches; 12g at 11, 23, 35, 37, 59 = 12, 24, 36, 24, 60; equality set {35} ∪ primes ≡11 mod 12 | sound | none |
| §§2.1–2.3, 3.1, 3.7a, 3.10, 3.13, 3.16, 4.8, 4.18 (r9) | N=1, 4, 11, 35; J=4ℤ; q=2 | F=1, 3+2√2, (1+√8)⁶; a₁=1∉4ℤ; #E(𝔽₃,𝔽₅,𝔽₇)=4, 8, 8; 17 levels | sound | none |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `full_two_uniform_irreducibility` (r9) | degrees 0, 1, 22, 20; ℓ=3 | 0 is not cyclic; 1 allowed; 22 and 20 absent; cutoff 5 needed | sound | none |
| `split_normalizer_exclusion`, `proper_image_nonsplit`, `cyclic_isogeny_integral_j`, `lemos_uniform_surjectivity` (r9) | p=11, 13, 17; p>37; y²=x³−x at 11 | hypotheses exclude 11 and 13; PSL₂(𝔽₁₁) has order 660; j=1728∈ℤ | sound | none |

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified. The changed lines of §§4.10–4.14 cite them by published locator only; the statements were checked against banwait-najman-padurariu lines 56–59 instead.

## Source issues

- none
