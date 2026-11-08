# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 8cd16c2)

**Verdict:** needs changes

This is an incremental re-review of the 4 lines changed since ec03322. They are two bullets of Downstream consumers, at README:4429 and README:4434. There are three findings: one P2 and two P3.
- R01 (P2) and R02 (P3) carry over from the previous review. Both repairs lie outside this folder: one in QuaternionArithmetic's pull request, the other in this pull request's description.
- R03 (P3) is new. It is in the rewritten CompletedCohomologyAndLocalGlobalCompatibility bullet.

The previous review's R02 is repaired.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers for other roadmaps refer to their README at the head of their open pull request.

## R01 (P2) — Eichler orders and Brandt matrices still have two owners

Carried over: R01 of the previous review, and R02 and R01 of the two reviews before it. No repair report marks it as not actionable.

**Location.**
- README:9: “Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices at places prime to the level”.
- README:4431, the QuaternionArithmetic consumer bullet: “built on the Eichler orders, right ideal classes and Brandt matrices of §§R18.5.16a and R18.5.16c”.

**Claim.** QuaternionArithmetic consumes this roadmap, so this roadmap is the earlier owner of both objects. QuaternionArithmetic still defines both objects itself, and from this roadmap it consumes only R18.1, §R18.3.1 and §R18.5.17a.

**Witness.** #1722 (roed-math) is unchanged at 75c9080:
- README:660 is “### 1.9 Eichler orders”;
- README:685 is §1.10, which carries the index formula;
- §§7.1–7.3 on Brandt matrices are at README:1491–1528;
- the consumed list at README:169–170 omits §§R18.5.16a and R18.5.16c;
- Suggested.lean:216 is `def IsEichler`.

**Repair.** The edit belongs in #1722:
- §§1.9, 1.10 and 1.12 cite §R18.5.16a, items 1–4;
- §§7.1–7.3 cite §R18.5.16c, with `T(𝔭)=B(v)ᵀ` at primes prime to the level;
- each kept variant says in one clause how it differs;
- the consumed list adds §§R18.5.16a and R18.5.16c.

Nothing in this folder changes. If that edit cannot be made in #1722, the repair report should record this finding as `not actionable in this package`, with that reason, so that the board parks it for a human instead of starting another round.

**Test of the repair.** At D=11, QuaternionArithmetic README:1508 gives `T(2)=[[1,3],[2,0]]`, whose column sums are 3. That is the transpose of §R18.5.16c's `B(2)=[[1,2],[3,0]]`, whose row sums are 3. So the citation loses nothing.

## R02 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Carried over: R03 of the previous review and R05 of the one before it.

**Location.** The citation “AlgebraicTopology, Layer 6” appears at:
- README:45 (supplier table);
- README:100 (contract);
- README:3603 (Check);
- README:3611 (link `…#layer-6-cohomology-products-and-manifold-duality`).

**Claim.** That numbering exists only at the head of #1652 (kim-em), so citing it makes #1652 a dependency. The description names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.**
- On main (1d4e7ce), AlgebraicTopology README:946 is “## Stage 6: cohomology, products, and manifold duality”.
- At #1652 (head 9cac1ae), README:1622 is “## Layer 6: …”.
- #1663 (head a6488e3) keeps “Stage 6” at README:1228.
- The string “1652” occurs nowhere in the description.

**Repair.**
- Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list.
- Put #1652 before this pull request in the merge-order paragraph.
- Leave the README as it is. Citing main's “Stage 6” instead would break when #1652 renames the heading.

**Test of the repair.** After the edit, the overlaps report's only “defined only by an open revision” items are the two AlgebraicTopology items: the “Layer 6” citations at README:45, 3603 and 3611, and the anchor at README:3611. Both are covered by the named dependency.

## R03 (P3) — The rewritten CompletedCohomology bullet omits four sections that roadmap consumes

**Location.** README:4434: “uses the definite class sets, coefficient forms and definite Jacquet–Langlands realization of R18.3 (§§R18.3.1–R18.3.3, R18.3.19–R18.3.22) and the finite-level Shimura-curve cohomology with its residual Eisenstein vanishing of R18.4 (§R18.4.8).”

**Claim.** The bullet now lists the consumed sections by number. CompletedCohomologyAndLocalGlobalCompatibility also consumes four more:
- §R18.3.4, neat-level reduction and base change;
- §R18.3.6, split Hecke normalization;
- §R18.3.15, residual quaternionic Hecke ideal;
- §R18.4.25, cohomological automorphic eigenspaces.

A reader who changes one of these sections is not told that the change affects that roadmap.

**Witness.** In #1270 (head 1148c33):
- the *Needs:* of §1.7 (README:740) cites “R18.3 (neatness base change)”;
- the *Needs:* of §3.7 (README:1314) cites “R18.3 (residual hecke ideal)” and “R18.3 (split hecke normalisation)”;
- the *Needs:* of §4.12 (README:1832) cites “R18.4 (cohomological eigenspaces)”.

**Repair.** Make two replacements in README:4434:
- Replace the first parenthesis by “(§§R18.3.1–R18.3.4, R18.3.6, R18.3.15, R18.3.19–R18.3.22)”, and add “neat-level base change, split Hecke normalization, residual Hecke ideal” to the R18.3 list.
- Replace the second parenthesis by “(§§R18.4.2, R18.4.8, R18.4.25)”, and add “cohomological automorphic eigenspaces” to the R18.4 clause.

**Test of the repair.** #1270 cites this roadmap under 11 distinct labels. Each one maps to a section in the repaired list:

| Label in #1270 | Section here |
| --- | --- |
| definite class set | R18.3.1 |
| quaternion weight | R18.3.2 |
| neatness base change | R18.3.4 |
| split hecke normalisation | R18.3.6 |
| residual hecke ideal | R18.3.15 |
| definite jl | R18.3.22 |
| §§R18.3.1–R18.3.3 | R18.3.1–R18.3.3 |
| §§R18.3.19–R18.3.22 | R18.3.19–R18.3.22 |
| finite cohomology (README:641, 650) | R18.4.2 |
| §R18.4.8 | R18.4.8 |
| cohomological eigenspaces | R18.4.25 |

## Previous findings

- R01 — not repaired: #1722 is still at 75c9080. It still declares `def IsEichler` (Suggested.lean:216) and Brandt matrices (§§7.1–7.3) without citing §§R18.5.16a or R18.5.16c. This is R01 above.
- R02 — repaired: README:4429 now ends “…for Moret–Bailly arguments, and the definite modules of R18.3.”, and README:4434 names only CompletedCohomologyAndLocalGlobalCompatibility. The repair introduced R03.
- R03 — not repaired: README:45 still reads “AlgebraicTopology, Layer 6”, and the description still does not mention #1652. This is R02 above.

## Verified sound

**Validation.**
- **Head and pins.** Head 8cd16c220602293ba860aca1642d566b4107be71. Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5.
- **Files.** The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml. Since ec03322, only README.md changed (2 insertions, 2 deletions); `git diff ec03322 HEAD -- Suggested.lean` is empty.
- **Gate.** The worker's gate is 0 on every rule, including `build=0`. My rerun is 0 on every text rule, `OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 237 roadmaps, 2456 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output. The file declares nothing, so there is no `sorry` warning, and the `#check @` comparison and the one-tactic probe are vacuous.

**Changed passages, read in full.** README:4425–4436 (Downstream consumers), and every section the new bullet cites:
- §R18.3.1 (README:2793), §R18.3.2 (2817) and §R18.3.3 (2843);
- §§R18.3.19–R18.3.22 (3142, 3162, 3183, 3206);
- §R18.4.8 (3513).

Their titles match the bullet's words. §R18.4.8 proves `H⁰(X_K,L_k)_m=H²(X_K,L_k)_m=0` at an absolutely irreducible m. That is exactly what #1270 imports in its Shimura H⁰ coefficient extension (README:197) and in §1.5 (README:650).

**The two deletions.**
- **Merge order.** SmallRamificationAndAbelianVarietyBaseCases is at line 120 and NeronModelsAndSemistableAbelianVarieties at line 65, both earlier than this roadmap (line 161).
  - “SmallRamification” no longer occurs in the README.
  - Neron remains only as a supplier, at README:31, 116, 2471, 2502, 2524 and 2526.
- **No consumer of the Drinfeld quotient is lost.** At the open heads, §§R18.5.7–R18.5.18 are consumed only by:
  - SerreWeightAndLevelOptimisation (#1013, README:131, §§R18.5.15–R18.5.18), covered by the R18.6 bullet's “graph and monodromy comparisons”;
  - GrossZagierAndArithmeticHeights (#1487, README:2560, Layer R18.5), covered by the R18.1–R18.5 bullet;
  - Neron (#852, README:2908, 4497), which calls this roadmap a producer of its interfaces, as README:116 says.
- **PerfectoidShimuraVarieties.** It was dropped from the Drinfeld bullet. At #1085 (head cfba9f7) it cites only:
  - §H0.0 (README:61, 1477);
  - H1, H3, H4 and H5 (README:111, 137–149 and *Needs:* lines 1660–1878);
  - §§H3.3, H3.6, H4.6, H4.12 and H4.18 (README:1806).

  “Drinfeld” occurs there once (README:832: Drinfeld's Ω as a Hodge–Tate image, not this roadmap's quotient). It correctly stays on the H1–H5 bullet.

**Overlaps and citations.**
- overlaps.md has no other pull request changing this roadmap and no dropped cited id. Its “only an open revision” items are R02.
- No heading changed, so this pull request drops no id that other roadmaps cite (gate `dropped=0`).
- The five leads of citations.md are on untouched lines (README:77, 94, 130, 1310) and resolve as in the previous review.
- The vocabulary neighbours #1007, #1075, #1824 and #1013 are unchanged with respect to this diff. #1270 is R03.

**Seeded sample.** The changed lines carry no locator, so none of the 15 sampled targets falls in them. Those targets are §§R18.5.16a, R18.5.16c, H2.1, R18.5.17a, R18.4.29, H6.2, R18.3.2, R18.4.24a, R18.1.1a, R18.5.18, R18.3.8, R18.4.32, R18.4.30, R18.5.15 and H6.4. Each was verified against its source in the previous review on text that is unchanged at this head. No README locator is flagged as unverified.

**Headlines.** These are the Čerednik–Drinfeld uniformisation (§R18.5.15), the Ihara lemma with its integral saturation (§§R18.4.32–R18.4.33), the definite Ihara lemma (§R18.3.8), and the paired torsion twists (§§H6.2–H6.8). They are unchanged, and none is statable at the pins. The unchanged docstring of Suggested.lean names each one with its missing carrier.

**Adversarial pass.** Rows 1–3 are computed this round for the changed statements. The other rows are carried from the previous review (r8) for statements the diff leaves untouched.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| README:4434, CompletedCohomology bullet (new) | Cited sections here against #1270's citation labels and lines | 7 cited sections exist (README:2793–3513). #1270 cites them at README:182, 197, 650, 691, 940. Not listed: R18.3.4 (#1270:740), R18.3.6 and R18.3.15 (#1270:1314), R18.4.25 (#1270:1832). Merge order: #1270 at line 250 > 161. | True but incomplete; R03 |
| README:4429, PotentialModularity bullet (shortened) | Merge order of the remaining consumer; the deleted SmallRamification clause | PotentialModularity at line 175 > 161. SmallRamification at line 120 < 161, and #970 never names this roadmap (r8). | Correct; R02 (r8) repaired |
| README:4425–4436, all named consumers | Merge-order line of each | AGR 166, SWLO 164, PadicFamilies 172, OAFML 173, GL2ML 174, PMCS 175, HTCS 183, PSV 184, OAF 249, CCLGC 250, GZ 338, HPES 371; QuaternionArithmetic not listed. Suppliers named there: WeightsInEtaleCohomology 148, GL2AutomorphicRepresentationsAndTransfer 99. | Every consumer is later and every supplier earlier |
| §R18.5.16a item 4 (r8) | `ℤ/8` with I=(4) and I=0; `𝔽₂[x,y]/𝔪²`; `ℤ/9`; `ℤ/4`; I=A | `[GL₂:K₀]`,`[GL₂:K₁]` = 6,12; 12,48; 12,48; 3,3; 4,8; 3,3. At I=A the indices are 1,1 against 3/2, so `I≠A` is needed. | Correct (r8) |
| §R18.5.16a items 1, 3, 5 (r8) | `n=(0 1;ϖ 0)`; `ℙ¹(ℤ/4)`; `ℤ₂` at e=2 | `nM₂n⁻¹∩M₂=O₀(ϖ)` and `n²=ϖ`. 6 points. `[K₀(4):K₁(4)]=2=#(ℤ/4)×`. | Correct (r8) |
| §R18.5.16b (r8) | `S₃` with `Γ=U′=⟨t⟩`; `U′=A₃` | 2 orbits = 2 double cosets (sizes 2 and 4); `2=2·1` | Correct (r8) |
| §R18.5.16c item 4 (r8) | D ramified at {23,∞}; `ℚ(√10)`, `(−1,−1)` | `w₂B₁₂=2=w₁B₂₁`. `Σ1/w=7/6=ζ_F(−1)`. `w₄B₁₄=12=w₁B₄₁`. | Correct (r8) |
| §R18.3.8, headline (r8) | F=ℚ, D_{2,∞}, H maximal; the kernel relation | #Y_H=1; kernel `(c,−c)`; T₃=4 on constants. `ω⁻¹(1 1;0 1)ω∉H` refutes MS's `g(xω)`. | Correct (r8) |
| §R18.4.32, headline (r8) | l=2; `√5∉F` | l>2 is MS's standing hypothesis. Condition (2) is automatic if `√5∉F`. | Correct (r8) |
| §§R18.4.17, R18.4.33, headline (r8) | `O→O²`, `x↦(x,0)`; `×λ` on O | The cokernel mod λⁿ is `O/λⁿ`, free but with λ-torsion. `×λ` is injective with zero residual map. | Correct (r8) |
| §§R18.4.14–R18.4.16 (r8) | (q,T,S)=(2,3,2) and (2,3,1) | Off-diagonal of GJ is 0. G(0,1)=(3/2,3). Δ=0 and G(1,−1)=0. | Correct (r8) |
| §R18.4.30 (r8) | A=k[[t]], R=A[[x]], M=R; R=A, M=k | 2=1+1, flat; dim k=0≠1, not flat | Correct (r8) |
| §§R18.5.15, R18.1.1a, headline (r8) | disc 6, v=2, level `1+7M₂(ℤ₇)`; `M₂(ℚ)` | c₂=4. Π⁻¹ gives 2 and the central idele gives 2; 2·2=4. inv₂(M₂)=0, so it is excluded. | Correct (r8) |
| §H6.5, headline input (r8) | x³−3x+1, l=7, p=19; `ℚ(√3)`, `ℚ(ζ₁₂)` | disc 81. Roots 3,7,9 mod 19. `N(π₇³)=343≡1 mod 19`. h(N)=1, h⁺(M)=2. | Correct (r8); (C6) is needed |
| §H6.4, headline (r8) | Real elliptic curve; `+I₂`, ℓ odd | Eigenvalues ±1, det −1. With `+I₂`, e=−e forces e=0. | Correct (r8) |
| §H2.1 (r8) | `k[T]/T²`; O=ℤ | `W^⊥=W` has k-dimension 2 and is not free of rank one; for O=ℤ the model is ℙ¹ | Correct (r8) |
| §§H0.3–H0.5 (r8) | Trace dual of `O⊕c⁻¹𝔡⁻¹`; `ℚ(√2)` | `c⊕𝔡⁻¹=cL_c`; 𝔡=(2√2) has norm 8 | Correct (r8) |
| §§H3.2–H3.3 (r8) | `ℚ(√2)`, M=12; `ℚ(√3)`, N=7 | ε⁸≡1 mod 12 and ε⁸∉S₁₂. `f†f=97+56S`, f²≡1, η≡−1. | Correct (r8) |
| §H4.19 (r8) | `ℚ(√2)`, p=2, N=5, n=2..6 | ord(ε mod 5)=12. Δ_n(5)≅ℤ/6; the limit is ℤ/3. | Correct (r8) |
| §R18.5.18 (r8) | Tate curve with v(q)=ℓ | `T^I=E[ℓ]` (dim 2), toric part μ_ℓ, Φ[ℓ]=ℤ/ℓ | Correct (r8) |
| §§R18.3.2, R18.3.7 (r8) | d=2, k=4; `Sym²(ℤ₂²)`; `ℚ(√3)` | Rank 9; Gram det ±4. h=1 and h⁺=2. | Correct (r8) |

**Remarks on untouched text.** These are not findings, and no change is requested.
- CompletedCohomologyPartII (#1035, merge-order line 178) imports §§R18.4.12–R18.4.13 (its README:1763, 1775) but has no Downstream consumers bullet.
- PadicFamilies also uses §R18.5.16b (its README:2713), and PerfectoidShimuraVarieties also uses §H0.0. Their bullets name only R18.3 and H1–H5 respectively.

## Not verifiable

- **Sources.** No source was reread this round: the changed lines carry no locator. The previous review's notes on Voi21's printed pages and on the sources outside its sample still apply.

## Source issues

- none
