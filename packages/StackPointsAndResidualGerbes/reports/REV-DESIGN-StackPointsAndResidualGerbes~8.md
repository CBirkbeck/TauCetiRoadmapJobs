<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16357#issuecomment-6896464031 -->
Review (claude) of 7b07a95

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 4.4 omits inputs its route uses, and one contract sentence lists its users incompletely

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:1293`–1295 (4.4), the plan's
   prerequisites of 4.4, and README lines 209–212. Quote (4.4): "*Needs:* 0.3, 3.3, 3.4;
   SchemeAndStackFoundations §1.20 (`stack_presentation`), §1.21 (`Stack.quotient`);
   gap:flat-groupoid-quotients …; gap:stack-morphism-permanence."

   **Claim:** the list carries what 4.4's route uses; and the Mathlib lemma
   `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` "gives the case used in
   3.2, 4.1 and 4.2".

   **Witness:** 4.4's route says the projections of `R' = u ×_𝒳 u` are "flat and locally of finite
   presentation": that is local finite type over a field, the step for which 4.1, 4.2 and 6.1 list the
   Mathlib lemma with §1.8. `[u/R'] → 𝒳` is a monomorphism by 0.2 (stacks-06RD lines 3126–3128).

   **Exact repair, tested:** add to the *Needs* of 4.4, in README and plan, "0.2 (a fully faithful
   `[u/R'] → 𝒳` is a monomorphism); SchemeAndStackFoundations §1.8 (`Spaces.EtaleLocal`); Mathlib
   `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` (the projections of `R'`,
   locally of finite type over a field, are locally of finite presentation)", and write the contract
   sentence at lines 209–212 as "the case used in 3.2, 4.1, 4.2, 4.4 and 6.1". Both targets are
   earlier than 4.4, so no cycle. Test on 4.4's first Check, `X = Spec ℚ(t)/ℤ`: `u = Spec ℚ(t)`,
   `E = {u}`, `R' = ⊔_ℤ Spec ℚ(t)`, whose projections to `u` are étale, locally of finite type over the
   field `ℚ(t)` and hence locally of finite presentation by the Mathlib lemma; `[u/R'] → X` is fully
   faithful, a monomorphism by 0.2, and `[u/R'] = X`. This is the pattern of round-7 F02: the repair's
   script compared target numbers and gap names only, so a Mathlib input was not seen.

2. **F02** (P3) the build paragraph no longer agrees with the dependency lines of Layer 7

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:469`–471. Quote: "Layer 7 uses
   Layers 0, 4 and 6 at a closed rational point … Layers 4 and 5 both use 3; Layer 6 uses 4 and 5;
   Layer 7 uses 0.4, 4.5 and 6.4."

   **Claim:** Layer 7 rests on Layers 0, 4 and 6 only.

   **Witness:** README line 1863, "Layers 0–4 and 6"; the *Needs* of 7.2 (1.3), 7.3 (1.3, 2.2, 2.3) and
   7.4 (1.3, 2.3) at lines 1740, 1799–1800 and 1834–1836, and 7.1's 3.4 at line 1714.

   **Exact repair, tested:** write "Layer 7 uses Layers 0–4 and 6 at a closed rational point" and, in
   the last sentence, "Layer 7 uses 0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5 and 6.4". Test: the union of the
   target numbers in the four *Needs* lines of Layer 7 is `{0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}`
   plus Layer 7's own targets; no Layer 5 target occurs, so "0–4 and 6" is exact.

3. **F03** (P3) the rigidity sketch of 0.2 takes an affine atlas that need not exist; the locator is indirect

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:526`–530. Quote: "(Morphisms of
   Spaces, Lemma 67.10.8, used at stacks-06ML line 1204). For the proof take an étale atlas `W → T`
   with `W` a nonempty affine scheme".

   **Claim:** every nonempty algebraic space `T` with a monomorphism to `Spec k` has a surjective étale
   cover by one affine scheme.

   **Witness:** that holds only for quasi-compact `T`, which is not known before the conclusion (a
   disjoint union of infinitely many points has no affine atlas). The lemma itself is at
   stacks-morphisms-spaces lines 904–905.

   **Exact repair, tested:** cite "stacks-morphisms-spaces lines 904–905, Lemma 67.10.8", and write the
   sketch as "take a nonempty affine scheme `W` étale over `T`, with open image `T' ⊆ T`; … so `T'` is
   the quotient of `W` by `W ×_k W`, which is `Spec k`; then `T → Spec k` is a monomorphism with the
   section `Spec k ≅ T' ⊆ T`, hence an isomorphism". Test on the instance that breaks the present
   wording, a hypothetical `T` that is not quasi-compact: no affine atlas is needed, `T' = Spec k`
   gives the section, and a monomorphism with a section is an isomorphism, so `T = T'`. On
   `T = Spec k` the sketch gives `W = T' = T`. The statement is unchanged.

4. **F04** (P3) the fppf-local criterion of 2.3 keeps a 17-word run of its source

   **Location:** `packages/StackPointsAndResidualGerbes/design/README.md:962`–964. Quote: "there are an
   algebraic space `U`, a group algebraic space `G` flat and locally of finite presentation over `U`
   and a surjective, flat, locally finitely presented `U → 𝒴`".

   **Claim:** the statement is in the roadmap's own words.

   **Witness:** stacks-06QB lines 2699–2701 (Lemma 101.28.7 (2)): 17 consecutive words are shared, and
   the clauses come in the source's order. It is a list of data and hypotheses in standard names, which
   the rubric does not count as copying; I raise it as style.

   **Exact repair, tested:** "Prove that `𝒳 → 𝒴` is a gerbe iff it becomes a classifying stack
   fppf-locally on `𝒴`: for some surjective, flat, locally finitely presented `U → 𝒴` from an algebraic
   space, `𝒳 ×_𝒴 U ≅ [U/G]` over `U` with `G` a flat, locally finitely presented group algebraic space
   over `U` (stacks-06QB lines 2696–2712, Lemma 101.28.7)". Test: the longest run shared with lines
   2699–2701 is now "flat, locally finitely presented" (four words); on `Bμ_p → Spec 𝔽_p` the
   statement holds with `U = Spec 𝔽_p`, `G = μ_p`, and on `Spec k → B𝔾_m` it fails as before: every base change `P → U` is a
   `𝔾_m`-torsor, an algebraic space with trivial inertia, so `P ≅ [U/G]` would force `G = 1` and
   `P ≅ U`, which a `𝔾_m`-torsor is not.

Four findings, all P3 (no P1, no P2), each with a repair to apply; a repair asks for changes, so the
design is not accepted in this round. The 16 declared supplier gaps (listed under "Supplier order
and gaps") are precise, minimal and declared, and are no finding. All four
round-7 findings are repaired. I changed no design file and added nothing to the manifest: every
text I needed was in the cache. This lane does not elaborate Lean, and a design has no
`Suggested.lean`.

## Verified sound

### Round-7 findings, one by one

| Round-7 finding | Repaired passage (README line) | Status |
|---|---|---|
| F01 (P3) gerbe over an integral scheme only under quasi-compact diagonal | 1456–1460: "if `𝒳` is decent, `I_𝒳 → 𝒳` is quasi-compact and `ξ ∈ |𝒳|`, the reduced closed substack `𝒳'` on the closure of `ξ` (0.5) has an open substack `𝒵` … which is a gerbe over an integral affine scheme `Z`"; route 1466–1479; gap:decent-space-schematic-locus at 370–373 and in the plan | repaired; I read stacks-06RD lines 4786–4807 and stacks-decent-spaces lines 1094–1096 |
| F02 (P3) *Needs* of 6.1 and 7.4 | 1570–1572: "gap:stack-morphism-permanence (for an arbitrary locally finite type representative `x`: … cancellation, Lemma 101.17.8 …)"; 1834–1836: "1.3 (`G_x` is the stabilizer of the action groupoid at `x` …); 2.3 (`BG_x → Spec k` is smooth)" | repaired; the same pattern remains in 4.4 (R01) |
| F03 (P3) two consumers that do not use this roadmap | 1875–1891: the bullet is gone; "**MotivicStructuresInModuliOfCurves**: stabilisers at points of its quotient stacks … through 1.3 and 7.4"; plan `consumers` has four entries | repaired; board package lines 920 (central `μ₂`), 1031 and 1070 (quadric stabilisers) |
| F04 (P3) scheme case of 0.4 without §4.8 | 655–657: "`𝒳^{[n]}_𝒵` is the level-`n` term `toScheme n : V(I^{n+1}) → 𝒳` of SchemeAndStackFoundations §4.8's *Scheme.formalCompletion*"; §4.8 in 0.4's and 7.1's *Needs*, Convention 6 and the contract (308–310) | repaired; main's README lines 6660–6661, and line 5560 of the open revision, have §4.8 with this text |

No finding of the repair report is marked "not actionable in this package". The repair's gap rename
(`gap:quasi-separated-space-schematic-locus` → `gap:decent-space-schematic-locus`) leaves no trace
of the old slug in README or plan, and no other roadmap cites it.

### Adversarial pass (values computed in this round)

`Bμ_p` is over a field of characteristic `p`; `X₀ = Spec ℚ(t)/ℤ`; `X₁ = U/G` is Example 100.11.6;
`X₂` is two copies of `Spec k[x₁, x₂, …]` glued along `⋃ D(xᵢ)`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 0.2 rigidity | `T = Spec k`; `Spec k → Spec k[ε]`; `T` not quasi-compact | `W ×_T W = W ×_k W`, quotient `Spec k`; target not a field, monomorphism not iso; no affine atlas | statement holds; sketch: R03 |
| 0.3 immersions | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹` | invariant `{0}`, `𝔾_m` ↔ `B𝔾_m`, `Spec k`; complement of `{η}` = closed points, not closed | holds |
| 0.4 ideals, neighbourhoods | origin of `𝔸¹`; `(ε)`; base change; `I = (t)` in §4.8 | all-modules kernel over the origin `ker(k → k) = 0`, `QCoh` value `(t) ⊗ k = k·t ↦ 0`; `(ε)² = 0`; `V(ℐ^{n+1}) ×_𝒳 𝒴 = V((ℐ·O_𝒴)^{n+1})`; lengths `1, 2, 3` on both indexings | holds |
| 0.5 reduced structure | `Spec k[ε]`; `t ↦ ε`; locally closed `T` | reduction `Spec k`; `ε ≠ 0`, no factorisation through `V(t)`; `T̄ ∖ T` closed, `T` closed in its complement | holds |
| 1.1 finite type points | `Spec ℤ_(p)`; `𝔸¹_k` generic; `Spec k(t) → Spec k → 𝒳` | `ℚ = ℤ_(p)[1/p]`; `k(t)` not finitely generated over `k[t]`; not locally of finite type by cancellation | holds |
| 1.4 schematic `G_x` | `𝔸¹/ℤ` in char 0; `Bℤ`; `B𝔾_m` | diagonal pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, image the lines `y = x + n`, dense, missing the generic point; `G_x = ⊔_ℤ Spec k`, étale, not quasi-compact; scheme without quasi-DM | six cases as in the source |
| 2.2 gerbe with section | `BG`; `[𝔸¹/𝔾_m]` with section `1`; `S₃` over `ℝ` | `Isom = G`; `Isom(1, 1) = 1`, `[Spec k/1] = Spec k ≠ 𝒳`; `H¹(ℝ, S₃)` = classes of involutions `{1, (12)}`, twisted form not constant | holds; gerbe hypothesis needed |
| 2.3 local structure, smoothness | `Bμ_p`; `Spec k → B𝔾_m` | base change of `Spec 𝔽_p → Bμ_p` along itself is `μ_p → Spec 𝔽_p`, not smooth; `Bμ_p → Spec 𝔽_p` smooth through the atlas `𝔾_m`; flat, surjective, no gerbe | holds |
| 2.5 diagonal criterion | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ` | diagonal = unit section `Spec k → 𝔾_m`, not flat; homeomorphism, not flat; diagonal pulls back to `⊔_ℤ Spec k` over a base with quasi-compact diagonal | holds; no converse to 101.28.13 or 101.28.14 |
| 3.1 one-point stacks | `Spec k[ε]`; `X₁` | `Spec k → Spec k[ε]` not flat; `ℚ̄ ⊗ ℚ̄` absolutely flat with local rings `ℚ̄`; `U ×_{X₁} Spec ℚ̄ = G × Spec ℚ̄ → U`, non-open closed points, not locally finitely presented | holds; the two lemmas differ |
| 3.3 residual gerbe | scheme; `Spec k[ε]`; `Spec k → BG` | `Spec κ(x)`; reduction gives `Spec k`; `Spec k ×_{BG} Spec k = G ≠ Spec k` | holds |
| 4.1 / 1.1 (headline) | DVR generic point; `𝔸¹` generic; `X₁` | all three conditions true; all false though `𝒵 = Spec k(t)` exists; true on a non-Noetherian space | holds |
| 4.2 (headline) | `Bμ_p`; `B𝔾_m` | atlas `Spec 𝔽_p` flat, quasi-finite, `μ_p` of length `p` not unramified: quasi-DM, not DM; not quasi-DM, covered by 4.3 | holds |
| 4.3 gerbes, quasi-compact inertia | gerbe `𝒳 → 𝒳^♭`; `[𝔸¹/𝔾_m]` at `1`; `Bℤ` | fibre over `𝒵^♭_x` smooth over a reduced space, so `( )_red` changes nothing and equals 3.4's formula; closure `|𝒳|`, dense open gerbe `Spec k`; gerbe with inertia `⊔_ℤ` | holds |
| 4.4 locally Noetherian | `X₀`; DVR at both points; `[𝔸¹/𝔾_m]` at `1` | `u = Spec ℚ(t)`, `R' = ⊔_ℤ Spec ℚ(t)`, `[u/R'] = X₀`; `Z = Spec R`, `p⁻¹(Z) = u`, `𝒵 = Spec K`, and `Z = Spec R/𝔪`; `E = 𝔾_m`, `u` a closed point, `F = 𝔾_m`, `R' = Spec k` | holds; R01 |
| 4.5 (headline) | DVR; `X₁` | `Spec R/𝔪` closed, `Spec K` open; point closed, `Spec ℚ̄ → X₁` not a closed immersion | holds; Noetherian hypothesis needed |
| 5.2 factorisation | identity of `𝔸¹`; `t ↦ ε`; `Spec k(s) → 𝔾_m → [𝔸¹/𝔾_m]` | image the closure, no factorisation through `Spec k(t)`; nonreduced, none; image `{1}`, factors through the open `Spec k` | holds; route differs from the source's (48.5 for 48.4) |
| 5.3 (headline) | `t² + 1` on `𝔸¹_ℚ`; `[Spec ℂ/(ℤ/4)]`; `X₀` | `ℚ(i)`; `H¹(ℝ, ℤ/4) = {0, 2}`, both ↦ `0` in `H¹(ℝ, ℤ/2)`, no real object, `κ = ℝ`; base not a field | holds |
| 5.4 first statement | `[𝔸¹/𝔾_m]`; `X₂` generic; `𝔸¹_ℚ/ℤ` | `B𝔾_m/Spec k`, `Spec k`; `𝒵 = Z = Spec A`, preimage of the other copy `⋃ D(xᵢ)` not quasi-compact; `P(t + n)` has next coefficient `a + dn ≠ a`, no stable finite set, no schematic open | holds; decency needed |
| 5.4 second statement | affine `T → 𝒳` | `𝒵 ×_𝒳 T → 𝒵 × T` base change of `Δ`, `|𝒵 × T| ≅ |Z × T|` affine; `Spec κ(ξ) → Z` affine then quasi-compact immersion | holds |
| 5.5 fppf image | `k` finite over `κ`; `κ(t)/κ` | `Spec k → 𝒵_x` flat, surjective, locally finitely presented; a cover of a finite point through `Spec k` gives `k ↪` a finite extension of `κ`, impossible | holds |
| 6.2 (headline) | `[Spec ℂ/(ℤ/4)]`; `BG` | stabiliser = kernel `ℤ/2`, `B(ℤ/2)_ℂ`; three products `BG`, `Spec k`, `G` | holds |
| 6.3 (headline) | `(t, −1)` over `ℚ(t)`; `X₀` | residue `−1 ∉ ℚ^{×2}`, non-split, `(t², −1)` split; identity section, no representative an isomorphism | holds in both directions |
| 6.4 (headline) | `Spec k[x₀, …]` origin; `Bμ_p/𝔽_p(t)`; `k ≠ κ` | closed immersion, not finitely presented, `𝒵 = Spec k`; `G_x` not smooth, `𝒵 = BG_x`; no section, `𝒵 = Spec κ` | holds; the section of `𝒵^♭ → Spec k` is a monomorphism, iso by 3.2 |
| 7.1 neighbourhoods | `𝔸²` origin; Artinian `A`; scheme point | `k[x, y]/(x, y)²`, length 3; `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0`; `V(I^{n+1})` one-point, `= Spec O_{X,x}/𝔪^{n+1}` | holds |
| 7.3 (headline) | `Bμ_p`, `Bα_p`, `B𝔾_m`, `[𝔸¹/𝔾_m]`, cusp | `(dim N, dim T, dim Lie − dim G)` = `(0, 1, 1)`, `(0, 1, 1)`, `(0, 0, 0)`, `(1, 1, 0)`, `(2, 2, 0)`; `T_{GLₙ} → T_Q → T_{BG} → 0` from the supplier's six terms plus smoothness of `q` | holds, also for `p = 2, 3` |
| 7.4 quotient stacks | `SL₂` on quadratics at `uv`; `λ·t = λ^p t` on `𝔾_m`; trivial group on `Spec k[ε]`; `𝔾_m` on `𝔸¹` at `1` | torus, orbit `disc = 1` of dimension 2, `d(disc) = (0, 2, 0)`, `N` trivial of dimension 1; stabiliser `μ_p`, `N = 0`; `N = k = T_V/0`; orbit not closed | holds; `V` need not be reduced or smooth |
| gap:decent-space-schematic-locus | Theorem 68.10.2; Proposition 66.13.3 | stacks-decent-spaces lines 1094–1096; stacks-properties-spaces lines 799–802 | the `needs` sentence is supported |
| Worked example (zero-dimensional DM) | `Bℤ`; `B(ℤ/2)` | finite type, one point, `G_x = ℤ`; finite constant; `k` finite over algebraically closed `K` forces `K = k` | diagonal hypothesis needed |

Degenerate inputs: the empty stack is a gerbe over the empty space, has no point and satisfies 2.4,
2.6 and 3.2 on both sides; `T = ∅` in 0.5 gives the empty substack; `n = 0` in 0.4 gives `𝒵`.

### Sources: the seeded sample

All fifteen targets were read at their locators; numbers, hypotheses and statements agree.

| Target | Text read | Result |
|---|---|---|
| 0.3 | stacks-04XE lines 765–801, 853–894 | agrees; 9.6 and 9.10 have no proof there, as the README says |
| 0.4 | stacks-sheaves-on-stacks lines 953–955, 1058–1075; ahr2020 lines 248–252 | agrees; `ℐ^{n+1}` |
| 0.5 | stacks-04XE lines 1073–1125 | agrees; the README's proof uses a scheme atlas, its own choice |
| 1.1 | stacks-06RD lines 1545–1601 | agrees |
| 1.4 | stacks-06RD lines 1675–1689 | six cases, and the three reductions, as stated |
| 2.2 | stacks-06QB lines 2664–2695 | agrees |
| 2.3 | stacks-06QB lines 2696–2721; stacks-06RD lines 3335–3357 | agrees (the source adds "surjective" in 101.33.8); wording: R04 |
| 2.5 | stacks-06QB lines 2821–2843, 2862–2890 | agrees |
| 3.1 | stacks-06ML lines 1135–1198 | agrees |
| 3.3 | stacks-06ML lines 1260–1310 | agrees |
| 4.3 | stacks-06QB lines 2893–2904; stacks-06RD lines 3048–3056 | agrees |
| 4.4 | stacks-06RD lines 3096–3129 | agrees; inputs of the route: R01 |
| 5.2 | stacks-06RD lines 4842–4865; stacks-decent-spaces lines 1565–1601 | agrees |
| 7.1 | ahr2020 lines 248–252 | agrees |
| 7.4 | ahr2020 lines 475–486 | agrees; closed orbit and the proof are the README's |

Also read: stacks-06RD lines 4692–4735 (5.1), 4786–4839 (5.4, 3.4), 4866–4878 (4.5), 3059–3095
(4.2); stacks-06ML lines 1199–1213; rydh2011 lines 1234–1245 and 1268–1305; stacks-04XE lines
142–150 and 200–206 (Convention 3, items (1), (2), (31)); stacks-morphisms-spaces lines 904–908;
ahr2020 lines 39–44 and 55–58. No author-flagged unverified locator remains.

### Duplication, ownership and overlaps

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). I opened 23 of the cited
declarations at their cited file and line and each is there under the cited name, among them
`IsStack` (`Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`), `iff_locallyOfFiniteType`
(`Mathlib/AlgebraicGeometry/Noetherian.lean:271`, with `[IsLocallyNoetherian Y]`),
`retractionKerCotangentToTensorEquivSection` (`Mathlib/RingTheory/Smooth/Kaehler.lean:324`),
`finite_of_finite_type_of_isJacobsonRing` (`Mathlib/RingTheory/Jacobson/Ring.lean:691`),
`IsRegular.of_smooth` and `of_flat_of_surjective` (the latter with `[IsLocallyNoetherian Y]`),
`exists_isClosedImmersion_generalLinear`, `smooth_iff_finrank_lie_eq_ringKrullDim` and
`fppfHomogeneousQuotient`. The pins have no `Gerbe`, residual gerbe, closed substack, finite type
point or infinitesimal neighbourhood of a stack (grep by object, 0 files each); Tau Ceti's
`AlgebraicGeometry/Stack` holds `Basic.lean` only.

SchemeAndStackFoundations on main: the 19 cited section headings and the 37 cited names resolve
(`Scheme.formalCompletion` and `toScheme n` at line 6660, `.pullbackSurjective` 3655,
`actionQuotient.torsorEquiv` 3758, `stack_presentation` 3682); its open revision keeps the same
section numbers. Its text has no "decent", "quasi-DM", "finite type point", "closed substack" or
"residual gerbe", so no gap asks for what it provides. AlgebraicModuliForArithmeticGeometry at its
open head: §4.1 (line 1863), §8.1 (9650), §8.3 (9726) and the eleven cited names resolve;
`relativeDescent` asks for local essential surjectivity, which the gap supplies, and
`framedTangent_exactSequence` (line 9788) with the smoothness clause of `framedDeformation_twoFibre`
(9748) gives the two exact sequences 7.3 uses. ReductiveGroups on main: Layers 1, 3, 3A at lines
1275, 1537, 1683. The nine names the citation resolver could not find are supplier names, all
present in those READMEs; `VirtualFundamentalClasses §1.2` is a consumer line for a board package.

Searches over main and the open heads: "residual gerbe" only in LanglandsParameterStacks (lines
524–525) and FunctionFieldArithmeticPartII (lines 53, 7366), both users; "decent stack or space",
"finite type point", "gerbe over an integral", `IsGerbeOver` nowhere; "closed substack" only in
users. GroupSchemesOverABase 4.1 (open head, line 754) states `G/H` for groups of finite type and
leaves the affine case to ReductiveGroups Layer 3 (its lines 81–83), so
gap:homogeneous-quotient-scheme names the right owner. Overlap facts: none dropped, none defined
only by a revision, no conflicting head, no second copy.

Overlap check: read SchemeAndStackFoundations (main and its open revision),
AlgebraicModuliForArithmeticGeometry, GroupSchemesOverABase, VirtualFundamentalClass,
FunctionFieldArithmeticPartII and EquivariantIntersectionTheory; nothing shared (the fourth speaks of open substacks and of cycles on
integral closed substacks without defining them; the sixth names the `μ₂`-gerbe
`M_{1,1} → [M_{0,4}/𝔖₃]` in computations only).

### Supplier order and gaps

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2230 edges, 0 problem(s)

No UPWARD or CYCLE line. The 16 gap slugs are the same in README and plan, each with a named
supplier and section and a `needs` that names its lemmas and hypotheses:
stack-morphism-permanence, flat-lfp-open, inertia-of-presentations, stack-separation-axioms,
quasi-dm-flat-presentation, flat-groupoid-quotients, decent-algebraic-spaces,
decent-space-schematic-locus, reduced-scheme-residue-field-factorisation,
group-spaces-over-fields, quasi-finite-over-fields, isomorphism-fpqc-local-spaces,
generic-flatness-spaces, reduced-regular-smooth-local, algebraic-stacks-satisfy-rs,
homogeneous-quotient-scheme. The README also names `gap:zero-dimensional-dm-residual-gerbes`, which
is FunctionFieldArithmeticPartII's own gap, quoted in the consumer list, not one of this roadmap's.
The new edges of the round-8 repair (0.1 → 0.3, 5.3 → 0.2, 6.1 → 1.3, 6.2 → 0.2, 7.2 → 1.3,
7.4 → 1.3 and 2.3) close no cycle: 0.3 needs 0.2 only, and 0.2 needs no target.

### Shape, headlines, Lean

Eight layers, 38 targets, 136 Checks against 136 plan tests, at least three per target (script);
every target has a *Needs* line and locators, every layer Examples and Dependencies. No LaTeX
delimiters, process words, pull-request numbers, anchors or machine paths (script). The layers are
named by their mathematics and no sentence says the roadmap follows a source. Headlines, from the
Summary: finite type points (1.1, 4.1), existence (4.2–4.4), the gerbe over the residue field with
`𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3), rational points (6.4), closed points (4.5), and the
tangent–normal sequence (7.3). None is statable at the pins: Tau Ceti has `SchPseudofunctor` and
algebraic spaces, no algebraic stack, `|𝒳|` or residual gerbe. A design has no `Suggested.lean`, so
there was no padding probe and no `#check` comparison. Elaboration: not available (this lane does
not elaborate).

### Copyright and arrangement

Passages put beside their sources: the fifteen sampled statements and six more (5.4's two
statements and its route, 0.2's rigidity proof, 4.2's route, 5.1's Lemma 101.48.3). The longest
shared run is the 17 words of R04; elsewhere at most seven ("is flat and locally of finite
presentation"). 0.2's rigidity proof, 0.5's proof, 5.2's and 5.4's routes differ from the sources'
proofs in their steps, not only in words. Arrangement: Chapter 101 is spread over Layers 1
(§§18–19), 2 (§§28, 29, 33), 3 (§§4, 28, 51), 4 (§§18, 28, 31, 51) and 5 (§§48, 50, 51), and
Chapter 100's §11 comes after §§101.18–101.29; no run of layers maps one to one onto a run of
sections. Within Layer 0, 0.2 < 0.3 < 0.4, 0.5 and 0.1 < 0.5 are forced by the *Needs* lines. The
manifest parses with 25 entries, every cited work has a key, and `rydh2015` is recorded and not
cited.

Source independence: 21 passages compared with 7 source texts, none shared beyond the hypothesis list
of R04; largest share stacks-06RD, 26 of 121 line locators (45 with stacks-06QB, the same chapter);
contents compared with the tables of contents of Chapters 100 and 101: independent.

## Not verifiable

- `lmb2000` (Chapter 11, Définition 11.2) and `olsson2016` (Chapter 11): settled as uncertified,
  cited by locator only; not read.
- Lean elaboration: not available in this lane, and the design has no Lean file.
- MotivicStructuresInModuliOfCurves and VirtualFundamentalClasses have no open pull request; their
  consumer lines were checked against the board packages only.

## Source issues

- **Misprint** in stacks-06QB at Lemma 101.28.13, printed page 61: the proof writes the map on points from the base to the gerbe, twice; it should be from the gerbe to its base; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.48.2, printed page 98: the proof has "on known" before "to be quasi-compact"; it should read "only known"; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: local Noetherianity of the reduced closure and of the gerbe's base is left to the reader; it should cite permanence under immersions and smooth descent; affects the proof.
- **Gap** in stacks-06RD at Lemma 101.50.2, printed pages 100–101: reducedness of the base of the dense open gerbe is called a small detail and omitted; it should descend reducedness along the smooth surjective gerbe; affects the proof.
- **Gap** in stacks-04XE at Lemma 100.9.6, printed page 17: no proof that an immersion is a homeomorphism onto a locally closed subset; it should use the presentation correspondence of Lemma 100.9.11; affects nothing.
- **Misprint** in stacks-04XE at Lemma 100.10.1, printed page 23: in the displayed chain of equalities the last fibre product is written without the bars of its underlying set; it should be the set of points; affects nothing.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes (5 January 2026), not a published text; it is cited for seven line locators, each beside a Stacks Project or journal source.
- **Licence.** `sga3-vi-a` was read in the editor's online compilation of 13 October 2024 (author page), not the printed SMF volume; it supports one gap.
- **Ownership.** `packages/VirtualFundamentalClasses/README.md:508`–521 still defines closed substacks and the reduced induced structure that this design owns in 0.3–0.5, and does not name this roadmap; only that package can replace them by a citation.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7b07a958956f7daa255644e2c34bd3bdfbc3ff27", "job": "REV-DESIGN-StackPointsAndResidualGerbes~8", "model": "fable", "worker": "chris-x26"} -->
