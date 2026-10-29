# Repair report: red-team round 1 of FaltingsFinitenessAndIsogenyTheoremsPartII

Two reviews were merged: review a (findings F01 to F06) and review b (findings F01 to F04); each section names its review. None overlap. All ten are settled below. The section numbers given are the README's numbering after the repair; Layer 2 was renumbered under review a F05.

## F01 (P2) — applied

Review a, finding F01.

Old: `elliptic_isogeny_j_height_bound` assumed `2 ≤ finrank ℚ k` and used the factor `(log D)²`, and the README treated D=1 separately. New: there is no degree hypothesis, and the factor is `max 1 (log D) ^ 2`, both in the Lean statement and in §6.1. The proof route now gives C=9C₀ for every D≥1 (each of 1, log D and h_F is at most 3·max(1,log D)(1+h(j))). The D≥2 form with C′=C/(log 2)² is kept as a stated consequence, and so is the D=1 form `≤4C max(1,h)²`. §6.1's Checks and Examples were recomputed: at D=1, j=0 the bound is C; at D=2, j=0 it is 4C=36C₀; at D=3 the factor is log 3≈1.0986. No separate boundary theorem was added.

## F02 (P1) — applied

Review a, finding F02.

The AbelianSchemesAndArithmeticModuli contract now cites A3.11 (`principalQuotient`). Over k̄ it gives an isogeny of degree h⁰(L)=√δ to a principally polarized quotient, and descends it to some finite field. A3.11 gives no degree bound for that field. §2.8 (formerly §2.6) now uses that quotient, adds A3.11 to its *Needs*, and states the quantitative principalization as a named target: [k₁:ℚ]≤c_g Dδ^g, an isogeny of degree √δ, λ=u^∨λ₁u, and h_F(A₁)≤h_F(A)+¼ log δ. It cites mw94-preprint §5, internal p. 9 (lines 348–350) and mw93-periods Lemma 5.3, which is waived. The target has a proof route, a *Needs* line and four Checks: δ=1; δ=4 on E[2] (three subgroups, field degree ≤3); the whole-kernel negative control [2], giving map-degree 16 rather than 4; δ=9 (four subgroups of order 3). A3.11 and A3.6 were also added to the Layer 2 Dependencies. The mw93-periods and mw94-preprint locators in `sources.toml` were extended to match.

## F03 (P3) — applied

Review a, finding F03.

§1.5 previously cited "mw94-preprint, §6 internal p12, equation (6.2)". It now cites "mw94-preprint, Lemma 2.3 proof, internal p4, mw94-preprint line 149" for degree as the absolute lattice determinant, and "mw94-preprint §6, internal p11, lines 433–438" for the homogeneous degree polynomial. I checked both lines myself: line 149 says the degree is |det M|, and lines 433–438 give the polynomial P. Equation (6.2) at line 428 is the block-projection identity, so the old locator was wrong. The `sources.toml` locator was updated to match.

## F04 (P3) — applied

Review a, finding F04.

The §6.1 Example previously said "both the imported bound and the j-form equal 36C₀". It now says that at D=2, j=0 the imported expression is 4C₀: the j=0 curve has negative stable height, so H=1. Replacing H by its upper bound 3 weakens this to 36C₀, which equals the j-form 4C with C=9C₀. A matching Check was added.

## F05 (P3) — applied

Review a, finding F05.

Layer 2 is now in proof order, with sections renumbered: 2.1 minimal period subvariety; 2.2 multiplicity (formerly 2.2a); 2.3 auxiliary sections (formerly 2.2b); 2.4 period theorem (formerly 2.2); 2.5 cusp value (formerly 2.4); 2.6 Siegel imaginary part (formerly 2.5); 2.7 short period bases (formerly 2.3); 2.8 short endomorphisms (formerly 2.6); 2.9 discriminant (formerly 2.7); 2.10 off-diagonal (formerly 2.8); 2.11 polarized isogeny (formerly 2.9).

All 22 internal references were remapped. They include the supplier-contract sentences ("Section 2.5 below", "Check of §2.3", "Sections 2.7, 2.9 and 2.10") and the §4.5, §5.1 and §6.1 references. Supplier section numbers were left as they are (Arakelov §2.4/§2.7, HeightsAndUnits §2.1). Every dependency edge now points backwards. No statement text changed.

## F06 (P3) — applied

Review a, finding F06.

Following "repair the pattern", I deleted 48 Check bullets that only restated a statement's quantifiers or its proof requirements. That covers all 21 lines the review cites, plus the same pattern at the former §§1.4, 1.8, 2.3, 2.4, 2.6, 2.7, 2.8, 3.4, 4.2, 4.3, 4.5, 4.7, 5.2, 5.4, 5.5, 7.2, 7.3, 8.1, 8.4 and 8.5. Every computed and negative-control bullet was kept.

Three new Checks were added:
- §8.2: the Legendre family fibre at λ=−1 (j=1728, End rank 2 against the generic rank 1).
- §8.2: the saturated inclusion ℤ→ℤ² (cokernel ℤ, ranks 1 and 2).
- §7.3, so that its definitions keep three Checks: the Gaussian commutator map, with Z₀ of rank 2, M_A=1, and a mod-2 kernel of dimension 2.

## F01 (P3) — applied

Review b, finding F01.

I verified both owners. At the InverseGaloisAndArithmeticFundamentalGroups head, IG.2.4 states Hilbert subsets, Hilbertianity of number fields and finite-extension permanence only. NeronModelsAndSemistableAbelianVarieties §6.0 does the purely transcendental and Noether-normalization extension as its own subtargets. The InverseGalois contract and the Neron §6.0 contract now say exactly this. The *Needs* lines are unchanged.

## F02 (P3) — applied

Review b, finding F02.

I verified at the AutomorphicBundles head that B5.13 is the rank-one (Tate curve) q-expansion comparison, while B5.1a `ScalarFourierJacobi.expansion` gives the scalar Fourier–Jacobi expansion in every genus. The Scope line, the AutomorphicBundles contract, and the *Needs* of §2.5 and §2.6 now cite B4.2, B4.9 and B5.1a, with B5.13 only for g=1. The plan's gap entry `fixed-siegel-cusp-family` still records the section "B4.2, B5.13": this package may only append gaps, so that entry is left for the maintainer.

## F03 (P3) — applied

Review b, finding F03.

I verified `HermitianBundle.arakelovDegree_rescale` at ArakelovGeometryAndAbelianHeights §1.3: the rescaling ‖·‖↦e^(−c)‖·‖ adds r[K:ℚ]c to the degree. The README text of gap:hermitian-metric-rescaling now cites that law and asks only for the μ̂_max consequence (−½ log c₀). The Check with c₀=4 still gives −log 2 and +log 2. The plan's `needs` text for this slug is unchanged, for the same append-only reason.

## F04 (P3) — applied

Review b, finding F04.

I verified that ArithmeticGaloisRepresentations §5.8 ("Compact subgroup charts") does not state topological finite generation. The contract sentence now says that §7.4 deduces it, since a uniform pro-ℓ group is finitely generated by definition and has finite index. §7.4's proof route now spells out that step (coset representatives plus generators). One Check was added: ℤ_ℓ^× with 1+ℓℤ_ℓ of index ℓ−1, and the negative control ∏ℤ/ℓ (no finite-index uniform subgroup, infinitely many index-ℓ open subgroups).

## Checks run

- `lake env lean packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean` exited 0. The only output was two `declaration uses 'sorry'` warnings, at lines 45 and 66.
- `#check @name` comparison: I copied the file to a scratch file, appended `#check @regularOrderDiscriminant`, `#check @class_index_bound` and `#check @elliptic_isogeny_j_height_bound`, and elaborated it once.
  - All three types carry their full binders.
  - `elliptic_isogeny_j_height_bound` now reads `∃ C, 0 < C ∧ ∀ k [Field k] [NumberField k] E₁ E₂ [IsElliptic] …, Nonempty (Isogeny …) → ∃ φ, ↑φ.degree ≤ C * ↑(finrank ℚ k)^2 * max 1 (Real.log ↑(finrank ℚ k))^2 * (1 + absLogHeight₁ E₁.j)^2`, which matches §6.1.
  - The other two declarations are unchanged and agree with §§3.1 and 3.5.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 56 roadmaps, 649 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve README.md`: no cross-roadmap citation and no Lean name found nowhere.
- Ownership: the principal quotient is owned by AbelianSchemesAndArithmeticModuli A3.11. I found it by object with `roadmaps grep` over main and the open heads. The field-degree bound has no other owner, so it stays here. No new supplier gap was needed, and no notion moved down.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.1 unified bound | D=1, j=0 (y²=x³+1); D=2, j=0; D=3; h(j)=0 junk-free | RHS C·1·1·1=C ≥ identity degree 1; 4C=36C₀ ≥ imported 4C₀; max(1, log 3)=1.0986; D≥2 form ratio (log 2)²=0.4805 | holds with C=9C₀ |
| §6.1 derivation H≤3max(1,log D)(1+h) | D=1, h=0: H≤max(1,h_F)≤3; D=e², h=0: H≤max(3,2)=3≤6 | both sides computed | holds |
| §2.8 principalization | δ=1; δ=4 (E[2]); δ=9 (E[3]); full-kernel quotient | degree 1, 2, 3 = √δ; field degrees ≤1, 3, 4; [2]^∨λ₀[2]=4λ₀ has map-degree 16≠4; height ½ log 2=¼ log 4 | holds; negative control recorded |
| §7.4 finite generation | ℤ_ℓ^× (ℓ odd); ∏ℤ/ℓ | index ℓ−1 and procyclic U; no torsion-free open subgroup, infinitely many index-ℓ subgroups | hypothesis necessary |
| §7.3 Gaussian commutator | e₁=[[0,−1],[1,0]] | ψ(f)=[[b+c,d−a],[d−a,−b−c]]; ker rank 2; M_A=1; mod-2 kernel dim 2 | consistent with the target |
| §8.2 new Checks | Legendre λ=−1; ℤ→ℤ² | End ranks 1 vs 2; cokernel ℤ, ranks 1 vs 2 | both are negative controls |
| hermitian-metric-rescaling | trivial line, c₀=4 | c=−log 2, slope −log 2, dual +log 2 | agrees with §1.3 law |

## For the maintainer

- In `design/plan.json`, the gap `fixed-siegel-cusp-family` still names section "B4.2, B5.13"; the correct section is "B4.2, B4.9, B5.1a (B5.13 for g=1)". The `needs` text of `hermitian-metric-rescaling` still asks for the full rescaling law, which the README now limits to its μ̂_max consequence. The package stage may only append to `gaps`, so neither entry was edited.
- Layer 2 subsection numbers changed: the old 2.2/2.2a/2.2b/2.3–2.9 are now 2.4/2.2/2.3/2.7/2.5/2.6/2.8/2.9/2.10/2.11. Any other roadmap that cites this package's Layer 2 by section number must be updated; the design README still uses the old numbering. No Lean name changed.
- No suspicious instructions were found in the reviews or in the fetched texts.
