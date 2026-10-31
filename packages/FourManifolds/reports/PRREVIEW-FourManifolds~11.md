# Review of FourManifolds (pull request #936 at 46ee76a)
**Verdict:** accepted

Incremental re-review of the 35 lines added since `4f1f8a9`: one block in §4.3, “All-rank oriented determination in dimension four”, which makes the H¹(X;𝔽₂) action on the Postnikov lift fibres explicit, adds the rank ≥ 5 finite-to-stable branch and states the Dold–Whitney determination theorem under the no-2-torsion hypothesis on H⁴(X;ℤ). I recomputed every formula of the block on explicit bases (the table below); none is refuted, the block agrees with the existing §4.3 text and with the RP²×RP² example that follows it, the gate, the dependency check and the elaboration pass on my own runs, and `Suggested.lean` is byte-identical to the head the previous review read. Five P3 notes: twelve missing spaces in the new lines, a cited work absent from the References, suppliers the block calls “existing” without naming them, no Checks for the new formula, and the one P3 of the previous report, which this head does not repair.

## R01 (P3) — Twelve missing spaces in the new block

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2155` (“In rank3 it translates the difference coordinate by σ_w(x); in the rank4 half-spin coordinates”), and lines 2169, 2171, 2174–2177, 2181, 2184.

**Claim:** The new lines run words into numbers: “rank3” (2155, 2169, 2174), “rank4” (2155, 2175), “rank1”, “rank0” (2176), “Rank2” (2177), “by2” (2171), “with2-torsion” (2181), “Theorems1–2” and “printed671–674” (2184). The bytes are a plain letter followed by a digit (`od -c` on line 2155 shows `r a n k 3`), not a stripped non-breaking space, so the rendered text reads “rank3”. The rest of the README writes “rank 3”, “Rank 3's”, “rank 4's” (lines 2110–2111, 2187). (“dimension≤4” and “rank≥5” follow the README's existing “dimension≤7” style at line 2200 and are not counted.)

**Witness:** `grep -n -o 'rank[0-9]\|Rank[0-9]\|by2\|with2\|Theorems1\|printed671' README.md` returns the twelve tokens above, all between lines 2152 and 2186, and nothing elsewhere.

**Repair:** Insert the space in each: “rank 3”, “rank 4”, “rank 1”, “rank 0”, “Rank 2”, “by 2”, “with 2-torsion”, “Theorems 1–2”, “printed 671–674”.

## R02 (P3) — Dold–Whitney is cited inline but absent from the References

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2184` (“See Dold–Whitney, *Classification of Oriented Sphere Bundles Over a 4-Complex*, Theorems1–2 and the corollary, printed671–674.”) against `## References` (lines 3202–3267).

**Claim:** The References section lists every other work cited inline (its last paragraph begins “The remaining works cited inline are …”), with journal, volume and year; Dold–Whitney has no entry, and the inline citation carries no journal, volume or year, so a reader cannot identify the edition whose printed pages 671–674 are meant.

**Witness:** `grep -n -i 'dold\|whitney' README.md | grep -v 'Stiefel–Whitney'` returns line 2184 only. The paper is A. Dold and H. Whitney, *Classification of oriented sphere bundles over a 4-complex*, Ann. of Math. (2) 69 (1959), 667–677, DOI 10.2307/1970030; the cited printed range 671–674 lies inside it.

**Repair:** Add to the References paragraph “The remaining works cited inline are …”: “Dold–Whitney, *Classification of oriented sphere bundles over a 4-complex*, Ann. of Math. 69 (1959), 667–677”, and, at line 2184, write the citation in the README's usual form “(Dold–Whitney, Theorems 1–2 and the corollary, pp. 671–674)”.

## R03 (P3) — The block consumes “existing” results without naming their owners, and has no *Needs:* line

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2162` (“using the existing Stiefel connectivity and bundle classification”) and 2178–2179 (“Rank2 uses the existing Euler/complex-line classification”).

**Claim:** Neither result is stated elsewhere in this README (“Stiefel connectivity” occurs at line 2162 only; no other line classifies oriented rank-2 bundles by the Euler class), and the §4.3 *Needs:* line (2149–2150) precedes the block and lists TangentialBordism B4.1, AlgebraicTopology Stage 8, CharacteristicClasses C2–C3 and SpinGeometry G4–G6, none of which owns them. The owners exist and are earlier in the order, so this is a missing citation, not an unowned prerequisite: TopologicalKTheory T1 owns the finite Stiefel connectivity (CharacteristicClasses on main consumes it as “T1's Stiefel connectivity”, `CharacteristicClasses/README.md:492`, and TopologicalKTheory T1 states it at `TopologicalKTheory/README.md:504`); CharacteristicClasses C1.1b owns the oriented classification on BSO(n) with its finite-rank and stable inclusions (`CharacteristicClasses/README.md:300–310`); CharacteristicClasses C1.6 owns “complex-line isomorphism classes ≃ H²(X;ℤ)” on CW bases (`CharacteristicClasses/README.md:537–541`).

**Witness:** `grep -n 'Stiefel connectivity\|complex-line' README.md` returns 2162 and 2179 only; the three supplier lines above, at main `fa41b37`.

**Repair:** End the block (after line 2185) with “*Needs:* TopologicalKTheory T1's Stiefel connectivity; CharacteristicClasses C1.1b's oriented classification with its finite-rank and stable inclusions, and C1.6's complex-line classification; AlgebraicTopology Stage 8's Postnikov lifts; StringOrientation S1.3's dimension-≤7 BSpin classification for the w₂ = 0 branch.”, and replace “the existing Stiefel connectivity and bundle classification” and “the existing Euler/complex-line classification” by those names.

## R04 (P3) — The new formula σ_w has no Checks, and the block does not say why the stable fibre action vanishes

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2153–2157` (“make the preceding H¹ action explicit as `σ_w(x)=β(x)∪β(x)+β(x∪w)` … in the rank4 half-spin coordinates (a,b) it translates both coordinates by σ_w(x)”) and 2167–2168 (“absolute equivalence iff d=0”).

**Claim:** σ_w is a new definition (the explicit form of the fibre action) and the §4.3 **Checks** list (2140–2147) has nothing on it; the house rule asks for three discriminating Checks. The rank ≥ 5 sentence “absolute equivalence iff d=0” is true only because the stable fibre action is trivial (the stable Postnikov invariant is twice the rank-3 one), which the block never says; a reader who carries σ_w into the stable branch gets a false statement, since on RP⁴ with w₂ = 0 the class σ₀(a) = β(a)² is the generator of H⁴(RP⁴;ℤ) = ℤ/2 while the two stable lifts have different w₄. The three instances I computed (table rows 3, 4 and 6) separate the formula from its plausible wrong forms and record the stable negative control.

**Witness:** The Checks list at lines 2140–2147 has three bullets, on P(h), P(a+b) and the S⁴ half-spin classes; `grep -n 'σ_w' README.md` returns lines 2154–2157 only.

**Repair:** Add three Checks after line 2147: “On RP⁴ with w₂ = 0, σ₀(a) = β(a)² generates H⁴(RP⁴;ℤ) = ℤ/2, so the SU(2) bundles with c₂ = 0 and c₂ = β(a)² have isomorphic adjoints (twist by the flat line) and rank 3 has one class with w₂ = 0; dropping the β(x)² term would give two.” “On RP²×RP² with w₂ = 0, a² = b² = 0 and (a+b)² = 2ab = 0, so σ₀ vanishes on H¹ = (ℤ/2)² and the lifts 0 and ab give two non-isomorphic bundles with the same w₂ and p₁ = 0, the characteristic-invisible example below.” “In rank ≥ 5 over RP⁴ the lifts 0 and β(a)² have w₄ = 0 and a⁴, so the stable fibre action is trivial; applying σ₀ there would identify the trivial bundle with 4L.” And in the rank ≥ 5 paragraph say in one clause that the stable fibre action is trivial because the stable Postnikov invariant is twice the rank-3 one.

## R05 (P3) — Stray article at line 1530 (carried from the previous report)

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1530` (“using this section's the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;”).

**Claim:** The previous report's R01; the line is unchanged at this head.

**Witness:** `grep -n "this section's the normal-bundle" README.md` returns line 1530.

**Repair:** Write “using this section's normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;”.

## Previous findings

- R01 — not repaired: line 1530 still reads “using this section's the normal-bundle theorem for locally flat submanifolds of TOP four-manifolds;” (P3; written again as R05).

## Verified sound

:robot: Independent AI review, incremental: I read the diff (`changes.md`), the whole of §4.3 (lines 2096–2222) so that the block is checked against the existing lift actions, congruences, Checks and the RP²×RP² paragraph that follows it, the supplier table and the References, and the previous report; I re-ran the gate, the dependency check and the elaboration. I changed nothing in the pull-request worktree (`git status` clean before and after). The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Gate and build.** My run of the gate on this head ends `OK` with every scanner at 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material); the worker's run adds `build=0`. `lake env lean` on `TauCetiRoadmap/FourManifolds/Suggested.lean` succeeds in six seconds with exactly the six `declaration uses sorry` warnings at lines 68, 77, 96, 120, 134 and 143 and no other output. `Suggested.lean` has the same MD5 (`4b1217f1…`) at this head and at `4f1f8a9`, so the thirteen elaborated signatures in the worker's `signatures.md` are those checked in the previous rounds (its one “elaboration error”, line 159, is in the worker's `#check` scaffold, not in the 157-line file). The dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1416 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the diff adds no `*Needs:*` edge (the edge count differs from the previous round's 1418 because other roadmaps changed).

**The changed passage, step by step.** (1) Principles: the block plans no other roadmap's object (no roadmap on main or at the 434 open heads mentions Dold–Whitney or the oriented-bundle classification over 4-complexes: `roadmaps grep -i 'Dold.Whitney|sphere bundles over a 4'` returns this README's line 2184 only; StringOrientation S1.3 at its open head owns only the BSpin classification, which the w₂ = 0 branch consumes), no route shortcut (the hypothesis “2 injective on H⁴(X;ℤ)” is the theorem's, and the text says so), no copied passage, no algorithm, no Lean change. (2) Sources: the only locator is Dold–Whitney, printed 671–674, which I could not read legally (below); the bibliographic data (Ann. of Math. 69 (1959) 667–677) contain the cited range. (3) The eleven new table rows below. (4) Duplication: the block's rank ≥ 5 bijection restates no supplier statement; the Stiefel connectivity, the BSO(n) classification and the complex-line classification it uses are cited, not restated, once R03 names them. (5) Suppliers: all owners are on main (CharacteristicClasses, TopologicalKTheory, AlgebraicTopology) or earlier in the order (StringOrientation); no upward edge. (6) Shape: the block has no *Needs:* line and σ_w no Checks (R03, R04); the theorem's hypotheses (CW, dimension ≤ 4, multiplication by 2 injective on H⁴(X;ℤ), oriented bundles of equal rank) are in the sentence. (7) Headlines: unchanged; nothing added to or removed from `Suggested.lean`.

**Adversarial table.** Rows marked (new) were computed this round; rows marked (r10), (r9), (r8) and (r7) are carried unchanged from the previous report (which carried the earlier ones), on text this head does not touch. Notation: a ∈ H¹(RP⁴;𝔽₂) the generator, ℓ = β(a) ∈ H²(RP⁴;ℤ) = ℤ/2 with ℓ² the generator of H⁴(RP⁴;ℤ) = ℤ/2 and a⁴ = ρ₂(ℓ²); L the tautological real line, L_ℂ its complexification with c₁ = ℓ.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| σ_w(x) = β(x)∪β(x) + β(x∪w), rank 3, via the U(2) lift (new) | E a U(2) bundle with c₁ = c, ρ₂c = w; E ⊗ L_x | c₁(E⊗L_x) = c + 2ℓ = c; c₂(E⊗L_x) − c₂(E) = c∪ℓ + ℓ² = β(x∪w) + β(x)² (β(x∪ρ₂c) = β(x)∪c); p₁(ad E) = c² − 4c₂ unchanged since 4ℓ = 0 | pass: the lift coordinate shifts by exactly σ_w(x) and p₁ by −4σ_w(x) = 0 |
| σ_w from the cochain Pontryagin square (new) | w×1 + x×t on X×S¹, k = δ₄P | P(u+v) = P(u)+P(v)+j(u∪v); P(x×t) = j(x³×t) (cochain c∪c + c∪₁dc with τ∪₁τ = τ, τ² = 0); τ-component of δ₄P = β(x∪w) + β(x³) = β(x∪w) + β(x)² | pass: the formula is the loop of the rank-3 Postnikov invariant |
| Rank 3 over RP⁴, w₂ = 0 (new) | lifts H⁴ = {0, ℓ²}; x = a | σ₀(a) = ℓ² ≠ 0; the SU(2) bundles with c₂ = 0 and c₂ = ℓ² (= c₂(L_ℂ⊕L_ℂ)) have ad(E⊗L) = ad E; one SO(3) class, p₁ = 0 for both | pass; dropping β(x)² would predict two classes |
| Rank 3 over RP²×RP², w₂ = 0 (new) | H¹ = ⟨x₁,x₂⟩, β(x₁) = a, β(x₂) = b | a² = 0, b² = 0, (a+b)² = 2ab = 0, so σ₀ ≡ 0; lifts 0 and ab give two classes with (w₂,p₁) = (0,0) | pass: this is the characteristic-invisible example of the next paragraph; the roadmap agrees with itself |
| Rank 4 diagonal action in half-spin coordinates (new) | RP⁴, w₂ = 0; F = L_ℂ⊕L_ℂ (c₂ = ℓ²), ε the trivial SU(2) bundle | V(F,F) = L²⊗V(ε,ε) trivial, so (ℓ²,ℓ²) ~ (0,0); V(F,ε) = 4L at (ℓ²,0): e(4L) = c₂(2L_ℂ) = ℓ² ≠ 0, p₁(4L) = −6ℓ² = 0; orbits {(0,0),(1,1)} and {(1,0),(0,1)} separated by e | pass; a one-coordinate action would merge 4L with the trivial bundle, contradicting e |
| Rank ≥ 5: Δp₁ = −2d, Δw₄ = ρ₂d, absolute equivalence iff d = 0 (new) | RP⁴, w₂ = 0, lifts 0 (trivial) and ℓ² (4L stably) | w(4L) = (1+a)⁴ = 1 + a⁴: Δw₄ = a⁴ = ρ₂(ℓ²); Δp₁ = 0 = −2ℓ²; the lifts are non-isomorphic (w₄), so the stable fibre action is trivial and “iff d = 0” holds; σ₀(a) = ℓ² would wrongly identify them | pass; the block restricts σ_w to ranks 3 and 4 (R04 asks it to say why) |
| Rank ≥ 5 against StringOrientation S1.3 (new) | w₂ = 0 branch | λ_*:[X,BSpin]→H⁴(X;ℤ) bijective for dim X ≤ 7 (S1.3 at #948); 2Δλ = Δp₁ = −2d gives Δλ = −d, so bijectivity is “iff d = 0” | pass; consistent supplier |
| ρ₄p₁ = P(w₂) + j(w₄), j(1) = 2 (new) | TCP²; quaternionic Hopf line on S⁴ | CP²: ρ₄p₁ = 3, P(w₂) = ρ₄(h²) = 1, j(w₄) = j(ρ₂3h²) = 2, 1+2 = 3 ✓, the sign variant −ρ₄p₁ = 1 ≠ 3 ✗; S⁴: p₁ = −2u, w₄ = u mod 2, w₂ = 0: ρ₄(−2) = 2 = 0+2 ✓; rank-4 congruence ρ₄(p₁+2e) = P(w₂) agrees since w₄ = ρ₂e and 4e ≡ 0 | pass |
| Determination under 2 injective on H⁴(X;ℤ) (new) | ranks 3, 4, ≥ 5; RP²×RP² as negative control | rank 4: Δp₁ = −2(Δa+Δb) = 0 ⇒ Δa = −Δb, Δe = Δb−Δa = 2Δb = 0 ⇒ Δa = Δb = 0; rank 3: 4Δa = 0 ⇒ Δa = 0; rank ≥ 5: 2d = 0 ⇒ d = 0; RP²×RP² (2-torsion) has two bundles with equal classes | pass; hypothesis used exactly where needed |
| Stiefel range for the finite-to-stable bijection (new) | n = 5, 4; dim X = 4 | V_{n+k,k} is (n−1)-connected, so BSO(n)→BSO is n-connected and [X,BSO(n)]→[X,BSO] bijective for dim X ≤ n−1: n ≥ 5 ✓; n = 4: [S⁴,BSO(4)] = ℤ² → ℤ, (a,b) ↦ −2(a+b), kernel contains (−u,u) = TS⁴ with e = 2u ≠ 0 | pass; “n ≥ 5” is sharp |
| Ranks 0, 1, 2 (new) | rank 0 with signs ±1; rank 1; rank 2 | rank 0: e = ε ∈ H⁰(X;ℤ), all w_i = 0 and p = 0 for both signs, so the degree-0 Euler datum is needed (CharacteristicClasses main lines 33–35 keep the same sign convention, BSO(0) = pt); rank 1: oriented line bundles are oriented-trivial, e ∈ H¹(X;ℤ) = 0; rank 2: complex lines ≃ H²(X;ℤ) with e = c₁ (CharacteristicClasses C1.6, main line 537–541) | pass |
| §3.4 map transversality, Marin gap (r10) | domain 4, codimension 3, 4, 5 | expected preimage 1, 0, −1, never 4; ambient ≠ 4 at line 1490 | pass |
| §3.4 Check 1, linear control (r9) | a=0, b=t/2, c=2t, d=s | step/r_n = 1/64; 3/64 = 0.046875 < (63/64)²/20 = 0.048450; worst ratio 0.0284 | pass |
| §3.4 Check 2, trivial control (r9) | a=0, b=c=id, d≡1, R=1, r_0=1/2 | r_1..r_3 = 7/16, 3/8, 5/16; r_59 = 3.4·10⁻⁸; lhs 0 < 1 | pass |
| §3.4 Check 3, fibrewise infimum (r9) | tube W, g=1+x−y | m(1/2)=0.5, m(1/2±10⁻⁴)=1.5∓10⁻⁴; lsc, not continuous | pass |
| §3.4 `*Needs:*` names (r9) | pin 6b7abb3c | `StrictMono.orderIsoOfSurjective` at `Mathlib/Order/Hom/Set.lean:151`; `IsCompact.exists_isMinOn` at `Mathlib/Topology/Order/Compact.lean:228` | pass |
| §3.4 locator pp. 147–149 (r9) | `freedmanquinn` | Theorem 9.7 line 4989; p. 147 marker 5069, p. 148 5111, p. 149 5147; estimates 5152–5160 | pass |
| Expanded Freedman–Quinn locators (r9) | `freedmanquinn` | 7.7.1 line 3995, 7.7.2 4008, §8.5 4194, 8.15 4495, 8.17 4640, 8.19 4652, 8.19.2 4727, 9.6 4983, 9.8 5391, 9.12.3 5869 | pass |
| References added (r9) | lines 3227–3231 vs 387–396 | Moise GTM 47 (1977); Munkres Ann. of Math. 72 (1960); Whitehead Ann. of Math. 73 (1961) | pass |
| §3.5 consumption sentence (r9) | line 1830 | cites §3.4; ε(r)<r/10 at 1834 | pass |
| §3.4 radial lemma, trivial control (r8) | a=0, b=c=id, d≡1, R=1 | r_0..r_3 = 0.5, 0.4375, 0.375, 0.3125; η=0.225 | pass |
| §3.4 radial lemma, linear control (r8) | a=0, b=t/2, c=2t, d=s | identity 1.5t vs t fails; worst ratio 0.0285 | pass |
| §3.4 radial lemma, quadratic control (r8) | a=√t, b=t/2, c=2t, d=s² | identity 4.19·10⁻² vs 3.09·10⁻⁶ fails; η=3.5·10⁻³, worst 0.238 | pass |
| §3.4 radial lemma, flat control (r8) | d=e^{−1/s} | η=1.76·10⁻³, worst 0.310 | pass |
| §3.4 radial lemma, non-monotone d (r8) | d=s(2+sin(1/s)) | η=0.075, worst 0.053 | pass |
| §3.4 three-step bound (r8) | n ≥ 1 | r_{n+1} ≥ 3r_n/4; sum ≤ 3d/16 < d | pass |
| §3.4 cofinality (r8) | r_n ↓ r_∞ > 0 | step ≥ min(r_∞/4, min d/16) > 0; r_59 = 3.4·10⁻⁸ (d≡1), 0.197 (d=s) | pass |
| §3.4 fibrewise infimum (r8) | W, g=1+x−y | 0.5 vs 1.5 | pass |
| §3.5 extension over the zero section (r8) | ε(r)=r/10 | inverse moves s within [s/1.1, s/0.9] | pass |
| §3.5 point case (r8) | N = point | a ≡ 0 allowed; strictness from d > 0 | pass |
| Conventions: signed signature (r7) | S²×S²; −CP² | 0; −1 | pass |
| Conventions: torsion quotient (r7) | S⁴; Enriques | determinant 1; 2t=0 pairs to 0 | pass |
| §1.1 CP² ring, product (r7) | line; S²×S² | h²[CP²]=1; det −1 | pass |
| §1.2 twisted bundle (r7) | H=S+F, E=S | S²=−1, F²=0, S·F=1; diag(1,−1) | pass |
| §1.3 sums (r7) | CP²#−CP²; CP²#CP²; M#S⁴ | σ=0, χ=4; σ=2; Δχ=0 | pass |
| §1.4 matrices (r7) | 0-, +1-unknot; Hopf | [0], [1]; det −1 | pass |
| §1.4 slide (r7) | diag(0,1), two P | PᵀQP det 0 | pass |
| §1.4 blow-up (r7) | empty link + +1-unknot | H₂: 0 → ℤ with [1] | pass |
| §1.4 Arf definition (r7) | Hopf annulus; T(2,4) | radical dim 1; q=0 on ⟨e₁+e₃⟩ | pass |
| §1.4 Levine congruence (r7) | six knots; 588 matrices | Δ(−1) ≡ 1,5,5,1,5,1 mod 8; 0 failures | pass |
| §1.4 pinned normalization (r7) | `alexander` | T^(−g)·det(T·V−Vᵀ); Δ(1)=1 | pass |
| §1.4 T(2,4) (r7) | V 3×3 | det(V+Vᵀ)=−4; Arf 1; Jones at e^{iπ/4}: √2 | pass |
| §1.4 reversal (r7) | one component reversed | annulus [±2], Arf 0 | pass |
| §1.4 smooth slice-disc proof (r7) | genus g; trefoil | kernel dim g; trefoil Arf 1 | pass |
| §1.4 Spin comparison (r7) | unknot core | q=0=V(x,x) mod 2 | pass |
| gap:finite-quadratic-arf (r7) | hyperbolic; anisotropic; m=0 | Gauss sums 2, −2, 1 | pass |
| gap:three-manifold-smoothing (r7) | S³; D³; C=∂ | relative form agrees near C | pass |
| gap:alexander-module-presentation vs MorseNovikov N6 (r7) | zero surgery vs exterior | H₁ of covers agree | pass |
| §1.5 boundary (r7) | [0]; [2]; [1] | ker, coker: ℤ,ℤ; 0,ℤ/2; 0,0 | pass |
| §1.6 E₈ (r7) | Cartan matrix | minors 2,3,4,5,6,7,8,1 | pass |
| §2.1–2.2 (r7) | r=0,1,2; Q | π₃ ranks 0,1,3; QC=I | pass |
| §2.4 isotropic splitting (r7) | H; diag(1,−1); diag(1,−2) | x²=2y² has no nonzero solution | pass |
| §3.1 order (r7) | §1.4 → §3.6 | no Layer 3 item in §1.4's Needs | pass |
| §3.2 λ(f,f) (r7) | one ± double point | µ=±1, λ=±2 | pass |
| §3.2 FQ 2.9.1; KQ (r7) | locators | `freedmanquinn` 1496; `krushkalquinn` 60–61 | pass |
| §3.3 controls (r7) | 1/4 vs 1/2, 1/8, 1/4 | pass, fail, fail | pass |
| §3.4 Theorems 7.5–7.6 (r7) | locators | `freedmanquinn` 3854, 3906 | pass |
| §3.4 coefficients (r7) | 1, ℤ | Wh 0; K̃₀ 0; L₅(ℤ)=0, L₅(ℤ[ℤ])=ℤ | pass |
| §3.5 8.2, 9.6, §9.12, §7.8 (r7) | locators | `freedmanquinn` 4064, 4983, 5879–5887, 4041–4043 | pass |
| §3.6 surgery sequence, 11.11, Crowell (r7) | locators | `freedmanquinn` 7469; 7884–7887; 7925–7930 | pass |
| §3.6 Ω₃^Spin(S¹) (r7) | suspension | ℤ/2 | pass |
| §3.6 topologically slice Arf (r7) | F̂ locally flat | kernel dim g | pass |
| §3.7 realization (r7) | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0 | pass |
| §4.2 formula (r7) | CP²; E₈; 2E₈ | 0; 1; 0 | pass |
| §4.2 even implies Spin (r7) | H₁ without 2-torsion; Enriques | Ext=0; w₂≠0 | pass |
| §4.3 Pontryagin square (r7) | CP²; S²×S² | 1; 2 with j(1)=2 | pass |
| §4.3 Dold–Whitney congruences and lift actions (r7, r4) | rank 3; rank 4 | ρ₄p₁=P(w₂); ρ₄(p₁+2e)=P(w₂); action −4a; −2(a+b), b−a | pass |
| §5 energy, scaling (r7) | S⁴; λ²g | 8π²k+2‖F⁺‖²; λ^{n−4} | pass |
| §5.1 index (r7) | S⁴; S²×S²; Q₈ | −3; −6; −6 | pass |
| §5.1 Kuranishi (r7) | FL §3.1 | `feehanleness` 666–668 | pass |
| §5.2 budget and names (r7) | N=5, s=3 | q=6, ℓ≥10 | pass |
| §5.3 gluing, Donaldson (r7) | Q=−I_r | σ+r=0 | pass |
| §6.1 blowup (r7) | CP²; nine times | (4,0); (12,−8) | pass |
| §6.3 SL₂ (r7) | A,B,S | (AB)³=−I | pass |
| §7.1 indices (r7) | K3; reversed | 2, 1; −2, −1 | pass |
| §7.2 E(n) (r7) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34) | pass |
| §7.3 Enriques Check (r7) | v=(i,√3,i√3,1,0,0) | quadrics 0; minor −48 | pass |
| §8.1 nonrecognition (r7) | Tancer; GS 1.2.33 | `tancer` 73–76; `gompfstipsicz` 838 | pass |
| §8.2 bound, KS (r7) | [1]; ±1 unknot | v²≤1; KS=0 | pass |
| §8.3 headline (r7) | standard ℝ⁴ | `Diffeomorph.refl` refutes the wrong instance | pass |
| gap:top-manifold-cw-type (r7) | Milnor 1959 | `milnor1959` 20, 37 | pass |
| gap:brown-schoenflies (r7) | Brown 1960 | `brown1960` 84, 101–103 | pass |

Eleven new rows, one carried from the r10 report, eight from r9, eleven from r8 and fifty-three from the full review. No instance refuted a stated theorem, formula or Check; the new block is consistent with the existing §4.3 lift actions (−4a; −2(a+b), b−a), with its congruences, and with the RP²×RP² paragraph that follows it.

**Pinned declarations.** None newly needed: the diff names no library declaration and `Suggested.lean` is unchanged. The declarations opened in the previous rounds (`StrictMono.orderIsoOfSurjective`, `IsCompact.exists_isMinOn`, `TauCeti.AnnulusConjecture`, `TauCeti.FreedmanSliceTheorem`, `Diffeomorph`, `Projectivization`) are unchanged at the pin.

**Cross-roadmap citations.** The diff adds no explicit citation; the worker's `citations.md` reports nothing unresolved against main (`fa41b37`) and the 434 open heads. The results the block calls “existing” resolve at main `fa41b37`: TopologicalKTheory T1's finite Stiefel connectivity (`TopologicalKTheory/README.md:504`, consumed by `CharacteristicClasses/README.md:492`), CharacteristicClasses C1.1b's oriented classification with finite-rank and stable inclusions (`CharacteristicClasses/README.md:300–310`) and C1.6's complex-line classification (`CharacteristicClasses/README.md:537–541`); CharacteristicClasses' rank-0 convention (lines 33–35) matches the block's. StringOrientation S1.3's dimension-≤7 BSpin classification, which the w₂ = 0 branch of the rank ≥ 5 statement must agree with, is at its open head #948 (read through `roadmaps show`, as the `rev/948` checkout named in the brief is absent on this worker); it is earlier in the merge order.

**Ownership against open work.** `roadmaps grep -i 'Dold.Whitney|sphere bundles over a 4'` over main and the 434 open heads matches only this README; StringOrientation S1 owns the stable Spin case only and is consumed, not restated. The board's packages index lists no competing package.

**Declared gaps.** Unchanged (the fifteen `gap:` slugs under “What GeometricTopology must provide”); the diff touches none. No `design/plan.json` is readable for this pull request.

## Not verifiable

- Dold–Whitney, *Classification of oriented sphere bundles over a 4-complex*, Ann. of Math. 69 (1959), 667–677 (DOI 10.2307/1970030): JSTOR only; the sources service found no legal copy (its record is in the job's `needs-references.toml`, where the service truncated the authors to “Dold”; the work has two authors). The theorem numbers and the printed range 671–674 are cited by locator alone; the range lies inside the paper's pages, and the statements the block attributes to it were checked directly (the table) rather than against the text.
- No `design/plan.json` is readable, so the gap slugs could not be cross-checked against a plan.
- The items of the previous reports' lists (Gompf JDG 18 Theorem 1.2; Quinn, *Ends of maps I*; Moise, Munkres, Whitehead; Lickorish, Rolfsen, Robertello, Freedman–Kirby, Kirby LNM 1374; Gompf–Stipsicz beyond p. 36; Marin; the image-only scans and landing pages) concern text this head does not change and stand as recorded there.

## Source issues

- none
