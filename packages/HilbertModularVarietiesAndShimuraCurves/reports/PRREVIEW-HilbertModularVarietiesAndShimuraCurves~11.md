# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 8a9e596)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since 906cb79: the HodgeTateAndCanonicalSubgroups sentence of Downstream consumers, at README:4432. That rewrite repairs the previous R03 exactly.

Two findings remain, R01 (P2) and R02 (P3). Both carry over from the previous review, and the repair for each lies outside this folder:
- R01: QuaternionArithmetic (#1722) still states the Eichler orders and Brandt matrices this roadmap owns.
- R02: this pull request's description does not name #1652.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers for other roadmaps refer to the raw README at the head of their open pull request.

## R01 (P2) — Eichler orders and Brandt matrices still have two owners

Carried over: R01 of the previous review, and of the reviews before it. No repair report marks it `not actionable in this package`.

**Location.**
- README:9: “Eichler orders, with their local form over every discrete valuation ring … together with the neighbour ideals and their Brandt matrices at places prime to the level (§§R18.5.16a, R18.5.16c)”.
- README:4431: “built on the Eichler orders, right ideal classes and Brandt matrices of §§R18.5.16a and R18.5.16c”.

**Claim.**
- QuaternionArithmetic consumes this roadmap (R18.1, §R18.3.1, §R18.5.17a), so it comes later in the order.
- That makes this roadmap the earlier owner of Eichler orders (§R18.5.16a) and of neighbour ideals and Brandt matrices (§R18.5.16c).
- QuaternionArithmetic still defines both objects itself and cites neither section.

**Witness.** #1722 (roed-math) is unchanged at 75c9080:
- README:660 is “### 1.9 Eichler orders”;
- Brandt matrices are §§7.1–7.3 (README:1491–1528);
- Suggested.lean:216 is `def IsEichler`;
- “R18.5.16” occurs nowhere in its README.

**Repair.** The edit belongs in #1722, and nothing in this folder changes:
- §§1.9, 1.10 and 1.12 cite §R18.5.16a, items 1–4;
- §§7.1–7.3 cite §R18.5.16c, with `T(𝔭)=B(v)ᵀ` at primes prime to the level;
- each kept variant says in one clause how it differs;
- the consumed list (README:169–170) adds §§R18.5.16a and R18.5.16c.

If that edit cannot be made in #1722, the repair report records this finding as `not actionable in this package`, with that reason. The board then parks it for a human instead of starting another round.

**Test of the repair.** Recomputed at D=11, using #1722 README:1508 with weights (2,3).
- `T(2)=[[1,3],[2,0]]` has column sums 1+2=3 and 3+0=3.
- Its transpose `B(2)=[[1,2],[3,0]]` has row sums 3, which is `q_v+1`, as §R18.5.16c item 2 requires.
- Weighted symmetry (item 4, with `s_v` trivial over ℚ) gives `w₂B₁₂=3·2=6=2·3=w₁B₂₁`.
- `T(2)T(3)=T(3)T(2)=[[8,6],[4,6]]`, with column sums 12=σ(6). So #1722's multiplicativity Check (README:1524) survives the transposed citation.

## R02 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

Carried over: R02 of the previous review, and before that R02, R03 and R05.

**Location.** The citation “AlgebraicTopology, Layer 6” appears at:
- README:45 (supplier table);
- README:100 (contract);
- README:3603 (Check);
- README:3611 (link `…#layer-6-cohomology-products-and-manifold-duality`).

**Claim.** That numbering exists only at the head of #1652 (kim-em), so citing it makes #1652 a dependency. The description names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.**
- On main (35884a8), AlgebraicTopology README:946 is “## Stage 6: …”.
- At #1652 (head now 1f5b3f6), README:1643 is “## Layer 6: …”.
- #1663, #1797, #1807, #1808 and #1854 keep “Stage 6”.
- “1652” occurs nowhere in the description.

**Repair.**
- Add “#1652 AlgebraicTopology (kim-em)” to the Depends-on list.
- Put #1652 before this pull request in the merge-order paragraph.
- Leave the README as it is. #1652 README:595 now maps “Stage 6 items 0–5” to §§6.0–6.5, so the Layer numbering is the one that survives the merge.

**Test of the repair.** overlaps.md lists exactly two “only an open revision defines” items:
- “Layer 6” at README:45, 3603 and 3611;
- the anchor at README:3611.

Both name #1652, so both are covered once the description names it.

## Previous findings

- R01 — not repaired: #1722 is still at 75c9080. It still declares `def IsEichler` (Suggested.lean:216) and Brandt matrices (§§7.1–7.3) without citing §§R18.5.16a or R18.5.16c. This is R01 above.
- R02 — not repaired: README:45 still reads “AlgebraicTopology, Layer 6”, and the description still does not mention #1652. This is R02 above.
- R03 — repaired: README:4432 now reads “the Deligne–Pappas model of c-polarized HBAVs with its normality, determinant identity and Rapoport locus (§§H2.2–H2.5), the Hilbert Hasse ideal and formal Hasse neighborhoods (§§H2.7–H2.8), and … levels of H4 (§§H4.1, H4.3, H4.4, H4.6, H4.8)”.

## Verified sound

**Validation.**
- **Head.** 8a9e5960262fdcc1f08b4249867dd3bc0f77f26f.
  - `git diff --stat 906cb79 HEAD` shows only README.md, 1 insertion and 1 deletion.
  - `git diff 906cb79 HEAD -- Suggested.lean` is empty.
  - The diff outside the folder is empty.
  - The folder holds README.md, Suggested.lean and metadata.toml.
- **Gate.** The worker's gate is 0 on every rule, including `build=0`. My rerun of the full gate is 0 on every rule and ends `OK` (exit 0).
- **Dependency check.** Output, exactly: `depcheck: 239 roadmaps, 2388 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with no output. The file declares nothing, so there is no `sorry` warning, and the `#check @` comparison and the one-tactic probe are vacuous. The module docstring is unchanged and still names each headline group with its missing carrier.

**Changed passage, read in full.** README:4432 cites 11 sections. Each resolves to a heading whose object matches the bullet's wording:

| Bullet object | Section | Heading |
| --- | --- | --- |
| Deligne–Pappas model | H2.2 (571), with H2.2a–H2.2b (594, 611) | Deligne–Pappas integral Hilbert model |
| normality | H2.3 (625) | Flatness and normality at every prime |
| determinant identity | H2.4 (635) | DP determinant identity on arbitrary bases |
| Rapoport locus | H2.5 (645) | Rapoport locus |
| Hilbert Hasse ideal | H2.7 (691) | Hilbert Hasse ideal |
| formal Hasse neighborhoods | H2.8 (714) | Formal Hasse neighborhoods and lift independence |
| hybrid full level | H4.1 (927) | Hybrid full Hilbert level |
| scalar-similitude full level | H4.3 (973) | Scalar-similitude geometric full level |
| adjugate action | H4.4 (996) | Adjugate action on dual levels |
| arithmetic full level | H4.6 (1028) | Arithmetic full Hilbert level |
| integral Iwahori levels | H4.8 (1061) | Integral Iwahori and higher subgroup levels |

- “c-polarized HBAV” is this README's own term (README:495, 580, 670, 893).
- The forgetful maps that the consumer's contract names are `Forgetα_n` in H4.1 (README:936) and flag truncation in H4.8 (README:1065).

**Consumer check.** I extracted every citation of this roadmap in HodgeTateAndCanonicalSubgroups (#1084, raw README at d6aad63; 12 lines) and read each in context. The previous review quoted two of these lines one higher (1185, 1217) because the `roadmaps show` header shifts its numbering; the raw lines are 1184 and 1216.

**Overlaps and ownership.**
- No heading changed, so this pull request drops no id that other roadmaps cite (gate `dropped=0`).
- overlaps.md lists no other pull request changing this roadmap and no dropped cited id. Its “only an open revision” items are R02.
- The changed line introduces no object, so ownership is unaffected.
- HodgeTateAndCanonicalSubgroups is at merge-order line 181, after this roadmap at line 159.

**Citation leads.** All five names in citations.md resolve; none is a defect:
- `LocallySymmetric.SheafDerived.isoSingular`: ArithmeticLocallySymmetricSpaces #871, README:832.
- `LocallySymmetric.FrankeInput`: the same README, line 528.
- `OrderIdeles.unit_change`: ClassicalArithmeticCompletion on main, README:16155.
- `CanonicalModel.minimal_defined_over_reflex`: ShimuraVarieties #933, README:2782.
- `TauCeti.RingTheory.IntegralOrder.LeftOrder`: a module at the pinned Tau Ceti. It defines `Submodule.leftOrder` (line 61) and `leftOrder_isOrder` (line 130).

**Seeded sample.** The changed line carries no locator, so none of the 15 sampled targets falls in it. Those targets were verified against their sources in earlier rounds, on text unchanged at this head. No README locator is flagged as unverified.

**Headlines.** The headlines are unchanged:
- the Čerednik–Drinfeld uniformisation (§R18.5.15);
- the Ihara lemma with its integral saturation (§§R18.4.32–R18.4.33);
- the definite Ihara lemma (§R18.3.8);
- the paired torsion twists (§§H6.2–H6.8).

None is statable at the pins, and the docstring says so for each.

**Adversarial pass.**
- Rows 1–3 are computed this round, for the changed sentence and the recomputed R01 witness.
- The other rows carry the previous review (r10) forward for statements the diff leaves untouched. Rows marked (r8) were first computed in the eighth review.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| README:4432, HTCS sentence: consumer → bullet | #1084 citations at its raw lines 121, 1005, 1033, 1055, 1180, 1184, 1194, 1216, 1226, 1249, 1301, 1352, 1408 | Each use maps to a section: Hasse ideal → H2.7; Hasse formal domains → H2.8; determinant condition (1216) → H2.4; 𝔠-polarization (1216) → H2.2; normal admissible DP/Rapoport model (1184) → H2.2, H2.3, H2.5; hybrid → H4.1; geometric → H4.3; arithmetic (121) → H4.6; adjugate → H4.4; integral Γ₀ → H4.8; forgetful maps (121) → H4.1, H4.8. Uncovered: 0 of 11 use kinds. | Correct; R03 (r10) repaired |
| README:4432: bullet → consumer (no overclaim) | The 11 cited sections | H2.2 (1184, 1216), H2.3 (1184 “normal”), H2.4 (1216), H2.5 (1184 “Rapoport”), H2.7 (1033, 1055, 1180, 1194, 1226), H2.8 (1055, 1194), H4.1, H4.3 and H4.4 (1005, 1194, 1249, 1301, 1352, 1408), H4.6 (121), H4.8 (1226 and the four H4 lines). Unused: 0 of 11. | Correct |
| §R18.5.16c items 2 and 4 against #1722 §7 (R01 test) | D=11, weights (2,3); `T(2)`, `T(3)` of #1722 README:1508 | Rows of `T(2)ᵀ`: 3 and 3. `w₂B₁₂=6=w₁B₂₁`. `T(2)T(3)=T(3)T(2)=[[8,6],[4,6]]`, with column sums 12 = σ(6). | Correct; repair of R01 tested |
| README:4427, AGR bullet (r10) | #1007 (79040a7) citations | Uncovered: 0. Merge-order line 164 > 159. | Correct (r10) |
| README:4428, SWLO addition (r10) | #1013 (0825d40) | §R18.3.29 is in the contract (134) and a *Needs:* line (1707). The rest falls under R18.6 (4406–4408). | Correct (r10) |
| README:4429, PMCS bullet (r10) | #1075 (5a6a670) | H1.1, H1.8, H2.2–H2.2b, H2.6, H6, R18.3: uncovered 0. Merge-order line 173. | Correct (r10) |
| README:4430, PadicFamilies (r10) | #1019 (dd500bf) | H1–H5 and §§R18.5.16a–b: uncovered 0. Merge-order line 170. | Correct (r10) |
| README:4432, PSV sentence (r10, unchanged words) | #1085 (cfba9f7) | H0.0, H1.8–H1.9, H3, H4, H5.1: uncovered 0. Merge-order line 182. | Correct (r10) |
| README:4434, CCLGC bullet (r10) | #1270 (1148c33): 11 labels | Unmapped: 0. Merge-order line 248. | Correct (r10) |
| §R18.5.16a item 4 (r8) | `ℤ/8` with I=(4) and I=0; `𝔽₂[x,y]/𝔪²`; `ℤ/9`; `ℤ/4`; I=A | `[GL₂:K₀]`,`[GL₂:K₁]` = 6,12; 12,48; 12,48; 3,3; 4,8; 3,3. At I=A: 1,1, so `I≠A` is needed. | Correct (r8) |
| §R18.5.16a items 1, 3, 5 (r8) | `n=(0 1;ϖ 0)`; `ℙ¹(ℤ/4)`; `ℤ₂` at e=2 | `nM₂n⁻¹∩M₂=O₀(ϖ)` and `n²=ϖ`. 6 points. `[K₀(4):K₁(4)]=2`. | Correct (r8) |
| §R18.5.16b (r8) | `S₃` with `Γ=U′=⟨t⟩`; `U′=A₃` | 2 orbits = 2 double cosets (sizes 2 and 4); `2=2·1` | Correct (r8) |
| §R18.5.16c item 4 (r10) | {23,∞}; D=11; `ℚ(√10)`, `(−1,−1)` | `w₂B₁₂=2=w₁B₂₁`; `3·2=6=2·3`; `w₄B₁₄=12=w₁B₄₁` | Correct (r10) |
| §R18.3.8, headline (r8) | F=ℚ, D_{2,∞}, H maximal | #Y_H=1; kernel `(c,−c)`; T₃=4 on constants | Correct (r8) |
| §R18.4.32, headline (r8) | l=2; `√5∉F` | l>2 is MS's standing hypothesis; condition (2) is automatic if `√5∉F` | Correct (r8) |
| §§R18.4.17, R18.4.33, headline (r8) | `O→O²`, `x↦(x,0)`; `×λ` on O | The cokernel mod λⁿ is `O/λⁿ`. `×λ` is injective with zero residual map. | Correct (r8) |
| §§R18.4.14–R18.4.16 (r8) | (q,T,S)=(2,3,2), (2,3,1) | Off-diagonal 0; G(0,1)=(3/2,3); Δ=0, G(1,−1)=0 | Correct (r8) |
| §R18.4.30 (r8) | A=k[[t]], R=A[[x]], M=R; R=A, M=k | 2=1+1, flat; dim k=0≠1, not flat | Correct (r8) |
| §§R18.5.15, R18.1.1a, headline (r8) | disc 6, v=2, level `1+7M₂(ℤ₇)`; `M₂(ℚ)` | c₂=4=2·2; inv₂(M₂)=0, so it is excluded | Correct (r8) |
| §H6.5, headline input (r8) | x³−3x+1, l=7, p=19; `ℚ(√3)`, `ℚ(ζ₁₂)` | disc 81; roots 3,7,9 mod 19; `343≡1 mod 19`; h(N)=1, h⁺(M)=2 | Correct (r8) |
| §H6.4, headline (r8) | Real elliptic curve; `+I₂`, ℓ odd | Eigenvalues ±1, det −1; with `+I₂`, e=−e forces e=0 | Correct (r8) |
| §H2.1 (r8) | `k[T]/T²`; O=ℤ | `W^⊥=W` has dimension 2 and is not free of rank one; ℙ¹ for O=ℤ | Correct (r8) |
| §§H0.3–H0.5 (r8) | Trace dual of `O⊕c⁻¹𝔡⁻¹`; `ℚ(√2)` | `c⊕𝔡⁻¹=cL_c`; 𝔡=(2√2) of norm 8 | Correct (r8) |
| §§H3.2–H3.3 (r8) | `ℚ(√2)`, M=12; `ℚ(√3)`, N=7 | ε⁸≡1 mod 12, ε⁸∉S₁₂; `f†f=97+56S`, η≡−1 | Correct (r8) |
| §H4.19 (r8) | `ℚ(√2)`, p=2, N=5, n=2..6 | ord(ε mod 5)=12; Δ_n(5)≅ℤ/6; the limit is ℤ/3 | Correct (r8) |
| §R18.5.18 (r8) | Tate curve with v(q)=ℓ | `T^I=E[ℓ]` (dim 2), toric μ_ℓ, Φ[ℓ]=ℤ/ℓ | Correct (r8) |
| §§R18.3.2, R18.3.7 (r8) | d=2, k=4; `Sym²(ℤ₂²)`; `ℚ(√3)` | Rank 9; Gram det ±4; h=1, h⁺=2 | Correct (r8) |

**Remarks on untouched text.** These are not findings, and no change is requested.
- CompletedCohomologyPartII (#1035) still imports §§R18.4.12–R18.4.13 and has no Downstream consumers bullet. The previous review already noted this.

## Not verifiable

- **Sources.** No source was reread this round, because the changed line carries no locator. The notes of earlier reviews on Voi21's printed pages, and on the sources outside the sample, still apply.

## Source issues

- none
