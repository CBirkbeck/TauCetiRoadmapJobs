<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6901416904 -->
Review (claude) of f5ab76b

Verdict: accepted
Conditional on the announced gaps: `stack-morphism-permanence`, `flat-lfp-open`, `inertia-of-presentations`, `stack-separation-axioms`, `quasi-dm-flat-presentation`, `flat-groupoid-quotients`, `decent-algebraic-spaces`, `decent-space-schematic-locus`, `reduced-scheme-residue-field-factorisation`, `group-spaces-over-fields`, `quasi-finite-over-fields`, `isomorphism-fpqc-local-spaces`, `generic-flatness-spaces`, `reduced-regular-smooth-local`, `algebraic-stacks-satisfy-rs`, `homogeneous-quotient-scheme`

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The acceptance is conditional on the 16 declared supplier gaps listed under "Supplier
order and gaps". I changed no design file and added nothing to the manifest: every text I needed was
in the sources cache. This lane does not elaborate Lean, and a design has no `Suggested.lean`.

## Verified sound

### The round-13 finding

| Round-13 finding | Repaired passage (`packages/StackPointsAndResidualGerbes/design/README.md`) | Status |
|---|---|---|
| F01 (P3) Layer 4's Dependencies omit SchemeAndStackFoundations §1.7 | line 1381: "Layers 0–3; SchemeAndStackFoundations §§1.7–1.8, 1.12, 1.19–1.21; Mathlib …" | repaired |

The repair report marks nothing "not actionable in this package". The repaired pattern (a supplier
section named in a layer's body and absent from its Dependencies line) was recomputed by hand for
all eight layers:

| Layer | SchemeAndStackFoundations sections named in the body | Dependencies line | Equal |
|---|---|---|---|
| 0 | 1.7, 1.8, 1.14, 1.18, 1.19, 1.20, 1.22, 4.8 (4.13 through its gap) | 1.7–1.8, 1.14, 1.18–1.20, 1.22, 4.8, 4.13 | yes |
| 1 | 1.9, 1.12, 1.13, 1.14, 1.18, 1.20, 1.21 | 1.9, 1.12–1.14, 1.18, 1.20–1.21 | yes |
| 2 | 1.14, 1.16, 1.17, 1.18, 1.20, 1.21, 1.23 | 1.14, 1.16–1.18, 1.20–1.21, 1.23 | yes |
| 3 | 1.8, 1.18, 1.19, 1.20, 1.21 | 1.8, 1.18–1.21 | yes |
| 4 | 1.7, 1.8, 1.12, 1.19, 1.20, 1.21 | 1.7–1.8, 1.12, 1.19–1.21 | yes |
| 5 | 1.19, 1.20 | 1.19–1.20 | yes |
| 6 | 1.14, 1.20, 1.21 | 1.14, 1.20–1.21 | yes |
| 7 | 1.20, 1.21, 1.22, 4.8 | 1.20–1.22, 4.8 | yes |

The layer-level lines of "How to read the build" also agree with the *Needs* lines: Layer 3 names no
target of Layer 1, Layer 5 none of Layer 1, and the Layer 7 list recomputed from the four *Needs*
lines is `{0.2, 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}`, as written at line 488.

### Adversarial pass (values computed in this round)

The README was read in full (2076 lines). `X₀ = Spec ℚ(t)/ℤ` (`t ↦ t + 1`); `X₁ = U/G` is Example
100.11.6; `𝒳₄ = [Spec ℂ/(ℤ/4)]` over `ℝ`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.2 rigidity (sampled) | `T → Spec k` mono, `V ⊆` atlas affine; `Spec k → Spec k[ε]`; `Spec ℚ̄ → X₁` | `V ×_T V = V ×_{T×_k T}(V ×_k V) = V ×_k V`, so `pr₁` étale and `V → Spec k` étale by descent along itself (flat, surjective, affine); target not a field: mono, nonempty, not iso; `U ×_{X₁} Spec ℚ̄ = G × Spec ℚ̄` discrete versus `U` profinite | holds; field target needed, one-point target not enough |
| 0.2 Checks | `Spec k → BG`; `Spec ℂ → Spec ℝ` | self-product `G ≠ Spec k`; `Spec(ℂ ⊗_ℝ ℂ)` has 2 points | holds |
| 1.1 Check at `η` (headline) | `K = k(t)`; `ℤ_(p) → ℚ` | integral equation for `1/t` times `tⁿ` gives `1 ∈ (t)`, false; `ℚ = ℤ_(p)[1/p]` finitely generated, `ℤ_(p)` not Jacobson | holds |
| 1.4 (sampled) | `B(𝔸¹/ℤ)`, characteristic 0; `Bℤ`; `B𝔾_m`; `B(ℤ/2)` | diagonal of `𝔸¹/ℤ` pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, infinitely many components over a quasi-compact base, image dense without the generic point, so not locally closed; `G_x = ⊔_ℤ Spec k` étale not quasi-compact; `G_x = 𝔾_m`, diagonal affine, not quasi-finite; `(ℤ/2)_k` finite étale | holds; six cases as Lemma 101.19.1 |
| 2.2 (sampled) | `BG`, trivial torsor; `[𝔸¹/𝔾_m]`, section `1` | `Isom = G`; `Isom(1, 1) = 1` and `[Spec k/1]` has 1 point, `[𝔸¹/𝔾_m]` has 2 | holds; gerbe hypothesis needed |
| 2.3 (sampled) | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p`; `Spec k → B𝔾_m` | smooth (Lemma 101.33.7, `X = Y`); base change to itself `μ_p → Spec 𝔽_p`, flat of degree `p`, not smooth; diagonal `Spec k → 𝔾_m` not flat | holds |
| 2.6 (sampled) | `[𝔸¹/𝔾_m]`; `[Spec k[x₀, …]/𝔾_m]`, weights `pⁱ`; `[Spec k[ε]/𝔾_m]` | stabiliser trivial on `𝔾_m`, `𝔾_m` at `0`; on the stratum `x₀ = … = x_{i−1} = 0 ≠ xᵢ` the stabiliser is `⋂_{j: x_j ≠ 0} μ_{pʲ} = μ_{pⁱ}`, trivial for `i = 0`; stabiliser `k[ε][λ^{±1}]/((λ − 1)ε)`: `λ − 1` is `ε`-torsion and nonzero modulo `ε`, not flat | holds; reducedness needed |
| 3.2 (sampled) | `Spec ℚ̄ → X₁`; `Spec k → BG`, `G ≠ 1`; `BG` | section of `X₁ → Spec ℚ̄`, so `R = Spec ℚ̄`, core `Spec ℚ̄ ≠ X₁`; not a mono (`G ≠ Spec k`); core `BG` | holds; lfp point and mono hypothesis both needed |
| 3.4 Check on `X₀` | `X₀` | fixed field of `t ↦ t + 1` on `ℚ(t)` is `ℚ`; `Spec(ℚ(t) ⊗_F ℚ(t))` finite over `ℚ(t)` versus `ℤ × Spec ℚ(t)` | holds |
| 4.1 (sampled, headline) | `1 ∈ [𝔸¹/𝔾_m]`; `η ∈ 𝔸¹_k`; `Spec ℤ_(p)` | open immersion; `𝒵_η = Spec k(t)` exists, not locally of finite type; `Spec ℚ` of finite type | holds; (1) and (3) fail together at `η` |
| 4.2 (sampled, headline) | `Bμ_p`; `𝔸¹_ℚ/ℤ`; `B𝔾_m` | atlas `Spec 𝔽_p`, `R' = μ_p` finite flat of degree `p`, `[U'/R'] = Bμ_p`; residual space at the generic point is `X₀`, not a field; stabiliser `𝔾_m` not quasi-finite | holds; sufficient, not necessary |
| 4.3 (sampled, headline) | `[𝔸¹/𝔾_m]` at `1`; `Bℤ`; `B(𝔸¹/ℤ)` | closure of `1` is `|𝒳|`, any nonempty open of it contains `1`, dense open gerbe `Spec k`; inertia `⊔_ℤ`, first statement applies; inertia quasi-compact (image of `𝔸¹`), not quasi-separated | holds |
| 4.4 (sampled, headline) | `X₀`; `[Spec k[x₀, …]/𝔾_m]`; `X₁` | atlas `Spec ℚ(t)` Noetherian, `𝒵 = X₀`; atlas not Noetherian, stabiliser closed in `𝔾_m × U`, 4.3 applies; `G × Spec ℚ̄ → U` locally of finite type, 4.1 applies | holds |
| 4.5 (headline) | `[𝔸¹/𝔾_m]`; DVR; `X₁` | `B𝔾_m` closed, `Spec k` open not closed; `Spec R/𝔪` closed, `Spec K` open; closed point, mono not a closed immersion | holds; locally Noetherian needed |
| 5.2 (sampled) | `id_{𝔸¹}` and `η`; `Spec k[ε] → 𝔸¹`; profinite `Y → Y/Γ` | image is the closure, no factorisation through `Spec k(t)`; `t ↦ ε ≠ 0`; neither decent nor locally Noetherian, no factorisation (Example 68.13.11) | holds; each hypothesis used. Step 2: `x` is the generic point of `|𝒳'|`, so it lies in every nonempty open |
| 5.3 (sampled, headline) | `t² + 1` on `𝔸¹_ℚ`; `𝒳₄`; `X₀` | `ℚ(i)`; `Hom(ℤ/2, ℤ/4) = {0, 2} ↦ {0, 0}` in `Hom(ℤ/2, ℤ/2)`, so no object over `ℝ`, `κ = ℝ`; base `X₀` not a field | holds; decency needed |
| 5.4 (sampled) | `[𝔸¹/𝔾_m]`; `η ∈ 𝔸¹`; glued `Spec k[x₁, …]`; `𝔸¹_ℚ/ℤ` | `B𝔾_m/Spec k`, `Spec k`; `𝒵 = Z = 𝔸¹`, `𝒵_ξ = Spec k(t)` affine over `𝔸¹`, not an immersion; preimage of the other copy `⋃D(xᵢ)` not quasi-compact; coefficient of `t^{d−1}` in `P(t + n)` is `a_{d−1} + dn ≠ a_{d−1}`, no finite stable set, no proper nonempty open | holds; second statement's quasi-compactness: `𝒵 ×_𝒳 T → 𝒵 × T` quasi-compact and `|𝒵 × T| ≅ |Z × T|` |
| 5.5 | `Spec κ(t) → Spec κ`; `Spec k̄ → BG_k` | a closed point of an fppf cover has residue field finite over `κ`, which cannot contain `κ(t)` or an infinite `k̄` | holds |
| 6.2 (headline) | `BG_k`; `𝒳₄` over `ℂ`; `X₀` | three products `BG`, `Spec k`, `G`; stabiliser `ker(ℤ/4 → ℤ/2) = ℤ/2`; `X₀ ×_{X₀} Spec ℚ(t) = Spec ℚ(t) = B1` | holds |
| 6.3 (headline) | `(t, −1)` over `ℚ(t)`; `σ : t ↦ t²` | tame symbol at `t = 0`: `(−1)^{1·0} t⁰/(−1)¹ = −1 ∉ ℚ^{×2}`; `σ^*A = (t², −1)` split, `σ` not surjective | holds |
| 6.4 (headline) | `Bμ_p/𝔽_p(t)`; `Spec k → Spec κ`, `k ≠ κ`; origin of `Spec k[x₀, …]` | `𝒵 = Bμ_p = BG_x`; no `p` with `p ∘ x = id`; closed immersion, locally of finite type, `𝒵 = Spec k`. Route: `Spec k → 𝒵_x^♭` is a section of a morphism of spaces, a mono, into a space with an lfp flat point (3.1), so 3.2 applies | holds |
| Convention 5 (sign) | `[𝔸¹/𝔾_m]`, arrow `(λ, bε) : bε → λbε` of the action groupoid | `φ : τ_b ≅ τ_{λb}` restricts to `λ`; `(τ_b, α ∘ λ⁻¹) ≅ (τ_{λb}, λ ∘ α ∘ λ⁻¹) = (τ_{λb}, α)`: weight `+1`; conormal `k·t` weight `−1`, dual `+1` | holds; the right action would give `−1` |
| 7.3 (sampled, headline) | `Bμ_p`; `B𝔾_m`; `[𝔸¹/μ_p]` at `0`; cusp | `(dim T_{BG}, dim T, dim N)` = `(1, 1, 0)`, `(0, 0, 0)`, `(1, 2, 1)`, `(0, 2, 2)`; torsors `z^p = 1 + aε`, map `t ↦ bεz`, framed isomorphisms `z ↦ (1 + cε)z` fix `(a, b)` since `(1 + cε)^p = 1` and `ε² = 0`; `dim T_{BG_x} = (n² − dim G_x) − (n² − dim Lie G_x)` | holds; exact in each case |
| 7.4 (sampled) | `SL₂` on quadratic forms at `uv`, characteristic ≠ 2; `𝔾_m` on `𝔸¹` at `1`; `E × 𝔾_m`; `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` | swap `u ↦ bv, v ↦ cu` has determinant `−bc = 1`, sends `uv ↦ −uv`: stabiliser the torus, orbit of dimension `3 − 1`, `d(b² − 4ac) = 2 db ≠ 0` at `(0, 1, 0)`, `N` of dimension 1; orbit `𝔾_m` not closed; `Stab = 1 × 𝔾_m`, `N = k∂_t`; `(n, t) ↦ (t, t + n)` not quasi-compact, `N = ℚ∂_t` | holds; closed orbit needed, quasi-separatedness and affineness of `G` not |
| Worked example (zero-dimensional DM) | `Bℤ` over `K`; `B(ℤ/2)` | `G_x = ℤ` infinite, diagonal not quasi-compact; finite type representative has `k` finite over algebraically closed `K`, so `k = K` | holds |

The remaining targets (0.1, 0.3–0.5, 1.2, 1.3, 2.1, 2.4, 2.5, 3.1, 3.3, 3.5, 5.1, 6.1, 7.1, 7.2) were
read in full with their Checks; values recomputed while reading: 0.1 (`𝔾_m → Bμ_p` pulls back to
`𝔾_m` over `Spec k`, smooth, while `μ_p = Spec 𝔽_p[λ]/(λ − 1)^p` is nonreduced); 0.4 (lengths
`1, 2, 3` of `k[t]/(t^{n+1})`; `(t) ⊗_{k[t]} k = k·t ↦ 0`); 1.2 (`H¹(ℝ, ℤ/2)` has 2 classes over 1
point; `ι ≠ ι ∘ σ` on `ℚ(i)`); 2.5 (`Bℤ` diagonal pulls back to `⊔_ℤ Spec k`); 3.1 (ideal of the
diagonal point of `Spec(ℚ̄ ⊗_ℚ ℚ̄)` not finitely generated, point not open); 5.1
(`D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁}, …, x_{iₙ}) ∈ D(x_j)`); 7.1 (`k[x, y]/(x, y)²` of length
3; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0`). None failed, and no Check contradicts a theorem of its section.

### Sources: the seeded sample

All fifteen targets were read at their locators. Numbers, hypotheses and statements agree. The
author flags no locator as unverified.

| Target | Text read | Result |
|---|---|---|
| 0.2 | stacks-04XE lines 707–762; stacks-morphisms-spaces lines 904–907; stacks-06RD lines 445–451, 591–608; alper-moduli lines 6955–6957; stacks-06ML lines 1238–1256 | agrees (Definition 100.8.1, Lemmas 100.8.2–100.8.6, 67.10.8, 101.4.15, 101.5.6); the rigidity route (descent of étaleness) is not the source's (a dense open subscheme) |
| 1.4 | stacks-06RD lines 1667–1689 | agrees (six cases, `(1)⇒(4)`, `(2)⇒(5)`, `(3)⇒(6)`) |
| 2.2 | stacks-06QB lines 2664–2672 | agrees (Lemma 101.28.6 (1)–(3)) |
| 2.3 | stacks-06QB lines 2696–2716; stacks-06RD lines 3335–3357 | agrees (Lemmas 101.28.7, 101.28.8, 101.33.7, 101.33.8) |
| 2.6 | stacks-06QB lines 2919–2953 | agrees (Proposition 101.29.1, Example 101.29.2); "largest" is the README's addition and follows from 2.4 |
| 3.2 | stacks-06ML lines 1199–1256 | agrees (Lemmas 100.11.4, 100.11.5, Example 100.11.6) |
| 4.1 | stacks-06RD lines 1545–1572, 1609–1622 | agrees (Lemmas 101.18.1, 101.18.7 (1)–(3); `u ×_𝒳 u` is the proof's groupoid) |
| 4.2 | stacks-06RD lines 3059–3095 | agrees (Lemma 101.31.2 and its proof) |
| 4.3 | stacks-06QB lines 2893–2904; stacks-06RD lines 3048–3056 | agrees (Lemmas 101.28.15, 101.31.1) |
| 4.4 | stacks-06RD lines 3096–3129 | agrees (Lemma 101.31.3) |
| 5.2 | stacks-06RD lines 4842–4865; stacks-decent-spaces lines 1565–1608 | agrees (Lemma 101.51.2 (1)–(4), Lemmas 68.13.9–68.13.10, Example 68.13.11); the descent the README supplies at step 3 is the one the source omits |
| 5.3 | stacks-decent-spaces lines 1225–1227, 1542–1552; alper-moduli lines 6962–6965, 16528–16537; rydh2011 lines 1268–1277 | agrees |
| 5.4 | stacks-06RD lines 4786–4814; rydh2011 lines 1268–1305 | agrees (Definition 101.50.1, Lemma 101.50.2 (2), Theorem B.2 (i)–(iii)); "affine" in the first statement is the README's, proved in its route |
| 7.3 | ahr2020 lines 39–43, 475–484; alper-moduli lines 6859–6862, 6948–6951 | agrees; the source states the isomorphism for smooth `G_x` only, as the README says |
| 7.4 | ahr2020 lines 475–486 | agrees; quasi-separatedness is the source's and is named |

Also read: stacks-06ML lines 1352–1368 (3.5, "one representative"); stacks-04XE lines 1453–1462 and
stacks-06RD lines 4684–4735 (5.1); stacks-06RD lines 1527–1528 (Lemma 101.17.8, 6.4) and 4831–4878
(Lemmas 101.51.1, 101.51.4, Remark 101.51.3); alper-moduli lines 6993–7001 and 16539–16549 (6.2–6.4);
ahr2020 lines 246–252 (7.1, `I^{n+1}`).

### Pinned declarations

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. All 43 locations of the two contracts were opened at
the pins in this round, and each holds the named declaration on the cited line: the 25 Mathlib
locations from `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` to
`Mathlib/RingTheory/Smooth/Basic.lean:290`, among them
`Mathlib/RingTheory/Jacobson/Ring.lean:691` (`[Field S]`),
`Mathlib/AlgebraicGeometry/Noetherian.lean:271`,
`Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean:48` and
`Mathlib/RingTheory/Smooth/Kaehler.lean:324`; and the 18 Tau Ceti locations, among them
`TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`,
`TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:68, 74, 113, 195`,
`TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:68` (extends `IsLocallyNoetherian`) and `:90`,
`TauCeti/AlgebraicGeometry/Scheme/Regular/Descent.lean:56`,
`TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212`,
`TauCeti/Algebra/AlgebraicGroup/Tangent/Regularity.lean:112` (`[Algebra.FiniteType k H]`),
`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:217` and `Torsor.lean:154, 160`.
`TauCeti/AlgebraicGeometry/Stack` holds `Basic.lean` only, and a search of both libraries for
residual gerbes, gerbes, algebraic stacks, decent spaces and closed substacks finds no carrier of
this roadmap.

### Duplication, ownership and overlaps

- **SchemeAndStackFoundations.** The 19 cited sections exist on main (§1.2 at README line 2819 …
  §4.13 at 6951), and the 48 names of the contract I searched all occur there (script). The open revision of
  that roadmap keeps the same 19 headings (diff of the heading lists: equal), so no citation moves.
- **AlgebraicModuliForArithmeticGeometry at its open head.** §4.1 (line 1863), §5.4 (8675), §8.1
  (9650), §8.3 (9726) and the 12 cited names resolve.
- **ReductiveGroups.** Layers 1, 3 and 3A exist under those names on main (lines 1275, 1537, 1683)
  and at the open revision's head. Layer 3 leaves the representability of `G/H` "a theorem with
  hypotheses" and proves the normal case only, so gap:homogeneous-quotient-scheme asks for nothing
  it has. GroupSchemesOverABase 4.1 (open, not in the merge order) states representability for
  groups of finite type without smoothness or dimension of `G/H`, and itself names ReductiveGroups
  Layer 3 as the owner of the affine case: the gap is addressed to that owner.
- **Gaps against suppliers.** "quasi-DM", "decent" and "schematic locus" occur nowhere in
  SchemeAndStackFoundations (main or revision) or in SchemeAndStackFoundationsPartII (whose scope is
  flat cohomology); §1.20 on main defines no quasi-separated stack, monomorphism or substack; (RS)
  is a hypothesis in AlgebraicModuliForArithmeticGeometry §8.1 (lines 9659, 9670). No gap asks for
  what is provided.
- **Search by object** over all open heads and main (residual gerbe, closed substack, quasi-DM,
  decent space or stack, finite type point, reduced induced substack, dense open gerbe): users only
  (FunctionFieldArithmeticPartII, LanglandsParameterStacks,
  AlgebraicModuliForArithmeticGeometry §5.4, VirtualFundamentalClass §2.1, and others that mention
  closed substacks of their own moduli stacks); none defines these objects.
- **Consumers.** LanglandsParameterStacks (README lines 523–524), FunctionFieldArithmeticPartII
  (lines 53, 7366) exist at their open heads; MotivicStructuresInModuliOfCurves and
  VirtualFundamentalClasses are board packages at merge-order lines 350 and 408, after this roadmap,
  and are named as consumers only. That explains the one cross-roadmap lead of
  `scratch/citations.md`; its nine "Lean names found nowhere" are supplier names in dotted form and
  all occur in the supplier's README.
- **Overlap facts of `scratch/overlaps.md`.** No id dropped, none defined only by a revision, no
  conflicting head, no second copy; each was confirmed above.

Overlap check: read SchemeAndStackFoundations (main and its open revision),
AlgebraicModuliForArithmeticGeometry, GroupSchemesOverABase, VirtualFundamentalClass,
FunctionFieldArithmeticPartII (by search), EquivariantIntersectionTheory, and
SchemeAndStackFoundationsPartII; nothing shared.

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 241 roadmaps, 2244 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in the README ("What … must provide
(gap:…)") and in `design/plan.json` (script), each with a named supplier and section, each `needs`
naming its statements with Stacks Project or SGA 3 numbers: stack-morphism-permanence,
flat-lfp-open, inertia-of-presentations, stack-separation-axioms, quasi-dm-flat-presentation,
flat-groupoid-quotients, decent-algebraic-spaces, decent-space-schematic-locus,
reduced-scheme-residue-field-factorisation, group-spaces-over-fields, quasi-finite-over-fields,
isomorphism-fpqc-local-spaces, generic-flatness-spaces, reduced-regular-smooth-local,
algebraic-stacks-satisfy-rs, homogeneous-quotient-scheme. The seventeenth slug in the README,
gap:zero-dimensional-dm-residual-gerbes, is a consumer's gap quoted under "Downstream consumers".
In the plan no target has a prerequisite that is itself or a later target, and every `gap:`
prerequisite is declared (script, 38 targets).

### Shape, headlines, Lean

- Eight layers, 38 targets, 142 plan tests, at least three per target; every README section has at
  least three Checks and a *Needs* line; every layer ends with Examples and Dependencies (script).
- No LaTeX delimiters, machine paths, pull-request numbers or process words (script; the three
  hits of "lemma" are "Zariski's lemma" in prose).
- Layers are named by their mathematics, and no sentence says the roadmap follows a source.
- Headlines, from the Summary: finite type points (1.1, 4.1); existence (4.2–4.4); the gerbe over
  the residue field with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3); rational points (6.4); closed
  points (4.5); the tangent–normal sequence (7.3). None is statable at the pins, where no algebraic
  stack exists; the package's module docstring must say so.
- A design has no `Suggested.lean`: no padding probe and no `#check` comparison. Elaboration: not
  available (this lane does not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and six proof plans (0.2's
rigidity against stacks-morphisms-spaces lines 906–907; 3.2's against stacks-06ML lines 1202–1213;
4.2's against stacks-06RD lines 3061–3095; 5.2's three reductions against stacks-06RD lines
4850–4865; 5.4's against stacks-06RD lines 4796–4807 and rydh2011 lines 1278–1305; 7.3's against
ahr2020 lines 479–484). None reproduces a source's wording. The longest shared runs are forced
statements of under a dozen words ("either … is empty or … is an equivalence"). 0.2, 5.4 and 7.3
take routes the sources do not (descent of étaleness; the dense open gerbe in place of Rydh's
generic flatness; the chart computation with `GLₙ/G_x`). No table, figure or exercise list is taken
over.

Arrangement: Chapter 101 is spread over Layers 0 (§§4–5, 17), 1 (§§18–19), 2 (§§28, 29, 33), 3
(§§4, 28, 51), 4 (§§18, 28, 31, 51) and 5 (§§48, 50, 51), and Chapter 100's §11 sits in Layer 3
after Layer 2's §28 of the later chapter; Layers 6–7 are not from the Stacks Project. No run of
layers maps one to one onto a run of sections. The order 2 → 3 → 4 → 5 → 6 is forced by the *Needs*
lines (3.4 needs 2.1 and 2.3–2.5; 4.1 needs 3.2–3.4; 5.2 needs 4.2–4.4; 6.1 needs 4.1 and 5.3).

The manifest has 25 entries (23 certified, 2 uncertified); every cited work has a key. The entry
`rydh2015` is cited nowhere and says so in its `cited_for`.

Source independence: 21 passages compared with 7 source texts, none shared; largest share
stacks-06RD, 28 of 126 "lines N" locators (46 with stacks-06QB, the same chapter); contents compared
with the section lists of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- VirtualFundamentalClasses and MotivicStructuresInModuliOfCurves have no open pull request and are
  not in the board-packages index; their consumer lines were read against the package folders as
  this checkout holds them, which may not be their latest heads.
- FunctionFieldArithmeticPartII was searched by object, not read in full.

## Source issues

- **Misprint** in stacks-04XE at Lemma 100.8.5, printed page 16: the proof writes the 2-isomorphism and its lift with the first point on both sides; it should have the second point composed with the second field map as target; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.48.2, printed page 98: the proof says the diagonal "is on known" to be quasi-compact; it should be "is only known"; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.1, printed page 101: that a stack smooth over a reduced, locally Noetherian stack is again so is left as omitted details; it should cite smooth-locality of both properties and Lemma 101.17.5; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: that the base of a locally Noetherian gerbe is locally Noetherian is left as omitted details; it should cite descent along the smooth surjective gerbe morphism (Lemma 101.33.8); affects nothing.
- **Gap** in stacks-06QB at Lemma 101.28.15, printed page 62: that the reduction of a locally Noetherian stack is locally Noetherian is left as omitted details; it should cite Lemmas 101.17.4–101.17.5; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for seven line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editors' online re-edition (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5 and says that package consumes (design README line 54); only that package can change.
- **Ownership.** FunctionFieldArithmeticPartII (open head, README line 53) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations and states it without the quasi-compact diagonal that `Bℤ` shows necessary; this design's worked example proves the corrected statement.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f5ab76b63650435c2d2ebb41e496785db3d58f7d", "job": "REV-DESIGN-StackPointsAndResidualGerbes~14", "model": "fable", "worker": "chris-x30"} -->
