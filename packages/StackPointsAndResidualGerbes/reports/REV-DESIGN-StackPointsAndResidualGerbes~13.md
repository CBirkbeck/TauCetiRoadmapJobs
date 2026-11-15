<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6900841917 -->
Review (claude) of 6095086

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Layer 4's Dependencies omit SchemeAndStackFoundations §1.7

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1381`: "Layers 0–3;
   SchemeAndStackFoundations §§1.8, 1.12, 1.19–1.21; Mathlib …".

   **Claim:** the line lists every supplier section Layer 4 names.

   **Witness:** 4.2's third Check (line 1307–1308) cites "the Check of SchemeAndStackFoundations §1.7 on
   the generic point of `𝔸¹_ℚ/ℤ`". The other layers list sections that only Checks cite (Layer 1: §1.12,
   §1.21; Layer 2: §1.16).

   **Exact repair:** in line 1381 write "SchemeAndStackFoundations §§1.7–1.8, 1.12, 1.19–1.21". Tested by
   script: after the change every supplier section named in the body of each of the eight layers is in
   that layer's Dependencies line. §1.7 exists on main (supplier README line 2969) and its Check on
   `𝔸¹_ℚ/ℤ` is there.

One finding (R01, P3): a repair to one Dependencies line, so the design asks for a fix round. No P1 and
no P2. The 16 declared supplier gaps (listed under "Supplier order and gaps") are contracts and are
not findings. I changed no design file and added nothing to the manifest: every text I needed was in
the cache. This lane does not elaborate Lean, and a design has no `Suggested.lean`.

## Verified sound

### Round-12 finding

| Round-12 finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 (P3) 1.1's Check on the generic point of `𝔸¹_k` tested one representative only | 810–817: "For any representative `Spec K → 𝔸¹_k` of `η`, the map `k[t] → K` is injective … hence a finite `k[t]`-module by Zariski's lemma (`k[t]` is a Jacobson ring) … and `k[t]` would be a field"; 4.1's Check 1276–1278 now cites 1.1; contract bullet 206–212 names the polynomial-ring instance and `isField_of_isIntegral_of_isField` | repaired; plan tests `A1_generic_not` (1.1) and `generic_not_ft` (4.1) carry the same reason |

The repair report marks nothing "not actionable in this package". The repaired pattern (a point's
status inferred from one representative) was looked for in every "finite type point" claim: 4.4's
Check on `U/G` and 6.2's Check on `Spec ℚ(t)/ℤ` are positive claims (one representative suffices);
6.2's Check on `η` cites 1.1. None remains.

### Adversarial pass (values computed in this round)

`X₀ = Spec ℚ(t)/ℤ`; `X₁ = U/G` is Example 100.11.6; `Bμ_p` is over a field of characteristic `p`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 Check at `η` (repair; headline) | `K = k(t)`, `k(t)(√t)`; closed point `t = a`; `ℤ_(p) → ℚ` | `ker(k[t] → K) = 0`; integral equation for `1/t` times `tⁿ` gives `1 + a₁t + … + aₙtⁿ = 0`, so `1 ∈ (t)`, false; at `t = a` the kernel is `(t − a) ≠ 0`, argument does not apply; `ℚ = ℤ_(p)[1/p]` finitely generated and `ℤ_(p)` not Jacobson, consistent with the first Check | holds; Jacobson and injectivity both used |
| 0.1 (sampled) | `B(ℤ/2)`; `[Spec k[t]/(t²)/𝔾_m]`; `Bμ_p`; `Spec k[x,y]/(xy)` | atlas `Spec k` étale, regular; atlas nonreduced; base change of `𝔾_m → Bμ_p` (torsor `λ ↦ λ^p`) along `Spec k → Bμ_p` is `𝔾_m`, smooth, while `μ_p = Spec k[λ]/(λ − 1)^p` is nonreduced; node reduced, local ring at origin of embedding dimension 2, dimension 1 | holds; a flat-lfp test would misjudge `Bμ_p` |
| 1.2 (sampled) | `B(ℤ/2)_ℝ`; `Spec ℚ(i)`; `𝔸¹_ℝ`; `ℂ(t) → ℂ` | `H¹(ℝ, ℤ/2) = ℝ^×/ℝ^{×2}` has 2 elements and `ℝ` has one endomorphism, so 2 objects over 1 point; `a = σ`, `b = id` gives `σ ∘ id = id ∘ σ`, one embedding gives `ι ≠ ι ∘ σ`; ring maps `ℝ[t] → ℝ` are `ℝ`, none hits `(t² + 1)`; generic point has a `ℂ`-representative | holds; not injective, not surjective, two embeddings needed |
| 1.4 (sampled) | `B(𝔸¹/ℤ)`, characteristic 0; `Bℤ`; `B𝔾_m`; `B(ℤ/2)` | diagonal pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`: infinitely many components over the quasi-compact `𝔸²`; image dense (infinitely many lines), without the generic point, so not open in its closure; `G_x = ⊔_ℤ Spec k` étale, not quasi-compact; `G_x = 𝔾_m` with affine diagonal (case 1) though `𝔾_m` is not quasi-finite; `(ℤ/2)_k` finite | holds; six cases as in Lemma 101.19.1 |
| 2.2 (sampled) | `BG`, trivial section; `[𝔸¹/𝔾_m]`, section `1`; `BS₃` over `ℝ`, nontrivial torsor | `Isom = G`, identity; `Isom(1,1) = 1`, `[Spec k/1] = Spec k` has 1 point, `[𝔸¹/𝔾_m]` has 2; `H¹(ℝ, S₃)` = classes of elements of order ≤ 2 = 2 classes, twisted form is nonconstant (conjugation by `(12)` swaps `(13)`, `(23)`) | holds; gerbe hypothesis needed |
| 2.3 (sampled) | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p`; `Spec k → B𝔾_m` | smooth by Lemma 101.33.7 with `X = Y`; base change to itself is `μ_p → Spec 𝔽_p`, flat of degree `p`, not smooth; flat lfp surjective, diagonal `Spec k → 𝔾_m` not flat, not a gerbe | holds |
| 3.4 (sampled) | node; `X₀`; `[𝔸¹/𝔾_m]`; non-gerbe `[𝔸¹/𝔾_m] → Spec k` | `𝒵 = Spec k`; `Spec(ℚ(t) ⊗_F ℚ(t))` finite over `ℚ(t)` versus `ℤ × Spec ℚ(t)` infinite, so `X₀ ≠ Spec F`; `B𝔾_m` over `Spec k`; pullback is the whole stack with 2 points | holds; pullback formula true for any gerbe over a stack (monomorphism, one point by 2.5, smooth over `𝒵_y`) |
| 3.5 (sampled) | `Spec k → BG`; `BG → Spec k`, `G = ℤ/2`, `μ_p`, `1`; open immersion | `Spec k` versus `G`; 2 points versus 1, length `p` versus 1, equal for `G = 1`; fibre products agree | holds; criterion fails exactly when the map is not an isomorphism |
| 4.1 (sampled, headline) | `1 ∈ [𝔸¹/𝔾_m]`; `η ∈ 𝔸¹_k`; `Spec ℤ_(p)` | open immersion; `𝒵_η = Spec k(t)` exists, not locally of finite type (row 1); `Spec ℚ` of finite type | holds; (i) and (iii) fail together at `η` |
| 4.2 (headline; R01) | `Bμ_p`; `𝔸¹_ℚ/ℤ`; `B𝔾_m` | atlas `Spec 𝔽_p`: base change `μ_p`, flat, finite of degree `p`, `U' = Spec 𝔽_p`, `R' = μ_p`, `[U'/R'] = Bμ_p`; étale atlas `𝔸¹_ℚ`, generic residual space not a field (supplier §1.7 Check); stabiliser `𝔾_m` not quasi-finite | holds; sufficient, not necessary |
| 4.3 (sampled, headline) | `[𝔸¹/𝔾_m]`; `Bℤ`; `B(𝔸¹/ℤ)` | closure of `1` is `|𝒳|`, dense open gerbe `Spec k`; inertia `⊔_ℤ`, gerbe; inertia `𝔸¹/ℤ` quasi-compact, not quasi-separated | holds; `(…)_red` as in Lemma 101.28.15 |
| 4.4 (sampled, headline) | `X₀`; `[Spec k[x₀, …]/𝔾_m]`; `X₁` | atlas `Spec ℚ(t)` Noetherian, `𝒵 = X₀`; atlas not Noetherian, stabiliser closed in `𝔾_m × U`, so affine over `U` and 4.3 applies; `Spec ℚ̄ → X₁` pulls back to `G × Spec ℚ̄ → U`, closed points, locally of finite type | holds |
| 4.5 (headline) | `[𝔸¹/𝔾_m]`; DVR; `X₁` | `B𝔾_m` closed, `Spec k` open and not closed; `Spec R/𝔪` closed, `Spec K` open; closed point with non-closed-immersion monomorphism | holds; locally Noetherian needed |
| 5.1 (sampled) | two copies of `Spec k[x₁, …]` glued along `⋃D(xᵢ)`; `𝔸¹_ℚ/ℤ → Spec ℚ`; `B𝔾_m`; `X₀` | `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁}, …, x_{iₙ}) ∈ D(x_j)`, so not quasi-compact, `X × BG → BG` representable by schemes and not quasi-separated; representable by spaces only, source not decent; affine diagonal; `Spec ℚ(t) ×_{X₀} Spec ℚ(t) = ⊔_ℤ` | holds; both alternatives of Lemma 101.48.3 needed |
| 5.3 (headline) | `t² + 1` on `𝔸¹_ℚ`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; `Hom(ℤ/2, ℤ/4) = {0, 2} ↦ {0, 0}` in `Hom(ℤ/2, ℤ/2)`, no real object, `κ = ℝ`; base `X₀` not a field | holds; decency needed |
| 6.2 (headline) | `BG_k`; `η ∈ 𝔸¹_k`, `K ⊇ k(t)`; `X₀` | three products `BG`, `Spec k`, `G`; `Spec k(t) ×_{k(t)} Spec K = Spec K = B1`; `X₀ ×_{X₀} Spec ℚ(t) = Spec ℚ(t)` | holds without the source's hypotheses |
| 6.3 (sampled, headline) | `(t, −1)` over `ℚ(t)`; `σ : t ↦ t²`; `[Spec ℂ/(ℤ/4)]`; `X₀` | tame symbol at `t = 0`: `(−1)^{1·0} t⁰/(−1)¹ = −1 ∉ ℚ^{×2}`; `σ^*A = (t², −1)` split, `σ` not surjective; `Spec ℂ → Spec ℝ` not an isomorphism; identity section, no representative onto the base | holds; "identity on `κ(x)`" and decency needed |
| 6.4 (sampled, headline) | `Bμ_p` over `𝔽_p(t)`; `Spec k → Spec κ`, `k ≠ κ`; origin of `Spec k[x₀, …]`; `1 ∈ [𝔸¹/𝔾_m]` | `𝒵 = Bμ_p = BG_x`; no `p` with `p ∘ x = id`, `𝒵 = Spec κ ≠ Spec k`; closed immersion, ideal not finitely generated, `𝒵 = Spec k`; rational, not closed, `𝒵_1 = Spec k = B1` open | holds; cancellation Lemma 101.17.8 has no hypothesis on `p`; the closed-immersion clause needs "closed" |
| 7.1 (sampled) | `𝔸²`; `[𝔸¹/𝔾_m]`; `BG`; Artinian `A` with `𝔪^{n+1} = 0` | `k[x, y]/(x, y)²` with basis `1, x, y`, length 3; `[Spec k[t]/(t^{n+1})/𝔾_m]`; ideal `0`; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0`; `(ℐ^{n+1})² = ℐ^{2n+2} ⊆ ℐ^{n+2}` since `2n + 2 ≥ n + 2` | holds |
| 7.3 (headline) | `Bμ_p`; `B𝔾_m`; `[𝔸¹/μ_p]` at `0`; cusp | `dim Lie − dim G` = `1 − 0`, `1 − 1`, `1 − 0`, `0 − 0`; `(dim T_{BG}, dim T, dim N)` = `(1, 1, 0)`, `(0, 0, 0)`, `(1, 2, 1)`, `(0, 2, 2)`; `μ_p(k[ε]) = {1 + cε}` since `(c₀ + cε)^p = c₀^p` | holds; exact in each case |
| 7.4 (sampled) | `SL₂` on quadratic forms at `uv`, characteristic ≠ 2; `𝔾_m` on `𝔸¹` at `1`; `E × 𝔾_m`; `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` | `disc(uv) = 1`, `d(b² − 4ac) = 2 db ≠ 0` at `(0, 1, 0)`; swap `u ↦ bv`, `v ↦ cu` has determinant `−bc`, so `bc = −1` and `uv ↦ −uv`: stabiliser the torus, orbit of dimension `3 − 1`, `N` of dimension `3 − 2`; orbit `𝔾_m` not closed; `Stab = 1 × 𝔾_m`, `N = k∂_t`; `(n, t) ↦ (t, t + n)` not quasi-compact, `N = ℚ∂_t` | holds; closed orbit needed, quasi-separatedness not |
| Worked example (zero-dimensional DM) | `Bℤ` over `K`; `B(ℤ/2)` | `G_x = ℤ` infinite, diagonal not quasi-compact; a finite type representative has `k` finite over algebraically closed `K`, so `k = K` and `p ∘ x = id` after composing with the inverse | holds; diagonal hypothesis needed |

For the targets outside the sample (0.2–0.5, 1.3, 2.1, 2.4–2.6, 3.1–3.3, 5.2, 5.4, 5.5, 6.1, 7.2) I
read each statement, route and Check in full; the round-12 table carries computed values for all of
them, and the text of none has changed since. Values I recomputed while reading: 0.2's rigidity
(`V ×_T V = V ×_k V`, a monomorphism with a section is an isomorphism); 0.4 (`(t) ⊗_{k[t]} k = k·t ↦ 0`);
2.6 (stabiliser `t^{pⁱ} = 1` on the stratum `x₀ = … = x_{i−1} = 0 ≠ xᵢ`, trivial for `i = 0`);
4.2 (locally quasi-finite ⇒ locally of finite type ⇒, over fields, flat and locally finitely
presented); 5.4 (coefficient of `t^{d−1}` in `P(t + n)` is `a_{d−1} + dn`); 5.5 (a closed point of an
fppf cover of a finite `k'/κ` has residue field finite over `κ`, and the two maps to `Spec κ(x)`
agree). None failed.

### Sources: the seeded sample

All fifteen targets were read at their locators. Numbers, hypotheses and statements agree. No
author-flagged unverified locator exists.

| Target | Text read | Result |
|---|---|---|
| 0.1 | stacks-04XE lines 625–665 | agrees (Lemma 100.7.1 (1)–(4) with the scheme and space clauses, Definition 100.7.2, Remark 100.7.3 items (1), (5), (8)) |
| 1.2 | stacks-06RD lines 1593–1601; stacks-04XE lines 341–350, 399–423 | agrees (Lemma 101.18.6; the equivalence of points; Definition 100.4.2) |
| 1.4 | stacks-06RD lines 1675–1689, 637–655; stacks-decent-spaces line 1754; stacks-more-groupoids-spaces lines 373–375, 548–550; stacks-spaces-over-fields lines 834–838 | agrees (six cases; Lemma 101.6.1 (2)–(5); Lemmas 68.15.2, 79.9.4, 72.10.8) |
| 2.2 | stacks-06QB lines 2664–2695 | agrees (Lemma 101.28.6 (1)–(3)); the README's sketch is shorter than and worded apart from the proof |
| 2.3 | stacks-06QB lines 2696–2721; stacks-06RD lines 3335–3357 | agrees (Lemmas 101.28.7, 101.28.8, 101.33.7, 101.33.8) |
| 3.4 | stacks-06ML lines 1308–1337; stacks-06RD lines 452–456, 4829–4841; stacks-06QB lines 2846–2861 | agrees (Lemmas 100.11.10–100.11.12, 101.4.16, 101.28.12, 101.51.1) |
| 3.5 | stacks-06ML lines 1338–1368 | agrees (Lemmas 100.11.13, 100.11.14, "one representative") |
| 4.1 | stacks-06RD lines 1606–1622 | agrees (Lemma 101.18.7 (1)–(3); `u ×_𝒳 u` is the proof's groupoid) |
| 4.3 | stacks-06QB lines 2893–2904; stacks-06RD lines 3046–3056 | agrees (Lemmas 101.28.15, 101.31.1) |
| 4.4 | stacks-06RD lines 3096–3129 | agrees (Lemma 101.31.3; `{ū} ∩ E = {u}`, `R' = p⁻¹(Z)`) |
| 5.1 | stacks-04XE lines 1451–1462; stacks-06RD lines 4684–4736; stacks-algebraic-stacks lines 106–112; stacks-decent-spaces lines 567–573, 587–589 | agrees (Lemma 100.14.1, Definition 101.48.1, Lemmas 101.48.2–101.48.5, Section 94.6, Definition 68.6.1, Example 68.6.2) |
| 6.3 | stacks-06QB lines 2664–2695; alper-moduli lines 6993–7001, 16537–16541 | agrees; the sources' hypotheses are named in the README |
| 6.4 | stacks-06RD lines 1527–1528; alper-moduli lines 6993–7001, 7015–7025, 6232–6237; ahr2020 lines 474–478 | agrees (Lemma 101.17.8; Proposition 4.5.16 (2); Definition 4.3.21 makes "noetherian" include quasi-separated) |
| 7.1 | ahr2020 lines 246–252 | agrees (`I^{n+1}`) |
| 7.4 | ahr2020 lines 474–487 | agrees; `G` smooth, the closed point standing; quasi-separatedness is the source's and is named |

Also read: stacks-04XE lines 142–150 and 200–206 (Convention 3's items (1), (2), (31));
stacks-06RD lines 4866–4878 (4.5); stacks-spaces-over-fields lines 847–851 (Lemma 72.10.9).

### Pinned declarations

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). Opened in this round, each
holding the named declaration with the hypotheses the README states:

- `Mathlib/RingTheory/Jacobson/Ring.lean:102` (Artinian ⇒ Jacobson), `:438`
  (`instance [IsJacobsonRing R] : IsJacobsonRing R[X]`), `:691`
  (`finite_of_finite_type_of_isJacobsonRing`, `[Field S] [IsJacobsonRing R] [Algebra.FiniteType R S]`);
- `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Basic.lean:675`
  (`isField_of_isIntegral_of_isField`, injective `algebraMap`, `[Algebra.IsIntegral R S]`);
- `Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean:48`; `Morphisms/FiniteType.lean:112`;
  `Noetherian.lean:271` (`[IsLocallyNoetherian Y]`);
- `TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:68, 90`; `Regular/Descent.lean:56`
  (`[IsLocallyNoetherian Y]`); `Algebra/AlgebraicGroup/Representation/Embedding.lean:212`
  (`[LocallyOfFiniteType …]`); `Tangent/Regularity.lean:112` (`[Algebra.FiniteType k H]` only);
  `AlgebraicGeometry/Stack/Basic.lean:37`. `TauCeti/AlgebraicGeometry/Stack` holds `Basic.lean` only:
  no carrier of this roadmap exists at the pin.

The other 29 locations of the two contracts were opened in round 12 at the same pins; the contracts'
text for them is unchanged.

### Duplication, ownership and overlaps

- **SchemeAndStackFoundations on main.** The 19 cited sections resolve (§1.2 at README line 2819 …
  §4.13 at 6951) and every cited name occurs there (script over the 48 names of the contract). The supplier Checks this design leans
  on exist: `B(ℤ/2)(ℝ)` in §1.21, the generic point of `𝔸¹_ℚ/ℤ` in §1.7, comodules in §1.22,
  `twistingBijection` in §1.16, `toScheme n : V(I^{n+1}) → X` in §4.8. §1.20 defines locally
  Noetherian stacks by an atlas; §1.21's `quotientStack_algebraic` is the scheme-groupoid instance.
- **AlgebraicModuliForArithmeticGeometry at its open head.** §4.1 (line 1863), §8.1 (9650), §8.3
  (9726), §5.4 (8675) and the 12 cited names resolve.
- **ReductiveGroups on main.** Layers 1, 3 and 3A exist under those names (lines 1275, 1537, 1683).
- **Consumers.** LanglandsParameterStacks §1.16 (its Check on a residual gerbe),
  FunctionFieldArithmeticPartII's gap:zero-dimensional-dm-residual-gerbes (its README line 54),
  MotivicStructuresInModuliOfCurves §§7.3, 8.4, 8.6 and VirtualFundamentalClasses §1.2 exist. The
  last two are board packages (the second at line 408 of the merge order), which is why
  `scratch/citations.md` finds VirtualFundamentalClasses on neither main nor an open pull request;
  it is named as a consumer only. The nine "Lean names found nowhere" are supplier names in dotted
  form and all occur in the supplier's README.
- **Search by object** (residual gerbe, closed substack, open substack, finite type point, reduced
  induced, decent, quasi-DM, normal space) over the supplier texts and, for "residual gerbe", over
  all open heads and main: users only (LanglandsParameterStacks, FunctionFieldArithmeticPartII).
  SchemeAndStackFoundations has none of these as a definition; AlgebraicModuliForArithmeticGeometry
  uses "closed substack" twice in §5.4 without defining it, as the README says.
- **Gaps against suppliers.** No gap asks for what its supplier, Mathlib or Tau Ceti provides
  ("decent", "quasi-DM" occur nowhere in SchemeAndStackFoundations; (RS) is a hypothesis in
  AlgebraicModuliForArithmeticGeometry §8.1).
- **Overlap facts of `scratch/overlaps.md`.** None dropped, none defined only by a revision, no
  conflicting head, no second copy.

Overlap check: read SchemeAndStackFoundations (main), AlgebraicModuliForArithmeticGeometry,
GroupSchemesOverABase (by search), VirtualFundamentalClass (by search), FunctionFieldArithmeticPartII,
EquivariantIntersectionTheory (by search); nothing shared.

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 244 roadmaps, 2236 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in the README ("What … must provide
(gap:…)") and in the plan (script), each with a named supplier and section; each `needs` sentence
names its statements with Stacks Project or SGA 3 numbers. The one further slug in the README,
gap:zero-dimensional-dm-residual-gerbes, is a consumer's gap quoted under "Downstream consumers".
Every *Needs* line equals its plan prerequisites in target numbers and gap slugs (script, 38 of 38,
ranges expanded by hand for 2.4, 3.4, 3.5, 4.1, 6.3); no target needs itself or a later one. The
Layer 7 list of line 488, recomputed from the four *Needs* lines, is
`{0.2, 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}`, as written.

### Shape, headlines, Lean

- Eight layers, 38 targets, 142 Checks against 142 plan tests, at least three per target (script).
- Every layer has Examples and Dependencies (R01 for one list).
- No LaTeX delimiters, machine paths, pull-request numbers, `lemma`, or process words (script).
- Layers are named by their mathematics; no sentence says the roadmap follows a source.
- Headlines, from the Summary: finite type points (1.1, 4.1), existence (4.2–4.4), the gerbe over the
  residue field with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed points
  (4.5), the tangent–normal sequence (7.3). None is statable at the pins: no algebraic stack exists
  there. The package's module docstring must say so.
- A design has no `Suggested.lean`: no padding probe and no `#check` comparison. Elaboration: not
  available (this lane does not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and six proof plans or remarks
(1.4's route against stacks-06RD lines 1682–1689; 2.2's against stacks-06QB lines 2672–2695; 4.4's
against stacks-06RD lines 3098–3129; 4.3's against stacks-06RD lines 3050–3056; 6.4's against
alper-moduli lines 7017–7024; 3.5's Checks against stacks-06ML lines 1352–1368). None reproduces a
source's wording; the longest shared runs are standard phrases of about six words ("surjective,
flat, and locally of finite presentation"). 6.4's route (a section of the base is a monomorphism)
is not the source's (stackification of a prestack).

Arrangement: Chapter 101 is spread over Layers 0 (§§4–5, 17), 1 (§§18–19), 2 (§§28, 29, 33), 3
(§§4, 28, 51), 4 (§§18, 28, 31, 51) and 5 (§§48, 50, 51); Chapter 100's §11 sits in Layer 3 after
Layer 2's §28 of the later chapter; Layers 6–7 are not from the Stacks Project. No run of layers
maps one to one onto a run of sections. The order 2 → 3 → 4 → 5 → 6 is forced by the *Needs* lines
(3.4 needs 2.1 and 2.3–2.5; 4.1 needs 3.2–3.4; 5.2 needs 4.2–4.4; 6.1 needs 4.1 and 5.3).

The manifest has 25 entries (23 certified, 2 uncertified) and every cited work has a key.

Source independence: 21 passages compared with 6 source texts, none shared; largest share
stacks-06RD, 33 of 127 "lines N" locators (52 with stacks-06QB, the same chapter); contents compared
with the section lists of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- VirtualFundamentalClasses and MotivicStructuresInModuliOfCurves have no open pull request and are
  not in the board-packages index; their consumer lines were read against the package folders as
  this checkout holds them, which may not be their latest heads.
- GroupSchemesOverABase, VirtualFundamentalClass and EquivariantIntersectionTheory were searched by
  object, not read in full.

## Source issues

- **Misprint** in stacks-06RD at Lemma 101.48.2, printed page 98: the proof says the diagonal "is on known" to be quasi-compact; it should be "is only known"; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.1, printed page 101: that a stack smooth over a reduced, locally Noetherian stack is again so is left as omitted details; it should cite smooth-locality of both properties and Lemma 101.17.5; affects nothing.
- **Gap** in stacks-06QB at Lemma 101.28.15, printed page 62: that the reduction of a locally Noetherian stack is locally Noetherian is left as omitted details; it should cite Lemmas 101.17.4–101.17.5; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for seven line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editors' online re-edition (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5 and says that package consumes (README line 54); only that package can change.
- **Ownership.** FunctionFieldArithmeticPartII (open head, README line 54) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations and states it without the quasi-compact diagonal that `Bℤ` shows necessary; this design's worked example proves the corrected statement.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "60950860a6eaea7620512cff28e7e3934dde981c", "job": "REV-DESIGN-StackPointsAndResidualGerbes~13", "model": "fable", "worker": "chris-x79"} -->
