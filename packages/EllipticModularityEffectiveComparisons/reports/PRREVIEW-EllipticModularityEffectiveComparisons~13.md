# Review of EllipticModularityEffectiveComparisons (pull request #1810 at ba802e5)

**Verdict:** rejected

This is an incremental re-review of the 4 lines changed since c001b88. There is one commit, ba802e5, and it rewrites two README sentences: line 1184 (§5.1) and line 1275 (§5.3c). Nothing changed outside the folder, and `Suggested.lean` is byte-identical to c001b88. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 17 `sorry` warnings and exit 0.

Both rewritten sentences are correct. The new gloss of Y₀(r)(ℚ) matches Mazur's column definition, and the new gloss of Y_s⁺(p)(ℤ) is Bilu–Parent's own definition of integral points. Both are checked in the table below. R01 is still not repaired, and no edit inside this folder can repair it. EllipticCurveModularityPartII is still open, still earlier in the merge order, and still states the same theorems. Both rewritten passages are themselves among the overlapping targets. R01 is the only finding, so the verdict stays `rejected`.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~12; earlier GATE~5–~11; PRREVIEW~10–~12 R01).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5, and `Suggested.lean`, lines 53–302. README line 1707 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII. GATE~12 tabulates all 17 theorems against the sibling and concedes the match. This round's sibling checkout is at 504db2f; the open-PR index lists 86f110e. At that checkout:
- `isogeny_j_tables_11_17_37` (line 286 here) has the same body as the sibling's `rational_isogeny_j_tables` (its `Suggested.lean` line 257), up to the predicate name. The predicates `CyclicIsogenyDegree` (line 158 here) and `HasCyclicIsogeny` (its line 206) are identical token for token.
- `non_cm_prime_isogeny_degrees` (line 252 here) has the same body as the sibling's `noncm_prime_isogeny_degrees` (its line 219), with `GeometricallyNonCM` (line 215 here) in place of the identically defined `NonCM` (its line 198).
- The two passages this commit rewrites are part of the overlap:
  - §5.1 (CM prime-isogeny exceptions) corresponds to the sibling's §5.0a (its README lines 559 and 587: "degrees 19,43,67,163 force geometric CM").
  - §5.3c (the explicit Runge inequality, Bilu–Parent–Rebolledo Theorem 3.1) is an input to the sibling's §6.0f "The split-Cartan rational-point theorem" (its README line 778), which cites the same theorem.

**Witness.** The sibling's README line 7 still reads "this Part II owns the six comparison layers below". In `ORDER.txt` the sibling is on line 275 and this folder on line 285. ErdosProgressionPowers (head 3e1048c) names the sibling on 17 README lines and this folder on none.

**Why the settled reason fails.** GATE~12 answers H01 as follows: "The finding is correct … No edit inside this folder carries out either option, so the decision stays with a human." That is a concession, not a reason why the finding is wrong. The binding rule is that what another roadmap plans is imported, never planned again, and that the owner is the roadmap earlier in the order. So the finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of the following.
1. **Close #1810.** The consumers and the merge order already point at the sibling. Content found only here would first have to move into the sibling's pull request:
   - the §5.1 point counts and the j-values −96³, −960³, −5280³ and −640320³;
   - the finer decompositions of Martin's bound (§§0.3–0.15), Mazur's theorem (§§4.1–4.6), Kenku's levels (§§4.8–4.15) and the split-Cartan chain (§§5.3b–5.7).
2. **Close the sibling and keep this folder.** Then:
   - re-point the sibling's consumers to the counterparts listed at README line 1707;
   - give owners here to what only the sibling has: its §1.8 majorants, its §6.0e rank-zero theorem, the §6.0f minimal period subvariety, `norm_bound`/`removed_prime_bound`, and `FullRationalTwo`/`RationalTwo`.

**Tested on the instance.**
- The two j-table statements give the same seven values, recomputed: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677 and −9317.
- The two degree-list statements give the same Finset {2,3,5,7,11,13,17,37}, under definitionally identical hypotheses.

## Previous findings

- R01 — not repaired: README line 1707 still concedes that EllipticCurveModularityPartII "plans the same results". The sibling is open at 504db2f and earlier in the order (line 275 against 285). It still states the same two theorems (its lines 219 and 257). Raised again above.

## Verified sound

**Gate, dependency check and Lean.**
- Hand run of the gate at ba802e5. Every check is 0 and the line ends `OK`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's `gate.md` agrees and adds `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds only README.md, Suggested.lean and metadata.toml.
- Dependency check (`--movable`, board order, content checkout). It prints no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

- `lake env lean` on `Suggested.lean` exits 0. Its output is exactly 17 "declaration uses `sorry`" warnings and nothing else, at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.
- `git diff c001b88 HEAD --stat` touches only README.md, so `Suggested.lean` is unchanged. r10's `#check` pass (27 declarations, 0 lost binders, as `signatures.md` also says) and its one-tactic probe (15 sorried theorems, none closes) carry over.

**The changed passages, each checked against its source.**
- README line 1184, §5.1. "the noncuspidal rational point set Y₀(r)(ℚ) on the smooth projective X₀(r)" became "Y₀(r)(ℚ), the set of noncuspidal rational points of the smooth projective X₀(r)". This repairs the remark of r12, which said the old wording was redundant. The gloss is Mazur's v-column: mazur-1977 line 574 (p.41) defines v as the number of noncuspidal rational points on X₀(N), and mazur-1978 lines 14–18 (p.129) give v=1 at N=19, 43, 67 and 163.
  - The cusps 0 and ∞ of X₀(r) are rational for prime r, so #X₀(r)(ℚ)=3 and #Y₀(r)(ℚ)=1. This agrees with the table at lines 1186–1191 and with Check line 1205 (3−2=1).
  - The locators "mazur-1977 lines 300–574, table p.40 and its column definitions p.41" and "mazur-1978 lines 14–29, p.129" are exact. The table begins at line 300 under header 40, and the column definitions end at line 574 under header 41.
  - The consumers line 1197 ("a rational point of Y₀(r), which is P_r") and §5.28 (lines 1691 and 1695) read the same set.
- README line 1275, §5.3c. "integral noncuspidal point P∈Y_s⁺(p)(ℤ)" became "every P∈Y_s⁺(p)(ℤ), the set of noncuspidal rational points of X_s⁺(p) with integral j-invariant". This is the source's definition:
  - bilu-parent-split lines 23–24 define Y_G(ℤ) as the P∈Y_G(ℚ) with j(P)∈ℤ;
  - bilu-parent-rebolledo lines 235–236 define Y_G as X_G without its cusps;
  - bilu-parent-rebolledo line 561 takes X_split(p) for the group of diagonal and anti-diagonal matrices, which is the split Cartan normalizer, so X_split(p)=X_s⁺(p).

  The statement itself matches the source:
  - Theorem 3.1 (bilu-parent-rebolledo lines 328–330, header 964) states the same bound, for p>3, with no non-CM hypothesis.
  - The proof runs from line 560 (p.968) to line 622 (p.970), as the locator says.
  - bilu-parent-rebolledo lines 685–687 (p.972) apply Theorem 3.1 once j(P)∈ℤ is known, exactly as §5.4 does here with §5.3b.
- The changes add no Lean name, no citation, no process word, no pull-request number and no path.

**Seeded sample, where it falls in the changed passages.**
- §5.1 is read in full above.
- §5.7 depends on §5.3c through §5.4, so its locators were read:
  - Theorem 1.1 is at bilu-parent-rebolledo line 104 (p.959).
  - The identification X_split(p)≃X₀⁺(p²) is at lines 164–165 (p.960) and (2.3) at line 305.
  - Theorem 4.1(i) is at lines 625–627 (p.970) and Proposition 5.9 at line 971.

  The statement (p>11, p≠13, geometrically non-CM) matches.
- The other sampled targets (0.5, 0.9, 0.10, 0.12, 2.1, 3.7, 3.11, 4.6, 4.10, 4.20, 5.20, 5.21, 5.25a) neither changed nor depend on the changed text. Under the incremental brief they were not re-read.

**Cross-roadmap citations resolved this round.**
- EllipticCurveModularityPartII at 504db2f: README lines 7, 559, 587 and 778; `Suggested.lean` lines 198, 206, 219 and 257.
- ErdosProgressionPowers at 3e1048c.
- `roadmaps resolve` lists nothing found nowhere. `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no revision-only id.
- `roadmaps grep --fixed '21(log p)²'` finds the Runge constant only in this folder.
- Ownership against the open pull requests was checked for the objects the diff touches: the Y₀(r)(ℚ) exhaustions and the split-Cartan Runge bound. The only second owner is the sibling of R01.

**Declared gaps.** These are unchanged since r10. The README has seven slugs: chen-winding-comparison, mixed-cusp-charts, modular-rank-zero, optimized-elliptic-weight-two, positive-characteristic-support, quantitative-abelian-periods and weight-two-local-reduction. None has supplier `none`.

**Remarks, not findings (untouched text).**
- GATE~12 says Y₀(r) first appears on line 1184, but Y₀(p)(K) already appears at line 86 (the AnabelianGeometryAndNonabelianChabauty contract) and Y₀(p²)(K) at line 1305. X_s⁺(p) appears unglossed at line 1261. All three are the literature's standard notation, so no change is needed.
- The pull-request description still says "fourteen headline theorems" and "nine simple definitions". The file has 17 theorems and 10 definitions (one of them an instance).
- `design/plan.json` still lists `all-embedding-frobenius`, which the README does not declare, so the intake withdraws it.

**Adversarial pass.** The first five rows were computed this round. The rest are carried from the reports named in each row, with their values, for statements this diff leaves untouched.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.1 line 1184: Y₀(r)(ℚ) = noncuspidal rational points of X₀(r) | r=19, 43, 67, 163; reading Y₀ as X₀ | μ=r+1, ν₂=0 (r≡3 mod 4), ν₃=2 (r≡1 mod 3), two cusps: g=1, 3, 5, 13, equal to mazur-1978 lines 16–18; v=1 each; #X₀(r)(ℚ)=3 against #Y₀(r)(ℚ)=1; 96³=884736, 960³=884736000, 5280³=147197952000, 640320³=262537412640768000, as in the table | sound; the X₀ reading would give 3, not the table's singleton | none |
| §5.1 consumer line 1197 at r=19 | y²+y=x³−38x+90 | c₄=1824, Δ=−6859=−19³, j=1824³/(−6859)=6068404224/(−6859)=−884736=j(P₁₉) | sound | none |
| §5.3c line 1275: Y_s⁺(p)(ℤ) gloss and bound | p=5, 17, 3; j=0, 1/2 | gloss = bilu-parent-split lines 23–24; RHS(5)=48.0329, RHS(17)=83.7895, as in Checks 1–2; j=0: h=log max(1,0)=0≤48.03; j=1/2 is outside the set (h=log 2=0.6931); p=3 fails p>3 (source line 328) | sound | none |
| §5.3c inside §5.4 | p=1.4·10⁷ | p≥17, so §5.3b puts every noncuspidal P∈X_s⁺(p)(ℚ) in Y_s⁺(p)(ℤ); RHS = 23509.53+98.73+1.52 = 23609.77; source lines 685–687 use the same step | sound | none |
| Sibling against the changed passages | sibling §5.0a (lines 559, 587), §6.0f (line 778) at 504db2f | §5.0a: "degrees 19,43,67,163 force geometric CM" = §5.1 corollary; §6.0f cites BPR Theorem 3.1, the §5.3c bound | duplicate | R01 |
| Sibling against this folder (r12) | j-table and degree-list statements | identical bodies at sibling lines 219 and 257 against 252 and 286 here; definitions at 198/206 there against 215/158 here; the same seven values | duplicate | R01 |
| §5.25 Check 3: J₀(37) has positive rank (r12) | y²+y=x³−x; primes 2, 3, 37 | b₂,b₄,b₆,b₈ = 0,−2,1,−1; c₄=48, Δ=37; 37∤48; #E(𝔽₂)=5, #E(𝔽₃)=7; torsion trivial; (0,0) of infinite order | sound | none |
| §5.25 Check 1: the five curves (r11) | [1,1,1,−30,−76], [0,−1,1,−7,10], [1,1,0,−2,−7], [1,1,1,−8,6], [1,1,1,−208083,−36621194] | j = −24729001, −32768, −121, −9317, −162677523113838677 | sound | none |
| §5.25 Check 2: j=0 control (r11) | t=−16 on X₀(2); y²=x³+2 | (t+16)³/t=0; x³+2 has no rational root; y²=x³+1 has (−1,0) | sound | none |
| `exceptional_prime_isogeny_j` §5.1 (r10) | (19,96); the four γ; (19,960); r=11 | j=−96³; the other values are among the 13 rational CM j-values; (19,960) and r=11 are outside the Finset | sound | none |
| `non_cm_prime_isogeny_degrees` §5.1 (r10) | 11a1; the CM curve above; r=1 | 11a1 has a rational 5-isogeny and 5 is in the list; the CM curve has r=19, outside the list, so `hCM` is needed; r=1 is outside the list, so `hr` is needed | sound | none |
| `isogeny_j_tables_11_17_37` §5.25 (r10) | the seven values; 121a1, 121b1, 121c1 | = lemos-2017 lines 197–202; only −32768 is CM | sound | none |
| WeightsInEtaleCohomology §6.1 at k=2 (r10) | 11a at q=2; level 23 at q=2 | roots −1±i of modulus √2≤2√2; 0.618, 1.618≤2.828 | sound | none |
| §1.4, §3.4 (r10) | level 23, p=2; b∈{−3,…,3} | norms 11, 5; N(b−a₂)=1, −1, −1, 1, 5, 5, 11, all ≤33.97 | sound | none |
| §§4.19–4.20; coprime-degree bijection (r10) | y²=x³−x at n=3, 2; y²=x(x+5)(x+32) at ℓ=3 | n=3 bijective (9=9), n=2 not; 3P=O with full 2-torsion, and 12 is in the list | sound | none |
| `localTerms` §0.1; `martin_dimension_formula` §0.5; `martin_sharp_bound` §0.16 (r9) | 1≤N≤4000 | 0 mismatches; 12g at 11, 23, 35, 37, 59 = 12, 24, 36, 24, 60; equality set {35} ∪ primes ≡11 mod 12 | sound | none |
| §§2.1–2.3, 3.1, 3.7a, 3.10, 3.13, 3.16, 4.8, 4.18 (r9) | N=1, 4, 11, 35; J=4ℤ; q=2 | F=1, 3+2√2, (1+√8)⁶; a₁=1∉4ℤ; #E(𝔽₃,𝔽₅,𝔽₇)=4, 8, 8; 17 levels | sound | none |
| `prime_cyclic_isogeny_degrees`, `rational_cyclic_isogeny_degrees`, `full_two_uniform_irreducibility` (r9) | degrees 0, 1, 22, 20; ℓ=3 | 0 is not cyclic; 1 is allowed; 22 and 20 are absent; the cutoff 5 is needed | sound | none |
| `split_normalizer_exclusion`, `proper_image_nonsplit`, `cyclic_isogeny_integral_j`, `lemos_uniform_surjectivity` (r9) | p=11, 13, 17; p>37; y²=x³−x at 11 | the hypotheses exclude 11 and 13; PSL₂(𝔽₁₁) has order 660; j=1728∈ℤ; B(E₁₁)=2 | sound | none |

## Not verifiable

- lemos-2017 cites a table for S₁₁, S₁₇ and S₃₇ as [6, p.98]. That table is not in the manifest and was not read; the README cites lemos-2017 lines 197–202 instead.
- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified, and this diff does not touch them.

## Source issues

- **Misprint** in bilu-parent-rebolledo at §2, end, printed p.964 (lines 322–323): the source says the height of a rational integer or imaginary quadratic integer j is log|j|; it should be log max(1,|j|), which differs at j=0, where log|j| is undefined; affects nothing.
