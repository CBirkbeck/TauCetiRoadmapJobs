# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 9f4cf30)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/` at `9f4cf30`; 208 lines changed since `be1d8b4`. Previous findings R02–R05 are repaired. The branch-pin finding (previous R01) is unchanged and held as R02. The full pass adds one more blocking finding and two P3 findings:

- **R01 (P2).** §1.1 re-plans the proper mass identity that GeometryOfNumbersAndQuadraticArithmetic §3.3.4 already owns.
- **R02 (P2).** The branch still pins a Tau Ceti that lacks cited files (held; merge main, no edit to the folder).
- **R03 (P3).** A rank-one genus Check is false.
- **R04 (P3).** A Layer 1 API bullet uses a Layer 3 theorem.

## Previous findings

Numbered as in the previous review.

- **R01 (P2), the branch pins Tau Ceti `a91d3aa`: not repaired.** `lake-manifest.json` is unchanged; the finding is held as R02 below.
- **R02 (P2), the arbitrary-genus formula: repaired.**
  - Suggested.lean now defines `SameGenus` (line 104), `genusMass` (line 111) and `localDensity` (line 118), and states `genusMass_eq` (line 129), "the full mass of its genus is `2 π^(−n(n+1)/4) ∏_{j=1}^{n} Γ(j/2) · (det G)^((n+1)/2) · ∏_p (α_p(G)/2)⁻¹`".
  - The docstring keeps only the measure identities of 1.1–1.3 as not statable (lines 21–24).
  - README §1.3 (lines 254–302) gives each of the three definitions API bullets and three Checks.
- **R03 (P3): repaired.**
  - Line 11 now reads "(AdelicAlgebraicGroups AA.1.3)". At the AdelicAlgebraicGroups head, the "not open" Check is at line 1303, inside §1.3 (lines 1259–1321).
  - `riemannZeta_two_mul_nat` is named in §3.1's *Needs:* (line 551) and in Layer 3's Dependencies (line 593).
- **R04 (P3), house style: repaired.**
  - Abbreviations are written out, for example line 171, "IntegralLattices §4B".
  - A scan of the README for `IL`/`GNF`/`OG` abbreviations, all-capital words and glued numerals finds none. The only all-capital word is "README" in line 501.
  - The formulas formerly in ASCII are now Unicode, as in lines 209 and 224, or in code spans, as in line 563.
- **R05 (P3), the docstrings: repaired.** Suggested.lean lines 94–95, 139–140 and 149–150 now state the mathematics. Line 149, for example, reads "`|B_m/(2m)| · ∏_{j=1}^{m−1} |B_{2j}/(4j)|` … at `m = 0` the division by zero makes it `0`".

## R01 (P2) — §1.1 re-plans the proper mass identity owned by GeometryOfNumbersAndQuadraticArithmetic §3.3.4

**Location.** README line 209 says to "construct the measurable decomposition of SO(V)(K)\SO(V)(A) into pieces indexed by actual proper lattice classes, with arithmetic stabilizer SO(M)". Line 211 constructs it: "In the totally definite branch Γ_i is finite … gives vol(G∞)vol(K_f)/|Γ_i|".

**Claim.** §1.1 constructs, for totally definite forms over a number field, the class decomposition of the proper adelic quotient and its volume. Its *Needs:* line (213) also cites GeometryOfNumbersAndQuadraticArithmetic's identity. IntegralLattices on main points this decomposition (its label 7B, README line 84) at §1.1.

**Witness.** GeometryOfNumbersAndQuadraticArithmetic (merge order 55, before 149), head README line 1089: §3.3.4 gives, for totally positive q over totally real K (ℚ included), proper mass = vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f)). Line 42: "The adelic mass identity … owned here".

**Repair.** GNQA is the earlier roadmap in the merge order, so it keeps the object, and this roadmap cites it.

1. **§1.1.** Cite GeometryOfNumbersAndQuadraticArithmetic §3.3.4, at K = ℚ, for the totally definite decomposition and its volume. Delete line 211's construction for that branch: the identification Γ_i\(G∞ × K_f), its inverse, and the finite pushforward.
2. **§1.1's own target.** Make it the identification of IntegralLattices §4B's proper double-coset set and stabilizers SO(M) with GNQA §3.3's double cosets and integral stabilizers for the ℤ-lattice of the same Gram matrix. That is what IntegralLattices 7B needs on native classes.
3. **Citations.** Name "§3.3.4, the proper mass identity" in the GNQA sentence of the Scope (line 9) and in the From GeometryOfNumbersAndQuadraticArithmetic contract (line 62). In line 213, write "§3.3.4" in place of "§3.3 proper mass identity".
4. **The general branch.** Keep the quotient-integration branch only together with a target that consumes it. Every mass statement in this roadmap is positive definite.

## R02 (P2) — The branch pins a Tau Ceti that lacks cited files

Re-raised: R01 of the previous review. The repair report was not available to this review; the merge is the worker's rebase step, and the finding stays until the head is merged.

**Location.** `lake-manifest.json` of the branch, against README lines 30–46 and 625–629. For example, line 34: "`RootPairing.card_weylGroup_of_hasCartanType_A` in `TauCeti/LinearAlgebra/RootSystem/Weyl/TypeA/Basic.lean`".

**Claim.** The cited declarations are present at the pinned Tau Ceti.

**Witness.** The branch pins `a91d3aa`. There, 15 of the 25 cited Tau Ceti files and 40 backticked names are missing, for example `Rank24/Niemeier.lean`, `TauCeti.weylCoxeterSystem` and `IntegralLattice.Isometry.map_span_vectorsOfNorm`. All 25 files and all 40 names exist at main's pin `2fd255d`.

**Repair.** Merge `origin/main` into the branch; no edit to `README.md` or `Suggested.lean`. Tested:

- `git merge-tree --write-tree HEAD origin/main` exits 0.
- The four Tau Ceti modules Suggested.lean imports exist at both pins, and it elaborates at the branch pin.
- The matrix lemmas its `gramSetoid` proof uses carry no deprecation at main's Mathlib `1b1ccf4`.

## R03 (P3) — The rank-one genus Check is false at p = 3

**Location.** README line 264: "and so do [1] and [17], although 17 is a square in ℤ₂ and only p = 17 separates them."

**Claim.** ⟨1⟩ and ⟨17⟩ are congruent over ℤ_p for every prime p ≠ 17.

**Witness.** 17 ≡ 2 (mod 3) is a non-residue, so u² = 17 has no solution u ∈ ℤ₃ˣ. Counting x² ≡ 17 (mod p⁶) with p ∤ x: no solution at p = 3, 5, 7, 11 or 17; solutions at p = 2 and 13.

**Repair.** Replace the clause with: "and so do [1] and [9], although 9 is the square of a unit in every ℤ_p with p ≠ 3, ℤ₂ included, and a square in ℚ: only p = 3 separates them, so a genus defined over the ℚ_p would merge them." Tested: 9 is a unit square at p = 2, 5, 7, 11, 13 and 17, and not at 3.

## R04 (P3) — §1.3's `genusMass` API cites §3.1's one-genus theorem, two layers later

**Location.** README line 272: "for G even unimodular of rank n divisible by 8 it is `evenUnimodularMass n` of §3.1."

**Claim.** This is an API fact of the Layer 1 definition `genusMass`.

**Witness.** The equality needs every even unimodular lattice of rank n in one genus, which §3.1 proves in Layer 3 (line 559). §1.3's *Needs:* line (294) omits §3.1, and §3.1's API (line 549) already states the equality.

**Repair.** Delete "; for G even unimodular of rank n divisible by 8 it is `evenUnimodularMass n` of §3.1" from line 272. Line 549 keeps the statement.

## Verified sound

### Gate, dependency check, build and Lean form

- **Gate.** The worker's gate at `9f4cf30` printed `OK` with every counter 0 (`build=0` included). My re-run on this head also printed `OK`.
- **Folder contents.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass'` is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line. The open suppliers are all earlier in the merge order: AdelicAlgebraicGroups 52, GeometryOfNumbersAndQuadraticArithmetic 55, ArithmeticStatisticsPartV 56, EndoscopicTransferAndUnitaryTraceComparison 148; this roadmap is 149. Every other supplier is on main, including SporadicOrders (merge-order line 389).
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins printed exactly six warnings, `declaration uses 'sorry'`, at lines 129, 159, 166, 170, 174 and 178.
- **Binder audit.** One scratch file ran `#check @` on all 21 declarations. Every elaborated type equals `signatures.md`. No declaration has a `variable` block to lose; `genusMass_eq` keeps `3 ≤ n`, and `evenUnimodularMass_eq` keeps `0 < n` and `8 ∣ n`.
- **Lean form.** No `set_option`, `lemma` or sorry'd data. `SameGenus` uses the binder `∀ (p : ℕ) [Fact p.Prime]`, not `haveI`.
- **Padding probe.** `simp [genusMass, localDensity]`, `rfl` and `norm_num [genusMass]` each fail on `genusMass_eq`; the residual goals compare a `tsum` of reciprocal orders with a `tprod` of `2 / limUnder …`. The other five theorems were probed in the previous round, unchanged since. Nothing is padding.
- **Every cited Mathlib name elaborates at the branch pin.** `#check` succeeded on `Real.Gamma_one_half_eq`, `Real.Gamma_add_one`, `riemannZeta_two_mul_nat` (ζ(2k) as a rational multiple of π^(2k)·B_(2k)), `sum_bernoulli` (Σ_{k<n} C(n,k)B_k = if n = 1 then 1 else 0), `bernoulli_one`, `bernoulliPowerSeries_mul_exp_sub_one`, `Filter.limUnder`, `IsCompact.exists_isMinOn`, `exists_rat_btwn`, `RootPairing.instFlipIsReduced`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` and `riemannZeta_residue_one`. `tprod` takes the default `SummationFilter.unconditional`, so `∏'` is the unconditional product that line 24 names.

### Headline inventory

- **Stated:**
  - the arbitrary-genus formula `genusMass_eq` (§1.3);
  - the even-unimodular mass formula `evenUnimodularMass_eq` (§3.1);
  - `rank16_classNumber` and `rank24_classNumber`;
  - the rank-32 and rank-40 lower bounds.
- **Named in the docstring as not statable, correctly at both Tau Ceti pins:**
  - the Spin structure theorems. Group schemes exist only as `TypeBSpinCarrier.groupScheme` and `TypeDSpinCarrier.groupScheme` (split), besides `ConstantForm`/`SpecialOrthogonal`;
  - the 1.1–1.3 measure identities (no adelic orthogonal quotient with Tamagawa measure);
  - 0.1a; Cho's model (2.1–2.2); 0.3 (no proper-spinor-genus carrier); 1.4.
- **No native carriers to reuse.** Tau Ceti has no lattice genus, local density or mass at `a91d3aa` or `2fd255d`. A declaration search finds only genus *fields* under `NumberTheory/Multiquadratic`. So the three new definitions are needed, have real bodies on native carriers, and are declared presentations of IntegralLattices §§3F/7A/7C (line 9).
- **No name clash.** IntegralLattices' Suggested.lean on main has `GramSameGenus` (line 255) and `localDensityCount` (line 700) under `TauCetiRoadmap.IntegralLattices`. The §7C definition there, at README line 2395, is the same normalization `p^{−r·n(n−1)/2}·#{XᵀAX ≡ A}`. GeometryOfNumbersAndQuadraticArithmetic's Suggested.lean declares no `genusMass`.

### Cross-roadmap citations resolved this round

| Citation | Where | Result |
| --- | --- | --- |
| IntegralLattices 0A–0G, 2C, 2G, 3C, 3E, 3F, 3I, 4A–4E, 5A, 6C–6G, 7A–7I, 9B, B1–B8 | main README; labels at 455/544, 2868, 716, 808, 853, 871, 929, 1507, 1537, 1581, 1660, 1798, 2054, 2076, 2110, 2182, 2376, 2395, 2474, 2558, 2657, 1053–1369 | All present. The overlaps file's 54 "only an open revision defines" lines are false positives |
| IntegralLattices' owner table: 4D, 4E, 7B, 7D, 7F, 7H, 7I assigned here | main README 80–88, 120 | Agrees with §§0.3, 1.1, 2.1–2.2, 1.3, 2.3/3.1, 4.1; 7B is R01 |
| GeometryOfNumbersAndQuadraticArithmetic §3.3, §3.3.3 `genusMass`, §3.3.4, §3.3.7 `finiteOrthogonalOrder`, `orthogonalTamagawa_two`, gauge names | head README 1037–1039, 1076, 1089, 1211, 1124, 1143–1147 | Present; §3.3.4 is R01 |
| AdelicAlgebraicGroups §§1.1–1.5, 2.4, 4.2 | head README 1004, 1156, 1259, 1322, 1445, 2011, 4263 | Present |
| LatticePackingsAndPerfectForms consuming §4 and the masses; ThetaSeries | LatticePackings head line 271; ThetaSeries main line 155 | Consistent. ThetaSeries excludes masses and classification, so neither is a second owner. No other open roadmap states the Smith–Minkowski–Siegel or even-unimodular mass formula (a search of all heads) |

The other supplier citations are unchanged since the previous review and were resolved there: OrthogonalSpinGroups, ReductiveGroups, RootSystems, Rank24LatticeConstructions, CFSGBasicProperties, SporadicOrders, TauberianBoundaryConvergence, ImaginaryQuadraticClassNumber and ArithmeticStatisticsPartV. The overlaps file lists no pull request that changes this roadmap and no dropped id it cites.

### Sources: the seeded sample

- **0.0, 0.2, 1.4 and 4.3.** These have no external locator; their library and supplier citations are resolved above.
- **0.1, Milne §24i.**
  - "i. The spin groups" is at MilneAG line 22081.
  - Lines 22085–22090 give the char k ≠ 2 hypothesis.
  - Lines 22129–22136 give the two-fold cover and the simply connected cover.
- **0.1a and 2.1–2.2, Cho.** Each item below holds at the stated page:
  - §4.1 heading at line 753, p.16, with the reduced orthogonal group disconnected in even and connected in odd dimension (lines 758–760);
  - Definition 2.1(c), line 117, p.3, the zero lattice of parity type II;
  - §2.3, line 208, p.5;
  - Remarks 2.6 and 2.8, lines 240 and 264, p.6;
  - Theorem 3.7, line 744, p.15;
  - Lemma 4.2 and Remark 4.3, lines 883 and 889, p.18;
  - Theorem 4.12 and Lemma 5.1, lines 1191 and 1223, p.24;
  - Theorem 5.2 and Remark 5.3, lines 1249 and 1253, p.25. Theorem 5.2 gives `β_L = f^N f^{−dim O} #G̃(κ)/[O:SO]`, the README's (1/2)f^(N−dim O)#𝒢̃.
- **0.3.** AA.4.2 is at AdelicAlgebraicGroups line 4263. O'Meara is uncertified and settled.
- **1.1, Belolipetsky–Gan §2.**
  - BelolipetskyGan lines 83–139 (pp.2–3) give the mass as Σ1/#Γ_α and as ∫µ_L.
  - Lines 103–126 give µ_cpt versus µ_sp and γ_G.
- **1.2, 1.3 and 2.3.** The Conway–Sloane locators are not verifiable (below). Their formula was checked numerically instead (table).
- **3.1, Belolipetsky–Gan.**
  - Theorem 3.1 is at line 163, p.4, with τ(G) = 2 and L(G).
  - Corollary 5.3, λ_L = 1, is at line 288, p.7.
  - λ = 1 for the even sublattice is at line 451, p.11.
- **3.2.** The four Mathlib Bernoulli declarations were elaborated (above).
- **4.1, Fomin–Reading.** §2.5 begins at FominReading line 846; Figure 2.8, at lines 913–925 on p.24, gives Dₙ `2ⁿ⁻¹n!`, E₆ `2⁷3⁴5` and E₇ `2¹⁰3⁴5·7`.
- **4.1, Chenevier–Lannes.** Corollaire 3.6 is at ChenevierLannes line 1589; the printed footer at line 1627 reads 41, and Chapter II begins at line 829.
- **4.2.**
  - Chenevier–Lannes Théorèmes 3.16–3.17 are at lines 1886–1893 (footer 48 at line 1897).
  - BorcherdsTables lines 5–81 give the 23 rooted factors and the Leech entry `/8315553613086720000`.

### Adversarial table (computed this round)

Densities were counted by brute force in exact rational arithmetic; masses and Bernoulli numbers were computed exactly from the recurrence.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `genusMass_eq`, odd unimodular | I₃, D = 1 | α₂: counts 6144 (r = 3) and 49152 (r = 4), so 12; α₃: counts 48 and 1296, so 16/9. RHS = π⁻²·(1/6)·(π²/8) = 1/48; LHS 1/|O(ℤ³)| = 1/48 | True | none |
| `genusMass_eq`, D = 2 | diag(1,1,2) | α₂ = 8 at r = 3 (not yet stable), 16 at r = 4 and r = 5 (65536, 524288); α₃ = 16/9. RHS = π⁻²·2²·(1/8)·(π²/8) = 1/16. LHS: min³ ≤ 2·det forces min 1, so the class is unique; \|O\| = 2³·2 = 16, so 1/16 | True | none |
| `genusMass_eq`, D = 4 | A₃ ≅ D₃ | α₃ = 16/9 (counts 48 and 1296); α₂ = 48 (r = 3), 96 (r = 4), 192 (r = 5, count 6291456; level 6 not counted). The RHS 2/β₂ equals 1/48 = 1/\|O(A₃)\| exactly when α₂ = 192; A₃ is the only even ternary of determinant 4 | Consistent: the count reaches 192, the value 1/48 requires | none |
| `genusMass_eq`, even rank | E₈ | 2R₈ = 135/(8π¹⁶); ∏β_p⁻¹ = 2⁻⁸ζ(2)ζ(4)²ζ(6) = 2⁻⁸π¹⁶/45927000; product 1/696729600 | True | none |
| `genusMass_eq`, rank hypothesis | ⟨1⟩ (n = 1); n = 2 | n = 1: RHS 2·1·(1/2) = 1 vs mass 1/2. n = 2: factors (1 − χ(p)/p)⁻¹, not unconditionally multipliable, so `∏'` gives 1 | `3 ≤ n` is needed | none |
| `localDensity` | rank 0; ⟨1⟩, ⟨2⟩, U at 2; ⟨1⟩ at 3 | rank 0: probe goal `limUnder atTop (fun _ => 1) = 1`. ⟨1⟩: 4 (r = 3, 4). ⟨2⟩: 8 (r = 4, 5) = 2¹·4, the tG scaling. U: 32 and 64 at r = 3 and 4, so 4. ⟨1⟩ at 3: 2 | True | none |
| `SameGenus` Checks | [1]/[17]; [1]/[9]; I₈/E₈ | 17 is not a unit square at 3, 5, 7, 11, 17 but is at 2 and 13; 9 fails only at 3. I₈/E₈ are separated at ℤ₂ by parity; over ℚ_p equal by Hilbert reciprocity | First is false | R03 |
| `SameGenus` API | det, parity | det H/det G = (det A)² is a positive rational unit at every p, hence 1 | True | none |
| `genusMass` Checks | [[4,1],[1,6]] genus; I₃ | full classes (1,1,6) with \|O\| = 4 and (2,±1,3) with \|O\| = 2: 3/4, against proper 3/2; I₃: 1/48 | True | none |
| `genusMass` API | even unimodular rank 8k | needs §3.1's one-genus theorem (line 559) | Forward reference | R04 |
| `evenUnimodularMass_eq` | n = 8, 16; n = 0, 4 (excluded) | M₈ = 1/696729600; M₁₆ = 691/277667181515243520000. n = 0: mass 1 vs `bernoulliFullMass 0` = 0. n = 4: empty class set, mass 0, vs `bernoulliFullMass 2` = (1/24)² = 1/576 | True; both hypotheses needed | none |
| `rank16_classNumber` | the reference pair | 1/970864271032320000 + 1/685597979049984000 = M₁₆ exactly | Exact | none |
| `rank24_classNumber` | 23 rows: Weyl order × Borcherds factor, plus Leech | the sum equals M₂₄ = 1027637932586061520960267/129477933340026851560636148613120000000 exactly. A₁²⁴ order 4107449023856640 (3.067 % of M₂₄); \|W(D₄)\| = 384 gives 0.99885·M₂₄; 24! for M₂₄ gives 0.96933·M₂₄ | Exact; Checks discriminate | none |
| rank-32 and rank-40 bounds | 2M₃₂, 2M₄₀ | 80618465.871 ∈ (80618465, 80618466); 8.786·10⁵¹ ∈ (8, 9)·10⁵¹ | True | none |
| §4.1 Weyl orders | D₄, E₆, E₇, E₈ | 2³·4! = 192; 72·720 = 51840 = 2·5·6·8·9·12; 126·2⁵·6! = 2903040 = 2·6·8·10·12·14·18; 240·2903040 = 696729600 | True | none |
| §4.1 walls | θ_E₆ = (1,2,2,3,2,1); θ_E₇ = (2,2,3,4,3,2,1) | pairings 2cᵢ − Σⱼ~ᵢ cⱼ are (0,1,0,0,0,0) and (1,0,0,0,0,0,0), so the stabilizers are A₅ and D₆. Wrong walls D₅, E₆ give 72·1920 = 138240 and 126·51840 = 6531840 | True | none |
| §4.2 rows and Leech | row census; Leech | 15 rows with a D or E component, 14 of them other than E₈³; D₄⁶ factor 2160 = 3·720; 2·\|Co₁\| = 8315553613086720000 | True | none |
| §3.2 | B₄, B₃₈, the recurrence at n = 2 | −1/30; 2929993913841559/6; 1 + 2(−1/2) = 0, versus 2 for B₁ = +1/2 | True | none |
| §1.3 binary Checks | A₂; [[4,1],[1,6]] | (2/π)·3√3·(1/36)·(3/2)·π/(3√3) = 1/12; (2/π)·23√23·(1/92)·(1/2)·3π/√23 = 3/4 | True | none |
| §1.2 | V₃, V₄; U at 2 | 4π·2π = 8π², half of it 4π²; 2π²·8π² = 16π⁴; reflection in (1,1) is [[0,−1],[−1,0]], with determinant −1 and norm 2 | True | none |
| §1.1 Checks | rotation block at 3; weights | det = 9/25 + 16/25 = 1 and 5 ∈ ℤ₃ˣ; 1/12 versus 1/6; O = SO of order 2 gives proper 1 versus full 1/2 | True | none |
| §0.0 and §0.2 Checks | diag(1,2), A = [[1,1],[0,1]]; C = diag(1,4), M = [[0,½],[2,0]] | AᵀGA = [[1,1],[1,3]], with full order 4 against determinant-one order 2; MCMᵀ = C, MᵀCM = diag(16,¼), M² = 1 | True | none |
| §0.1 and §0.1a Checks | x² + y²; reflections in e₁ and e₁ + e₂; 𝔽₂ forms | (3+4i)/5 has norm 1; spinor norm 1·2 = 2, a non-square; orders 2, 6, 6 and 10 at f = 4, 6 = 2(4−1); (1+ε)² = 1 | True | none |
| §1.4a, §1.4c Checks | A₂; [[4,1],[1,6]] and 2B; D = 5, 12, −3 with f = 2 | (2,−2,2) → (1,−1,1), Δ = −3 both ways; (4,2,6) → (2,1,3), Δ = −23, content 4 for 2B; η = ε² for D = 5; h⁺ = 2 for D = 12; h(−12) = 1·2·(3/2)/3 = 1 | True | none |

## Not verifiable

- **Conway–Sloane, *Low-dimensional lattices IV*, equations (2), (3), (6) and §9(iv).** The cached author scan is image-only, and this worker has no OCR. The formulas they locate were checked numerically against masses known independently: I₃, diag(1,1,2), A₃, E₈, A₂, the −23 genus, M₁₆ and M₂₄.
- **O'Meara 104:4–5.** Uncertified in the manifest, and settled.
- **Elaboration at main's pins.** The Lean commands this review may run use the branch pins. The citations valid only at `2fd255d`, and Suggested.lean's lemmas at main's Mathlib, were checked in the source text, not elaborated.

## Source issues

- none
