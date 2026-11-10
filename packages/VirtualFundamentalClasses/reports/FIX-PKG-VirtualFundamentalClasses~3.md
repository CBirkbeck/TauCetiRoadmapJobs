# Repair of VirtualFundamentalClasses (package), round 3

Findings of `reports/REV-PKG-VirtualFundamentalClasses~2.md` (one review, ids R01–R10). Each was
checked against the cached sources, the pinned Mathlib and Tau Ceti, and the supplier roadmaps on
main. All ten are correct. Files changed: `packages/VirtualFundamentalClasses/README.md`,
`Suggested.lean` (module docstring only) and `sources.toml` (one locator). `metadata.toml` and
`design/plan.json` are unchanged: no supplier gap was needed, and the new supplier,
EllipticCohomology, is on main.

## R01 (P1) — applied differently

§7.1: "Proposition 1.4 for algebraic `X`-spaces: `C` is an `E`-cone iff `D` is a cone" → a recognition
theorem for flat equivariant maps of affine `X`-schemes. It assumes that `E = C ×_{D,0} X` is a vector
bundle with scalar action and proves `C ≅ D ×_X E` locally. New Check: the weight-two line. §7.2:
a cone stack is now locally `[C/E]`, with `C` an `E`-cone. New Check: `B𝔾_a` with weight two.

Why "differently": the suggested repair supplies the local identifications `C ≅ E × D` as a
hypothesis. That would make the descent nearly tautological. The linearity of `E` alone is enough
for affine `C`, `D`, by graded Nakayama and flatness (the route is now in the README). The pattern
recurs in §7.2: BF derive `𝒞 ≅ [C/E]` from Prop. 1.4 (lines 459–461). That derivation fails for
`B𝔾_a` with `λ` acting by `λ²`: the zero cone gives a smooth, surjective, equivariant
presentation, but the vertex automorphisms have weight 2.

## R02 (P1) — applied

§7.3: "étale-locally `E` has a resolution by free modules" → truncate first. On an affine étale
`U = Spec A`, `τ^{≥−1}E` has coherent cohomology in degrees `−1, 0`. It is a complex of
`A`-modules (SchemeAndStackFoundations §§2.6, 2.10, `DQCoh.affineEquiv` of §2.18) and has a finite
free resolution `L^•`. New Check: `(j_!O_{D(t)})[2]` on `𝔸¹_ℚ`, where `h^{−2}` is not
quasi-coherent and the truncation is `0`.

## R03 (P1) — applied

§9.3, route (4) ⇒ (3): "`τ_{[0,1]}((J[1])^∨) = J^∨[−1]`" → `H⁰(J^∨)[−1]`, represented by `C(J)`. The
step now uses an explicit local comparison: locally `[F^{−1} → F^0]` with `F^0` free; Lemma 1.6 gives
`coker(Hom(F^0,J) → Hom(F^{−1},J)) = Ext¹(Lg^*E, J)`; quasi-coherent `ℰxt` on the affine `T` gives
the global statement. New controls: `J = A/(t)` (`H² = O/(t)` versus `0`) and `J = O`.

## R04 (P1) — applied

`Chow.equivIntOfUnique` → `Chow.ChowGroup.equivIntOfUnique` (two places); `Chow.pushforward` →
`Chow.ChowGroup.pushforward`; `CartierDivisor` → `Scheme.CartierDivisor`. The three nonexistent
names `gysin_open_independent_double_cover`, `test_pn_ring` and `test_BG_representations` became
prose references to the Checks of SchemeAndStackFoundations §§5.5, 5.6 and 1.22. The same pattern
also covered Mathlib's `AlgebraicCycle` and `AlgebraicCycle.map` → `AlgebraicGeometry.…` (five
places), and `Stacks.StackInGroupoids` → `StackInGroupoids`, which is how §1.18 writes it.

## R05 (P1) — applied

§10.4: "`Ob` locally free of rank `s = dim M − vd`, `[M,E]^vir = c_s(Ob) ∩ [M]`" → with `M_d` the
open and closed part of relative dimension `d`, `s_d = d − r = dim M_d − vd` and
`[M,E]^vir = Σ_d c_{s_d}(Ob|_{M_d}) ∩ [M_d]`. New Check: `Spec k ⊔ ℙ¹` gives `(1, −1)`, not
`(0, −1)`. `Suggested.lean`, item 7, now gives the componentwise top Chern class.

## R06 (P2) — applied

§10.6: "`u^*E` … is a perfect obstruction theory … with a global resolution" → `Lu^*E` is a
perfect obstruction theory of rank `r`, and a global resolution `F^•` of `E` pulls back to `u^*F^•`.
No resolution is claimed otherwise. Layer 10 now opens with a standing hypothesis: every statement
about a virtual class assumes a global resolution. New `v = id` Check. `Suggested.lean`, item 7:
"for perfect obstruction theories with global resolutions".

## R07 (P3) — applied

§5.1 and References: "stacks-chow Lemma 32.2, tag 0B74, line 2769" → "Lemma 36.3, tag 02TY, p. 72,
line 3445", which covers rank `r`. `sources.toml` locator `Lemma 32.2 (0B74)` → `Lemma 36.3 (02TY)`
under the existing key. Lemma 32.2 was used nowhere else.

## R08 (P2) — applied

Convention 7 now separates `Lu^*` (derived) from `u^*` (sheaf, `u^*F = h^0(Lu^*F)`), with the
dual-numbers witness. §8.3 uses `Lu^*τ^{≥−1}L` throughout, while the transitivity sequence and
`h^0(c)` keep the sheaf `u^*Ω`. New Check: `Spec k → Spec k[ε]/(ε²)` gives `k → 0 → k → k → 0 → 0 → 0`.
The same notation was carried to §§9.1, 9.3, 10.6, 10.7, 11.3 and 11.4.

## R09 (P3) — applied

§8.3: "although behrend-fantechi1997 asserts one for local complete intersections (lines 1045–1046)"
→ BF Proposition 3.14 (lines 1045–1047) uses the distinguished triangle of the full cotangent
complexes (its `L_X` is the full complex, lines 899–901). That triangle cannot be replaced term by
term by the truncations. No erratum was added. The `(xy, xz, yz)` counterexample is kept.

## R10 (P2) — applied

Scope now has a bullet on EllipticCohomology Layer 1 (E1), which owns the small étale sites of
`M_{1,1}` and `M̄_{1,1}`. There is a new contract "From TauCetiRoadmap.EllipticCohomology". §7.3
proves that its site restricts to E1's on these stacks, and *Needs* and Layer 7's Dependencies cite
E1. New Check: `(id_U, id)` and `(id_U, [−1])` are distinct endomorphisms, which the `j`-line
identifies.

## Checks run

- `lake env lean packages/VirtualFundamentalClasses/Suggested.lean`, run from the content checkout:
  exit 0, no output, no errors or warnings. The file has no `TauCeti.*` import, so no build was
  needed. It still declares nothing, because no headline is statable at the pins (there is no
  algebraic or DM stack carrier). Only the docstring changed, in item 7. The `#check @name` binder
  comparison therefore covers zero declarations, and no binder changed.
- A separate scratch `#check` file covered the pinned names the README cites. It elaborated
  `Chow.cyclesOfDimension`, `Chow.RatEquiv`, `Chow.ChowGroup` (with `[IsLocallyNoetherian X]`),
  `Chow.cycleClass`, `Chow.ChowGroup.equivIntOfUnique`, `AlgebraicCycle.div`, `gradedRelativeSpec`,
  `relativeSpecBaseChangeIso`, `relativeSpecHomIso`, `CommMon.relativeSpecHomEquiv`, `linearSpec`,
  `totalSpace`, `totalSpaceHomEquiv`, `totalSpaceSchemeBaseChangeIso`,
  `Scheme.Modules.isFiniteLocallyFree`, `FiniteLocallyFreeSheaf.rank`/`.isConstantRank`,
  `Scheme.bigStructureSheaf`, `Spaces.IsAlgebraicSpace`, `LineBundleClass` and
  `Scheme.CartierDivisor` (with `[IsIntegral X]`), plus every Mathlib name in the contracts.
  Unqualified `AlgebraicCycle`/`AlgebraicCycle.map` failed, so they are now qualified. Four
  modules are unbuilt at the pin, so these names were read in the source instead:
  `Chow/ClosedImmersion.lean:206–211` (`ChowGroup.pushforward`),
  `LinearScheme/BaseChange.lean:40,52,99`, `Curves/Prestable.lean:45` and `Stack/Basic.lean:37`.
- Dependency check, exact output:

  ```text
  depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The new edge goes to EllipticCohomology, which is on main and
  sixth in ORDER.txt.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name was found nowhere.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| 7.1 recognition (affine, flat, `E` linear) | weight-two `𝔸¹` over a point; `𝔸²→𝔸¹` with weights (1,1); `D = Spec k[w]` with `deg w = 2`, `C = D×𝔸¹`; `deg t = p`, `t ↦ s^p`; `E = 0` | `S_1 = 0`, `S_2 = k` (not a cone, hypothesis fails); `S = S'⊗k[u]` (cone, split); `D` and `C` both not cones (iff holds); fibre `k[s]/(s^p)` is not a vector bundle (hypothesis fails, iff would fail); `S ≅ S'` | Linearity hypothesis added; proof by graded Nakayama, `K_n = Σ S'_j K_{n−j} = 0` |
| 7.1 "only flat used" | flat with `E` linear | `C ≅ D × E` forces `φ` smooth | Statement says "flat (for instance smooth)" |
| 7.2 local presentation `[C/E]` | `BE = [X/E]`; `[C(E^{−1})/C(E^0)]`; `B𝔾_a` with weight 2; `E = 0` | zero cone is an `E`-cone; abelian cone is invariant; `aλ = aλ²` ⇒ `a = 0`; `[C/0] = C` | Definition changed; negative Check added |
| 7.3 truncate-then-resolve | `O[2]`; `j_!O[2]` on `𝔸¹_ℚ`; `O[1]`; `k[0]` on `k[ε]` | `τ = 0`; stalks `0` vs `k(t)^sep`, `τ = 0`; `[O → 0]`; `[k --ε--> A]` with `h^{−1} = 0`, `h^0 = k` | Route repaired; Check added |
| 9.3 `(J[1])^∨` | `J = A/(t)`; `J = O`; `J = 0` | `H²(J^∨[−1]) = O/t`, value `k` on `T`, vs `0` after truncation; `O[−1]` on both sides; `Ext¹ = 0`, extension exists | Identification corrected; two controls added |
| 9.3 local `Ext¹` | `F^0` free on affine `U`, `J` quasi-coherent | `Ext¹(F^0,J) = 0` ⇒ `Ext¹(K,J) = coker(∘d)`; `Ext⁰ = Hom(coker d, J)` | Explicit comparison and local-to-global step |
| 9.3 existing char-2 Check | `A = k[x]/x²`, `φ = (0, id)` | `a = h^♯∘φ^{−1} = 0`, but no lift `(x+ax²)² = x²` | Consistent with new route |
| 10.4 componentwise top class | `pt ⊔ ℙ¹`, `r = 0`; `ℙ¹` with `O(a)`; `Spec k` with `[O^s→0]`; `ℙ¹ ⊔ ℙ¹`; `M = ∅`; `Spec k → B𝔾_m` | `(1,−1)` vs `(0,−1)` for fixed `s = 1`; `−a`; `s_0 = s`, degrees `1,0,0`; `s_1 = 1`; `0`; `dim M_1 = −1+1 = 0` | Formula componentwise; Check added |
| 10.6 pulled-back theory | `v = id`; `h^{−1}`, `h^0` of `Lu^*E → Lu^*τL → τL'` | same `F^•`, identity on class; `cone(φ) ∈ D^{≤−2}` ⇒ surjective / iso | Existence of a resolution no longer claimed |
| Layer 10 standing hypothesis | 10.4 with `Ob = 0`; 10.8; 11.5 | `E ≅ Ω[0]` has `[0→Ω]`; already assumed; supplied | Consistent |
| Convention 7 `Lu^*` / `u^*` | `k⊗^L_{k[ε]}k`; `u = id`; flat `u` | `h^{−n} = k` for all `n ≥ 0`, vs `k`; equal; termwise | Convention added |
| 8.3 transitivity Check (non-flat) | `Spec k → Spec k[ε]/ε²`, char ≠ 2; char 2 | `k→0→k→k→0→0→0`, `∂(ε) = dε` iso; in char 2 `Ω` is free and `Lu^*Ω = k` (no defect) | Check scoped to char ≠ 2 |
| 5.1 locator | `r = 2` over a point; `r = 0` | `ℤ = A_0(pt) → A_2(𝔸²) = ℤ`, `1 ↦ [𝔸²]`; identity | 36.3 instantiates; 32.2 cannot |
| 7.3 elliptic comparison | `M_{1,1}/ℚ`, `[−1]`; `j`-line | 2 distinct arrows vs 1 | Check added |

## Ownership, overlaps and suppliers

- The only new supplier is EllipticCohomology Layer 1 (E1), which is on main. This roadmap keeps
  the general small étale site of a DM stack and states agreement with E1 on the elliptic stacks.
- No new object was taken on. The cone-stack definition and the recognition theorem were already
  owned here (Layer 7); they were corrected, not added. `roadmaps grep 'cone stack'` finds only the
  open VirtualFundamentalClass roadmap, which also defines cone stacks as local quotients `[C/E]`.
  The ownership choice between it and this roadmap is the human decision recorded in round 2. It is
  not re-raised here.
- No section, layer or target id changed. Other roadmaps' citations of this roadmap are unaffected,
  and no Lean name changed.

## For the maintainer

- `behrend-fantechi1997` Proposition 1.4 (line 323) is false as printed. The remark after its
  Definition 1.8 (lines 459–461), which derives `𝒞 ≅ [C/E]` from it, inherits the error; the
  weight-two witnesses are in §§7.1–7.2. Any roadmap that restates BF Definition 1.8 literally, a
  smooth surjective equivariant map from a cone, admits `B𝔾_a` with the weight-two action.
- No source request was needed: every locator is in a cached text or a settled uncertified key.
