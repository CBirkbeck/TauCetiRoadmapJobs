<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6899275434 -->
Review (claude) of 3ce8b87

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 7.3 does not state the injectivity its "iff" and the Summary's sequence use

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1818`–1821: "surjective, with
   kernel the image of `T_{BG_x}` under `i`; that `T_{BG_x} = 0` iff `G_x` is smooth; hence `θ_x` is an
   isomorphism iff `G_x` is smooth"; line 25 (`0 → T_{BG_x} → T_{𝒳,x} → N_x → 0`).

   **Claim:** the listed properties give "`θ_x` is an isomorphism iff `G_x` is smooth" and the left-exact
   sequence of the Summary.

   **Witness:** from "`ker θ_x = im(T_{BG_x})`" and "`T_{BG_x} = 0` iff smooth" only "smooth ⇒ isomorphism"
   follows; the converse and the leading `0` need `T_{BG_x} → T_{𝒳,x}` injective, which no "Prove"
   clause of 7.3 (README or plan statement) states.

   **Exact repair:** in 7.3 write "surjective; that `di : T_{BG_x} → T_{𝒳,x}` is injective (`i` is a
   monomorphism, hence fully faithful on framed deformations, 0.2) with image the kernel of `θ_x`"; the
   same clause in the plan statement of 7.3. Tested on `Bμ_p` over `𝔽_p`: `i = id`, `di` is the
   identity of `T ≅ k`, `N = 0`, `ker θ = k = T_{BG_x}`, `dim Lie − dim G = 1 − 0 = 1`; and on
   `[𝔸¹/𝔾_m]` at `0`: `T_{B𝔾_m} = 0`, `θ_0` bijective. The statement is true as the route proves it
   (`ker θ_x ≅ T_{W,u}/im T_{U_x,u} ≅ T_{BG_x}`); only the clause is missing.

2. **F02** (P3) 6.2 drops the finite-type-point hypothesis of its source without saying so

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1635`–1636: "(alper-moduli lines
   16541–16549, Exercise 7.4.40 (1), for Noetherian stacks)"; the plan locator of 6.2.

   **Claim:** the locator names the hypotheses of the source that the statement drops.

   **Witness:** alper-moduli lines 16541–16542 take a Noetherian stack and a finite type point; 6.2 is
   stated for every representative of every point whose residual gerbe exists and names "Noetherian"
   only. No Check of 6.2 is at a point that is not of finite type.

   **Exact repair:** write "(…, Exercise 7.4.40 (1), for a finite type point of a Noetherian stack;
   neither hypothesis is used: the route is 2.1, 2.2 and full faithfulness of `𝒵_x → 𝒳`)", the same in
   the plan locator, and add the Check: "At the generic point `η` of `𝔸¹_k`, not a finite type point
   (1.1), and any representative `Spec K → 𝔸¹_k`, `K ⊇ k(t)`: `𝒵_η = Spec k(t)` is its own base and
   `𝒵_η ×_{k(t)} Spec K = Spec K = B1 = BG_x`, `G_x` being trivial." Tested on that instance: both sides
   are `Spec K`, for `K = k(t)` and for `K` of infinite transcendence degree alike.

3. **F03** (P3) two supplier lists omit what their targets name

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1588`–1591 (Layer 5
   `### Dependencies`: "Layers 0 and 2–4; Mathlib …; gap:…") and lines 300–303 ("`Stacks.points` with
   `.map`, `.pullbackSurjective`, `.atlasOpenSurjective`, `.ofSpace`").

   **Claim:** a layer's Dependencies line and the supplier contract list everything the *Needs* lines
   name.

   **Witness:** 5.1's *Needs* (lines 1389–1391) names SchemeAndStackFoundations §1.19
   (`IsRepresentableBySpaces`) and §1.20 (`QuasiCompactStack`); Layer 5's line names no
   SchemeAndStackFoundations section (the other seven layers do). 7.4's *Needs* (line 1885) names
   `.baseChangeImage`, absent from the §1.20 contract.

   **Exact repair:** line 1588: "Layers 0 and 2–4; SchemeAndStackFoundations §§1.19–1.20; Mathlib …";
   line 301: "`Stacks.points` with `.map`, `.pullbackSurjective`, `.baseChangeImage`,
   `.atlasOpenSurjective`, `.ofSpace`". Tested: `.baseChangeImage` is in SchemeAndStackFoundations §1.20
   on main (README line 3656), and with the addition the per-layer unions of supplier sections in the
   *Needs* lines equal the eight Dependencies lines.

Three findings, all P3 (no P1, no P2). Each carries a repair, so the verdict asks for changes: a
fix round applies R01–R03, and nothing else stands between this design and acceptance. The 16
declared supplier gaps (listed under "Supplier order and gaps") are precise, minimal and declared in
both files; none is a finding. All three round-10 findings are repaired. I changed no design file and
added nothing to the manifest: every text I needed was in the cache. This lane does not elaborate
Lean, and a design has no `Suggested.lean`.

## Verified sound

### Round-10 findings, one by one

| Round-10 finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 (P3) Layers 2, 3, 5 said to depend on Layer 1 | 479–481: "Layers 1 and 2 each use Layer 0 only and are independent of each other; Layer 3 uses 0 and 2; Layer 4 uses 0–3; Layer 5 uses 0 and 2–4; Layer 6 uses 0–5; Layer 7 uses 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5 and 6.4"; 1087 "Layer 0;"; 1235 "Layers 0 and 2;"; 1588 "Layers 0 and 2–4;" | repaired; recomputed from the *Needs* lines: 1→{0}, 2→{0}, 3→{0,2}, 4→{0–3}, 5→{0,2,3,4}, 6→{0–5}, 7→{0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4} |
| F02 (P3) Layer 7 drops quasi-separatedness silently | 1748–1753: "The source of 7.2–7.4 (ahr2020 §3.1, lines 475–476) also assumes `𝒳` quasi-separated; no statement or route of this layer uses it"; 1874–1875: "under the quasi-separated stack with affine stabilisers of lines 475–476; quasi-separatedness is not used"; Check at 1907–1915; 6.4 at 1708–1714 | repaired; plan locators of 7.2–7.4 and 6.4 and plan test `nonQuasiSeparated` agree; ahr2020 lines 475–476 read |
| F03 (P3) consumer line | 1945: "from 0.3, 0.5, 1.4, 3.3, 4.5 and 6.4"; plan `consumers`: "(0.3, 0.5, 1.4, 3.3, 4.5, 6.4)" | repaired; the worked example cites exactly these six |

No finding of the repair report is marked "not actionable in this package". Repaired patterns looked
for elsewhere: layer-level dependency statements (R03); locators that drop a source hypothesis
without naming it (R02; 5.3, 6.3, 6.4, 7.2–7.4 name theirs); consumer lists (four entries equal in
README and plan).

### Adversarial pass (values computed in this round)

`X₁ = U/G` is Example 100.11.6; `X₀ = Spec ℚ(t)/ℤ`; `Bμ_p` is over a field of characteristic `p`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.2 (sampled) rigidity and Checks | `Spec k → Spec k[ε]`; `Spec ℂ → Spec ℝ`; `Spec k → BG`, `G ≠ 1`; `x : Spec ℚ̄ → X₁`; route on `T = Spec k` | monomorphism, not an isomorphism (target not a field); `ℂ ⊗_ℝ ℂ` has 2 points, not a monomorphism; `Spec k ×_{BG} Spec k = G ≠ Spec k`; `U ×_{X₁} Spec ℚ̄ = G × Spec ℚ̄` discrete, `U` profinite; `V ×_k V → V` étale and `V → Spec k` flat, surjective, quasi-compact, so `V` étale over `k` | holds; field target needed |
| 0.5 (sampled) | `Spec k[ε]`; `[Spec k[t]/(t²)/𝔾_m]`; `t ↦ ε : Spec k[ε] → 𝔸¹`; open point of `[𝔸¹/𝔾_m]` | `Spec k`; `B𝔾_m`; image `{0}`, `t ↦ ε ≠ 0` so no factorisation through `Spec k`; `T̄ ∖ T = {0}`, open substack `Spec k`, reduced structure `Spec k` | holds; reduced source needed |
| 1.3 (sampled) | `BG` trivial torsor; `Bμ_p`; `Bμ_3` over `ℚ`; extension `k'/k` | `G_x = G`; `μ_p(𝔽̄_p) = 1`, `G_x` of length `p`; `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ_3)) = ℤ/3`; `G_{x'} = G_x ×_k k'` | holds; "`G_x(k)` trivial" is not a property of the point |
| 2.3 (sampled) | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p`; `Spec k → B𝔾_m` | smooth (Lemma 101.33.7 with `X = Y`); base change `μ_p → Spec 𝔽_p` flat, not smooth; diagonal `Spec k → 𝔾_m` not flat, so no gerbe | holds |
| 2.4 (sampled) | `[𝔸¹/𝔾_m]`; `Bμ_p`; free action | inertia over the atlas `k[t, λ^{±1}]/((λ − 1)t)`: `t`-torsion `λ − 1`, not flat; form of `μ_p`, flat finitely presented; trivial inertia | holds both ways |
| 2.6 (used by 4.3, 5.2, 5.4) | `[Spec k[ε]/𝔾_m]`; Example 101.29.2 | `B = k[ε][λ^{±1}]/((λ − 1)ε)`: `λ − 1 ∈ Ann(ε)`, `λ − 1 ∉ εB` (`B/εB = k[λ^{±1}]`), not flat; over `D(x₁)` the stabilizer is `λ^p = 1`, `(λ − 1)x₀ = 0`, not flat along `x₀ = 0`, so the open gerbe is `x₀ ≠ 0` | holds; reducedness needed |
| 3.1 (sampled) | `Bμ_p`; `Spec k[ε]`; `X₁` | fppf point; `Spec k → Spec k[ε]` not flat (`k` has `ε`-torsion); `Spec ℚ̄ → X₁` flat, locally of finite type, ideal of `Spec ℚ̄ ⊂ U` not finitely generated | holds; 100.11.2 ≠ 100.11.3 |
| 3.2 (sampled) | `Spec ℚ̄ → X₁`; `Spec k → BG`, `G ≠ 1`; `𝒵 = BG` | nonempty monomorphism, not an equivalence, `R = Spec ℚ̄`, core `Spec ℚ̄`; not a monomorphism; core `BG` | holds; fppf point needed in the first lemma |
| 3.5 (sampled) | `Spec k → BG`; `BG → Spec k`; `G = 1, ℤ/2, μ_p` | `Spec k` vs `G`; `G` vs `Spec k`: equal, 2 points vs 1, length `p` vs 1 | holds |
| 4.2 (sampled) | `Bμ_p`; `𝔸¹_ℚ/ℤ` at `η`; `B𝔾_m` | atlas `Spec 𝔽_p` quasi-finite flat, `R' = μ_p`; `U' = Spec ℚ(t)`, `R' = ⊔_ℤ Spec ℚ(t)`, quotient `X₀`, not a field; not quasi-DM, exists by 4.3 | holds; sufficient, not necessary |
| 4.4 (sampled) | `[𝔸¹/𝔾_m]` at `1`; DVR at `η`; `X₀` | `E = |𝔾_m|`, `u = 1` closed in `𝔾_m`, `R' = Spec k`; `E = {η}`, `R' = Spec K`; `R' = ⊔_ℤ Spec ℚ(t)`, `[u/R'] = X₀` | holds |
| 4.5 (headline) | `[𝔸¹/𝔾_m]`; DVR; `X₁` | `B𝔾_m` closed, `Spec k` open not closed; `Spec R/𝔪` closed, `Spec K` open; closed point with non-closed monomorphism | holds; Noetherian hypothesis needed |
| 5.2 (sampled) | `id` of `𝔸¹`; `Spec k[ε] → 𝔸¹`; Example 68.13.11; `Y → X₀` reduced | image the closure of `η`, no factorisation through `Spec k(t)`; `t ↦ ε ≠ 0`; pullback of `q` by `x` is `Γ → Spec k` with projection the orbit map, no section; `𝒵 = X₀`, trivial | holds; all four hypotheses used |
| 5.3 (sampled, headline) | `t² + 1` on `𝔸¹_ℚ`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; `H¹(ℝ, ℤ/4) = Hom(ℤ/2, ℤ/4) = {0, 2}`, both ↦ 0 in `H¹(ℝ, ℤ/2)`, no real object, `κ = ℝ`; base `X₀` not a field (`ℚ(t) ⊗_F ℚ(t)` would be finite) | holds; decency needed |
| 5.5 | `Spec κ(t) → Spec κ`; `k/κ` finite; `k̄/k` infinite | a residue field of an fppf cover is finite over `κ`, cannot contain `κ(t)`; fppf image `Spec κ`; not an fppf epimorphism | holds |
| 6.2 (headline) | `BG`, trivial torsor, `G = ℤ/2, μ_p, 1`; `[Spec ℂ/(ℤ/4)]`; `η ∈ 𝔸¹_k`, any `K ⊇ k(t)` | three products `BG`, `Spec k`, `G`; `[Spec(ℂ ⊗_ℝ ℂ)/(ℤ/4)] = [Spec ℂ/(ℤ/2)] = B(ℤ/2)_ℂ`; `Spec K = B1` | holds beyond the source's finite type points: R02 |
| 6.3 (sampled, headline) | `[Spec ℂ/(ℤ/4)]`; `𝔸¹_ℚ` at `t² + 1`; `X₀`; `(t, −1)` over `ℚ(t)` | `Spec ℂ → Spec ℝ` not an isomorphism; `ℚ(i)` yes, `ℂ` no; identity section, no representative is the base; residue at `t = 0` is `(−1)^{v(t)v(−1)} t^{v(−1)}/(−1)^{v(t)} = −1 ∉ ℚ^{×2}`, `(t², −1)` split, `σ : t ↦ t²` not surjective | holds; "identity on `κ(x)`" is needed |
| 6.4 (headline) | `Bμ_p` over `𝔽_p(t)`; `Spec k → Spec κ`, `k ≠ κ`; origin of `Spec k[x₀, x₁, …]` | `𝒵 = Bμ_p = BG_x`; `p ∘ x ≠ id`, `Spec κ ≠ Spec k`; closed immersion of finite type, not of finite presentation, `𝒵 = Spec k` | holds |
| 7.1 (sampled) | `[𝔸¹/𝔾_m]`; `𝔸²`; `BG`; `Spec k[ε]`; Artinian `A` with `𝔪^{n+1} = 0` | `[Spec k[t]/(t^{n+1})/𝔾_m]`; `k[x,y]/(x,y)²` of length 3; ideal 0; `ℐ² = 0`, so `𝒳^{[n]} = 𝒳` for `n ≥ 1`; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0` | holds; indexing `ℐ^{n+1}` |
| 7.2 (sampled) | `[𝔸¹/𝔾_m]` at `0`; `[𝔸ⁿ/GLₙ]`; `BG`; `𝔸²` | `(λ·f)(t) = f(λ⁻¹t)`: `t` of weight `−1`, `N_0` of weight `+1`; coordinates span the dual of the standard representation, `N_0 = kⁿ`; `0`; `k²` trivial | holds; Convention 5 confirmed |
| 7.3 (headline) | `Bμ_p` (`p = 2` too), `Bα_p`, `B𝔾_m`, `[𝔸¹/𝔾_m]` at `0`, cusp | `(dim N, dim T, dim Lie − dim G)` = `(0,1,1)`, `(0,1,1)`, `(0,0,0)`, `(1,1,0)`, `(2,2,0)`; `(c + dε)^p = c^p`, so the kernel of `k[ε]^×/p → k^×/p` is `{1 + aε} ≅ k` and `μ_p(k) = 1`; `(n² − dim G) − (n² − dim Lie G)` | holds; R01 for the unstated injectivity |
| 7.4 new Check | `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` over `ℚ`, `x = (0, 0)`; `SL₂` on quadratic forms at `uv` | `Stab = 1`, orbit `ℤ × {0}` closed, `(n, t) ↦ (t, t + n)` not quasi-compact, `N_x = ℚ∂_t = T_{V,x}/0`; quadric `b² − 4ac = 1` of dimension 2, swap sends `uv ↦ −uv`, `N` of dimension `3 − 2 = 1` | holds |
| Layer dependency lines | unions of the *Needs* lines | as in the F01 row; supplier sections per layer equal the Dependencies lines except Layer 5 | R03 |

For the targets outside the sample and outside the repairs (0.1, 0.3, 0.4, 1.1, 1.2, 1.4, 2.1, 2.2,
2.5, 3.3, 3.4, 4.1, 4.3, 5.1, 5.4, 6.1) I read each statement and Check in full and recomputed the
Checks; values worth recording: 1.2 (`σ ∘ id = σ = id ∘ σ` on `ℚ(i)`; `ι ≠ ι ∘ σ`); 1.4 (the union of
the lines `y = x + n` is dense in `𝔸²` without its generic point); 0.4 (`(t) ⊗_{k[t]} k = k·t ↦ 0`;
`(n+1)·2 ≥ n + 2`); 5.4 (`P(t + n) ≠ P(t)`: the coefficient of `t^{d−1}` moves by `dn`); 5.1 (the
prime `(x_{i₁}, …, x_{iₙ})` lies in `⋃ D(xᵢ)` and in no `D(x_{iⱼ})`); 4.3 (`G = 𝔸¹/ℤ` is
quasi-compact, so `BG` has quasi-compact inertia). None failed. Remark, no change asked: 4.3's
`(…)_red` is redundant, the fibre product being smooth over the reduced `𝒵^♭_x` (2.3), and agrees
with 3.4's formula.

### Sources: the seeded sample

All fifteen targets read at their locators in this round; numbers, hypotheses and statements agree.
No author-flagged unverified locator remains.

| Target | Text read | Result |
|---|---|---|
| 0.2 | stacks-04XE lines 705–762; stacks-morphisms-spaces lines 904–908; stacks-06RD lines 445–451, 591–608; alper-moduli lines 6955–6957; stacks-06ML lines 1238–1256 | agrees (Definition 100.8.1, Lemmas 100.8.2–100.8.6, 67.10.8, 101.4.15, 101.5.6); the README's rigidity route differs from the source's |
| 0.5 | stacks-04XE lines 1073–1125; stacks-06RD lines 1484–1498 | agrees (Lemmas 100.10.1–100.10.3, Definition 100.10.4, Remark 100.10.5, Lemmas 101.17.4–101.17.5) |
| 1.3 | stacks-06RD lines 497–564, 609–618, 1667–1725 | agrees; Lemma 101.19.2 has no proof there, as the README says; Lemma 101.5.4 (4) is for `Isom(x₂, x₂)` |
| 2.3 | stacks-06QB lines 2696–2721; stacks-06RD lines 3335–3357 | agrees |
| 2.4 | stacks-06QB lines 2722–2730, 2775–2790 | agrees (Proposition 101.28.9, Lemma 101.28.10 (1)–(4)) |
| 3.1 | stacks-06ML lines 1135–1198 | agrees |
| 3.2 | stacks-06ML lines 1199–1237 | agrees; `[Spec k/R]` is the proof's construction |
| 3.5 | stacks-06ML lines 1338–1368 | agrees |
| 4.2 | stacks-06RD lines 3059–3095; stacks-decent-spaces lines 1500–1541 | agrees |
| 4.4 | stacks-06RD lines 3096–3129 | agrees (`R' = p⁻¹(Z)`) |
| 5.2 | stacks-06RD lines 4842–4865; stacks-decent-spaces lines 1565–1616 | agrees; the two "details omitted" are supplied by 0.5 and 0.1 |
| 5.3 | stacks-decent-spaces lines 1225–1227, 1542–1552; alper-moduli lines 6962–6965, 16528–16538; rydh2011 lines 1268–1277 | agrees; the sources' hypotheses are named |
| 6.3 | stacks-06QB lines 2664–2672; alper-moduli lines 6996–7000, 16539–16540 | agrees |
| 7.1 | ahr2020 lines 248–252 | agrees (`I^{n+1}`) |
| 7.2 | ahr2020 lines 39–43, 474–486 | agrees |

Also read: rydh2011 lines 1236–1245 and 1278–1305; alper-moduli lines 16541–16549 (R02).

### Pinned declarations

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). Opened at file and line, under
the cited names: Mathlib `IsStack` (`CategoryTheory/Sites/Descent/IsStack.lean:49`), `fppfTopology`
(`AlgebraicGeometry/Sites/Fpqc.lean:54`), `residueField` (`ResidueField.lean:45`),
`isReduced_of_flat_of_isLocallyNoetherian` (`Geometrically/Reduced.lean:109`, with
`[IsLocallyNoetherian Y]`), `iff_locallyOfFiniteType` (`Noetherian.lean:271`), `vanishingIdeal`
(`IdealSheaf/Basic.lean:564`), `subscheme`, `subschemeι` (`IdealSheaf/Subscheme.lean:453, 470`),
`LocallyQuasiFinite` (`Morphisms/QuasiFinite.lean:72`), `jacobsonSpace`
(`Morphisms/FiniteType.lean:112`), `JacobsonSpace` (`Topology/JacobsonSpace.lean:70`), the
`DescendsAlong @Etale …` instance (`Morphisms/LocalFlatDescent.lean:48`),
`retractionKerCotangentToTensorEquivSection` (`RingTheory/Smooth/Kaehler.lean:324`), `exists_lift`
and `iff_split_injection` (`RingTheory/Smooth/Basic.lean:125, 290`),
`finite_of_finite_type_of_isJacobsonRing` (`RingTheory/Jacobson/Ring.lean:691`); Tau Ceti
`SchPseudofunctor` (`Stack/Basic.lean:37`), `IsRegular` (`Scheme/Regular/Scheme.lean:68`, extends
`IsLocallyNoetherian`), `IsRegular.of_smooth` (line 90), `of_flat_of_surjective`
(`Regular/Descent.lean:56`), `Smooth.geometricallyReduced`
(`Morphisms/Smooth/GeometricallyReduced.lean:56`), `Comodule` (`Coalgebra/Comodule/Basic.lean:50`),
`linearlyReductiveAffineGroupSchemeProperty` (`LinearlyReductive.lean:60`),
`exists_isClosedImmersion_generalLinear` (`Representation/Embedding.lean:212`),
`smooth_iff_finrank_lie_eq_ringKrullDim` (`Tangent/Regularity.lean:112`), `fppfHomogeneousQuotient`
(`Homogeneous/Basic.lean:217`), the two torsor theorems (`Homogeneous/Torsor.lean:154, 160`),
`IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`). 29 of 29 are there. Tau Ceti's
`AlgebraicGeometry/Stack` holds `Basic.lean` only, so no carrier of this roadmap exists at the pin.

### Duplication, ownership and overlaps

SchemeAndStackFoundations on main: the 19 cited sections resolve (§1.2 at README line 2819, §1.7 at
2969, §1.19 at 3612, §1.20 at 3638, §1.21 at 3744, §1.22 at 3797, §1.23 at 3829, §4.8 at 6658, §4.12
at 6921, §4.13 at 6951) and the 46 cited names occur there (script), `.baseChangeImage` included
(line 3656). The Checks this README quotes are there: §1.7 on the generic point of `𝔸¹_ℚ/ℤ`, §1.21
on `B(ℤ/2)(ℝ)`, §1.22 on `QCoh(BG)` as comodules, §1.16 `twistingBijection`, §1.12
`translationQuotient_space`. Its open revision keeps §§1.7 and 1.19–1.22 under the same numbers.
AlgebraicModuliForArithmeticGeometry at its open head: §4.1 (line 1863), §8.1 (9650), §8.3 (9726),
the 12 cited names, and the reframing `α∘g` of Convention 5 (line 9737). ReductiveGroups on main:
Layers 1, 3, 3A (lines 1275, 1537, 1683), Layer 3A over an algebraically closed field as the README
says. The nine names and one citation of `scratch/citations.md` are these supplier names and the
consumer line for the board package VirtualFundamentalClasses.

Searches over main and the open heads (residual gerbe, decent stack, closed substack, reduced
induced, finite type point, `IsGerbeOver`, dense open gerbe, normal space): users only
(LanglandsParameterStacks, FunctionFieldArithmeticPartII, AlgebraicModuliForArithmeticGeometry §5.4,
LocalGaloisDeformationRings, and single mentions); no roadmap defines any of them, and no roadmap
names this one. Neither SchemeAndStackFoundations text mentions decent spaces, quasi-DM stacks or
closed substacks, so no gap asks for what is provided. Overlap facts of `scratch/overlaps.md`: none
dropped, none defined only by a revision, no conflicting head, no second copy.

Overlap check: read SchemeAndStackFoundations (main and its open revision),
AlgebraicModuliForArithmeticGeometry, GroupSchemesOverABase, VirtualFundamentalClass,
FunctionFieldArithmeticPartII, EquivariantIntersectionTheory and SchemeAndStackFoundationsPartII;
nothing shared.

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in the README ("What … must provide
(gap:…)", by script) and in the plan, each with a named supplier and section:
stack-morphism-permanence, flat-lfp-open, inertia-of-presentations, stack-separation-axioms,
quasi-dm-flat-presentation, flat-groupoid-quotients, decent-algebraic-spaces,
decent-space-schematic-locus, reduced-scheme-residue-field-factorisation, group-spaces-over-fields,
quasi-finite-over-fields, isomorphism-fpqc-local-spaces, generic-flatness-spaces,
reduced-regular-smooth-local, algebraic-stacks-satisfy-rs, homogeneous-quotient-scheme. Their text
is unchanged since the rounds that reviewed them for precision; none is provided by a supplier
today.

### Shape, headlines, Lean

Eight layers, 38 targets, 139 Checks against 139 plan tests, at least three per target; every
*Needs* line equals its plan prerequisites in target numbers and gap slugs, and no target needs
itself or a later one (script, 0 mismatches). Every layer has Examples and Dependencies. No LaTeX
delimiters, machine paths, pull-request numbers or process words. Layers are named by their
mathematics and no sentence says the roadmap follows a source. Headlines, from the Summary: finite
type points (1.1, 4.1), existence (4.2–4.4), the gerbe over the residue field with
`𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed points (4.5), the
tangent–normal sequence (7.3). None is statable at the pins (no algebraic stack there). A design has
no `Suggested.lean`: no padding probe and no `#check` comparison were possible. Elaboration: not
available (this lane does not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and seven more (0.2's rigidity
route against stacks-morphisms-spaces lines 906–908, a different argument; 3.1's proof sentence
against stacks-06ML lines 1154–1175; 4.4's sketch against stacks-06RD lines 3098–3129; 5.2's three
reductions against stacks-06RD lines 4850–4865; 5.5 against rydh2011 lines 1236–1245; 7.2's
definition against ahr2020 lines 477–480; 6.2 against alper-moduli lines 16541–16549). A word-level
scan of the README against eight cached texts finds no shared run above 12 words; the 12-word runs
are forced statements ("the following are equivalent: `f` is a monomorphism; `f` is fully
faithful"), and ahr2020, rydh2011 and stacks-artin share no run of 8. Arrangement: Chapter 101 is
spread over Layers 0 (§§4–5, 17), 1 (§§18–19), 2 (§§28, 29, 33), 3 (§§4, 28, 51), 4 (§§18, 28, 31,
51) and 5 (§§48, 50, 51), with Chapter 100's §11 in Layer 3 after them; Layers 6–7 are not from the
Stacks Project. No run of layers maps one to one onto a run of sections, and the order 2 → 3 → 4 →
5 → 6 is forced by the *Needs* lines (3.4 needs 2.1 and 2.3–2.5; 4.1 needs 3.2–3.4; 5.2 needs 4.2–4.4; 6.1
needs 4.1, 5.3). The manifest has 25 entries and every cited work has a key; `rydh2015` is recorded
and not cited (a remark, no change asked).

Source independence: 22 passages compared with 8 source texts, none shared; largest share
stacks-06RD, 33 of 135 "lines N" locators (52 with stacks-06QB, the same chapter); contents compared
with the section lists of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- MotivicStructuresInModuliOfCurves and VirtualFundamentalClasses have no open pull request and are
  not in the board-packages index; their consumer lines were read against the board packages as
  this checkout holds them.

## Source issues

- **Misprint** in stacks-04XE at Lemma 100.8.5, printed page 16: the proof writes the 2-isomorphism as going to `f∘x1∘c2` and lifts it to `x1∘c1 → x1∘c2`; it should be `f∘x2∘c2` and `x2∘c2`; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 101: two steps (a closed substack, and the base of a gerbe, of a locally Noetherian stack are locally Noetherian) are left as omitted details; it should cite Lemma 101.17.5 and smooth descent; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for eight line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editor's online compilation of 13 October 2024 (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5 and says that package consumes (README line 54); only that package can change.
- **Ownership.** FunctionFieldArithmeticPartII (open head, README line 53) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations, while this design's worked example proves it; which roadmap that gap names is that roadmap's to change.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3ce8b876b78a711e133d2922697f15f242fe511e", "job": "REV-DESIGN-StackPointsAndResidualGerbes~11", "model": "fable", "worker": "chris-x81"} -->
