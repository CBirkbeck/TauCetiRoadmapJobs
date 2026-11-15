<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6900056421 -->
Review (claude) of a8013af

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 1.1's Check on the generic point of `𝔸¹_k` tests one representative only

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:807`–809: "The generic point of
   `𝔸¹_k` is not a finite type point: `k(t)` is not a finitely generated `k[t]`-algebra."

   **Claim:** the reason given shows that the point is not a finite type point.

   **Witness:** a finite type point needs only *some* representative locally of finite type (line 774;
   the second Check of 1.1 says so). The reason excludes the representative over `k(t)` and says nothing
   of `Spec K → 𝔸¹_k` for `K ⊋ k(t)`.

   **Exact repair:** replace the reason by: "for any representative `Spec K → 𝔸¹_k`, the map `k[t] → K`
   is injective; were `K` a finitely generated `k[t]`-algebra, it would be a finite `k[t]`-module by
   Zariski's lemma (`k[t]` is a Jacobson ring), so `k[t]` would be a field". The same sentence in the
   plan test of 1.1. Tested on `K = k(t)` and on `K = k(t)(√t)`: neither is a finite `k[t]`-module
   (`1/t` is not integral over `k[t]`), and the conclusion agrees with the fifth Check of 1.1 (the finite
   type points of `𝔸¹_k` are its closed points). The statement of the Check is true; only its reason is
   short.

One finding, P3 (no P1, no P2): R01 carries a repair, so the verdict asks for changes; nothing else
is to be repaired. The 16 declared supplier gaps are precise, minimal and declared in both files
(listed under "Supplier order and gaps"). All three round-11 findings are repaired. I changed no
design file and added nothing to the manifest: every text I needed was in the cache. This lane does
not elaborate Lean, and a design has no `Suggested.lean`.

## Verified sound

### Round-11 findings, one by one

| Round-11 finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 (P3) 7.3 did not state the injectivity of `di` | 1836–1843: "surjective; that the differential `di : T_{BG_x} → T_{𝒳,x}` … is injective with image the kernel of `θ_x`, so that `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` is exact"; the full-faithfulness argument at 1841–1843; *Needs* gains "0.2, 0.3 (injectivity of `di`)" (1867–1868); new Check 1886–1892; build paragraph line 485 lists 0.2 | repaired; plan statement, prerequisites `target:0.2`, `target:0.3` and test `A1mup` agree |
| F02 (P3) 6.2 dropped the finite-type-point hypothesis silently | 1640–1642: "for a finite type point of a Noetherian stack; neither hypothesis is used: the route is 2.1, 2.2 and full faithfulness of `𝒵_x → 𝒳`"; Checks 1661–1670; 6.3's locator 1682–1685 now names its sources' hypotheses | repaired; plan locators of 6.2 and 6.3 and tests `non_finite_type_point`, `non_noetherian` agree; alper-moduli lines 16539–16549 and 6993–6999 read |
| F03 (P3) two supplier lists omitted what the targets name | 1592: "Layers 0 and 2–4; SchemeAndStackFoundations §§1.19–1.20; Mathlib …"; 305–306: "`.pullbackSurjective`, `.baseChangeImage`, `.atlasOpenSurjective`"; 206–209: `finite_of_finite_type_of_isJacobsonRing` | repaired; `.baseChangeImage` is at SchemeAndStackFoundations README line 3656 on main; the Mathlib lemma is at `Mathlib/RingTheory/Jacobson/Ring.lean:691`, the Artinian instance at line 102 |

No finding of the repair report is marked "not actionable in this package". Repaired patterns looked
for in the rest of the design:

- A kernel stated without the matching injectivity: none (7.3 is the only exact sequence).
- A locator that drops a source hypothesis without naming it: 4.2 (cites the proof), 5.3, 5.4
  (Definition 101.50.1 and Theorem B.2 named), 6.2–6.4, 7.1–7.4 all name theirs.
- Dependency lists: by script, every *Needs* line equals its plan prerequisites in target numbers and
  gap slugs (38 of 38), no target needs itself or a later one, and the supplier sections of the
  *Needs* lines are contained in each layer's Dependencies line. The Layer 7 list of line 485,
  recomputed from the four *Needs* lines, is `{0.2, 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}`, as
  written.

### Adversarial pass (values computed in this round)

`X₀ = Spec ℚ(t)/ℤ`; `X₁ = U/G` is Example 100.11.6; `Bμ_p` is over a field of characteristic `p`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 7.3 `di` injective (repair) | framed `(τ, α)`, `(τ', α')` on `BG_x` with `β : iτ ≅ iτ'`, `β|_k ∘ iα = iα'` | `β = i(γ)` for a unique `γ` (full faithfulness); `i(γ|_k ∘ α) = i(α')` gives `γ|_k ∘ α = α'` (faithfulness) | holds |
| 7.3 `im di = ker θ_x` (repair) | `θ(τ, α) = 0` | `τ^*ℐ → εk` zero iff `τ^*ℐ → O_{k[ε]}` zero iff `τ` factors through `V(ℐ) = BG_x` (0.4's criterion) | holds, without the chart |
| 7.3 new Check `[𝔸¹/μ_p]` at `0` | torsor `z^p = 1 + aε`, map `t ↦ bεz` | `μ_p(k[ε]) = {1 + cε}` (`(c₀ + cε)^p = c₀^p`); `(vz)^p = z^p` for `v = 1 + dε`, so `a` is an invariant; `bε(1 + cε) = bε`; `T = k²`, `im di = {b = 0}`, `θ(a, b) = b`; `2 = 1 + 1`; flat atlas `𝔸¹`: trivial torsor, line `a = 0` | holds |
| 7.3 (headline) | `Bμ_p`, `B𝔾_m`, `[𝔸¹/𝔾_m]` at `0`, cusp | `(dim T_{BG}, dim T, dim N)` = `(1, 1, 0)`, `(0, 0, 0)`, `(0, 1, 1)`, `(0, 2, 2)`; `dim T_{BG} = (n² − dim G) − (n² − dim Lie G)` gives `1 − 0`, `1 − 1`, `1 − 1`, `0 − 0` | holds |
| 6.2 (headline) new Checks | `η ∈ 𝔸¹_k`, `K ⊇ k(t)`; `X₀` at its étale point | `Spec k(t) ×_{k(t)} Spec K = Spec K = B1`; `X₀ ×_{X₀} Spec ℚ(t) = Spec ℚ(t) = B1`, `ℤ × Spec ℚ(t) → Spec ℚ(t) × Spec ℚ(t)` not quasi-compact so `X₀` is not Noetherian | holds without either hypothesis of the source |
| 6.3 (headline) | `(t, −1)` over `ℚ(t)`; `[Spec ℂ/(ℤ/4)]`; `X₀` | tame symbol at `t = 0`: `(−1)^{1·0} t⁰/(−1)¹ = −1 ∉ ℚ^{×2}`; `(t², −1)` split; `Spec ℂ → Spec ℝ` not an isomorphism; identity section of `X₀ → X₀` and no representative onto the base | holds; "identity on `κ(x)`" needed |
| 6.4 (headline) | `Bμ_p` over `𝔽_p(t)`; `Spec k → Spec κ`, `k ≠ κ`; origin of `Spec k[x₀, x₁, …]` | `𝒵 = Bμ_p = BG_x`; no `p` with `p ∘ x = id`, `𝒵 = Spec κ ≠ Spec k`; closed immersion of finite type with ideal not finitely generated, `𝒵 = Spec k` | holds |
| 0.2 (sampled) | `T → Spec k` a monomorphism, `V` affine étale over `T`; `Spec k → Spec k[ε]`; `Spec ℂ → Spec ℝ`; `Spec k → BG` | `V ×_T V = V ×_k V` étale over `V`, so `V → Spec k` étale by descent along `V → Spec k`; monomorphism, not an isomorphism; `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, 2 points; `Spec k ×_{BG} Spec k = G` | holds; field target needed |
| 0.3 (sampled) | `[𝔸¹/𝔾_m]`; `η ∈ 𝔸¹_k`; `Spec k ⊔ Spec k`; `[Spec k[t]/(t²)/𝔾_m]` | invariant subschemes `{0}`, `𝔾_m`; complement of `{η}` is the infinite set of closed points, not closed; two equivalent, different open substacks; closed substack of a regular stack with nonreduced atlas | holds; the smooth-local bullet is for open substacks only |
| 1.1 (sampled) | `Spec ℤ_(p)`; `Spec ℚ̄ → Spec ℚ`; `Spec k(t) → Spec k → 𝒳`; `η ∈ 𝔸¹_k` | `ℚ = ℤ_(p)[1/p]`; `[ℚ̄ : ℚ] = ∞`; cancellation (Lemma 101.17.8) would make `k(t)` finitely generated over `k`; a finite `k[t]`-module field `K ⊇ k[t]` would make `k[t]` a field | holds; R01 for the reason given at `η` |
| 1.3 (sampled) | `BG`; `[𝔸¹/𝔾_m]`; `Bμ_p`; `Bμ_3` over `ℚ` | `G_x = G`; `G_0 = 𝔾_m`, `G_1 = 1`; `μ_p(𝔽̄_p) = 1` with `G_x` of length `p`; `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ_3)) = ℤ/3` | holds |
| 2.6 (sampled) | `[𝔸¹/𝔾_m]`; Example 101.29.2; `[Spec k[ε]/𝔾_m]` | stabilizer `k[t, λ^{±1}]/((λ − 1)t)`, flat exactly over `t ≠ 0`; stabilizer of a point with `x₀ ≠ 0` is `{λ : λ = 1}`, with `x₀ = 0 ≠ x₁` it is `μ_p`; `(λ − 1)ε = 0` and `λ − 1 ∉ εB`, not flat | holds; reducedness needed |
| 3.1 (sampled) | `Bμ_p`; `Spec k[ε]`; `X₁` | fppf point `Spec k`; `k` has `ε`-torsion, not flat; ideal of `Spec ℚ̄ ⊂ U` generated by all `a ⊗ 1 − 1 ⊗ a`, not finitely generated | holds; Lemmas 100.11.2 and 100.11.3 differ |
| 3.2 (sampled) | `Spec ℚ̄ → X₁`; `Spec k → BG`, `G ≠ 1`; `BG` | nonempty monomorphism, not an equivalence, core `[Spec ℚ̄/Spec ℚ̄] = Spec ℚ̄`; not a monomorphism; core `BG` | holds; the fppf point is needed in the first lemma |
| 3.3 (sampled) | scheme point; `[𝔸¹/𝔾_m]`; `Spec k[ε]`; open `𝒰 ∋ x` | `Spec κ(x)`; `B𝔾_m`, `Spec k`; `Spec k`, not `Spec k[ε]`; a monomorphism with image in `|𝒰|` factors through `𝒰` | holds |
| 4.1 (sampled) | `1 ∈ [𝔸¹/𝔾_m]`; `η ∈ 𝔸¹_k`; `Spec ℤ_(p)` | open immersion, of finite type; `𝒵 = Spec k(t)` exists, not of finite type; `Spec ℚ` of finite type | holds; existence alone is weaker |
| 4.3 (sampled) | `[𝔸¹/𝔾_m]`; `Bℤ`; `B(𝔸¹/ℤ)` | closure of `1` is `|𝒳|`, dense open gerbe `Spec k`; inertia `⊔_ℤ`, not quasi-compact, gerbe; `𝔸¹/ℤ` quasi-compact, not quasi-separated | holds; `(…)_red` is redundant, the product being smooth over the reduced base |
| 4.5 (headline) | `[𝔸¹/𝔾_m]`; DVR; `X₁` | `B𝔾_m` closed, `Spec k` open not closed; `Spec R/𝔪` closed, `Spec K` open; closed point with a monomorphism that is not a closed immersion | holds; locally Noetherian needed |
| 5.3 (sampled, headline) | `t² + 1` on `𝔸¹_ℚ`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; `Hom(ℤ/2, ℤ/4) = {0, 2}`, both `↦ 0` in `Hom(ℤ/2, ℤ/2)`, no real object, `κ = ℝ`; base `X₀`, not a field | holds; decency needed |
| 5.5 (sampled) | `Spec κ(t) → Spec κ`; finite `k/κ`; `k̄/k` infinite | a cover `T' → Spec κ` through `Spec κ(t)` would have a residue field finite over `κ` containing `κ(t)`; fppf image `Spec κ`; not an fppf epimorphism | holds; local finite presentation passes between `𝒵_x` and `Spec κ(x)` because the gerbe and its diagonal are flat and locally finitely presented |
| 7.1 (sampled) | `[𝔸¹/𝔾_m]`; `𝔸²`; `BG`; Artinian `A`, `𝔪^{n+1} = 0` | `[Spec k[t]/(t^{n+1})/𝔾_m]`; `k[x, y]/(x, y)²` of length 3; ideal `0`; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0` | holds; indexing `ℐ^{n+1}` as in ahr2020 line 250 |
| 7.2 (sampled) | `[𝔸¹/𝔾_m]`; `[𝔸ⁿ/GLₙ]`; `BG`; base change `k'/k` | `t` of weight `−1`, `N_0` of weight `+1`; dual of the standard representation, `N_0 = kⁿ`; `0`; preimage of `{x}` is `BG_x ×_k k' = BG_{x'}`, one point, so `x'` is closed | holds |
| 7.4 (sampled) | `GLₙ` on `𝔸ⁿ`; `𝔾_m` on `𝔸¹` at `1`; `SL₂` on quadratic forms at `uv`; `E × 𝔾_m`; `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` | orbit `{0}`, `N = kⁿ`; orbit `𝔾_m` not closed; `b² − 4ac = 1`, dimension 2, `(u, v) ↦ (v, −u)` sends `uv ↦ −uv`, `N` of dimension `3 − 2`; `Stab = 1 × 𝔾_m`, `N = k∂_t`; `Stab = 1`, `(n, t) ↦ (t, t + n)` not quasi-compact, `N = ℚ∂_t` | holds; closed orbit needed |
| Worked example (zero-dimensional DM) | `Bℤ` over `K`; `B(ℤ/2)` | `G_x = ℤ` infinite, diagonal not quasi-compact; `G_x = ℤ/2`, `𝒳_red = B(ℤ/2)` | holds; the diagonal hypothesis is needed |

For the targets outside the sample and outside the repairs (0.1, 0.4, 0.5, 1.2, 1.4, 2.1–2.5, 3.4,
3.5, 4.2, 4.4, 5.1, 5.2, 5.4, 6.1) I read each statement, route and Check in full and recomputed the
Checks. Values worth recording:

- 0.4: `(t) ⊗_{k[t]} k = k·t ↦ 0`; `(n + 1)·2 ≥ n + 2`.
- 1.4: the union of the lines `y = x + n` is dense in `𝔸²` and contains no nonempty open subset.
- 5.4: an affine morphism followed by a quasi-compact immersion is quasi-affine; `Z × T` is affine
  for affine `Z`, `T`.
- 6.1: for an arbitrary locally finite type representative, `Spec k → 𝒵_x` is locally finitely
  presented by descent along the fppf point of 4.1.
- 2.4: the stabilizer over `𝔸¹` of `[𝔸¹/𝔾_m]` has `t`-torsion `λ − 1`.

None failed.

### Sources: the seeded sample

All fifteen targets were read at their locators in this round. Numbers, hypotheses and statements
agree. No author-flagged unverified locator remains.

| Target | Text read | Result |
|---|---|---|
| 0.2 | stacks-04XE lines 703–762; stacks-morphisms-spaces lines 902–909; stacks-06RD lines 445–451, 591–596; alper-moduli lines 6953–6957; stacks-06ML lines 1238–1256 | agrees (Definition 100.8.1, Lemmas 100.8.2–100.8.6, 67.10.8, 101.4.15, 101.5.6); the README's rigidity route is its own |
| 0.3 | stacks-04XE lines 763–894; stacks-06RD lines 3551–3556 | agrees (Definitions 100.9.1, 100.9.9, Lemmas 100.9.2–100.9.12, 101.35.4); proofs of 100.9.6 and 100.9.10 are omitted there, as the README says |
| 1.1 | stacks-06RD lines 1545–1601; alper-moduli lines 6981–6987 | agrees (Lemmas 101.18.1, 101.18.3–101.18.6, Definition 101.18.2) |
| 1.3 | stacks-06RD lines 497–512, 540–556, 609–613, 1666–1725 | agrees; Lemma 101.19.2 has no proof there |
| 2.6 | stacks-06QB lines 2905–2955 | agrees (Proposition 101.29.1, Example 101.29.2 with weights `p^i`) |
| 3.1 | stacks-06ML lines 1133–1198 | agrees (Lemmas 100.11.1–100.11.3) |
| 3.2 | stacks-06ML lines 1199–1256 | agrees; `[Spec k/R]` is the proof's construction |
| 3.3 | stacks-06ML lines 1257–1310 | agrees (Lemma 100.11.7, Definition 100.11.8, Example 100.11.9) |
| 4.1 | stacks-06RD lines 1606–1665 | agrees; `[u/(u ×_𝒳 u)]` and the fppf covering are the proof's |
| 4.3 | stacks-06QB lines 2893–2904; stacks-06RD lines 3046–3062 | agrees (Lemmas 101.28.15, 101.31.1) |
| 5.3 | stacks-decent-spaces lines 1223–1228, 1540–1553; alper-moduli lines 6958–6966, 16526–16540; rydh2011 lines 1268–1280 | agrees; the sources' hypotheses (Noetherian; quasi-compact diagonal) are named |
| 5.5 | rydh2011 lines 1234–1245; stacks-06ML lines 1293–1297 | agrees |
| 7.1 | ahr2020 lines 246–252 | agrees (`I^{n+1}`) |
| 7.2 | ahr2020 lines 36–44, 472–486 | agrees |
| 7.4 | ahr2020 lines 53–61, 475–486 | agrees; the source asks `G` smooth and takes a closed point as its standing hypothesis, which the README states as the closed-orbit hypothesis |

Also read:

- stacks-06RD lines 452–456, 1525–1529, 4684–4736, 4770–4815, 4829–4880.
- stacks-06QB lines 2846–2850.
- stacks-04XE lines 1451–1462.
- stacks-sheaves-on-stacks lines 951–956 and 1062–1076.
- alper-moduli lines 6988–7001, 7015–7025 and 16541–16550.
- sga3-vi-a lines 869–896.

### Pinned declarations

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). I opened every file and line the
README's "From Mathlib" and "From Tau Ceti" contracts give, 41 locations, and each holds the named
declaration:

- Mathlib (24): `IsStack` (`IsStack.lean:49`), `fppfTopology` (`Fpqc.lean:54`), `residueField` (`:45`),
  the six morphism classes, `IsReduced` (`Properties.lean:68`), `IsLocallyNoetherian`
  (`Noetherian.lean:54`), `isReduced_of_flat_of_isLocallyNoetherian` (`:109`), `vanishingIdeal`
  (`:564`), `subscheme` and `subschemeι` (`:453, 470`), `jacobsonSpace` (`:112`), `JacobsonSpace`
  (`:70`), `iff_locallyOfFiniteType` (`:271`), the `DescendsAlong @Etale …` instance (`:48`) and its
  class (`:32`), `retractionKerCotangentToTensorEquivSection` (`:324`), `exists_lift` and
  `iff_split_injection` (`:125, 290`), `finite_of_finite_type_of_isJacobsonRing`
  (`Jacobson/Ring.lean:691`, `[IsJacobsonRing R] [Field S] [Algebra.FiniteType R S]`, with the
  Artinian instance at `:102`).
- Tau Ceti (17): `SchPseudofunctor` (`Stack/Basic.lean:37`), the four declarations of
  `AlgebraicSpace/Basic.lean` (`:68, 74, 113, 195`), `IsRegular` (`:68`), `of_smooth` (`:90`),
  `of_flat_of_surjective` (`:56`), `Smooth.geometricallyReduced` (`:56`), `Comodule` (`:50`),
  `ComoduleCat` (`:50`), `linearlyReductiveAffineGroupSchemeProperty` (`:60`),
  `exists_isClosedImmersion_generalLinear` (`Embedding.lean:212`, namespace
  `TauCeti.AffineGroupSchemeCat`, hypothesis `LocallyOfFiniteType`),
  `smooth_iff_finrank_lie_eq_ringKrullDim` (`Regularity.lean:112`, `[Algebra.FiniteType k H]` only),
  `fppfHomogeneousQuotient` (`Homogeneous/Basic.lean:217`, namespace `CommHopfAlgCat`) and the two
  torsor theorems (`Torsor.lean:154, 160`).

Tau Ceti's representability theorems for `G/H` (`Homogeneous/Coinvariants.lean:219, 255, 268`,
`GeneralLinear.lean:56`) all assume linear reductivity, or reductivity in characteristic zero, which
is reduced to it. So gap:homogeneous-quotient-scheme asks for nothing the pin has. Tau Ceti's
`AlgebraicGeometry/Stack` holds `Basic.lean` only: no carrier of this roadmap exists at the pin.

### Duplication, ownership and overlaps

- **SchemeAndStackFoundations on main.** The 19 cited sections resolve (§1.2 at README line 2819,
  §1.7 at 2969, §1.19 at 3612, §1.20 at 3638, §1.21 at 3744, §1.22 at 3797, §1.23 at 3829, §4.8 at
  6658, §4.12 at 6921, §4.13 at 6951). The 46 cited names occur there (script);
  `IsDeligneMumford.iff_unramified_diagonal` appears as `.iff_unramified_diagonal` at line 3624.
  Its open revision keeps all 19 sections under the same numbers and keeps the sampled names.
- **AlgebraicModuliForArithmeticGeometry at its open head.** §4.1 (line 1863), §8.1 (9650), §8.3
  (9726) and the 12 cited names resolve. It states (RS) as a hypothesis (lines 9659, 9670), so
  gap:algebraic-stacks-satisfy-rs is not already provided.
- **ReductiveGroups on main and in its open revision.** Layers 1, 3 and 3A exist under those names
  in both. Layer 3 takes `G/H` first as an fppf sheaf and leaves its representability by a scheme
  as a separate question (main README lines 1573–1577).
- **Consumers.** LanglandsParameterStacks §1.16 and MotivicStructuresInModuliOfCurves §§7.3, 8.4,
  8.6 exist. The one citation and nine names of `scratch/citations.md` are the consumer line for the
  board package VirtualFundamentalClasses and supplier names in dotted form.
- **Search by object** over main and the 475 open heads (residual gerbe, closed substack, reduced
  induced, finite type point, `IsGerbeOver`, decent stack, normal space): users only. No roadmap on
  main or in an open pull request defines any of these objects. VirtualFundamentalClass (open) uses
  "integral closed substacks" in its §2.1 without defining closed substacks.
- **Gaps against suppliers.** Neither SchemeAndStackFoundations text mentions decent spaces, quasi-DM
  stacks or closed substacks; its §1.20 proves algebraicity of quotients for smooth groupoids and
  §1.21 for flat groupoid schemes only. No gap asks for what is provided.
- **Overlap facts of `scratch/overlaps.md`.** None dropped, none defined only by a revision, no
  conflicting head, no second copy.

Overlap check: read SchemeAndStackFoundations (main and its open revision),
AlgebraicModuliForArithmeticGeometry, GroupSchemesOverABase (by search), VirtualFundamentalClass,
FunctionFieldArithmeticPartII, EquivariantIntersectionTheory (by search); nothing shared.

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in the README ("What … must provide
(gap:…)") and in the plan (script), each with a named supplier and section:
stack-morphism-permanence, flat-lfp-open, inertia-of-presentations, stack-separation-axioms,
quasi-dm-flat-presentation, flat-groupoid-quotients, decent-algebraic-spaces,
decent-space-schematic-locus, reduced-scheme-residue-field-factorisation, group-spaces-over-fields,
quasi-finite-over-fields, isomorphism-fpqc-local-spaces, generic-flatness-spaces,
reduced-regular-smooth-local, algebraic-stacks-satisfy-rs, homogeneous-quotient-scheme. Each `needs`
sentence names its statements with Stacks Project or SGA 3 numbers. gap:homogeneous-quotient-scheme
was checked against sga3-vi-a lines 871–894 (items (i), (ii), (ii′), (iv)(a′)–(c)).

### Shape, headlines, Lean

- Eight layers, 38 targets, 142 Checks against 142 plan tests, at least three per target.
- Every layer has Examples and Dependencies.
- No LaTeX delimiters, machine paths, pull-request numbers or process words (script).
- Layers are named by their mathematics and no sentence says the roadmap follows a source.
- Remark, no change asked: line 479, "in each case the Stacks Project treats", describes scope, not
  arrangement.
- Headlines, from the Summary: finite type points (1.1, 4.1), existence (4.2–4.4), the gerbe over the
  residue field with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed points
  (4.5), the tangent–normal sequence (7.3). None is statable at the pins: no algebraic stack exists
  there.
- A design has no `Suggested.lean`, so no padding probe and no `#check` comparison were possible.
  Elaboration: not available (this lane does not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and eight more.

- 3.4 against stacks-06RD lines 452–456 and 4831–4839.
- 4.5 against lines 4870–4878.
- 5.1 against lines 4686–4735.
- 5.2's three reductions against lines 4850–4865.
- 5.4 against lines 4790–4807 and rydh2011 lines 1268–1277.
- 6.2 against alper-moduli lines 16541–16549.
- 0.4 against stacks-sheaves-on-stacks lines 1068–1073.
- The homogeneous-quotient gap against sga3-vi-a lines 871–894.

None reproduces a source's wording. The shared runs are statements with one natural form ("the
following are equivalent: `f` is a monomorphism; `f` is fully faithful"). The proofs in 0.2, 5.2, 5.4
and 7.3 are the roadmap's own routes.

Arrangement: Chapter 101 is spread over Layers 0 (§§4–5, 17), 1 (§§18–19), 2 (§§28, 29, 33), 3
(§§4, 28, 51), 4 (§§18, 28, 31, 51) and 5 (§§48, 50, 51). Chapter 100's §11 sits in Layer 3, after
Layer 2's §28 of the later chapter. Layers 6–7 are not from the Stacks Project. No run of layers maps
one to one onto a run of sections. The order 2 → 3 → 4 → 5 → 6 is forced by the *Needs* lines (3.4
needs 2.1 and 2.3–2.5; 4.1 needs 3.2–3.4; 5.2 needs 4.2–4.4; 6.1 needs 4.1 and 5.3).

The manifest has 25 entries and every cited work has a key. `rydh2015` is recorded and not cited (a
remark, no change asked).

Source independence: 23 passages compared with 9 source texts, none shared; largest share
stacks-06RD, 28 of 126 "lines N" locators (46 with stacks-06QB, the same chapter); contents compared
with the section lists of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- VirtualFundamentalClasses and MotivicStructuresInModuliOfCurves have no open pull request and are
  not in the board-packages index. Their consumer lines were read against the package folders as
  this checkout holds them, which may not be their latest heads.
- GroupSchemesOverABase and EquivariantIntersectionTheory were searched by object, not read in full.

## Source issues

- **Misprint** in stacks-04XE at Lemma 100.8.5, printed page 16: the proof writes the 2-isomorphism as going to `f∘x1∘c2` and lifts it to `x1∘c1 → x1∘c2`; it should be `f∘x2∘c2` and `x2∘c2`; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: two steps (a closed substack, and the base of a gerbe, of a locally Noetherian stack are locally Noetherian) are left as omitted details; it should cite Lemma 101.17.5 and smooth descent; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.51.2, printed page 102: the second paragraph of the proof, having renamed the closed substack to the stack itself, still takes the dense open gerbe inside the primed stack; it should be inside the unprimed one; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for seven line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editors' online re-edition (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5 and says that package consumes (README line 54); only that package can change.
- **Ownership.** FunctionFieldArithmeticPartII (open head, README line 53) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations, while this design's worked example proves it; which roadmap that gap names is that roadmap's to change.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a8013af35de5021c0782d1f3fc4bec57d7598008", "job": "REV-DESIGN-StackPointsAndResidualGerbes~12", "model": "fable", "worker": "chris-x89"} -->
