# FIX-PKG-GaloisActionOnEtaleCohomology~3

Repair round on the findings of `REV-PKG-GaloisActionOnEtaleCohomology~2` (one review, one finding). File changed: `packages/GaloisActionOnEtaleCohomology/README.md` (§§2.3 and 2.4 only). `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Changed: §2.3, third consequence: "For `g : X′ → X` over `Spa(K, 𝒪_K)`, the base-change morphism …" → "For a morphism `g : X′ → X` of quasi-compact quasi-separated rigid `K`-spaces, with `f′ := f ∘ g`, the morphism induced by the unit `M → Rg_* g^{-1}M` and `Rf′_* ≅ Rf_* ∘ Rg_*` (ClassicalAdicEtaleCohomology §1.3) corresponds to `g_C^*` of §1.3 (a)", with a route and a negative-control Check. §2.4 inherits the hypothesis, with its own scheme Check.

Evidence that the finding is right: dejongvanderput1996 line 1571 (Theorem 3.7.3) assumes the morphism quasi-compact. The text had no hypothesis on `X′`, and `f′` was never defined. In the reviewer's witness (`K = ℚ_p`, `X′ = ⊔_m Spa(K(μ_{ℓ^m}))`, `M = ℤ/ℓ`), the stalk of `g_*ℤ/ℓ` is the open-stabiliser part of `H⁰(X′_C, ℤ/ℓ)`. The element `(δ_{ι_m})_m` is not in it, because its stabiliser is `G_{K(μ_{ℓ^∞})}`.

Where the repair differs from the suggested text, and why:

- The morphism is not called a "base-change morphism". `f′ = f ∘ g` is a composite, not a base change in a cartesian square. The map is defined by the unit of `g^{-1} ⊣ Rg_*` and the composition isomorphism.
- The new Check computes the witness explicitly (`[L_m : K] = 2, 6, 18` for `p = 2`, `ℓ = 3`, `m = 1, 2, 3`). It does not point forward to §3.2, so it does not depend on a later layer.
- For schemes I added a separate Check, `X = Spec ℚ`, `X′ = ⊔_m Spec ℚ(μ_{ℓ^m})`. It comes with a control: the constant family `⊔_m Spec ℚ` does not separate the two statements.
- The *Needs* lines were extended for the new route. §2.3 now needs §1.3 (a) and ClassicalAdicEtaleCohomology §1.3. §2.4 now needs SchemeAndStackFoundations §2.2.

I searched the whole roadmap for the same pattern: a dictionary or discreteness statement applied to a second space with no hypothesis on it.

- §1.3 (a), equivariance of `g_C^*` for any `g`: true without quasi-compactness. It is base change of the cover in §1.1 and uses no colimit.
- §3.2, fourth bullet (pullbacks are continuous equivariant maps in the limit): true without quasi-compactness of `X′`. Each pullback is an inverse limit of homomorphisms between discrete groups, and equivariance comes from §1.3.
- §2.5 and §4.3 already assume `X` qcqs.
- §4.2 applies §2.4 to a proper `Y`, which is qcqs.
- §4.4 (c) applies §2.3 to `Y^an` with `Y` proper, which is qcqs.

None of these needed a change.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.3, third consequence (repaired) | `X = Spa(ℚ_2)`, `X′ = ⊔_{m≥1} Spa(L_m)`, `L_m = ℚ_2(μ_{3^m})`, `M = ℤ/3`, `i = 0` | `[L_m : ℚ_2]` = order of `2` mod `3^m`: `2` (`2² = 4 ≡ 1 mod 3`), `6` (powers mod 9: 2, 4, 8, 7, 5, 1), `18` (`2⁶ ≡ 10`, `2⁹ ≡ −1 mod 27`). `H⁰(X′_C) = ∏_m (ℤ/3)^{2·3^{m−1}}`; stabiliser of `(δ_{ι_m})_m` is `G_{ℚ_2(μ_{3^∞})}`, of infinite index | excluded by the new hypothesis; the old text was false here | hypothesis added |
| same | `X′ = Spa(L_1)` (qcqs), `M = ℤ/3`, `i = 0` | both sides `(ℤ/3)^{Hom(L_1, C)}`, order `3² = 9`; the morphism `ℤ/3 → (ℤ/3)²` is the diagonal, which is the pullback of constant functions | true | none |
| same | `g = id_X`; `X′ = ∅` | `f′ = f`, the morphism is the identity and so is `g_C^*`; with `X′ = ∅`, `R^i f′_* = 0` and `H^i(∅) = 0`, so both maps are zero | true | none |
| same, `i > 0` | `X = Spa(K)`, `X′ = Spa(L)` with `L/K` finite separable, `M = μ_n`, `i = 1` | `R¹ id_* μ_n = 0`; `R¹g_*μ_n = 0` because `g` is finite (dejongvanderput1996 Corollary 3.7.4, line 1588); `H¹(⊔ Spa C, μ_n) = 0` | true | none |
| same, nonzero restriction degree | `X = ℙ¹_K`, `X′ = Spa(K)` a rational point, `M = ℤ/n` | `i = 2`: `ℤ/n(−1) → 0`, and `g_C^*` on `H²` is zero (a point has no `H²`); `i = 0`: `ℤ/n → ℤ/n` is the identity on both sides | true | none |
| §2.4, inherited consequence | `k = ℚ`, `X = Spec ℚ`, `X′ = ⊔_m Spec ℚ(μ_{3^m})`, `M = ℤ/3` | factor sizes `[ℚ(μ_{3^m}) : ℚ] = 3^{m−1}·2 = 2, 6, 18`; stabiliser of the indicator family is `G_{ℚ(μ_{3^∞})}`, not open | excluded by the new hypothesis | hypothesis added; Check added |
| same | constant family `X′ = ⊔_m Spec ℚ`, `M = ℤ/3` | `H⁰(X′_{ℚ̄}) = ∏_m ℤ/3` with trivial action; it equals the stalk `colim_L ∏_m ℤ/3` | does not separate the two statements | recorded as a control in the Check |
| same | `k = ℝ`, `X = Spec ℝ`, `X′ = Spec ℂ`, `M = ℤ/2` | `ℤ/2 → (ℤ/2)^{Hom_ℝ(ℂ,ℂ)} = (ℤ/2)²` is the diagonal; the pullback `H⁰(Spec ℂ) → H⁰(Spec(ℂ ⊗_ℝ ℂ))` is the diagonal | true | none |
| same, characteristic `p` | `k = 𝔽_p(u)`, `X′ = Spec k(u^{1/p})`, purely inseparable | `X′_{k^sep}` is one point; both sides are `ℤ/ℓ` and the map is the identity | true | none |
| §2.3 route ("colimit over `L` of pullbacks") | `X′ = Spa(L_1)`, `L = K` versus `L ⊇ L_1` | `H⁰(X′_K) = ℤ/3` (one component), `H⁰(X′_{L_1}) = (ℤ/3)²`; the colimit is `(ℤ/3)²`, which is `H⁰(X′_C)` (§2.1) | true | none |
| §3.2, fourth bullet (pattern check) | `X = Spa(K)`, `X′ = ⊔_m Spa(L_m)`, `ℤ_ℓ` | `ℤ_ℓ → ∏_m ℤ_ℓ^{Hom(L_m, C)}` is diagonal: an inverse limit of maps between discrete groups, hence continuous; its image is fixed by `G_K` | true without qc of `X′` | none |

## Checks run

- **Elaboration.** I ran `lake env lean` on `packages/GaloisActionOnEtaleCohomology/Suggested.lean` from the content checkout. The file is unchanged. Exit 0; the only output is `Suggested.lean:119:8: warning: declaration uses 'sorry'`.
- **Signatures.** I copied the file to a scratch file, added `#check @name` for all 3 declarations, and elaborated it once. Exit 0.
  - `SpectralAlgClosure : (K : Type u_1) → [Field K] → Type u_1`.
  - `CompletedAlgClosure` carries `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]`.
  - `exists_galois_continuousAut_equiv` carries the same three binders and the four conjuncts of README §0.2.
  - All three match the README statements. No binder was lost, and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`):

      depcheck: 207 roadmaps, 1919 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation found nowhere, and no Lean name found nowhere. Both suppliers I newly cite in §§2.3–2.4 are already suppliers of this roadmap, so there is no new dependency edge:
  - ClassicalAdicEtaleCohomology §1.3 (a): `R(h ∘ g)_* ≅ Rh_* ∘ Rg_*` on `D⁺`, for arbitrary morphisms of locally strongly sheafy analytic adic spaces, read at its head.
  - SchemeAndStackFoundations §2.2: the relative Leray spectral sequence for a composite, read on main.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- The statement of target `2.3` in `design/plan.json` still reads "base change along g : X′ → X corresponds to g_C^*", with no hypothesis on `X′`. This job may edit only the plan's top-level `gaps` list, so it was left as it is. The README is the roadmap and carries the corrected statement.
- No name that other roadmaps cite changed. No Lean declaration changed. No section, layer or target id was added or removed.
- Ownership: the repair adds no new construction. Ownership against open pull requests was not re-checked beyond `roadmaps resolve` and the overlap file, which lists no other pull request changing this roadmap and no dropped id.
- No source was fetched. The one new locator is `dejongvanderput1996` line 1571, already in the manifest. `needs-references.toml` was not written.
