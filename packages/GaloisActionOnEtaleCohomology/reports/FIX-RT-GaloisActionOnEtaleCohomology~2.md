# FIX-RT-GaloisActionOnEtaleCohomology~2: repair of red-team round 2 (passes a and b)

The two reviews contain eight findings. 2a/F02 and 2b/F01 are about the same §1.1 bullet and are settled with one repair. Before any edit, every finding was checked against the supplier texts (ClassicalAdicEtaleCohomology at its open head; AdicSpacesPartII, SchemeAndStackFoundations and EnhancedDerivedSheaves on main), the pinned Mathlib and the cached sources. All eight findings are correct. Only `packages/GaloisActionOnEtaleCohomology/README.md` changed. `Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged.

## RT-GaloisActionOnEtaleCohomology~2a/F01 (P3) — applied

Changed: in §4.2, the citation "(berkovich1993, Corollary 7.5.4 … torsion orders prime to the characteristic of the base field; huber1996, Theorem 3.8.1)" is replaced by: huber1996, Theorem 3.8.1, as restated by ClassicalAdicEtaleCohomology §11.1, for every `n` invertible in `K`. Berkovich's Corollary 7.5.4 is described as the prime-to-residue-characteristic case, which misses `n = p` when `char K = 0`.

Evidence: berkovich1993 lines 113 and 119 state the comparison for torsion orders prime to the residue characteristic. Lines 4225–4226 show that the same OCR symbol denotes the residue field. ClassicalAdicEtaleCohomology §11.1 at its head states the comparison for "`n>0` prime to `char(k)`", adding "In characteristic zero there is no residue-characteristic restriction on `n`". Checked for the same misreading: the other Berkovich citations (Theorem 7.1.1, any torsion sheaf; Corollary 7.4.4, used only with `ℓ` invertible in `𝒪_K`) are correct.

## RT-GaloisActionOnEtaleCohomology~2b/F01, RT-GaloisActionOnEtaleCohomology~2a/F02 (P2) — applied

Changed: the §1.1 bullet "Base change of the cover" becomes "Morphisms of covers". It defines `h^♯` for any `h : Y′ → Y` over `g : X′ → X`, proves `(h∘h′)^♯ = h′^♯∘h^♯` and `a′^♮∘h^♯ = h^♯∘a^♮`, and assumes no fibre product. Base change is the case where `Y ×_X X′` exists in the setting (AdicSpacesPartII §R0.7). Two Checks were added, and R0.7 was added to Needs.

Evidence: 2b/F01 is right. AdicSpacesPartII §R0.7 on main says "Fibre products of adic spaces do not exist in general". *fibre-products-existence* needs (a) `f` locally of finite type or (b) weakly finite type with `g` adic. `Spa(C) → Spa(K)` satisfies neither. 2a/F02 is also right: the §1.3 (f) map `id × Spa(τ̂⁻¹) : X_C → X_{C′}` and the §4.2 map `Y_C → Y_{K^sep}` are not base changes of the cover.

The same construction is now cited at every place that uses it:
- §1.3: (a), (e) and (f) are morphisms of covers, with each `h` named.
- §1.4: bullets 2 and 3.
- §2.1, bullet 2: through the composition law, for `pr_{C/L} ∘ σ_X = σ_{X,L} ∘ pr_{C/σL}`.
- §1.2, pro-étale bullet: the square formed by `ν`.
- §4.2: the proper base-change step, and both nonproper squares.

The second nonproper square goes through the analytification morphism of sites, so it crosses settings. The bullet says its route uses only exact, pseudofunctorial inverse images. §4.2 names its inputs: ClassicalAdicEtaleCohomology §§8.2, 11.1 and EnhancedDerivedSheaves §0.4. EnhancedDerivedSheaves §0.4 on main gives the enhanced adjunction for "an exact inverse-image functor … compatible with composition", so it applies to these morphisms too.

## RT-GaloisActionOnEtaleCohomology~2a/F03 (P3) — applied

Changed: in §4.2, "the stalk action of §0.3 on `(R^i f_* M)_{Spec C}`" becomes "the stalk action of §2.4 (SchemeAndStackFoundations §2.15; stacks03N1, Tag 03QW, line 3966) on `(R^i f_* M)_{Spec C}`, a stalk of a sheaf on `(Spec K)_ét`". `σ` acts through `Spec(σ̂)`, and the stalks at `Spec C` and `Spec K^sep` are identified, using `σ̂|_{K^sep} = σ`. SchemeAndStackFoundations §2.15 was added to Needs.

Evidence: §0.3 defines the action only on stalks of sheaves on `Spa(K, 𝒪_K)_ét`. stacks03N1 lines 3966–3969 define the action for `σ ∈ Aut(κ(s̄)/κ(s))` at any geometric point, so it applies to `σ̂` at `Spec C → Spec K` directly.

## RT-GaloisActionOnEtaleCohomology~2a/F04 (P3) — applied differently

Changed: the §4.4 Check cited "the closed-ball computation of ClassicalAdicEtaleCohomology §11.2". It now cites "ClassicalAdicEtaleCohomology §10.4, for a closed disc of radius in `|C^×|` over `Spa(C, 𝒪_C)`, `C` algebraically closed, and `ℤ/n` with `n` prime to the residue characteristic". A §10.4 contract bullet was added, and §10.4 was added to Scope, to the §4.4 Needs ("for a Check") and to the Layer 4 Dependencies.

Why differently: the finding is right. The computation cited as "§11.2" is the Layer 11 Examples paragraph, which is only for `C` the completed algebraic closure of `F_p((t))`. The review proposed §9.6, where the closed disc appears only as an example line of a curve-finiteness statement. ClassicalAdicEtaleCohomology §10.4 (its head, "Cohomology with and without supports") states the computation as a theorem with exactly the Check's hypotheses: `C` algebraically closed, radius in `|C^×|`, `n` prime to the residue characteristic. That is the better citation.

## RT-GaloisActionOnEtaleCohomology~2b/F02 (P3) — applied

Changed: at the end of the §2.5 paragraph, the following target was added. For a scheme `X`, the Leray-form spectral sequence agrees from `E_2` on with the continuous case of SchemeAndStackFoundations §2.15 (`hochschildSerre_galois_covering`) for `X_{k^sep} = lim_L X_L → X`. `σ` acts on the left by `(σ⁻¹)_X`, so the induced action is `ρ`. A scheme-side Check was added, and §1.1 was added to Needs.

Evidence: SchemeAndStackFoundations §2.15 on main (`README.md` lines 4926–4928) gives "for a profinite Galois covering the continuous version". The name was in the §2.5 Needs line but was not used in the text. Convention: `ℓ_σ := (σ⁻¹)_X` satisfies `ℓ_{στ} = ℓ_σ ∘ ℓ_τ`, and the §1.1 rule `g ↦ (ℓ_g⁻¹)^♮` gives `(σ_X)^♮ = ρ(σ)`.

## RT-GaloisActionOnEtaleCohomology~2b/F03 (P3) — applied

Changed: in the Mathlib contract, "`IsAlgClosed.of_exists_root` and the continuity of roots … are used" becomes "The continuity of roots … is used".

Evidence: the name occurred only in that sentence. The §0.1 density argument uses only `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt`, which is at line 52 of `Mathlib/Analysis/Normed/Field/Approximation.lean` at the pin. Its hypotheses `f.eval a = 0`, `f.Monic`, `g.Monic`, equal `natDegree`, close coefficients and `g.Splits` all hold for `X^{p^e} − b` and `X^{p^e} − tX − b` over `K̄`.

## RT-GaloisActionOnEtaleCohomology~2b/F04 (P3) — applied

Changed: a sentence was appended to the Scope paragraph on AInfCohomology. ClassicalAdicEtaleCohomology §9.7 states the `G_K`-equivariance of `t_X` and of its pairings for the action its field-point stalk comparison transports from the stalk at `ξ_C` of `R^i f_*`. §2.3 identifies that action with `ρ`. This roadmap consumes from §9.7 its finiteness theorem and the morphism of sheaves inducing `t_X`, not the equivariance.

Evidence: ClassicalAdicEtaleCohomology §9.7 at its head says "a `G_K`-equivariant map `t_X` … The field-point stalk comparison transports the continuous Galois action", and states its pairings "perfect and `G_K`-equivariant". The review's text said §9.7 is consumed only for the sheaf morphism. That is incorrect: §4.4 (a) uses its finiteness, so the sentence names both.

## Checks

- **Elaboration.** `lake env lean packages/GaloisActionOnEtaleCohomology/Suggested.lean`, run from the content checkout, exits 0. Its only message is `Suggested.lean:120:8: warning: declaration uses 'sorry'` (the headline). The file is unchanged this round.
- **Signatures.** I put `#check @SpectralAlgClosure`, `#check @CompletedAlgClosure` and `#check @exists_galois_continuousAut_equiv` in one scratch copy and elaborated it once:
  - `SpectralAlgClosure : (K : Type u_1) → [Field K] → Type u_1`
  - `CompletedAlgClosure : (K) → [NontriviallyNormedField K] → [CompleteSpace K] → [IsUltrametricDist K] → Type u_1`
  - `exists_galois_continuousAut_equiv` has the same three instance binders and the four conjuncts of README §0.2: extension, `e (σ * τ) = e σ ∘ e τ`, bijectivity, joint continuity.

  Nothing was lost and nothing changed, and the types agree with the README.
- **Dependency check** (command of the brief):

  ```
  depcheck: 213 roadmaps, 1923 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The suppliers cited for the first time this round are on main (AdicSpacesPartII §R0.7, EnhancedDerivedSheaves §0.4, SchemeAndStackFoundations §2.15) or earlier in the order (ClassicalAdicEtaleCohomology §10.4).
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.
- No gate failures were listed for this round.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §1.1 Morphisms of covers, definition | `X′ = X`, `g = id`, `Y′ = Y`, `h = a` | `e_a = c_a`, so `h^♯ = a^♮` | consistent with the definition of `a^♮` |
| §1.1 composition law | `h = a`, `h′ = b` (automorphisms over `X`); `h = h′ = id`; `Y′ = ∅` | `(a∘b)^♮ = b^♮∘a^♮`, matching the Composition bullet; `id^♯ = id`; `0 = 0` | sound |
| §1.1 intertwining (new Check) | `K = ℚ_2`, `L/K` finite separable, `X′ = Spa L`, `Y = Spa C`, `M = μ_5`, `σ` Frobenius lift | `h^♯` diagonal; `a′^♮∘h^♯(ζ) = (σζ)_τ = (ζ²)_τ = h^♯∘a^♮(ζ)`; with `(a^{-1})^♮`: `(ζ³)_τ ≠ (ζ²)_τ` | sound; wrong model excluded |
| §1.1 base-change clause | `Y = X_C`, `g` rigid: `X_C ×_X X′ = X′_C` (R0.7 (a), `X′ → Spa K` locally of finite type, `X_C` locally noetherian); `Y = X′ = Spa C` over `Spa K` | exists; no supplier fibre product, and nothing is asserted about one | sound; negative Check added |
| §1.3 (f) as a morphism of covers | `K̄′ = K̄`, `τ ∈ G_K` | `h∘σ_X = id × Spa(σ̂τ̂⁻¹)`; `(τστ⁻¹)_X ∘ h = id × Spa(τ̂⁻¹ τ̂σ̂τ̂⁻¹) = id × Spa(σ̂τ̂⁻¹)`; gives `ρ(σ)ρ(τ)⁻¹ = ρ(τ)⁻¹ρ(τστ⁻¹)`, the existing Check | sound |
| §1.3 (e) as a morphism of covers | `K = 𝔽_p((t))`, `L = K(t^{1/p})` | `G_L = G_K`, `(X_L)_C = X_C`, `h` an isomorphism, the actions agree | sound |
| §1.3 (a) as a morphism of covers | `X = Spa K`, `X′ = Spa L`, `M = ℤ` | `g_C^* : ℤ → ℤ^{Hom_K(L,C)}` diagonal, commutes with `e_τ ↦ e_{στ}` | sound |
| §1.4 bullets 2–3 | `k = 𝔽_p(u)`, `X = Spec k(u^{1/p})`; `k′ = k` | `H⁰ = ℤ` on both sides, trivial action; identity | sound |
| §2.1 bullet 2 via composition | `σ ∈ G_K`, `L` finite | `pr_{C/L}∘σ_X` and `σ_{X,L}∘pr_{C/σL}` both correspond to `L → C`, `x ↦ σ(x)`; for `σ ∈ G_L`, `σ_{X,L} = id` gives bullet 3 | sound |
| §1.2 pro-étale bullet | `X = Spa K`, `M = μ_n` | `μ_n(C)` with `ζ ↦ σ(ζ)` on both sites | sound |
| §2.5 scheme comparison | `X = Spec k′`, `ℱ = ℤ/n`; `X = Spec ℚ_2`, `μ_5` | `E_2^{p,0} = H^p(G_{k′}, ℤ/n)` in both forms, `E_2^{p,q>0} = 0`; `ℤ/5` for `ρ`, `0` for `σ ↦ ρ(σ⁻¹)` (`2² = 4 ≢ 1 mod 5`) | sound; direction pinned |
| §4.2 proper, stalk transport | `Y = Spec L`, `M = ℤ`; `K = C` | stalk `ℤ^{Hom_K(L,C)}`, `u ↦ u∘Spec(σ̂)` sends `τ ↦ σ̂∘τ`, so `e_τ ↦ e_{στ}`, as in the §4.2 Check; trivial | sound |
| §4.2 nonproper, citation | `K = ℚ_p`, `n = p`; `K = 𝔽_p((t))`, `n = ℓ ≠ p`; `K = 𝔽_p((t))`, `n = p` | Huber/§11.1 applies, Berkovich does not; both apply; neither (excluded by the statement's hypothesis, as the existing negative Check shows) | sound |
| §4.2 nonproper, mixed square | `Y = 𝔾_m`, `F = μ_n` | `H¹ = ℤ/n` with trivial action on all three groups | sound |
| §4.4 Check, closed disc | unit disc (radius `1 ∈ |C^×|`), `ℓ ≠ p`; `ℓ = p`, `char K = 0`; residue characteristic 0 (`K = ℂ((t))`) | `(1, 0, 0)` by §10.4; excluded by §10.4 (`H¹` infinite); every `ℓ` is allowed, matching "`ℓ` invertible in `𝒪_K`" | sound |
| Scope sentence on §9.7 | `X = ℙ¹_K` | `R²f_*μ_n` constant; `t_X(c₁(𝒪(1))) = 1`, invariant for the stalk action and for `ρ` | sound |
| Mathlib contract (2b/F03) | `f = X^{p^e} − b`, `g = X^{p^e} − tX − b` over `K̄` | monic, equal degree, coefficient difference `‖t‖` in degree 1 only, `g` splits | sound |

Recomputed with the changed objects: the §1.2 Check (`e_τ ↦ e_{στ}`), the §1.3 (f) Check, the §4.2 Checks on `Spec L`, `𝔾_m` and `𝔸¹`, and the §4.4 disc Check. All still hold.

## Ownership

- **Morphisms of covers.** This generalises §1.1, which this roadmap owns. Searched by object across main and the open heads for "morphism(s) of covers" and "automorphisms of the cover": the hits are about topological covers (BelyiMaps, UniversalCovers), so there is no second owner. EnhancedDerivedSheaves §0.4 supplies the composition coherence it uses, not the statement.
- **Other edits.** They add no new object: they are citations of existing owners (ClassicalAdicEtaleCohomology §§10.4, 11.1; SchemeAndStackFoundations §2.15) or comparisons with them.
- **Open pull requests.** Ownership was checked through the brief's tools (`roadmaps grep`, `roadmaps show`) at the open heads.

## For the maintainer

- No Lean name changed, and no id that other roadmaps cite changed. The §1.1 bullet heading changed from "Base change of the cover" to "Morphisms of covers"; no roadmap cites the old heading. The overlap tool lists no roadmap citing this one.
- ClassicalAdicEtaleCohomology is cited at its open head; §10.4 is a newly cited section of it. If that pull request renumbers Layer 10, the §4.4 Check and the contract bullet must follow.
- Both reviews, independently, flag a gap in dejongvanderput1996, Corollary 3.7.5: the source does not assume overconvergence in the statement, but its proof relies on it. This roadmap already cites that corollary only together with "whose proof treats overconvergent sheaves" and supplies the general case through §2.1 and huber1996. No edit was needed.
- No source was fetched and no text is missing; `needs-references.toml` was not written. No passage in the reviews was suspicious.
