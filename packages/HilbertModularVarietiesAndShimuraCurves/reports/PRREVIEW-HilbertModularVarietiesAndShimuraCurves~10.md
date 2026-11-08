# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 906cb79)

**Verdict:** needs changes

This is an incremental re-review of the 12 lines changed since 8cd16c2. They are the six rewritten bullets of Downstream consumers, at README:4427–4434. There are three findings: one P2 and two P3.
- R01 (P2) and R02 (P3) carry over from the previous review. Both repairs lie outside this folder: one in QuaternionArithmetic's pull request, the other in this pull request's description.
- R03 (P3) is new. The rewrite narrowed the HodgeTateAndCanonicalSubgroups bullet, and that bullet now omits an H2 input the consumer states its theorems with.

The previous review's R03 (the CompletedCohomology bullet) is repaired word for word.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers for other roadmaps refer to their README at the head of their open pull request.

## R01 (P2) — Eichler orders and Brandt matrices still have two owners

Carried over: R01 of the previous review, and before that R01 and R02. No repair report marks it as not actionable in this package.

**Location.**
- README:9: “Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices at places prime to the level”.
- README:4431: “built on the Eichler orders, right ideal classes and Brandt matrices of §§R18.5.16a and R18.5.16c”.

**Claim.** QuaternionArithmetic consumes this roadmap (R18.1, §R18.3.1, §R18.5.17a), so it comes later in the order and this roadmap is the earlier owner of both objects. QuaternionArithmetic still defines both objects itself and cites neither section.

**Witness.** #1722 (roed-math) is unchanged at 75c9080:
- README:660 is “### 1.9 Eichler orders” and README:685 is §1.10;
- §§7.1–7.3 on Brandt matrices are at README:1491, 1514 and 1528;
- its consumed list (README:169–170) omits §§R18.5.16a and R18.5.16c;
- Suggested.lean:216 is `def IsEichler`.

**Repair.** The edit belongs in #1722:
- §§1.9, 1.10 and 1.12 cite §R18.5.16a, items 1–4;
- §§7.1–7.3 cite §R18.5.16c, with `T(𝔭)=B(v)ᵀ` at primes prime to the level;
- each kept variant says in one clause how it differs;
- the consumed list adds §§R18.5.16a and R18.5.16c.

Nothing in this folder changes. If that edit cannot be made in #1722, the repair report should record this finding as `not actionable in this package`, with that reason. The board then parks it for a human instead of starting another round.

**Test of the repair.** At D=11, #1722 README:1508 gives `T(2)=[[1,3],[2,0]]`, whose column sums are 1+2=3 and 3+0=3. Its transpose `[[1,2],[3,0]]` has row sums 3, as §R18.5.16c item 2 requires. With weights (2,3), item 4 gives `w₂B₁₂=3·2=6=2·3=w₁B₂₁`. So the citation loses nothing.

## R02 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Carried over: R02 of the previous review, and R03 and R05 of the two before it.

**Location.** The citation “AlgebraicTopology, Layer 6” appears at:
- README:45 (supplier table);
- README:100 (contract);
- README:3603 (Check);
- README:3611 (link `…#layer-6-cohomology-products-and-manifold-duality`).

**Claim.** That numbering exists only at the head of #1652 (kim-em), so citing it makes #1652 a dependency. The description names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.**
- On main (b3d628f), AlgebraicTopology README:946 is “## Stage 6: cohomology, products, and manifold duality”.
- At #1652 (head 9cac1ae), README:1623 is “## Layer 6: …”.
- The other open revisions of AlgebraicTopology keep “Stage 6”: #1663 at README:1229, #1797 at 1592, #1807 at 1170, #1808 at 1160 and #1854 at 1438.
- The string “1652” occurs nowhere in the description.

**Repair.**
- Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list.
- Put #1652 before this pull request in the merge-order paragraph.
- Leave the README as it is. Citing main's “Stage 6” instead would break when #1652 renames the heading.

**Test of the repair.** After the edit, overlaps.md lists only two “defined only by an open revision” items: the “Layer 6” citations at README:45, 3603 and 3611, and the anchor at README:3611. Both are covered by the named dependency.

## R03 (P3) — The narrowed HodgeTateAndCanonicalSubgroups bullet omits the Deligne–Pappas model and its determinant identity

**Location.** README:4432: “**HodgeTateAndCanonicalSubgroups** uses the Hilbert Hasse ideal and formal Hasse neighborhoods of H2 and the full and Iwahori-type levels of H4.”

**Claim.** Before this change the bullet listed “the integral Hilbert models, Hasse ideals, polarization quotients and full levels of H1–H5”. The rewrite keeps only the Hasse objects from H2. HodgeTateAndCanonicalSubgroups also uses two more H2 inputs:
- the Deligne–Pappas/Rapoport model (§§H2.2–H2.3, H2.5);
- its determinant identity (§H2.4).

Its canonical-subgroup theorems are stated on that model. A reader who changes §§H2.2–H2.5 is not told that the change affects it.

**Witness.** #1084 (head d6aad63):
- §3.10 (README:1185) is stated “on the specified normal admissible Deligne–Pappas/Rapoport Hilbert model”.
- §3.12 (README:1217) takes “a dimension-g HBAV satisfying `HilbertModularVarietiesAndShimuraCurves` H2's determinant condition”.

**Repair.** Replace the first sentence of README:4432 by: “**HodgeTateAndCanonicalSubgroups** uses the Deligne–Pappas model with its normality, determinant identity and Rapoport locus (§§H2.2–H2.5), the Hilbert Hasse ideal and formal Hasse neighborhoods (§§H2.7–H2.8), and the full and Iwahori-type levels of H4.”

**Test of the repair.** Each HodgeTateAndCanonicalSubgroups use of this roadmap maps to a section of the repaired sentence:

| Use in #1084 | Section here |
| --- | --- |
| H2 (hilbert hasse ideal), lines 1056, 1181, 1195, 1227 | H2.7 (README:691) |
| H2 (hasse formal domains), lines 1056, 1195 | H2.8 (README:714) |
| H2's determinant condition, line 1217 | H2.4 (README:635) |
| normal admissible DP/Rapoport model, line 1185 | H2.2, H2.3, H2.5 (README:571, 625, 645) |
| H4 (hybrid / geometric full level), lines 1006–1409 | H4.1, H4.3 (README:927, 973) |
| H4 (integral gamma0), lines 1006–1409 | H4.8 (README:1061) |
| H4 (adjugate level action), lines 1006–1409 | H4.4 (README:996) |

## Previous findings

- R01 — not repaired: #1722 is still at 75c9080. It still declares `def IsEichler` (Suggested.lean:216) and Brandt matrices (§§7.1–7.3) without citing §§R18.5.16a or R18.5.16c. This is R01 above.
- R02 — not repaired: README:45 still reads “AlgebraicTopology, Layer 6”, and the description still does not mention #1652. This is R02 above.
- R03 — repaired: README:4434 now reads “(§§R18.3.1–R18.3.4, R18.3.6, R18.3.15, R18.3.19–R18.3.22) … (§§R18.4.2, R18.4.8, R18.4.25)”, with the matching object names, exactly as requested.

## Verified sound

**Validation.**
- **Head and pins.** Head 906cb793fc17eeeaf647f1fe66a377ce36cf829d. Since 8cd16c2, only README.md changed (6 insertions, 6 deletions). `git diff 8cd16c2 HEAD -- Suggested.lean` is empty, and the diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- **Gate.** The worker's gate is 0 on every rule, including `build=0`. My rerun of the full gate is 0 on every rule, `OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 238 roadmaps, 2377 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output. The file declares nothing, so there is no `sorry` warning, and the `#check @` comparison and the one-tactic probe are vacuous. No library declaration needed opening this round.

**Changed passages, read in full.** I read README:4425–4436 and resolved all 35 section headings that the rewritten bullets cite:
- R18.1.7 (1698);
- R18.3.1–R18.3.4 (2793–2869), R18.3.6 (2893), R18.3.15 (3042), R18.3.19–R18.3.22 (3142–3206), R18.3.29 (4010), R18.3.32 (4366);
- R18.4.2 (3386), R18.4.8 (3513), R18.4.25 (3989);
- R18.5.16a–b (2355, 2391), R18.5.19–R18.5.21 (2217, 2528, 2548);
- H0.0 (194), H1.1 (353), H1.8–H1.9 (493, 516), H2.2–H2.2b (571–611), H2.6–H2.8 (681–714), H4.8 (1061), H5.1 (1298), H5.3–H5.4 (1328, 1338).

Each bullet's object names match those headings.

I compared each bullet with the consumer's citations of this roadmap at its head. There were 10 consumer READMEs, and every citation was extracted mechanically and then read in context.

**Overlaps and ownership.**
- overlaps.md has no other pull request changing this roadmap and no dropped cited id. Its “only an open revision” items are R02.
- No heading changed, so this pull request drops no id that other roadmaps cite (gate `dropped=0`).
- The changed lines introduce no object, so ownership is unaffected.
- The vocabulary neighbours are unchanged with respect to this diff:
  - #1007, #1013 and #1075 are rows 1–3 of the table below;
  - #1270 is row 7;
  - #1824 (AutomorphyLiftingBeyondTaylorWiles) names this roadmap 0 times, so it needs no bullet.

**Seeded sample.** The changed lines carry no locator, so none of the 15 sampled targets falls in them. Those targets are §§R18.5.16a, R18.5.16c, H2.1, R18.5.17a, R18.4.29, H6.2, R18.3.2, R18.4.24a, R18.1.1a, R18.5.18, R18.3.8, R18.4.32, R18.4.30, R18.5.15 and H6.4. They were verified against their sources in earlier rounds, on text that is unchanged at this head. No README locator is flagged as unverified.

**Headlines.** The headlines are unchanged:
- the Čerednik–Drinfeld uniformisation (§R18.5.15);
- the Ihara lemma with its integral saturation (§§R18.4.32–R18.4.33);
- the definite Ihara lemma (§R18.3.8);
- the paired torsion twists (§§H6.2–H6.8).

None is statable at the pins. The unchanged docstring of Suggested.lean names each one with its missing carrier.

**Adversarial pass.** Rows 1–8 are computed this round for the changed bullets. Merge-order lines are from ORDER.txt, where this roadmap is line 159. The other rows are carried from the previous reviews (r9, r8) for statements the diff leaves untouched.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| README:4427, AGR bullet | #1007 (79040a7) citations against the bullet's ids | AGR cites §R18.1.7 (1630), §§R18.2.3, R18.2.6 and R18.5.19–21 (2121), §R18.3.29 (2004, 2188), §R18.3.32 (3367, 3387), §R18.4.25 (2004), and §§R18.5.16a–b (84, 941, 1007, 1649). Uncovered: 0. Merge order 164 > 159. | Correct |
| README:4428, SWLO addition | #1013 (0825d40) | §R18.3.29 is in SWLO's contract (134) and *Needs:* (1707). Its other ids (§§R18.3.5, 3.18, 3.24–3.27, 3.31–3.32, R18.4.17, R18.5.15–18) fall under the lists of R18.6 (README:4406–4408). Merge order 162. | Correct |
| README:4429, PMCS bullet | #1075 (5a6a670) | PMCS cites H1.1 and H1.8 (1005, 1033, 1246), H2.2–H2.2b (17, 1005, 1017, 1190), H2.6 (17, 981, 1033), H6.1–H6.5 and H6.9, and R18.3.1–3.3, 3.5 and 3.22. Uncovered: 0. Merge order 173. | Correct |
| README:4430, PadicFamilies addition | #1019 (dd500bf) | PadicFamilies cites H1.1–H1.10, H2.2–H2.9, H3.6–H3.8, H4.8 and H5.3–H5.4 (100, 2851, 2896), R18.5.16a (2683, 2714) and R18.5.16b (18, 98). Uncovered: 0. This resolves the r9 remark on §R18.5.16b. Merge order 170. | Correct |
| README:4432, HTCS sentence | #1084 (d6aad63) | Covered: H2 Hasse ideal and formal domains, and H4 full, Γ₀ and adjugate. Uncovered: the DP/Rapoport model (1185) and H2's determinant condition (1217). Merge order 181. | Incomplete; R03 |
| README:4432, PSV sentence | #1085 (cfba9f7) | PSV cites H0.0 (62, 1478); H1.8–H1.9 (112), with H1 at 1768 and 1784 being the Weil pairing of its §5.6; H3.1–H3.8, H4.1–H4.19 and H5.1. Uncovered: 0. This resolves the r9 remark on §H0.0. Merge order 182. | Correct |
| README:4434, CCLGC bullet | #1270 (1148c33): its 11 citation labels | definite class set → R18.3.1; quaternion weight → 3.2; neatness base change → 3.4; split hecke → 3.6; residual hecke ideal → 3.15; definite jl → 3.22; finite cohomology → R18.4.2; §R18.4.8; cohomological eigenspaces → 4.25. Unmapped: 0. Merge order 248. | Correct; R03 (r9) repaired |
| Dropping OverconvergentAutomorphicForms | #1422 (beb4bd7) | It mentions this roadmap 0 times. It takes Hasse and level objects through HodgeTateAndCanonicalSubgroups and PerfectoidShimuraVarieties (its README:14–15). | Correct |
| §R18.5.16a item 4 (r8) | `ℤ/8` with I=(4) and I=0; `𝔽₂[x,y]/𝔪²`; `ℤ/9`; `ℤ/4`; I=A | `[GL₂:K₀]`,`[GL₂:K₁]` = 6,12; 12,48; 12,48; 3,3; 4,8; 3,3. At I=A the indices are 1,1 against 3/2, so `I≠A` is needed. | Correct (r8) |
| §R18.5.16a items 1, 3, 5 (r8) | `n=(0 1;ϖ 0)`; `ℙ¹(ℤ/4)`; `ℤ₂` at e=2 | `nM₂n⁻¹∩M₂=O₀(ϖ)` and `n²=ϖ`. 6 points. `[K₀(4):K₁(4)]=2=#(ℤ/4)×`. | Correct (r8) |
| §R18.5.16b (r8) | `S₃` with `Γ=U′=⟨t⟩`; `U′=A₃` | 2 orbits = 2 double cosets (sizes 2 and 4); `2=2·1` | Correct (r8) |
| §R18.5.16c item 4 (r8, recomputed) | D ramified at {23,∞}; D=11; `ℚ(√10)`, `(−1,−1)` | {23,∞}: `w₂B₁₂=2=w₁B₂₁`, `Σ1/w=7/6`. D=11: `3·2=6=2·3`. `ℚ(√10)`: `w₄B₁₄=12=w₁B₄₁`. | Correct |
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
- CompletedCohomologyPartII (#1035, merge-order line 176) still imports §§R18.4.12–R18.4.13 (its README:1764, 1776) and still has no Downstream consumers bullet.
- GrossZagierAndArithmeticHeights (#1487) cites §R18.3.29 and §R18.4.25a. These fall inside the range “R18.1–R18.5” of its unchanged bullet (README:4433).

## Not verifiable

- **Sources.** No source was reread this round: the changed lines carry no locator. The notes of earlier reviews on Voi21's printed pages and on the sources outside the sample still apply.

## Source issues

- none
