<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13862#issuecomment-6851203603 -->
Red team round 2 pass a (claude) of 86878fa

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) Berkovich's Corollary 7.5.4 is cited with the wrong torsion hypothesis

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:492`: "(berkovich1993, Corollary 7.5.4, page 150, line 5339, for constructible sheaves with torsion orders prime to the characteristic of the base field; huber1996, Theorem 3.8.1)".

   **Claim.** Berkovich's corollary covers every `n` invertible in `K`.

   **Witness.** berkovich1993 lines 113 and 119: the comparison is announced for torsion orders prime to the characteristic of the residue field of `k`; berkovich1993 lines 4225–4226 separate `char(k) = 0` from the residue characteristic `p > 0`. For `K = ℚ_p`, `n = p`, Corollary 7.5.4 (line 5339) does not apply.

   **Values.** `K = ℚ_p`, `Y = 𝔸¹`, `F = ℤ/p` (the Check at `README.md:501`): `n = p` is invertible in `K` and not prime to the residue characteristic, so only huber1996, Theorem 3.8.1 supports that Check. `K = 𝔽_p((t))`, `n` prime to `p`: both sources apply.

   **Repair.** Replace the parenthesis by: "(huber1996, Theorem 3.8.1, as restated by ClassicalAdicEtaleCohomology §11.1, for every `n` invertible in `K`; berkovich1993, Corollary 7.5.4, page 150, line 5339, is the case of torsion orders prime to the residue characteristic, so it does not cover `n = p` when `char K = 0`)". Tested: for `K = ℚ_p`, `n = p` the new text sends the reader to Huber only, which is what the Check at line 501 uses.

2. **F02** (P3) equivariance of a pullback between two covers is used in six places and stated nowhere

   **Location.** `README.md:492`: "so the two pullbacks intertwine the three actions by the composition law of pullbacks (§1.1, Composition)". Also `README.md:245` ("All six follow from §1.1 … (f) because"), `README.md:261`, `README.md:262`, `README.md:288`.

   **Claim.** §1.1 provides `h^* ∘ a^♮ = a′^♮ ∘ h^*` for a morphism `h : Y′ → Y` of covers with `h ∘ a′ = a ∘ h`.

   **Witness.** §1.1 "Composition" (`README.md:197`) is about two automorphisms `a, b` of one `Y`; "Base change of the cover" (`README.md:200`) needs `Y′ = Y ×_X X′` and `a′ = a × id`. For §1.3 (f), `h = id × Spa(τ̂⁻¹) : X_C → X_{C′}` over `id_X` is neither.

   **Values.** §1.3 (f): `Y = X_{C′}`, `Y′ = X_C`, `g = id_X`; `Y ×_X X = X_{C′} ≠ X_C` as a cover. §4.2: `h = pr : Y_C → Y_{K^sep}` over `id_Y`, `Y_{K^sep} ×_Y Y = Y_{K^sep} ≠ Y_C`. In both, the base-change bullet does not apply.

   **Repair.** Replace the bullet at `README.md:200` by: "**Morphisms of covers.** Let `g : X′ → X`, `p′ : Y′ → X′` and `h : Y′ → Y` satisfy `p ∘ h = g ∘ p′`, and let `a′` be an automorphism of `Y′` over `X′` with `h ∘ a′ = a ∘ h`. Then `a′^♮ ∘ h^* = h^* ∘ a^♮` on `H^i(Y, p^{-1}M) → H^i(Y′, p′^{-1} g^{-1} M)`, where `h^*` is the cohomology pullback followed by the coherence isomorphism `h^{-1} p^{-1} ≅ p′^{-1} g^{-1}`: both sides are the pullback along `h ∘ a′ = a ∘ h`, by the composition coherence of EnhancedDerivedSheaves §0.4 and the cocycle identity of the coherence isomorphisms. The case `Y′ = Y ×_X X′`, `h = g_Y`, `a′ = a × id` is base change of the cover; the case `g = id` is a morphism of covers of `X`." At `README.md:492` replace "(§1.1, Composition)" by "(§1.1, Morphisms of covers)"; at `README.md:245` replace "(a) is base change of the cover" by "(a), (e) and (f) are morphisms of covers". Tested on (f): `g = id`, `a = (τστ⁻¹)_X`, `a′ = σ_X`, `h = id × Spa(τ̂⁻¹)` gives `ρ(σ) ∘ h^* = h^* ∘ ρ′(τστ⁻¹)`, the statement of (f); for `τ ∈ G_K` it is `ρ(σ)ρ(τ)⁻¹ = ρ(τ)⁻¹ρ(τστ⁻¹)`, the Check at `README.md:249`.

3. **F03** (P3) §4.2 names the stalk action of §0.3 for a sheaf on `(Spec K)_ét`

   **Location.** `README.md:486`: "the transport on the left is the stalk action of §0.3 on `(R^i f_* M)_{Spec C}` (precomposition of the geometric point with `s`)".

   **Claim.** §0.3 defines the action on this stalk.

   **Witness.** §0.3 (`README.md:166–168`) defines the action on stalks of sheaves on `Spa(K, 𝒪_K)_ét` at `ξ_C`. Here `R^i f_* M` is a sheaf on `(Spec K)_ét`; its stalk action is that of §2.4 (stacks03N1 line 3966), stated at `Spec K^sep → Spec K`.

   **Repair.** Replace the quoted clause by: "the transport on the left is the stalk action of §2.4 (stacks03N1, Tag 03QW) on `(R^i f_* M)_{Spec C}`, where `σ` acts on the geometric point `Spec C → Spec K` through `Spec(σ̂)` and the stalks at `Spec C` and at `Spec K^sep` are identified along `K^sep ⊆ C`, compatibly with `σ̂|_{K^sep} = σ|_{K^sep}`". Tested on `Y = Spec L`, `M = ℤ`: the stalk is `ℤ^{Hom_K(L, K^sep)} = ℤ^{Hom_K(L, C)}` with `e_τ ↦ e_{σ∘τ}` on both, the value of the Check at `README.md:496`.

4. **F04** (P3) the closed-disc computation is cited to a section that states it over one field only

   **Location.** `README.md:539`: "`H⁰(X_C, ℤ/ℓ) = ℤ/ℓ` and the groups vanish in positive degrees (the closed-ball computation of ClassicalAdicEtaleCohomology §11.2; Layer 3, Examples, for `ℤ_ℓ`)".

   **Claim.** §11.2 gives this for every `K` with `ℓ` invertible in `𝒪_K`.

   **Witness.** ClassicalAdicEtaleCohomology §11.2 at its head states the ball computation for "`C`, the completed algebraic closure of `F_p((t))`" only. The general statement is in its §9.6: "The closed disc: `H⁰ = ℤ/n, H^q = 0` for `q > 0`", for `C` algebraically closed and `n` invertible in `C⁺`.

   **Repair.** Replace "(the closed-ball computation of ClassicalAdicEtaleCohomology §11.2; Layer 3, Examples, for `ℤ_ℓ`)" by "(ClassicalAdicEtaleCohomology §9.6, its closed-disc example, for `C` algebraically closed and `n` invertible in `𝒪_C`; Layer 3, Examples, for `ℤ_ℓ`)", and add "9.6 (for a Check)" to the *Needs:* line of §4.4 and to the Layer 4 Dependencies. Tested: `K = ℚ_p`, `ℓ ≠ p`: `C = ℂ_p` is not the field of §11.2 and is covered by §9.6.

Four P3 findings (S01–S04), all in text added or touched by the round-1 repair. No P1 or P2: no statement of `Suggested.lean` or of the README was found false, and every round-1 finding is repaired.

## Round-1 findings at this head

| Finding | Status | Repaired passage (witness) |
|---|---|---|
| 1a/F01 and 1b/F01 (§4.4 "properness is used in every case"; (d) narrower than its source) | repaired | `packages/GaloisActionOnEtaleCohomology/README.md:532`: "(d) `X` quasi-compact quasi-separated and `ℓ` invertible in `𝒪_K`, proper or not (this contains (a))"; `README.md:539`: "Properness is used only when `ℓ` is the residue characteristic, in (b) and in (c) with `ℓ = p`." Recomputed on the refuting instance: closed disc, `ℓ ≠ p`, groups `ℤ/ℓ, 0, 0`, covered by (d); `ℓ = p`, `char K = 0`, `H¹` infinite, no case applies. The Check's supplier locator is S04. |
| 1a/F02 (non-proper comparison neither planned nor disclaimed) | repaired | `README.md:488`: "Without properness, let `Y` be a `K`-scheme of finite type, `n` an integer invertible in `K` and `F` a constructible sheaf of `ℤ/n`-modules". The supplier statement exists with these hypotheses (ClassicalAdicEtaleCohomology §11.1: finite type, constructible, `n` invertible in `k`, no properness). The new text carries S01 and S02. |
| 1a/F03 (later roadmap asks for what §4.2 proves) | repaired | `README.md:559`: "DeligneWeightsAndPurityPartII: the compatibility of the proper algebraic–adic comparison … with the continuous `K`-automorphisms of `C`". A consumer line only; that roadmap is later in the order (line 375 against 121), so no upward edge. |
| 1b/F02 (§2.3 proved the supplier's stalk isomorphism again) | repaired | `README.md:317`: "the isomorphism `(R^i f_* M)_{ξ_C} ≅ H^i(X_C, M_C)` … is ClassicalAdicEtaleCohomology §1.5 (the strict-localisation stalk theorem with its clause (b)". Supplier §1.5 at its head has clauses (a) (natural in `ξ`, `D⁺` form) and (b) (`(C_ξ, C_ξ⁺) = (C, C⁺)`) with the hypotheses quoted in the contract at `README.md:95`. |
| 1b/F03 (§8.2 contract claimed naturality) | repaired | `README.md:97`: "The supplier states no naturality of this map in `R`, `S` or `f`; §4.2 derives what it needs from the pasting of mates." `CategoryTheory.mateEquiv_vcomp` and `mateEquiv_hcomp` are at lines 167 and 205 of `Mathlib/CategoryTheory/Adjunction/Mates.lean` at the pin. The rewritten route carries S03. |
| 1b/F04 (six names, five line numbers) | repaired | `README.md:65`: "lines 291, 477, 496, 506, 491, 414". |

No repair made a statement false. The repair's new statements were recomputed (table below, rows 4.2 and 4.4).

## Record of the adversarial pass

`Suggested.lean` (no `variable` block; every binder is in each signature; compared with the elaborated types of the worker's signature file, nothing lost; no Lean was run in this pass).

| Declaration | Context | Instances tried | Values on each side | Result |
|---|---|---|---|---|
| `SpectralAlgClosure K` with its five instances | `[Field K]`; norm instances add `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]` | `K = ℚ_p`; `ℚ_p(√p)` | carrier `AlgebraicClosure ℚ_[p]`; `‖√p‖ = p^{-1/2}`, max-norm gives `‖√p‖² = 1 ≠ ‖p‖` | each instance is used by the headline; not padding |
| `CompletedAlgClosure K` | the three instance binders | `K` algebraically closed; `K = ℚ_p` | `C = K`; `C` = `UniformSpace.Completion (AlgebraicClosure ℚ_[p])`, the body of `PadicComplex p` | sound |
| `exists_galois_continuousAut_equiv` | the three instance binders | `K = C`; `K = ℚ_2`, `S₃` on `2^{1/3}`; `K = 𝔽_p((t))`; swap of `t₁, t₂ ∈ ℂ_p`, `‖t₁‖ = 1`, `‖t₂‖ = p⁻¹` | `1 ↔ 1`; `sr(α) ≠ rs(α)` for each of the three involutions `s` (`ζ²α/ζα`, `ζα/α`, `α/ζ²α`), so conjunct 2 is the homomorphism; `σ̂(t^{1/p}) = t^{1/p}`; the swap is not an isometry, hence excluded by `≃A[K]` | true as typed; conjunct 1 excludes a wrong `e`, 2 the inverse convention, 3 a proper image, 4 the discrete topology on `G_K` |

README targets.

| Target | Instances and computed values | Result |
|---|---|---|
| 0.1 | `X^{p^e} − tX − b`: derivative `−t ≠ 0`; coefficient difference from `X^{p^e} − b` is `‖t‖` in degree 1 only, degrees equal, both monic, second splits in `K̄`: the hypotheses of the pinned lemma (line 52); `𝒪_L ∩ ϖ^n𝒪_{K^sep} = ϖ^n𝒪_L` | ok |
| 0.2 | `‖σ̂y − σ̂₀x‖ ≤ max(‖y − a‖, 0, ‖a − x‖)`; roots of a minimal polynomial in `C` lie in `K̄` | ok |
| 0.3 | étale `V` over the one-point `Spa(K, 𝒪_K)` is a disjoint union of points `Spa(L_s)`; `μ_4(ℚ_3)` order 2 against `μ_4(K^sep)` order 4; cyclic cubic: `g ≠ g⁻¹` | ok |
| 1.1 | `H⁰(p^{-1}h_V) = Hom_X(Y, V)`, `a^♮b^♮(s) = s∘b∘a = (b∘a)^♮(s)`; `δ_1 ↦ δ_s ↦ δ_{rs}` against `δ_{sr}`; `E_{21}E_{12}e_1 = 0`, `E_{12}E_{21}e_1 = e_1`; `Tor_n^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`; morphisms of covers | S02 |
| 1.2 | `id ⊗ σ̂` on `∏_τ C`: `(y_τ) ↦ (σ̂ y_{σ⁻¹τ})`, component `τ ↦ σ⁻¹τ`, `e_τ ↦ e_{στ}`; cubic: rank 3, trace 1 | ok |
| 1.3 | (f) for `τ ∈ G_K`: `ρ(τ)⁻¹ρ(τστ⁻¹)ρ(τ) = ρ(σ)`; Kummer: `(K^sep)^×` is `n`-divisible, `H¹(G_K, (K^sep)^×) = 0` | ok (route: S02) |
| 1.4 | `k^sep ⊗ k(u^{1/p}) = k^sep[T]/(T^p − u)`, a field; `k̄[T]/(T − u^{1/p})^p` | ok |
| 2.1 | `σ_{X,L} : X_{σL} → X_L`, identity for `σ ∈ G_L`; stabiliser `ker χ_ℓ`, index infinite | ok |
| 2.2 | `ℚ(2^{1/3})^{⊗2}`: degrees `3 + 6`, ranks `1, 2, 3` | ok |
| 2.3 | supplier clause (b) with `Y = Spa(K, 𝒪_K)`: `X ×_Y Spa(C, 𝒪_C) = X_C`; order of 2 mod 3, 9, 27 is 2, 6, 18; `(ℤ/3)²` of order 9 | ok |
| 2.4 | `(i, 1) ↦ (σ(1), σ(i)) = (1, −i)`; `[ℚ(μ_{ℓ^m}) : ℚ] = ℓ^{m−1}(ℓ − 1)` | ok |
| 2.5 | `Br(ℚ_2)[5] = ℤ/5`; `H²(ℤ/5(−1)) ≅ H⁰(ℤ/5(2))^∨`, `2² = 4 ≢ 1 (mod 5)`, zero | ok |
| 2.6 | `F_{X_{k̄}} = (F_X × id) ∘ φ_X`, so `(F_X × id)^* = ρ(φ)⁻¹`; `2 · 4 = 8 ≡ 1 (mod 7)` | ok |
| 3.1 | `ℤ/ℓ^n ⊗^L_{ℤ_ℓ} ℤ/ℓ^m`: `H⁰ = ℤ/ℓ^m`, `H^{−1}` transitions are multiplication by `ℓ`, pro-zero, so derived reduction holds with no finiteness; `lim¹(ℤ ←ℓ ℤ) = ℤ_ℓ/ℤ` | ok |
| 3.2 | `G_K × H → H_n` and `ℤ_ℓ × H → H_n` factor through discrete `H_n`; stabiliser `G_{K(μ_{ℓ^∞})}` | ok |
| 3.3 | basis closed under `∩` and `ℓ^{±1}` (a subgroup containing an open subgroup is open); `G·W ⊆ U` by a finite subcover, the generated subgroup is open and stable; `⋂σ(Ω)` absorbing by compact orbits; `A = ∏ℤ_ℓ`: `e_m ∈ ℓΩ` for large `m`; `A = ℚ_ℓ` indiscrete: `Ω = V` | ok |
| 4.1 | `χ·χ⁻² = χ⁻¹` against `χ³`; at `q = 2`, `n = 7`: `4` against `1`; `ℙ¹`: `1 = 4·2` | ok |
| 4.2 | `𝔾_m`: `𝒪^×/n = ((K^sep)^× × ℤ)/n = ℤ/n`, trivial action, `ℤ/n(−1)` with Frobenius `q⁻¹`; `𝔽_p((t))`, `n = p`: `aT^{mp^k} ≡ a^{1/p^k}T^m`, image `⊕ K̄·T^m ⊊ ⊕ C·T^m`; `K = ℚ_p`, `n = p`: Huber only | S01, S02, S03 |
| 4.3 | `a_{2^k(2m+1)} = c_m^{2^k} = c_m`; `H/ℓH ↪ H^i(ℤ/ℓ(j))`; `H^N(ℤ/ℓ^{n+1}) → H^N(ℤ/ℓ^n) → H^{N+1}(ℤ/ℓ) = 0`; Enriques `ℤ_2^{10} ⊕ ℤ/2`, rank 10 | ok |
| 4.4 | disc, `ℓ ≠ p`: `1, 0, 0`; `⊔_m Spa(K)`: `∏ℤ/ℓ` infinite; `ℙ^d`: degrees `0, 2, …, 2d`; `dim.tr(X_C/Spa(C)) = d` | S04 |

## Dependency check

```
depcheck: 208 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** 3 named declarations and 5 instances, every line of `Suggested.lean`. `import Mathlib` only, no `set_option`, no `lemma`, no sorry'd data; the module docstring names every end theorem of the README Summary that is not stated, with the missing carrier. No padding. Not-statable claims rechecked at the pin: Mathlib's `AlgebraicGeometry/Sites` has no continuity of base change for `Scheme.smallEtaleTopology`; Tau Ceti has no étale site on `TauCeti.AdicSpace`, and no extension of `Field.absoluteGaloisGroup` to a completion (searched by object: `Completion.map`, `≃A[`, `PadicComplex`).
- **Targets read:** all 20 sections, Conventions, the supplier contracts, Examples, Worked examples, Downstream consumers, every line.
- **Checks tested:** 91 Checks read; 88 recomputed and correct as statements (S04 concerns a locator inside one). Three were read and not recomputed in this pass: the independence of the units `1 + aT^m` (§4.3, last Check), the transport to `completedGaloisAction` of PadicPeriodRings §1.1 (§0.2), and the curve Check through rigid GAGA (§4.2). Every definition has at least three.
- **Locators verified (21 this round):** berkovich1993 lines 113, 119, 4225, 5110, 5339 (printed pages 143, 150); huber2007 lines 949–951, 953, 963; dejongvanderput1996 lines 1477–1488, 1571, 1594–1606; stacks03N1 lines 3963–3969; hansenzavyalov2023 lines 1706, 1708; milneLEC line 4860; zavyalov2025 lines 3798–3802. One misdescribed (S01).
- **Pinned declarations checked (14):** `mateEquiv` 84, `mateEquiv_vcomp` 167, `mateEquiv_hcomp` 205; `exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` 52 with its hypotheses; `isMittagLeffler_of_surjective` 104, `subsingleton_limOne_of_isMittagLeffler` 191; `Module.Finite.of_quotient_smul_top` 164; `TopRep` 31, `TopRepEquivActionTop` 212; `ContinuousRep` 82 (argument order `Γ A M`), `toContRepresentation` 150; `PadicTateTwist` 88; `continuousLocalCyclotomicCharacter` 54; `Field.absoluteGaloisGroup` 42.
- **Sibling citations checked (17 this round, at the open heads or on main):** ClassicalAdicEtaleCohomology §1.5 (stalk theorem, clauses (a), (b)), §9.6, §11.1 (non-proper comparison; finiteness, with "smooth" covered), §11.2 (`cd_ℓ(X) ≤ 2 dim.tr(X/S)` over a geometric point); EtaleCohomologyFoundations §F.2.2 (invariance under extension of separably closed fields), §F.3.0; AdicEtaleGeometry A1.7 (*geometric-point-etale-split*); PadicDifferentialEquationsAndRigidCohomology §RD.0.33 (every characteristic); AInfCohomology §AI.3.1 (`AInf.primitive_mod_p_comparison`: finite, zero above `2 dim X`). The 16 names of the worker's citation list are supplier names that exist in their roadmaps, not library names.
- **Gap:** `gap:proper-rigid-finiteness` has the same slug, supplier and `needs` in `design/plan.json` and in `README.md:102`; the contract says which case remains after §§9.7 and 11.1; huber2007 line 963 supports it (quasi-separated, finite type, `k` algebraically closed, no restriction on `char k`).
- **Ownership against open work:** searched main and the open heads by object (`Aut_cont`, continuous automorphisms of `C`, the three Lean names, the roadmap's name): no second owner and no colliding name; no roadmap cites this one, so the renamed §4.2 heading breaks nothing.
- **Policy:** the pull request changes only `packages/GaloisActionOnEtaleCohomology/`; no pull-request number or process word in the README or the Lean file.
- **Copyright:** wording compared at each verified locator and at README §§0.2, 1.2, 2.3, 2.5, 4.3, 4.4 (d), the contract at line 102 and the headline docstring; arrangement compared with the sections of dejongvanderput1996 (its §3.6 and §3.7 meet parts of Layers 1 and 2 only; Layers 0, 3, 4 have no counterpart); nothing reused as it stands.

Source independence: 13 passages compared with 7 sources, none shared; largest share dejongvanderput1996 (tied with stacks03N1), 12 of 64 locators; contents compared with dejongvanderput1996: independent.

## Not verifiable

- huber1996 (Proposition 2.3.10, Corollaries 2.4.6 and 2.8.3, Theorems 3.7.2 and 3.8.1, Proposition 6.1.1), huber1994, sga4half, serreGC1997: uncertified, not read. In particular the hypotheses of Theorem 3.8.1 (which S01 makes the only source for `n = p`, `char K = 0`) were checked only against the supplier's restatement.
- Elaboration: no Lean was run; the elaborated types are those of the worker's signature file.
- The OCR of berkovich1993 does not distinguish `k` from its residue field in the statement of Corollary 7.5.4 itself (line 5340); the reading "residue field" rests on lines 113, 119 and 4225.

## Source issues

- **Gap** in dejongvanderput1996 at Corollary 3.7.5, printed page 39: the source says the spectral sequence holds for every abelian sheaf, while its proof identifies the fibre cohomology with the stalk only for overconvergent sheaves; it should assume overconvergence or justify the general case; affects a stated result.

## For the human reviewers

- **Not tested.** huber1996 carries 11 of 64 locators and is uncertified (`packages/GaloisActionOnEtaleCohomology/sources.toml`, `status = "uncertified"`); wording and arrangement were not compared with it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "86878faec825b8de84952e93595c3dcadc438aaa", "job": "RT-GaloisActionOnEtaleCohomology~2a", "model": "fable", "worker": "chris-x15"} -->
