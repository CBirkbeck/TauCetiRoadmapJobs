# Review of EllipticModularityEffectiveComparisons (pull request #1810 at 3e1809c)

**Verdict:** rejected

This is an incremental re-review of the 9 lines changed since 951c22c (5 insertions, 4 deletions, all in `README.md`). `Suggested.lean` is byte-identical to 951c22c and to 2a7d458. The change repairs the previous R02. The supplier contract (line 86), the Scope paragraph (line 9) and the §5.4a *Needs:* line (line 1322) now credit AnabelianGeometryAndNonabelianChabauty §1.7 with what it actually states: functoriality for maps of pointed pairs and the pointed Abel map. §5.4a (line 1298) now proves the w_p action from the divisor description, and a new negative-control Check at p=23 (line 1313) shows why the contract cannot supply that action. The repair introduces no new problem.

The previous R01 still stands. It cannot be repaired inside this folder, and it is raised again below. The sibling pull request EllipticCurveModularityPartII is still open and still earlier in the merge order. Its consumers still import from it, and since the last review ErdosProgressionPowers has added a seventh contract item (EC.6). That item is the geometric-torsion carrier this folder's `Suggested.lean` also declares. The gate passes with the targeted build, the dependency check shows 0 problems, and elaboration gives exactly the 14 `sorry` warnings.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap pull request earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~4).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5. Line 1696 states the problem itself: "ErdosProgressionPowers cites EllipticCurveModularityPartII, which plans the same six results under its own layer numbering, as the supplier of EC.0–EC.5." Also `Suggested.lean` lines 49–135 and 149–265.

**Claim.** Layers 0–5 own the following results:
- Martin's newspace formula and sharp bound;
- the removed-prime exponent bound;
- Kraus's thresholds and realizations;
- the Mazur–Kenku classifications and the two uniform irreducibility bounds;
- Lemos's surjectivity theorem.

`Suggested.lean` also declares the geometric-torsion carrier `GeometricTorsion`, with `torsionModule` and `torsionRepresentation`.

**Witness.**
- `roadmaps list` shows #1491 EllipticCurveModularityPartII open at head 95f7c2f.
- The merge order lists it at line 194, ErdosProgressionPowers at 195 and this folder at 284.
- The sibling's README line 7 says "this Part II owns the six comparison layers below".
- ErdosProgressionPowers (head 4b475b9), line 80, says "owned by EllipticCurveModularityPartII Layers 1–6; the contract EC.0–EC.6".

**Why the settled reason fails.** H01 accepts that the duplication holds and says the choice "remains the review's". A review cannot close a pull request or re-point another roadmap's citations, so that reason resolves nothing; the defect stands under the binding rule that what another roadmap plans is imported, never planned again. Meanwhile the overlap has grown, as checked at the current heads:
- **The sibling still owns the layers.** At 95f7c2f (one commit after 51b297d, touching only supplier contracts of its Cartier route), its Layers 1–6 (README lines 168–631) carry these headlines under other names in its `Suggested.lean`:
  - `dimension_comparison`, `martin_bound`;
  - `prime_isogeny_degrees`, `cyclic_isogeny_degrees`;
  - `full_two_irreducible`, `rational_two_irreducible`;
  - `nonsplit_of_not_surjective`, `lemos_integral_j`, `lemos_surjectivity`.
- **ErdosProgressionPowers now consumes more of the sibling.** At 4b475b9 its contract table (lines 646–657) adds EC.6, the sibling's §5.1 `GeometricTorsion` carrier and full-two-torsion predicate. This folder's `Suggested.lean` line 149 declares the same carrier, so the double ownership now reaches a Lean carrier that a consumer names.
- **Line 1696 is stale.** It still says EC.0–EC.5.
- **Every consumer cites the sibling.** AdelicImagesAndModularCurves (line 343), EllipticCurvePeriodsAndModularParametrizations (line 92) and FaltingsFinitenessAndIsogenyTheoremsPartII (lines 13, 132, 364) cite the sibling. `roadmaps grep` finds this folder's name only in prose lists: ModularSymbolsPadicLFunctions line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928 and the sibling's line 1058.

**Repair.** No repair is possible inside this folder; a human has to decide between two options.
- **Close #1810.** The consumers and the merge order already point at #1491.
- **Close #1491 and keep this folder.** Then:
  - re-point the sibling's consumers to this folder's sections;
  - move this folder before ErdosProgressionPowers. Its last supplier, AnabelianGeometryAndNonabelianChabauty, is at line 172, so the move is possible;
  - rewrite line 1696 against the consumers' current contract, EC.0–EC.6;
  - give an owner to the sibling's §6.0f, which FaltingsFinitenessAndIsogenyTheoremsPartII also cites.

## Previous findings

- R01 — not repaired: line 1696 is unchanged ("ErdosProgressionPowers cites EllipticCurveModularityPartII, which plans the same six results under its own layer numbering, as the supplier of EC.0–EC.5"). #1491 is open at 95f7c2f, the merge order is 194 against 284, and the consumers are unchanged. Raised again above.
- R02 — repaired: line 86 now reads "functoriality for maps of pointed pairs, extension of the ground field, and, for a specified point b of C−D over k, the pointed Abel map". Line 1298 now reads "prove that, as for T_n, it carries divisors prime to D to divisors prime to D".

## Verified sound

**Gate, dependency check, build.**
- **Gate.** I reran it with `--build` against the board's merge order. It printed `OK` with exit 0: all scanners 0, `depcheck=0`, `outside-folder=0`, `build=0`. This matches the worker's gate at 3e1809c.
- **Dependency check.** With `--movable` against the board's order and the content checkout:

      depcheck: 243 roadmaps, 2456 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The change adds no supplier: the AnabelianGeometryAndNonabelianChabauty edge (line 284 → 172) already existed.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` reports exactly 14 `declaration uses sorry` warnings, at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265, and nothing else.
- **Pins.** Mathlib f6090c70 and Tau Ceti 358314d4, from the manifest.
- **Signatures and padding probe.** `git diff 2a7d4581 HEAD` on `Suggested.lean` is empty. So the earlier `#check @name` elaboration of all 24 declarations and the earlier one-tactic probe were run on these exact bytes (PRREVIEW~3, "Elaborated signatures" and "Padding probe"). In that elaboration every type equals its README statement and no section binder is lost; the file has no `variable` lines. In the probe, nothing closed: 14 errors. The worker's `signatures.md` again lists 24 declarations with 0 dropped binders. No headline was added or removed.

**The changed citation, resolved at the supplier's open head.** AnabelianGeometryAndNonabelianChabauty is #1021 at 227f000, merge order line 172.
- `### 1.7 Fields and the projective line` is at README line 3987.
- `#### Generalized Jacobian of a reduced boundary` is at 4003. Its text at 4005 states "functoriality for maps of pointed pairs and extension of the ground field". For a specified b ∈ (C−D)(k) it also constructs the pointed Abel map `a_b:C−D→J_D`, sending x to the rigidified class of x−b. It builds the sheaf from divisors prime to D modulo functions equal to 1 along D.
- Its Check at 4012 ("the Abel map with b=1 is z↦z") is the one that the README Check at line 1311 pins its toric coordinate against.

The new contract (line 86), the Scope paragraph (line 9) and the *Needs:* line (line 1322) now claim exactly this and nothing more.

**The Abel map against the source.** bilu-parent-rebolledo lines 761–763 define φ_P as the composite of the Albanese map Y₀(p)→J₀(p)♯, Q ↦ [(Q)−(x₁)], with the projection to J♯_e. That is the supplier's `a_b` with b=x₁ after base change to K, as line 86 says. The hypothesis b ∈ (C−D)(K) holds because x ∈ Y₀(p²)(K), and both w_(p²) and π_p preserve the noncuspidal locus.

**The new Check, against a source.** banwait-najman-padurariu Table 1.1 (lines 63–70, p.2) lists ν=2 noncuspidal rational points at N=17 and has no entry at 23. Theorem 1.1 (line 72) says the table is complete. This confirms both "X₀(23)(ℚ) consists of the two cusps" and "the two noncuspidal rational points" of X₀(17).

**Ownership against open work.** I checked this with the sibling checkouts and `roadmaps grep` over main and the 476 open heads.
- "Pointed Abel map" occurs only in the supplier (line 4005), JacobianChallengePartII (relative Jacobians, lines 325 and 380), RelativeJacobiansAndIntegralCurveModels and this folder. The README imports the object; nothing here constructs it.
- "J₀(p)♯" occurs only in this folder.
- The sibling at 95f7c2f still has 0 occurrences of "generalized Jacobian", "J₀(p)♯", "Heegner–Gross" or "AnabelianGeometry", so §5.4a has no second owner.
- The overlap scan lists no open pull request that changes this roadmap and no dropped id in either direction. Its closest roadmap is #1491, which is R01.

**Declared gaps.** The diff adds or changes no `gap:` token. The eight slugs under `## Exact supplier contracts` are unchanged and equal the plan's `gaps`.

**Sampled locators.** None of this round's 15 seeded targets falls in a changed passage. I still read five of them at their locators in the cached texts:
- **§0.10.** martin-2003 lines 787–790, page 15. The proof of Lemma 19 settles N > 1521 by the inequality and N ≤ 1521 by direct calculation, which finds equality only at N=35.
- **§2.3.** kraus-1997 line 279, equation (9), PDF page 6 = p.1144. H(n) is the maximum of F(n) and G(n); the OCR renders "=" as "≥" here, as it does for g(n) at line 264.
- **§3.17.** kraus-1997 lines 284–293, Théorème 4, p.1144. It assumes the hypotheses of Théorème 3 plus all 2-torsion rational, and p > H(N(ρ̄)). It gives a modular E₀ of conductor N(ρ̄), with all 2-torsion rational and isomorphic p-torsion Galois modules.
- **§4.15.** banwait-najman-padurariu lines 56–59, p.2. Kenku showed that X₀(N)(ℚ) consists of cusps for N = 39, 65, 91, 125, 169.
- **§5.19.** lemos-2017 lines 231–241, page 6. The five f(t) are exactly the README's polynomials.

The other sampled targets were verified or computed in PRREVIEW~3: §§1.3, 3.7, 3.7a, 3.10, 5.1, 5.3a, 5.3b, 5.25a, and §0.12 as part of §§0.12–0.14. They are carried below.

**Adversarial pass.** Rows for the changed statements carry values computed in this review. The untouched statements carry the rows of PRREVIEW~3 ("Adversarial pass") and PRREVIEW~4. The diff leaves their text and every Lean statement unchanged.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Contract line 86: functoriality for maps of pointed pairs, and the pointed Abel map | supplier line 4005; (ℙ¹,(0)+(∞)), b=1 | Supplier: "maps of pointed pairs", `a_b(x)` = class of x−b. README: the same two clauses. On ℙ¹: f=(z−x)/(z−1) has f(0)=(−x)/(−1)=x and f(∞)=1, so the coordinate is x = a₁(x) | sound | none |
| Contract line 86: w_p is not a map of pointed pairs over ℚ in general | p=23; p=17 | 23 ∉ {2,3,5,7,11,13,17,19,37,43,67,163}, so Y₀(23)(ℚ)=∅ and no b exists. At p=17, the fixed points of w₁₇ have CM by ℤ[√−17]: discriminant −68, reduced forms (1,0,17), (2,2,9), (3,±2,6), so h=4 and none is rational. So w₁₇ swaps the two noncuspidal rational points (j=−17²·101³/2 and −17·373³/2¹⁷) and maps (X₀(17),D,b) to (X₀(17),D,w₁₇b) | sound | none |
| Contract and *Needs:* line 1322: the Abel map over K with b=x₁ | BPR lines 761–763; x₂ | BPR: Q ↦ [(Q)−(x₁)], which equals `a_(x₁)`. a_(x₁)(x₁)=0 and a_(x₁)(x₂)=[(x₂)−(x₁)], the z of line 1304 | sound | none |
| "Hecke correspondences are not maps of curves" | T₂ on X₀(23) | T₂ sends a point to ℓ+1=3 points, so it is a degree-3 correspondence, not a morphism | sound | none |
| Line 1298: w_p acts through divisors | f(0)=2 and f(∞)=1; f≡1 on D | (f∘w_p)(0)=f(∞)=1 and (f∘w_p)(∞)=f(0)=2, so the coordinate goes from 2 to 1/2. For f≡1 on D, (f∘w_p)(0)=(f∘w_p)(∞)=1. w_p({0,∞})={∞,0}, so the support stays prime to D. No base point is used | sound | none |
| Line 1298: w_p=−T_p on the torus (wording next to the edit) | p=23 | T₂₃(0)=(0)+22(∞) and T₂₃(∞)=23(∞): the coefficients of (0) are 1 and 0, so T₂₃ acts by exponent 1. w₂₃ acts by −1 = −(1) | sound | none |
| New Check line 1313: genus and dimension at p=23 | ν₂, ν₃, ν∞; §0.8 | 23≡3 mod 4 gives ν₂=0, and 23≡2 mod 3 gives ν₃=0. g=1+24/12−0−0−2/2=2. dim J₀(23)♯=g+r−1=3. 12g=24=23+1, the §0.8 equality at primes ≡11 mod 12 | sound | none |
| Scope line 9: "its pointed Abel map" | supplier line 4005 | the supplier constructs `a_b` only for a specified b; §5.4a uses b=x₁ | sound | none |
| Line 1696 (Downstream consumers) | sibling lines 7 and 1058 at 95f7c2f; ErdosProgressionPowers lines 80 and 646–657 at 4b475b9; merge order 194/195/284 | all name EllipticCurveModularityPartII as the owner. The consumer's contract is now EC.0–EC.6, with EC.6 equal to the `GeometricTorsion` carrier of `Suggested.lean` line 149 | R01 | none in-folder |
| §0.10 (sampled) | composite 1<N≤1521 with ω≤2 | equality only at N=35, no violation (PRREVIEW~3) | sound | none |
| §§0.12–0.14 (sampled) | all N≤4000 in each hypothesis class | 0 violations of N−9 and N (PRREVIEW~3) | sound | none |
| §0.16 `martin_sharp_bound` | every N≤4000 | 12g≤N+1 everywhere; the equality set (140 levels) is exactly {35} ∪ {primes ≡11 mod 12} (PRREVIEW~3) | sound | none |
| §§1.2–1.3 (sampled) | K=ℚ(√2): c=√2; c=100−70√2 | Norm(3−√2)=7 ≤ (√2+1)⁴≈33.97; the second c has conjugate ≈198.995 and \|Norm\|=391>33.97 (PRREVIEW~3) | sound | none |
| §2.3 `krausH` (sampled) | N=1, 4, 11 | max(1,4)=4; 4; 3+2√2 < 13+4√3 (PRREVIEW~3) | sound | none |
| §3.7 filters (sampled) | (2,0,3), (2,2,0), (3,1,−1), (3,2,0) | (1−3X+2X²,1); (1,1); (1,1−5X); (1,1−4X+3X²) (PRREVIEW~3) | sound | none |
| §3.7a `integral_ideal_sturm` (sampled) | weight 0, J=0, constant form 1 | n=0 is inside the bound and a₀=1 ∉ 0, so the hypothesis fails (PRREVIEW~3) | sound | none |
| §3.10 `kraus_prime_power_congruence` (sampled) | Prop 2, lines 1082–1093 | hypotheses at q∤2N and at q∣2N with q²∤4N, for q≤μ(M)/6 with M=lcm(4,N); the conclusion at every q∤2N; the Lean matches (PRREVIEW~3) | sound | none |
| §3.17 (sampled) | Théorème 4, lines 284–293 | Théorème 3 hypotheses plus full rational 2-torsion and p>H give E₀ of conductor N(ρ̄) with full 2-torsion (re-read above) | sound | none |
| §4.7 `prime_cyclic_isogeny_degrees` | genus-zero levels | genus 0 exactly at {1,…,10,12,13,16,18,25}, giving prime degrees {2,3,5,7,13}; Theorem 7.1 adds {11,17,19,37,43,67,163} (PRREVIEW~3) | sound | none |
| §§4.10–4.15 (sampled 4.15) | genera of 39, 65, 91, 125, 169 | 3, 5, 7, 8, 8, so each has a nonzero new quotient; BNP lines 56–59 (PRREVIEW~3, re-read above) | sound | none |
| §§4.17, 4.21, 4.22 | n=20,22,24,26,28; ℓ=11; ℓ=5,7,3 | all absent; 22 absent; 20 and 28 absent. At ℓ=3, y²=x(x+5)(x+32) has P=(4,36) of order 3 (PRREVIEW~3) | sound | none |
| §5.1 (sampled) | r=19, 43, 67, 163 | −96³=−884736, −960³, −5280³, −640320³; genera of X₀(r) 1, 3, 5, 13 (PRREVIEW~3) | sound | none |
| §5.3a (sampled) | d=1, h≤985; 10⁷+i on y²=x³−x | 10⁷·985²=9 702 250 000 000; degree 10¹⁴+1 > 3.912·10¹³, so the cyclic bound fails on the CM curve (PRREVIEW~3) | sound | none |
| §5.3b (sampled) | p=11, 13, 17 | Theorem 6.1 covers 11 and p≥17, not 13 (PRREVIEW~3) | sound | none |
| §§5.7, 5.8, 5.18, 5.28 | p=11, 13, 17; Lemos Thm 2.3; Prop 2.1; n=1 | the hypotheses p>11 with p≠13, p>37 and 1<n match BPR Thm 1.1 and Lemos Thms 1.1, 1.4 and 2.3 (PRREVIEW~3) | sound | none |
| §§5.19–5.20 (sampled) | the five polynomials | degrees 3, 4, 6, 8, 14; constant terms 4096, 729, 125, 49, 13; matching lemos-2017 lines 237–241 | sound | none |
| §5.23 (sampled; values new here) | r=2, 3; j=1, 1728, 0 | r=2: the 26 signed divisors of 4096 give 25 values; t=8 and t=−64 both give 1728, t=−16 gives 0, t=1 gives 4913. (t+16)³−t has no root among them, so j=1 is not in the set. r=3: 13 values, 0 included, 1728 excluded; this agrees with ψ₃=3x⁴+6ax²−a² having no rational root on y²=x³+ax | sound | none |
| §5.25a (sampled) | E₁₁ over 𝔽₂; p=7, 11 | 5 points, a₂=−2, B(E₁₁)=2; (p²−1)/6 > 2(p−1) ⇔ p>11 (PRREVIEW~3) | sound | none |
| Every other statement, the four Lean predicates and the Conventions | as in PRREVIEW~3 and PRREVIEW~4 | the rows of those reports with their values; no text or Lean statement among them changed | sound (carried) | none |

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-169-corrigendum and kenku-1982 (§§4.10–4.17): these are settled as uncertified (paywalled). For the sampled §4.15, the README cites banwait-najman-padurariu line 58 instead, and that passage was read.
- The computer verifications behind Martin's tables beyond N=4000, Lemos's database runs and BPR's Proposition 5.9 are unchanged by this head and were not rerun.

## Source issues

- **Error** in bilu-parent-rebolledo at §5.1.1 after Proposition 5.1, printed page 974 (line 768): the source says every section of the identity component of the Néron model of J♯_e over O_K has finite order; it should be stated over ℤ, or for the ℚ-descended class, since for real quadratic K the split torus contributes O_K^×, which is infinite; affects the proof.
