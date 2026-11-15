<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6897555060 -->
Review (claude) of 0c293b1

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 0.1 needs the later target 0.3

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:500`–501 and 513; the plan's
   prerequisites of 0.1 (`target:0.3`). Quote: "0.3 and gap:stack-morphism-permanence (for the last API
   bullet: an open immersion is smooth)" and "Open substacks (0.3) of a stack with `P` have `P`."

   **Claim:** Layer 0 is built in the order 0.1, 0.2, 0.3 ("Layers 0–3 are linear", line 479).

   **Witness:** 0.1's last API bullet uses open substacks, which 0.3 defines; 0.3 needs 0.2 only (line
   613). No cycle, but a target that needs a later one. The only user of the bullet is 5.2, step 2
   (line 1413).

   **Exact repair:** move the bullet to the API of 0.3 as "an open substack of a stack with a
   smooth-local property `P` (0.1) has `P`, an open immersion being smooth"; delete "0.3 and
   gap:stack-morphism-permanence (for the last API bullet …)" from the *Needs* of 0.1 and `target:0.3`
   (and the gap, if nothing else of 0.1 uses it) from its plan prerequisites; add 0.1 to the *Needs*
   and plan prerequisites of 0.3; in 5.2 step 2 write "(0.3's API, open substacks)". Tested: afterwards
   0.1 needs no target, 0.2 none, 0.3 needs 0.1 and 0.2, 0.5 needs 0.1 and 0.3, so every in-layer edge
   points backwards; on `[𝔸¹/𝔾_m]` the open substack `Spec k` has atlas `𝔾_m ⊂ 𝔸¹`, reduced, regular
   and locally Noetherian with `𝔸¹`, as the moved bullet says.

2. **F02** (P3) 7.4 is stated for affine `G`; the source and the route need only an affine stabiliser

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1850`; the plan's hypotheses of
   7.4 ("G smooth affine group scheme over k"). Quote: "for a smooth affine group scheme `G` over `k`
   acting on a scheme `V` locally of finite type over `k`".

   **Claim:** the statement has the generality of its locator, ahr2020 lines 484–486.

   **Witness:** ahr2020 line 485 takes "a smooth group scheme", under the standing affine stabilisers
   of line 476. Instance outside the README's hypothesis: `G = E × 𝔾_m` (`E` an elliptic curve) on
   `V = E × 𝔸¹`, `x = (e, 0)`: `Stab = 𝔾_m`, orbit `E × {0}` closed, `T_V/T_{G·x} = k²/k`.

   **Exact repair:** "for a smooth group scheme `G` over `k` acting on a scheme `V` locally of finite
   type over `k`, and `x ∈ V(k)` with affine stabiliser `Stab_G(x)` (the standing hypothesis of this
   layer) whose orbit … is closed"; the same in the plan's hypotheses; add the instance as a Check.
   Tested on the instance: `[V/G] = [E/E] × [𝔸¹/𝔾_m] = [𝔸¹/𝔾_m]`, the image of `x` is the closed point
   `0`, `G_x = 𝔾_m`, `𝒵_x = B𝔾_m = [G·x/G]`, and `N_x` is the weight-one character on both sides
   (`T_V/T_{G·x} = k·∂_t`; 7.2's first Check). The route uses §1.21's `actionQuotient` (stated for group
   schemes), 6.4, 2.3 and the chart of 7.3 for `W`; none uses affineness of `G`. `GLₙ` enters only in
   7.3's computation of `T_{BG_x}`, through the affine `G_x`.

3. **F03** (P3) the third Check of 3.5 fails for the trivial group

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1213`–1214 and the plan's third
   test of 3.5. Quote: "For `BG → Spec k` the induced `BG → Spec k` is not an isomorphism, and the
   criterion fails: `Spec k ×_{BG} Spec k = G`."

   **Claim:** for every `G` (flat, locally finitely presented) the induced map is not an isomorphism.

   **Witness:** `G = 1`: `BG = Spec k`, the induced map is the identity and
   `Spec k ×_{BG} Spec k = Spec k = Spec k ×_{Spec k} Spec k`, so the criterion holds. The first Check
   of 3.5 has "with `G ≠ 1`"; this one lost it.

   **Exact repair:** "For `G ≠ 1` and `BG → Spec k`, the induced `BG → Spec k` is not an isomorphism,
   and the criterion fails: `Spec k ×_{BG} Spec k = G`, while `Spec k ×_{Spec k} Spec k = Spec k`"; the
   same in the plan's test. Tested: `G = 1` is now excluded; for `G = ℤ/2` the two sides have two
   points and one point, for `G = μ_p` in characteristic `p` length `p` and length 1.

Three findings (R01–R03, all P3; no P1, no P2), each with a written repair, so the design goes to a
fix round rather than being accepted. Nothing else stands against it: the 16 declared supplier gaps
(listed under "Supplier order and gaps") are precise, minimal and declared. All four round-8 findings are repaired. I changed no design file and added nothing
to the manifest: every text I needed was in the cache. This lane does not elaborate Lean, and a
design has no `Suggested.lean`.

## Verified sound

### Round-8 findings, one by one

| Round-8 finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 (P3) inputs of 4.4 | 1314–1320: "*Needs:* 0.2 (the fully faithful `[u/R'] → 𝒳` is a monomorphism), 0.3, 3.3, 3.4; … §1.8 (`Spaces.EtaleLocal`); Mathlib `…iff_locallyOfFiniteType` … `…vanishingIdeal` (the reduced closure of `u` in `U`)"; 210: "the case used in 3.2, 4.1, 4.2, 4.4 and 6.1" | repaired; the plan's prerequisites of 4.4 carry `target:0.2`, §1.8 and both Mathlib names; same pattern repaired in 4.1 (line 1242) |
| F02 (P3) build paragraph | 478–481: "Layer 7 uses Layers 0–4 and 6 … Layer 4 uses 3; Layer 5 uses 3 and 4; Layer 6 uses 4 and 5; Layer 7 uses 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5 and 6.4" | repaired; I recomputed the union of the four *Needs* lines of Layer 7: `{0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}` |
| F03 (P3) rigidity sketch of 0.2 | 537–544: "(stacks-morphisms-spaces lines 904–905, Lemma 67.10.8). For the proof take a nonempty affine open `V` of a scheme étale and surjective over `T` … `T → Spec k` is a monomorphism with the section `Spec k ≅ T' ⊆ T`, hence an isomorphism" | repaired; each step recomputed (table below); the Mathlib instance is at the cited line |
| F04 (P3) 17-word run in 2.3 | 981–984: "it becomes a classifying stack fppf-locally on `𝒴`: for some surjective, flat, locally finitely presented `U → 𝒴` from an algebraic space, `𝒳 ×_𝒴 U ≅ [U/G]` over `U` with `G` a flat, locally finitely presented group algebraic space over `U`" | repaired; longest run shared with stacks-06QB lines 2699–2701 is now 4 words |

No finding of the repair report is marked "not actionable in this package". The two further
rewordings of the repair (0.1's opening, line 487; gap:decent-space-schematic-locus, lines 378–381
and the plan) and the line locators added to gap:generic-flatness-spaces were read against
stacks-04XE lines 625–653, stacks-decent-spaces lines 1094–1096, stacks-morphisms-spaces lines
3050–3057 and stacks-morphisms-schemes lines 2319–2326: statements unchanged and supported ("of
finite type" there is the gap's "quasi-compact, locally of finite type"). The repaired patterns were
looked for in the rest of the design: every *Needs* line was compared by script with the plan's
prerequisites (38 targets, target numbers and gap slugs agree), and a shared-run scan was made
(below).

### Adversarial pass (values computed in this round)

`X₁ = U/G` is Example 100.11.6; `X₀ = Spec ℚ(t)/ℤ`; `Bμ_p` is over a field of characteristic `p`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.2 rigidity (new sketch) | `T = Spec k`; `T = Spec k'`, `k'/k` separable of degree 2; `k'/k` purely inseparable of degree `p`; `Spec k → Spec k[ε]`; `T` not quasi-compact | `V ×_k V = Spec k`, `T' = T`; `k' ⊗ k' = k' × k' ≠ k'`, not a monomorphism; `k' ⊗_k k'` local of length `p ≠ 1`, not a monomorphism although a universal homeomorphism; `V → Spec k[ε]` not flat, descent does not apply; one affine `V` suffices, `T = T'` from the section (`f s = id`, `f(sf) = f`, so `sf = id`) | holds; field and monomorphism both used |
| 0.3 immersions (sampled) | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹`; empty substack | invariant `{0}` ↔ `B𝔾_m`, `𝔾_m` ↔ `Spec k`; `{η}` open in its closure only if cofinitely many closed points are missing, false; `∅ ↔ ∅` | holds |
| 0.1 / 0.3 build order | *Needs* lines 495–501, 613 | 0.1 → 0.3 → 0.2 | R01 |
| 2.1 gerbes (sampled) | `BG → Spec k`; `[𝔸¹/𝔾_m] → Spec k`; `Spec k → B𝔾_m`; identity; empty stack | torsors lift and are locally isomorphic; `0`, `1` over `k̄` have stabilisers `𝔾_m`, `1`, not locally isomorphic; the automorphism `λ ≠ 1` has no lift; both conditions trivial; vacuous | holds |
| 2.3 reworded criterion | `Bμ_p → Spec 𝔽_p`; `Spec k → B𝔾_m`; `[Spec ℂ/(ℤ/4)] → Spec ℝ` | `U = Spec 𝔽_p`, `G = μ_p`; every base change is a `𝔾_m`-torsor with trivial inertia, `≅ [U/G]` forces `G = 1`, false; over `U = Spec ℂ` it is `B(ℤ/2)_ℂ`, no real point needed | holds both ways |
| 2.5 diagonal criterion (sampled) | `Spec k → B𝔾_m`; `Bμ_p → Spec 𝔽_p`; `Spec k → Spec k[ε]`; `Bℤ → Spec k` | `Δ` = unit section `Spec k → 𝔾_m`, not flat; `Δ` has fibre `(μ_p × μ_p)/μ_p ≅ μ_p`, flat, finitely presented, surjective; homeomorphism, not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k`, `Δ_{Spec k}` quasi-compact | holds; no converse claimed |
| 3.2 rigidity (sampled) | `Spec k → BG`, `G ≠ 1`; `Spec ℚ̄ → X₁`; `𝒵' = ∅` | `Spec k ×_{BG} Spec k = G`, not a monomorphism; monomorphism, not an equivalence, and `X₁` has no flat finitely presented field point; first alternative | holds; both hypotheses needed |
| 3.3 residual gerbe (sampled) | scheme point; `Spec k[ε]`; `BG`; `[𝔸¹/𝔾_m]` | `Spec κ(x)`; `Spec k`; `BG`; `B𝔾_m` and `Spec k` | holds |
| 3.5 functoriality (sampled) | `Spec k → BG`; `BG → Spec k`; `G = 1`; open point of `[𝔸¹/𝔾_m]` | `Spec k` against `G`; `G` against `Spec k`; both `Spec k`, induced map an isomorphism; `Spec k` on both sides | theorem holds; third Check: R03 |
| 4.1 (sampled, headline) | generic point of a DVR; of `𝔸¹_k`; `X₁` | `K = R[1/π]`, all three conditions hold; `k(t)` not finitely generated over `k[t]`, all three fail though `Spec k(t)` is the residual gerbe; `Spec ℚ̄ → X₁` locally of finite type, `R = Spec ℚ̄`, `𝒵 = Spec ℚ̄` | holds |
| 4.4 route inputs (F01) | `X₀`; DVR | `u = Spec ℚ(t)`, `R' = ⊔_ℤ Spec ℚ(t)`, étale hence finitely presented over the field, `[u/R'] = X₀`; `u = Spec K`, `R' = Spec K` | holds |
| 4.5 (sampled, headline) | `[𝔸¹/𝔾_m]`; DVR; `X₁` | `0`: closed, `B𝔾_m` closed; `1`: not closed, open immersion; `Spec R/𝔪` closed, `Spec K` open; point closed, `Spec ℚ̄ → X₁` not a closed immersion (it would equal the reduced `X₁`) | holds; Noetherian hypothesis needed |
| 5.1 decent stacks (sampled) | a scheme; `X₀`; `B𝔾_m`; `X × BG` for the non-quasi-separated glued `X`; `𝔸¹_ℚ/ℤ` | `Spec k ×_X V` is empty or `Spec k`; fibre `⊔_ℤ Spec ℚ(t)` over an affine; affine diagonal; first alternative of 101.48.3 only; representable by spaces, not quasi-separated, not decent | holds |
| 5.3 (sampled, headline) | `t² + 1` on `𝔸¹_ℚ`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; base `Spec ℝ`, `H¹(ℝ, ℤ/4) = {0, 2} ↦ 0` in `H¹(ℝ, ℤ/2)`, no real object; one-point base that is not a field | holds; decency needed |
| 5.4 (sampled) | `[𝔸¹/𝔾_m]` at `1`, `0`; generic point of `𝔸¹`; glued `X`; `𝔸¹_ℚ/ℤ` | `Z = Spec k`, `𝒵 = Spec k`, `B𝔾_m`; `Z = 𝔸¹`, `𝒵_ξ = Spec k(t)` affine, not an immersion; `𝒵 = Spec A` with non-quasi-compact preimage `⋃ D(xᵢ)`; `P(t + n)` has next coefficient `a + dn ≠ a`, no proper invariant closed set | holds; second statement: `|𝒵 × T| ≅ |Z × T|` affine |
| 6.1 (sampled) | `BG`; `k/κ` Galois with group `Γ`; `k/κ` purely inseparable of degree `p` | `R_x = G`; `Γ × Spec k`, `G_x = 1`, quotient `Spec κ`; `Spec(k ⊗_κ k)` one point of length `p`, pullback along the diagonal `Spec k`, `G_x = 1`, quotient `Spec κ` | holds |
| 6.2, 6.3 (headlines) | `[Spec ℂ/(ℤ/4)]`; `BG`; `(t, −1)` over `ℚ(t)` | `B(ℤ/2)_ℂ`; three products `BG`, `Spec k`, `G`; residue at `t = 0` is `−1 ∉ ℚ^{×2}`, `(t², −1)` split, `σ : t ↦ t²` not surjective | holds |
| 6.4 (sampled, headline) | `Bμ_p` over `𝔽_p(t)`; `Spec κ` with `k ≠ κ`; origin of `Spec k[x₀, x₁, …]` | `BG_x` with `G_x` not smooth; `p ∘ x ≠ id`, `𝒵 = Spec κ ≠ BG_x = Spec k`; closed immersion, not finitely presented, `𝒵 = Spec k` | holds; section of `𝒵^♭ → Spec k` is a monomorphism, 3.2 applies to the one-point base |
| 7.1 (sampled) | origin of `𝔸²`; `BG`; local Artinian `A` | `k[x, y]/(x, y)²`, length 3; `ℐ = 0`; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0` | holds |
| 7.3 (sampled, headline) | `Bμ_p` (also `p = 2`), `Bα_p`, `B𝔾_m`, `[𝔸¹/𝔾_m]` at `0`, cusp | `(dim N, dim T, dim Lie − dim G)` = `(0, 1, 1)`, `(0, 1, 1)`, `(0, 0, 0)`, `(1, 1, 0)`, `(2, 2, 0)`; `dim T = dim N + dim T_{BG_x}` each time; framed class `(aε, α) ↦ α⁻¹a`, so `α ∘ g⁻¹` gives weight `+1` and `α ∘ g` weight `−1`, against weight `+1` of `(k·t)^∨` | holds; Convention 5 confirmed |
| 7.4 | `GLₙ` on `𝔸ⁿ`; `SL₂` on quadratics at `uv` (char ≠ 2); `E × 𝔾_m` on `E × 𝔸¹` | `N₀ = kⁿ`; swap sends `uv ↦ −uv` with determinant `−1`, stabiliser the torus, `d(disc) = (0, 2, 0) ≠ 0`, `N` of dimension 1; `N` the weight-one character, `G` not affine | holds; R02 |
| Worked example (zero-dimensional DM) | `Bℤ`; `B(ℤ/2)` | one point, `G_x = ℤ` not finite; finite constant | diagonal hypothesis needed |

Degenerate inputs: the empty stack is a gerbe over the empty space and satisfies 3.2 on both sides;
`n = 0` gives `𝒳^{[0]}_𝒵 = 𝒵`; `G = 1` is the instance of R03.

### Sources: the seeded sample

All fifteen targets were read at their locators in this round; theorem numbers, hypotheses and
statements agree. No author-flagged unverified locator remains.

| Target | Text read | Result |
|---|---|---|
| 0.3 | stacks-04XE lines 765–801, 804–894 | agrees; 100.9.6 and 100.9.10 have no proof there, as the README says |
| 2.1 | stacks-06QB lines 2613–2663 | agrees (Definition 101.28.1, Lemmas 101.28.2–5) |
| 2.5 | stacks-06QB lines 2821–2890 | agrees |
| 3.2 | stacks-06ML lines 1199–1237 | agrees; `[Spec k/R]` is from the proof of 100.11.5 |
| 3.3 | stacks-06ML lines 1260–1310 | agrees |
| 3.5 | stacks-06ML lines 1338–1368 | agrees |
| 4.1 | stacks-06RD lines 1609–1665 | agrees; the "moreover" is the proof's construction |
| 4.5 | stacks-06RD lines 4866–4878, 1484–1487 | agrees |
| 5.1 | stacks-04XE lines 1453–1461; stacks-06RD lines 4686–4735; stacks-algebraic-stacks lines 106–112; stacks-decent-spaces lines 567–573, 587–589 | agrees, both alternatives of 101.48.3 |
| 5.3 | stacks-decent-spaces lines 1225–1227, 1542–1552; alper-moduli lines 6962–6965, 16528–16537; rydh2011 lines 1268–1277 | agrees; the source hypotheses (Noetherian; quasi-compact diagonal) are named |
| 5.4 | stacks-06RD lines 4786–4814, 4694–4698; rydh2011 lines 1268–1305 | agrees; affineness of `Z`, the immersion and `κ(ξ) = K(Z)` are the README's own additions, with a route |
| 6.1 | stacks-06RD lines 1617–1665, 2775–2788; stacks-06ML lines 1214–1237, 1364–1368 | agrees |
| 6.4 | stacks-06RD lines 1527–1528; alper-moduli lines 6993–7024; ahr2020 lines 476–478 | agrees; the source's extra hypotheses are named and not used |
| 7.1 | ahr2020 lines 248–252 | agrees (`I^{n+1}`) |
| 7.3 | ahr2020 lines 475–486; alper-moduli lines 6859–6881, 6948–6951 | agrees; the action's normalisation is the README's (Convention 5), see Source issues |

Also read: stacks-06RD lines 445–456, 1484–1528, 1545–1601, 1667–1725, 3048–3129, 4831–4865;
stacks-06QB lines 2696–2727, 2893–2904, 2919–2925, 2943–2953; stacks-06ML lines 1135–1198,
1312–1337; stacks-04XE lines 625–665, 707–762; stacks-morphisms-spaces lines 904–906;
rydh2011 lines 1236–1245.

### Pinned declarations

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). I opened all 41 cited
file-and-line pairs; each declaration is there under the cited name: Mathlib `IsStack`
(`CategoryTheory/Sites/Descent/IsStack.lean:49`), `fppfTopology` (`AlgebraicGeometry/Sites/Fpqc.lean:54`),
`residueField` (`ResidueField.lean:45`), the six morphism classes, `IsReduced`, `IsLocallyNoetherian`,
`isReduced_of_flat_of_isLocallyNoetherian` (`Geometrically/Reduced.lean:109`, with
`[IsLocallyNoetherian Y]`), `vanishingIdeal`, `subscheme`, `subschemeι`, `jacobsonSpace`,
`iff_locallyOfFiniteType` (`Noetherian.lean:271`, `[IsLocallyNoetherian Y]`), the instance
`DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)` (`Morphisms/LocalFlatDescent.lean:48`),
`DescendsAlong` (`CategoryTheory/MorphismProperty/Descent.lean:32`),
`retractionKerCotangentToTensorEquivSection` (`RingTheory/Smooth/Kaehler.lean:324`),
`Algebra.FormallySmooth.exists_lift` and `iff_split_injection` (`Smooth/Basic.lean:125, 290`),
`finite_of_finite_type_of_isJacobsonRing` (`Jacobson/Ring.lean:691`); Tau Ceti `SchPseudofunctor`,
the four algebraic-space declarations, `IsRegular` (extends `IsLocallyNoetherian`), `of_smooth`,
`of_flat_of_surjective` (`[IsLocallyNoetherian Y]`), `Smooth.geometricallyReduced`, `Comodule`,
`ComoduleCat`, `linearlyReductiveAffineGroupSchemeProperty`,
`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`
(`Representation/Embedding.lean:212`, namespace at line 202),
`TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim` (`Tangent/Regularity.lean:112`),
`CommHopfAlgCat.fppfHomogeneousQuotient` and the two torsor theorems. The pin's representability
results for `G/H` (`Homogeneous/Coinvariants.lean:219, 255, 268`, `Homogeneous/GeneralLinear.lean:56`)
are for linearly reductive `H`, or reductive `H` in characteristic zero, so
gap:homogeneous-quotient-scheme asks for nothing the pin has. Tau Ceti's `AlgebraicGeometry/Stack`
holds `Basic.lean` only: no gerbe, residual gerbe, substack or `|𝒳|` at the pins.

### Duplication, ownership and overlaps

SchemeAndStackFoundations on main: the 19 cited sections and all cited names resolve (§1.19 line
3612 with `.iff_unramified_diagonal` at 3624; §1.20 line 3638 with `.pullbackSurjective` 3655,
`.baseChangeImage` 3656, `stack_presentation` 3682; §1.21 line 3744 with
`actionQuotient.torsorEquiv` 3758; §1.22 line 3797; §4.8 line 6658). Its open revision keeps the
same section numbers and names (§1.20 at its line 3007, §4.8 at 5560) and has no "decent",
"quasi-DM", "residual gerbe" or "closed substack". AlgebraicModuliForArithmeticGeometry at its open
head: §4.1 (line 1863: `IsGerbe`, `IsGerbe.equivalence_iff` 1887, `relativeGerbe` 1895,
`relativePullback` 1913, `relativeComposition` 1921, `relativeDescent` 1929, the last under local
essential surjectivity, which gap:stack-morphism-permanence supplies), §8.1 (line 9650), §8.3 (line
9726: reframing by `α ∘ g`, `framedDeformation_twoFibre` 9748, the six-term
`framedTangent_exactSequence` 9788, from which I rederived the three sequences 7.3 uses).
ReductiveGroups on main: Layers 1, 3, 3A at lines 1275, 1537, 1683. The nine Lean names and the one
citation the resolver could not find are supplier-roadmap names, all present in those READMEs, and a
consumer line for a board package.

Searches over main and the open heads for "residual gerbe", "closed substack", "reduced induced",
"decent stack", "finite type point", `IsGerbeOver` and for definitions of these: users only
(LanglandsParameterStacks lines 523–524, FunctionFieldArithmeticPartII lines 53 and 7366,
AlgebraicModuliForArithmeticGeometry line 8720, HeckeStacksAndLocalShtukas, VirtualFundamentalClass
line 443); no roadmap on main or open defines one. Overlap facts of `scratch/overlaps.md`: none
dropped, none defined only by a revision, no conflicting head, no second copy.

Overlap check: read SchemeAndStackFoundations (main and its open revision),
AlgebraicModuliForArithmeticGeometry, GroupSchemesOverABase, VirtualFundamentalClass,
FunctionFieldArithmeticPartII and EquivariantIntersectionTheory; nothing shared.

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2234 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in the README (each with its "What … must
provide" sentence) and in the plan, each with a named supplier and section and a `needs` naming its
lemmas and hypotheses: stack-morphism-permanence, flat-lfp-open, inertia-of-presentations,
stack-separation-axioms, quasi-dm-flat-presentation, flat-groupoid-quotients,
decent-algebraic-spaces, decent-space-schematic-locus, reduced-scheme-residue-field-factorisation,
group-spaces-over-fields, quasi-finite-over-fields, isomorphism-fpqc-local-spaces,
generic-flatness-spaces, reduced-regular-smooth-local, algebraic-stacks-satisfy-rs,
homogeneous-quotient-scheme. None asks for what a supplier or a pin already has (checked against the
supplier texts and pins above). `gap:zero-dimensional-dm-residual-gerbes`, named in the consumer
list, is FunctionFieldArithmeticPartII's own.

### Shape, headlines, Lean

Eight layers, 38 targets, 136 Checks against 136 plan tests, at least three per target (script);
every target has a *Needs* line and locators, every layer Examples and Dependencies. No LaTeX
delimiters, anchors, machine paths, pull-request numbers or process words (script; the hits for
"round" and "lemma" are "ground-field", "background" and "Zariski's lemma"). Layers are named by
their mathematics; no sentence says the roadmap follows a source. Headlines, from the Summary:
finite type points (1.1, 4.1), existence (4.2–4.4), the gerbe over the residue field with
`𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed points (4.5) and the
tangent–normal sequence (7.3). None is statable at the pins (no algebraic stack there). A design has
no `Suggested.lean`: no padding probe and no `#check` comparison were possible. Elaboration: not
available (this lane does not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and seven more (0.1's opening,
0.2's rigidity sketch, 1.4's proof sentence, 2.3's criterion, 4.2's statement, 5.2's three
reductions, gap:decent-space-schematic-locus). A word-level scan of the whole README against twelve
cached texts finds no shared run above 12 words; the 12-word runs are "the following are equivalent"
followed by a forced clause, and hypothesis lists in standard names ("surjective, flat and locally of
finite presentation"). 0.2's sketch, 5.2's and 5.4's routes differ from the sources' proofs in their
steps. Arrangement: Chapter 101 is spread over Layers 1 (§§18–19), 2 (§§28, 29, 33), 3 (§§4, 28,
51), 4 (§§18, 28, 31, 51) and 5 (§§48, 50, 51); Chapter 100's §11 (Layer 3) comes after §§101.18–29;
Layers 6–7 are not from the Stacks Project. No run of layers maps one to one onto a run of sections.
In Layer 0, 0.2 < 0.3 < 0.4, 0.5 is forced by the *Needs* lines, and 0.4 and the rigidity of 0.2 are
not from Chapter 100. The manifest parses with 25 entries; every cited work has a key; `rydh2015` is
recorded and not cited (a remark, no change asked).

Source independence: 22 passages compared with 8 source texts, none shared; largest share
stacks-06RD, 34 of 139 line locators (53 with stacks-06QB, the same chapter); contents compared with
the section lists of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- MotivicStructuresInModuliOfCurves and VirtualFundamentalClasses have no open pull request; their
  consumer lines were checked against the board packages only.

## Source issues

- **Misprint** in stacks-06QB at Lemma 101.28.13, printed page 61: the proof writes the map on points from the base to the gerbe, twice; it should be from the gerbe to its base; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.48.2, printed page 98: the proof has "on known" before "to be quasi-compact"; it should read "only known"; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.17.6, printed page 32: the proof announces that a morphism must be shown locally of finite presentation; it should say locally of finite type, as the lemma and the rest of the proof do; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: local Noetherianity of the reduced closure and of the gerbe's base is left to the reader; it should cite permanence under immersions and smooth descent; affects the proof.
- **Gap** in stacks-06RD at Lemma 101.50.2, printed pages 100–101: reducedness of the base of the dense open gerbe is called a small detail and omitted; it should descend reducedness along the smooth surjective gerbe; affects the proof.
- **Gap** in stacks-04XE at Lemma 100.9.6, printed page 17: no proof that an immersion is a homeomorphism onto a locally closed subset; it should use the presentation correspondence of Lemma 100.9.11; affects nothing.
- **Gap** in alper-moduli at Exercise 4.5.11 (a), printed page 139: the action is written as the stabiliser element composed after the framing, which does not compose in applicative order; it should be the framing composed with the inverse element, a left action; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for eight line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editor's online compilation of 13 October 2024 (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5, and does not name this roadmap; only that package can replace them by a citation.
- **Ownership.** FunctionFieldArithmeticPartII (open head, README line 53) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations, while this design's worked example proves it; which roadmap that gap names is that roadmap's to change.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0c293b141c13a46a1e6fbc787c6fbe62ad341ce1", "job": "REV-DESIGN-StackPointsAndResidualGerbes~9", "model": "fable", "worker": "chris-x81"} -->
