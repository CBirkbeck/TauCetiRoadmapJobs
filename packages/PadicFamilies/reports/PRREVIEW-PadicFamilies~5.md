# Review of PadicFamilies (pull request #1019 at dd500bf)

**Verdict:** accepted

This is an incremental re-review of the 28 changed lines since `ec14657` (14 insertions, 14 deletions, all in `TauCetiRoadmap/PadicFamilies/README.md`). The change moves the class-set inputs of Layer 5 to new suppliers:

- Before: `QuaternionicModularForms` §§0.3 and 2.1, and through them `AdelicAlgebraicGroups` §5.3.
- After: `GL2AutomorphicRepresentationsAndTransfer` §R17.3.8b and `HilbertModularVarietiesAndShimuraCurves` §R18.5.16b.

The README no longer mentions `QuaternionicModularForms`, which this roadmap must not cite as a supplier. Every new citation resolves at its supplier's head and says what the README attributes to it. The gate passes and the dependency check is clean. This report raises no findings.

## Previous findings

- none: the previous report (`PRREVIEW-PadicFamilies~4`, at `ec14657`) was accepted with no findings, so there is nothing to account for. Its five predecessors' repairs (R01–R05 of `PRREVIEW-PadicFamilies~3`) were recorded as repaired there. R01's passages at README:17, :97, :2682–2769 and :2991 are the ones rewritten here; they are re-checked below.

## Verified sound

### Gate, dependency check, folder

- Gate on this head (`gate … PadicFamilies --base origin/main`): every counter is 0 and the result is `OK`. That includes `readme-ids-missing=0`, `depcheck=0`, `statement-hygiene=0`, `stray-files=0` and `outside-folder=0`. The worker's `gate.md` agrees and also reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PadicFamilies'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. Since `ec14657` only the README changed; `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged.
- Dependency check (`--movable`, content at main `65930ba`):

```text
depcheck: 244 roadmaps, 2475 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. Merge-order positions:

  | Roadmap | Position |
  |---|---|
  | GL2AutomorphicRepresentationsAndTransfer | 94 |
  | HilbertModularVarietiesAndShimuraCurves | 157 |
  | PadicFamilies | 168 |

  Both suppliers come earlier. The pull-request description's *Depends on* list and merge-order chain name both (#931 and #1005).
- Never-cite list: `grep` finds no `QuaternionicModularForms` and no `AdelicAlgebraicGroups` anywhere in the README, `Suggested.lean` or `metadata.toml`. At `ec14657` the README cited `AdelicAlgebraicGroups` twice and `QuaternionicModularForms` throughout §§5.2–5.5. AdelicAlgebraicGroups §5.3 now enters only through GL2AutomorphicRepresentationsAndTransfer §R17.3.8b, which cites it in its own *Needs* line.
- No declared gaps: the README has no `gap:` slug, and there is no readable `design/plan.json`.
- Overlaps: `overlaps.md` lists no open pull request that changes this roadmap, no dropped id, and no id defined only by an open revision. The diff changes no heading, so this pull request drops no id.

### The retargeted citations, resolved at the suppliers' heads

I read the heads through `roadmaps show`. `roadmaps list` gives them as #931 `bf2abc9` and #1005 `8a037af`.

| Claim at this head | Where it resolves | Result |
|---|---|---|
| README:97, :2684, :2686. For every open `U`, compact or not, `Cl(U)` is finite | GL2 README:1908. Compact open levels come from AdelicAlgebraicGroups §5.3, and an open `U` contains the compact open `U∩(𝒪_D⊗𝒪̂_F)^×`, whose class set surjects onto `Cl(U)` | present |
| README:97. `D^×` is embedded diagonally (`quaternionDiagonal`); `M_D(U,A)` (`quaternionLevelForms`) has a right action of a submonoid containing `U` | GL2 README:1897–1906. GL2 `Suggested.lean`:281 `quaternionDiagonal` is `Units.map includeRight`; :287 `quaternionLevelForms` has carrier `φ(γgu)=ρ(u)(φ g)` | present |
| README:97. `M_D(U,A) ≃ ⊕_i A^{Γ_i}` with `Γ_i = U∩x_i⁻¹D^×x_i`. Finite for a noetherian ring and finite `A` (`quaternionLevelForms_finite`); free of rank `h·r` when every `Γ_i` acts trivially | GL2 README:1910–1917. GL2 `Suggested.lean`:303 assumes `IsNoetherianRing R`, `Module.Finite R A` and `IsOpen U` | present; the hypotheses match |
| README:97. Refinement is surjective, representatives can be taken as `x_iu`, restriction is injective, `(tr φ)(g)=Σ_{uU′}φ(gu)|u⁻¹`, and `tr∘res=[U:U′]` | GL2 README:1906 (trace) and :1920–1923 (*Levels*) | present |
| README:97, :2686, :2703. The fibre over `ΓxU` is `Γ_x\U/U′` via `Γ_xuU′↦ΓxuU′` (`exists_equiv_refinementFiber`). It is compatible with change of representative and with composites. For normal `U′` it is `U/U′` modulo `π(Γ_x)`, and the class count is a sum of orbit counts (`card_doubleCoset_eq_sum_card_orbits`) | HMVSC README:2391–2404, items 1, *Representatives*, *Transitivity* and *Normal refinements*. HMVSC `Suggested.lean`:191 has an arbitrary `Γ` and `U′ ≤ U`; :204 assumes `[Finite (Γ\G/U)]` and `[FiniteIndex]` | present; the hypotheses match "when `Γ\G/U` and `[U:U′]` are finite" |
| README:2686. The fibre has "at most `[U_a:U_b]` elements" | HMVSC README:2404, *Exact index*: equality holds exactly when `Γ_x` acts trivially, and otherwise the fibre is smaller | consistent |
| README:97 and §§5.2–5.5. §R18.5.16a items 1–3 give `j_v(𝒪_D⊗𝒪_{F,v}) = M₂(𝒪_{F,v})` | HMVSC README:2354 (an Eichler order is an intersection of two maximal orders, "which may coincide", so a maximal order has level 1), :2358 (item 1) and :2360 (item 3: `j_v` carries `R_v^×` onto `K₀(𝔭_v^{e_v})`, which is `GL₂(O_v)` at `e_v=0`) | present at the new head |
| README:17 and :2991. Scope and dependency sentences: GL2 owns the class set, representatives, refinement maps and level forms; HMVSC owns the fibres | HMVSC README:9 says that GL2 §R17.3.8b owns "the finiteness of the class sets at every open level" and the level forms, and that HMVSC §R18.5.16b owns "the fibres of refinement maps … with the resulting class-number formulas" | consistent with both suppliers' own scope statements |

Ownership: this roadmap owns none of these objects. It consumes each from exactly one owner, and both owners come earlier in the merge order. QuaternionicModularForms §0.3 (#934 `b22ec37`, README:353) also states refinement fibres. That overlap lies between #934 and #1005 and is not created by this roadmap.

### Lean form

- `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean` gives exactly three warnings, `declaration uses sorry`, at lines 57, 93 and 119. It gives no error.
- `#check @` for all six declarations, in one scratch file: the elaborated types are those of `signatures.md`. The file is unchanged, so they also match the previous round. The flagged binders are `HasDerivedCategory` in `CompleteFlatComplex` and `IsLocalRing` in `HasFiniteProjectiveModel`. As recorded before, neither body uses them. The statements agree with §0a.19, §0a.22, §0a.0.2, §0a.17 and §0a.25.
- One-tactic probe on scratch copies of all three theorems:
  - `simp`: "unsolved goals" at probe lines 70, 113 and 140.
  - `rfl`: "The left-hand side" failure at lines 71, 114 and 141.
  - `infer_instance`: "type class instance expected" at lines 71, 114 and 141.

  There is no padding.
- Headlines: §0a.22, §0a.17 and §0a.25 are stated. The module docstring names the arithmetic headlines that are not statable at the pins. The diff touches no headline.

### Seeded sample in the changed passages

The only seeded target that falls in the changed passages is §5.5: its carrier sentence and its dependency line changed. I read Skinner–Wiles through the sources service, from the Numdam open-access scan (`sw`; printed page = PDF page + 3).

| Target | Locator checked | Result |
|---|---|---|
| 5.5 Pontryagin duality for the ordinary quaternionic towers | "§3.2, p. 35 (Numdam PDF page 32)"; sw lines 1038–1089, printed pp. 34–35 | As stated:<br>• `H_∞(U)` is the direct limit of `eH⁰(X(U_a),K/𝒪)` (line 1038).<br>• The pairing is weighted by `c_U(x)⁻¹` and needs `c_U(x)` invertible (1041–1049).<br>• `t` is adjoint to `t⁺`, and the `+` module keeps the underlying module (1050–1059).<br>• The perfect pairing of `T`-modules is at 1062.<br>• The trace `tr(V,U)f(x)=Σf(xu_i)` (1066) is §R17.3.8b's trace for the trivial action.<br>• Trace and pullback are compatible with the pairings, and `c=1` once `a` is large (1070–1075).<br>• `M_∞(U)` is the inverse limit along traces, identified with `Hom(H_∞(U),K/𝒪)` (1076–1086); `M⁺_∞` is identified similarly with the dual of `H⁺_∞` (1087–1089).<br>The theorem is unnumbered running text, so the page locator is correct. Its hypothesis, units at the stabiliser orders, is carried in "Pass to the cofinal levels at which stabilizer orders are units". |

The other seeded targets are 0.2, 0.4, 0.5, 0.6, 0.13, 1.4, 3.0, 3.4a, 3.12, 4.1, 4.4, 4.7, 4.8 and 4.9 (headings at README:700–2607). They lie in unchanged passages. A `grep` of their dependency lines finds no citation of §§5.2–5.5 or of the retargeted supplier sections. The README flags no locator as unverified.

### Adversarial pass

"new" rows are computed for every statement this diff changes. "prev." rows are carried forward, with their values, from `PRREVIEW-PadicFamilies~4` (*Adversarial pass*) for statements this diff leaves untouched. Every other row that report carried is carried again unchanged.

| Statement | Instance | Left / constructed | Right / competing | Result |
|---|---|---|---|---|
| new: README:97, the trace for trivial action is the orbit-weighted sum over the fibre | `G=S₃`, `Γ=U′=⟨(01)⟩`, `U=S₃`. Cosets: `U′`, `(02)U′={(02),(012)}`, `(12)U′={(12),(021)}`. `φ=α` at `[1]`, `φ=β` at `[(02)]` | `(01)(02)=(021)∈(12)U′`, so the orbits have sizes 1 and 2. `Σ_{uU′}φ(u)=α+β+β=α+2β` | fibre `{[1],[(02)]}` weighted by orbit size: `1·α+2·β` | equal. `tr∘res(c)=3c=[U:U′]c` |
| new: README:97, §R18.5.16b count and `tr∘res=[U:U′]` | Hurwitz level `U` in Hamilton's algebra over `ℚ`, `U′` the Eichler level 3 | `[U:U′]=#ℙ¹(𝔽₃)=4`. `Γ₁`, the 24 Hurwitz units, maps isomorphically to `SL₂(𝔽₃)` and acts transitively. One orbit gives `#Cl(U′)=1` | `res(c)=c` and `tr(c)=4c`. The product formula of item 2 would give `4·1=4` classes | the sum formula gives 1, which agrees with HMVSC README:2413. Item 2 is correctly excluded, since `Γ₁` is not in the normal core |
| new: README:97 "split or not": the fibre is finite because `U/U′` is, not because `Γ_x` is | `D=M₂(ℚ)`, `U=GL₂(Ẑ)`, `U′=K₀(2)` at 2 | `Γ₁=GL₂(ℤ)`, which is infinite, surjects onto `GL₂(𝔽₂)≅S₃` | `ℙ¹(𝔽₂)` has 3 points and the action is transitive, so `#Cl(U′)=1` | finite fibre with infinite stabiliser, as stated |
| new: README:97, normal refinement `(U/U′)/π(Γ_x)` | `S₃`, `Γ=⟨(01)⟩`, `U′=A₃` | `π(Γ₁)=U/A₃≅C₂`, so `(U/U′)/π(Γ₁)` is 1 point | directly: `(01)` swaps `A₃` and `(01)A₃`, so `Γ\S₃/A₃` has 1 class | equal |
| new: README:97, "free of rank `h·r` when every `Γ_i` acts trivially" | Hurwitz level, `h=1`. `A=ℤ[ζ₃]` with `a|u=χ(u)a`, where `χ:U→(𝒪_D⊗ℤ₂/π)^×=𝔽₄^×≅μ₃` | `ω=(−1+i+j+k)/2∈Γ₁` has `N(ω−1)=3`, a unit at 2, so `χ(ω)≠1` and `A^{Γ₁}=0` | `h·r=1·2=2` | rank 0 ≠ 2. The trivial-action hypothesis is needed and is present |
| new: README:97, the trace `(tr φ)(g)=Σφ(gu)|u⁻¹` lands in `M_D(U,A)` (right action) | any `w∈U`, substituting `v=wu` | `(tr φ)(gw)=Σ_vφ(gv)|v⁻¹w` | `((tr φ)(g))|w=Σ_vφ(gv)|v⁻¹|w` | equal. The coset choice is immaterial: `φ(guu′)|(uu′)⁻¹=φ(gu)|u⁻¹`. For trivial action this is the SW trace (sw line 1066) |
| new: §5.5, pullback is adjoint to trace for the `c⁻¹`-weighted pairings | `S₃` instance above, `V=U′`, `f≡1`, `h=(α,β)`. `c_U(1)=2`, `c_V([1])=2`, `c_V([(02)])=#(⟨(01)⟩∩⟨(12)⟩)=1` | `⟨res f,h⟩_V=α/2+β` | `⟨f,tr h⟩_U=(α+2β)/2=α/2+β` | equal. Orbit size = `c_U/c_V` (2/2 and 2/1), as the compatibility diagram at sw lines 1070–1074 requires |
| new: §5.2, fibre bound under the new citation (*Exact index*) | `F=ℚ(√5)`, icosian maximal order, `U=GL₂(Ô_F)`, `U_1=U∩U(3)` (values of the previous report) | the image `H` of `𝒪_D^×` has order 480 and acts nontrivially on `U/U_1` | `#X(U_1)=5760/480=12 < 5760=[U:U_1]` | strict, as *Exact index* predicts for a nontrivial action |
| new: §§5.2–5.5 carrier, §R18.5.16a items 1–3 at `8a037af` | `F=ℚ(√5)` versus `F=ℚ`, `D` ramified only at infinity | `{∞₁,∞₂}` is even, so `D` exists. Maximal means level 1, `e_v=0`, `j_v(R_v)=O₀(𝔭⁰)=M₂(O_v)` and `j_v(R_v^×)=GL₂(O_v)` | over `ℚ`, `{∞}` is odd, so there is no such `D` | the even-degree hypothesis is present at README:2682, :2717, :2743 and :2761 |
| new: README:17, :97, "finite at every open `U`, compact or not" | Hamilton's algebra: `U=D_f^×` versus `U={1}` | 1 class | `D^×\D_f^×` is uncountable modulo a countable group, so infinite | openness is the right hypothesis (GL2 README:1908) |
| prev.: §5.6 freeness on `D^×\D_f^×` by right multiplication | icosian `U` versus `V=U∩U(7)` | at `U` the stabiliser has order 60, so the action is not free | at `V` it is free, `#X(V)=5880` | Retain |
| prev.: §4.4 `H¹` versus the classical Selmer kernel | `F=ℚ`, `T=𝔽_p` trivial | `J=k`, `dim J=1` | the strict kernel misses `J` | Retain |
| prev.: Lean §0a.17 `perfect_complex_ordinary_projector` | `C=ℤ₅²[0]`, `U=(1 1; 0 5)` | `U^{n!}→(1,−1/4;0,0)=e` | `π≫ι=e.asHom`, `ι≫π=1` | Retain |
| prev.: §0a.19 local finiteness | `M=𝔽₂[X]`, `T=×X` versus `T=1` | the orbit is not finitely generated | `T=1` spans `{1}` | Retain |
| prev.: §0a.22 locally finite projector | `Teᵢ=3ⁱeᵢ` on completed `⊕ℤ₃eᵢ` | `T^{n!}e₀=e₀` | no `N` with `T^{N!}=e` | Retain the pointwise limit |
| prev.: §0a.25 derived independence | `C₁=ℤ₃[0]⊕(ℤ₃ −1→ ℤ₃)` | `e₁=(1,0)`, `D₁=ℤ₃[0]` | `Q(ι₀)αQ(π₁)=id` | Retain |
| prev.: 0.15 components | `Λ×Λ` | `(1,0)`, `(0,1)` | product 0, sum 1 | Retain |
| prev.: 1.4 trivialisations | `θ′=2θ` over `ℤ₅` | basis `e/2` | measure `×2` | Retain the opposite rules |
| prev.: 1.7 congruence module | `a≡b mod pⁿ` | `Ψ=ℤ/pⁿ` | IKM `Ψ=0` | Retain |
| prev.: 2.7a cuspidal comparison | `full=M⊕boundary` | `M` | `M` | Retain |
| prev.: 3.6 `Θ_k` | `k=1` | `Θ_1(δ₀)(z²)=2` | the `k`-th derivative gives dimension 1 | Retain |
| prev.: 4.5 Euler system | `C₂`, `a=1`, `b=0` | `P(σ)=((1,−1),(−1,1))` | the scalar replacement fails | Retain |
| prev.: 4.8 divisibility | `v=2`, `k=3` | defect 6 | the bound `n` is false | Retain |
| prev.: 5.2 projector level | `a≥1` versus `a=0` | `(N𝔭)^{n!}→0` | `N𝔭+1` is a unit | Retain |
| prev.: 5.8 control | `Sym¹`, `diag(1,5)` | kernel `5ⁿY≠0` | zero mod `5^m` | Retain |
| prev.: 5.9 density | `ζ_{pⁿ}−1`; `ε²=0` | infinitely many kernels | `ε` invisible | Retain |

The S₃, Hurwitz and `M₂(ℚ)` instances agree with the Checks of the sections now cited (HMVSC README:2410–2413) and with GL2 README:1945–1949.

## Not verifiable

- The seeded targets in unchanged passages are 0.2, 0.4, 0.5, 0.6, 0.13, 1.4, 3.0, 3.4a, 3.12, 4.1, 4.4, 4.7, 4.8 and 4.9. This incremental round did not re-read their sources, because neither their text nor any passage they cite changed since `ec14657`.
- The *Not verifiable* items of the earlier reports still stand: Dasgupta–Darmon–Pollack Definition 3.1 and Proposition 3.2; Bellaïche's 2011 author version; Diamond; Wiles 1995; the Hida primaries; Kisin Proposition 8.7; and Coleman–Mazur.
- The Numdam OCR of Skinner–Wiles drops the `+` superscripts on pp. 34–35 (sw lines 1076, 1087). Which of `M_∞` and `M⁺_∞` carries `+` is fixed here by the adjointness `⟨tf,h⟩=⟨f,t⁺h⟩` (line 1053) rather than read from the scan. That adjointness gives `Hom(H⁰(K/𝒪),K/𝒪) ≅ H⁰(𝒪)⁺` as `T`-modules, which matches §5.5.

## Source issues

- none
