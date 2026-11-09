# Review of AlgebraicTopologyPartII (pull request #1694 at 4855915)

**Verdict:** needs changes

This is an incremental re-review of the 10 README lines changed since 674154f. The gate passes, `Suggested.lean` is byte-identical to 674154f and elaborates with `sorry` as the only warning, and the dependency check reports no problem. There are two P3 findings and nothing blocking:
- R01 is the previous R01, still unrepaired.
- R02 is new. It is in the changed line 30. The previous report's own repair text caused it by leaving out §10.1.

## R01 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R01, not repaired)

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 132: "What EtaleDualityAndPerverseSheaves must provide (gap:configuration-cover-comparison): Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** The intake reads this sentence as the declared contract for the gap, so it must equal the plan's `needs`.

**Witness.** In `packages/AlgebraicTopologyPartII/design/plan.json` this gap has section "3.5–3.8 and 6.5" and the needs "Expose §§3.5–3.8 and §6.5 … compatible in one comparison diagram." A mechanical comparison of the 14 README contracts with the plan gives 13 equal and this one different.

**Repair.**
1. Replace the text after "(gap:configuration-cover-comparison): " with the plan's `needs`, word for word.
2. Change nothing else. Line 130 already states the compatibility with §§IG.0.T2–IG.0.T4 as ordinary prose.

Both added supplier sections exist at the EtaleDualityAndPerverseSheaves head (23180d4): §3.8 "Analytic smooth trace compatibility" (line 3627) and §6.5 "Contraction and Frobenius twisting" (line 6935).

**Test.** After the repair, the comparison reports 14 of 14 equal.

No repair report marks this finding not actionable. The only commit since 674154f, 4855915, touches the Ext-stalk lines only.

## R02 (P3) — The new list of interface consumers on line 30 leaves out §10.1

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 30, changed in this head: "Their full consumed statements, coefficient conventions and Checks are in Exact supplier contracts; §§8.1, 12.1 and 15.6 apply those interfaces."

**Claim.** The paragraph names three supplier interfaces:
- finite Borel approximation;
- the Steenrod-conjugated real pushforward;
- the internal Ext-stalk theorem.

§10.1 also applies the first of them, so the list is incomplete. The previous report's R02 step 1 prescribed this exact wording, so the omission is the review's error, not the author's.

**Witness.**
- The *Needs:* line of §10.1 (line 1066) reads "TauCetiRoadmap.MotivesAndAlgebraicCycles §7.6b (finite Borel approximation)", and the Layer 10 Dependencies (line 1135) say the same.
- In `plan.json`, node `AT2.10/complement-duality` has the prerequisite `AT2.8/finite-borel`.

**Repair.** On line 30, replace "§§8.1, 12.1 and 15.6 apply those interfaces" with "§§8.1, 10.1, 12.1 and 15.6 apply those interfaces".

**Test.** Four *Needs:* lines name one of the three interfaces: 953 (§8.1), 1066 (§10.1), 1250 (§12.1) and 1509 (§15.6). After the repair, line 30 names exactly those four sections.

## Previous findings

- R01 — not repaired: line 132 still reads "Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4." It is carried as R01 above.
- R02 — repaired: line 1397 no longer names the gap; lines 1509 and 1517 read "(gap:semialgebraic-ext-stalk)"; line 1521 reads "finite-index invariant lattices and the exact double-cover diagram comparison"; line 30 applies step 1 verbatim (that step's wording is R02 above).

## Verified sound

**Gate, build and order**
- **Gate**, run on this head: `gate AlgebraicTopologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD` lists 3 files, all in the folder, and none elsewhere.
- **Dependency check:** `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. That is 2 edges fewer than the 2323 reported at 674154f.
- **Merge order:** AlgebraicTopologyPartII is at line 225 of the merge order, after all its suppliers. They are as listed in the previous report.

**Elaboration**
- `lake env lean` on `Suggested.lean` gives 14 ``declaration uses `sorry` `` warnings, at lines 69, 108, 165, 174, 189, 215, 231, 250, 374, 403, 418, 472, 489 and 505, and no other message.
- `git diff --stat 674154f HEAD` touches only `README.md`, so the Lean file is unchanged.
- **Signatures.** `signatures.md` has the elaborated types of all 38 declarations at this head.
  - The 7 "looks dropped" leads are false. `ControlData`, `IsCompatible`, `IsInvariant`, `IsNormalized`, `IsControlledSubmersion`, `WhitneyB` and `IsWhitneyStratification` each carry both `[(i : ι) → TopologicalSpace (S i)]` and `[(i : ι) → ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]`, which I checked mechanically in each elaborated type.
  - The 4 Lean-name leads in `citations.md` are this roadmap's own declarations, at Lean lines 357, 374, 394 and 403.
- **Padding probe:** carried from the previous report, since the file is unchanged. All 14 one-tactic attempts failed.

**The changed passages, item by item**
- **Line 30.** The ownership sentence matches the supplier contracts: §7.6b (lines 193 and 219), SchemeAndStackFoundations §2.23 (line 100) and §7.6a (line 203). The consumer list is R02.
- **Line 1397 (Layer 14 Dependencies).** The gap is gone. The union of the §§14.1–14.3 *Needs:* lines is {§7.6a, AlgebraicTopology Stage 5, §14.1, §7.4, SchemeAndStackFoundations §2.23}. The Dependencies line adds only §7.2. Remark, no change asked: §7.2 is still used, because the §14.2 Check that the integral extension class has order 2 at a sign-stabilizer point is H¹(C₂,ℤ(1))=𝔽₂ from §7.2.
- **Line 1509 (§15.6 *Needs:*).** It equals the plan's prerequisites of `AT2.15/circle-extension`:
  - §15.1 = permutation-quotient;
  - §15.5 = cyclic-reduction-degrees;
  - §7.3 = fixed-integral;
  - §12.2 = surface-loop-representatives;
  - the gap = equivariant-ext-stalk.
- **Line 1517 (Layer 15 Dependencies).** It equals the union of the six Layer 15 *Needs:* lines: 12 items, with no difference in either direction.
- **Line 1521 (Layer 16 opening).** Its seven topics match §§16.1, 16.1a–16.1e, 16.2, 16.3 and 16.4. "Ext" occurs nowhere in lines 1519–1730.
- **Previous R02 test.** `grep "gap:semialgebraic-ext-stalk"` now hits only lines 203 (the contract), 1509 (§15.6) and 1517 (the Layer 15 Dependencies).
- **Gaps.** The same 14 slugs appear in `plan.json` and the README. `semialgebraic-ext-stalk` is now declared at its only consumer, §15.6. The gap still asks for something missing: MotivesAndAlgebraicCycles §7.6a has no internal Ext stalks.

**Cross-roadmap citations in the changed lines**, resolved against the current text:
- MotivesAndAlgebraicCycles §7.6a (line 1402) and §7.6b (line 1413) at head b8e693e;
- SchemeAndStackFoundations §2.23 on main (line 4558);
- AlgebraicTopology Stage 5 on main (line 849);
- EtaleDualityAndPerverseSheaves §§3.5, 3.6, 3.7, 3.8 and 6.5 at head 23180d4 (lines 3320, 3388, 3542, 3627 and 6935).

**Ownership and overlaps**
- `overlaps.md` lists no pull request that changes this folder and no dropped id. This head drops no id.
- Only two roadmaps cite AlgebraicTopologyPartII: MorseNovikov (§13.3) and StratifiedSpacesAndTameTopology (§§16.1a–16.1e). Neither cites a changed line.

**Seeded sample: the targets that fall in the changed passages**, read at the locator. All 7 hold.

| Target | Source line(s) read | Agreement |
|---|---|---|
| 12.1 (named on line 30) | MILNOR-STASHEFF line 3155 (Corollary 11.12, printed p.130); line 3211 (Theorem 11.14, pp.132–133) | w_n[M]≡χ mod 2 and w=Sq(v). On a surface v₂=0, so w₂=w₁². γ_X=w(TX(ℝ)) rests on KRASNOV (waived). |
| 12.2 (in §15.6 *Needs:*) | B19 lines 1640–1643 (proof of Proposition 7.4, printed p.103) | C^∞ embedded loops transverse to the ramification locus. The finite-family relative form is owned here, as the README says. |
| 14.1 (Layers 14–15 Dependencies) | B19 lines 362–386 (§2.2, (2.2)–(2.5), pp.72–73) | Both exact sequences; p, L and e determine one another; β_L=β_ℤ+e∪x at lines 376–377 |
| 15.1 (in §15.6 *Needs:*) | B19 lines 1354–1381 (§7.1, (7.1)–(7.2), p.97) | Adjunction isomorphisms by local non-disconnection, Q→j_*j*Q injective, and the exact sequence with (Tr,π) and (1,−φ) |
| 16.1b (Layer 16 opening) | MATHER line 480 (control data, PDF p.19); 485 (compatibility); 511 (proper retraction, p.20); 627–628 (Urysohn, p.23); 646–660 ((A6)–(A9), p.24); 672–677 ((A10)–(A11), p.25); 931 (Corollary 10.4 proof, p.32) | All locators hold. Properness is not among Mather's axioms, as the README says. |
| 16.2 (Layer 16 opening) | MATHER lines 887, 915 and 969 (read in the previous report; unchanged) | Equivariance is the roadmap's own target |
| 16.3 (Layer 16 opening) | B19 lines 1272–1273 (Proposition 6.6 proof, printed p.94) | Finite index by Hochschild–Serre, stated for T(C) and ℤ(1). The README's general compact finite-CW form follows by the same edge-map argument, which its proof sketch gives. |

The sampled targets outside the changed passages are 3.4, 4.3, 6.1, 7.1, 9.3, 10.3, 11.1 and 11.5. I did not re-read their statements, because an incremental review reads only the changed passages. A locator spot-check only:
- BS line 2250 opens Lemma 7.4 on printed p.942.
- BW line 363 (§1.1.2) and line 372 (§1.1.3) are both on p.10.
- BW line 653 is Proposition 1.3 on p.17; line 848 is the §1.4 exact sequence on p.22.
- BW line 978 is Lemma 1.16 on p.25; line 1012 is Remark 1.17(ii) on p.26.
- HILTON and SCHEIDERER are settled as uncertified.

**Adversarial table.** Rows marked "r8" are carried from the previous report (PRREVIEW-AlgebraicTopologyPartII r8) for statements this diff leaves untouched. The other rows were computed in this review.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| Line 30 consumer list (new) | *Needs:* lines naming the three interfaces | {§8.1 (953), §10.1 (1066), §12.1 (1250), §15.6 (1509)} / line 30 names {§8.1, §12.1, §15.6} | R02 |
| Layer 14 Dependencies (new) | union of the §§14.1–14.3 *Needs:* lines | 5 items / 6 items, the extra being §7.2; H¹(C₂,ℤ(1)) = ker(0)/im(−2) = ℤ/2 = 𝔽₂, used by the §14.2 Check | holds |
| §15.6 *Needs:* (new) | against the plan's `AT2.15/circle-extension` | {15.1, 15.5, 7.3, 12.2, gap} / {permutation-quotient, cyclic-reduction-degrees, fixed-integral, surface-loop-representatives, equivariant-ext-stalk} | equal |
| Layer 15 Dependencies (new) | union of 6 *Needs:* lines | 12 / 12, no difference | holds |
| Ext-stalk gap as consumed by §15.6 (new) | stalks ℤ[C₂], ℤ, ℤ(1); q=0,1,2 | ℤ[C₂]: ℤ, 0, 0, since ker(1+σ)=ℤ(1−σ)=im(σ−1). ℤ: ℤ, 0, 𝔽₂. ℤ(1): 0, 𝔽₂, 0. / Contract Checks (lines 208–209): trivial H¹=0, H²=𝔽₂; sign H¹=𝔽₂, H²=0; regular stalks vanish in positive degrees. | holds |
| §15.6 Check, n=2 (new) | E=(𝔽₂⊕ℤ)/⟨(1,2)⟩ | (0,2)≡(1,0)≠0 and (0,4)=2·(1,2), so (0,1) has order 4 and generates / ℤ/4 | holds |
| §15.1 at n=2 (new) | stalk ℤ², Q=ℤ²/diag≅ℤ through (a,b)↦a−b | (Tr,π): (a,b)↦(a+b, a−b), determinant −2, index 2 / \|ℤ/2\|=2; (1,−φ)∘(Tr,π) = (a+b)−(a+b) = 0 | exact |
| §12.1 surfaces (new) | RP², torus, Klein bottle | deg w₁²: 1, 0, 0 (pairing matrices (1), [[0,1],[1,0]], diag(1,1)) / χ mod 2: 1, 0, 0 | holds |
| §14.1 (new) | split cover and connected cover of S¹ | monodromy +1 and −1 / L constant ℤ and the nontrivial sign system | holds |
| §16.3 (new) | T=pt; S² with trivial action, j=0 | H²=0, index 1; H²_G(S²,ℤ)=ℤ⊕ℤ/2→ℤ, onto / index 1 and 1 | holds |
| Layer 16 opening (new) | topics against headings | 7 topics ↔ §§16.1, 16.1a–e, 16.2, 16.3, 16.4; "Ext" 0 times in lines 1519–1730 | holds |
| Gap contracts (new) | README against `plan.json` | 13 of 14 equal | R01 |
| `configurationTraceFormula` (r8) | q=2, m=2, χ≡1; χ=sgn; m=3; m=0 | 2 / 2; 0 / 0; 4 / 4; χ(∅) / χ(∅) | holds |
| `eulerExponent` (r8) | (4,2,r), (5,2,r), (5,1,r); r=0 | −2,−1,−2; 2,−3,2; 1,−1,0,0 / BS (7.2) the same; 0 at r=0 | holds |
| §3.1 product (r8) | N=1, n even and n odd | 1−T / 1+T, which is 1+s_nNT | holds |
| `doubleLoopFactor` (r8) | n=5, N=1, r=1,2 | (1−t²)⁻¹, 1+t⁵ / (1+t⁵)/(1−t²) | holds |
| `stableConfigurationDiagonal` (r8) | (0,3,2,2); (0,3,3,3); (1,1,2,1); (0,1,1,0) | 3/3; 4/4; 1/1; LHS 0 against RHS 1 | `hd` needed |
| `tameFibreBouquet` (r8) | z^k; x³−3x+y²; n=0 | k points; μ=2, one circle at ±2 and two at 0; empty fibre against one S⁰ | `hn` needed |
| `rationalBouquetRanks` (r8) | s=1, N=2, k=1,2,3; s=0 | 2, 0, 1 / Hilton the same; 2, 3, 2 / the same | holds |
| `doubleLoopBetti` (r8) | S⁴; N=0 | 1,0,1,0,1,1,1 / coefficients of (1+t⁵)/(1−t²); 1 / empty product | holds |
| `phamStrongRetraction` (r8) | n=0; n=1, k=3; k=(2,2) | ∅/∅; μ₃=S; (√2,i)∈X∖S | holds |
| `fermatDoubleLoopSimplyConnected` (r8) | n=5; n=4 | π₂S⁴=π₃S⁴=0; π₁Ω²S³=ℤ | n≥5 needed |
| `equivariantEhresmannTransport` (r8) | x² on ℝ, b=1 and b=0 | h(−x)=(σ_B×σ_M)h(x); fibres of 0, 1 and 2 points | `hreg` needed |
| `equivariantStratifiedTransport` (r8) | ℝ×S¹, z↦z̄ | unaveraged h(π/2,1)=(π/2,−i) against (π/2,i); averaged h=id | averaging needed |
| `ControlData`, `WhitneyB` (r8) | 3 strata of ℝ²; cusp; t·sin(1/t) | Jacobian 2xy/√(x²+2y²)≠0; distance →0 against →1 | holds |
| §§2.1, 5.2, 7.2, 7.3, 9.5, 10.1, 10.5, 11.4, 13.2, 15.2 (r8) | as recorded in r8 | values as recorded in r8 | hold |

## Not verifiable

These are settled, and I cite them by locator only:
- uncertified: HILTON (Theorem A, Corollary 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169), SCHEIDERER (Corollary 18.11) and BCR (Theorem 9.3.2);
- waived: KRASNOV (Theorem 2.1). This is the source of γ_X=w(TX(ℝ)) in §12.1.

MATHER is an OCR scan. I read its theorem labels and page markers through the noise.

## Source issues

- none
