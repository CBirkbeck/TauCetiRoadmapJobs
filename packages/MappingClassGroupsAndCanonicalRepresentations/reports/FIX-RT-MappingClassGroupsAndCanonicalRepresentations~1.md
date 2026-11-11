# FIX-RT-MappingClassGroupsAndCanonicalRepresentations~1

Repair of red-team round 1 (passes a and b) of `packages/MappingClassGroupsAndCanonicalRepresentations`.
Nineteen findings; three overlapping pairs settled once (1a/F01 = 1b/F02, 1a/F09 = 1b/F03,
1a/F11 = 1b/F07(a)). Files changed: `README.md`, `Suggested.lean`, `sources.toml` (KS16 locator).

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F01, RT-MappingClassGroupsAndCanonicalRepresentations~1b/F02 (P1) — applied

Evidence: GeometricTopology (main) lines 1214–1219, 1244, 1258 (`Mod⁺(T²) = SL₂(ℤ)`, Lickorish for `Mod⁺`). Change: §0.2 "`PMod(g, b, 0)` is §1.7.2's `Mod(Σ_{g,b})`" → "`Mod⁺(Σ_{g,b})`, equal to `Mod` when `b ≥ 1`"; supplier contract and Scope state `Mod⁺` and Lickorish for `Mod⁺`; same pattern repaired in §0.5 (capped-surface generation).

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F02 (P2) — applied

Evidence: LL24 line 2192, BGMW17 line 53, CH19 lines 55, 268. Change: new `rankTwo_mcgFinite_finite_image` (Layer 12 of `Suggested.lean`); README §12.6 gains its algebraic form, locators, *Needs* §0.2, and says BGMW Theorem A and CH Theorem B are part of the target; Summary lists it.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F03 (P3) — applied

Evidence: `rank(A(t) − I)` is `1` for `t ≠ 0`, `0` at `t = 0`; `{I}` is closed. Change: §8.2 Check "a point whose orbit is not closed" → "the common orbit on `t ≠ 0` (of `A(1)`) is not closed, `I` lies in its closure; the argument needs the dense open conjugate to the unitary fibre".

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F04 (P1) — applied

Evidence: trivial `V = V^∨`, closed genus two: `H^{1,0}`, `H^{0,1}` (dim 2) meet in 0; LL24 lines 1044–1060. Change: §5.4 "`H^{i,j}_V = H^{j,i}_{V^∨}`" → antilinear `c_V : H_V → H_{V^∨}` from the Hermitian form, `F̄¹`, pieces `F¹ ∩ W₁`, `F̄¹ ∩ W₁`, `F¹ ∩ F̄¹`, `c_V(H^{i,j}_V) = H^{j,i}_{V^∨}`; witness added as Check.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F05 (P2) — applied

Evidence: `g = 2`, `n = 0`, `φ(a₁) = 1 ∈ ℤ`: `ker φ` free of infinite rank, subspace infinite-dimensional. Change: docstrings of `compactPrymCohomology` and `prymStabilizer` claim the cover interpretation only for finite `H`, surjective `φ`; README §6.1 states the definitions for arbitrary `φ` and adds this witness as a Check. Signatures unchanged.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F06 (P3) — applied

Change: three §6.1 Checks added: `H = 1` gives all of `pureMappingClassAut`; `c_x` lies in the stabilizer with `h = φ(x)`; torus `φ(a, b) = a mod 3` and `−I ∈ SL₂(ℤ)` preserve `ker φ` but need `2 = 1` in `ℤ/3`, excluding the kernel-preserving model. README only.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F07 (P3) — applied

Change: docstring "The group structure of `surfaceGroup g n`, inherited from the presented group." added before the anonymous `Group` instance. No signature change; `inferInstance : Group (surfaceGroup 1 0)` elaborates.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F08 (P2) — applied differently

README part applied: §12.7 now reads "there is `C > 1` such that for every `g ≥ 2` there are `r ≤ C^g` and a semisimple MCG-finite `ρ` with infinite image", citing KS16 Corollary 4.5 (line 552; one prime for all genera, lines 546–550), with `d² ≤ (C₀²)^g` and two Checks. Not added to `Suggested.lean`: it is LL24 Example 10.2.4, a Layer 12 sharpness control, like §§12.1, 12.5, 12.8–12.9.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F09, RT-MappingClassGroupsAndCanonicalRepresentations~1b/F03 (P2) — applied differently

Evidence: LL24 line 1481; `H = ℤ/5` or `C₁₀₀`, `g = 2` escape `#H < g²`. Change: new `putmanWieland_of_irreducible_dim_lt` with 1b's hypothesis `∀ d (σ : Representation ℂ H (Fin d → ℂ)), σ.IsIrreducible → d < g` and `[Finite H]`; 1a's `matrixRepresentation` adapter is unnecessary and not added. README §6.6 gains the algebraic form and two Checks; §6.7, Summary updated.

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F10 (P3) — applied

Evidence: order-3 character, genus 2: kernel cover genus `4`, pullback trivial. Change: §4.3 Check "realization on the cover defined by `ker ρ`" → `ρ = ρ̄ ∘ φ`, `φ` extended to `Φ` on a versal family of `φ`-covers (§IG.5.4), realization `ρ̄ ∘ Φ` on the genus-`g` family; same pattern repaired in Layer 4 Examples (`μ_N`-cover).

## RT-MappingClassGroupsAndCanonicalRepresentations~1a/F11, RT-MappingClassGroupsAndCanonicalRepresentations~1b/F07 (P3) — applied

(a) §5.7 "fibre hypothesis is needed" → Check that `V = π°^*W` meets it and §5.6 excludes sections: image rank `≤ rk W < g ≤ 2g − 2` (`g = 2`, `rk W = 1`: `1 < 2`). (b) §5.5: non-hyperelliptic hypothesis removed; `E = O_C` gives `ρ = g`, `1 ≥ 0`; in rank one `ρ = g − 1 − deg E + h⁰(E) ≥ g − 1`, so the lemma is automatic.

## RT-MappingClassGroupsAndCanonicalRepresentations~1b/F01 (P1) — applied

Evidence: ShimuraData §§3.1–3.3 (its pull-request head), MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3, 5.6 (board, merge order 261). Change: §5.4 defines real VMHS, graded-polarizability and admissibility through those sections with real coefficients (rotation `e^{i}`, trace `2 cos 1 ∉ ℚ`), keeps the real fixed-part theorem as target; new supplier contract, deferral, ownership wording, *Needs*, Layer 5 Dependencies.

## RT-MappingClassGroupsAndCanonicalRepresentations~1b/F04 (P3) — applied

Evidence at the pin: `Transgression.lean` lines 147, 354, 393; `FiveTerm.lean` line 56; `transgression`, `fiveTerm_exact_H1N/H2Q` (lines 702, 779, 823) need compact totally disconnected `G`. Change: *From Tau Ceti* cites `H1ConjInvariants`, `IsTransgressionLift`, `.cocycle`, `.cocycle_sub_mem_B2`; §1.1 targets narrowed to discrete-group lift existence, exactness, comparison, filtration; Layer 1 Dependencies, ownership updated.

## RT-MappingClassGroupsAndCanonicalRepresentations~1b/F05 (P3) — applied

Evidence: `(1, 0, 1)`: `r² = 1 < 2` but `2g − 2 + n = 0`, outside §4.3. Change: §8.3 inserts "for `g < 3` the bound gives `r = 1` and the statement is §3.3, covering the closed torus; for `g ≥ 3` the surface is hyperbolic and" before the versal route; §3.3 added to *Needs*. §§7.7, 9.3 already split.

## RT-MappingClassGroupsAndCanonicalRepresentations~1b/F06 (P3) — applied

Change: §2.2 Check "constant family over a finite set" → "over a point (a connected variety étale over `M_{0,3} = Spec ℂ` is a point); a two-point base is excluded by connectedness".

## RT-MappingClassGroupsAndCanonicalRepresentations~1b/F08 (P3) — applied

Evidence: Dri18 lines 1164–1167 name the category `T_λ(X)`, not "admissible". Change: §5.9a "*admissible*" → "*determinant-finite*" (now citing `T_λ(X₀)`), and every use in §5.9a and §5.10 step 4; "admissible" remains only in the Hodge-theoretic §5.4.

## Checks run

- `lake env lean packages/MappingClassGroupsAndCanonicalRepresentations/Suggested.lean` (from the
  content checkout): no errors; five `declaration uses 'sorry'` warnings, one per theorem
  (`putmanWieland_of_irreducible_dim_lt`, `putmanWieland_of_card_lt`, `mcgFinite_finite_image`,
  `freeGroup_finite_image`, `rankTwo_mcgFinite_finite_image`). No `TauCeti.*` import is used.
- Binder audit: a scratch copy of the file with `#check @name` for all twelve declarations and the
  instance was elaborated once. Elaborated types: `putmanWieland_of_irreducible_dim_lt : ∀ (g n : ℕ)
  {H} [Group H] [Finite H], (∀ d (σ : Representation ℂ H (Fin d → ℂ)), σ.IsIrreducible → d < g) →
  ∀ ϕ, Surjective ϕ → ∀ Γ' ≤ prymStabilizer ϕ, Γ'.relIndex … ≠ 0 → ∀ f, (fixed by Γ') → f = 0`;
  `rankTwo_mcgFinite_finite_image : ∀ (g n : ℕ), 2 ≤ g → ∀ ρ : surfaceGroup g n →* GL (Fin 2) ℂ,
  HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) ρ → (Set.range ρ).Finite`. The other ten
  are unchanged from the signature table. The file has no `variable` block; nothing lost a binder;
  each type matches its README statement (§§6.6, 6.7, 9.3, 9.7, 12.6).
- Dependency check output:

```text
depcheck: 237 roadmaps, 2158 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. New suppliers: ShimuraData (merge order line 117) and
  MixedHodgeModulesAndIrregularHodgeTheory (line 261), both before this roadmap (line 291) and in
  the brief's list of allowed suppliers.
- `roadmaps resolve` on the README: no Lean name found nowhere; one lead,
  "MixedHodgeModulesAndIrregularHodgeTheory §§3.1: no roadmap … on main or in an open pull request".
  It is a board-stage package (`packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`,
  sections 3.1 line 303, 3.3 line 330, 5.6 line 544 of that checkout) in the merge order; the
  resolver does not index board packages. Not a defect.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `rankTwo_mcgFinite_finite_image` | `g = 1, n = 1` (§12.5 `a ↦ diag(λ, λ⁻¹)`, `b ↦ [[0,1],[−1,0]]`); `g = 2, 3, n = 0`; `g = 4`; trivial `ρ`; unipotent `[[1, f],[0, 1]]`, `g = 2` | `bab⁻¹ = a⁻¹`, `b² = −I`, infinite image: excluded by `2 ≤ g`; `r² = 4 ≥ 3, 4`: outside main theorem, covered by BGMW+CH; `4 < 5`: implied by `mcgFinite_finite_image`; image `{1}`; `Sp₄(ℤ)` moves the line of `f`, orbit infinite, hypothesis false | true as stated; `hg` necessary |
| `putmanWieland_of_irreducible_dim_lt` | `g = 0, 1`; `g = 2, H = ℤ/5`; `H = S₃, g = 2, 3`; `H = 1, g = 2, n = 0`; `d = 0` | trivial rep `d = 1 ≥ g`: vacuous; degrees `1 < 2`, `#H = 5 ≥ 4`: new case; degrees `1, 1, 2`: `2 < 2` false, `2 < 3` true; `compactPrymCohomology = H¹(Σ₂)`, dim 4, no `Γ′`-fixed vector; `Fin 0 → ℂ` not irreducible | true; strictly stronger than card form (`d² ≤ #H < g²`) |
| `compactPrymCohomology` docstring | `g = 2, n = 0, φ → ℤ`; `H = 1`; identity cover of `Σ_{0,3}` | `Hom(ker φ, ℂ)` infinite-dimensional; dim 4; open dim 2, compact 0 | identification only for finite surjective `φ` |
| `prymStabilizer` Checks | `H = 1`; `c_x`; torus `φ(a, b) = a mod 3`, `−I` | `h = 1`; `h = φ(x)`; `φ(−a) = 2 ≠ 1` | kernel-preserving model excluded |
| §0.2 `PMod(g, b, 0) = Mod⁺(Σ_{g,b})` | `(1,0,0)`; `(0,2,0)`; `(0,1,0)` | `SL₂(ℤ)` vs `Mod(T²) = GL₂(ℤ)` (swap `det = −1`); `ℤ = ℤ`; `1 = 1` | `Mod⁺` correct; `Mod` only for `b ≥ 1` |
| §1.1 targets after pinned lift | `ℤ/4 ⊃ 2ℤ/4`; `ℤ ⊃ 2ℤ`, `χ(2) = 1 ∈ ℤ/2` | finite discrete: pinned `transgression` applies, `tg ≠ 0`; `ℤ` not compact: pinned theorem does not apply, `ψ(2) = 2ψ(1) = 0 ≠ 1`, no extension, `tg ≠ 0` needed here | discrete-group exactness stays a target |
| §2.2 Check | `(0, 3)`, two-point base | `M_{0,3} = Spec ℂ`; disconnected | point only |
| §4.3 Check | order-3 character, closed genus 2 | `g′ = 1 + 3·1 = 4`, pullback trivial; `ρ̄ ∘ Φ` image `μ₃` | realization ≠ trivializing cover |
| §5.4 real VMHS definition | rotation `e^{i}`; rational quasi-unipotent case | trace `2 cos 1` transcendental (Lindemann), no `ℚ`-structure; reduces to MixedHodge §3.3 | real coefficients needed |
| §5.4 `c_V` and pieces | `V` trivial, closed genus 2; `V` trivial, `n ≥ 2` | `H^{1,0}`, `H^{0,1}` dim 2, intersection 0, `H^{1,1} = 0`; `dim F¹ = g + n − 1`, `dim F¹ ∩ F̄¹ ≥ 2(g+n−1) − (2g+n−1) = n − 1` | antilinear identification; agrees with `W₂/W₁` rank `n − 1` Check |
| §5.5 rank-one Check | `E = O_C`, `D = 0`; `E` nontrivial deg 0; parabolic `deg E ∈ (−n, 0]` | `ρ = g`, `1 ≥ 0`; `ρ = g − 1`, `1 ≥ 1`; `ρ ≥ g − 1` | lemma automatic in rank one |
| §5.7 Check | `g = 2, rk W = 1`; `g = 3, rk W = 2`; `g = 1` | `1 < 2`; `2 < 4`; `W = 0` | consistent with §5.6 |
| §8.2 Check | `A(t) = [[1, t],[0, 1]]` | `rank(A(t) − I) = 1` (`t ≠ 0`), `0` (`t = 0`) | non-closed orbit is the generic one |
| §8.3 case split | `(1,0,1)`; `g = 2`; `g = 3` | `r² = 1 < 2`, §3.3 torus Check; `r² < 3 ⇒ r = 1`; `2g − 2 + n ≥ 4` | torus covered |
| §12.7 quantifiers | rank 0; `d ≤ C₀^g`; `g = 8` | image size 1; `d² ≤ (C₀²)^g`; `r ≥ 3`, `r² ≥ 9 = g + 1` | `C` before `g`; compatible with §§3.3, 9.3, 12.6 |
| determinant-finite rename | §5.10 step 4, adjoint of semisimple `G_{i,λ}` | `G°` semisimple has no nontrivial characters, so constituent determinants have finite order | rename consistent |

## Ownership and overlaps

- Real variations of mixed Hodge structure and the real fixed-part theorem: `roadmaps grep` on
  main and the 440 open heads finds only Completed/HodgeStructures (a prospective milestone list, not
  a target) and a remark in MordellLawrenceVenkatesh; the board package
  MixedHodgeModulesAndIrregularHodgeTheory owns the rational notions and ShimuraData (open new
  roadmap, read at its head through `roadmaps show`) the pure real ones. This roadmap owns only the
  real-coefficient VMHS notions and the real fixed-part theorem, which unitary local systems force.
- Rank-two finiteness and the degree form of Putman–Wieland: no other owner (searched by object:
  Putman–Wieland, Biswas–Gupta–Mj–Whang, finite mapping class orbits; only Putman–Studenmund in
  ArithmeticKTheory and a Church–Farb–Putman reference in MotivicStructuresInModuliOfCurves).
- No fully qualified name of `Suggested.lean` collides with a readable roadmap's declaration.
- The overlap listing reports no open pull request changing this roadmap and no dropped id.

## For the maintainer

- New supplier edges: ShimuraData §§3.1–3.3 and MixedHodgeModulesAndIrregularHodgeTheory §§3.1,
  3.3, 5.6. Both are earlier in the merge order; ShimuraData is still an open new-roadmap pull
  request, MixedHodgeModulesAndIrregularHodgeTheory a board package.
- New Lean names: `putmanWieland_of_irreducible_dim_lt`, `rankTwo_mcgFinite_finite_image`. No
  existing name changed or was removed.
- No suspicious instructions were found in the reviews or fetched texts.
- No source was fetched; every locator added is in an already cached, certified text.
