<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17723#issuecomment-6904753691 -->
Red team round 2 pass a (claude) of 6c66881

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 7.4 claims an isomorphism of `G_x`-representations that its route and its source give only for vector spaces

   Location: `packages/StackPointsAndResidualGerbes/README.md:1988–1990`, "`𝒵_x = [G·x/G]`, and
   `N_x ≅ T_{V,x}/T_{G·x,x}` as `G_x`-representations (ahr2020 lines 484–486 …)".

   Claim: the route of 7.4 proves an equivariant isomorphism, and the source states one.

   Witness: the route is "apply the chart computation of 7.3" (`README.md:1992–1998`); that computation
   gives `T_{U,u} → N_x` surjective with kernel `T_{W,u}` and 7.2's third API bullet says "as vector
   spaces" (`README.md:1893–1894`). 7.3 proves equivariance for `G_x(k)` only, for `θ_x`, not for a
   chart. ahr2020 lines 484–486 say `N_x` "is identified with" the normal space, with no
   representation clause. The `G_x`-structure on `T_{V,x}/T_{G·x,x}` is never defined in the README,
   and 7.4's `*Needs:*` has no §1.22.

   Repair: after "hence reduced, hence `W = G·x`." (`README.md:1998`) add:

   > The isomorphism respects the `G_x`-actions. Under *QCoh.presentationEquiv* for the action
   > groupoid `G × V ⇉ V`, `ℐ` is the ideal `J` of `G·x` with its `G`-equivariant structure, and
   > `i^*ℐ` is `J/J² ⊗ k(x)` with the `O(G_x)`-comodule structure obtained by restricting that
   > structure along the morphism of groupoids `(G_x ⇉ Spec k) → (G × V ⇉ V)` defined by `x`
   > (Convention 9). Since `G_x` fixes `x`, the same restriction makes `𝔪_x/𝔪_x²` an
   > `O(G_x)`-comodule and `J/J² ⊗ k(x) → 𝔪_x/𝔪_x²`, injective by 7.3, a morphism of comodules.
   > `T_{V,x} = (𝔪_x/𝔪_x²)^∨` carries the contragredient action, `T_{G·x,x}` is the annihilator of
   > the image, hence a subrepresentation, and the surjection `T_{V,x} → N_x` of 7.3 is the dual of
   > that morphism.

   Add to 7.4's `*Needs:*`: "SchemeAndStackFoundations §1.22 (*QCoh.presentationEquiv* for
   `[V/G]`, for the equivariance)". Add the Check: "For `𝔾_m` on `𝔸¹` and `x = 0`: `J = (t)`,
   `J/J² ⊗ k = k·t` of weight `−1` (Convention 5), so `T_{V,0}/T_{G·x,0} = T_{𝔸¹,0}` has weight
   `+1`, the differential of `t ↦ λt`, and equals `N_0` of 7.2's first Check as a character; the
   non-contragredient convention gives `−1`." Tested on the instances of 7.4: `GLₙ` on `𝔸ⁿ` (standard
   representation on both sides), `SL₂` on quadratic forms (torus weights `2, 0, −2` on `T_V`,
   `2, −2` on the orbit tangent, weight `0` on both sides), `E × 𝔾_m` (weight `+1` on both sides).

2. **F02** (P2) the docstring of `Suggested.lean` states 6.2–6.3 without decency and as an abstract equivalence

   Location: `packages/StackPointsAndResidualGerbes/Suggested.lean:30–31`, "`𝒵_x ×_{κ(x)} k ≃ BG_x`
   for every representative `Spec k → 𝒳`, and `𝒵_x ≃ BG_x` exactly when `κ(x) → k` is an
   isomorphism"; also `:25–26`, "on a decent stack the residual gerbe is a gerbe over the spectrum of
   a field".

   Claim: for every algebraic stack, `𝒵_x` and `BG_x` are equivalent iff `κ(x) → k` is an isomorphism.

   Witness: `𝒳 = Spec ℚ(t)` (a scheme, hence decent) and the representative `x` given by
   `σ : t ↦ t²`: `κ(x) = ℚ(t)`, `G_x = 1`, `𝒵_x = Spec ℚ(t) ≅ BG_x = Spec ℚ(t)`, and `κ(x) → k` is
   `σ`, not surjective. README 6.3 (`README.md:1747–1749`) states the criterion for the canonical
   morphism `BG_x → 𝒵_x`, which here is `Spec σ`; `κ(x)` exists only for decent `𝒳` (5.3), and
   `Spec ℚ(t)/ℤ` has a residual gerbe with no residue field (`README.md:1559–1560`).

   Repair: replace the two bullets by

   > * the residue field (5.3): on a decent stack a residual gerbe, where it exists, is a gerbe over
   >   the spectrum of a field `κ(x)`, unique up to unique isomorphism;
   > * the residual gerbe at a representative (6.2, 6.3): on a decent stack,
   >   `𝒵_x ×_{κ(x)} k ≃ BG_x` for every representative `Spec k → 𝒳` of a point whose residual gerbe
   >   exists, and the canonical morphism `BG_x → 𝒵_x` is an equivalence exactly when `κ(x) → k` is
   >   an isomorphism;

   Tested on the witness: the canonical morphism is `Spec σ`, not an equivalence, and `σ` is not an
   isomorphism; both sides of the repaired "exactly when" are false.

3. **F03** (P3) 3.4's gerbe clause uses local finite type of the inertia, which its `*Needs:*` does not supply

   Location: `README.md:1257–1258`, "`𝒵_x` is a gerbe over a reduced, locally Noetherian algebraic
   space `𝒵_x^♭` with one point, its base (stacks-06QB lines 2846–2861, Lemma 101.28.12)"; `*Needs:*`
   at `README.md:1261–1263`; Layer 3 Dependencies at `README.md:1304–1307`.

   Claim: every input of the clause is listed.

   Witness: stacks-06QB lines 2850–2854: the proof pulls the inertia back to a flat finitely
   presented point and uses that `I_𝒵 → 𝒵` is locally of finite type (Lemma 101.5.1), then that
   finite type over a field gives finite presentation. Lemma 101.5.1 is gap:inertia-of-presentations
   (`README.md:373–376`), absent from 3.4 and from Layer 3; 2.6 and 7.2 list it for the same fact.

   Repair: in 3.4's `*Needs:*` add "gap:inertia-of-presentations (the inertia is locally of finite
   type, Lemma 101.5.1, for the gerbe clause); Mathlib
   `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` with
   SchemeAndStackFoundations §1.8 (`Spaces.EtaleLocal`) (locally of finite type over a field is
   locally of finite presentation)". Add gap:inertia-of-presentations to Layer 3's Dependencies.
   Tested on `𝒵 = Bμ_p` over `𝔽_p`: the pullback of the inertia to `Spec 𝔽_p` is `μ_p`, of finite
   type, hence flat and finitely presented, and 2.4 applies.

4. **F04** (P3) 6.4 applies 3.2 to the base without citing 3.1

   Location: `README.md:1803–1806`, "a section of `𝒵_x^♭ → Spec k` is a monomorphism, and 3.2 makes
   it an isomorphism … *Needs:* 0.2, 2.1, 3.2, 3.4, 4.1, 4.5, 6.3".

   Witness: 3.2 (`README.md:1191–1192`) needs a surjective, flat, locally finitely presented point
   of the target; for `𝒵_x^♭`, reduced, locally Noetherian and one-point by 3.4, that point is 3.1
   (Lemma 100.11.3). 5.3 lists 3.1 for the identical step (`README.md:1533–1535`, `:1538`).

   Repair: write "is a monomorphism; `𝒵_x^♭` is reduced, locally Noetherian and one-point (3.4), so
   it has a surjective, flat, locally finitely presented point (3.1), and 3.2 makes the section an
   isomorphism", and add 3.1 to the `*Needs:*`.

5. **F05** (P3) "core" is used in Checks and never defined

   Location: `README.md:1210–1211`, "its locally Noetherian core is `Spec ℚ̄`"; `README.md:1216`, "the
   core is `BG` itself".

   Witness: the word occurs only in these two Checks and inside the proposed name
   *Stacks.reducedNoetherianSingletonCore* (`README.md:1197`); 3.2's statement calls the object
   "a unique substack `𝒵'`". stacks-06ML lines 1214–1218 give it no name.

   Repair: in 3.2, after "with `𝒵' → 𝒵` a monomorphism" add ", called here the *locally Noetherian
   core* of `𝒵`", and write "its locally Noetherian core" in the second Check.

6. **F06** (P3) two locators of the reference list and the manifest do not cover what the README cites

   Location: `README.md:2105–2107`, "Decent Algebraic Spaces (Chapter 68): Sections 68.6, 68.10 …,
   68.11 and 68.13"; `sources.toml:160`, `locator = "Sections 68.6, 68.10, 68.12-68.14"`;
   `sources.toml:192`, `locator = "Section 96.14"`.

   Witness: the README cites Lemmas 68.7.2 and 68.8.3, Proposition 68.12.4 and Lemma 68.15.2
   (`README.md:415–417`, `:1512`), outside the reference list's sections; the manifest locator omits
   68.11 (Lemma 68.11.1, Definition 68.11.2) and names 68.14, cited nowhere. For Chapter 96 the
   README cites 96.6, 96.11, 96.12, 96.14 and 96.15 (`README.md:404–411`, `:2112–2114`).

   Repair: `README.md:2106–2107`: "Sections 68.6–68.8, 68.10 (Theorem 68.10.2, cited in
   gap:decent-space-schematic-locus), 68.11–68.13 and 68.15". `sources.toml:160`:
   `locator = "Sections 68.6-68.8, 68.10-68.13, 68.15"`. `sources.toml:192`:
   `locator = "Sections 96.6, 96.11-96.12, 96.14-96.15"`.

Two P2 findings (S01, S02) and four P3 findings (S03–S06). All eleven findings of round 1 are
repaired at this head and no repair introduced an error. No target of the README was refuted.

## Round 1 findings at this head

| Round 1 finding | State | Witness at 6c66881 |
|---|---|---|
| 1b/F01 (P1) `Stacks.QCoh` used as an abelian tensor category | repaired | `README.md:402–411` states gap:qcoh-stacks-abelian-tensor (abelian, kernels on `U`, `O_𝒳`, tensor products, right-exact pullback); `README.md:685–687` "an abelian category containing `O_𝒳` by gap:qcoh-stacks-abelian-tensor"; cited in the `*Needs:*` of 0.4 (`:718–720`) and 7.2 (`:1880`) and in both layer Dependencies (`:809`, `:2053`); `design/plan.json` has the slug (17 slugs on each side, equal sets). "coherent" no longer occurs; 7.2 proves finite dimension on a chart (`:1885–1891`). Locators checked: stacks-sheaves-on-stacks lines 374, 733, 740, 869–874, 1068–1077; stacks-groupoids-spaces lines 593–603. |
| 1a/F01 (P2) VirtualFundamentalClasses said to consume 0.3–0.5 | repaired | `README.md:54–62` "states, in its §1.2, closed substacks of Deligne–Mumford stacks … these are 0.3 and 0.5 for such stacks … it does not use the ideals of 0.4"; `README.md:2068–2073`. True of `packages/VirtualFundamentalClasses/README.md:508–549` and `:103`. |
| 1a/F02 (P3) uncited separable-point theorem | repaired | `README.md:295–299`, `:1926–1930`, `:1958`; the declaration is at `TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43` with `[Smooth f] [Nonempty X]`. |
| 1a/F03 (P3) 5.3 used Lemma 68.13.7 unsupplied | repaired | `README.md:1532–1536` "By gap:decent-algebraic-spaces (Lemma 68.11.1) … (3.1), and 3.2 makes the monomorphism an isomorphism"; `*Needs:*` now has 3.1, 3.2 (`:1538`). |
| 1a/F04, 1b/F02 (P3) *Stacks.IsGerbe* versus the site-level `IsGerbe` | repaired | `README.md:989` *Stacks.IsGerbeOverSomeSpace*; `:990–994` "weaker than … `IsGerbe` … the case of a gerbe over the final object `Spec ℤ`"; Check at `:1024–1029`. Recomputed below (row 2.1). |
| 1a/F05 (P3) framing direction of §8.1 | repaired | `README.md:163–168` "§8.1 writes them `(τ, β : τ|_k ≅ x)` and §8.3's `FramedDeformation` writes them `(τ, α : x ≅ τ|_k)` … `α = β⁻¹`"; agrees with AlgebraicModuliForArithmeticGeometry `README.md:9651` and `:9727`. |
| 1a/F06, 1b/F03 (P3) §1.12 cited for a group space over any field | repaired | `README.md:950–959` "`G = 𝔾_{a,ℚ}/ℤ` over `ℚ` … its underlying algebraic space is … `translationQuotient_space`"; `:1388–1390`. |
| 1b/F04 (P3) carriers of `[X/G]` | repaired | `README.md:1060–1063` "for a smooth morphism `X → Y` of algebraic spaces and a group algebraic space `G` over `Y`, flat and locally of finite presentation"; stacks-06RD line 3335. |
| 1b/F05 (P3) manifest entry `rydh2015` | repaired | `sources.toml` has 24 `[[source]]` tables and no `rydh2015`. |

## The adversarial pass: record

`Suggested.lean` declares nothing (57 lines: `module`, `import Mathlib`, one docstring, an empty
namespace), so there is no declaration row, no instance context and no `#check` comparison; no Lean
was run. Rows are the README targets and conventions, with instances computed in this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 5, 8 action and framing | `[𝔸¹/𝔾_m]` at 0, `τ = bε`, frame `α`, automorphism `μ₀ + μ₁ε` | `(b, α) ↦ (μ₀b, μ₀α)`, invariant `α⁻¹b`; `g·(τ,α) = (τ, αg⁻¹)` has class `gα⁻¹b`; `β = α⁻¹`, `g∘β = gα⁻¹` | weight `+1` in both forms | none |
| Conv. 6 indexing | `𝔸¹` at 0, `n = 0, 1`; `Spec k[ε]` | lengths 1, 2; `ℐ² = 0`, so `𝒳^{[1]} = 𝒳` | holds | none |
| 0.1 | `Bμ_p/𝔽_p`, atlas the base of the Kummer torsor `𝔾_m → 𝔾_m` | fibre over `Spec k` is the torsor `𝔾_m`, smooth; `μ_p = Spec 𝔽_p[λ]/(λ−1)^p` nonreduced | holds | none |
| 0.2 rigidity | `T → Spec k` mono, `V` affine étale chart; `Spec k → Spec k[ε]`; `Spec ℂ → Spec ℝ` | `V ×_T V = V ×_k V` étale over `V`, base change of `V → Spec k` along the fpqc `V → Spec k`; closed immersion not iso; `ℂ ⊗_ℝ ℂ = ℂ²` | proof sound; field target needed | none |
| 0.3 | `[𝔸¹/𝔾_m]`; `Spec k ⊔ Spec k` | invariant `{0}`, `𝔾_m`; two equivalent, unequal substacks | holds | none |
| 0.4 kernel, powers | origin of `𝔸¹`; `n ≥ 0` | big-site kernel `(t)` over `id`, `0` over the origin, while `(t) ⊗ k = k·t ≠ 0`; `2(n+1) ≥ n+2` | holds | none |
| 0.5 | `Spec k[ε] → 𝔸¹`; empty `T` | image `{0}`, `t ↦ ε ≠ 0` so no factorisation through `Spec k`; empty substack | holds | none |
| 1.1 | closed point of an arbitrary scheme; `η ∈ 𝔸¹_k` | `Spec κ(u) → U` is a closed immersion, so of finite type; `K` finite over `k[t]` forces `k[t]` a field | holds | none |
| 1.2 | `Spec ℚ(i)`, `x = id`, `y = σ`, `a = σ`, `b = id` | `a∘x = σ = b∘y`; one embedding gives `ι ≠ ι∘σ` | holds | none |
| 1.3, 1.4 | `Bμ_3/ℚ`; `𝔾_{a,ℚ}/ℤ`; DM stack | `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ₃)) = ℤ/3`; diagonal pulls back to `ℤ × 𝔸¹ → 𝔸²`, not quasi-compact, image dense without the generic point; unramified over a field is étale, quasi-compact étale is finite | holds | none |
| 2.1 `IsGerbe` versus gerbe over `Spec ℤ` | `𝔸¹_k`; `B𝔾_{m,𝔽_p}`; `B𝔾_{m,ℤ}`; empty stack | `0 ≠ 1` in the sheaf `𝔸¹(k)`; no object over `ℚ`-schemes; line bundles locally trivial; gerbe over the empty space, no object over `Spec ℤ` | the equivalence stated at `README.md:992–994` holds on all four | none |
| 2.2, 2.3 | `[𝔸¹/𝔾_m]` with section `1`; `Bμ_p` | `Isom(1,1) = 1`, `[pt/1] ≠ 𝒳`; smooth over `𝔽_p`, atlas `Spec 𝔽_p` not smooth | holds | none |
| 2.4–2.6 | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]`; `[Spec k[x₀,…]/𝔾_m]`; `Bℤ` | fibres `𝔾_m`, `1`; `(λ−1)ε = 0`, `λ − 1 ∉ εB` since `B/εB = k[λ^±]`; stabiliser `μ_{pⁱ}` where `x₀ = … = x_{i−1} = 0`, `xᵢ ≠ 0`, trivial for `i = 0`, in every characteristic; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` | holds | none |
| 3.1, 3.2 | `U/G` of Example 100.11.6; `Spec k → BG` | `Spec ℚ̄ ×_X U = ⊔_G Spec ℚ̄ → U`, closed points of an absolutely flat ring, flat, not open, so not finitely presented; `Spec k ×_{BG} Spec k = G` | holds | none |
| 3.3–3.5 | scheme; `Spec k[ε]`; gerbe `π` with `𝒵_{π(x)}` | `Spec κ(x)`; `Spec k`; `𝒵_y ×_𝒴 𝒳 → 𝒳` is a mono from a one-point stack smooth over `𝒵_y`, so `𝒵_x` exists and equals it | holds; S03 on the `*Needs:*` | S03 |
| 4.1, 4.2 | closed `u` in an affine chart; `Bμ_p`; `𝔸¹_ℚ/ℤ` at `η` | `u ×_𝒳 u → u` of finite type over a field; atlas `Spec 𝔽_p` flat quasi-finite; `R' = ℤ × Spec ℚ(t)` | holds | none |
| 4.3 | `[𝔸¹/𝔾_m]` at 1; `B(𝔾_{a,ℚ}/ℤ)` | closure of `1` is `|𝒳|`, dense open gerbe `Spec k ∋ 1`; inertia the image of `𝔸¹_ℚ`, quasi-compact | holds | none |
| 4.4 | proof at stacks-06RD lines 3104–3125 | `p⁻¹(Z) → Z` has image `{u}`, the generic point, so factors through every nonempty open and through `u`; `R' = p⁻¹(Z)` closed in `F`, `F → u` smooth | holds; the finite-type step needs the identification, as the README says | none |
| 4.5 | DVR; `U/G` | closed and open immersions; closed point with `Spec ℚ̄ → X` not a closed immersion | holds; hypothesis needed | none |
| 5.1 | two copies of `Spec k[x₁,…]` glued along `⋃D(xᵢ)`; `X × BG_k` | `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁},…,x_{iₙ})`; base change along `T → BG_k` is `X ×_k T`, a scheme | holds | none |
| 5.2 | space case, stacks-decent-spaces lines 1591–1601 | the source's first line uses Lemma 68.13.7; the README's conclusion needs only that the monomorphic representative factors through `𝒵_x` (3.4), in the `*Needs:*` | route closed without 68.13.7 | none |
| 5.3 | `[Spec ℂ/(ℤ/4)]_ℝ`; `Spec ℚ(t)/ℤ` | a real object is a `ℤ/4`-torsor lifting the class of `ℂ`; `H¹(ℝ, ℤ/4) = {0, 2} ↦ 0`; no monomorphism from a field | holds | none |
| 5.4 | `𝔸¹_k` at `η`; glued scheme; `𝔸¹_ℚ/ℤ`; affine `T → 𝒳` | `Spec k(t)` affine over `𝔸¹`, not an immersion; preimage `⋃D(xᵢ)` not quasi-compact; `P(t+n) = P(t)` forces `dn = 0`; `Z × T` affine, so `|𝒵 × T|` quasi-compact | holds | none |
| 5.5 | `Spec κ̄ → Spec κ`; an object of `𝒵_x` over a finite `L/κ(x)` | a closed point of an fppf cover has residue field finite over `κ`, receiving `κ̄`; the same on a cover of `Spec L`, so `k` finite over `κ(x)` | both directions hold | none |
| 6.1, 6.2 | `Spec κ`, `k/κ` Galois; `BG_k`; `(x, id)` in `𝒵_x ×_{𝒵^♭} Spec k` | `R_x = Γ × Spec k`, `G_x = 1`; three products `BG`, `Spec k`, `G`; automorphisms of `(x, id)` over `T` are those of `x|_T`, the base and `Spec k` being sheaves | holds | none |
| 6.3 | `(t, −1)` over `ℚ(t)`; `Spec ℚ(t)` with `σ : t ↦ t²` | tame symbol at `t = 0` is `−1 ∉ ℚ^{×2}`; `(t², −1)` split; `BG_x → 𝒵_x` is `Spec σ`, while `BG_x ≅ 𝒵_x` abstractly | README holds; the docstring does not | S02 |
| 6.4 | section `s` of `𝒵^♭ → Spec k`; `Spec κ` with `k ≠ κ`; origin of `Spec k[x₀,…]` | `q∘s = id` makes `s` a monomorphism, 3.1 gives the point 3.2 needs; `Spec κ ≠ Spec k`; closed immersion with ideal not finitely generated | holds; S04 | S04 |
| 7.1, 7.2 | Artinian `A`, `𝔪^{n+1} = 0`; `𝔸²` at 0; `u ∈ W` with torsor trivial over `L` | `(ℐA)^{n+1} ⊆ 𝔪^{n+1} = 0`; length 3; `J ⊗ O_W = J/J²` by flatness of the chart, dimensions agree after `⊗ L` | holds | none |
| 7.3 | `Bμ_p`; `[𝔸¹/μ_p]`; `GLₙ/G_x`; fibre products `U_x = W ×_{BG_x} Spec k`, `GLₙ = Q ×_{BG_x} Spec k` in §8.3's sequence | `T = {1 + aε} ≅ k` (`(c + dε)^p = c^p`, `μ_p(k) = 1`), `N = 0`; `2 = 1 + 1`; `(n² − dim G) − (n² − dim Lie G)`; `T_{U_x} → T_W → T_{BG_x} → 0` and `T_{GLₙ} → T_Q → T_{BG_x} → 0` exact, surjective by smoothness | holds | none |
| 7.4 | `SL₂` on quadratic forms at `uv`; `𝔾_m` on `𝔸¹` at 0; `E × 𝔾_m` | antidiagonal elements send `uv ↦ −uv`, stabiliser the torus, weights `2, 0, −2`, normal weight 0; `J/J² ⊗ k = k·t` of weight `−1`, dual `+1`; `k·∂_t` of weight `+1` | vector-space statement holds; equivariance has no route | S01 |
| Worked example | finite type DM over `K = K̄`, closed point; `Bℤ` | a finite type representative has `k` finite over `K`, so `k = K`; `G_x = ℤ` étale, not finite | holds | none |

## Dependency check

    depcheck: 237 roadmaps, 2233 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is line 37 of `merge-order/ORDER.txt`, after
AlgebraicModuliForArithmeticGeometry (line 36); its three named suppliers are on main. The
roadmaps under "Downstream consumers" are later in the order (lines 87, 365, 407, 423) and are not
cited as suppliers. No notion was moved down from a later roadmap.

## Verified sound

- `Suggested.lean`: 0 declarations, read whole. Single `import Mathlib`, no `set_option`, no
  `sorry`, no padding. Nine headlines named in the docstring; none is statable: at the pin
  `TauCeti/AlgebraicGeometry/Stack/` holds only `Basic.lean` (`SchPseudofunctor`, line 37), and no
  algebraic stack, inertia, `|𝒳|`, 2-fibre product of stacks or gerbe exists in either library.
  The docstring's wording of two headlines is S02.
- Targets read: 38 of 38, with every Convention, supplier contract, `*Needs:*` line, layer
  Dependencies paragraph, the worked examples and the references (2156 lines). The layer sentence
  at `README.md:520–522` agrees with the `*Needs:*` lines (Layer 7: the union of 7.1–7.4 is
  exactly 0.1–0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4); no target needs a later one.
- Pinned declarations: 27 Mathlib and 18 Tau Ceti locators opened at `1b1ccf4b` and `2fd255d9`;
  all hold the named declaration at the cited line, with the quoted hypotheses
  (`[IsLocallyNoetherian Y]` twice, `[LocallyOfFiniteType …]`, `[Algebra.FiniteType k H]`,
  `[Smooth f] [Nonempty X]`, and `variable [Algebra.FormallySmooth R P]` in the section of
  `iff_split_injection`).
- Source locators: 145 line locators checked by script for the cited label at the cited line; 41
  statements read in full against the README (Lemmas 100.11.2–100.11.5, 100.11.7, 100.11.14,
  100.14.1, Definition 100.11.8; Lemmas 101.4.15–16, 101.5.1, 101.18.3–5, 101.19.1, 101.28.10,
  101.28.12–15, 101.31.1–3, 101.48.2–5, 101.51.1–4, Definitions 101.18.2, 101.48.1,
  Proposition 101.29.1, Example 101.29.2; Decent Spaces 68.13.5–68.13.11; Sheaves on Stacks
  Definition 96.6.1, Lemmas 96.11.2–3, 96.12.5, 96.15.1, Proposition 96.14.3; Groupoids in Spaces
  78.12.6; ahr2020 lines 39–43, 55–58, 248–252, 475–486; rydh2011 lines 1236–1305; alper-moduli
  lines 6955–6965, 6993–6999, 7017–7024, 16528–16549).
- Checks: 142 read; every definition has at least three; 58 recomputed (table above); none false,
  vacuous or a restatement.
- Sibling citations: 47 SchemeAndStackFoundations names found in the cited sections on main
  (51d880d), with §§1.7, 1.12, 1.14, 1.19–1.23, 4.12 read for the statements the README
  attributes to them; AlgebraicModuliForArithmeticGeometry §4.1 (`IsGerbe`,
  `IsGerbe.equivalence_iff`, `relativeGerbe`, `relativePullback`, `relativeComposition`,
  `relativeDescent`), §8.1 (three names), §8.3 (`FramedDeformation`, the reframing `α∘g`,
  `framedDeformation_twoFibre`, `framedTangent_exactSequence`) and §5.4; ReductiveGroups Layers
  1, 3, 3A exist. `roadmaps resolve` on the README: none unresolved. Downstream:
  LanglandsParameterStacks §1.16 (its Checks at lines 523–524), FunctionFieldArithmeticPartII's
  gap (its lines 53 and 7366), MotivicStructuresInModuliOfCurves §§7.3, 8.4, 8.6 and
  VirtualFundamentalClasses §1.2 are as described.
- Declared gaps: 17 slugs, the same in `design/plan.json` and under "Exact supplier contracts",
  each with a named supplier and section. None is provided on main: SchemeAndStackFoundations
  §1.22 has no abelian or tensor structure on `Stacks.QCoh`, §1.21's `quotientStack_algebraic` is
  stated for `quotientStack` of a groupoid scheme, §4.12's `generic_flatness` is over an integral
  base, and neither supplier has decent spaces, quasi-DM stacks or Lemma 98.5.2.
  Not raised.
- Ownership against open work (`roadmaps grep` over main and 445 open heads, by object): closed
  and reduced induced substacks, monomorphisms of stacks, decent stacks, finite type points,
  gerbes over an algebraic stack, residual gerbes, infinitesimal neighbourhoods of substacks: no
  roadmap defines any of them; the hits are uses. `scratch/overlaps.md` lists no shared roadmap,
  dropped id or second copy.
- Policy: `git diff --stat origin/main...HEAD` touches only
  `packages/StackPointsAndResidualGerbes/` (7 files); no pull-request number, process word,
  `lemma`, `set_option` or algorithm in the README or the Lean file; `sources.toml` has 24 entries
  and no local path.
- Arrangement: largest share Morphisms of Algebraic Stacks. Its sections in order are 4, 5, 7, 17,
  18, 19, 21, 27, 28, 29, 31, 33, 48, 50, 51; the layers draw Layer 1 ↔ §§18–19, Layer 2 ↔
  §§28–29, 33, Layer 4 ↔ §§18, 28, 31, 51, Layer 5 ↔ §§48, 50, 51, with Layer 3 from another
  chapter between them and Layers 0, 6, 7 not from it: no one-to-one run. The order 2 → 3 → 4 → 5
  is forced by 3.4 ← 2.4, 4.1 ← 3.2–3.4, 5.2 ← 4.2–4.4.

Source independence: 12 passages compared with 7 sources (stacks-06RD Lemmas 101.31.3, 101.51.1, 101.51.2, 101.19.1, 101.48.1–5, Definition 101.18.2; stacks-06ML Lemma 100.11.7; stacks-sheaves-on-stacks Lemmas 96.12.5 and 96.15.1; stacks-decent-spaces Lemmas 68.13.9–10; ahr2020 lines 475–486; rydh2011 Theorem B.2; alper-moduli Proposition 4.5.16), none shared beyond 7 consecutive words of a standard phrase; largest share Morphisms of Algebraic Stacks (stacks-06RD with stacks-06QB), 54 of 145 locators; contents compared with stacks-06RD: independent.

## Not verifiable

- lmb2000 (Chapter 11, Définition 11.2) and olsson2016 (Chapter 11): uncertified, cited by
  locator; not read. No target rests on them.
- VirtualFundamentalClasses and MotivicStructuresInModuliOfCurves were read in this branch's
  checkout of `packages/`, which may be behind their own pull requests' heads.
- Elaborated signatures: there is no declaration, and this pass runs no Lean.
- Lemmas cited only inside gap sentences for Chapters 72, 74, 79, 94, 97 and 98 were checked for
  the label at the cited line where a line is given, not statement against statement.
- The 104 line locators not listed under "read in full" were checked for the label only.

## Source issues

- **Misprint** in stacks-06RD at Lemma 101.48.2, proof, printed page 98 (stacks-06RD line 4695): the source says the diagonal "is on known" to be quasi-compact; it should be "is only known"; affects nothing.
- **Misprint** in stacks-06QB at Lemma 101.28.13, proof, printed page 61 (stacks-06QB lines 2870–2874): the source writes the map on points from the base to the gerbe three times; it should be from the gerbe to the base; affects nothing.
- **Misprint** in stacks-06RD at Lemma 101.51.2, proof, second paragraph, printed page 102 (stacks-06RD lines 4857–4858): having reduced to a reduced stack with generic point, the source takes the dense open gerbe inside the primed substack; it should be inside the stack itself; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, proof, third paragraph, printed page 102 (stacks-06RD lines 4862–4863): the source says the base of a locally Noetherian gerbe is locally Noetherian by fppf descent, details omitted; it should cite descent along the smooth surjective gerbe morphism (Lemma 101.33.8); affects the proof.
- **Gap** in stacks-06RD at Lemma 101.51.1, proof, printed page 101 (stacks-06RD lines 4837–4838): the source omits why a stack smooth over a reduced locally Noetherian stack is so; it should cite smooth ascent of both properties (Lemma 101.17.5 and Properties of Stacks, Section 100.7); affects the proof.

## For the human reviewers

- **Licence.** `alper-moduli` is an author's draft of lecture notes dated 5 January 2026 (`sources.toml`, `licence_class = "author-page"`); its locators are in 0.2, 1.1, 5.3, 6.2–6.4 and 7.3.
- **Licence.** `sga3-vi-a` is read in the editors' online compilation of 13 October 2024 of the SMF re-edition (`sources.toml`, id `sga3-vi-a`); one locator, inside gap:homogeneous-quotient-scheme.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6c66881cd562574f7fff311022a423db7c102b25", "job": "RT-StackPointsAndResidualGerbes~2a", "model": "fable", "worker": "chris-x29"} -->
