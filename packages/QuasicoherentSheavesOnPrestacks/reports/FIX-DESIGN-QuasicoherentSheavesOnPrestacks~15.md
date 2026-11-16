# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~15

Repair of the five findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~14` (all P3). Files changed: `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`, `packages/QuasicoherentSheavesOnPrestacks/sources.toml`. The design has no `Suggested.lean`, so there was nothing to elaborate or `#check`.

## F01 (P3) — applied differently

Verified: 7.1, 7.4(d) and 8.4 use affine diagonals, and nothing proved that affineness is fpqc-local on the target.

- 4.1 gains the API bullet "Affineness is local on the target" (fpqc sheaves, and in the classical context fppf sheaves and covers), its consequence for maps of sheaves along an fpqc surjection, and the route. The route is: `R′ = ∏R_i`; the base changes are `Spec B_•`; `B = lim B_•`; 3.2 gives `B ⊗_R R′_n ≃ B_n`; and Y and `Spec B` are colimits of the same Čech nerve. Locator: Stacks, Descent, Lemma 35.37.1, tag 0245. *Needs* gains 1.1, 1.3, 2.5, 3.1, 3.2, 3.3 and InfinityTopoi §§7.1.1, 7.5.1, 9.2.3.
- 7.1: the bullet is reordered so that surjectivity of the atlas comes first. Then comes the affine diagonal: `X × X → [X/G]²` is an fpqc surjection, the base change of the diagonal along it is `G ×_S X → X × X`, and 4.1 applies. Affineness of the atlas follows.
- 7.4(a)'s route gains the proof that `[X/G]^♮` has affine diagonal for X affine. It uses §1.18 `Stack.stackification_locally_essSurj` and 4.1 in its fppf form.
- 8.4: `BGL_n` has affine diagonal (7.4), and its `QCoh` is that of the geometric `[Spec k/GL_n]` (7.4(a), 3.3(a), 7.2, 6.1), whose t-structure is complete (6.2(b)). *Needs* gains 3.3, 6.1, 7.1 and 7.2.
- `plan.json` mirrors all of this: 4.1 gets prerequisites, an API entry, a test and a locator; 7.1 gets an API entry and a test; 7.4 gets its statement, an API entry and §1.18; 8.4 gets prerequisites and an API entry.

**Why "differently".** The proposed 4.1 Check, the constant `B(ℤ/2)`, does not test the sheaf hypothesis of the lemma. Its fibre `Spec R ⊔ Spec R` stays non-affine after every base change along an fpqc cover (`Spec R_i ⊔ Spec R_i`), so the lemma's hypothesis never holds there. What that example shows is that the realization lacks an affine diagonal and `[X/G]` has one, so it went into 7.1 as a Check: 2 points against `2² = 4`, and after L the fibre is `Spec(R × R)`.

For 4.1 I added a real negative control instead. Take the sieve Y of `{ℤ → ℤ[1/2], ℤ → ℤ[1/3]}`. Its base changes are the affines `Spec ℤ[1/2]` and `Spec ℤ[1/3]`. But `Y(ℤ[1/2] × ℤ[1/3]) = ∅`, whereas an affine would give a point, so Y is not affine.

I also stated the lemma for fpqc sheaves rather than hypercomplete ones (the route never uses hypercompleteness). The Conventions universe list and the InfinityTopoi supplier bullets now name 2.5 and 4.1 as users, and the fppf ∞-topos is listed among the universes. The Layer 4 table row and the Layer 4 and 7 *Dependencies* were updated.

## F02 (P3) — applied

Verified: §1.18's `Stack.stackification` is a 2-categorical left adjoint on pseudofunctors on all schemes (SchemeAndStackFoundations README line 3557–3567), whereas `L_fppf` is on functors `CRing → Ŝ`.

Old: "both are left adjoint … truncation". New: `L_fppf(F^♮) → (stackification F)^♮` is an equivalence, shown in three steps:

- its target is an fppf sheaf (`Stack.isStack_stackification` on the covers of rings);
- it is a monomorphism (`Stack.stackification_isom_sheafify`, `L_fppf` left exact, universal colimits);
- it is an effective epimorphism (`Stack.stackification_locally_essSurj`, InfinityTopoi §9.2.3), hence an equivalence (§7.3.4).

All three §1.18 names exist on main. *Needs* and the Layer 2 *Dependencies* gain InfinityTopoi §§3.3.2, 7.3.4 and 9.2.3; the plan's 2.5 is updated to match.

## F03 (P3) — applied

Verified: the supplier states `tot_filteredColimit_of_bounded` for `π_i = 0` with `i > b` (EnhancedDerivedSheaves README line 1980). README line 123 called this "bounded-below", the opposite of line 276's sense.

- Conventions, Indexing: now defines "bounded below" (`π_m = 0` for `m ≪ 0`), `QCoh(X)^+` and `D^±(𝒜)` (cohomological). The witnesses are `∏ℤ[−i]` and `⊕ℤ[i]`. One departure from the suggested text: `QCoh(X)^+` is the union of the t-structure's `QCoh(X)_{≤n}`, not "objects with `π_m = 0`", because coconnectivity is not pointwise (6.2 Check).
- Line 123: now says `π_i = 0` for `i > b`.
- Line 276: now says `π_m M = 0` for `m ≪ 0`.
- 7.4 Examples: now reads "`QCoh(BG_m)^+` is `D⁺` of graded abelian groups".

The same pattern also occurred at line 115 (`hypercoverDescent_boundedBelow`, which is `D⁺`) and in the plan's 1.4 statement; both are reworded.

## F04 (P3) — applied

Verified against the sources:

- HNR line 45–47 and 55: Theorem 1.1 (pp. 1–2) is about poorly stabilized stacks.
- HNR line 436 (§4, p. 9) defines "poorly stabilized" as reduced identity component not semi-abelian, which excludes `ℤ/p`.
- HR-perf lines 28–29: on a non-tame stack the structure sheaf is perfect and not compact.

8.5's parenthesis is replaced accordingly. A new Check says `k[Γ]` is a compact generator; I recomputed its values (`π₀ Map(k[Γ], ⊕O[i]) = k = ⊕` against `∏𝔽_p`). The plan's 8.5 locator and a test were updated, and so were the HNR locators in the manifest.

## F05 (P3) — applied

Verified: `eilenbergMacLane`, `moduleSpectra_equiv_derived` and `spectra-comparison` occurred only on line 122, and the plan's EnhancedDerivedSheaves sections never listed E5:spectra-comparison. The bullet is deleted; the neighbouring `enhancement_compatibility` bullet stays.

## Checks run

Dependency check (after the final edit):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2244 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

Citation resolver (`roadmaps resolve`) on the edited README: no cross-roadmap citation found nowhere, and no Lean name found nowhere. The new §1.18 names were also read on main.

`plan.json` parses, and `sources.toml` parses as TOML.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 4.1 locality of affineness | empty cover of `R = 0`; identity cover; `BG_m` diagonal over `(L₁, L₂)`; non-flat `O(G) = ℤ × 𝔽_ℓ` | Y over `Spec 0` is `Spec 0` (value at 0 is the empty product); `Isom(L₁,L₂) = Spec ⊕_n M^{⊗n}`, `M = L₂ ⊗ L₁⁻¹`; fibre `Spec(R × R/ℓ)`, no flatness used | holds |
| 4.1 negative control (sieve) | `Y(ℤ[1/2])`, `Y(ℤ[1/3])`, `Y(ℤ[1/2] × ℤ[1/3])` | point, point, ∅ (2 and 3 are not units of the product), against the point an affine would give; `L Y = Spec ℤ` | the sheaf hypothesis is needed |
| 4.1 route, descent step | CRing, AnRing, `CAlg^cn` | limit of discrete `B_n` = equalizer (π₀ of the totalization); pushout along flat `R → R′_n` is ordinary = derived (1.1) | holds in all three contexts |
| 7.1 affine diagonal | `G = 1`; `G = G_m`, `X = S = Spec ℤ`; translation `X = G` | diagonal of `Spec ℤ`; Isom of line bundles affine; `[G/G] = S` | holds |
| 7.1 Check `B(ℤ/2)` | realization vs `L` | 2 points against `2² = 4`; after L, `Spec(R × R)`, with `LΓ = Spec(ℤ × ℤ)` | realization not affine-diagonal; quotient is |
| 7.4 affine diagonal for X affine | `G = 1`; `X = Spec k`, `G = GL_n` | diagonal of affine `h_X` is a closed immersion; `Isom(E₁, E₂)` affine | holds |
| 8.4 `BGL_n` | `n = 1` over ℚ | `[Spec ℚ/G_m]` geometric (7.1: affine, flat); heart graded ℚ-vector spaces; complete t-structure | holds |
| 2.5 stackification | `G = ℤ/2` over ℝ; constant prestack BΓ at `ℝ × ℝ` | `Spec ℂ` reached after the fppf cover `ℝ → ℂ`; 2 components; Isom sheafified gives `Γ² = (ℤ/2)²` | holds |
| Conventions `+`/bounded below | `∏_{i≥0} ℤ[−i]`; `⊕_{i≥0} ℤ[i]` | 0-truncated, `π_{−i} = ℤ` for all `i ≥ 0`; connective, `π_i = ℤ` for all `i ≥ 0` | the two notions separate |
| 8.5 Check `k[Γ]` | `Γ = ℤ/p`, `k = 𝔽_p`; Γ trivial | `π₀ Map(k[Γ], ⊕O[i]) = k = k ⊕ 0 ⊕ ⋯`; `π₀ Map(O, ⊕O[i]) = ∏𝔽_p ≠ ⊕𝔽_p`; for trivial Γ, `k[Γ] = O`, compact | holds; consistent with 8.5's trivial-group Check |

## Ownership, suppliers, sources

- **Locality of affineness (4.1).** I searched by object on main and at the open heads, using `roadmaps grep` for "local on the target/base", "descent of affine morphisms" and tag 0245.
  - The scheme-level effective fpqc descent of affine schemes is owned by ModularCurves Layer 0E (SchemeAndStackFoundations README line 265 defers to it). It is also cited as Stacks 0245 by AdelicAlgebraicGroups and EtaleCohomologyFoundations.
  - No roadmap states it for space-valued sheaves on test rings in the animated or `E∞` contexts. This roadmap derives it from its own 3.2, so this roadmap owns it.
  - Ownership against open pull requests was checked only through the tools' index (450 heads).
- **New source locator.** Stacks, Descent, Lemma 35.37.1, tag 0245 (Stacks Descent chapter, read through the sources service; text lines 4176–4192, p. 89). It is recorded in the existing `Stacks` key: locator added, `cited_for` gains "4.1". The `version_note` already records the Descent chapter.
- **HNR.** The `HNR` locator now reads "Theorem 1.1 (pp. 1-2); Section 4 (poorly stabilized stacks, p. 9); Theorem C.1".
- **References file.** No reference request was written.

## For the maintainer

- No name that other roadmaps cite was renamed or removed. No section, layer or target id changed.
- The README now cites three more SchemeAndStackFoundations §1.18 declarations, all present on main: `Stack.isStack_stackification`, `Stack.stackification_isom_sheafify` and `Stack.stackification_locally_essSurj`.
- The deleted E5:spectra-comparison bullet removes no dependency edge: the section was never in the plan's supplier list.
