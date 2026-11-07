# Review of FaltingsFinitenessAndIsogenyTheoremsPartII (pull request #1738 at f49680f)

**Verdict:** accepted

This is an incremental re-review of the 36 changed README lines since fca9497 (14 insertions, 22 deletions). `Suggested.lean` and `metadata.toml` did not change, and nothing outside the folder changed. The one previous finding (R01) is repaired, the repair introduces no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: line 362 now reads “Then G_ω is the minimal period subvariety A_ω of EllipticCurveModularityPartII §6.0f, taken for A=G_ℚ̄ … Its existence, its minimality, G_0=0 and the image rule … are supplied there.” Section 2.1 now defines only Δ_L. Lines 13, 136, 364 and 561 cite §6.0f.

## Verified sound

### Gate, direction, elaboration and signatures

The gate was run on this head with `--base origin/main`. It printed:

```text
gate FaltingsFinitenessAndIsogenyTheoremsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate record for this head also reports `build=0`.

The dependency check (`gate --depcheck … --movable`) printed:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or moved line. The two new supplier edges point downward in the merge order: AbelianSchemesAndArithmeticModuli A2.4 is at position 45 and EllipticCurveModularityPartII §6.0f is at position 194. This roadmap is at position 364.

`lake env lean` on `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean` succeeded in 31 s. Its only output was `declaration uses 'sorry'` at 47:8 (`class_index_bound`) and 68:8 (`elliptic_isogeny_j_height_bound`).

A scratch copy with `#check @name` for all three declarations elaborated. The types match the worker's signature record exactly:
- `regularOrderDiscriminant`: `{D} [Ring D] (O : Subring D) {m} → Module.Basis (Fin m) ℤ ↥O → ℤ`.
- `class_index_bound`: keeps `DivisionRing`, `Algebra ℚ D`, `FiniteDimensional ℚ D`, both full-span hypotheses, `Module.Finite ℤ ↥M`, `0 < e` and `index ≠ 0`.
- `elliptic_isogeny_j_height_bound`: keeps `∃ C, 0 < C ∧ ∀ k [Field k] [NumberField k] …`, with the constant chosen before the field.

No binder was lost. They agree with README §3.1, §3.5 and §6.1. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git diff fca9497 HEAD` touches only the README.

### Changed passages against their suppliers

| Changed passage | What was opened | Result |
|---|---|---|
| Line 13: §6.0f owns A_ω “in every dimension and for every tangent vector, together with its existence”; §2.1 consumes it over ℚ̄ | EllipticCurveModularityPartII README at its open head (95f7c2f), lines 731 and 735–737 | Line 731 defines A_ω for every algebraically closed K⊆ℂ, every abelian A/K and every ω∈t_A⊗_Kℂ, and proves existence by intersection and Cartier. Lines 735–737 give minimality, A_0=0 and φ(A_ω)=A′_(dφ(ω)). The passage is correct. |
| Line 13: “a supplier of Layers 2 and 6 … consumes nothing from Layer 2 and is not a downstream consumer” | Same README, *Needs:* lines 739 and 749; Downstream consumers line 1062 | Neither *Needs:* line cites this roadmap. Line 1062 lists this roadmap as a consumer and says that Δ_L is “that roadmap's own definition”. The two READMEs now agree. |
| Line 57: “A2.4 gives χ(L)=c₁(L)^g/g! for every line bundle L, and H^i(A,L)=0 for i>0 and h⁰(A,L)=χ(L)>0 for ample L, in every dimension g≥0” | AbelianSchemesAndArithmeticModuli README at its open head, §A2.4 (lines 1148–1196 of `roadmaps show`) | Vanishing, h⁰=χ>0 and χ=c₁^g/g! are stated for ample L. The text adds that “the last two formulas hold for every L” and that for g=0 every rank and degree is one. The passage is correct. |
| Line 136: the §6.0f contract sentence | EllipticCurveModularityPartII lines 731–739 | Each clause matches: every algebraically closed K⊆ℂ, every A and ω, minimality, A_0=0, the image rule over K, and Cartier “proved within this subsection” (line 739). |
| Lines 362–378: §2.1 statement, *Needs:*, API and Checks | AbelianSchemesAndArithmeticModuli §A5.4(2) (lines 2642–2660 of `roadmaps show`): type (d₁,…,d_g), h⁰(L)=∏d_i, (L^g)=g!∏d_i | The API bullet “χ(B,L\|_B)=h⁰ is the product of the elementary divisors … a positive integer” is exactly A2.4 plus A5.4(2) applied to (B, L\|_B), which is ample because L is. The values are in the table below. |
| Line 438: §2.4 Check on the Weil restriction | Computed (table below) | The values are correct. Geometric simplicity, not k-simplicity, is the hypothesis that makes G_ω=G_ℚ̄. |
| Line 561: Layer 2 Dependencies | Items checked against the §2.1 *Needs:* line | Both new items (§6.0f and A2.4) appear in the §2.1 *Needs:* line. |
| Stale references to the deleted API | `grep` for §2.1, G_ω, A_ω and Δ_L across the README | No section other than §2.4 (lines 428 and 432) and the Layer 2 Examples (line 551) uses G_ω. Both use only minimality and Δ_L, which are now supplied or defined. Section 2.7 uses Δ_L(B) under the Conventions definition at line 29, which is unchanged. |

### Ownership and overlaps

- `roadmaps grep -i 'minimal period subvariet|smallest abelian subvariety|smallest connected abelian subvariety'` over main and all 472 open heads finds the object defined only in EllipticCurveModularityPartII §6.0f (line 731). This README now only cites it (lines 13, 136, 362, 364, 561). The AbelianSchemesAndArithmeticModuli hit at its line 3793 is the Albanese image of a curve, a different object. The object has one owner.
- Δ_L stays here. A `grep` of AbelianSchemesAndArithmeticModuli for “normalized degree”, “normalized intersection”, Δ_L and `/b!` finds no subvariety-degree definition, only the A2.4 identity χ=c₁^g/g!. So §2.1 is not a duplicate.
- `overlaps.md`: no other open pull request changes this roadmap, and no cited id is dropped. The lead “IntegralLattices Layer 0 (line 11) only defined by #1239” is a false positive. On main, `TauCetiRoadmap/IntegralLattices/README.md` has Layer 0 at line 507 and Layer 1 at line 590.
- `citations.md` leads (unchanged lines, rechecked):
  - AutomorphicBundles B4.2 resolves through that README's own map at line 222 (B4 = Layer 11; B5.1a = 12.2; B5.n = 12.(n+1)).
  - `ScalarFourierJacobi.torsorDescription` is the planned target of AutomorphicBundles §12.2, at its line 4570. It is cited as a supplier target, not as a pinned declaration.

### Settled items

Plan gaps G1–G5, G7 and G8 have supplier `none`. G6 and `hermitian-maximal-slope` are legacy entries of the append-only plan. The README cites none of the eight `gap:G*` slugs or `hermitian-maximal-slope`. Its nine live contracts (lines 59–79, 120, 126) are all owned slugs, each present in `design/plan.json`. The repair record marked the legacy entries “not actionable” because their content is now owned by numbered sections or imported. That reason still holds at this head:
- G1: §§2.2–2.4, with A_ω now from §6.0f.
- G2: §§2.5–2.6 and `gap:fixed-siegel-cusp-family`.
- G3: `gap:cyclic-maximal-subfield`.
- G4: gr14 Proposition 6.9, now owned by EllipticCurveModularityPartII §6.0f.
- G5: §7.5.
- G6: the pinned `TauCeti.zHat` API.
- G7: §8.1.
- G8: §7.4 with ArithmeticGaloisRepresentations §§5.8 and 6.4a.

### Seeded sample

The changed passages and their dependents reach §2.2 (described in line 13) and §2.11 (through §2.8, §2.4 and §2.1). Their locators were reopened:
- **§2.2 (seeded).** bost95 Théorème 4.1 is at bost95 lines 381–389. It is on cached PDF page 15, and printed page 115 is PDF page 2 (bost95 lines 21–22), so it is printed p. 128. The hypotheses match: an algebraically closed field of characteristic zero, ample L, a nonzero section, a zero-dimensional S, vanishing on the addition image of S^g, and a conclusion with B≠A and length(p(S)).
- **§2.11 (seeded).** mw94-preprint §6 begins at line 409, on PDF page 13, which is internal p. 11 (footer “10” at line 407). Equations (6.1)–(6.2) are at lines 424 and 428, and (6.3)–(6.4) at lines 445 and 454. The Corollary is at lines 58–62. The constant there depends on d, and the polynomial dependence on d comes from the proof at line 460, as the README's route states.
- **§2.1 (changed, not seeded).** mw94-preprint line 228 introduces the restated period theorem (lines 229–233) with G_ω and the normalized degree ∂. Lines 155–156 refer the normalized-degree convention to the waived mw93-periods, and principal r has degree 1, consistent with Δ_L(G)=1 for a principal L.
- **The other seeded targets** (§§1.2, 1.6, 2.5, 3.2, 3.6, 4.1, 4.3, 4.5, 4.6, 5.3, 5.4, 7.2, 7.7) lie outside the diff. Their locator lines were spot-checked and land on the stated items:
  - mw94-preprint line 103 (§2, PDF page 5) and line 148 (Lemma 2.3).
  - mw95 lines 157–159 (class index), 485 (Lemma 5.2), 514 (Lemma 6.1) and 644 (Lemma 7.2).
  - ry25 line 456 (Theorem 4.7) and lines 492–497 (the product identity).

  Their adversarial rows are computed below.

### Adversarial table

New rows, with computed values, for every changed statement:

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Line 13 and line 136: single owner of A_ω | E×E with ω=(η,η), (η,0), 0 | §6.0f A_ω: the diagonal (dim 1), E×0 (dim 1), 0 (dim 0). §2.1 now defines no subvariety of its own and quotes §6.0f. Supplier line 760: pr₁ sends the diagonal onto E, and pr₁⁻¹(E) has dim 2, so the rule is an image rule | One owner; the image rule is quoted correctly | none |
| Line 57: A2.4 contract | O(d·0) on E for d=3, 0, −1; g=0; type (1,2) on E² | χ=c₁/1!=3, 0, −1 against h⁰=3, 1, 0: h⁰=χ only for d=3, the ample case. g=0: χ=1=c₁⁰/0!. Type (1,2): (L²)=4, 4/2!=2=h⁰ | “every L” for χ and “ample” for h⁰ and vanishing are both needed and stated | none |
| §2.1 Δ_L definition | B=0; E×E with product principal L: the diagonal, E×0 and E×E | Δ_L(0)=c₁⁰[pt]/0!=1. L restricted to the diagonal is O(2[0]): Δ=2. L restricted to E×0 is O([0]): Δ=1. c₁(L)²=2(D₁·D₂)=2, so Δ(E×E)=2/2!=1=h⁰(L) | Correct. The unnormalized model gives 2 on E×E; the Check catches it | none |
| §2.1 Check: simple G and map-degree | E with deg L=3 | Δ=3/1!=3; deg φ_L=χ²=9 | Correct, and Δ_L is distinguished from the map-degree | none |
| §2.1 Check: nef line | pr₁*O([0]) on E×E | Restricted to 0×E the line is trivial, with χ=0 but h⁰=1. c₁²=D₁²=0, so Δ(E×E)=0 | Correct. Positivity needs ampleness, and the Check separates χ from h⁰ | none |
| §2.1 API: Δ_L=∏ elementary divisors | Product principal L on E×E; the (1,2) line on E² | Types (1,1) and (1,2): products 1 and 2, against Δ_L=1 and 2 | Agrees with A5.4(2) | none |
| §2.4 changed Check: k-simple but not geometrically simple | A=Res_(F/ℚ)E, E≁E^τ over F̄, L=(pr₁*O([0])⊗pr₂*O([0]))^⊗2 | The ℚ-subvarieties of A are 0 and A (τ swaps E×0 and 0×E^τ), so A is ℚ-simple. G_((η,0))=E×0 has dim 1<2. Δ_L(A)=c₁(L)²/2!=4·2/2=4, and Δ_L(E×0)=deg O(2[0])=2 | Correct. The divisor E×0+0×E^τ is itself τ-stable, so L is defined over ℚ | none |
| Layer 2 Dependencies | Merge-order positions | A2.4 at 45 and §6.0f at 194, both before 364 | Downward | none |

Rows for statements the diff leaves untouched. These cover the seeded sample, the two headlines and the targets the previous finding touched:

| Statement | Instances and computed values | Result |
|---|---|---|
| 1.2 Rosati length (seeded) | g=1: q(1)=Tr_A(1)=2, ℓ=√2. Gaussian i: i·i†=i·(−i)=1, so q=2. Product-polarized E² shear [[1,N],[0,1]]: vv†=[[1+N²,N],[N,1]], so q=2(2+N²), giving 6 at N=1. q([r])=2g r², and ℓ([−1])=√(2g) | Sound (computed in this round) |
| 1.6 Rosati degree inequality (seeded) | [n]: n^(2g)=(2g n²/2g)^g, equality. [−2] on E²: q=16 and 16=(16/4)². Shear N=1: 1≤(6/4)²=2.25. g=0 is excluded (division by 2g). mw94-preprint line 148 has (2n)^(−n) t(f)^n | Sound (computed in this round) |
| 2.1 minimal period subvariety | dimensions 1, 1, 0 and Δ=2, 1, 1 (previous report, row “2.1”) | Sound; ownership is repaired |
| 2.2 multiplicity estimate (seeded) | First-order neighbourhood on a surface: length 3, and S^[2] has length 6. L=L₀² on E₁×E₂: d_L(A)=8, so 3≤8; with B=E₁×0, 2·2=4≤8. θ² has order 4≥3 (previous report, §2.2 rows) | Sound |
| 2.4 period theorem | principal E: Δ=1; degree-three L: Δ=3, not 9 (previous report, row “2.4”); Weil restriction above | Sound |
| 2.5 cusp height (seeded) | u=e^(−2) gives 2; the rescaled e^(−N)u gives N+2 (previous report, row “2.5”) | Sound |
| 2.11 polarized rational isogeny (seeded) | A=B: identity of degree 1, so C·H^κ≥1. [2] has degree 4 and height difference 0≤½ log 4. Absorption with C=κ=H=1: N≤1+log N forces N=1 (at N=2, 2>1.69) | Sound (computed in this round) |
| 3.1 regular discriminant | ℤ, ℤ[i], ℤ[2i], M₂(ℤ): 1, −4, −16, −16 (previous report, row “3.1”) | Sound |
| 3.2 order class index (seeded) | ℤ and ℤ[i] (PIDs): i_e=1. ℤ[2i] acting on M=ℤ[i]: [ℤ[i]:αℤ[2i]]=2N(α), at least 2 at units, so i_1≥2. Rank 0: i_0=1. mw95 line 158: the source's i_e is the least I | Sound (computed in this round) |
| 3.5 `class_index_bound` (headline) | ℤ with e=2: 1≤1; ℤ[2i]: 2≤\|−16\|^(1/2)=4 (previous report, row “3.5”) | Sound |
| 3.6 isotypic trace comparison (seeded) | (g,m,\|disc\|,D_λ)=(1,1,1,2): 2=2. (1,2,4,4): 2²·4=16=2²·4. (2,4,16,16): 4⁴·16=4096=4⁴·16. Tr_A=(2g/m)·tr gives ratio 2 for non-CM E and 1 for Gaussian E | Sound (computed in this round) |
| 4.1 cross-discriminant (seeded) | 1, (−4)²=16, 6²=36 (previous report, row “4.1”) | Sound |
| 4.3 simple isogeny (seeded) | 1≤1, 1≤16; deg(1+i)=2 (previous report, row “4.3”) | Sound |
| 4.5 polarization-free bounds (seeded) | Non-CM E: disc(ℤ)=1. Hom(E∨,E)=ℤλ⁻¹ and Hom(E,E∨)=ℤλ, with tr(λ⁻¹λ)=1, so the cross-discriminant is 1²=1. Zarhin: dim 8, height 8h_F=−8 at h_F=−1 | Sound (computed in this round) |
| 4.6 stable subvariety (seeded) | projection degree 1; multiplicities 1 and 1 (previous report, row “4.6”) | Sound |
| 5.3 unpolarized estimate (seeded) | degrees 1 and 4; N^(2g−1)=4 (previous report, row “5.3”) | Sound |
| 5.4 relative-field estimate (seeded) | \|GL₂(𝔽₃)\|=(9−1)(9−3)=48, and 48²=2304 bounds [k(E[3],E′[3]):k]. K=k(t): the relative algebraic closure of k is k, and the E² factorization has degree 1 | Sound (computed in this round) |
| 6.1 `elliptic_isogeny_j_height_bound` (headline) | C=9C₀=88,030,890,000,000; at d=1, h_F=−1: 9,702,250,000,000≤9,781,210,000,000 (previous report, rows “6.1”) | Sound |
| 7.2 adelic product comparison (seeded) | O_ℓ={[[a,b],[ℓc,d]]}: M₂(ℤ_ℓ)/O_ℓ≅𝔽_ℓ, so the index is ℓ. O₂ and O₃ give 2·3=6. O_ℓ at every ℓ gives ∏𝔽_ℓ, which is infinite and excluded by the finiteness hypothesis | Sound (computed in this round) |
| 7.7 uniform integral Tate bound (seeded) | Local bounds 4 and 9 give 36. At d=1 only U′=U is allowed, and full local algebras give 1≤M with M≥1 | Sound (computed in this round) |
| 8.1, 8.4, 8.5 | ranks 1; [V:V∩W′]≤2; [2ℤ:6ℤ]=3 (previous report) | Sound |

### Headlines and padding

`Suggested.lean` is unchanged at this head. It contains one real-bodied definition (`regularOrderDiscriminant`) and two native-carrier headlines (`class_index_bound` for §3.5 and `elliptic_isogeny_j_height_bound` for §6.1). Its module docstring names the headlines that cannot be stated at the pins, with their missing carriers: the period theorem and the endomorphism estimates need the polarized complex-lattice realization and stable Faltings height; the polarization-free, factorization and isogeny bounds need stable height and the abelian degree API. The earlier rounds' one-tactic probe found no padding, and no declaration changed, so it was not repeated.

## Not verifiable

- **mw93-periods** (waived) and **mw95-refine** (waived), **igusa** (uncertified, Lemma 20 p. 104) and **fw84** (uncertified, Chapter VI §3). These are settled and were not requested again. In particular the normalized-degree convention of §2.1 is fixed through mw94-preprint line 228 and the Conventions line, because mw94-preprint lines 155–156 defer the definition to mw93-periods §2.
- **Cartier's theorem in EllipticCurveModularityPartII §6.0f.** Its Stacks locators (Tags 047I and 047N) belong to that roadmap's review. Here only the statement it supplies is consumed.

## Source issues

- none
